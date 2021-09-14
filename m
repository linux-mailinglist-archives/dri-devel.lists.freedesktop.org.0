Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF6840B730
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422E46E563;
	Tue, 14 Sep 2021 18:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35866E560
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:50:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="222142798"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="222142798"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:50:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544237888"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:50:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/15] drm/edid: Break out reading block 0 of the EDID
In-Reply-To: <20210909135838.v4.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
Date: Tue, 14 Sep 2021 21:50:15 +0300
Message-ID: <878rzz0z6g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> A future change wants to be able to read just block 0 of the EDID, so
> break it out of drm_do_get_edid() into a sub-function.
>
> This is intended to be a no-op change--just code movement.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>
> Changes in v4:
> - "u8 *edid" => "void *edid" to avoid cast.
> - Don't put kmalloc() in the "if" test even if the old code did.
> - drm_do_get_edid_blk0() => drm_do_get_edid_base_block()
>
>  drivers/gpu/drm/drm_edid.c | 63 +++++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 6325877c5fd6..520fe1391769 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1905,6 +1905,44 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_add_override_edid_modes);
>  
> +static struct edid *drm_do_get_edid_base_block(
> +	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> +			      size_t len),
> +	void *data, bool *edid_corrupt, int *null_edid_counter)
> +{
> +	int i;
> +	void *edid;
> +
> +	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	if (edid == NULL)
> +		return NULL;
> +
> +	/* base block fetch */
> +	for (i = 0; i < 4; i++) {
> +		if (get_edid_block(data, edid, 0, EDID_LENGTH))
> +			goto out;
> +		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
> +			break;
> +		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> +			if (null_edid_counter)
> +				(*null_edid_counter)++;
> +			goto carp;
> +		}
> +	}
> +	if (i == 4)
> +		goto carp;
> +
> +	return edid;
> +
> +carp:
> +	kfree(edid);
> +	return ERR_PTR(-EINVAL);
> +
> +out:
> +	kfree(edid);
> +	return NULL;
> +}
> +
>  /**
>   * drm_do_get_edid - get EDID data using a custom EDID block read function
>   * @connector: connector we're probing
> @@ -1938,25 +1976,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	if (override)
>  		return override;
>  
> -	if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> +	edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> +						&connector->edid_corrupt,
> +						&connector->null_edid_counter);
> +	if (IS_ERR_OR_NULL(edid)) {
> +		if (IS_ERR(edid))
> +			connector_bad_edid(connector, edid, 1);
>  		return NULL;
> -
> -	/* base block fetch */
> -	for (i = 0; i < 4; i++) {
> -		if (get_edid_block(data, edid, 0, EDID_LENGTH))
> -			goto out;
> -		if (drm_edid_block_valid(edid, 0, false,
> -					 &connector->edid_corrupt))
> -			break;
> -		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
> -			connector->null_edid_counter++;
> -			goto carp;
> -		}
>  	}
> -	if (i == 4)
> -		goto carp;
>  
> -	/* if there's no extensions, we're done */
> +	/* if there's no extensions or no connector, we're done */
>  	valid_extensions = edid[0x7e];
>  	if (valid_extensions == 0)
>  		return (struct edid *)edid;
> @@ -2010,8 +2039,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  
>  	return (struct edid *)edid;
>  
> -carp:
> -	connector_bad_edid(connector, edid, 1);
>  out:
>  	kfree(edid);
>  	return NULL;

-- 
Jani Nikula, Intel Open Source Graphics Center
