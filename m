Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A884554D96
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1005910E43D;
	Wed, 22 Jun 2022 14:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9834389CDE;
 Wed, 22 Jun 2022 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655908731; x=1687444731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wYRnQTGuNgZfDW8VvhvIXkw5u0Tl63cI+F6QJaesbb8=;
 b=HmRzTcLnALUdwxxMUmEvrOCJfd51h57Pwyt2UnOJ4yeuwYiKjID4RZ5i
 BHzw/ynmBB3Eraj14+BDBi7zphTu7N7+quykmMaRB/PmlrC1aQrQtXAMW
 EYCxfmtHMBnrOuPbT0cKuPB277imVbQSoGuWY+NJhqL8OchUSR35usvgy
 1pKmR6jwVH5CMW3PXKhAtVEQC4EMQplJnGzkF1vVQGqPaMMlxtpLpeFq0
 SpcrWGySt5RYkqHJRF+Rn3QvMuhqDbHDnirvQLAgi6WagZ5Dn8ltubdhL
 s/Ng2aGqQm00xJ0Wqo+CbkyKdPZ8AoLAbgglyFMd2hc+sQLSJWgeVB+aX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="280479133"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="280479133"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 07:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644227382"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga008.fm.intel.com with SMTP; 22 Jun 2022 07:38:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 17:38:47 +0300
Date: Wed, 22 Jun 2022 17:38:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 02/13] drm/edid: convert
 drm_connector_update_edid_property() to struct drm_edid
Message-ID: <YrMpdxRwtcftwifV@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
 <32d64f6e47ac761b003711ab5f13c2a9edebfed6.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32d64f6e47ac761b003711ab5f13c2a9edebfed6.1655895388.git.jani.nikula@intel.com>
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

On Wed, Jun 22, 2022 at 01:59:16PM +0300, Jani Nikula wrote:
> Make drm_connector_update_edid_property() a thin wrapper around a struct
> drm_edid based version of the same.
> 
> This lets us remove the legacy drm_update_tile_info() and
> drm_add_display_info() functions altogether.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 81 ++++++++++++++++----------------------
>  1 file changed, 35 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 36bf7b0fe8d9..62967db78139 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6042,14 +6042,6 @@ static u32 update_display_info(struct drm_connector *connector,
>  	return quirks;
>  }
>  
> -static u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
> -{
> -	struct drm_edid drm_edid;
> -
> -	return update_display_info(connector,
> -				   drm_edid_legacy_init(&drm_edid, edid));
> -}
> -
>  static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
>  							    struct displayid_detailed_timings_1 *timings,
>  							    bool type_7)
> @@ -6206,38 +6198,19 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> -static void drm_update_tile_info(struct drm_connector *connector,
> -				 const struct edid *edid);
> +static void _drm_update_tile_info(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid);
>  
> -/**
> - * drm_connector_update_edid_property - update the edid property of a connector
> - * @connector: drm connector
> - * @edid: new value of the edid property
> - *
> - * This function creates a new blob modeset object and assigns its id to the
> - * connector's edid property.
> - * Since we also parse tile information from EDID's displayID block, we also
> - * set the connector's tile property here. See drm_connector_set_tile_property()
> - * for more details.
> - *
> - * Returns:
> - * Zero on success, negative errno on failure.
> - */
> -int drm_connector_update_edid_property(struct drm_connector *connector,
> -				       const struct edid *edid)
> +static int _drm_connector_update_edid_property(struct drm_connector *connector,
> +					       const struct drm_edid *drm_edid)
>  {
>  	struct drm_device *dev = connector->dev;
> -	size_t size = 0;
>  	int ret;
> -	const struct edid *old_edid;
>  
>  	/* ignore requests to set edid when overridden */
>  	if (connector->override_edid)
>  		return 0;
>  
> -	if (edid)
> -		size = EDID_LENGTH * (1 + edid->extensions);
> -
>  	/*
>  	 * Set the display info, using edid if available, otherwise resetting
>  	 * the values to defaults. This duplicates the work done in
> @@ -6246,17 +6219,18 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  	 * that it seems better to duplicate it rather than attempt to ensure
>  	 * some arbitrary ordering of calls.
>  	 */
> -	if (edid)
> -		drm_add_display_info(connector, edid);
> +	if (drm_edid)
> +		update_display_info(connector, drm_edid);
>  	else
>  		drm_reset_display_info(connector);
>  
> -	drm_update_tile_info(connector, edid);
> +	_drm_update_tile_info(connector, drm_edid);
>  
>  	if (connector->edid_blob_ptr) {
> -		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
> +		const struct edid *old_edid = connector->edid_blob_ptr->data;
> +
>  		if (old_edid) {
> -			if (!drm_edid_are_equal(edid, old_edid)) {
> +			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
>  				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
>  					      connector->base.id, connector->name);
>  
> @@ -6273,14 +6247,37 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  
>  	ret = drm_property_replace_global_blob(dev,
>  					       &connector->edid_blob_ptr,
> -					       size,
> -					       edid,
> +					       drm_edid ? drm_edid->size : 0,
> +					       drm_edid ? drm_edid->edid : NULL,
>  					       &connector->base,
>  					       dev->mode_config.edid_property);
>  	if (ret)
>  		return ret;
>  	return drm_connector_set_tile_property(connector);
>  }
> +
> +/**
> + * drm_connector_update_edid_property - update the edid property of a connector
> + * @connector: drm connector
> + * @edid: new value of the edid property
> + *
> + * This function creates a new blob modeset object and assigns its id to the
> + * connector's edid property.
> + * Since we also parse tile information from EDID's displayID block, we also
> + * set the connector's tile property here. See drm_connector_set_tile_property()
> + * for more details.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_update_edid_property(struct drm_connector *connector,
> +				       const struct edid *edid)
> +{
> +	struct drm_edid drm_edid;
> +
> +	return _drm_connector_update_edid_property(connector,
> +						   drm_edid_legacy_init(&drm_edid, edid));
> +}
>  EXPORT_SYMBOL(drm_connector_update_edid_property);
>  
>  /**
> @@ -6720,11 +6717,3 @@ static void _drm_update_tile_info(struct drm_connector *connector,
>  		connector->tile_group = NULL;
>  	}
>  }
> -
> -static void drm_update_tile_info(struct drm_connector *connector,
> -				 const struct edid *edid)
> -{
> -	struct drm_edid drm_edid;
> -
> -	_drm_update_tile_info(connector, drm_edid_legacy_init(&drm_edid, edid));
> -}
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
