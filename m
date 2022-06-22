Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC783554EE9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD181134D1;
	Wed, 22 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09A1134CB;
 Wed, 22 Jun 2022 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655911061; x=1687447061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RQThtohiGZl4u41erhMvIlscNhq3By122STyZh0xYZM=;
 b=aNLkMrwfd76P2e/W136i4P6DjBtj950lcnLudUEG/sCSXwog/Rwzmkog
 PZn9klbyx4iIGVKe/rNgSM3cB2k7jCdtxJcNyINHBL8KWszSUbAyM1rzd
 VI4xaGXNT1v7Mt690/1hcMyMsag+bIma32vlrWGAptpbP6xHozuqwTZRZ
 cRexRCgyzt7cZcihKH0wtvx9R0wiWfbYwfvConlstZYGPgWcd6lKl8oE8
 GOYYKdhrGTh6WyECZEkzcl4q2M5Y+nKRQrHb/BATxOCsJuP005435Rfaz
 /ru9V1HHEC1fDPoU/vdPnjD9IW4di60RzbIEQkOdqcT6w1W738k44MM0P Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280490520"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="280490520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644244950"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga008.fm.intel.com with SMTP; 22 Jun 2022 08:17:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 18:17:37 +0300
Date: Wed, 22 Jun 2022 18:17:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 05/13] drm/edid: add drm_edid_connector_update()
Message-ID: <YrMykdSOXCGVbFMd@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
 <bcdc925d3a50a40714637c9bf7c71e4c534bd223.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcdc925d3a50a40714637c9bf7c71e4c534bd223.1655895388.git.jani.nikula@intel.com>
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

