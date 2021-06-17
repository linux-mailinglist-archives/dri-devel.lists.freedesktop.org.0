Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38AA3AB246
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972036E8F7;
	Thu, 17 Jun 2021 11:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E1A6E115
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gb32so1046471ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
 b=M2EfIXDhNhQGfnqZeXtxmNfwHZoQaW2MTVa3UzNYhdb2fsMUXtcdPuWkWBrGvEWEp9
 sDzydRS9HenKK/Y5oenkwtBngqHPZOEk1hYGnQcqYOfDW+JdluHZyfgpXR2DKVeYlOq+
 k/brasQwC83W9K83wlbEsSexWGzNhSHlavnvMoz0pj2IxjrQFD/EVPJ9HG3LKfY9nUg/
 Cnmuujua6BAvCTBE/nJOIP/+2mSp4qi2A1F+99Nwy53hzXnB6w/pnT0lkPjUPVfgJJVV
 wWebCzXZQ9+bl1u6+aK7nvKJDR7cRxPrcwUG01ob7hSLxVWgigrBvaJznD2ytWqOwcRT
 68ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/imVMS+E7ZynWw7iSiIjDs1SxBWXyWjuW715+Mfo5c=;
 b=Q18M4SW1Foyfr3qLwJQF1GxBd9suAmPhE5u/ky4HSFS9CpEL4+9M6WBNnJ4fc0h+pW
 xJGdPkLOsB5YBj7rMT1H5spGxwfenNgRUdVlu+XIVu/g2UJgpP1p2FEd3Df1wjK1/sTX
 qj+XLcJu1jj3TOYeMcYwEyiOnObsS9j4pBhu5JGsYmqAMYINNuxrAB+TlN+jektdS+af
 /+Q/RSbeGnO8tUs7wwaADB0vPg+aQ3/5vrL2mTXhUlHV2aka18uHtsVV0PFfnit/zMxZ
 fBFAsuFNk0KtgSYsx6gq6fFPhboPpn79oWI7r4A2rdDtWvywrnbfCVpMc1lYHRkGHE94
 BU4g==
X-Gm-Message-State: AOAM532KuQczujUEdRhJx5sdlsLBg8ok7VXGR0pys2rymwzAAF6VjL+9
 gpftX425zd/6dqbFq/sqOi0=
X-Google-Smtp-Source: ABdhPJxtONqJjTKNIkmenxgCWwIo2UFCZPig/Nqaq0PPK0Qw8TAhJetxxVTpxyIT5mpgKNhpreu58A==
X-Received: by 2002:a17:906:f6d7:: with SMTP id
 jo23mr4756958ejb.302.1623928568108; 
 Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 10/16] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date: Thu, 17 Jun 2021 13:15:52 +0200
Message-Id: <20210617111558.28486-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..6808dbef5c79 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -437,19 +437,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -459,19 +457,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

