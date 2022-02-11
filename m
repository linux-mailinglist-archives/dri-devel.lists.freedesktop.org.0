Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51874B265B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4969710EBF8;
	Fri, 11 Feb 2022 12:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1E10EBD0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:26 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id co28so16386207edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c/qkFCHvzHPX7E3ZHwZBUbVbbsZQppRk5q1UJfjX894=;
 b=cq3fEJc++tDzdeeG3rr6ZaVneGq9aDGPt+MEv8lHcKmA6a6g1gCzfTOMlrLMkD6jNf
 VZTME1DPv5YNWBsD/4Y4srPSPOJV59hkt81KkZetSM+oG5a0stztfDbnI4Uscz/ukDZ4
 t3jrVkQDX8kFindUGeDvDDQhO0YuX0dT/57c9ZKsaix7NGJ/ogTUGNYYTaAq3P5ZeAzE
 RsmTB3Cs27eXtQztOlEigkacmRPtz/sxq3DM+s0TjTF/QB4jqaeofPaa9QmhxLdk7Tu5
 vgIS1Rz9tQqOdfze/aRuXWxCAQCkVKLVKnMlnF4TgLNLKFUCMJ6EgT1PMn6y2nLZOTwe
 91Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/qkFCHvzHPX7E3ZHwZBUbVbbsZQppRk5q1UJfjX894=;
 b=1dRToraMOnm5HKifyrejN6P7k05dDKU1bKA+2JSUxDEHVuJa8bEnDP1JhKRDOUJlg+
 Wq3YDj6PH2aZT30xCT4v5AmCABgC2IjQjMLdO4lH3n2OvtQ9eWcvBgUPLYsz7hOIlTDx
 MQ8j8d6n+5/hgF+LXJcB8AF/KqZ6bSUdiY3mHROELg7iKyh4eSlmA68wsWUGMWx90eFV
 39KcnbUauaBzsivDZZxC9c6UY2XxuDBa0LhCAUBcARw+eqXPj0VVIqDWW05Xt30TKi4m
 NLYctE7mRbfUdEMOrOs10cRhjoH2PNwkwaN623L/y4bvGZxBSLvZTlH1LZl9hZJpqWdK
 K5fw==
X-Gm-Message-State: AOAM5301Xlqw7Db4TEO/XiM4Je7VRz0MbToe45/alTxgYtkZ5owC5Wx7
 ue1J363dxr6xxvdnb17RdZQ=
X-Google-Smtp-Source: ABdhPJxt5TWB8ADo1NwjbMsZpA3ni8O9j91qJ/zL1BiSf9KqOuKcsizFX0w/sb6XUtgFshha5qlLtQ==
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr1693272edb.83.1644583824768; 
 Fri, 11 Feb 2022 04:50:24 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 21/23] dma-buf: wait for map to complete for static attachments
Date: Fri, 11 Feb 2022 13:50:01 +0100
Message-Id: <20220211125003.918447-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

We have previously done that in the individual drivers but it is
more defensive to move that into the common code.

Dynamic attachments should wait for map operations to complete by themselves.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                   | 18 +++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +-------------
 drivers/gpu/drm/nouveau/nouveau_prime.c     | 17 +----------------
 drivers/gpu/drm/radeon/radeon_prime.c       | 16 +++-------------
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 528983d3ba64..d3dd602c4753 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -660,12 +660,24 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
 				       enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
+	signed long ret;
 
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+	if (IS_ERR_OR_NULL(sg_table))
+		return sg_table;
+
+	if (!dma_buf_attachment_is_dynamic(attach)) {
+		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
+					    DMA_RESV_USAGE_KERNEL, true,
+					    MAX_SCHEDULE_TIMEOUT);
+		if (ret < 0) {
+			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
+							   direction);
+			return ERR_PTR(ret);
+		}
+	}
 
-	if (!IS_ERR_OR_NULL(sg_table))
-		mangle_sg_table(sg_table);
-
+	mangle_sg_table(sg_table);
 	return sg_table;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 579adfafe4d0..782cbca37538 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -102,21 +102,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	int r;
 
 	/* pin buffer into GTT */
-	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
-	if (r)
-		return r;
-
-	if (bo->tbo.moving) {
-		r = dma_fence_wait(bo->tbo.moving, true);
-		if (r) {
-			amdgpu_bo_unpin(bo);
-			return r;
-		}
-	}
-	return 0;
+	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
 }
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 60019d0532fc..347488685f74 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -93,22 +93,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 	if (ret)
 		return -EINVAL;
 
-	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
-	if (ret)
-		goto error;
-
-	if (nvbo->bo.moving)
-		ret = dma_fence_wait(nvbo->bo.moving, true);
-
-	ttm_bo_unreserve(&nvbo->bo);
-	if (ret)
-		goto error;
-
-	return ret;
-
-error:
-	nouveau_bo_unpin(nvbo);
-	return ret;
+	return 0;
 }
 
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index 4a90807351e7..42a87948e28c 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -77,19 +77,9 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 
 	/* pin buffer into GTT */
 	ret = radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
-	if (unlikely(ret))
-		goto error;
-
-	if (bo->tbo.moving) {
-		ret = dma_fence_wait(bo->tbo.moving, false);
-		if (unlikely(ret)) {
-			radeon_bo_unpin(bo);
-			goto error;
-		}
-	}
-
-	bo->prime_shared_count++;
-error:
+	if (likely(ret == 0))
+		bo->prime_shared_count++;
+
 	radeon_bo_unreserve(bo);
 	return ret;
 }
-- 
2.25.1

