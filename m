Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26AB3B2AD2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2E6EA42;
	Thu, 24 Jun 2021 08:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D166EA42;
 Thu, 24 Jun 2021 08:58:04 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35C7C21956;
 Thu, 24 Jun 2021 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h2DIkcYhSHhjdGevdXaUI25Y2wjLHj15VeFtSdpnndQ=;
 b=1fgUVJka//y7Ks1Gj4wehdj4nwWxXic4Uy5EUOt2gOsG0PrSykRsYH3oqwdsBrUKfFQSnu
 n/+WNi8WUylYkC1BsyA+l+wgBz02TQOcl675IHX1q8YcvbFOvC5d7+4AAZABhKlSnwykRz
 JW9YVqduZBe2MSu2I4FyuIGdPG7qmXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h2DIkcYhSHhjdGevdXaUI25Y2wjLHj15VeFtSdpnndQ=;
 b=atUpWkYhIadpnehgduqsSX82ExzgoVowL5w34I6y7ZoRk/kXtReY1eLgioDUkuIOY+kQ9w
 Mx9bhOc+//vFymDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 04B5411A97;
 Thu, 24 Jun 2021 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h2DIkcYhSHhjdGevdXaUI25Y2wjLHj15VeFtSdpnndQ=;
 b=1fgUVJka//y7Ks1Gj4wehdj4nwWxXic4Uy5EUOt2gOsG0PrSykRsYH3oqwdsBrUKfFQSnu
 n/+WNi8WUylYkC1BsyA+l+wgBz02TQOcl675IHX1q8YcvbFOvC5d7+4AAZABhKlSnwykRz
 JW9YVqduZBe2MSu2I4FyuIGdPG7qmXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=h2DIkcYhSHhjdGevdXaUI25Y2wjLHj15VeFtSdpnndQ=;
 b=atUpWkYhIadpnehgduqsSX82ExzgoVowL5w34I6y7ZoRk/kXtReY1eLgioDUkuIOY+kQ9w
 Mx9bhOc+//vFymDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id fdU1ABtJ1GBkMQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 08:58:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/etnaviv: Implement mmap as GEM object function
Date: Thu, 24 Jun 2021 10:58:00 +0200
Message-Id: <20210624085800.7941-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

The respective etnaviv functions are being removed. The file_operations
structure fops is now being created by the helper macro
DEFINE_DRM_GEM_FOPS().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  3 ---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 18 +++++-------------
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 -------------
 4 files changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index f0a07278ad04..7dcc6392792d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -468,17 +468,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-static const struct file_operations fops = {
-	.owner              = THIS_MODULE,
-	.open               = drm_open,
-	.release            = drm_release,
-	.unlocked_ioctl     = drm_ioctl,
-	.compat_ioctl       = drm_compat_ioctl,
-	.poll               = drm_poll,
-	.read               = drm_read,
-	.llseek             = no_llseek,
-	.mmap               = etnaviv_gem_mmap,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
@@ -487,7 +477,7 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
-	.gem_prime_mmap     = etnaviv_gem_prime_mmap,
+	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 003288ebd896..049ae87de9be 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -47,12 +47,9 @@ struct etnaviv_drm_private {
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
 struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma);
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sg);
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..8f1b5af47dd6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -130,8 +130,7 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 {
 	pgprot_t vm_page_prot;
 
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP;
+	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 
 	vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
@@ -154,19 +153,11 @@ static int etnaviv_gem_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 	return 0;
 }
 
-int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+static int etnaviv_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
-	struct etnaviv_gem_object *obj;
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret) {
-		DBG("mmap failed: %d", ret);
-		return ret;
-	}
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
-	obj = to_etnaviv_bo(vma->vm_private_data);
-	return obj->ops->mmap(obj, vma);
+	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
 }
 
 static vm_fault_t etnaviv_gem_fault(struct vm_fault *vmf)
@@ -567,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
+	.mmap = etnaviv_gem_mmap,
 	.vm_ops = &vm_ops,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index d741b1d735f7..6d8bed9c739d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -34,19 +34,6 @@ int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
 	return 0;
 }
 
-int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
-			   struct vm_area_struct *vma)
-{
-	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	int ret;
-
-	ret = drm_gem_mmap_obj(obj, obj->size, vma);
-	if (ret < 0)
-		return ret;
-
-	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
-}
-
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach) {
-- 
2.32.0

