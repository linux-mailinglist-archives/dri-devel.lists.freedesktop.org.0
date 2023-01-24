Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CAD6798B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE92A10E061;
	Tue, 24 Jan 2023 12:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914CC10E0D3;
 Tue, 24 Jan 2023 12:57:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y1so9295301wru.2;
 Tue, 24 Jan 2023 04:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PwhSDAumxkjQrKJd6Mnxfh/VbizL60GsiC8beXpG6DE=;
 b=Jxue84jMvcZME7Ce1VpqOd6ENGobGLsLnzqkzfvyR/F1sEUOf+oZHHNVssNScr+Hiq
 CdeUdayDdUPTnKGPyGcDXAEk17lOL0mrog71Te4aLOatZPzszMLVdOyzsqKSLPH/Tlyg
 HVgUWorK/q2rRu/7U5PuLKSJY/6DjVzcDkqcrdR5Jsgu7iubgp4zCYyEFzwP2sNx/M3I
 ccxglWQC06eaZNeyapk8vkn+5MB6IqiVjAWwrgiXH5+79wQgCsdu/AlnBRmUwxzsgNrt
 1dW0j5VKoLMb4Y4+TqK1AhQc84DUEVVmKQADyW2/quHBXMiXKh7hp5WmU8f/SeMQeZhG
 yhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PwhSDAumxkjQrKJd6Mnxfh/VbizL60GsiC8beXpG6DE=;
 b=5GXNP4ZJUdaqQi6pXI97QeCP1L3/dmJIRVJQ9T/YHp9ORT3OUd0w6QZtpSAiwudFxf
 DZmbhQMuhZ0GTpfsd/7B1S2fVoY/NI/NoSgBclia/U34WcFhIKkXM5voha289r3b6RRt
 r7nqNO6zcbSPEGC9yAuYVP+SVqLrogSepfQ25zIfkISZLdvtNyFZnL4P8sNjvKYh+NCI
 DS4snHZWTaCjtcDIMocjGLLhTvYoLFfZmX+xkY2wBIVjvOzhRHArvWvcVWCjy9Ezs3VZ
 KORQwAn8vCqRcfCcri2o5KC77/Mk+9q2T1qbuBuig7h9VAbXZdTJ4u/lWM0hB6/G6U4d
 jfAw==
X-Gm-Message-State: AFqh2koyNvFtLYTsy0tGZ9b+7w2OHEzEsOFs18cdSJNue9o2ukqLu6ky
 fbNTkYQZM13DxWUc+TafbX84RrGEp34=
X-Google-Smtp-Source: AMrXdXsXBxu/6uoADoriJ2P1je8IXXXP9Sh57GMbIXJdDeNRDJGbjYVqFeGD3C+2sGp2oxc1hYFCAw==
X-Received: by 2002:a05:6000:98f:b0:2be:296:3b5 with SMTP id
 by15-20020a056000098f00b002be029603b5mr27224975wrb.17.1674565051054; 
 Tue, 24 Jan 2023 04:57:31 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a056000111200b002366dd0e030sm1820927wrw.68.2023.01.24.04.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:57:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: prevent moving of pinned BOs
Date: Tue, 24 Jan 2023 13:57:25 +0100
Message-Id: <20230124125726.13323-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124125726.13323-1-christian.koenig@amd.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
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

We have checks for this in the individual drivers move callback, but
it's probably better to generally forbit that on a higher level.

Also stops exporting ttm_resource_compat() since that's not necessary
any more after removing the extra checks in vmwgfx.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 ----
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  3 ---
 drivers/gpu/drm/radeon/radeon_ttm.c     |  4 ----
 drivers/gpu/drm/ttm/ttm_bo.c            | 20 ++++++++++++--------
 drivers/gpu/drm/ttm/ttm_resource.c      |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 19 ++-----------------
 6 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c5ef7f7bdc15..2cd081cbf706 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -466,11 +466,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			return r;
 	}
 
-	/* Can't move a pinned BO */
 	abo = ttm_to_amdgpu_bo(bo);
-	if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
-		return -EINVAL;
-
 	adev = amdgpu_ttm_adev(bo->bdev);
 
 	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 288eebc70a67..c2ec91cc845d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1015,9 +1015,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out_ntfy;
 
-	if (nvbo->bo.pin_count)
-		NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
-
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
 		ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
 		if (ret)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 1e8e287e113c..67075c85f847 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -211,11 +211,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (r)
 		return r;
 
-	/* Can't move a pinned BO */
 	rbo = container_of(bo, struct radeon_bo, tbo);
-	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
-		return -EINVAL;
-
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
 		ttm_bo_move_null(bo, new_mem);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bb0c21c8caac..33471e363ff4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -894,14 +894,18 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	if (!placement->num_placement && !placement->num_busy_placement)
 		return ttm_bo_pipeline_gutting(bo);
 
-	/*
-	 * Check whether we need to move buffer.
-	 */
-	if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
-		ret = ttm_bo_move_buffer(bo, placement, ctx);
-		if (ret)
-			return ret;
-	}
+	/* Check whether we need to move buffer. */
+	if (bo->resource && ttm_resource_compat(bo->resource, placement))
+		return 0;
+
+	/* Moving of pinned BOs is forbidden */
+	if (bo->pin_count)
+		return -EINVAL;
+
+	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	if (ret)
+		return ret;
+
 	/*
 	 * We might need to add a TTM.
 	 */
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index b8a826a24fb2..7333f7a87a2f 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -361,7 +361,6 @@ bool ttm_resource_compat(struct ttm_resource *res,
 
 	return false;
 }
-EXPORT_SYMBOL(ttm_resource_compat);
 
 void ttm_resource_set_bo(struct ttm_resource *res,
 			 struct ttm_buffer_object *bo)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index aa1cd5126a32..9bf1f9d2f9b6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -87,12 +87,7 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
 	if (unlikely(ret != 0))
 		goto err;
 
-	if (buf->base.pin_count > 0)
-		ret = ttm_resource_compat(bo->resource, placement)
-			? 0 : -EINVAL;
-	else
-		ret = ttm_bo_validate(bo, placement, &ctx);
-
+	ret = ttm_bo_validate(bo, placement, &ctx);
 	if (!ret)
 		vmw_bo_pin_reserved(buf, true);
 
@@ -128,12 +123,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
 	if (unlikely(ret != 0))
 		goto err;
 
-	if (buf->base.pin_count > 0) {
-		ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
-			? 0 : -EINVAL;
-		goto out_unreserve;
-	}
-
 	ret = ttm_bo_validate(bo, &vmw_vram_gmr_placement, &ctx);
 	if (likely(ret == 0) || ret == -ERESTARTSYS)
 		goto out_unreserve;
@@ -218,11 +207,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 		(void) ttm_bo_validate(bo, &vmw_sys_placement, &ctx);
 	}
 
-	if (buf->base.pin_count > 0)
-		ret = ttm_resource_compat(bo->resource, &placement)
-			? 0 : -EINVAL;
-	else
-		ret = ttm_bo_validate(bo, &placement, &ctx);
+	ret = ttm_bo_validate(bo, &placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
 	WARN_ON(ret == 0 && bo->resource->start != 0);
-- 
2.34.1

