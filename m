Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4774177BA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FB76EE4D;
	Fri, 24 Sep 2021 15:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF97489EFF;
 Fri, 24 Sep 2021 15:31:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t7so28542090wrw.13;
 Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
 b=pFwZpIzK/LMtY4OsZhjTXzHSD72F01e+k2NV8lY6cZ7PGoSTxw3n6jgeiq4UhDo5JI
 jgdJEwvyr31jJT4CPMMF0TEhEAZRN9620dWtJs5o9bmhiKD2beVKeh/BfMGbT+teNKrL
 js2gt4P2AkNYQ3x2eBQh/pCSaHp0YGNWgInxbKgRmYQoW58ykaCeKnDnOOKvbTELJsMD
 8Gh3+rrb4kSPIDdT3p/Rn9BSbu0/B4zmGm1h5D9UtQGfi1pzWsnT4u5jm3DCu4uwmLKa
 OcCpLKlDOnP1LZdTvlM1SjhnIk3ijiZK6s++8F4BmimDUoRPDPHT6BFElXfoGfXgZw3C
 kj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
 b=3gJy8OSNNXmQsXd6zY+pl4xiUzBjr2rxZsdPaw96YgcjKrBvR6Ba8pP+qmVIpOTlwS
 bF9m8ani+y8vshMhUGgFbuHtgl68y1yGypBKAYUsVSGey4IivW4SILncKdigxde278Ks
 eFXgaxODX32uWOs+x7mYlJGlsyNoBo52X+PRO7Lfmbng0vdpgEyNZex4/hg3Ju4hLXhy
 XOnUKo7656+e2Ngm1KaFrQdnK88XmjAHnGffpAmX/PXrxv2Pw1bW4lScde5eLjbCb2OV
 InYTSRL+GRYf5Kvr642aYXhxXSlOd1ArwSeWDUEwe18l2cHbEiKBpB1HyrbOOp7q84Ew
 5hXQ==
X-Gm-Message-State: AOAM532GAEfppUAyUo3DRNESF2gwthKFhp465LI9JL5kOc08ndDCK/TB
 VuC77O+LjjzN62RlpGrXo0k=
X-Google-Smtp-Source: ABdhPJwWULq+EjLBYu8IpzfvBCbg1EetZ0enHJ6BjWFO8X3kOoGEU7xjuFzefEKYfgPy1rAVdzphSQ==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr11902637wrx.303.1632497494380; 
 Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/27] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
Date: Fri, 24 Sep 2021 17:31:03 +0200
Message-Id: <20210924153113.2159-17-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
    held here anyway.
v3: back to using dma_resv_for_each_fence_unlocked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 53 ++++++----------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..7ea0dbf81530 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,25 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
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
+	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
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
 	return ret;
 }
 
-- 
2.25.1

