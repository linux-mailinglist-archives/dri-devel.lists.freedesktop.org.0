Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BE51DA11
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FDF510EC17;
	Fri,  6 May 2022 14:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C369810EC17
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:10:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id g6so14724604ejw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
 b=lU6nT6ElU5a9Th7b6Bn2x9KOLSBH7B7mSLKE7pKyrmRgMIaHNgq2zz0aFTEAlGOttX
 kpY8D84zbO19AF7lXnZvSFOFmK+IBUuwQ924WTEVf6umK10BLyka+fW2mcGp9xN63Zi9
 bBiZtjErKEuXQs/3tb6WNN5o8dISboR0iuqGTRafUoya0clsmL1VboqnnlTe3yz6cK1i
 4EjOXVrlSpa7Sc7+cMkNsmL8OU34Qrmz+ne+GbNsrUph67HucHwAkMsSB6/Z1xCf2xXL
 dYTJ6OlmMIhWPzXa7wqOWgnzAoMS9gUgVGWc4Cg9LIXNL5wu2bjr8oqeFPF2X9WYrKJ9
 eAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
 b=lpyczjQLea52ApkaDsjVcEtEDhq3qa6jMGBwITKNYokXf9OOCf2U7owA1z6+bJLbSs
 kBypgKgRj1Cvne38fVu8bQ3rzXk4cu2CHSmoeeJjgZZbOO07CfCvoDcBZFVvuvdvNGCh
 gzUsCiXPhFtwQ5r1EDJOfhyubntjlJedfvUpuLie1/AuEXzSdfibenDdFfb3kMXQUiEh
 OOaRY/4BIM+n/H4qaUiy0ehzKS0GkAkWAyslMyueyH2F+8wp3CaJOcmXT9shuwrNiWnj
 nLZ55UgN2dSRqzP/HXE8p1xwK0cMDDFCJyis7M7mrf5UlgIx6sWPl6/h3t9vNWwt/WMB
 hRiw==
X-Gm-Message-State: AOAM531K0Q68Ing/sgLVkL0yGg6ai05DYIvznMCNrs0BTN/C90APx6Eb
 iIJI0QIr9Wuc3kXORBcbBwM=
X-Google-Smtp-Source: ABdhPJwfiYF4mHA4H/ZVUKgDdWYM9v4yXITGNIkKMRFFj2u6HGVFd3YbG9zdc7rsAPj4vSK+80OBjQ==
X-Received: by 2002:a17:907:72ce:b0:6f4:d139:c2b1 with SMTP id
 du14-20020a17090772ce00b006f4d139c2b1mr3117722ejc.563.1651846211215; 
 Fri, 06 May 2022 07:10:11 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:10:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Date: Fri,  6 May 2022 16:10:05 +0200
Message-Id: <20220506141009.18047-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The selftests, fix the error handling, remove unused functions and stop
leaking memory in failed tests.

v2: fix the memory leak correctly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 48 +++++++++++----------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 039f016b57be..e20c5a7dcfe4 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -4,27 +4,19 @@
  * Copyright (C) 2022 Advanced Micro Devices, Inc.
  */
 
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
-#if 0
-#include <linux/kernel.h>
-#include <linux/kthread.h>
-#include <linux/mm.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/random.h>
-#endif
 
 #include "selftest.h"
 
 #define CHAIN_SZ (4 << 10)
 
-static inline struct mock_fence {
+struct mock_fence {
 	struct dma_fence base;
 	spinlock_t lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
+};
 
 static const char *mock_name(struct dma_fence *f)
 {
@@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
 		return NULL;
 
 	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
+	dma_fence_init(&f->base, &mock_ops, &f->lock,
+		       dma_fence_context_alloc(1), 1);
 
 	return &f->base;
 }
@@ -59,7 +52,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 
 	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
 	if (!fences)
-		return NULL;
+		goto error_put;
 
 	va_start(valist, num_fences);
 	for (i = 0; i < num_fences; ++i)
@@ -70,13 +63,17 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 				       dma_fence_context_alloc(1),
 				       1, false);
 	if (!array)
-		goto cleanup;
+		goto error_free;
 	return &array->base;
 
-cleanup:
-	for (i = 0; i < num_fences; ++i)
-		dma_fence_put(fences[i]);
+error_free:
 	kfree(fences);
+
+error_put:
+	va_start(valist, num_fences);
+	for (i = 0; i < num_fences; ++i)
+		dma_fence_put(va_arg(valist, typeof(*fences)));
+	va_end(valist);
 	return NULL;
 }
 
@@ -113,7 +110,6 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		return -ENOMEM;
 
-	dma_fence_signal(f);
 	dma_fence_put(chain);
 	return err;
 }
@@ -154,10 +150,8 @@ static int unwrap_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(array);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain(void *arg)
@@ -196,10 +190,8 @@ static int unwrap_chain(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain_array(void *arg)
@@ -242,10 +234,8 @@ static int unwrap_chain_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 int dma_fence_unwrap(void)
-- 
2.25.1