On Wed, Jun 22, 2022 at 01:59:19PM +0300, Jani Nikula wrote:
> Add a new function drm_edid_connector_update() to replace the
> combination of calls drm_connector_update_edid_property() and
> drm_add_edid_modes(). Usually they are called in the drivers in this
> order, however the former needs information from the latter.
> 
> Since the new drm_edid_read*() functions no longer call the connector
> updates directly, and the read and update are separated, we'll need this
> new function for the connector update.
> 
> This is all in drm_edid.c simply to keep struct drm_edid opaque.
> 
> v2:
> - Share code with drm_connector_update_edid_property() (Ville)
> - Add comment about override EDID handling
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Had to take notes to figure who did/does what. But it does look
like non-static stuff should end up doing the same thing before
and after this patch, apart from the new function that is.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 103 ++++++++++++++++++++++++++++---------
>  include/drm/drm_edid.h     |   2 +
>  2 files changed, 81 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index c3f0f0a5a8a9..41b3de52b8f1 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6160,8 +6160,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> -static int drm_edid_connector_update(struct drm_connector *connector,
> -				     const struct drm_edid *drm_edid)
> +static int _drm_edid_connector_update(struct drm_connector *connector,
> +				      const struct drm_edid *drm_edid)
>  {
>  	int num_modes = 0;
>  	u32 quirks;
> @@ -6227,31 +6227,12 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>  static void _drm_update_tile_info(struct drm_connector *connector,
>  				  const struct drm_edid *drm_edid);
>  
> -static int _drm_connector_update_edid_property(struct drm_connector *connector,
> +static int _drm_edid_connector_property_update(struct drm_connector *connector,
>  					       const struct drm_edid *drm_edid)
>  {
>  	struct drm_device *dev = connector->dev;
>  	int ret;
>  
> -	/* ignore requests to set edid when overridden */
> -	if (connector->override_edid)
> -		return 0;
> -
> -	/*
> -	 * Set the display info, using edid if available, otherwise resetting
> -	 * the values to defaults. This duplicates the work done in
> -	 * drm_add_edid_modes, but that function is not consistently called
> -	 * before this one in all drivers and the computation is cheap enough
> -	 * that it seems better to duplicate it rather than attempt to ensure
> -	 * some arbitrary ordering of calls.
> -	 */
> -	if (drm_edid)
> -		update_display_info(connector, drm_edid);
> -	else
> -		drm_reset_display_info(connector);
> -
> -	_drm_update_tile_info(connector, drm_edid);
> -
>  	if (connector->edid_blob_ptr) {
>  		const struct edid *old_edid = connector->edid_blob_ptr->data;
>  
> @@ -6297,6 +6278,76 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +/**
> + * drm_edid_connector_update - Update connector information from EDID
> + * @connector: Connector
> + * @drm_edid: EDID
> + *
> + * Update the connector mode list, display info, ELD, HDR metadata, relevant
> + * properties, etc. from the passed in EDID.
> + *
> + * If EDID is NULL, reset the information.
> + *
> + * Return: The number of modes added or 0 if we couldn't find any.
> + */
> +int drm_edid_connector_update(struct drm_connector *connector,
> +			      const struct drm_edid *drm_edid)
> +{
> +	int count;
> +
> +	/*
> +	 * FIXME: Reconcile the differences in override_edid handling between
> +	 * this and drm_connector_update_edid_property().
> +	 *
> +	 * If override_edid is set, and the EDID passed in here originates from
> +	 * drm_edid_read() and friends, it will be the override EDID, and there
> +	 * are no issues. drm_connector_update_edid_property() ignoring requests
> +	 * to set the EDID dates back to a time when override EDID was not
> +	 * handled at the low level EDID read.
> +	 *
> +	 * The only way the EDID passed in here can be different from the
> +	 * override EDID is when a driver passes in an EDID that does *not*
> +	 * originate from drm_edid_read() and friends, or passes in a stale
> +	 * cached version. This, in turn, is a question of when an override EDID
> +	 * set via debugfs should take effect.
> +	 */
> +
> +	count = _drm_edid_connector_update(connector, drm_edid);
> +
> +	_drm_update_tile_info(connector, drm_edid);
> +
> +	/* Note: Ignore errors for now. */
> +	_drm_edid_connector_property_update(connector, drm_edid);
> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_edid_connector_update);
> +
> +static int _drm_connector_update_edid_property(struct drm_connector *connector,
> +					       const struct drm_edid *drm_edid)
> +{
> +	/* ignore requests to set edid when overridden */
> +	if (connector->override_edid)
> +		return 0;
> +
> +	/*
> +	 * Set the display info, using edid if available, otherwise resetting
> +	 * the values to defaults. This duplicates the work done in
> +	 * drm_add_edid_modes, but that function is not consistently called
> +	 * before this one in all drivers and the computation is cheap enough
> +	 * that it seems better to duplicate it rather than attempt to ensure
> +	 * some arbitrary ordering of calls.
> +	 */
> +	if (drm_edid)
> +		update_display_info(connector, drm_edid);
> +	else
> +		drm_reset_display_info(connector);
> +
> +	_drm_update_tile_info(connector, drm_edid);
> +
> +	return _drm_edid_connector_property_update(connector, drm_edid);
> +}
> +
>  /**
>   * drm_connector_update_edid_property - update the edid property of a connector
>   * @connector: drm connector
> @@ -6308,6 +6359,8 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
>   * set the connector's tile property here. See drm_connector_set_tile_property()
>   * for more details.
>   *
> + * This function is deprecated. Use drm_edid_connector_update() instead.
> + *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> @@ -6330,6 +6383,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
>   * &drm_display_info structure and ELD in @connector with any information which
>   * can be derived from the edid.
>   *
> + * This function is deprecated. Use drm_edid_connector_update() instead.
> + *
>   * Return: The number of modes added or 0 if we couldn't find any.
>   */
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> @@ -6342,8 +6397,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  		edid = NULL;
>  	}
>  
> -	return drm_edid_connector_update(connector,
> -					 drm_edid_legacy_init(&drm_edid, edid));
> +	return _drm_edid_connector_update(connector,
> +					  drm_edid_legacy_init(&drm_edid, edid));
>  }
>  EXPORT_SYMBOL(drm_add_edid_modes);
>  
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 9d2d78135dee..aeb2fa95bc04 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -603,6 +603,8 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
>  const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
>  					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
>  					    void *context);
> +int drm_edid_connector_update(struct drm_connector *connector,
> +			      const struct drm_edid *edid);
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
