Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED58B4BD3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 14:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAA410FE54;
	Sun, 28 Apr 2024 12:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A4DHYB0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318710FE46
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kYNYj5f+Z1NFYznC5SYmgXWBxgAyUeDa2Deh1dFN96Y=; b=A4DHYB0S9EnRJNCPSIX3N5DRtZ
 nIkEubCaxSKG5J4C6KBDntFmzPiivhNn3JUenFqGmrAgCeiYTOfUt6pTt16UT/oc3mVpUj/pNA6rj
 N5+a98mA7MxwRXP3HyfOoTlZnyLEDAEYiTkqH/Y7EA1VsZgpxdAUn3z/Ph+ds9U2qvn5autBnIkR+
 6WzkwKOAZhl7qlXDc70ih1YI5oCyMoylc7rAetkjZy8SgrSBz5al/J194hX5wLAOsy7IOsKCUNqqJ
 73GCqyk54Eiu0RNfZToKWPHS9wRxh3F4iJEL4aMUjuHBEOvelnXvd0wIyhLSBbayH5Z/UQpzW3eaI
 yGJ/Ym5Q==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s13uB-000rbP-NS; Sun, 28 Apr 2024 14:45:19 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 7/8] drm/v3d: Use gemfs/THP in BO creation if available
Date: Sun, 28 Apr 2024 09:40:12 -0300
Message-ID: <20240428124426.309096-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428124426.309096-1-mcanal@igalia.com>
References: <20240428124426.309096-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although Big/Super Pages could appear naturally, it would be quite hard
to have 1MB or 64KB allocated contiguously naturally. Therefore, we can
force the creation of large pages allocated contiguously by using a
mountpoint with "huge=within_size" enabled.

Therefore, as V3D has a mountpoint with "huge=within_size" (if user has
THP enabled), use this mountpoint for BO creation if available. This
will allow us to create large pages allocated contiguously and make use
of Big/Super Pages.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 79e31c5299b1..16ac26c31c6b 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -94,6 +94,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 	struct sg_table *sgt;
+	u64 align;
 	int ret;
 
 	/* So far we pin the BO in the MMU for its lifetime, so use
@@ -103,6 +104,15 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
+	if (!v3d->gemfs)
+		align = SZ_4K;
+	else if (obj->size >= SZ_1M)
+		align = SZ_1M;
+	else if (obj->size >= SZ_64K)
+		align = SZ_64K;
+	else
+		align = SZ_4K;
+
 	spin_lock(&v3d->mm_lock);
 	/* Allocate the object's space in the GPU's page tables.
 	 * Inserting PTEs will happen later, but the offset is for the
@@ -110,7 +120,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	 */
 	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
 					 obj->size >> V3D_MMU_PAGE_SHIFT,
-					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
+					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
 	spin_unlock(&v3d->mm_lock);
 	if (ret)
 		return ret;
@@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 			     size_t unaligned_size)
 {
 	struct drm_gem_shmem_object *shmem_obj;
+	struct v3d_dev *v3d = to_v3d_dev(dev);
 	struct v3d_bo *bo;
 	int ret;
 
-	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
+	/* Let the user opt out of allocating the BOs with THP */
+	if (v3d->gemfs)
+		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
+							  v3d->gemfs);
+	else
+		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
+
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);
-- 
2.44.0

