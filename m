Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE0868BBB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A853810EFF5;
	Tue, 27 Feb 2024 09:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jc/xS+DE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498D310F29C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709024970; x=1740560970;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gw1x/vbGsvJML+r/3pYD26OfBQDx+xJPDEc5xPwzsoY=;
 b=jc/xS+DEQcWnm2R+HuOh30XRTrh2PStGYfi8klBXEmPTbJbQDFwg5Ndt
 nH+TuyORZCHA8mPZFXyJ/whO8ILiIfseowMD6GchBBGlnSB2A4M1ujYV1
 ULyj/GQ4DuEJhmQqVh2blBrlzGkL7rwMCf8/6Kswo/yHseIeUO1WMgiT/
 OKjW84+juOcMcwGec3JHsoDi2aupKDzkI7Wz83GURrgThKeuepLCjkvA3
 gZPqO548Qs5nycGl8mpEneHfpYob7BrmHBvFxxjQ4lZu9uTexuNpDnD9n
 VE4s5uZiS486IsUmytfu7vNTe+Bz0/MOKVeIBLjfYgDeaqgXjunShM4Jh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3472682"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3472682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="44464859"
Received: from bdallmer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:09:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Douglas Anderson
 <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
In-Reply-To: <20240223223958.3887423-2-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
Date: Tue, 27 Feb 2024 11:09:22 +0200
Message-ID: <87wmqqjmt9.fsf@intel.com>
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

On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> It's found that some panels have variants that they share the same panel id
> although their EDID and names are different. Besides panel id, now we need
> the hash of entire EDID base block to distinguish these panel variants.
>
> Add drm_edid_get_base_block to returns the EDID base block, so caller can
> further use it to get panel id and/or the hash.

Please reconsider the whole approach here.

Please let's not add single-use special case functions to read an EDID
base block.

Please consider reading the whole EDID, using the regular EDID reading
functions, and use that instead.

Most likely you'll only have 1-2 blocks anyway. And you might consider
caching the EDID in struct panel_edp if reading the entire EDID is too
slow. (And if it is, this is probably sensible even if the EDID only
consists of one block.)

Anyway, please do *not* merge this as-is.

BR,
Jani.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++++--------------
>  drivers/gpu/drm/panel/panel-edp.c |  8 +++--
>  include/drm/drm_edid.h            |  3 +-
>  3 files changed, 38 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 923c4423151c..55598ca4a5d1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2770,58 +2770,63 @@ static u32 edid_extract_panel_id(const struct edid *edid)
>  }
>  
>  /**
> - * drm_edid_get_panel_id - Get a panel's ID through DDC
> - * @adapter: I2C adapter to use for DDC
> + * drm_edid_get_panel_id - Get a panel's ID from EDID base block
> + * @base_bock: EDID base block that contains panel ID.
>   *
> - * This function reads the first block of the EDID of a panel and (assuming
> + * This function uses the first block of the EDID of a panel and (assuming
>   * that the EDID is valid) extracts the ID out of it. The ID is a 32-bit value
>   * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) that's
>   * supposed to be different for each different modem of panel.
>   *
> + * Return: A 32-bit ID that should be different for each make/model of panel.
> + *         See the functions drm_edid_encode_panel_id() and
> + *         drm_edid_decode_panel_id() for some details on the structure of this
> + *         ID.
> + */
> +u32 drm_edid_get_panel_id(void *base_block)
> +{
> +	return edid_extract_panel_id(base_block);
> +}
> +EXPORT_SYMBOL(drm_edid_get_panel_id);
> +
> +/**
> + * drm_edid_get_base_block - Get a panel's EDID base block
> + * @adapter: I2C adapter to use for DDC
> + *
> + * This function returns the first block of the EDID of a panel.
> + *
>   * This function is intended to be used during early probing on devices where
>   * more than one panel might be present. Because of its intended use it must
> - * assume that the EDID of the panel is correct, at least as far as the ID
> - * is concerned (in other words, we don't process any overrides here).
> + * assume that the EDID of the panel is correct, at least as far as the base
> + * block is concerned (in other words, we don't process any overrides here).
>   *
>   * NOTE: it's expected that this function and drm_do_get_edid() will both
>   * be read the EDID, but there is no caching between them. Since we're only
>   * reading the first block, hopefully this extra overhead won't be too big.
>   *
> - * Return: A 32-bit ID that should be different for each make/model of panel.
> - *         See the functions drm_edid_encode_panel_id() and
> - *         drm_edid_decode_panel_id() for some details on the structure of this
> - *         ID.
> + * Caller should free the base block after use.
>   */
> -
> -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
> +void *drm_edid_get_base_block(struct i2c_adapter *adapter)
>  {
>  	enum edid_block_status status;
>  	void *base_block;
> -	u32 panel_id = 0;
> -
> -	/*
> -	 * There are no manufacturer IDs of 0, so if there is a problem reading
> -	 * the EDID then we'll just return 0.
> -	 */
>  
>  	base_block = kzalloc(EDID_LENGTH, GFP_KERNEL);
>  	if (!base_block)
> -		return 0;
> +		return NULL;
>  
>  	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
>  
>  	edid_block_status_print(status, base_block, 0);
>  
> -	if (edid_block_status_valid(status, edid_block_tag(base_block)))
> -		panel_id = edid_extract_panel_id(base_block);
> -	else
> +	if (!edid_block_status_valid(status, edid_block_tag(base_block))) {
>  		edid_block_dump(KERN_NOTICE, base_block, 0);
> +		return NULL;
> +	}
>  
> -	kfree(base_block);
> -
> -	return panel_id;
> +	return base_block;
>  }
> -EXPORT_SYMBOL(drm_edid_get_panel_id);
> +EXPORT_SYMBOL(drm_edid_get_base_block);
>  
>  /**
>   * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index bd71d239272a..f6ddbaa103b5 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -763,6 +763,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
>  static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>  {
>  	struct panel_desc *desc;
> +	void *base_block;
>  	u32 panel_id;
>  	char vend[4];
>  	u16 product_id;
> @@ -792,8 +793,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>  		goto exit;
>  	}
>  
> -	panel_id = drm_edid_get_panel_id(panel->ddc);
> -	if (!panel_id) {
> +	base_block = drm_edid_get_base_block(panel->ddc);
> +	if (base_block) {
> +		panel_id = drm_edid_get_panel_id(base_block);
> +		kfree(base_block);
> +	} else {
>  		dev_err(dev, "Couldn't identify panel via EDID\n");
>  		ret = -EIO;
>  		goto exit;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 7923bc00dc7a..56b60f9204d3 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -410,7 +410,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> +void *drm_edid_get_base_block(struct i2c_adapter *adapter);
> +u32 drm_edid_get_panel_id(void *base_block);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);

-- 
Jani Nikula, Intel
