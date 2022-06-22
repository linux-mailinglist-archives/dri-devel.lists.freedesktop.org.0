Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931C554DA4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815C10E436;
	Wed, 22 Jun 2022 14:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0610E436;
 Wed, 22 Jun 2022 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655908863; x=1687444863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ycmhOg5GuaP5OvFXNgckIf73GUCU5s0aIvh04i+gq50=;
 b=lvm7PsJ4ip1TIzu5eh2euZ+wFYoiOL1tY4xUbUsQQVCSUtNPsVHRQz/T
 pUEnHGUfOnLohroElYJthNMvh7UQJhG11Lu6IhrBGGlTDmnBPeLSKdgDe
 Pmvv+N8gO25C0PxDOeyBXXuwqPEKxRJyfPI7rwxWv4UvrIHQiEk1BVdkr
 Shb6kbEBpmCM9WV5jdhIWP78OQKq77R6zzDmltpizTenpGQkrbgM8+AT3
 fC+kY547nEg94J+ffsnKs5MjfAdKCrtvOCEbtNvvCJNi/rU6MuSWaphgn
 pvK35z0Dm7HGbmLt5r9hrvsTGvDRVLGWQE/RAFzXb2MvHOnWKpmIBv/Ia w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281164351"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281164351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 07:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="690529004"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga002.fm.intel.com with SMTP; 22 Jun 2022 07:41:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 17:40:59 +0300
Date: Wed, 22 Jun 2022 17:40:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 03/13] drm/edid: clean up connector update error
 handling and debug logging
Message-ID: <YrMp+3a4aK1smNTG@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
 <eba6004e0ff0a61d674560b68d1547639996ea74.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eba6004e0ff0a61d674560b68d1547639996ea74.1655895388.git.jani.nikula@intel.com>
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

On Wed, Jun 22, 2022 at 01:59:17PM +0300, Jani Nikula wrote:
> Bail out on all errors, debug log all errors, and convert to drm device
> based debug logging.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 41 ++++++++++++++++++++++++++------------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 62967db78139..e360e1a269f4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6231,29 +6231,44 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
>  
>  		if (old_edid) {
>  			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
> -				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
> -					      connector->base.id, connector->name);
> -
> -				connector->epoch_counter += 1;
> -				DRM_DEBUG_KMS("Updating change counter to %llu\n",
> -					      connector->epoch_counter);
> +				connector->epoch_counter++;
> +				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
> +					    connector->base.id, connector->name,
> +					    connector->epoch_counter);
>  			}
>  		}
>  	}
>  
> -	drm_object_property_set_value(&connector->base,
> -				      dev->mode_config.non_desktop_property,
> -				      connector->display_info.non_desktop);
> -
>  	ret = drm_property_replace_global_blob(dev,
>  					       &connector->edid_blob_ptr,
>  					       drm_edid ? drm_edid->size : 0,
>  					       drm_edid ? drm_edid->edid : NULL,
>  					       &connector->base,
>  					       dev->mode_config.edid_property);
> -	if (ret)
> -		return ret;
> -	return drm_connector_set_tile_property(connector);
> +	if (ret) {
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +		goto out;
> +	}
> +
> +	ret = drm_object_property_set_value(&connector->base,
> +					    dev->mode_config.non_desktop_property,
> +					    connector->display_info.non_desktop);
> +	if (ret) {
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Non-desktop property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +		goto out;
> +	}
> +
> +	ret = drm_connector_set_tile_property(connector);
> +	if (ret) {
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Tile property update failed (%d)\n",
> +			    connector->base.id, connector->name, ret);
> +		goto out;
> +	}
> +
> +out:

Could just return directly w/o the goto detour.
Or maybe this becomes useful later?

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +	return ret;
>  }
>  
>  /**
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
