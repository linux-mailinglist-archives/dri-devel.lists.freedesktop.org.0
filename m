Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DA4822E3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 10:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C91910E31E;
	Fri, 31 Dec 2021 09:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603E10E31E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640941659; x=1672477659;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=rTfex9Aa77NNvM7/OlGXB6Mt4o9HbnqFvSf9POgC7n8=;
 b=fXB6y1Hvwr78uuXrt6AuU5KhOZCyrRX5j+9g2zg8dPLv8ll7HOvJTXEd
 FwPu23+dhTorENw350cS48Tbg0UQ51PPSINYJME2FC46PZg+fci+YBUk6
 BsDdH/ItTDJXQGv572lxGHcoTBoWM8xHcgXLUKx0jTFoTGxdLlc/s3oe7
 1y2iM4tm4BJ+VWmSEH1PxBs4mT2nV7oim0eQl1KXW54T+ByONJWIydF9B
 /HGJzCYY2HHQRKf1W9FO9LBtAkydyXZVvDmqwg6Do3U7gnPKvFATgqr9T
 SrKEOqVoIUtslI2fAQzwFVi8C0lmLm7nNy7UcATwG3j9DgpFYT29MN9RW g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228615446"
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="228615446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 01:07:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="470903545"
Received: from arudakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.25.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 01:07:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core,
 files drm_{b,c}*.c
In-Reply-To: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
Date: Fri, 31 Dec 2021 11:07:32 +0200
Message-ID: <878rw1jg6j.fsf@intel.com>
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

On Thu, 30 Dec 2021, Claudio Suarez <cssk@net-c.es> wrote:
> DRM_DEBUG_* and DRM_* log calls are deprecated.
> Change them to drm_dbg_* / drm_{err,info,...} calls in drm core
> files.
>
> To avoid making a very big patch, this change is split in
> smaller patches. This one includes drm_{b,c}*.c

Personally, I'd split it further to smaller patches.

>
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/drm_blend.c          |   6 +-
>  drivers/gpu/drm/drm_bridge.c         |   6 +-
>  drivers/gpu/drm/drm_bufs.c           | 116 +++++++++++++--------------
>  drivers/gpu/drm/drm_client_modeset.c | 109 +++++++++++++------------
>  drivers/gpu/drm/drm_color_mgmt.c     |   6 +-
>  drivers/gpu/drm/drm_connector.c      |  37 +++++----
>  drivers/gpu/drm/drm_context.c        |  18 ++---
>  drivers/gpu/drm/drm_crtc.c           |  40 ++++-----
>  drivers/gpu/drm/drm_crtc_helper.c    |  61 +++++++-------
>  9 files changed, 211 insertions(+), 188 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index ec37cbfabb50..4a988815f998 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -450,7 +450,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
>  	int i, n = 0;
>  	int ret = 0;
>  
> -	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
> +	drm_dbg_atomic(dev, "[CRTC:%d:%s] calculating normalized zpos values\n",
>  			 crtc->base.id, crtc->name);

Throughout the patch, please fix the indentation on the following
lines. The lines should be aligned at the next column after the opening
brace "(" in the function call, like they used to be.

>  
>  	states = kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
> @@ -469,7 +469,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
>  			goto done;
>  		}
>  		states[n++] = plane_state;
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] processing zpos value %d\n",
>  				 plane->base.id, plane->name,
>  				 plane_state->zpos);
>  	}
> @@ -480,7 +480,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
>  		plane = states[i]->plane;
>  
>  		states[i]->normalized_zpos = i;
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
> +		drm_dbg_atomic(dev, "[PLANE:%d:%s] normalized zpos value %d\n",
>  				 plane->base.id, plane->name, i);
>  	}
>  	crtc_state->zpos_changed = true;
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c96847fc0ebc..b108377b4b40 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -288,10 +288,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	list_del(&bridge->chain_node);
>  
>  #ifdef CONFIG_OF
> -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> +	drm_err(encoder->dev,
> +		  "failed to attach bridge %pOF to encoder %s: %d\n",
>  		  bridge->of_node, encoder->name, ret);
>  #else
> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> +	drm_err(encoder->dev,
> +		  "failed to attach bridge to encoder %s: %d\n",
>  		  encoder->name, ret);
>  #endif
>  
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index fcca21e8efac..dd8e100e120c 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -171,8 +171,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  		kfree(map);
>  		return -EINVAL;
>  	}
> -	DRM_DEBUG("offset = 0x%08llx, size = 0x%08lx, type = %d\n",
> -		  (unsigned long long)map->offset, map->size, map->type);
> +	drm_dev_dbg(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
> +		    (unsigned long long)map->offset, map->size, map->type);

Please avoid drm_dev_dbg() when struct drm_device is available,
throughout the patch. DRM_DEBUG() -> drm_dbg_core() in drm_*.[ch].

Clearly dev is struct drm_device here, and in a lot of places, so you're
passing an incompatible pointer to drm_dev_dbg(), which is for when you
only have struct device available.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
