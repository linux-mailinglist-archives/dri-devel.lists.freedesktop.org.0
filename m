Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8534E28FB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4597C10E465;
	Mon, 21 Mar 2022 13:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25D10E466;
 Mon, 21 Mar 2022 13:59:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so2855690wrc.13;
 Mon, 21 Mar 2022 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0xCYhNKb7OInak7ISj+2EVPqVtSkGvYvAy2UUMoJRC0=;
 b=KOEptaU77OXatAZu1ksrm3qg1zdFAaLDpRdwSMAN1Qvg0yFIt1/u2lmnBk4CUatkeO
 MhTw9n9JA3+9VXT/a88Cm9wAWP7/btVK3RKr/ZC8sICs3D4Kz2abuFAg3RY4cwBfyRz7
 pECFUGOPDGaMR1BwARaxd4DvJFbdBhJIfg8rLAcwrN6GP4/JML+Sida3x7WWKe9Klrbt
 nJ5CcoacIjx8NLmZsDfbn7iRK3kUpqmp8yfgNLYd6E7/WxITJoPfUZMj2B/e92JxHsjM
 9oZqSi26R+0D6BV0SlmPIyifITOR2/Yfzjev7Pvebha8qmMj0Q4cLLzJzCppvkB5vZnQ
 7pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xCYhNKb7OInak7ISj+2EVPqVtSkGvYvAy2UUMoJRC0=;
 b=QVlun5jk0lLvJBItCzJLz6AhRpJPGWqy1T5pqXl7EZ2bdcLmkYB5bVhxg+CiNaCbO1
 HqXlq9mhNl7Usk/D7kYBdZwWs6mPao+NrplUnpxI3BltvHO2qRV9PQgcJmSn8VfkXHI/
 gveIkLH5wJ387cqSuLbXgoGdYrlDB0QFAhFc1Hqdk/4JE81KDVCrnS+Asv99LniBqVcO
 u6fz1qHJRbUOi9tzLabpxirptgW6b5dMz7BnC3ODe1vMGa29QrxR1fGacOIecaK22VBu
 hfz0iktl0/KU6o8dP5RE0gcwbyjoFqXau+GykduR9nxQzlM3+Iqf3DwNY9b3okjpSSYT
 CSpg==
X-Gm-Message-State: AOAM530E5ixS1dAEikOHFenDqc8Ux3TiYBGKDiUcnP7wqjBha55A+JnQ
 fhZfPntV6ntbUWnthvOE/IA=
X-Google-Smtp-Source: ABdhPJyVvnGUNX1/6005N0+MrJzU1pz2Vg21oG5F3jJismZ4yWO4QJfcQ0PE7yunfF+iQZy/IMt4uw==
X-Received: by 2002:adf:ebc1:0:b0:1e6:1109:5a1c with SMTP id
 v1-20020adfebc1000000b001e611095a1cmr18152566wrn.228.1647871155696; 
 Mon, 21 Mar 2022 06:59:15 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/23] drm/amdgpu: remove dma_resv workaround
Date: Mon, 21 Mar 2022 14:58:51 +0100
Message-Id: <20220321135856.1331-18-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
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
index 26257ba1527e..10d70812373c 100644
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
index 1c039db976a9..88009833f523 100644
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

