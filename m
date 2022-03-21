Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B84E3267
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 22:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96B10E490;
	Mon, 21 Mar 2022 21:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1989 seconds by postgrey-1.36 at gabe;
 Mon, 21 Mar 2022 21:46:59 UTC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F0C10E490
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UxVnGroyv95bnhNLjHCmBweTO25U8rXxdLTQZ0CUFxg=; b=ChedVT+7B/T39CHBClrpYs3jZj
 N02A9+7/GjMG75Zejvyrnmt+eh8ZUAnETnSQyVcHFpJR0Zl9YcstIV8KbZW3SKXYQxDV1bLEBGnWk
 Kqe/YzykXnN3qAxcw/omDYjLyz2nK9wkeywm5weibie9iekj8UAYuRjtz4dGWLBhIdPmvWcBXpvFq
 Lw3CYuojEmkXWxqw3/OZ9fd7xLzZvGMv1eZgUcFyhkgM1YsUbUQnYyKeXfQUCwCXvx99BYnOQpDhH
 t8jWasPtSTgxEy+vI+HD73N/mmyDT/UHDDFcb/gVPU3fhiT8ArrsI8v7IuwA+iep+3+QM0bd+Fvks
 hKJKoLCQ==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nWPLi-0000ww-Co; Mon, 21 Mar 2022 22:13:58 +0100
From: Melissa Wen <mwen@igalia.com>
To: emma@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/2] drm/v3d: replace obj lookup steps with
 drm_gem_objects_lookup
Date: Mon, 21 Mar 2022 20:13:16 -0100
Message-Id: <20220321211316.1423294-3-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321211316.1423294-1-mwen@igalia.com>
References: <20220321211316.1423294-1-mwen@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As v3d_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
replace the explicit code in v3d to simply use the DRM function.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 49 +++--------------------------------
 1 file changed, 3 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 926bfc7e07fb..738b1080143d 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -294,10 +294,6 @@ v3d_lookup_bos(struct drm_device *dev,
 	       u64 bo_handles,
 	       u32 bo_count)
 {
-	u32 *handles;
-	int ret = 0;
-	int i;
-
 	job->bo_count = bo_count;
 
 	if (!job->bo_count) {
@@ -308,48 +304,9 @@ v3d_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	job->bo = kvmalloc_array(job->bo_count,
-				 sizeof(struct drm_gem_cma_object *),
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

