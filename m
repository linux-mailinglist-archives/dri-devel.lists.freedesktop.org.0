Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC87546D16
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074D2112602;
	Fri, 10 Jun 2022 19:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D897310EB7A;
 Fri, 10 Jun 2022 19:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654888511; x=1686424511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=guwXRPDjtY4POkFmBP/DOdt9XNOVmFgJ+EodoLqaSzA=;
 b=OUgy3+JXIdyeEw+RY+wsyaPPwlpSTYxMas4AjV++NqDjIA2xrIB9W0ls
 r9SXKLm4vIu+4f5GRKThy0MHMWw7ZF9FkgcYb7Si2TLtp03fT5oyIyi7+
 fRuxlHbIY4zoFudPW7Oid3hsFcWfOJfKSSDpkcVkNxqXViRJItkle53mm
 Da24q6IWhTRQlAYYvSneMdjXVaSO+zr1GN5NrEn90fbO2jkKE1i4L8l8e
 Z/eB7ICzQstD7c/aNyG/Ho9npr9vNaAbLUioadMBdUXn5Y3ixm1Re1PlU
 pPHHoSd0oLyR5gvewpOWN20C6KpZXwQYj1c0vz4/XmGPfevhb8Hlzovhk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="266490043"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="266490043"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="586347093"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga007.fm.intel.com with SMTP; 10 Jun 2022 12:15:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:15:06 +0300
Date: Fri, 10 Jun 2022 22:15:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 06/15] drm/edid: add drm_edid_connector_update()
Message-ID: <YqOYOjtsboqHOgvv@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <f10231299d274eefba4c584d1bdb18390dc53e32.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f10231299d274eefba4c584d1bdb18390dc53e32.1654674560.git.jani.nikula@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 10:50:36AM +0300, Jani Nikula wrote:
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
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  2 +
>  drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
>  include/drm/drm_edid.h          |  2 +
>  3 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 1c48d162c77e..ae9c640a641a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2088,6 +2088,8 @@ EXPORT_SYMBOL(drm_connector_set_tile_property);
>   * set the connector's tile property here. See drm_connector_set_tile_property()
>   * for more details.
>   *
> + * This function is deprecated. Use drm_edid_connector_update() instead.
> + *
>   * Returns:
>   * Zero on success, negative errno on failure.
>   */
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 2bdaf1e34a9d..952724788963 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6143,8 +6143,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
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
> @@ -6207,6 +6207,67 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> +static void _drm_update_tile_info(struct drm_connector *connector,
> +				  const struct drm_edid *drm_edid);
> +
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
> +	struct drm_device *dev = connector->dev;
> +	const struct edid *old_edid = connector->edid_blob_ptr ?
> +		connector->edid_blob_ptr->data : NULL;
> +	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
> +	size_t size = drm_edid ? drm_edid->size : 0;
> +	int count, ret;
> +
> +	count = _drm_edid_connector_update(connector, drm_edid);
> +
> +	_drm_update_tile_info(connector, drm_edid);
> +
> +	if (old_edid && !drm_edid_are_equal(edid, old_edid)) {

The old_edid check looks a bit odd. Can't really see why we'd not
want to bump the epoch counter when we go from not having and EDID
to having one. This issue already seems to exist in the current code,
although that one also skips the epoch counter bump if the new EDID
is missing, so even more odd.

This also brings me to the slight annoynace of having this code
duplicated in two places. I worry we'll end up accumulating different
bugs in each copy. Can't we refactor to have just one copy?

> +		connector->epoch_counter++;
> +
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
> +			    connector->base.id, connector->name,
> +			    connector->epoch_counter);
> +	}
> +
> +	ret = drm_property_replace_global_blob(dev, &connector->edid_blob_ptr,
> +					       size, edid,
> +					       &connector->base,
> +					       dev->mode_config.edid_property);
> +	if (ret)
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +
> +	ret = drm_object_property_set_value(&connector->base,
> +					    dev->mode_config.non_desktop_property,
> +					    connector->display_info.non_desktop);
> +	if (ret)
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Non-desktop property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +
> +	ret = drm_connector_set_tile_property(connector);
> +	if (ret)
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Tile property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_edid_connector_update);
> +
>  /**
>   * drm_add_edid_modes - add modes from EDID data, if available
>   * @connector: connector we're probing
> @@ -6216,6 +6277,8 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   * &drm_display_info structure and ELD in @connector with any information which
>   * can be derived from the edid.
>   *
> + * This function is deprecated. Use drm_edid_connector_update() instead.
> + *
>   * Return: The number of modes added or 0 if we couldn't find any.
>   */
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> @@ -6228,8 +6291,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
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
