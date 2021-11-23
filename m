Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D291145A56D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4876E886;
	Tue, 23 Nov 2021 14:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8386E86D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:22:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso2428141wml.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zs/CUVLGUkgg0Mmeetef1+lFQcZyZCfqjZa/gpAFc9k=;
 b=BJWs7xWQOwsmhKXBuvGw4AOVJf0T4UhO8xiZqEZh/vPvZMXbnw+Urq4YnCNYK/RjJq
 zqw+8//KZ9jpthCQeAg397QuX7nWoPTr5ZPYL/jDN0p/lZvdnDAM6xDm+GhDNuKb+fNe
 D+ufaEoXkm9cXNsQ0HNyqYNM9XN8al7LI1IVWZyKw963Z8FiE4KIrCxZ0w9rqld3FNUm
 8NZMO3U8yr2vpAkr2yeILe2E/anggh+jA4FIQ4v/AZDYVYJw/FYom5rAfqYDW3nzF5Sk
 nSZfvcRbsK2D2a6B9dxmA4/NUhGDXGBT7KG2ZpUd3XJJ0qCrv2s+WxXb+eDZeSzfE2eF
 g0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zs/CUVLGUkgg0Mmeetef1+lFQcZyZCfqjZa/gpAFc9k=;
 b=66jn1aPOLBJ53cO4Ywir3PZCENUN55GirQ01kK4SgwYnWnC4NSxosv+CdmFJMDSDsC
 g/25g7DJlNoQHcDHIFZ4QelBuisstcVS+pE+JqwqGZDnOVXOiQ8nK9nF3dqrvm/G7iLH
 jwauprsvANv9htqR8pLk7laeuY2JUGb9nT5H/Nsfh3wzL2EUFgAcXRQOcEXPxM0mW+p6
 ZT9/TAl5cWbXcNp8dduN+f3VMfDGLDilgei8b8qxgKJfFvOkYpirFcgle9qtj3MAtVCN
 /SzBF6i+T6vq5pPE/rzxCQ5MVRsEhIv8YEPOSRC97eGOi+dS9eGNuku2sVv9cZUDAsYW
 Z2Ew==
X-Gm-Message-State: AOAM532MEg2Zn7Bip912W3j0B206MWp/8F5CxZtc9mDg57o+ptiU06I5
 kU9gVsk04GSP7tcGLkqaeP0s0+dvkhQ=
X-Google-Smtp-Source: ABdhPJzziBcWJMjfV3QcpKN9Asg0M8E/MHmWxFskjrUoqmrsnXz74QuM50S2j84z1Ic3yjGrdepXhQ==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr3648100wmq.195.1637677318184; 
 Tue, 23 Nov 2021 06:21:58 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 24/26] dma-buf: wait for map to complete for static attachments
Date: Tue, 23 Nov 2021 15:21:09 +0100
Message-Id: <20211123142111.3885-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
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
index ae6ab93c868b..57a7a603f987 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -105,21 +105,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
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

