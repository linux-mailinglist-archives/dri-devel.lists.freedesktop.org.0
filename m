Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A94B2658
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0F10EBDB;
	Fri, 11 Feb 2022 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E7D10EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m11so16246013edi.13
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vb3moHUs14JxS7aa0hgcOFcr0VSSL/J8OXGJjMsgziQ=;
 b=dwxpUjkyu96B3YxNSCoGRdaR/r3+FfSg5ZBvCjFg5mDkM/xrbFf42ZZ3/EE1vXzttn
 189ri2DMtGaLW84j8Opyy+jss/PXrYHgm34PYzxs4fLegptmSPeLVOvEj+CBfD+kT7mL
 zKRAVrfSleUfr0QBdJ9EyalOqUdCUQFBw+oc3/aEICCFfyxBV3vtRVBtX6nEbNJQlsMN
 SK0eUSGXamDyuIeRuFtbM6eqLxBm25TWmzfUizap4vLT5oW+l1zvrfFWfNXBeIT73VCR
 OfEWhfttah4MQwWiYLB3F9Rcedy4LgV3AF5o0TRWnOLmk3X1KP81u38eTZucy29qbYeK
 6vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vb3moHUs14JxS7aa0hgcOFcr0VSSL/J8OXGJjMsgziQ=;
 b=x5qnGYCrq6AHb6Y8h3mAyVzJJBvmCDkITSM15N5OuH4mx/+/Sv0XPG+2a/l7WGQjDx
 IA/ohMyHCzl8jIXBEEz5hYgT5qX8flnZBNS8Z0b87aKwxDAdN1TjInrhynYmvMpt9tKY
 rWURZdUOwzl1+PhNyoIZ3kLp5r6UTFyJUzI/p10DkjfcFSF8i2CEBSJEo33JcawCpXKQ
 HzTuGxtqcFLSGIY1C/ScZOAA6KGSJeNGbcVd/ElSPltrHQAo+rDsGBtU8arOpFV09T2q
 N1QfsWKSDNCXAR4Q/h8UNOyamu6Jykd9No+zXyp0uVM8J0wDUJFglgfNK9tzcvHReJGB
 QQ8w==
X-Gm-Message-State: AOAM532fvWk2GaXYq594EaGTkL4Z4P1qy4gTHXjwV0hiKUGm/u4MYteF
 lmQ9dGEiWuitnmK7vw9gR7A=
X-Google-Smtp-Source: ABdhPJwjeQXqViDiSdP5unjlJ+Iuk5IP2zqGsybynafobW6lmGLlqS6IntOhGMy4zqmthgaCNV8AMA==
X-Received: by 2002:a05:6402:515a:: with SMTP id
 n26mr1713009edd.191.1644583822382; 
 Fri, 11 Feb 2022 04:50:22 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 18/23] drm/amdgpu: remove dma_resv workaround
Date: Fri, 11 Feb 2022 13:49:58 +0100
Message-Id: <20220211125003.918447-19-christian.koenig@amd.com>
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

We can now add multiple writers to the dma_resv object.

Also enable the check for not adding containers in dma_resv.c again.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/dma-buf/dma-resv.c                  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 51 ++-------------------
 3 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 821ef47c3a24..9484690a440a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -308,10 +308,10 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 
 	dma_resv_assert_held(obj);
 
-	/* TODO: Drivers should not add containers here, instead add each fence
-	 * individually. Disabled for now until we cleaned up amdgpu/ttm.
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
 	 */
-	/* WARN_ON(dma_fence_is_container(fence)); */
+	WARN_ON(dma_fence_is_container(fence));
 
 	fobj = dma_resv_fences_list(obj);
 	count = fobj->num_fences;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 044b41f0bfd9..529d52a204cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -34,7 +34,6 @@ struct amdgpu_fpriv;
 struct amdgpu_bo_list_entry {
 	struct ttm_validate_buffer	tv;
 	struct amdgpu_bo_va		*bo_va;
-	struct dma_fence_chain		*chain;
 	uint32_t			priority;
 	struct page			**user_pages;
 	bool				user_invalidated;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index c21ae6694df7..5227c2f4fead 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -575,14 +575,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
 		e->bo_va = amdgpu_vm_bo_find(vm, bo);
-
-		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
-			e->chain = dma_fence_chain_alloc();
-			if (!e->chain) {
-				r = -ENOMEM;
-				goto error_validate;
-			}
-		}
 	}
 
 	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
@@ -633,13 +625,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	}
 
 error_validate:
-	if (r) {
-		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			dma_fence_chain_free(e->chain);
-			e->chain = NULL;
-		}
+	if (r)
 		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
-	}
 out:
 	return r;
 }
@@ -679,17 +666,9 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
 {
 	unsigned i;
 
-	if (error && backoff) {
-		struct amdgpu_bo_list_entry *e;
-
-		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
-			dma_fence_chain_free(e->chain);
-			e->chain = NULL;
-		}
-
+	if (error && backoff)
 		ttm_eu_backoff_reservation(&parser->ticket,
 					   &parser->validated);
-	}
 
 	for (i = 0; i < parser->num_post_deps; i++) {
 		drm_syncobj_put(parser->post_deps[i].syncobj);
@@ -1264,29 +1243,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		struct dma_resv *resv = e->tv.bo->base.resv;
-		struct dma_fence_chain *chain = e->chain;
-		struct dma_resv_iter cursor;
-		struct dma_fence *fence;
-
-		if (!chain)
-			continue;
-
-		/*
-		 * Work around dma_resv shortcommings by wrapping up the
-		 * submission in a dma_fence_chain and add it as exclusive
-		 * fence.
-		 */
-		dma_resv_for_each_fence(&cursor, resv,
-					DMA_RESV_USAGE_WRITE,
-					fence) {
-			break;
-		}
-		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
-		dma_resv_add_fence(resv, &chain->base, DMA_RESV_USAGE_WRITE);
-		e->chain = NULL;
-	}
+	/* Make sure all BOs are remembered as writers */
+	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+		e->tv.num_shared = 0;
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
-- 
2.25.1

