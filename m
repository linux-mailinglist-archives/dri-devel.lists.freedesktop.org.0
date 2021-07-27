Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAB3D7299
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5F6E17A;
	Tue, 27 Jul 2021 10:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F446E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:07:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so1085264wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dYA+uQMQm9380ZHfO4JIZ9mo+QlYYbiHYkpLZUF5iBI=;
 b=X6Qwfl+H/0zH730rgP040k386Sq2XvF8FP8NXdwNCNc8w8vSzmkyQJUEb8X3cGrm1L
 RiicEx93P2i0vmqio6PLSafXIiOFQ5GQ7DYN8xZnhxe0VKXG8Iqf+8mydL1xZsodTOn0
 vBoJPqT65KN9INOZA6Liez4bxDUsYv2yjT0HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dYA+uQMQm9380ZHfO4JIZ9mo+QlYYbiHYkpLZUF5iBI=;
 b=EOKp0PD1Wj6qabZ/tMeOcMDpYSY9pUcRI8oVMk9MQOu5jRJ8x5j57lTCo0pyCdTe4/
 jnMmHSuy/dhMqZ3LdkzHh4a3ZC5Ii+pW5bkr8iWtLtORIvO+IPKdzMfNe4DLNnR8elpA
 B/1qHmd39NZ+ez17uctw/rkMf2Wfak5nkh507uw9keCgG63+6tGU2NflzSjxxzWu4ouZ
 dyc5bdei0MjnKL0xsJuRal5Kv1fY2KAtjZ39ivVq9v4N9I2Gc5wmNY1zwQuaO7RpHIxU
 qk8CSgWNX26BqWEkIiPMHrnSlG+VKEFRrL7tNPH6nh30+unkFheF5JMu0FPQbvnEQFcW
 Crwg==
X-Gm-Message-State: AOAM5330hE7nH+JDXFtwiNVTR2dzAhoTIFrrCA676eTLS67xBY9JDbdn
 FFTqo7IrR/z2pexu3MaYq/sddr8V6ls8Cw==
X-Google-Smtp-Source: ABdhPJzIVYc/fFnYYIClRDvvmVMRaSKhAtY9OJ4zL1lTi1d3Evhld1+m9rnANe4QSXoRfhaCLG54jw==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr11774572wme.158.1627380476280; 
 Tue, 27 Jul 2021 03:07:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z25sm2526663wmf.9.2021.07.27.03.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:07:55 -0700 (PDT)
Date: Tue, 27 Jul 2021 12:07:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/plane: check that fb_damage is set up when used
Message-ID: <YP/a+Rhs+T8B66YH@phenom.ffwll.local>
References: <20210723083457.696939-1-daniel.vetter@ffwll.ch>
 <20210723083457.696939-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723083457.696939-2-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 10:34:56AM +0200, Daniel Vetter wrote:
> There's two stages of manual upload/invalidate displays:
> - just handling dirtyfb and uploading the entire fb all the time
> - looking at damage clips
> 
> In the latter case we support it through fbdev emulation (with
> fb_defio), atomic property, and with the dirtfy clip rects.
> 
> Make sure at least the atomic property is set up as the main official
> interface for this. Ideally we'd also check that
> drm_atomic_helper_dirtyfb() is used and that fbdev defio is set up,
> but that's quite a bit harder to do. Ideas very much welcome.
> 
> From a cursor audit drivers seem to be getting this right mostly, but
> better to make sure. At least no one is bypassing the accessor
> function.
> 
> v2:
> - use drm_warn_once with a meaningful warning string (José)
> - don't splat in the atomic check code for everyone (intel-gfx-ci)

v2 got rid of the false positive noise, going to push the series to
drm-misc-next.
-Daniel

