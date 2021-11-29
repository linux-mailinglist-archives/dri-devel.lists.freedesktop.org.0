Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED94461484
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABDC6FA59;
	Mon, 29 Nov 2021 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDE66FA4F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so12235701wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geVPPhgHjz1swIil7f1f6R6mX3W1srW0yGMjQgdInFA=;
 b=V4/7YprZvPKdpTMMlvWiQCsm7Rsuv1lmsiqUAu/sI9d0vWKYVdAZrJzK6/IsX29crU
 rtTqDeNZ1SKzYK0GOv5Ps6/D1EG4SXK/OmnX0s+4YI9GNYEnovv+AQv3DVBEspGhzxAi
 vEuVKuQjgbkepSwV5zqkVLIi2ljjQr7dtB4Pu6jVdF9TxOE9jrtJMzvHeYXZQWsVrsLG
 fqJWL0TXoq6CwDAJk/ULJBaObnUOODYNJ5PVFuHKacSD4G3/UxYOmaAnCw9hu3Jhri5v
 ar9mCsN0cOLhQjhm5D6ZiofNp4ywsVQCC+MbBvWnZSwG1d6RAXJdb16/X4DMeAmNZjmn
 igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geVPPhgHjz1swIil7f1f6R6mX3W1srW0yGMjQgdInFA=;
 b=eN1gAikBiC3hcMnfxqx0MIrM33H06SElYyHLWth8bRf4psfIoSb2pfWh2NkR2+oPds
 nc7AruUSADXc2IPmsVvGkO4h6atzU/VM2IsNWYUeaYRArZHzjv4Jf+Hq3BqfBAp66niI
 nyw6R+Uk3SFSq5+6I9TvU2e/yei7111N24zwt3d10nLuygv3wacyT+K7b3XdTZWH3nQi
 wRIu1Tzz6iwSit4yzV/lNPKxfkFOTTv6tsNTZK3aInJk6l0rWZ+E09EBNruU/n+lQSWP
 fEDSvs9e3EmpKAxpgTDMFP7NjphyO4lWrrm82tHES6nrFkXE/lD+J024HZviU0or3Lxv
 ifUQ==
X-Gm-Message-State: AOAM532K5RS4KDHY1+hUugXAvppTTdJoI7mS56WwbxXLhrB7IHXRsDwj
 bczuvu8v0lJJMx09e6XPRfU=
X-Google-Smtp-Source: ABdhPJwF2F9DwX3DXfnuONALNiR60hKlsexxxFdKpXGs2X9nnbOVlqOmLesP14ncSVKZyrPv1v12Xw==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr35244547wmo.136.1638187623531; 
 Mon, 29 Nov 2021 04:07:03 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:03 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 01/28] drm/i915: Remove dma_resv_prune
Date: Mon, 29 Nov 2021 13:06:32 +0100
Message-Id: <20211129120659.1815-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The signaled bit is already used for quick testing if a fence is signaled.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/Makefile                |  1 -
 drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
 drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 ---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  8 --------
 5 files changed, 42 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
 delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 660bb03de6fc..5c1af130cb6d 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -60,7 +60,6 @@ i915-y += i915_drv.o \
 
 # core library code
 i915-y += \
-	dma_resv_utils.o \
 	i915_memcpy.o \
 	i915_mm.o \
 	i915_sw_fence.o \
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
deleted file mode 100644
index 7df91b7e4ca8..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#include <linux/dma-resv.h>
-
-#include "dma_resv_utils.h"
-
-void dma_resv_prune(struct dma_resv *resv)
-{
-	if (dma_resv_trylock(resv)) {
-		if (dma_resv_test_signaled(resv, true))
-			dma_resv_add_excl_fence(resv, NULL);
-		dma_resv_unlock(resv);
-	}
-}
diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
deleted file mode 100644
index b9d8fb5f8367..000000000000
--- a/drivers/gpu/drm/i915/dma_resv_utils.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2020 Intel Corporation
- */
-
-#ifndef DMA_RESV_UTILS_H
-#define DMA_RESV_UTILS_H
-
-struct dma_resv;
-
-void dma_resv_prune(struct dma_resv *resv);
-
-#endif /* DMA_RESV_UTILS_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 5ab136ffdeb2..af3eb7fd951d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -15,7 +15,6 @@
 
 #include "gt/intel_gt_requests.h"
 
-#include "dma_resv_utils.h"
 #include "i915_trace.h"
 
 static bool swap_available(void)
@@ -229,8 +228,6 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
 					i915_gem_object_unlock(obj);
 			}
 
-			dma_resv_prune(obj->base.resv);
-
 			scanned += obj->base.size >> PAGE_SHIFT;
 skip:
 			i915_gem_object_put(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f11325484110..cd149aa99364 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -10,7 +10,6 @@
 
 #include "gt/intel_engine.h"
 
-#include "dma_resv_utils.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
 
@@ -52,13 +51,6 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	}
 	dma_resv_iter_end(&cursor);
 
-	/*
-	 * Opportunistically prune the fences iff we know they have *all* been
-	 * signaled.
-	 */
-	if (timeout > 0)
-		dma_resv_prune(resv);
-
 	return ret;
 }
 
-- 
2.25.1

