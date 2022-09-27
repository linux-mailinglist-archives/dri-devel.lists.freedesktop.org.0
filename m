Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8D5EC680
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 16:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D2710E37E;
	Tue, 27 Sep 2022 14:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF24E10E37E;
 Tue, 27 Sep 2022 14:35:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y2so14707ede.11;
 Tue, 27 Sep 2022 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ixTypyTbYmrayN7j6R7TbcDZay0VkrFWbjckAjmTBnE=;
 b=VXzCFYNfh7QbuilcouXWmrmwwyQylfrBDHpIdQLvMFFlIn0LE8I1HPAmp47qKVyZPU
 h/EOYn6FEDdAFTcsKfFvsD2jHPPoALSmI2vD+xKqdBc/gL8dVkogQL9+xGSKoY8KhxUB
 tAWP2J1rq9g0crKRrKe8J7nfv9tm7KqYybWAMo1ZNkVV1+0j/YP7hfQGv0xQUIH10W//
 G9YTgUv8uHz3r4+q/XTsft8Jdc2UF63i36yvb34HGN/ftQ6/nRU/GzY1gMJDFPQxH5Md
 tH1yTORMXhos1XZWzSjwOjyzv9zcUPS1/mYRQvqhfhYbG+ZnQaigWMbNWLudGJIihXMK
 3ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ixTypyTbYmrayN7j6R7TbcDZay0VkrFWbjckAjmTBnE=;
 b=J+kgg+Ssn/ReJ34dHE92y97yMaib4iJxpcs8E1ZfXrYbl5ZDKfoVaRDZUBJ4uAJTFi
 ziSy3k1blW8k5RMHTlVIa97u5FemG+2gzb2HVQ3Noi4toCF46YasGdmq1Tf5myyufXfu
 rq3g9vVPYBAHTKdG0N/fMNuydXQJ5dnZ3f8nnrmLS+cb3WWQj3qJ6F5aL379ntNRAND7
 nXS7+GehjC7dXhvM3OWWW9ilOS+1pU8aCovMLFMCuC8PeTrWSgaESY7AvgIWItNhPO9j
 dnujUmp1dImnaDiHLiielpZDWhRPwt8QJ6Y1bsNZC1C3wNwIOGh1ahCOlEk/+XhDfGC4
 CAOA==
X-Gm-Message-State: ACrzQf0BVRw6dpgOAXeaH2uPJ9N5A7WmlkQafJlnrW7v2KT4qlo/Ogpb
 FVc4eqfMEi+W+4gJOfxwjxUDhQ47g6A=
X-Google-Smtp-Source: AMsMyM695l+hzFyFwhK1KaOGqWorubCB6OUwkgDQ+7No207O9eN7wSQ57C8za9/pAQeLrrAUVVMnUg==
X-Received: by 2002:a05:6402:4009:b0:457:14b:8ce4 with SMTP id
 d9-20020a056402400900b00457014b8ce4mr17293146eda.332.1664289331414; 
 Tue, 27 Sep 2022 07:35:31 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b0077016f4c6d4sm871564ejb.55.2022.09.27.07.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:35:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: prevent grabbing page references v2
Date: Tue, 27 Sep 2022 16:35:29 +0200
Message-Id: <20220927143529.135689-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM owns the pages it uses for backing buffer objects with system
memory. Because of this it is absolutely illegal to mess around with
the reference count of those pages.

So make sure that nobody ever tries to grab an extra reference on
pages allocated through the page pool.

v2: handle DMA pages as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 21b61631f73a..4da736e7b5aa 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -93,9 +93,11 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages(gfp_flags, order);
-		if (p)
-			p->private = order;
-		return p;
+		if (!p)
+			return NULL;
+
+		p->private = order;
+		goto out_set_page_count;
 	}
 
 	dma = kmalloc(sizeof(*dma), GFP_KERNEL);
@@ -120,6 +122,14 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	dma->vaddr = (unsigned long)vaddr | order;
 	p->private = (unsigned long)dma;
+
+out_set_page_count:
+	/* The pages are fully owned by TTM and because of this it's illegal to
+	 * grab extra references to it or otherwise we corrupt TTMs internal
+	 * state. Make sure nobody tries to ever increase the reference count
+	 * of those pages.
+	 */
+	set_page_count(p, 0);
 	return p;
 
 error_free:
@@ -142,6 +152,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	if (caching != ttm_cached && !PageHighMem(p))
 		set_pages_wb(p, 1 << order);
 #endif
+	/* See alloc why references to TTMs pages are illegal */
+	WARN_ON(page_count(p));
+	set_page_count(p, 1);
 
 	if (!pool || !pool->use_dma_alloc) {
 		__free_pages(p, order);
-- 
2.25.1