> 
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com> (v1)
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic.c        |  2 +-
>  drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>  drivers/gpu/drm/drm_plane.c         | 50 +++++++++++++++++++++++++++++
>  include/drm/drm_plane.h             | 36 +++------------------
>  4 files changed, 57 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index d820423fac32..c85dcfd69158 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -660,7 +660,7 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
>  		return -ENOSPC;
>  	}
>  
> -	clips = drm_plane_get_damage_clips(new_plane_state);
> +	clips = __drm_plane_get_damage_clips(new_plane_state);
>  	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
>  
>  	/* Make sure damage clips are valid and inside the fb. */
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index 1ca51addb589..edb772947cb4 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -262,6 +262,8 @@ int drm_plane_register_all(struct drm_device *dev);
>  void drm_plane_unregister_all(struct drm_device *dev);
>  int drm_plane_check_pixel_format(struct drm_plane *plane,
>  				 u32 format, u64 modifier);
> +struct drm_mode_rect *
> +__drm_plane_get_damage_clips(const struct drm_plane_state *state);
>  
>  /* drm_bridge.c */
>  void drm_bridge_detach(struct drm_bridge *bridge);
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index b373958ecb30..f61315b61174 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1397,6 +1397,56 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	return ret;
>  }
>  
> +/**
> + * drm_plane_get_damage_clips_count - Returns damage clips count.
> + * @state: Plane state.
> + *
> + * Simple helper to get the number of &drm_mode_rect clips set by user-space
> + * during plane update.
> + *
> + * Return: Number of clips in plane fb_damage_clips blob property.
> + */
> +unsigned int
> +drm_plane_get_damage_clips_count(const struct drm_plane_state *state)
> +{
> +	return (state && state->fb_damage_clips) ?
> +		state->fb_damage_clips->length/sizeof(struct drm_mode_rect) : 0;
> +}
> +EXPORT_SYMBOL(drm_plane_get_damage_clips_count);
> +
> +struct drm_mode_rect *
> +__drm_plane_get_damage_clips(const struct drm_plane_state *state)
> +{
> +	return (struct drm_mode_rect *)((state && state->fb_damage_clips) ?
> +					state->fb_damage_clips->data : NULL);
> +}
> +
> +/**
> + * drm_plane_get_damage_clips - Returns damage clips.
> + * @state: Plane state.
> + *
> + * Note that this function returns uapi type &drm_mode_rect. Drivers might want
> + * to use the helper functions drm_atomic_helper_damage_iter_init() and
> + * drm_atomic_helper_damage_iter_next() or drm_atomic_helper_damage_merged() if
> + * the driver can only handle a single damage region at most.
> + *
> + * Return: Damage clips in plane fb_damage_clips blob property.
> + */
> +struct drm_mode_rect *
> +drm_plane_get_damage_clips(const struct drm_plane_state *state)
> +{
> +	struct drm_device *dev = state->plane->dev;
> +	struct drm_mode_config *config = &dev->mode_config;
> +
> +	/* check that drm_plane_enable_fb_damage_clips() was called */
> +	if (!drm_mode_obj_find_prop_id(&state->plane->base,
> +				       config->prop_fb_damage_clips->base.id))
> +		drm_warn_once(dev, "drm_plane_enable_fb_damage_clips() not called\n");
> +
> +	return __drm_plane_get_damage_clips(state);
> +}
> +EXPORT_SYMBOL(drm_plane_get_damage_clips);
> +
>  struct drm_property *
>  drm_create_scaling_filter_prop(struct drm_device *dev,
>  			       unsigned int supported_filters)
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 7f7d5148310c..a2684aab8372 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -897,39 +897,11 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>  
>  bool drm_any_plane_has_format(struct drm_device *dev,
>  			      u32 format, u64 modifier);
> -/**
> - * drm_plane_get_damage_clips_count - Returns damage clips count.
> - * @state: Plane state.
> - *
> - * Simple helper to get the number of &drm_mode_rect clips set by user-space
> - * during plane update.
> - *
> - * Return: Number of clips in plane fb_damage_clips blob property.
> - */
> -static inline unsigned int
> -drm_plane_get_damage_clips_count(const struct drm_plane_state *state)
> -{
> -	return (state && state->fb_damage_clips) ?
> -		state->fb_damage_clips->length/sizeof(struct drm_mode_rect) : 0;
> -}
> +unsigned int
> +drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
>  
> -/**
> - * drm_plane_get_damage_clips - Returns damage clips.
> - * @state: Plane state.
> - *
> - * Note that this function returns uapi type &drm_mode_rect. Drivers might want
> - * to use the helper functions drm_atomic_helper_damage_iter_init() and
> - * drm_atomic_helper_damage_iter_next() or drm_atomic_helper_damage_merged() if
> - * the driver can only handle a single damage region at most.
> - *
> - * Return: Damage clips in plane fb_damage_clips blob property.
> - */
> -static inline struct drm_mode_rect *
> -drm_plane_get_damage_clips(const struct drm_plane_state *state)
> -{
> -	return (struct drm_mode_rect *)((state && state->fb_damage_clips) ?
> -					state->fb_damage_clips->data : NULL);
> -}
> +struct drm_mode_rect *
> +drm_plane_get_damage_clips(const struct drm_plane_state *state);
>  
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>  					     unsigned int supported_filters);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
