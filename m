Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4744E28E5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78B10E43C;
	Mon, 21 Mar 2022 13:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADFD892AA
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h4so2855855wrc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/qkFCHvzHPX7E3ZHwZBUbVbbsZQppRk5q1UJfjX894=;
 b=lcLDz/Aqi0znYRtoPs7A0YuC2tMlLGU3Rq3r27Vk//xWb74WITGexUWIbbzTlhoqDo
 pnDvYP/nh5sbPB1P6d/xpSvRP7zU0bY/9clyRG+nVXMo9j3eqbldQtzGvYOCXQ6H03i9
 BUstF/ShaSZbrNnpSjNRSz9iMPpH5pkvFWRY4HGU5b+Ol5v+i3wQVFpSXS2bczTsI+dZ
 aKYJQ5bD0uDs9OweI6XAM8zsvsojHtdVO15aPVzhtbd/RbYQ/FZtXreB3QkS2nV4xTia
 PAmuaTTk9VzN1nGV9Ha+ZbHWy5RPJ42ioyjbGXqw5kGTWWNQ94SIQLYb1LK0S/lpTsJD
 dlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/qkFCHvzHPX7E3ZHwZBUbVbbsZQppRk5q1UJfjX894=;
 b=NgASdxgLauTGakjGFp3GTCeNpm8KmtyONrXEJxwJmxm7Lc+BsWa7j/uQk5Bue/EP3N
 kHch3xLIef2WgcP2hHF5WIMB5voE+8HL2d3merw9HRWgsS/VW5dOnMPonyOEXeqRZLLD
 C4Ny5TiJQan3Bq+WayJeXYY8U6pO4uAnmQHMY4MFEaItjlTukcGPi8PilYR7I2D/DrRk
 aeXVoJ0/Oo0gYQ2uIR+hsg9Cycxpqiff/93NhDAQtfK11T+Cvk94gFmseruyOa3AgYt9
 pd4era/jbI4eUUSF9fF3jQjNK5PbvB+RamEtqSio3KZ4XxLak5DAlULGIhRpKrsXXNKl
 NQZA==
X-Gm-Message-State: AOAM5321zdelXjPiJMo9rvHUW227IJFqtIJpicanETEFAIr0KxJ79Bky
 LyXi9n22e7VE/197tWxYFXJmS/LNK24=
X-Google-Smtp-Source: ABdhPJzhhV6i/AX9b6w+KqGrrDuNIKsFKozZ8FJw3tkktaYqQUYGlZRhTN6ohww6Ne6fPQ9VSQCmrA==
X-Received: by 2002:a05:6000:1541:b0:204:18a5:5195 with SMTP id
 1-20020a056000154100b0020418a55195mr2455864wry.148.1647871158606; 
 Mon, 21 Mar 2022 06:59:18 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/23] dma-buf: wait for map to complete for static attachments
Date: Mon, 21 Mar 2022 14:58:54 +0100
Message-Id: <20220321135856.1331-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

