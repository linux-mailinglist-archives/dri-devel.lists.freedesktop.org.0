Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85754390D1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20289E0D;
	Mon, 25 Oct 2021 08:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CFF89CF9;
 Mon, 25 Oct 2021 08:05:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a16so9975986wrh.12;
 Mon, 25 Oct 2021 01:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
 b=bUZj+UtXyigSwPUyalVGyKul854jvu5oSPd/YTlo6SvwmfCsvhgQnilFo1H1x/G6m8
 RuRXdkAYrtQ3qX9tnWUQ53vcGDyA2EWDf8yM3QxhZdP2mFWq3WcK+sSQctpCXPCguy53
 QKkuOqamOmjxSk8n9Jjg/qK5C04S3fcRu4+91pigHeUOPD/N4RwAOW/Ge21AwB5rMbxd
 F+LZuasP8HODgXFdaGcVraRE5iRweqz+MzV1r15x+pn6R1ta9l1h7jIM7Uvbnu7dRJsL
 iPjIudXrX4TOJZm/9TBqCpSKjxfQXPM/clo50hcPAvGshpLv0f9tWclEmoQSyYZXDDE4
 6G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIUir/k9ok0mhA9lZLcDk0nsv9skwzmV2ts7X5dBo9o=;
 b=EDjt2kNp0XIXWUq9/6IxPCnrxF9KgAD09XlrdhmtCV4pDGe4QQE86wBTT6QynONg8o
 uG0E19hiEWqaMPi4CaPQaojf3FltSJNSG+3jjkw8BH3mwfoCXBf/UOaeOHzjAyLirzOR
 phmOic8fk0ctUS6TWr9tQBuAaMtjiL2Ixc4qKNd47Ti5iY5EU5gVawt4biwE3vuuAlPi
 Xs2oB0k9CLlerlGAMC9Li2etsg8Ny1Xm/kG9VT0ZNBuONBLCVfgQfT2UjBxIF4ou5DON
 k8RBJbGKEkOp3QLBoLaYKCzs5lmTIwkJsliPjIHsRxDlT90XRQL1LGV2PPKLvr7kYtZ3
 2qzg==
X-Gm-Message-State: AOAM530c5/uqQ+/qVmJl95uB/KkIWWFpunHb56h/HcldjXGPquPfD3qq
 zKhNedLr7PupPYBpGvleM2gCKcnkl6g=
X-Google-Smtp-Source: ABdhPJzhRYW8foqGS4ILutgFtcSw16ZtiEbiF0JIDDfJQFd08gyZjQmoy+j3DPO4PWMh7XlVKCrj0Q==
X-Received: by 2002:a5d:4b90:: with SMTP id b16mr22118024wrt.118.1635149135739; 
 Mon, 25 Oct 2021 01:05:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l1sm6319691wrb.73.2021.10.25.01.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:05:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux+etnaviv@armlinux.org.uk,
	l.stach@pengutronix.de
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date: Mon, 25 Oct 2021 10:05:31 +0200
Message-Id: <20211025080532.177424-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025080532.177424-1-christian.koenig@amd.com>
References: <20211025080532.177424-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8f1b5af47dd6..0eeb33de2ff4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
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
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_iter_begin(&cursor, robj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

