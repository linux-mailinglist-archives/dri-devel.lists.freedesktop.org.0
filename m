Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3940F7D9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530D56EC68;
	Fri, 17 Sep 2021 12:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9984C6EC50;
 Fri, 17 Sep 2021 12:35:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so15001100wrb.0;
 Fri, 17 Sep 2021 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fnU59rAAZAZupB1agRScvsRy8FcaokBV3fXPNRfJmuM=;
 b=NZ//04R2oA7Ofi5J5H9RYrX45fRztLC6ng7eE/q30lidghN+eTwjRXi3eo0pqp9kzU
 jiToExYNvC0YZ4dCb5/1H8M9v+PSKKiEQM35cmsEXHcqFzJNFoqyZccU1bUeDY3VJNVt
 VRWu0rHHMU8kPTfZhz15x+SOfsbnVmmwejweeDiyJJms/DoBS8hUzsO3i0f/T01kXVS4
 zEBYwfw532UGxfMqh6JMYGhbP+/tlJ04RS0YWUv8zSj00wVYsIDKaoMhfkUhFOtJGaiX
 SEyhKBQECkFaIhI5ZyXYV/HCXFLPncsAJt53y0tzdLvcC9UAyKAxfrPF2orWgob9r8Uw
 +ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fnU59rAAZAZupB1agRScvsRy8FcaokBV3fXPNRfJmuM=;
 b=8KAmUyB0axRCAMSkrZnkW53EJ0pIXGTOvux/9s9q1iUS+opXOK+0p+4Oy49q/6fw/e
 YKFXjHQh5a5/GWP1Nzdu/abrchwj8QY4x9X7qAzUJrFMz+jGBUSXOLz5bXr0CNdYO5yL
 hAcse0A2XH9wfUKPi63NE8/BBsb3Oi7dza/MkqaWQePNIv08xUNe4iaPMyqP7HqEC3Zf
 vknYguBs4Cvwlt07I8U072OacrHvsmZYICrHnimNrHi5hiNfv5+nDQXzv3fV3kEXeazA
 +HR4yS1OjTA69FoJOSD4E+K1Pvh0Abu4bKQmXs4IomKMmPH6kWfaj4CxnsN79YEcFh+Q
 8TxQ==
X-Gm-Message-State: AOAM5303oYukTpoYgK1U2h/9i0HZNnUPfsqUEfAjzK/CnlqzDehsGq2C
 KdCH6g/bcT/53IUllbj8qpc=
X-Google-Smtp-Source: ABdhPJzfu4I1UPKXKEbsuR5FDbWn0p6UMTBQKmzpVOnvlDOvS1QnIwGdIoATAJR2bte/LnKCgf+aJA==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr12200396wrv.27.1631882128177; 
 Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
Date: Fri, 17 Sep 2021 14:35:01 +0200
Message-Id: <20210917123513.1106-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
    held here anyway.
v3: back to using dma_resv_for_each_fence_unlocked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 57 ++++++++--------------------
 1 file changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..7635b0478ea5 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    unsigned long timeout,
 				    gfp_t gfp)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			if (shared[i]->ops == exclude)
-				continue;
-
-			pending = i915_sw_fence_await_dma_fence(fence,
-								shared[i],
-								timeout,
-								gfp);
-			if (pending < 0) {
-				ret = pending;
-				break;
-			}
-
-			ret |= pending;
-		}
-
-		for (i = 0; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
-	}
-
-	if (ret >= 0 && excl && excl->ops != exclude) {
-		pending = i915_sw_fence_await_dma_fence(fence,
-							excl,
-							timeout,
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		rcu_read_unlock();
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
+		rcu_read_lock();
+		if (pending < 0) {
 			ret = pending;
-		else
-			ret |= pending;
-	}
-
-	dma_fence_put(excl);
+			break;
+		}
 
+		ret |= pending;
+	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 	return ret;
 }
 
-- 
2.25.1

