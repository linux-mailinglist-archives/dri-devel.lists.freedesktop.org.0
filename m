Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28C3A125C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E4E6E8C6;
	Wed,  9 Jun 2021 11:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFA6E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:20:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FBE71FD58;
 Wed,  9 Jun 2021 11:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnv/82/uEe+mIz6yhpeOdfG//15FkUncLx/LmWsKeN8=;
 b=FuIyGzxcA7GgNKkvTlwpnn6kjwOF34sI2vGp7Cshyopr3F8vwD4i52PwKGUHIYsWqS5U13
 D7xTpv6S1PAsit/lhLrB9haGxyyzGExwfBReiFLAzgaBGpncqwmbRtwoIJ/4Zjtm0lTzJ7
 d4W9FXLh0tYIObTE6Cpc0Aj7HBwIrDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnv/82/uEe+mIz6yhpeOdfG//15FkUncLx/LmWsKeN8=;
 b=8PrudITCijMRShhn2OTYjJVPnd+uzcFDtfGBeTDtOp2He5PDfG4ssHt0tTauxHtTDvehbv
 ACaqSeiE6s48xMCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7A51C11A98;
 Wed,  9 Jun 2021 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623237616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnv/82/uEe+mIz6yhpeOdfG//15FkUncLx/LmWsKeN8=;
 b=FuIyGzxcA7GgNKkvTlwpnn6kjwOF34sI2vGp7Cshyopr3F8vwD4i52PwKGUHIYsWqS5U13
 D7xTpv6S1PAsit/lhLrB9haGxyyzGExwfBReiFLAzgaBGpncqwmbRtwoIJ/4Zjtm0lTzJ7
 d4W9FXLh0tYIObTE6Cpc0Aj7HBwIrDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623237616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnv/82/uEe+mIz6yhpeOdfG//15FkUncLx/LmWsKeN8=;
 b=8PrudITCijMRShhn2OTYjJVPnd+uzcFDtfGBeTDtOp2He5PDfG4ssHt0tTauxHtTDvehbv
 ACaqSeiE6s48xMCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id SMj/HO+jwGBTUgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:15 +0000
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
Subject: [PATCH 3/9] drm/mediatek: Implement mmap as GEM object function
Date: Wed,  9 Jun 2021 13:20:06 +0200
Message-Id: <20210609112012.10019-4-tzimmermann@suse.de>
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

The respective mediatek functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 ++------
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 44 +++++++-------------------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  3 --
 3 files changed, 14 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b46bdb8985da..bbfefb29c211 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -300,16 +300,7 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	component_unbind_all(drm->dev, drm);
 }
 
-static const struct file_operations mtk_drm_fops = {
-	.owner = THIS_MODULE,
-	.open = drm_open,
-	.release = drm_release,
-	.unlocked_ioctl = drm_ioctl,
-	.mmap = mtk_drm_gem_mmap,
-	.poll = drm_poll,
-	.read = drm_read,
-	.compat_ioctl = drm_compat_ioctl,
-};
+DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
 /*
  * We need to override this because the device used to import the memory is
@@ -332,7 +323,7 @@ static const struct drm_driver mtk_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = mtk_drm_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
-	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 280ea0d5e840..d0544962cfc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -14,11 +14,14 @@
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 
+static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
+
 static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
 	.free = mtk_drm_gem_free_object,
 	.get_sg_table = mtk_gem_prime_get_sg_table,
 	.vmap = mtk_drm_gem_prime_vmap,
 	.vunmap = mtk_drm_gem_prime_vunmap,
+	.mmap = mtk_drm_gem_object_mmap,
 	.vm_ops = &drm_gem_cma_vm_ops,
 };
 
@@ -145,11 +148,19 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
 	struct mtk_drm_private *priv = obj->dev->dev_private;
 
+	/*
+	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
+	 * whole buffer from the start.
+	 */
+	vma->vm_pgoff = 0;
+
 	/*
 	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
 	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
 	 */
-	vma->vm_flags &= ~VM_PFNMAP;
+	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
 	ret = dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
 			     mtk_gem->dma_addr, obj->size, mtk_gem->dma_attrs);
@@ -159,37 +170,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj,
 	return ret;
 }
 
-int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret)
-		return ret;
-
-	return mtk_drm_gem_object_mmap(obj, vma);
-}
-
-int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_gem_object *obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret)
-		return ret;
-
-	obj = vma->vm_private_data;
-
-	/*
-	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
-	 * whole buffer from the start.
-	 */
-	vma->vm_pgoff = 0;
-
-	return mtk_drm_gem_object_mmap(obj, vma);
-}
-
 /*
  * Allocate a sg_table for this GEM object.
  * Note: Both the table's contents, and the sg_table itself must be freed by
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 6da5ccb4b933..9a359a06cb73 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -39,9 +39,6 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
 					   bool alloc_kmap);
 int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
-int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
-			 struct vm_area_struct *vma);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-- 
2.31.1

