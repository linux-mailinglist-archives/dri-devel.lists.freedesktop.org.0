Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF56CDB3F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304A410EAC6;
	Wed, 29 Mar 2023 13:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0433B10EAC6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:54:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b20so63691071edd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680098043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VLxsnO6ce46LTzVw2amgU9A7cz57aIAO24PeViZnoM0=;
 b=IeknRkxYWql+waBFagKONWabb19kdomHMbjWnSXDCa5+iC6YzQkhNnS6rmyy2aXq6J
 Gy/2kWdGheuBl0Sb6lowTD40RVMmjNIUhF+LRJYvXAbKgEVIQUOecgrLa3p71YSU6WcS
 vqFcQsNabUC2g1T/DQBP4zH+CfVb/ItU1P20QUxhfy2HrWawJl6Gblmm5HD3tKtCf9LB
 rw34Td6Wp3ITSkgnavl7TbSscRvMFrYNYHcHnUFmX/pbfpui0QwTc1kxK5U6vwnKUKRi
 MmiTKOsAasQZQl8za+KZTFz/2V0LOrXvjbojAmaXMxUj5L1MhviBUwYxp6j6Mdzd7Qay
 iQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLxsnO6ce46LTzVw2amgU9A7cz57aIAO24PeViZnoM0=;
 b=ktQQSOYEEuRmEW9ufEKPR8fYBbfmhXGmEJTS7R0F/zpHtCwOQDHl7jJFpNbebPI2Db
 0gltACKjV4Mnhb6ITRVwspgYUKjYYi2CKJF7VbEhyc4hALNFaqx3yYmbUtFVOkIHWtr0
 NewyQuGxyeY3i2nXd1dhuDXnCbgb/jLYJZDSv++5Lq9r6nwWPoGIFdT3pPaL+WPYmjup
 IXf/IM6qqTjmolPZl63n2NBH1tfzrOVQD43fCOMYqFufyNd2c9LdDmBX0ku5pDiBM2aZ
 1lY0CyT16CTYdyxiRcc+EFeu2N0VQawJ/ADd3m0E2ST3YyYgwFceKd9aUuvA47FvKEZW
 PcQw==
X-Gm-Message-State: AAQBX9doYSo6J6LhIbtDhexww/wDcVuZlMJbjtq3ajDleLmYSbl94fi/
 5gI9spzhNwyr9xZdouoHz8tRD+Mcrps=
X-Google-Smtp-Source: AKy350bwvcDUUrn+uysMENZ2prTld3IUhC6GEjlwyiiRwim7xbYMbPVhfrjzbxqZFj66K47ekmCfvw==
X-Received: by 2002:aa7:d058:0:b0:502:22fe:ef3c with SMTP id
 n24-20020aa7d058000000b0050222feef3cmr14342679edo.41.1680098043500; 
 Wed, 29 Mar 2023 06:54:03 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5096d1000000b004aee4e2a56esm17086833eda.0.2023.03.29.06.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:54:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: set TTM allocated pages as reserved
Date: Wed, 29 Mar 2023 15:54:01 +0200
Message-Id: <20230329135401.105592-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: pbonzini@redhat.com, npiggin@gmail.com, Pierre-eric.Pelloux-prayer@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KVM tries to grab references to pages in VMAs marked with VM_PFNMAP.

This is illegal and can cause data corruption with TTM pages because
only some of them are actually reference counted.

Mark all pages allocated by TTM as reserved, this way KVM handles the
PFNs like they would point to MMIO space.

This still results in a warning, but at least no other problem.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 62 ++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index aa116a7bbae3..c665a8bf366a 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -82,6 +82,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
 	struct page *p;
+	unsigned int i;
 	void *vaddr;
 
 	/* Don't set the __GFP_COMP flag for higher order allocations.
@@ -94,38 +95,43 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages(gfp_flags, order);
-		if (p)
-			p->private = order;
-		return p;
-	}
+		if (!p)
+			return NULL;
 
-	dma = kmalloc(sizeof(*dma), GFP_KERNEL);
-	if (!dma)
-		return NULL;
+		p->private = order;
+	} else {
 
-	if (order)
-		attr |= DMA_ATTR_NO_WARN;
+		dma = kmalloc(sizeof(*dma), GFP_KERNEL);
+		if (!dma)
+			return NULL;
 
-	vaddr = dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
-				&dma->addr, gfp_flags, attr);
-	if (!vaddr)
-		goto error_free;
+		if (order)
+			attr |= DMA_ATTR_NO_WARN;
 
-	/* TODO: This is an illegal abuse of the DMA API, but we need to rework
-	 * TTM page fault handling and extend the DMA API to clean this up.
-	 */
-	if (is_vmalloc_addr(vaddr))
-		p = vmalloc_to_page(vaddr);
-	else
-		p = virt_to_page(vaddr);
+		vaddr = dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
+					&dma->addr, gfp_flags, attr);
+		if (!vaddr) {
+			kfree(dma);
+			return NULL;
+		}
 
-	dma->vaddr = (unsigned long)vaddr | order;
-	p->private = (unsigned long)dma;
-	return p;
+		/* TODO: This is an illegal abuse of the DMA API, but we need
+		 * to rework TTM page fault handling and extend the DMA API to
+		 * clean this up.
+		 */
+		if (is_vmalloc_addr(vaddr))
+			p = vmalloc_to_page(vaddr);
+		else
+			p = virt_to_page(vaddr);
 
-error_free:
-	kfree(dma);
-	return NULL;
+		dma->vaddr = (unsigned long)vaddr | order;
+		p->private = (unsigned long)dma;
+	}
+
+	for (i = 0; i < (1 << order); ++i)
+		SetPageReserved(&p[i]);
+
+	return p;
 }
 
 /* Reset the caching and pages of size 1 << order */
@@ -134,6 +140,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 {
 	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
+	unsigned int i;
 	void *vaddr;
 
 #ifdef CONFIG_X86
@@ -144,6 +151,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 		set_pages_wb(p, 1 << order);
 #endif
 
+	for (i = 0; i < (1 << order); ++i)
+		ClearPageReserved(&p[i]);
+
 	if (!pool || !pool->use_dma_alloc) {
 		__free_pages(p, order);
 		return;
-- 
2.34.1

