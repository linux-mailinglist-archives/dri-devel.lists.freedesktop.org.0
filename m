Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1885B8CB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 11:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28E10E09D;
	Tue, 20 Feb 2024 10:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="M0PqfJi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643C010E09D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 10:17:17 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 3320160432;
 Tue, 20 Feb 2024 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708424236;
 bh=Jn4KlGjGZRsCuVRdhSCwBpm/GDhuUNf1zkGB+zSEgZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M0PqfJi/cw4OSg20my8Rrj1vpSxzAxo0b/6b5MRjSkH5OTr/1o/WZVcbXgAfIx/+B
 qD1PtdXIWN/dwNTbtUBEDdiMGizvcAWrtF4SaH9raEyV7yOAqY/adiZif4tL9RZdnS
 qsM/DorFhufhmfv8Fss5wvK0g5ShrLo7T0mD8dFdcqJMYY+GYdwRk/1WFj1yrJmGr5
 5TGITcOaby0q6kJ2w2EDSffrv+EJPo3vPsmVI2xZKg7wYlKkpo0vgrfYgX+R9OGPjE
 jVvGixi+vZuZLQtsbvwcngip6m+yfZuXQZ80glqLVlcLWYe3kn5/kITDsjkdcxINeB
 cJgwv4o9YmDag==
Date: Tue, 20 Feb 2024 12:16:54 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Message-ID: <20240220101654.GP5299@atomide.com>
References: <20240219142001.19727-1-tony@atomide.com>
 <20240219142001.19727-2-tony@atomide.com>
 <7ab37c2e-8a28-4ada-a72e-96112b708b06@suse.de>
 <20240220085655.GO5299@atomide.com>
 <56475919-7aaf-47d6-8803-ef9c7673857b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56475919-7aaf-47d6-8803-ef9c7673857b@suse.de>
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

* Thomas Zimmermann <tzimmermann@suse.de> [240220 09:32]:
> Am 20.02.24 um 09:56 schrieb Tony Lindgren:
> > Oh right, yes omapdrm is operating on memory.
> 
> With the latest kernels, you should see a warning if helpers operate on the
> wrong type of memory. [1][2]

OK

> [1] https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/video/fbdev/core/fb_io_fops.c#L16
> [2] https://elixir.bootlin.com/linux/v6.8-rc5/source/drivers/video/fbdev/core/fb_sys_fops.c#L26

> > The following test patch works for me.. Not sure about the tracking though.
> 
> I know that i915 doesn't track mmap'ed pages correctly and I've see systems
> that do not update the framebuffer. IDK how/why this works with omapdrm.

Sounds like the a similar issue might exist on omapdrm too then.

> > Do you mean that tracking needs to be implemented if fb_deferred_io_mmap()
> > did not work?
> 
> omap_fbdev_fb_mmap() appears to mmap the DMA memory pages directly to
> userspace. So the fb_dirty callback won't be invoked when userspace writes
> to this framebuffer memory.
> 
> To implement tracking, you'd need to set fb_mmap to fb_deferred_io_mmap().
> If you init omap_fb_ops with FB_DEFAULT_DEFERRED_OPS(), [3] you'd get that
> automatically. fb_deferred_io_mmap() sets up the tracking whenever
> userspaces writes to a mapped page.   You also need to init the write-back
> mechanisms that calls fb_dirty for the tracked pages. You should be able to
> duplicate the code from [4] into omapdrm.

OK great. Updated test patch below with FB_DEFAULT_DEFERRED_OPS, maybe that's
all there is to it if I follow you :) The fb_dirty part was already done in
patch 1/2.

> [3] https://elixir.bootlin.com/linux/latest/source/include/linux/fb.h#L704
> [4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fbdev_generic.c#L119

Regards,

Tony

8< ---------------------------
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
@@ -76,15 +80,6 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return drm_fb_helper_pan_display(var, fbi);
 }
 
-static int omap_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *helper = info->par;
-	struct drm_framebuffer *fb = helper->fb;
-	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb, 0);
-
-	return drm_gem_mmap_obj(bo, omap_gem_mmap_size(bo), vma);
-}
-
 static void omap_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *helper = info->par;
@@ -94,6 +89,7 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 	DBG();
 
+	fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(helper);
 
 	omap_gem_unpin(bo);
@@ -106,15 +102,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	FB_DEFAULT_DEFERRED_OPS(omap_fbdev),
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
-	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_ioctl	= drm_fb_helper_ioctl,
-	.fb_mmap	= omap_fbdev_fb_mmap,
 	.fb_destroy	= omap_fbdev_fb_destroy,
 };
 
@@ -213,6 +207,15 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
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
