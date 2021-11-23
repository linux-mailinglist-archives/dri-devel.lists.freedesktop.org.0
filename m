Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AA45A572
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367DE6E9E0;
	Tue, 23 Nov 2021 14:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2336E7DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:22:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a18so2699718wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
 b=qBIj9pFKjl4qcR6tl7SKk+xIifqBkmd9fV2pfgjDGVv+NGWd2S0PJQoIbZpnF3QV6M
 LVDDt5CYh0/twWU22QTOeK3gEX5jxMqIPMytmmBAZdKAfAcK3neDpmHRtiYwopYhDghD
 ViL50N1Eu4pSFhPS4fwfPw+U7zZW2zuDFfU9t2sDFLxHNIhyV/mmOckCi5Cp+j2/UXCY
 5wboZH9MQmwLv70rXeOSdvKQa0hpdDiXTWGI6xmQ9Zqh1mo0+zal5JL9/z3EN5++yuZy
 iPHQ1hjE/abrcKc3t8N01tfw+QlAzQb/gyaDVAj5ZC2xyrOdNpn9Dib3agBt1qXtwIfQ
 qoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XV1ycL0JA6uJA4j325yZigiICpFpwzKb7YQrY4jauM=;
 b=UgZeGrma/pRqA23+HIhdmo3bKLcuPd/kzMCDAiblFy63tOQTsRROp5YsxoCt3jEPow
 d7Qmo9jv/jzRJrWm6qAwOgLvqwoSfsirJL8Dimm5ZNaEbpgJVhdX/6D+EZ48WI7/HM2B
 5ka5ehid8zvKfu3jqsur0d9G+eWilcH3Sbv67FpwGUA9rQDWkrRMIOxZDVZo4y3NdEvb
 Q7GSmOGk1RRDAI0sS+x61nIohxzZgnYEAy/TQgzTst+SB3kxeR0JmLDuCvhhw1UG6+UQ
 3kbqaMEz+/BFiha/IU8SR16HG5RRbmMEBxOnbpvTFYnVCadEbPdxO5QHv2H5p68CPufJ
 9d2Q==
X-Gm-Message-State: AOAM530JTRtwFEL/NgQltEOuoAE9WdGC7q2Gw9Vl7o2ELYyIuFgLjMWb
 J45j8l1x2szmUvwvJ00Ei34=
X-Google-Smtp-Source: ABdhPJyk/XPNVHpWgtv2k1fpbOeYNMxxrGdarYMP3lSL6EDq+kz/x2zdFZnWwSnSUcjUqOfwBoIAaQ==
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr8110817wrz.211.1637677319741; 
 Tue, 23 Nov 2021 06:21:59 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:59 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 25/26] amdgpu: remove DMA-buf fence workaround
Date: Tue, 23 Nov 2021 15:21:10 +0100
Message-Id: <20211123142111.3885-26-christian.koenig@amd.com>
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

Not needed any more now we have that inside the framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 52 +++------------------
 2 files changed, 6 insertions(+), 47 deletions(-)

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
index 92091e800022..413606d10080 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -576,14 +576,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
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
@@ -634,13 +626,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
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
@@ -680,17 +667,9 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
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
@@ -1265,29 +1244,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
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
+	/* For now manually add the resulting fence as writer as well */
+	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+		dma_resv_add_fence(e->tv.bo->base.resv, p->fence,
+				   DMA_RESV_USAGE_WRITE);
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
-- 
2.25.1

