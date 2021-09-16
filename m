Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25FE40D8CE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D556ECFC;
	Thu, 16 Sep 2021 11:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8217B6ECE7;
 Thu, 16 Sep 2021 11:31:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso4230626wmd.5; 
 Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nKJGab4KxNdwiRXb5cOBKKfaCdcTidREjaK9cb7+I50=;
 b=faC9MiRQTffUsa9jeg4wzjIR+8ziw8LUSd/l7eg45cOhMU4ErUSfimwL4tqzjPghpt
 LuNCyQJ86XDUiv+5Uexn+RL9LYs+ixfFp+aQXprFunAoIjC728oe5hmkbPzORbc5aD6k
 zfJkmBLyOW5jOYVf0reUr8LNw4MG983Jav4CMltaJ7frH+X9l5n9SeKDtNNK2cT3UrtQ
 FEOCUn/wY3v0dlMDfc5T8F7dOp/P67KWFS0kUBgeVRKp85tOk+VRKJC2ORsXTcr42GZi
 mk/0ZpbauxL0WZjXi9PDG/BuoT2MjcPXnMCwmPLWkBDLbo7sgUtclt0pl5onmRKZWK32
 JynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKJGab4KxNdwiRXb5cOBKKfaCdcTidREjaK9cb7+I50=;
 b=3ejhpHzUmDuIzylisqTb3NC7HpJo7ySPvO6rLEqSYiU9tNp5lQ6FxHqySqSLtC4SWI
 tJz1DDQqHEVBwBPdISK8R0aIx9rL5LDDL7P6M8d/BUKTSoRFI+RVM/CCnnNHTwI2pI5w
 Y0DSxGPwrZzv1to6X6hvLoEltIxrSpLchsJJnS9xyZgJVXDJYOr14eSeuMKnyZPDWKaE
 OtVX1rSXq9qHpRe7JsPvxv2qewXTFuiBm39cz5a65hNHdu7JqNWCrihHdgnezf9PKLzl
 F9LNEc8TL4HQdQSrpENuHOWgSHro3zmiNnPZ2b3dLl34dMqcx917QlJ99i8oGA4Kn31C
 QMSg==
X-Gm-Message-State: AOAM5314VPEeQ0c1M7UKCfu7sTTkjps9KCtZlSRWsV4fZ6O+WNGpaEY4
 DAZ+4UrRW/PPmY5Ilpf7Sxs=
X-Google-Smtp-Source: ABdhPJyZjUH4DtJZeezkSkAZ1UqJnFkp/cGf8pQdOoCFKn3HbozqyHhH6ejvkAZtKawfIwM534rzUQ==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr9530127wmf.82.1631791862006; 
 Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine v2
Date: Thu, 16 Sep 2021 13:30:34 +0200
Message-Id: <20210916113042.3631-19-christian.koenig@amd.com>
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

This is maybe even a fix since the RCU usage here looks incorrect.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..7ff0027af7d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,17 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+					 fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
 	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
 	return engine;
 }
 
-- 
2.25.1

