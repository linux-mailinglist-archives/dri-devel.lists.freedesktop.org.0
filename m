Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5584138AC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083B6EA00;
	Tue, 21 Sep 2021 17:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF26E9D7;
 Tue, 21 Sep 2021 17:37:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id i23so41645125wrb.2;
 Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
 b=B56OpWSJxDJSmXRdA3znPhFcOHH9qgPRhamp/ajhbXWIKt19u8xNRcK8wMwFEMgJob
 phirQpWLn2OO6EF5hmb14FMkKYG1dOmvADSOvH2QaqdetbmoHVlu6ARer9fMjoAZrjdZ
 z1Uru51F1zcCGFW4uDsZuJCC/pOUvYNITfcnD+FJO0muNhg80KN2A7sJnG1ilLvAfMu3
 X3QJKtpy7/pcnrtmed+7/1dT+Fg+6PMjXV3a/xbqjUvRBV1/cJong5OznosmKeyvCZtE
 rBhqb0WMsyp5+bxvcHth+5XttCjl1k3dUPfOx9yZnmD80qJKrnk2faWGgtLPoBK1v7Ze
 jUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
 b=pyVKoVVOe4qmiHhJi8bPzkqAfwja5Y6LYs/SP37yCTfHLDJL7DM3blvnuJ/m64YzYO
 yAbMoEOMb7A8VdsU1Irx7M5BbhFYTDWg+tHDcuYqfaJnsVrx8yRmPe1S2tyMgPvZY5XJ
 RemVqKH/8c3jS6sZ+21A1VJOtS9ohIwyb5kvfTOIV3SwfWGbd/s/MiSzvmnEMTTZb7zh
 g0BgMeD00TddvXVaylAMAY0KULDeqQeWRi28/a0YA1+Qpd2lNWhol39EsulHWA3m1FyR
 1lNyEge4TZsRl0BX0c3S9nFGN4fZA9VeyEvB0BxKSJ/z8E5SZpBdskVfndc60H7NNImN
 Y7IA==
X-Gm-Message-State: AOAM531Av/kmkUf5j5Mpnfcf6c9fXbE7u8HLOsxf6ZA1QagRdirgwcY2
 Kk4yM2vbyiPhsoNQqTR9PTg=
X-Google-Smtp-Source: ABdhPJyYSyjjuGb1tYtiMOCLyKPymW+VUjeVQaofYEkaqbVm39NN+2lth5M4PVJUFa/V9hxpjfPnVw==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr36472508wrr.246.1632245839391; 
 Tue, 21 Sep 2021 10:37:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
Date: Tue, 21 Sep 2021 19:36:51 +0200
Message-Id: <20210921173659.246165-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..e20efffce3a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	return engine;
 }
 
-- 
2.25.1

