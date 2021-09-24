Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D04177A7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBBF6EE40;
	Fri, 24 Sep 2021 15:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23586E1D7;
 Fri, 24 Sep 2021 15:31:22 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d6so28547580wrc.11;
 Fri, 24 Sep 2021 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bdxDl1m+8XOXTzKq7WnyxAATGKOR0ud+UbtwoDgVbbc=;
 b=ODU69SvYQBoe73ZOhuuTO6W6+86702JL7nwv1wqbUR1w7nhw4trtrpe4xaxe7Hnt4A
 HcLneQPCTnIJfN0FR0Jg1clTtbm37v+F9b7x12WzhGbvsbie++Qz4gB156cwcr3RjrIb
 ZjrMr9Nuu+z84nIImNVRg7WjDASFyFS2syrInI67L0kZf2Go+wp97NCJ332XpnXTWkV0
 QPv7d+ZIkM/qny9xCwMiy3BypuJsaE9AXX8b4l9tFdSY7JESSO3rh9YyGJS9yqmMw8Js
 h7caAt9bRbN11FDnDe+CA/9QzS3OErtFKSN+PEWEdpaAu7ETImdUzfA5EDt2XzCYSxPH
 vqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bdxDl1m+8XOXTzKq7WnyxAATGKOR0ud+UbtwoDgVbbc=;
 b=n9ovnQjYg8jYTmAqVFhaOOIqPAgbusxWMwyOGc8p9L08g1NjAKhP6KEumJ7Vxw7teS
 bALo7mf+QoYBkTwJJlc1WW3DhihKNfBa6D6YOEKZ3JD/lsGcLBkrz9nt+2UU3wXraGxN
 pAySyGFV7oXRRXhIr5HPouIINvsrf1XDlTU7n7KJCiPvab4dPrChOAmz645D+wuwN2CN
 /RMaLf+1uv8ryLoGxR4M4uHiV73FLLuU1fyYSC5zeEsTsVNbEjiiWfbxE/VAfAmDcEHR
 S+WFcDGS89gp3ItlXPothUyzolFqkwB2asJTF0YhhjcYGZ7EFaRAA6oSI9rtYBCSYlu5
 vznw==
X-Gm-Message-State: AOAM530PRAro70/hKU1VPZhFPcJKgNAl6EvfkHNBKeMgts13OxA2FZZj
 huTuoBbGgadw/LITjI55wkY=
X-Google-Smtp-Source: ABdhPJzBcYtkQo3Wyfd0nFGOnH0pHsA6d0aPb408PLKgYO3fGWVqda/NXtNrnrTfn+xSdzFZXxhBMw==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr2712664wmi.157.1632497481199; 
 Fri, 24 Sep 2021 08:31:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/27] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Fri, 24 Sep 2021 17:30:52 +0200
Message-Id: <20210924153113.2159-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 69 +++++---------------------------------
 1 file changed, 8 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 39a3eac28834..ce6d0ac43911 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -609,74 +609,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
-	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
-
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
-		}
-
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
 
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
+	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-			fence = lfence;
-			break;
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
+			dma_resv_iter_end(&cursor);
+			return ret;
 		}
 	}
+	dma_resv_iter_end(&cursor);
 
-	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
-
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

