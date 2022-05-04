Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA19519F27
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9EF10EA9D;
	Wed,  4 May 2022 12:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823E210EA9D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:22:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so1757236wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2dYbzpbHvQMo1jShWOwpkjE5/wTuIDOzNVfw59wRas=;
 b=V8shUO/xhYYbGZxdaNXzcK+WSqnYEbC6vYpIe/DgsNDk/dO+GmoNGwGyQyQLbVU9OE
 iElPz6pcmk3jEpAVYaMdpkyYKF54+3jG92k2DdgkCFNUq6HTNk9H5mKoqSSmaikNXOJv
 qJXof+/srLWZWFkSKX13xgjjPwf4WCm92SuHFyV8AvOoUjiLhEJGtlm96SA1PGaMp8c/
 RedoRDc74gzxjOXdgSZjJLpxr9ucuUwTYtrXdzd746W8b39SoUsn1KNlL7uvAKMgJMt/
 w+H+pbpyGqDKy3FLVOoHIL2muANFh3Kf/bfEEPJn9PKUNG4qlt3JDujI5j39BaHDLu/v
 mhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2dYbzpbHvQMo1jShWOwpkjE5/wTuIDOzNVfw59wRas=;
 b=YzrfylWP7JWWX7KGWikup0QYwGEADnWk/681jSdkGml+C/5iDNKXRcOS1ErLSzN/p5
 Ohg8u3PdwIyO5jwfrEUf/jqWcq/iTwbiJC1InutjtCKxxDGJlsfKplVlShgqrXPs3vA2
 mu3t2ngS4QT3wMr5Hv5DSp0ZJpcf1lQAVD4GX9c4GqbO3J4MPdtKN57+k/KMzYXCY4wj
 W+zKOGqyvvvwmiWSZgU9C+Ue7XM+ptRqui9/ukIojOoo44xVhv2DrS0bVVV3NTXrJO3X
 XsB9GaBfbjXQ06uc65Ys1HP2twgIKHLtQw2X9MDqJvoweF/DkZKcrycCh52T4OEeytNZ
 kVEw==
X-Gm-Message-State: AOAM532ly2t3TjKTzQbYQcAInlyACvmafuUDreR+BtHm1WZA3f5tFT86
 CRiqg2TBwOnYvqjrJ1/PL0g=
X-Google-Smtp-Source: ABdhPJz3kydFY+B/6iKFZcfRMy8REtjbOq66KG75DTt9bv0nOKZk2oLXx1bF/92Na3BGZlRTJLMNtQ==
X-Received: by 2002:a5d:498d:0:b0:20a:dc6b:35c9 with SMTP id
 r13-20020a5d498d000000b0020adc6b35c9mr16348694wrq.176.1651666978028; 
 Wed, 04 May 2022 05:22:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b003942a244ed1sm1462119wms.22.2022.05.04.05.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:22:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest
Date: Wed,  4 May 2022 14:22:52 +0200
Message-Id: <20220504122256.1654-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 40 +++++++++++----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 039f016b57be..59628add93f5 100644
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
@@ -113,7 +106,6 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		return -ENOMEM;
 
-	dma_fence_signal(f);
 	dma_fence_put(chain);
 	return err;
 }
@@ -154,10 +146,10 @@ static int unwrap_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(array);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain(void *arg)
@@ -196,10 +188,10 @@ static int unwrap_chain(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain_array(void *arg)
@@ -242,10 +234,10 @@ static int unwrap_chain_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 int dma_fence_unwrap(void)
-- 
2.25.1

