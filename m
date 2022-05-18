Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507552BBA3
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49010E617;
	Wed, 18 May 2022 13:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78CF10E502;
 Wed, 18 May 2022 13:58:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p26so3141086eds.5;
 Wed, 18 May 2022 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
 b=VaJFZLw0LprpsNUgjJ6h9S15BhSD4Bgqsbgqoe9hhkd/sSRhs/NnELUHtMAG04V+lM
 0h+1aAkqJTic9XM1pDSyOGoL7BEtudNBl52JyGXjmEATrV6y1kJ6TkXgjxhvbrC7AB9+
 R/CiajVqk8BnL0vanrwUcs4ht+yuJkOQ3xxql1CRy+fiU49SP6M1777ActLArRSrwvKY
 qXE0KRyMDJAXufTyJVzfvJEhy7JfrQ44UNNBYu5Gru+dTGxp+sgK2bMLVjcCIl3f6C+q
 Sb5OcFcnlPRJs2QihyjlGMET/i8AbafNAeOOaT5iBYuNYmStlTiQ/BNGycg2wiDspnSN
 eMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
 b=wgd15wW6zOlyiJm7Y0007f8CCGSnMUE7MuYE+lWEbCt369gPAbDYIvqLXAZ0ItrSjz
 3HoZnqtNfH8HR6ZD2RBE/46QjuD7yjnQLKXwItW3KbIX0VryGP8azVwR3ADGEuzXRdQd
 bF/uclZp9mz24G4SPlxwtLiMTMAI1CVlEAs3xxPFttH3yJyGp+Ouy3Un2mAkGznPD+08
 W5Djm4Rx3NLCvZmSTqfkEnrLT/IU5G3PzmEcBwAXq7WDYfLNmYSy/LimhEGwuD5xx8GN
 kTzo2G35Ws0p+LezSogCHx+Y6L07ipZlu9/IC+9xJeYGBfpDzu/znajtjHdziScVUiCt
 6lgg==
X-Gm-Message-State: AOAM532+rIzkT6jOGs98Oc5T79Kd3IMJcOPGT3rBE5RotGawTqe6r6ii
 DtNPV8WEc4Ot9vmRrlZOWOWNOGkLXBc=
X-Google-Smtp-Source: ABdhPJzfnZf+L6e0bnFqAw70jl9I2vbCXcMEjkOwBU0PZYP5IesTdrld7gru2xSZdFZ93dZdf3VphQ==
X-Received: by 2002:a50:9b0d:0:b0:42a:4bda:c70 with SMTP id
 o13-20020a509b0d000000b0042a4bda0c70mr25010668edi.287.1652882328317; 
 Wed, 18 May 2022 06:58:48 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm1388917edt.26.2022.05.18.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:58:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Date: Wed, 18 May 2022 15:58:40 +0200
Message-Id: <20220518135844.3338-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518135844.3338-1-christian.koenig@amd.com>
References: <20220518135844.3338-1-christian.koenig@amd.com>
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

