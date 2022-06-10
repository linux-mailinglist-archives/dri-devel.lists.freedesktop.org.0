Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90077546D56
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5AA7113A06;
	Fri, 10 Jun 2022 19:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA166113A06;
 Fri, 10 Jun 2022 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889806; x=1686425806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hm9vWcZTUzGYIR2FS1+HmIq+Nm9bYj9HFSvKDwTwxTA=;
 b=nRyoeqYnD/8zSUwjFo0jSQ2/3ML5Ebs1igkM8cvF2JVTi6sWjiE1jBgR
 BXRuxMJMFsg0U7fub3ueOO7rH/JR2KK8WOfaMVSZeZsjdhIPKOFA0nR4o
 2RfHLt59ztgTPUy4Aj87SVIZ+NDOCXWFVNZ9ugQUu2530kaPFEl3oMozh
 uVVRFLcsb/Rn4YwFIR+tgf0KkMQgElILSga0Jddcaf5q5/fkBfztJpnb2
 cZYty+TU51UjQD0VhzwHeEdloBrVxJbVfLO/ZLOW1+B0pmQDNsMv7EOUg
 GWnXQ+UGhT5WwKUBh1egnGy0Xq9qEcXEsd60SPtLUOfHzGxAovoPkIg3I A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="260845052"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="260845052"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="684719572"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga002.fm.intel.com with SMTP; 10 Jun 2022 12:36:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:36:42 +0300
Date: Fri, 10 Jun 2022 22:36:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 07/15] drm/probe-helper: abstract .get_modes()
 connector helper call
Message-ID: <YqOdSmHfIPu2Jz3p@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <a4de51efc246e4f5bcbf7b84d66bb49aaf7fd974.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4de51efc246e4f5bcbf7b84d66bb49aaf7fd974.1654674560.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 10:50:37AM +0300, Jani Nikula wrote:
> Abstract the .get_modes() connector helper call, including the
> override/firmware EDID fallback, for clarity.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 75a71649b64d..a8d26b29bfa0 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -354,6 +354,24 @@ drm_helper_probe_detect(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_helper_probe_detect);
>  
> +static int drm_helper_probe_get_modes(struct drm_connector *connector)
> +{
> +	const struct drm_connector_helper_funcs *connector_funcs =
> +		connector->helper_private;
> +	int count;
> +
> +	count = connector_funcs->get_modes(connector);
> +
> +	/*
> +	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
> +	 * override/firmware EDID.
> +	 */
> +	if (count == 0 && connector->status == connector_status_connected)
> +		count = drm_add_override_edid_modes(connector);
> +
> +	return count;
> +}
> +
>  static int __drm_helper_update_and_validate(struct drm_connector *connector,
>  					    uint32_t maxX, uint32_t maxY,
>  					    struct drm_modeset_acquire_ctx *ctx)
> @@ -473,8 +491,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode;
> -	const struct drm_connector_helper_funcs *connector_funcs =
> -		connector->helper_private;
>  	int count = 0, ret;
>  	enum drm_connector_status old_status;
>  	struct drm_modeset_acquire_ctx ctx;
> @@ -559,14 +575,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  		goto exit;
>  	}
>  
> -	count = (*connector_funcs->get_modes)(connector);
> -
> -	/*
> -	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
> -	 * override/firmware EDID.
> -	 */
> -	if (count == 0 && connector->status == connector_status_connected)
> -		count = drm_add_override_edid_modes(connector);
> +	count = drm_helper_probe_get_modes(connector);
>  
>  	if (count == 0 && (connector->status == connector_status_connected ||
>  			   connector->status == connector_status_unknown)) {
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
