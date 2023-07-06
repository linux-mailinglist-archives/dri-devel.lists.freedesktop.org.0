Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA37749C72
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A9310E45B;
	Thu,  6 Jul 2023 12:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60210E3F7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:49:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5385A1FE6D;
 Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688647749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOyy/62uNr8cje9SfKiZkXapV4SKDd0zvrCRWxeqNm8=;
 b=G2okgRV85+hiZv1gnXOet3WhDGFGVi8B9SzE7i22ZoNsUy5hKvlx68ut7SKCZIZ+IPEYEZ
 uMq+wl49CGeCdloSteE79wh8H8Jxdx7in6pgnOoLMevoAdRrEO6KXIptzzt0IlcpYrR+7O
 M9Cj6shOis51jznfLzxsaNSfxcjh2zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688647749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOyy/62uNr8cje9SfKiZkXapV4SKDd0zvrCRWxeqNm8=;
 b=7wK8ALlV0nVnZl8abOfhytSB1a/RHkVhRIWZfuy1dXsWduq/tXI1mWuGctgd8sPdxZjzfJ
 V8J/Zh6Dk57X7dDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19706138FC;
 Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJxDBUW4pmS7QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 07/11] drm/omapdrm: Set VM flags in GEM-object mmap function
Date: Thu,  6 Jul 2023 14:46:45 +0200
Message-ID: <20230706124905.15134-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706124905.15134-1-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the mmap callback in struct drm_gem_object_funcs to set the
VM flags. Replace a number of mmap helpers in omapdrm with their
GEM helper counterparts. Generate DRM's file-operations instance
with GEM's DEFINE_DRM_GEM_FOPS.

The omapdrm driver uses DRM's drm_gem_mmap() helper to prepare
the VMA structure. It then modifies the resulting VMA state in
its own helper omap_gem_mmap_obj(). The patch improves this by
setting up the VMA in the mmap callback in drm_gem_object_funcs,
which is called from within drm_gem_mmap().

Omapdrm's omap_gem_mmap() and omap_gem_mmap() can then be removed
from the driver. A call to drm_gem_mmap() is sufficient for the
mmap operation.

Finally, with the omap functions gone, the drivers file_ops in
omapdriver_fops can be generated with DEFINE_DRM_GEM_FOPS, which
sets DRM's default helpers.

v2:
	* detailed commit message (Javier)
	* do not set VM_PFNMAP

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c        | 12 +-----------
 drivers/gpu/drm/omapdrm/omap_gem.c        | 24 ++++++-----------------
 drivers/gpu/drm/omapdrm/omap_gem.h        |  3 ---
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |  7 +------
 4 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index e2697fe80e62..afeeb7737552 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -636,17 +636,7 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static const struct file_operations omapdriver_fops = {
-	.owner = THIS_MODULE,
-	.open = drm_open,
-	.unlocked_ioctl = drm_ioctl,
-	.compat_ioctl = drm_compat_ioctl,
-	.release = drm_release,
-	.mmap = omap_gem_mmap,
-	.poll = drm_poll,
-	.read = drm_read,
-	.llseek = noop_llseek,
-};
+DEFINE_DRM_GEM_FOPS(omapdriver_fops);
 
 static const struct drm_driver omap_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM  |
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 6b58a5bb7b44..c48fa531ca32 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -524,26 +524,11 @@ static vm_fault_t omap_gem_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-/** We override mainly to fix up some of the vm mapping flags.. */
-int omap_gem_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	int ret;
-
-	ret = drm_gem_mmap(filp, vma);
-	if (ret) {
-		DBG("mmap failed: %d", ret);
-		return ret;
-	}
-
-	return omap_gem_mmap_obj(vma->vm_private_data, vma);
-}
-
-int omap_gem_mmap_obj(struct drm_gem_object *obj,
-		struct vm_area_struct *vma)
+static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 
-	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP | VM_IO | VM_MIXEDMAP);
 
 	if (omap_obj->flags & OMAP_BO_WC) {
 		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
@@ -563,12 +548,14 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
 		 * address_space (so unmap_mapping_range does what we want,
 		 * in particular in the case of mmap'd dmabufs)
 		 */
-		vma->vm_pgoff = 0;
+		vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 		vma_set_file(vma, obj->filp);
 
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	}
 
+	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
+
 	return 0;
 }
 
@@ -1282,6 +1269,7 @@ static const struct vm_operations_struct omap_gem_vm_ops = {
 static const struct drm_gem_object_funcs omap_gem_object_funcs = {
 	.free = omap_gem_free_object,
 	.export = omap_gem_prime_export,
+	.mmap = omap_gem_object_mmap,
 	.vm_ops = &omap_gem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index 4d4488939f6b..fec3fa0e4c33 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -57,9 +57,6 @@ int omap_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 
 /* mmap() Interface */
-int omap_gem_mmap(struct file *filp, struct vm_area_struct *vma);
-int omap_gem_mmap_obj(struct drm_gem_object *obj,
-		struct vm_area_struct *vma);
 u64 omap_gem_mmap_offset(struct drm_gem_object *obj);
 size_t omap_gem_mmap_size(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 8e194dbc9506..36f9ee4baad3 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -64,13 +64,8 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
 		struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = buffer->priv;
-	int ret = 0;
 
-	ret = drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
-	if (ret < 0)
-		return ret;
-
-	return omap_gem_mmap_obj(obj, vma);
+	return drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
 }
 
 static const struct dma_buf_ops omap_dmabuf_ops = {
-- 
2.41.0

