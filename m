Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF36429F7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 14:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FD089023;
	Mon,  5 Dec 2022 13:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0310E073
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uZS2YlPKAGNQfivHgbSmAIM4sCwER+o4TAV8vJgXz8w=; b=HQzjLtssEbTdGTtTKrUBJwnOTz
 MiF8nXG+Hezn7PDo6Ng86NCQen4xchs8gTaWqFbsDdFlu8PvGHvbdSgl0ol3PimDCDQ3Ocqyf1EIH
 P9HoMg/vYHx3tJkDPD7iohCTszKcCixnTxgeqqa+Ere+AAKmfu6ym+82OZSMaBzQPn9m+olJywzkW
 zzvIZtAmwo1KJSJF5fAmYb3KjKRNQ1miuEF0SivIYU4Q4XcLQx8lHQKJeHPWiA93c1A7xSaxy5qGG
 9xuk+luZKmMQFkjRnFU2UlrJ2wdQK/ZbPwQJ4RlFbCJJIPmK8HZra7I/np8xCk3zbNNuZf9m+eKa+
 biuln9zA==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p2Bx9-00FUSn-Vl; Mon, 05 Dec 2022 14:56:16 +0100
From: Melissa Wen <mwen@igalia.com>
To: emma@anholt.net,
	mwen@igalia.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 2/2] drm/v3d: replace obj lookup steps with
 drm_gem_objects_lookup
Date: Mon,  5 Dec 2022 12:55:38 -0100
Message-Id: <20221205135538.3545051-3-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221205135538.3545051-1-mwen@igalia.com>
References: <20221205135538.3545051-1-mwen@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maira Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As v3d_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
replace the explicit code in v3d to simply use the DRM function.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 49 +++--------------------------------
 1 file changed, 3 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 31a37572c11d..6e152ef26358 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -299,10 +299,6 @@ v3d_lookup_bos(struct drm_device *dev,
 	       u64 bo_handles,
 	       u32 bo_count)
 {
-	u32 *handles;
-	int ret = 0;
-	int i;
-
 	job->bo_count = bo_count;
 
 	if (!job->bo_count) {
@@ -313,48 +309,9 @@ v3d_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	job->bo = kvmalloc_array(job->bo_count,
-				 sizeof(struct drm_gem_dma_object *),
-				 GFP_KERNEL | __GFP_ZERO);
-	if (!job->bo) {
-		DRM_DEBUG("Failed to allocate validated BO pointers\n");
-		return -ENOMEM;
-	}
-
-	handles = kvmalloc_array(job->bo_count, sizeof(u32), GFP_KERNEL);
-	if (!handles) {
-		ret = -ENOMEM;
-		DRM_DEBUG("Failed to allocate incoming GEM handles\n");
-		goto fail;
-	}
-
-	if (copy_from_user(handles,
-			   (void __user *)(uintptr_t)bo_handles,
-			   job->bo_count * sizeof(u32))) {
-		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
-		goto fail;
-	}
-
-	spin_lock(&file_priv->table_lock);
-	for (i = 0; i < job->bo_count; i++) {
-		struct drm_gem_object *bo = idr_find(&file_priv->object_idr,
-						     handles[i]);
-		if (!bo) {
-			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
-				  i, handles[i]);
-			ret = -ENOENT;
-			spin_unlock(&file_priv->table_lock);
-			goto fail;
-		}
-		drm_gem_object_get(bo);
-		job->bo[i] = bo;
-	}
-	spin_unlock(&file_priv->table_lock);
-
-fail:
-	kvfree(handles);
-	return ret;
+	return drm_gem_objects_lookup(file_priv,
+				      (void __user *)(uintptr_t)bo_handles,
+				      job->bo_count, &job->bo);
 }
 
 static void
-- 
2.35.1

