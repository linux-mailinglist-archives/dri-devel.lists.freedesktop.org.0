Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456393A124A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE37B6E879;
	Wed,  9 Jun 2021 11:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CE46E871
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:20:16 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 776951FD3C;
 Wed,  9 Jun 2021 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWjkH2kYcjIAyzh3jD5msWYfe6YCZBpfuuajwa0m0a0=;
 b=IAtem6UO8ka5vH8Cg0PiSS22RvapW/ocX82RQpxPce0FBd+pNl5jb95flgADByK2rDHLNJ
 TgWWF4pzyQr9HgUSWj/A+2DROM9qvqfJkHjg5jrOJR73IgD07UeB7RsvawTyl0Rdu6+TSo
 b6c+g9ojK56kuA4P6Kt5boUu456N7KU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWjkH2kYcjIAyzh3jD5msWYfe6YCZBpfuuajwa0m0a0=;
 b=lXxXVlzUjbUFpw5VOvZWcN4FvwlBG+8u52/vI+U5dqir13Xr1GeRq2LFg+XWZsi3Av4+Y3
 8D6XS5wGDQOOuBBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CCF60118DD;
 Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWjkH2kYcjIAyzh3jD5msWYfe6YCZBpfuuajwa0m0a0=;
 b=IAtem6UO8ka5vH8Cg0PiSS22RvapW/ocX82RQpxPce0FBd+pNl5jb95flgADByK2rDHLNJ
 TgWWF4pzyQr9HgUSWj/A+2DROM9qvqfJkHjg5jrOJR73IgD07UeB7RsvawTyl0Rdu6+TSo
 b6c+g9ojK56kuA4P6Kt5boUu456N7KU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWjkH2kYcjIAyzh3jD5msWYfe6YCZBpfuuajwa0m0a0=;
 b=lXxXVlzUjbUFpw5VOvZWcN4FvwlBG+8u52/vI+U5dqir13Xr1GeRq2LFg+XWZsi3Av4+Y3
 8D6XS5wGDQOOuBBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yDM8Me6jwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com,
 sean@poorly.run, airlied@redhat.com, kraxel@redhat.com, hjc@rock-chips.com,
 heiko@sntech.de, oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH 2/9] drm/exynox: Implement mmap as GEM object function
Date: Wed,  9 Jun 2021 13:20:05 +0200
Message-Id: <20210609112012.10019-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609112012.10019-1-tzimmermann@suse.de>
References: <20210609112012.10019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective exynos functions are being removed. The file_operations
structure exynos_drm_driver_fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 13 ++-----
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 20 ++---------
 drivers/gpu/drm/exynos/exynos_drm_gem.c   | 43 +++++------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |  5 ---
 4 files changed, 13 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index e60257f1f24b..1d46751cad02 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -102,16 +102,7 @@ static const struct drm_ioctl_desc exynos_ioctls[] = {
 			DRM_RENDER_ALLOW),
 };
 
-static const struct file_operations exynos_drm_driver_fops = {
-	.owner		= THIS_MODULE,
-	.open		= drm_open,
-	.mmap		= exynos_drm_gem_mmap,
-	.poll		= drm_poll,
-	.read		= drm_read,
-	.unlocked_ioctl	= drm_ioctl,
-	.compat_ioctl = drm_compat_ioctl,
-	.release	= drm_release,
-};
+DEFINE_DRM_GEM_FOPS(exynos_drm_driver_fops);
 
 static const struct drm_driver exynos_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM
@@ -124,7 +115,7 @@ static const struct drm_driver exynos_drm_driver = {
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
-	.gem_prime_mmap		= exynos_drm_gem_prime_mmap,
+	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.ioctls			= exynos_ioctls,
 	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
 	.fops			= &exynos_drm_driver_fops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 5147f5929be7..02c97b9ca926 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
 
@@ -39,25 +40,8 @@ static int exynos_drm_fb_mmap(struct fb_info *info,
 	struct drm_fb_helper *helper = info->par;
 	struct exynos_drm_fbdev *exynos_fbd = to_exynos_fbdev(helper);
 	struct exynos_drm_gem *exynos_gem = exynos_fbd->exynos_gem;
-	unsigned long vm_size;
-	int ret;
-
-	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
-
-	vm_size = vma->vm_end - vma->vm_start;
-
-	if (vm_size > exynos_gem->size)
-		return -EINVAL;
 
-	ret = dma_mmap_attrs(to_dma_dev(helper->dev), vma, exynos_gem->cookie,
-			     exynos_gem->dma_addr, exynos_gem->size,
-			     exynos_gem->dma_attrs);
-	if (ret < 0) {
-		DRM_DEV_ERROR(to_dma_dev(helper->dev), "failed to mmap.\n");
-		return ret;
-	}
-
-	return 0;
+	return drm_gem_prime_mmap(&exynos_gem->base, vma);
 }
 
 static const struct fb_ops exynos_drm_fb_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4396224227d1..c4b63902ee7a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -17,6 +17,8 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_gem.h"
 
+static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+
 static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 {
 	struct drm_device *dev = exynos_gem->base.dev;
@@ -135,6 +137,7 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
 	.free = exynos_drm_gem_free_object,
 	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
+	.mmap = exynos_drm_gem_mmap,
 	.vm_ops = &exynos_drm_gem_vm_ops,
 };
 
@@ -354,12 +357,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	return 0;
 }
 
-static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
-				   struct vm_area_struct *vma)
+static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
 	int ret;
 
+	if (obj->import_attach)
+		return dma_buf_mmap(obj->dma_buf, vma, 0);
+
+	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+
 	DRM_DEV_DEBUG_KMS(to_dma_dev(obj->dev), "flags = 0x%x\n",
 			  exynos_gem->flags);
 
@@ -385,26 +392,6 @@ static int exynos_drm_gem_mmap_obj(struct drm_gem_object *obj,
 	return ret;
 }
 
-int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_gem_object *obj;
-	int ret;
-
-	/* set vm_area_struct. */
-	ret = drm_gem_mmap(filp, vma);
-	if (ret < 0) {
-		DRM_ERROR("failed to mmap.\n");
-		return ret;
-	}
-
-	obj = vma->vm_private_data;
-
-	if (obj->import_attach)
-		return dma_buf_mmap(obj->dma_buf, vma, 0);
-
-	return exynos_drm_gem_mmap_obj(obj, vma);
-}
-
 /* low-level interface prime helpers */
 struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
@@ -466,15 +453,3 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 	exynos_gem->sgt = sgt;
 	return &exynos_gem->base;
 }
-
-int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
-			      struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	return exynos_drm_gem_mmap_obj(obj, vma);
-}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index a23272fb96fb..79d7e1a87419 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -96,9 +96,6 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
 			       struct drm_mode_create_dumb *args);
 
-/* set vm_flags and we can change the vm attribute to other one at here. */
-int exynos_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-
 /* low-level interface prime helpers */
 struct drm_gem_object *exynos_drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf);
@@ -107,7 +104,5 @@ struct drm_gem_object *
 exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
 				     struct dma_buf_attachment *attach,
 				     struct sg_table *sgt);
-int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
-			      struct vm_area_struct *vma);
 
 #endif
-- 
2.31.1

