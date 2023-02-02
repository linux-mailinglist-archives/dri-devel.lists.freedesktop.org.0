Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF9687C60
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADD210E1F5;
	Thu,  2 Feb 2023 11:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5E10E1DB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tj/KSPf2f15862aIu6GhFIR/wTrItEHL2uP2vgTD9kg=; b=KnleNFAssK1WyQBPNb+MUYsZq2
 inurMh5TzC+TgO1BPiGcAfaBka+cBldKSjZhEUodRZ2VH1VXIw8g1U6fZCDXWyh8smd+7rd/g/aQM
 8NexB+J5PHSD/PF2LQ3I0uTs+gE+IZDXVihM4ZWjdxEhnXWF0tANz6tawrwK5l4UUxxMZXwQV06B8
 9OQDSjI5dQ/+6waDGHRmucikOESMmaNTFBlpoFPvfpi81JitHs3kVEHihDXUQcfD8yc4n3uAzt74I
 yKhHE4Qak61lzIV4GAA9L7lewGMWXdL1XlMpCwV0C/7x7NVmGE6lzLO6PR4pFXfreFhe5s+gVTvkL
 PB4EXv1Q==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pNXqJ-007IGk-Og; Thu, 02 Feb 2023 12:33:28 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v2 2/2] drm/vc4: replace obj lookup steps with
 drm_gem_objects_lookup
Date: Thu,  2 Feb 2023 08:19:44 -0300
Message-Id: <20230202111943.111757-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111943.111757-1-mcanal@igalia.com>
References: <20230202111943.111757-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As vc4_cl_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
replace the open-coded implementation in vc4 to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 43 ++---------------------------------
 1 file changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index d6985d067e34..03648f954985 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -746,7 +746,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		  struct vc4_exec_info *exec)
 {
 	struct drm_vc4_submit_cl *args = exec->args;
-	uint32_t *handles;
 	int ret = 0;
 	int i;
 
@@ -760,43 +759,8 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	exec->bo = kvmalloc_array(exec->bo_count,
-				    sizeof(struct drm_gem_dma_object *),
-				    GFP_KERNEL | __GFP_ZERO);
-	if (!exec->bo) {
-		DRM_ERROR("Failed to allocate validated BO pointers\n");
-		return -ENOMEM;
-	}
-
-	handles = kvmalloc_array(exec->bo_count, sizeof(uint32_t), GFP_KERNEL);
-	if (!handles) {
-		ret = -ENOMEM;
-		DRM_ERROR("Failed to allocate incoming GEM handles\n");
-		goto fail;
-	}
-
-	if (copy_from_user(handles, u64_to_user_ptr(args->bo_handles),
-			   exec->bo_count * sizeof(uint32_t))) {
-		ret = -EFAULT;
-		DRM_ERROR("Failed to copy in GEM handles\n");
-		goto fail;
-	}
-
-	spin_lock(&file_priv->table_lock);
-	for (i = 0; i < exec->bo_count; i++) {
-		struct drm_gem_object *bo = idr_find(&file_priv->object_idr,
-						     handles[i]);
-		if (!bo) {
-			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
-				  i, handles[i]);
-			ret = -EINVAL;
-			break;
-		}
-
-		drm_gem_object_get(bo);
-		exec->bo[i] = bo;
-	}
-	spin_unlock(&file_priv->table_lock);
+	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
+				     exec->bo_count, &exec->bo);
 
 	if (ret)
 		goto fail_put_bo;
@@ -807,7 +771,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 			goto fail_dec_usecnt;
 	}
 
-	kvfree(handles);
 	return 0;
 
 fail_dec_usecnt:
@@ -827,8 +790,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 	for (i = 0; i < exec->bo_count && exec->bo[i]; i++)
 		drm_gem_object_put(exec->bo[i]);
 
-fail:
-	kvfree(handles);
 	kvfree(exec->bo);
 	exec->bo = NULL;
 	return ret;
-- 
2.39.1

