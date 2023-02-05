Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784068AFCC
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 13:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED85F10E0E0;
	Sun,  5 Feb 2023 12:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Sun, 05 Feb 2023 12:57:49 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2C910E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 12:57:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 09FF9423B9;
 Sun,  5 Feb 2023 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1675601525;
 bh=q0LNgqsfGLVJB6RizLXffwvd+oFT2Fg0IE4QerrJfd0=;
 h=From:To:Cc:Subject:Date;
 b=Xt+nlv7YZI4F8qZkOLOserjbvP/Ase1HK8RipD68mIthYaXCMAxz7k/GADvHZb97d
 B9WafGbp6VQaZJKHeX2iyuWMoli/QAWFzvq2TR5lmUPf/JSD8sLJTF5PFb24VbFcBl
 tKcqJwdpiOYgsBIErlgFnF3mTswqmzQ4ZxYdN9jN0vkW8bHRq7PU1/H5e82mFpyrrs
 NM1qKf207KL9Pml9f44U+wnlulDshDVQyjBpJe6k0Jom7hKA0TLIYc7UQBgS//eF0P
 32iFI9OqXft7piz1QRkz4JB6kfcpcpHizh1Qdy9RGnZ46V7J3hf+eKZG8XfLWCbjNG
 XmXeTjql3ZVbA==
From: Asahi Lina <lina@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
Date: Sun,  5 Feb 2023 21:51:24 +0900
Message-Id: <20230205125124.2260-1-lina@asahilina.net>
X-Mailer: git-send-email 2.35.1
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
Cc: Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other functions touching shmem->sgt take the pages lock, so do that here
too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
_locked() variants to avoid recursive locking.

Discovered while auditing locking to write the Rust abstractions.

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 54 ++++++++++++++++----------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index b602cd72a120..2c559b310cad 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -681,23 +681,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 
-/**
- * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
- *				 scatter/gather table for a shmem GEM object.
- * @shmem: shmem GEM object
- *
- * This function returns a scatter/gather table suitable for driver usage. If
- * the sg table doesn't exist, the pages are pinned, dma-mapped, and a sg
- * table created.
- *
- * This is the main function for drivers to get at backing storage, and it hides
- * and difference between dma-buf imported and natively allocated objects.
- * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
- *
- * Returns:
- * A pointer to the scatter/gather table of pinned pages or errno on failure.
- */
-struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
+static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
@@ -708,7 +692,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 
 	WARN_ON(obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages(shmem);
+	ret = drm_gem_shmem_get_pages_locked(shmem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -730,10 +714,40 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages(shmem);
+	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
+
+/**
+ * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
+ *				 scatter/gather table for a shmem GEM object.
+ * @shmem: shmem GEM object
+ *
+ * This function returns a scatter/gather table suitable for driver usage. If
+ * the sg table doesn't exist, the pages are pinned, dma-mapped, and a sg
+ * table created.
+ *
+ * This is the main function for drivers to get at backing storage, and it hides
+ * and difference between dma-buf imported and natively allocated objects.
+ * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
+ *
+ * Returns:
+ * A pointer to the scatter/gather table of pinned pages or errno on failure.
+ */
+struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+	struct sg_table *sgt;
+
+	ret = mutex_lock_interruptible(&shmem->pages_lock);
+	if (ret)
+		return ERR_PTR(ret);
+	sgt = drm_gem_shmem_get_pages_sgt_locked(shmem);
+	mutex_unlock(&shmem->pages_lock);
+
+	return sgt;
+}
+EXPORT_SYMBOL(drm_gem_shmem_get_pages_sgt);
 
 /**
  * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
-- 
2.35.1

