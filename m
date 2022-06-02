Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AB53BD05
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29510F6D9;
	Thu,  2 Jun 2022 17:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5AE10E8F0;
 Thu,  2 Jun 2022 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654189757; x=1685725757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hq54uFJp9h0V84i/Ev+B48nSjmT6FcA4jImCIZiyuPU=;
 b=APBrcTl8os4Wa1eHEUrCM6RFO8onNmeJkDtB6wbKzMIFmg7wVvXAXMTH
 Q27o2+exp6yIFN/BQ2n/SpeY2NkNwdcoHFJ6juedK6dgk+EQtRnihCFXg
 osHgUs4Uf5cAhv/T2AxjIZW4a/jkuRCKQ9Y9XchiUeD3/yP2qU0QJnzp9
 jcCwGXE1RfRBphR4oohMqk2gRK50YxQPBXCOXuzwwCLos0HHXwiCEVbc4
 6rggbVvwv33p/u/800/BWnAN/3RH3Ebsp7XmzGsu3oohxn2h+P5uQMYzy
 gfBeYnzidvhYBQMHtsw/qSuUn7AKRr5j5CdwZ8iDybrI/3pGbZjNUShJQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="274817004"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="274817004"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="577603232"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 02 Jun 2022 10:09:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 20:09:12 +0300
Date: Thu, 2 Jun 2022 20:09:12 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 04/13] drm/edid: add drm_edid_connector_update()
Message-ID: <YpjuuOwPTocSGGrJ@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
 <7feaf59054f65ab46644a976984b294b4df02586.1653381821.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7feaf59054f65ab46644a976984b294b4df02586.1653381821.git.jani.nikula@intel.com>
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

On Tue, May 24, 2022 at 01:39:26PM +0300, Jani Nikula wrote:
> Add a new function drm_edid_connector_update() to replace the
> combination of calls drm_connector_update_edid_property() and
> drm_add_edid_modes(). Usually they are called in the drivers in this
> order, however the former needs information from the latter.
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
> index 0d640e7dcff7..09328298aabf 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6127,8 +6127,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
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
> @@ -6191,6 +6191,67 @@ static int drm_edid_connector_update(struct drm_connector *connector,
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
> +		connector->epoch_counter++;
> +
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
> +			    connector->base.id, connector->name,
> +			    connector->epoch_counter);

There was some recent discussion on the blob IDs changing willy nilly.
We could avoid some of that by bailing out here if nothing changed.
But that's not really something that should be done in this patch.


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

I was a bit confused why this function is needed, until I recalled that
the EDID read thing you introduce in the earlier patch doesn't do
any of this (unlike the old function). Would be good to point that
out in the commit message.

> +
> +	return count;
> +}
> +EXPORT_SYMBOL(drm_edid_connector_update);
> +
>  /**
>   * drm_add_edid_modes - add modes from EDID data, if available
>   * @connector: connector we're probing
> @@ -6200,6 +6261,8 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>   * &drm_display_info structure and ELD in @connector with any information which
>   * can be derived from the edid.
>   *
> + * This function is deprecated. Use drm_edid_connector_update() instead.
> + *
>   * Return: The number of modes added or 0 if we couldn't find any.
>   */
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> @@ -6212,8 +6275,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
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
> index b729e18968dd..289b956d31ea 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -590,6 +590,8 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
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
