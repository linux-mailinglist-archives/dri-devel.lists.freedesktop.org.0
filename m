Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D14F56F1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFDD10F2DF;
	Wed,  6 Apr 2022 07:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE2010F2DF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id p23so1586146edi.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=p1oIraT43DCmFRrvIXq7yg7WWW/RZ0K1IMmPkDfaGmk=;
 b=H4FDZMM78TY69dcMik/VKhdoeypIKKVqMFKYP7xELDalqT0ll4k3/4NqQaWjXoKK3k
 fJYBaA+RhJTG2vP37cWoKcspCq6vhCYAYgO4nXNpsjXYnddqvFjEm9BqXPDwXTs4uto1
 OHXbkaMCguL5l6EDbO1B50j8NwrgxInYoQ3rqFX6IhhsxThUjxtdkjfR+e7LD4epwh8t
 /VhQaRsl6at7uVQ5j71fDSUoYE1mr2PkvXJxEyT9vfXWvy/0ODrMt7RkZ9XR9AL2AotE
 ODQE9Etr4ETd5BXJ7xyNFSFWxQ8ACBdRldZMiwSKGh067yjezBMTcsMiB264fjo9m+9W
 lAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=p1oIraT43DCmFRrvIXq7yg7WWW/RZ0K1IMmPkDfaGmk=;
 b=p0/bnhAn/RH2eYELLOTjgkgRBz79uyrJwMJC1SzTY0nm4sdQ+m+x5ULOr6ZO3JI7JM
 jMtMMdnSXWY06oHrm07lHATfP33VRR2bi2TMGOisiaRUTJvvdrVgIFX8ujvjL3WFDK8S
 IgacitJf56FWDAXaGDc0aS/sMCuJgiCJgh38BYPTyz48u9sXXeeYXNZYwfUG6AIkAKWr
 Y9Jz2ulzkFCSOCQO89REHstTngDh8LeO/vgjllCRLWvGT85kuOOfaoMcvQ47/zAoqQjI
 iwa2rLLaFjRfTnHdM2GIZ59L5+IyjBDphrVgHwn1TDdn6Sz3ykkA8kC04GdrV57gyJII
 BNxA==
X-Gm-Message-State: AOAM532SqAIN48fP010KkIHiknYt1QhoqQK+D4o/z9f1DafbGZ3UT0cw
 CMdxG1kV7uEqwXZKpzm6uLx0zhXt3To3Fg==
X-Google-Smtp-Source: ABdhPJxZaNKSpvHrRI9jwq5qdrqc4oi6vDcMqoY33B6tmKKH/gVijvWnKjjSHgdac2sI8SnZ8RNXyg==
X-Received: by 2002:a05:6402:847:b0:419:7fb0:9e29 with SMTP id
 b7-20020a056402084700b004197fb09e29mr7533620edz.45.1649231514446; 
 Wed, 06 Apr 2022 00:51:54 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/16] dma-buf: wait for map to complete for static attachments
Date: Wed,  6 Apr 2022 09:51:29 +0200
Message-Id: <20220406075132.3263-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have previously done that in the individual drivers but it is
more defensive to move that into the common code.

Dynamic attachments should wait for map operations to complete by themselves.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-buf.c                   | 18 +++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +-------------
 drivers/gpu/drm/nouveau/nouveau_prime.c     | 17 +----------------
 drivers/gpu/drm/radeon/radeon_prime.c       | 16 +++-------------
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1cddb65eafda..79795857be3e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -661,12 +661,24 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
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

