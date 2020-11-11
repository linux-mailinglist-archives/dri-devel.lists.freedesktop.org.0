Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68112AF7EF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 19:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BE46E0A0;
	Wed, 11 Nov 2020 18:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3E56E0A6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 18:31:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CC83020048;
 Wed, 11 Nov 2020 19:31:32 +0100 (CET)
Date: Wed, 11 Nov 2020 19:31:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 1/2] drm: convert drm_atomic_uapi.c to new debug helpers
Message-ID: <20201111183131.GA2999095@ravnborg.org>
References: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=lVUkbcFohFTY2TyvY8YA:9 a=CjuIK1q_8ugA:10 a=NB7fjztKfZwA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,
On Wed, Nov 11, 2020 at 09:07:36AM +0000, Simon Ser wrote:
> Migrate from DRM_DEBUG_ATOMIC to drm_dbg_atomic.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>

Thanks for doing this. I had not been shy about using longer lines as
the hard limit these days are 100 - but thats just an observation.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Note: I expect you will commit the patch

	Sam

> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 113 +++++++++++++++++-------------
>  1 file changed, 66 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ef82009035e6..efab3d518891 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -85,13 +85,15 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
>  
>  		drm_mode_copy(&state->mode, mode);
>  		state->enable = true;
> -		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> -				 mode->name, crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> +			       mode->name, crtc->base.id, crtc->name, state);
>  	} else {
>  		memset(&state->mode, 0, sizeof(state->mode));
>  		state->enable = false;
> -		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> -				 crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, state);
>  	}
>  
>  	return 0;
> @@ -128,31 +130,35 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
>  		int ret;
>  
>  		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] bad mode blob length: %zu\n",
> -					 crtc->base.id, crtc->name,
> -					 blob->length);
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
> +				       crtc->base.id, crtc->name,
> +				       blob->length);
>  			return -EINVAL;
>  		}
>  
>  		ret = drm_mode_convert_umode(crtc->dev,
>  					     &state->mode, blob->data);
>  		if (ret) {
> -			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
> -					 crtc->base.id, crtc->name,
> -					 ret, drm_get_mode_status_name(state->mode.status));
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
> +				       crtc->base.id, crtc->name,
> +				       ret, drm_get_mode_status_name(state->mode.status));
>  			drm_mode_debug_printmodeline(&state->mode);
>  			return -EINVAL;
>  		}
>  
>  		state->mode_blob = drm_property_blob_get(blob);
>  		state->enable = true;
> -		DRM_DEBUG_ATOMIC("Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> -				 state->mode.name, crtc->base.id, crtc->name,
> -				 state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
> +			       state->mode.name, crtc->base.id, crtc->name,
> +			       state);
>  	} else {
>  		state->enable = false;
> -		DRM_DEBUG_ATOMIC("Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> -				 crtc->base.id, crtc->name, state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
> +			       crtc->base.id, crtc->name, state);
>  	}
>  
>  	return 0;
> @@ -202,12 +208,14 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
>  	}
>  
>  	if (crtc)
> -		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
> -				 plane->base.id, plane->name, plane_state,
> -				 crtc->base.id, crtc->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "Link [PLANE:%d:%s] state %p to [CRTC:%d:%s]\n",
> +			       plane->base.id, plane->name, plane_state,
> +			       crtc->base.id, crtc->name);
>  	else
> -		DRM_DEBUG_ATOMIC("Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
> -				 plane->base.id, plane->name, plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Link [PLANE:%d:%s] state %p to [NOCRTC]\n",
> +			       plane->base.id, plane->name, plane_state);
>  
>  	return 0;
>  }
> @@ -230,12 +238,14 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>  	struct drm_plane *plane = plane_state->plane;
>  
>  	if (fb)
> -		DRM_DEBUG_ATOMIC("Set [FB:%d] for [PLANE:%d:%s] state %p\n",
> -				 fb->base.id, plane->base.id, plane->name,
> -				 plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [FB:%d] for [PLANE:%d:%s] state %p\n",
> +			       fb->base.id, plane->base.id, plane->name,
> +			       plane_state);
>  	else
> -		DRM_DEBUG_ATOMIC("Set [NOFB] for [PLANE:%d:%s] state %p\n",
> -				 plane->base.id, plane->name, plane_state);
> +		drm_dbg_atomic(plane->dev,
> +			       "Set [NOFB] for [PLANE:%d:%s] state %p\n",
> +			       plane->base.id, plane->name, plane_state);
>  
>  	drm_framebuffer_assign(&plane_state->fb, fb);
>  }
> @@ -324,13 +334,15 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>  		drm_connector_get(conn_state->connector);
>  		conn_state->crtc = crtc;
>  
> -		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
> -				 connector->base.id, connector->name,
> -				 conn_state, crtc->base.id, crtc->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
> +			       connector->base.id, connector->name,
> +			       conn_state, crtc->base.id, crtc->name);
>  	} else {
> -		DRM_DEBUG_ATOMIC("Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
> -				 connector->base.id, connector->name,
> -				 conn_state);
> +		drm_dbg_atomic(crtc->dev,
> +			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
> +			       connector->base.id, connector->name,
> +			       conn_state);
>  	}
>  
>  	return 0;
> @@ -474,9 +486,10 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property, val);
>  	} else {
> -		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 crtc->base.id, crtc->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(crtc->dev,
> +			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       crtc->base.id, crtc->name,
> +			       property->base.id, property->name);
>  		return -EINVAL;
>  	}
>  
> @@ -570,8 +583,9 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  		state->pixel_blend_mode = val;
>  	} else if (property == plane->rotation_property) {
>  		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK)) {
> -			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
> -					 plane->base.id, plane->name, val);
> +			drm_dbg_atomic(plane->dev,
> +				       "[PLANE:%d:%s] bad rotation bitmask: 0x%llx\n",
> +				       plane->base.id, plane->name, val);
>  			return -EINVAL;
>  		}
>  		state->rotation = val;
> @@ -595,9 +609,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>  		return plane->funcs->atomic_set_property(plane, state,
>  				property, val);
>  	} else {
> -		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 plane->base.id, plane->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(plane->dev,
> +			       "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       plane->base.id, plane->name,
> +			       property->base.id, property->name);
>  		return -EINVAL;
>  	}
>  
> @@ -665,17 +680,20 @@ static int drm_atomic_set_writeback_fb_for_connector(
>  		struct drm_framebuffer *fb)
>  {
>  	int ret;
> +	struct drm_connector *conn = conn_state->connector;
>  
>  	ret = drm_writeback_set_fb(conn_state, fb);
>  	if (ret < 0)
>  		return ret;
>  
>  	if (fb)
> -		DRM_DEBUG_ATOMIC("Set [FB:%d] for connector state %p\n",
> -				 fb->base.id, conn_state);
> +		drm_dbg_atomic(conn->dev,
> +			       "Set [FB:%d] for connector state %p\n",
> +			       fb->base.id, conn_state);
>  	else
> -		DRM_DEBUG_ATOMIC("Set [NOFB] for connector state %p\n",
> -				 conn_state);
> +		drm_dbg_atomic(conn->dev,
> +			       "Set [NOFB] for connector state %p\n",
> +			       conn_state);
>  
>  	return 0;
>  }
> @@ -782,9 +800,10 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  		return connector->funcs->atomic_set_property(connector,
>  				state, property, val);
>  	} else {
> -		DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
> -				 connector->base.id, connector->name,
> -				 property->base.id, property->name);
> +		drm_dbg_atomic(connector->dev,
> +			       "[CONNECTOR:%d:%s] unknown property [PROP:%d:%s]]\n",
> +			       connector->base.id, connector->name,
> +			       property->base.id, property->name);
>  		return -EINVAL;
>  	}
>  
> @@ -1282,7 +1301,7 @@ static void complete_signaling(struct drm_device *dev,
>  		/* If this fails log error to the user */
>  		if (fence_state[i].out_fence_ptr &&
>  		    put_user(-1, fence_state[i].out_fence_ptr))
> -			DRM_DEBUG_ATOMIC("Couldn't clear out_fence_ptr\n");
> +			drm_dbg_atomic(dev, "Couldn't clear out_fence_ptr\n");
>  	}
>  
>  	kfree(fence_state);
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
