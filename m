Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A654465B24C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE58210E32A;
	Mon,  2 Jan 2023 12:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4095B10E325
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EkIim5Qhdei/GZrIFCByhOVnCoe77Q9TQDRbE5UKI+A=; b=qQJiuydB5TEIFJHXgTHppFD/YY
 /vZPKkyMU+bIKPS6PIugb2Z7D2w30gemoD+07tjpy6kfcwx7VLPfM3lcJqdKEvZeDirjyOGWvpsO/
 H60iymM4Ez8Qx6BIXk4bp9oy1cicalGyyNIfgME88yfAt/ODMcoUbT/1ZmXr4UZjm+ROwfNYjZiqS
 hIrI3FmCsVwwBDhsq8M5GwqchEDM0Zkk9/YXQkqYVHx8kXFs3yMgPWXEXB9bb/VnZqVOye0tVj9Rn
 Zs4atbtfi5To9B4f3DJc8K09e3JPdzF0eo+VMBtfvvxmPhceddbTZacqjAA/zDMQD3owab/BoNZ0a
 HcyXKpJg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCKCQ-00FGSv-EC; Mon, 02 Jan 2023 13:45:55 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/vc4: replace obj lookup steps with
 drm_gem_objects_lookup
Date: Mon,  2 Jan 2023 09:45:35 -0300
Message-Id: <20230102124535.139202-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102124535.139202-1-mcanal@igalia.com>
References: <20230102124535.139202-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As vc4_cl_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
replace the open-coded implementation in vc4 to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
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
2.38.1

