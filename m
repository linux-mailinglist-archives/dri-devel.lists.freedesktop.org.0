Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A330D77D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DB86EA50;
	Wed,  3 Feb 2021 10:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0EF6EA50
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:29:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y187so4658644wmd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dEtEm5Hkf41N4isDElNZ0CgLEb4ZjPOXaIEjC0TbcA4=;
 b=K5/ViVWH38KidsqdCmkDmk9JrTbJghYN/fECNpX0AuirPxF5UshKLEt16ClcdtkCzB
 VSHK5iiBrulwT8xLaOaE9pBFB21GT3y6GQLK5Zl6AbDL+eyNgmnHvWzBtBmg/u4sAW8B
 2qSjAWvprKSZTvqEe3vp9JXTEuCi4IaCDGV9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dEtEm5Hkf41N4isDElNZ0CgLEb4ZjPOXaIEjC0TbcA4=;
 b=MCV/f5B0f38rbqWHDYXrzFCa0z5p2Y3HItRm0A88981YEtaXeQkGfX07xe6fLieNEh
 AHTjGjK5C27JrqrS3Ho0tu7VTC4u/PcarAbb3yRkdIXX/DXr9U4DSezYTgOYTYuZuyBB
 O696mwwSDk6e1eZjqgp2N9QV6Wamgn4IR/q+2VReoVZce4GEv70alTkdaqcnY0UXKprG
 dV+eDTcjdFQvUeZSJFwsbfS3TAG50aU3JeDi4V8gGaT6U7YbJTOcwcpNViAvAoRUQv8V
 yT/wocTuSUAcmghntQmxgCNecIP3S9DVjSCkiUncoai44Z+fAbpzLhDHy21+TD9amo+4
 8Pww==
X-Gm-Message-State: AOAM530WlOi7+8Bkw4kp8TSxtRuMO4tEV/Eos7mVIDCk5ZIvIFKuea2l
 OvZIBi+tYx6bNmYvShWXCf6eSw==
X-Google-Smtp-Source: ABdhPJwpuDjo1o46Q8+zDji3OD3DQBy6AtNQmKG4m4j4zUun6470nBzFhB/aa4HS5AYyNdkwHwVReA==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr2150976wmd.9.1612348173550; 
 Wed, 03 Feb 2021 02:29:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t205sm2161190wmt.28.2021.02.03.02.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 02:29:32 -0800 (PST)
Date: Wed, 3 Feb 2021 11:29:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vboxvideo: Vmap/vunmap cursor BO in prepare_fb and
 cleanup_fb
