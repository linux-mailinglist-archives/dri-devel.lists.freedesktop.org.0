Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9F40D89B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F946ECF5;
	Thu, 16 Sep 2021 11:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D375D6ECE7;
 Thu, 16 Sep 2021 11:30:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s24so4539883wmh.4;
 Thu, 16 Sep 2021 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmEE9pL8NZn6FzdcJqJ3nDbf8dXgLtIIV4G2gTnqXrs=;
 b=ndnioQiTNb95g0bmf0LnVfe7cvd/GKqG8htbq8FD19RSEoG6dUcQOczYq5L4Gi6AO2
 7rybT1CGnM9GKJu8Xov1kyXcQMc1Mdcc+V77WIWf4nr852Fp+cEvvr42SwQNoEmWKxQK
 fAsP9f9/KuUCPkwRzlW+8FZmo6U6BuBTF/twNGUYb4sI9CGAPu8tqFd0ciziB0CP2j+Y
 d1EOsAlJ+G0us743yW2IE/t3PwLLM/WBF7WUa2R4nHR10Cj9BRgI53GAhoSRXlrsyFgw
 l+RbLuo3bRM0rsWzcLyIJ7t9zQC7NdQ3xOjZKsUizOeCVd+8QtwWNKnpmpA8U6gIsCW3
 GNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmEE9pL8NZn6FzdcJqJ3nDbf8dXgLtIIV4G2gTnqXrs=;
 b=ZdtoyJCSZ7fG3CTF1MJ9HbEjvs4ML00EU6VqSizSB+mS/dWPOeOHTNslyaneshN5+p
 vTUDlUec2Nxik4GzGoQpIP5NvH6JI6J2w2S90BnWcI86kLfdxORQbizgw8b+BkQ2hqC9
 +vwbbqyqx7aKAR4lXX3es+HxIsPBX2nxmSnBQsvuOvuacWMf59lwe82til7GD0H/fbkz
 8nDXDLiH1qLItrstE8x2KYxqhYl1X0y5VAwCvbZ+urIYbpKHzFrc+cSnx4Ig8965UNu1
 q+zpIwSi5i2abqivMcrGZ39g38laK+CzlUAzN5ufmjkXGT0EDWHcXIQR/dPqtNA5WZxo
 W9ig==
X-Gm-Message-State: AOAM5339tWEK00kc//iAcE2kEJOlrN6SloCxNO+DwKTSbuEjLDGFjQHS
 Qbft+jGQ43otKqViToUYtiA=
X-Google-Smtp-Source: ABdhPJyBB6aVm1n24PyHbnPPn7Zag9iCtAur84htqEF2IEp5JGTLISYfSiG6K85sGdDj8c9eN4XNxQ==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr4491668wmd.189.1631791850422; 
 Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Thu, 16 Sep 2021 13:30:21 +0200
Message-Id: <20210916113042.3631-6-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bba328475304..764a71ec2347 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -569,74 +569,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
+			return ret;
 		}
 
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
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
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

