Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD92885B634
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3FE10E1A9;
	Tue, 20 Feb 2024 08:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="a74EcYt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D99E10E1A9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:57:18 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 73D96604D9;
 Tue, 20 Feb 2024 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708419437;
 bh=u/JtNuyFt/BKBahslNMW/LjSPVCo28RIgKPtu3ZeSSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a74EcYt1mvBIeCn4KaEIu5rGtzqLq8frJGGNejrKlDT86LVJXTZ4qPj2YLvFv14A9
 un07dRM6gbY1X4E2oLhDy7ztalLMzYu529ImuDMFoIvZgiFe2JFXUleEQuvL/NqaJW
 /h9z/JvXLAcMvtRZpdlExlzHTvvNQvt035oQ+aqVAT6YRqqs3syJY8OiHgI1n/kavW
 H4S9BNrYoKNHCmVSWiWEgJdxWw5/VNB0GojOnUS/ZLZDiojJs5wCM6EqFlU+qOkloB
 S8mG8PaZIjUiYR5tFVMhccsJWQ1X0yIXrYXxzNAtujdXLqZMskaoowj4uA4Rjxxa0q
 RS30HGhxuTJTA==
Date: Tue, 20 Feb 2024 10:56:55 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Message-ID: <20240220085655.GO5299@atomide.com>
References: <20240219142001.19727-1-tony@atomide.com>
 <20240219142001.19727-2-tony@atomide.com>
 <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
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

* Thomas Zimmermann <tzimmermann@suse.de> [240219 16:43]:
> Am 19.02.24 um 15:19 schrieb Tony Lindgren:
> > --- a/drivers/gpu/drm/omapdrm/Kconfig
> > +++ b/drivers/gpu/drm/omapdrm/Kconfig
> > @@ -5,6 +5,7 @@ config DRM_OMAP
> >   	depends on ARCH_OMAP2PLUS
> >   	select DRM_KMS_HELPER
> >   	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
> > +	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
> 
> Anything named _IOMEM_ is for framebuffer's in I/O memory space. Just keep
> DMAMEM_HELPERS with the few changes below.

Oh right, yes omapdrm is operating on memory.

> >   	select VIDEOMODE_HELPERS
> >   	select HDMI
> >   	default n
> > diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> > @@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
> >   	omap_gem_roll(bo, fbi->var.yoffset * npages);
> >   }
> > +FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(omap_fbdev,
> > +				  drm_fb_helper_damage_range,
> > +				  drm_fb_helper_damage_area)
> > +
> 
> Please create FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() by duplicating
> FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS() in <linux/fb.h>

OK

> >   static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
> >   		struct fb_info *fbi)
> >   {
> > @@ -106,13 +110,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
> >   static const struct fb_ops omap_fb_ops = {
> >   	.owner = THIS_MODULE,
> > -	__FB_DEFAULT_DMAMEM_OPS_RDWR,
> > +	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
> >   	.fb_check_var	= drm_fb_helper_check_var,
> >   	.fb_set_par	= drm_fb_helper_set_par,
> >   	.fb_setcmap	= drm_fb_helper_setcmap,
> >   	.fb_blank	= drm_fb_helper_blank,
> >   	.fb_pan_display = omap_fbdev_pan_display,
> > -	__FB_DEFAULT_DMAMEM_OPS_DRAW,
> > +	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
> >   	.fb_ioctl	= drm_fb_helper_ioctl,
> >   	.fb_mmap	= omap_fbdev_fb_mmap,
> 
> The write and draw callbacks track the written pages and flush them to the
> backbuffer. But mmap is a problem here, because mmap needs to do this as
> well. You'd have to use fb_deferred_io_mmap() here and call
> fb_deferred_io_init() in omap's fbdev init. See the generic fbdev in
> drm_fbdev_generic() for a working example. But IDK whether that works easily
> for omap's DMA memory. You have to mmap and track memory pages (i.e., struct
> page).

The following test patch works for me.. Not sure about the tracking though.
Do you mean that tracking needs to be implemented if fb_deferred_io_mmap()
did not work?

> The easy solution is to clear the fb_mmap callback and mmap() will thne not
> be available to userspace.

Sounds like that would break things for userspace.

Regards,

Tony

8< ------------------------
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
 	omap_gem_roll(bo, fbi->var.yoffset * npages);
 }
 
+FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(omap_fbdev,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area)
+
 static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 		struct fb_info *fbi)
 {
@@ -80,9 +84,13 @@ static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = info->par;
 	struct drm_framebuffer *fb = helper->fb;
-	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
+	struct drm_gem_object *bo;
 
-	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
+	bo = drm_gem_fb_get_obj(fb, 0);
+	if (!bo)
+		return -EINVAL;
+
+	return fb_deferred_io_mmap(info, vma);
 }
 
 static void omap_fbdev_fb_destroy(struct fb_info *info)
@@ -94,6 +102,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 	DBG();
 
+	fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(helper);
 
 	omap_gem_unpin(bo);
@@ -106,13 +115,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
-	__FB_DEFAULT_DMAMEM_OPS_DRAW,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
 	.fb_ioctl	= drm_fb_helper_ioctl,
 	.fb_mmap	= omap_fbdev_fb_mmap,
 	.fb_destroy	= omap_fbdev_fb_destroy,
@@ -213,6 +222,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	fbi->fix.smem_start = dma_addr;
 	fbi->fix.smem_len = bo->size;
 
+	/* deferred I/O */
+	helper->fbdefio.delay = HZ / 20;
+	helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+	fbi->fbdefio = &helper->fbdefio;
+	ret = fb_deferred_io_init(fbi);
+	if (ret)
+		goto fail;
+
 	/* if we have DMM, then we can use it for scrolling by just
 	 * shuffling pages around in DMM rather than doing sw blit.
 	 */
diff --git a/include/linux/fb.h b/include/linux/fb.h
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -686,6 +686,10 @@ extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
 	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
 
+#define FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(__prefix, __damage_range, __damage_area) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_RDWR(__prefix, __damage_range, sys) \
+	__FB_GEN_DEFAULT_DEFERRED_OPS_DRAW(__prefix, __damage_area, sys)
+
 /*
  * Initializes struct fb_ops for deferred I/O.
  */
-- 
2.43.1
