Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1048E1BE59F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 19:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C575F6EABB;
	Wed, 29 Apr 2020 17:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135CA886DC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:51:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1BDA6804E6;
 Wed, 29 Apr 2020 19:51:09 +0200 (CEST)
Date: Wed, 29 Apr 2020 19:51:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/17] drm/mgag200: Remove HW cursor
Message-ID: <20200429175107.GC31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=6zZ5Uxn1AAAA:8 a=ePCC2meuLqzmhjN3Y2MA:9
 a=gaJB3CZri1R9dgiK:21 a=w-WV5zSYgFnmkuaN:21 a=CjuIK1q_8ugA:10
 a=MCuRiewMJIbjqZ55f51s:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:22PM +0200, Thomas Zimmermann wrote:
> The HW cursor of Matrox G200 cards only supports a 16-color palette
> format. Univeral planes require at least ARGB or a similar component-
> based format. Converting a cursor image from ARGB to 16 colors does not
> produce pleasent-looking results in general, so remove the HW cursor.

What impact does this have in useability?
Does the cursor behaviour stay the same or?

The patch looks fine, but it seems a bit gross ditching curcor support.
But maybe it is the right choice, I dunno.

	Sam
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/Makefile         |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_cursor.c | 319 -----------------------
>  drivers/gpu/drm/mgag200/mgag200_drv.h    |  13 -
>  drivers/gpu/drm/mgag200/mgag200_main.c   |   7 -
>  drivers/gpu/drm/mgag200/mgag200_mode.c   |   2 -
>  5 files changed, 1 insertion(+), 342 deletions(-)
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_cursor.c
> 
> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
> index 04b281bcf6558..63403133638a3 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -mgag200-y   := mgag200_main.o mgag200_mode.o mgag200_cursor.o \
> +mgag200-y   := mgag200_main.o mgag200_mode.o \
>  	mgag200_drv.o mgag200_i2c.o mgag200_ttm.o
>  
>  obj-$(CONFIG_DRM_MGAG200) += mgag200.o
> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
> deleted file mode 100644
> index d491edd317ff3..0000000000000
> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
> +++ /dev/null
> @@ -1,319 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright 2013 Matrox Graphics
> - *
> - * Author: Christopher Harvey <charvey@matrox.com>
> - */
> -
> -#include <linux/pci.h>
> -
> -#include "mgag200_drv.h"
> -
> -static bool warn_transparent = true;
> -static bool warn_palette = true;
> -
> -static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
> -				 unsigned int width, unsigned int height)
> -{
> -	struct drm_device *dev = mdev->dev;
> -	unsigned int i, row, col;
> -	uint32_t colour_set[16];
> -	uint32_t *next_space = &colour_set[0];
> -	uint32_t *palette_iter;
> -	uint32_t this_colour;
> -	bool found = false;
> -	int colour_count = 0;
> -	u8 reg_index;
> -	u8 this_row[48];
> -
> -	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
> -	/* width*height*4 = 16384 */
> -	for (i = 0; i < 16384; i += 4) {
> -		this_colour = ioread32(src + i);
> -		/* No transparency */
> -		if (this_colour>>24 != 0xff &&
> -			this_colour>>24 != 0x0) {
> -			if (warn_transparent) {
> -				dev_info(&dev->pdev->dev, "Video card doesn't support cursors with partial transparency.\n");
> -				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
> -				warn_transparent = false; /* Only tell the user once. */
> -			}
> -			return -EINVAL;
> -		}
> -		/* Don't need to store transparent pixels as colours */
> -		if (this_colour>>24 == 0x0)
> -			continue;
> -		found = false;
> -		for (palette_iter = &colour_set[0]; palette_iter != next_space; palette_iter++) {
> -			if (*palette_iter == this_colour) {
> -				found = true;
> -				break;
> -			}
> -		}
> -		if (found)
> -			continue;
> -		/* We only support 4bit paletted cursors */
> -		if (colour_count >= 16) {
> -			if (warn_palette) {
> -				dev_info(&dev->pdev->dev, "Video card only supports cursors with up to 16 colours.\n");
> -				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
> -				warn_palette = false; /* Only tell the user once. */
> -			}
> -			return -EINVAL;
> -		}
> -		*next_space = this_colour;
> -		next_space++;
> -		colour_count++;
> -	}
> -
> -	/* Program colours from cursor icon into palette */
> -	for (i = 0; i < colour_count; i++) {
> -		if (i <= 2)
> -			reg_index = 0x8 + i*0x4;
> -		else
> -			reg_index = 0x60 + i*0x3;
> -		WREG_DAC(reg_index, colour_set[i] & 0xff);
> -		WREG_DAC(reg_index+1, colour_set[i]>>8 & 0xff);
> -		WREG_DAC(reg_index+2, colour_set[i]>>16 & 0xff);
> -		BUG_ON((colour_set[i]>>24 & 0xff) != 0xff);
> -	}
> -
> -	/* now write colour indices into hardware cursor buffer */
> -	for (row = 0; row < 64; row++) {
> -		memset(&this_row[0], 0, 48);
> -		for (col = 0; col < 64; col++) {
> -			this_colour = ioread32(src + 4*(col + 64*row));
> -			/* write transparent pixels */
> -			if (this_colour>>24 == 0x0) {
> -				this_row[47 - col/8] |= 0x80>>(col%8);
> -				continue;
> -			}
> -
> -			/* write colour index here */
> -			for (i = 0; i < colour_count; i++) {
> -				if (colour_set[i] == this_colour) {
> -					if (col % 2)
> -						this_row[col/2] |= i<<4;
> -					else
> -						this_row[col/2] |= i;
> -					break;
> -				}
> -			}
> -		}
> -		memcpy_toio(dst + row*48, &this_row[0], 48);
> -	}
> -
> -	return 0;
> -}
> -
> -static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
> -{
> -	u8 addrl = (address >> 10) & 0xff;
> -	u8 addrh = (address >> 18) & 0x3f;
> -
> -	/* Program gpu address of cursor buffer */
> -	WREG_DAC(MGA1064_CURSOR_BASE_ADR_LOW, addrl);
> -	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, addrh);
> -}
> -
> -static int mgag200_show_cursor(struct mga_device *mdev, void *src,
> -			       unsigned int width, unsigned int height)
> -{
> -	struct drm_device *dev = mdev->dev;
> -	struct drm_gem_vram_object *gbo;
> -	void *dst;
> -	s64 off;
> -	int ret;
> -
> -	gbo = mdev->cursor.gbo[mdev->cursor.next_index];
> -	if (!gbo) {
> -		WREG8(MGA_CURPOSXL, 0);
> -		WREG8(MGA_CURPOSXH, 0);
> -		return -ENOTSUPP; /* Didn't allocate space for cursors */
> -	}
> -	dst = drm_gem_vram_vmap(gbo);
> -	if (IS_ERR(dst)) {
> -		ret = PTR_ERR(dst);
> -		dev_err(&dev->pdev->dev,
> -			"failed to map cursor updates: %d\n", ret);
> -		return ret;
> -	}
> -	off = drm_gem_vram_offset(gbo);
> -	if (off < 0) {
> -		ret = (int)off;
> -		dev_err(&dev->pdev->dev,
> -			"failed to get cursor scanout address: %d\n", ret);
> -		goto err_drm_gem_vram_vunmap;
> -	}
> -
> -	ret = mgag200_cursor_update(mdev, dst, src, width, height);
> -	if (ret)
> -		goto err_drm_gem_vram_vunmap;
> -	mgag200_cursor_set_base(mdev, off);
> -
> -	/* Adjust cursor control register to turn on the cursor */
> -	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
> -
> -	drm_gem_vram_vunmap(gbo, dst);
> -
> -	++mdev->cursor.next_index;
> -	mdev->cursor.next_index %= ARRAY_SIZE(mdev->cursor.gbo);
> -
> -	return 0;
> -
> -err_drm_gem_vram_vunmap:
> -	drm_gem_vram_vunmap(gbo, dst);
> -	return ret;
> -}
> -
> -/*
> - * Hide the cursor off screen. We can't disable the cursor hardware because
> - * it takes too long to re-activate and causes momentary corruption.
> - */
> -static void mgag200_hide_cursor(struct mga_device *mdev)
> -{
> -	WREG8(MGA_CURPOSXL, 0);
> -	WREG8(MGA_CURPOSXH, 0);
> -}
> -
> -static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
> -{
> -	if (WARN_ON(x <= 0))
> -		return;
> -	if (WARN_ON(y <= 0))
> -		return;
> -	if (WARN_ON(x & ~0xffff))
> -		return;
> -	if (WARN_ON(y & ~0xffff))
> -		return;
> -
> -	WREG8(MGA_CURPOSXL, x & 0xff);
> -	WREG8(MGA_CURPOSXH, (x>>8) & 0xff);
> -
> -	WREG8(MGA_CURPOSYL, y & 0xff);
> -	WREG8(MGA_CURPOSYH, (y>>8) & 0xff);
> -}
> -
> -int mgag200_cursor_init(struct mga_device *mdev)
> -{
> -	struct drm_device *dev = mdev->dev;
> -	size_t ncursors = ARRAY_SIZE(mdev->cursor.gbo);
> -	size_t size;
> -	int ret;
> -	size_t i;
> -	struct drm_gem_vram_object *gbo;
> -
> -	size = roundup(64 * 48, PAGE_SIZE);
> -	if (size * ncursors > mdev->vram_fb_available)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < ncursors; ++i) {
> -		gbo = drm_gem_vram_create(dev, size, 0);
> -		if (IS_ERR(gbo)) {
> -			ret = PTR_ERR(gbo);
> -			goto err_drm_gem_vram_put;
> -		}
> -		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
> -					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
> -		if (ret) {
> -			drm_gem_vram_put(gbo);
> -			goto err_drm_gem_vram_put;
> -		}
> -
> -		mdev->cursor.gbo[i] = gbo;
> -	}
> -
> -	/*
> -	 * At the high end of video memory, we reserve space for
> -	 * buffer objects. The cursor plane uses this memory to store
> -	 * a double-buffered image of the current cursor. Hence, it's
> -	 * not available for framebuffers.
> -	 */
> -	mdev->vram_fb_available -= ncursors * size;
> -
> -	return 0;
> -
> -err_drm_gem_vram_put:
> -	while (i) {
> -		--i;
> -		gbo = mdev->cursor.gbo[i];
> -		drm_gem_vram_unpin(gbo);
> -		drm_gem_vram_put(gbo);
> -		mdev->cursor.gbo[i] = NULL;
> -	}
> -	return ret;
> -}
> -
> -void mgag200_cursor_fini(struct mga_device *mdev)
> -{
> -	size_t i;
> -	struct drm_gem_vram_object *gbo;
> -
> -	for (i = 0; i < ARRAY_SIZE(mdev->cursor.gbo); ++i) {
> -		gbo = mdev->cursor.gbo[i];
> -		drm_gem_vram_unpin(gbo);
> -		drm_gem_vram_put(gbo);
> -	}
> -}
> -
> -int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
> -			    uint32_t handle, uint32_t width, uint32_t height)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
> -	struct drm_gem_object *obj;
> -	struct drm_gem_vram_object *gbo = NULL;
> -	int ret;
> -	u8 *src;
> -
> -	if (!handle || !file_priv) {
> -		mgag200_hide_cursor(mdev);
> -		return 0;
> -	}
> -
> -	if (width != 64 || height != 64) {
> -		WREG8(MGA_CURPOSXL, 0);
> -		WREG8(MGA_CURPOSXH, 0);
> -		return -EINVAL;
> -	}
> -
> -	obj = drm_gem_object_lookup(file_priv, handle);
> -	if (!obj)
> -		return -ENOENT;
> -	gbo = drm_gem_vram_of_gem(obj);
> -	src = drm_gem_vram_vmap(gbo);
> -	if (IS_ERR(src)) {
> -		ret = PTR_ERR(src);
> -		dev_err(&dev->pdev->dev,
> -			"failed to map user buffer updates\n");
> -		goto err_drm_gem_object_put_unlocked;
> -	}
> -
> -	ret = mgag200_show_cursor(mdev, src, width, height);
> -	if (ret)
> -		goto err_drm_gem_vram_vunmap;
> -
> -	/* Now update internal buffer pointers */
> -	drm_gem_vram_vunmap(gbo, src);
> -	drm_gem_object_put_unlocked(obj);
> -
> -	return 0;
> -err_drm_gem_vram_vunmap:
> -	drm_gem_vram_vunmap(gbo, src);
> -err_drm_gem_object_put_unlocked:
> -	drm_gem_object_put_unlocked(obj);
> -	return ret;
> -}
> -
> -int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
> -{
> -	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
> -
> -	/* Our origin is at (64,64) */
> -	x += 64;
> -	y += 64;
> -
> -	mgag200_move_cursor(mdev, x, y);
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 9691252d6233f..c7f2000d46fce 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -121,11 +121,6 @@ struct mga_connector {
>  	struct mga_i2c_chan *i2c;
>  };
>  
> -struct mga_cursor {
> -	struct drm_gem_vram_object *gbo[2];
> -	unsigned int next_index;
> -};
> -
>  struct mga_mc {
>  	resource_size_t			vram_size;
>  	resource_size_t			vram_base;
> @@ -162,8 +157,6 @@ struct mga_device {
>  	struct mga_mc			mc;
>  	struct mga_mode_info		mode_info;
>  
> -	struct mga_cursor cursor;
> -
>  	size_t vram_fb_available;
>  
>  	bool				suspended;
> @@ -210,10 +203,4 @@ int mgag200_mm_init(struct mga_device *mdev);
>  void mgag200_mm_fini(struct mga_device *mdev);
>  int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
>  
> -int mgag200_cursor_init(struct mga_device *mdev);
> -void mgag200_cursor_fini(struct mga_device *mdev);
> -int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
> -			    uint32_t handle, uint32_t width, uint32_t height);
> -int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
> -
>  #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index b680cf47cbb94..46cc32816f1e1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -176,16 +176,10 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  		goto err_modeset;
>  	}
>  
> -	r = mgag200_cursor_init(mdev);
> -	if (r)
> -		dev_warn(&dev->pdev->dev,
> -			"Could not initialize cursors. Not doing hardware cursors.\n");
> -
>  	return 0;
>  
>  err_modeset:
>  	drm_mode_config_cleanup(dev);
> -	mgag200_cursor_fini(mdev);
>  	mgag200_mm_fini(mdev);
>  err_mm:
>  	dev->dev_private = NULL;
> @@ -201,7 +195,6 @@ void mgag200_driver_unload(struct drm_device *dev)
>  		return;
>  	mgag200_modeset_fini(mdev);
>  	drm_mode_config_cleanup(dev);
> -	mgag200_cursor_fini(mdev);
>  	mgag200_mm_fini(mdev);
>  	dev->dev_private = NULL;
>  }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index d90e83959fca1..c9d120b019649 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1414,8 +1414,6 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
>  
>  /* These provide the minimum set of functions required to handle a CRTC */
>  static const struct drm_crtc_funcs mga_crtc_funcs = {
> -	.cursor_set = mgag200_crtc_cursor_set,
> -	.cursor_move = mgag200_crtc_cursor_move,
>  	.gamma_set = mga_crtc_gamma_set,
>  	.set_config = drm_crtc_helper_set_config,
>  	.destroy = mga_crtc_destroy,
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
