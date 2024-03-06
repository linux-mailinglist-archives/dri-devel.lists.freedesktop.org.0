Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1F8730FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 09:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EAB113001;
	Wed,  6 Mar 2024 08:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2tYBBCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1100113001
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709714607; x=1741250607;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o1f+IK+oob/TNW+G6c9s3CJ0ykrpd884VVhiFMZV1rU=;
 b=X2tYBBCHFSXVPaHqcwQ3cwKgdgGoJxoaJ7Sjt3NUP1rs/WR8AQQqAMgU
 kPZKtxdwpnGi5pZrOWIjgJWdLdIhjLhnokpuzIMpZIbTGvxAtEgm542at
 fwG3eKFJEr2EGS2a8JdGe1yR3YdGd78Xvla5Wczb/lJzdpnBMHb/IQKTj
 76M6sT/OGPtkY/LgyQ8dqwvR29QYmwGq83VHw3uQczjDK6pk3cKyKDpLM
 2ypu8iNbAimlycCWzAMlk+xTUFMjdR5dJHlNQL5oSJn9ye3HA8gtj1blR
 i2c5CKSj48bqgihVFWP4qULrge7mqrDjm3/NjMTVAjSkoY9tQNspQotLn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15726253"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="15726253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 00:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9556791"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 00:43:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] drm_edid: Add a function to get EDID base block
In-Reply-To: <20240306004347.974304-2-hsinyi@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240306004347.974304-1-hsinyi@chromium.org>
 <20240306004347.974304-2-hsinyi@chromium.org>
Date: Wed, 06 Mar 2024 10:43:09 +0200
Message-ID: <87v85zzr6q.fsf@intel.com>
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

On Tue, 05 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> It's found that some panels have variants that they share the same panel id
> although their EDID and names are different. Besides panel id, now we need
> more information from the EDID base block to distinguish these panel
> variants.
>
> Add drm_edid_read_base_block() to return the EDID base block, which is
> wrapped in struct drm_edid.
>
> Caller can further use it to get panel id or check if the block contains
> certain strings, such as panel name.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v3->v4: change drm_edid_read_base_block return type to drm_edid.
> ---
>  drivers/gpu/drm/drm_edid.c        | 63 +++++++++++++++++++------------
>  drivers/gpu/drm/panel/panel-edp.c |  8 +++-
>  include/drm/drm_edid.h            |  3 +-
>  3 files changed, 46 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 923c4423151c..f9e09f327f81 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2770,58 +2770,71 @@ static u32 edid_extract_panel_id(const struct edid *edid)
>  }
>  
>  /**
> - * drm_edid_get_panel_id - Get a panel's ID through DDC
> - * @adapter: I2C adapter to use for DDC
> + * drm_edid_get_panel_id - Get a panel's ID from EDID
> + * @drm_edid: EDID that contains panel ID.
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
> +u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid)
> +{
> +	return edid_extract_panel_id(drm_edid->edid);
> +}
> +EXPORT_SYMBOL(drm_edid_get_panel_id);
> +
> +/**
> + * drm_edid_read_base_block - Get a panel's EDID base block
> + * @adapter: I2C adapter to use for DDC
> + *
> + * This function returns the drm_edid containing the first block of the EDID of
> + * a panel.
> + *
>   * This function is intended to be used during early probing on devices where
>   * more than one panel might be present. Because of its intended use it must
> - * assume that the EDID of the panel is correct, at least as far as the ID
> - * is concerned (in other words, we don't process any overrides here).
> + * assume that the EDID of the panel is correct, at least as far as the base
> + * block is concerned (in other words, we don't process any overrides here).
> + *
> + * Caller should call drm_edid_free() after use.
>   *
>   * NOTE: it's expected that this function and drm_do_get_edid() will both
>   * be read the EDID, but there is no caching between them. Since we're only
>   * reading the first block, hopefully this extra overhead won't be too big.
>   *
> - * Return: A 32-bit ID that should be different for each make/model of panel.
> - *         See the functions drm_edid_encode_panel_id() and
> - *         drm_edid_decode_panel_id() for some details on the structure of this
> - *         ID.
> + * WARNING: Only use this function when the connector is unknown. For example,
> + * during the early probe of panel. The EDID read from the function is temporary
> + * and should be replaced by the full EDID returned from other drm_edid_read.
> + *
> + * Return: Pointer to allocated EDID base block, or NULL on any failure.
>   */
> -
> -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
> +const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter)
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
> +		kfree(base_block);
> +		return NULL;
> +	}
>  
> -	kfree(base_block);
> -
> -	return panel_id;
> +	return drm_edid_alloc(base_block, EDID_LENGTH);

This leaks base_block. Please use _drm_edid_alloc() (with underscore) to
only allocate the container without kmemduping the data.

Otherwise LGTM.

BR,
Jani.



>  }
> -EXPORT_SYMBOL(drm_edid_get_panel_id);
> +EXPORT_SYMBOL(drm_edid_read_base_block);
>  
>  /**
>   * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 745f3e48f02a..d094cfc43da8 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -766,6 +766,7 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
>  static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>  {
>  	struct panel_desc *desc;
> +	const struct drm_edid *base_block;
>  	u32 panel_id;
>  	char vend[4];
>  	u16 product_id;
> @@ -795,8 +796,11 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
>  		goto exit;
>  	}
>  
> -	panel_id = drm_edid_get_panel_id(panel->ddc);
> -	if (!panel_id) {
> +	base_block = drm_edid_read_base_block(panel->ddc);
> +	if (base_block) {
> +		panel_id = drm_edid_get_panel_id(base_block);
> +		drm_edid_free(base_block);
> +	} else {
>  		dev_err(dev, "Couldn't identify panel via EDID\n");
>  		ret = -EIO;
>  		goto exit;
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 7923bc00dc7a..9686a7cee6a6 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -410,7 +410,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  	void *data);
>  struct edid *drm_get_edid(struct drm_connector *connector,
>  			  struct i2c_adapter *adapter);
> -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> +const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter);
> +u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
>  struct edid *drm_edid_duplicate(const struct edid *edid);

-- 
Jani Nikula, Intel
