Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55B40D8D4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6DC6ED00;
	Thu, 16 Sep 2021 11:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6B66ECFD;
 Thu, 16 Sep 2021 11:31:08 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i23so8959891wrb.2;
 Thu, 16 Sep 2021 04:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2+bkO5HBs2j3ln93bw25BJPWcYxbkv7E+H/9pqR/bfQ=;
 b=mP52YOcL+AxVz3KiSw3fvvB9zkcKwA/zAUKLTenIz5Oa1eenF2UaMiJf4ra00whqaT
 jSRK3l7QP14ml2qIGTeNfa4mBRahp7oCn/FbkqEajnMzw7oMWv0ytpqRdB8rHpJQfV98
 iqQ6i2OdCDaxwtNFokVlZ3g603hb7V1Y/yWR+0OP3lijze9oSpZnE+168aLNxKXify/w
 jVoJ99rwc8PwZFq5usRU8v6xRmanjkje93JcXitEZirN5uC5yO8/CS7PqemNJrPcLtoK
 tff06ih+3C+88UMEFeKpXjQQ8EebwJqohzX+jb8I9ubBrJKi2kZfzPAfyZTgPB0Mtmds
 t3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+bkO5HBs2j3ln93bw25BJPWcYxbkv7E+H/9pqR/bfQ=;
 b=u0NNjeXX5uwHyhuq2KZq4d+y03QjM5DH+hd6+fPIcVnPeyiwGZphnS2Eges5jwDcLN
 P9vS60/PmVvRJKWRdvY0lOAKLgEhYUo/TpcP+ByASsrtVt0q/IWSt8DL7PmA9KfpTc5d
 /af8eMYyTm6dixvJ/tpxZC9bGzmcbeVkJSxtZ+dTlJT2h4mqHg2SZKeg7CjnDz5lzhi3
 Ky82ud1qlIJ6BZS7CraeiOrLfCUjbdQSYImuLcfNm2+pX0/ts16589Aaz+pIK1PfahWD
 x6wtGBEPKm3XfHf2WDjIZwyGiqu+0JKdmyMlHwSqpTRhysD8RklEc6Bf0he7JkEBr0dJ
 XRMw==
X-Gm-Message-State: AOAM533FBzpx1bMpLc0ex4iPa83veMFvUGXOz5p8nW2od31TY2VMkKqI
 pdCjlIar6TER+6yVuioeQ8s=
X-Google-Smtp-Source: ABdhPJy4mIlf7AvTUapLD1nLkmHwTh8uuMjAJTBuggOraBaigWUULuCE0bYamy+ETUj70VPoDk9jYQ==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr5453601wrj.12.1631791867219; 
 Thu, 16 Sep 2021 04:31:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date: Thu, 16 Sep 2021 13:30:40 +0200
Message-Id: <20210916113042.3631-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 8f1b5af47dd6..dc2a2615db38 100644
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
 
@@ -450,19 +448,12 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence_unlocked(robj, &cursor, true, fence) {
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
 	rcu_read_unlock();
 }
 
-- 
2.25.1