Message-ID: <YBp7CzzBjECx5lAu@phenom.ffwll.local>
References: <20210127140503.31772-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127140503.31772-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 03:05:03PM +0100, Thomas Zimmermann wrote:
> Functions in the atomic commit tail are not allowed to acquire the
> dmabuf's reservation lock. So we cannot legally call the GEM object's
> vmap functionality in atomic_update.
> 
> Instead vmap the cursor BO in prepare_fb and vunmap it in cleanup_fb.
> The cursor plane state stores the mapping's address. The pinning of the
> BO is implicitly done by vmap.
> 
> As an extra benefit, there's no source of runtime errors left in
> atomic_update.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Did you test this with my dma_fence_signalling annotations patches?

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 102 +++++++++++++++++++++-----
>  1 file changed, 82 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index dbc0dd53c69e..b5625a7d6cef 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -324,6 +324,19 @@ static void vbox_primary_atomic_disable(struct drm_plane *plane,
>  				    old_state->src_y >> 16);
>  }
>  
> +struct vbox_cursor_plane_state {
> +	struct drm_plane_state base;
> +
> +	/* Transitional state - do not export or duplicate */
> +
> +	struct dma_buf_map map;
> +};
> +
> +static struct vbox_cursor_plane_state *to_vbox_cursor_plane_state(struct drm_plane_state *state)
> +{
> +	return container_of(state, struct vbox_cursor_plane_state, base);
> +}
> +
>  static int vbox_cursor_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *new_state)
>  {
> @@ -381,14 +394,13 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  		container_of(plane->dev, struct vbox_private, ddev);
>  	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
>  	struct drm_framebuffer *fb = plane->state->fb;
> -	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
>  	u32 width = plane->state->crtc_w;
>  	u32 height = plane->state->crtc_h;
> +	struct vbox_cursor_plane_state *vbox_state = to_vbox_cursor_plane_state(plane->state);
> +	struct dma_buf_map map = vbox_state->map;
> +	u8 *src = map.vaddr; /* TODO: Use mapping abstraction properly */
>  	size_t data_size, mask_size;
>  	u32 flags;
> -	struct dma_buf_map map;
> -	int ret;
> -	u8 *src;
>  
>  	/*
>  	 * VirtualBox uses the host windowing system to draw the cursor so
> @@ -401,17 +413,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  
>  	vbox_crtc->cursor_enabled = true;
>  
> -	ret = drm_gem_vram_vmap(gbo, &map);
> -	if (ret) {
> -		/*
> -		 * BUG: we should have pinned the BO in prepare_fb().
> -		 */
> -		mutex_unlock(&vbox->hw_mutex);
> -		DRM_WARN("Could not map cursor bo, skipping update\n");
> -		return;
> -	}
> -	src = map.vaddr; /* TODO: Use mapping abstraction properly */
> -
>  	/*
>  	 * The mask must be calculated based on the alpha
>  	 * channel, one bit per ARGB word, and must be 32-bit
> @@ -421,7 +422,6 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>  	data_size = width * height * 4 + mask_size;
>  
>  	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_vunmap(gbo, &map);
>  
>  	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
> @@ -458,6 +458,43 @@ static void vbox_cursor_atomic_disable(struct drm_plane *plane,
>  	mutex_unlock(&vbox->hw_mutex);
>  }
>  
> +static int vbox_cursor_prepare_fb(struct drm_plane *plane, struct drm_plane_state *new_state)
> +{
> +	struct vbox_cursor_plane_state *new_vbox_state = to_vbox_cursor_plane_state(new_state);
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct drm_gem_vram_object *gbo;
> +	struct dma_buf_map map;
> +	int ret;
> +
> +	if (!fb)
> +		return 0;
> +
> +	gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +
> +	ret = drm_gem_vram_vmap(gbo, &map);
> +	if (ret)
> +		return ret;
> +
> +	new_vbox_state->map = map;
> +
> +	return 0;
> +}
> +
> +static void vbox_cursor_cleanup_fb(struct drm_plane *plane, struct drm_plane_state *old_state)
> +{
> +	struct vbox_cursor_plane_state *old_vbox_state = to_vbox_cursor_plane_state(old_state);
> +	struct drm_framebuffer *fb = old_state->fb;
> +	struct dma_buf_map map = old_vbox_state->map;
> +	struct drm_gem_vram_object *gbo;
> +
> +	if (!fb)
> +		return;
> +
> +	gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +
> +	drm_gem_vram_vunmap(gbo, &map);
> +}
> +
>  static const u32 vbox_cursor_plane_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  };
> @@ -466,17 +503,42 @@ static const struct drm_plane_helper_funcs vbox_cursor_helper_funcs = {
>  	.atomic_check	= vbox_cursor_atomic_check,
>  	.atomic_update	= vbox_cursor_atomic_update,
>  	.atomic_disable	= vbox_cursor_atomic_disable,
> -	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
> -	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
> +	.prepare_fb	= vbox_cursor_prepare_fb,
> +	.cleanup_fb	= vbox_cursor_cleanup_fb,
>  };
>  
> +static struct drm_plane_state *vbox_cursor_atomic_duplicate_state(struct drm_plane *plane)
> +{
> +	struct vbox_cursor_plane_state *new_vbox_state;
> +	struct drm_device *dev = plane->dev;
> +
> +	if (drm_WARN_ON(dev, !plane->state))
> +		return NULL;
> +
> +	new_vbox_state = kzalloc(sizeof(*new_vbox_state), GFP_KERNEL);
> +	if (!new_vbox_state)
> +		return NULL;
> +	__drm_atomic_helper_plane_duplicate_state(plane, &new_vbox_state->base);
> +
> +	return &new_vbox_state->base;
> +}
> +
> +static void vbox_cursor_atomic_destroy_state(struct drm_plane *plane,
> +					     struct drm_plane_state *state)
> +{
> +	struct vbox_cursor_plane_state *vbox_state = to_vbox_cursor_plane_state(state);
> +
> +	__drm_atomic_helper_plane_destroy_state(&vbox_state->base);
> +	kfree(vbox_state);
> +}
> +
>  static const struct drm_plane_funcs vbox_cursor_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
>  	.destroy	= drm_primary_helper_destroy,
>  	.reset		= drm_atomic_helper_plane_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	.atomic_duplicate_state = vbox_cursor_atomic_duplicate_state,
> +	.atomic_destroy_state = vbox_cursor_atomic_destroy_state,
>  };
>  
>  static const u32 vbox_primary_plane_formats[] = {
> 
> base-commit: 3836b7fdfad40e2bac5dc882332f42bed6942cf4
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
