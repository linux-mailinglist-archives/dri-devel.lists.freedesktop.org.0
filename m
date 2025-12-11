Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DFCCB5CEE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCA810E7F6;
	Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhukcyBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F0D10E7E9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso224645e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455854; x=1766060654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YjNW429UorXfRWSmfiSu8+hOtC1rk0BjcG9/GAykRw=;
 b=DhukcyBkycI/DsvjjCuIVumecCdqCkjsU1W2BPC7I9urb8jTquye6+e7koKs1+8GR9
 wyjUQWU4Qd5gv83tM9zqNlx0KuD8RElXzGx1ymo4lN29zlxl1bTjMCLt4/avLBy67/rT
 Tfb+eulA7rVs4RH7qWQg60xn26T3W0rTbIyUdWzcRnomnTEZ/o2OMQeQQ8RYjHYDZwOh
 mnxlD5U9xMxTMxuEd4yc2+luGjEWIgAMn7anF5/ihDI1Vo4fuH2ntT4miJBIAQmqMH8b
 1hzV/jJMorQkMD88y+VU/I+HVWsf4zfG7S1ITr7LA0VUlQViFVjveIOEJclbeaNumZdG
 x7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455854; x=1766060654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3YjNW429UorXfRWSmfiSu8+hOtC1rk0BjcG9/GAykRw=;
 b=Z23R/ncpqIfQ+m8+eJrUFVifOwWZKPiXiYPV5sO0IdEY+C0COM0urVmsHzresVL1JI
 v08TbelOZ1CI2oLCDt5VXBOo3wTmO0JnJNOdKYswUbob7Uiodm2PKKyP9lNPhHcp8lqr
 APEp/35FjnrHQYtCH4UIM4KutRtnIULK7QsBPWxcCXdn/7p7h6Zzz8Zxqh8QXGFM22/X
 k3bGqGV9MMIooQWrFBCDB/YTgCl8y43KoOSp62DD5pBPEG+iT2PmR76inQZ9Z7AsUW0y
 1lcmjm7CmYKKAPIo7GGzPoXTup0y+hHC7kC4rfAvpkadaxkU/O0KEsfHrZpmBfr/OHtM
 nWjg==
X-Gm-Message-State: AOJu0YzkhNuzPhRIoNaxgTWSE00tsQxoaEzhSH66o5EHc6TsE4f2TXq5
 3lraYHm2De7GzNJmfGuxu+zXiyCyRdkWZp6nKcrTEcPLIK4zk4yOl9rx
X-Gm-Gg: AY/fxX6w6RXb5RCNm2FPYg3ht8QftAO9MUVYlcQbzpVt3N4k+rzGKFg6PXlP5UWsiOy
 yMsCOSdy1sGSn1qiwbUNcZiv/Kg3eSDF79ecqCrNMJ7c3KCcp/zvfJoL/P7PP/XdRY4a+HbmS1N
 NAMCaWv3HuONXDSg7LupDQxMycyd/FvgDVOkfSUMgGHWR82d3vJul1weug7eTAE+R2BRHSqVj5+
 83vQABTte+fjrrZeMPs/CPZkt4peswEEV0Cs5qy1Ogp4frU6rgA1aQxz0VjFYedQ9XaeP8ufSKi
 NSX6goevsD1nHUtFWcY6RoCH6K20mIyNMvmOVvuSHKqC22mN0hHufBVd0F05C6jrUvDBLA4dfkV
 PDFXcHmYCsPMz3ChwhoWukmrNVwgIWTkDmfawLHjEO1Rdo1/UlkVr7JTgAGucUssxh9J+FplxQN
 hZHTcs1vihaYiLO8qcRHaQGPoh
X-Google-Smtp-Source: AGHT+IHrMX+tx4xAWbkp78CX31uMZS5UInfR/QT/dyZzjvgDckmV/OiUsw0v/VA6SSf/409LqVNotQ==
X-Received: by 2002:a05:600c:3f0e:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-47a8379c10dmr59834165e9.31.1765455854292; 
 Thu, 11 Dec 2025 04:24:14 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/19] dma-buf/selftests: test RCU ops and inline lock
Date: Thu, 11 Dec 2025 13:16:36 +0100
Message-ID: <20251211122407.1709-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

Drop the mock_fence and the kmem_cache, instead use the inline lock and
test if the ops are properly dropped after signaling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence.c | 44 ++++++++--------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 5d0d9abc6e21..65221270fd06 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -14,43 +14,26 @@
 
 #include "selftest.h"
 
-static struct kmem_cache *slab_fences;
-
-static struct mock_fence {
-	struct dma_fence base;
-	struct spinlock lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
-
 static const char *mock_name(struct dma_fence *f)
 {
 	return "mock";
 }
 
-static void mock_fence_release(struct dma_fence *f)
-{
-	kmem_cache_free(slab_fences, to_mock_fence(f));
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.release = mock_fence_release,
 };
 
 static struct dma_fence *mock_fence(void)
 {
-	struct mock_fence *f;
+	struct dma_fence *f;
 
-	f = kmem_cache_alloc(slab_fences, GFP_KERNEL);
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
 	if (!f)
 		return NULL;
 
-	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
-
-	return &f->base;
+	dma_fence_init(f, &mock_ops, NULL, 0, 0);
+	return f;
 }
 
 static int sanitycheck(void *arg)
@@ -90,6 +73,11 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
+	if (rcu_dereference_protected(f->ops, true)) {
+		pr_err("Fence ops not cleared on signal\n");
+		goto err_free;
+	}
+
 	if (!dma_fence_is_signaled(f)) {
 		pr_err("Fence not reporting signaled\n");
 		goto err_free;
@@ -540,19 +528,7 @@ int dma_fence(void)
 		SUBTEST(test_stub),
 		SUBTEST(race_signal_callback),
 	};
-	int ret;
 
 	pr_info("sizeof(dma_fence)=%zu\n", sizeof(struct dma_fence));
-
-	slab_fences = KMEM_CACHE(mock_fence,
-				 SLAB_TYPESAFE_BY_RCU |
-				 SLAB_HWCACHE_ALIGN);
-	if (!slab_fences)
-		return -ENOMEM;
-
-	ret = subtests(tests, NULL);
-
-	kmem_cache_destroy(slab_fences);
-
-	return ret;
+	return subtests(tests, NULL);
 }
-- 
2.43.0

