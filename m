Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60F97ECE3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE77810E400;
	Mon, 23 Sep 2024 14:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UqR1u65e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D7F10E400
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UdCugJq9RHux2ZIoYWz5kxHlsmDHKn+j0qXgHwfdyDE=; b=UqR1u65eXgfylozFvjiLeyXb9e
 8oyjm0RFL6rOBgiTiT0qJlF8yOqMpORykGyoBRcIZCAAtp7c3jwM2Rf7L5645KJCPLCXiXSbfo23S
 iLUsreTCK024bKMnZpbkMWQ4ETWA/ZO7ibosmO5dkXZg6KpJ5SzIzYFx5BXbTNuQgnP0G4Mm14oWS
 TV9ake8zq46MWEOlEnTQE1EU/3qWu+uzigK3R9ZJiezi0tTn/srLp6ZIh/5L0CF1bTFSjje0G61gI
 XDW9Y/JPoWkEqZbo+d92jERh+MGO3iNnnATt6bQ+De/ekGKks2j6LtzPS4pbbczJ6RbI+332qZKX2
 tg/TdB/Q==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjq3-00HYyM-O5; Mon, 23 Sep 2024 16:14:56 +0200
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
Subject: [PATCH v6 09/11] drm/v3d: Use gemfs/THP in BO creation if available
Date: Mon, 23 Sep 2024 10:55:13 -0300
Message-ID: <20240923141348.2422499-10-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923141348.2422499-1-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
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
index 427a1c405b19..cd85f997b058 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -107,6 +107,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 	struct sg_table *sgt;
+	u64 align;
 	int ret;
 
 	/* So far we pin the BO in the MMU for its lifetime, so use
@@ -116,6 +117,15 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
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
@@ -123,7 +133,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
 	 */
 	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
 					 obj->size >> V3D_MMU_PAGE_SHIFT,
-					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
+					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
 	spin_unlock(&v3d->mm_lock);
 	if (ret)
 		return ret;
@@ -143,10 +153,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
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
2.46.0

