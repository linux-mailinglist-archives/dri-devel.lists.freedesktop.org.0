Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA936EFE7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56EC6F456;
	Thu, 29 Apr 2021 19:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C646F451
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:03:49 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso409791pjn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yyb/YNSoB7qsJI0gtnRn4yFC1/HgiSlGgAEsSwot2c=;
 b=LGqrMr9D6hoIMm3plfFkWBid7D8K+LFuzpyt1HzlQZ4IATRHtoAIgkMfeDUSqEMXWr
 /L1ikkVd9raijNK0xivnxMCA2sgcEmL/7MNZ3hqWCxOEmmw3sjOSOdHfj9X+Vpi9nIbO
 zPHOkcS5A6Sp597xO5gvUWpR5FeTlOge2+88sUhjx3Ja0kI+zh0PGUEQpw6Zd92SvkZ8
 wDsaL+52yb7+d6RdtC+/oby6YQy1R6RNTqq2WLfr45Lojaywy9KBSDvNvAUYb6gL7Nfx
 vNyDOmaABC7Kmn9tSvK5xqfw4C1iN084/83+i0ZzY8vTYADBZ7H49qVEdDvUD/MO5sq8
 b7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yyb/YNSoB7qsJI0gtnRn4yFC1/HgiSlGgAEsSwot2c=;
 b=Nxsuc2e6x6/4Ks19Csl3AG7tDllJb0FVOodlnnU0go3Q32vV2+uiVmoVbkQGa20ect
 Vn1H1A9XFj15Nqq+R9411vRJLAyDiflNhhtojhwfAvIAzDYbLEUdCVeIFKuQaVRi9EFS
 pF347Wn6aeEbkIHDaoXTonvbqHrCUH+ulYx0rQUo0q8ItX4TCB0CT5TlWeb5VHHYbUtI
 KpFIRXVPISTtPQlV2/JRYPrbfEY9hh6MHbCxAUCv5cSRqOcWvLc8KZraMB24zMwzdCGv
 gH/2+6WNeM/DX9OQEu8JgPJHdgIWPWsMK2YadjxQIa02ObtjKSuBHpn0jxKvHwE5NX7U
 uvCg==
X-Gm-Message-State: AOAM533cUF9P8iR3BXVm9cXoljid1cTd/f092XpJsPhMr5HkTkbGHWLP
 HsKALtHSI6tmdBF4GRoOcGTwDkKUFTtyqQ==
X-Google-Smtp-Source: ABdhPJyAj4z1uR7hs05qSoAcDMF97zj1w5uO/OP5pP7BbEMYrro542uwB90XvoS66RRJ4sXkQZQFiQ==
X-Received: by 2002:a17:903:31c9:b029:ed:6f56:9d1e with SMTP id
 v9-20020a17090331c9b02900ed6f569d1emr1327058ple.46.1619723028677; 
 Thu, 29 Apr 2021 12:03:48 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:03:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/25] drm/i915: Stop storing the ring size in the ring pointer
Date: Thu, 29 Apr 2021 14:03:17 -0500
Message-Id: <20210429190340.1555632-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429190340.1555632-1-jason@jlekstrand.net>
References: <20210429190340.1555632-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 3 +--
 drivers/gpu/drm/i915/gt/intel_context.c       | 3 ++-
 drivers/gpu/drm/i915/gt/intel_context.h       | 5 -----
 drivers/gpu/drm/i915/gt/intel_context_types.h | 1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 2 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       | 2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          | 7 ++-----
 9 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index e52b85b8f923d..2ba4c7e4011b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -211,8 +211,7 @@ static void intel_context_set_gem(struct intel_context *ce,
 	GEM_BUG_ON(rcu_access_pointer(ce->gem_context));
 	RCU_INIT_POINTER(ce->gem_context, ctx);
 
-	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags))
-		ce->ring = __intel_context_ring_size(SZ_16K);
+	ce->ring_size = SZ_16K;
 
 	if (rcu_access_pointer(ctx->vm)) {
 		struct i915_address_space *vm;
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 17cf2640b082b..342fa7daa08b5 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -372,7 +372,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
 	ce->engine = engine;
 	ce->ops = engine->cops;
 	ce->sseu = engine->sseu;
-	ce->ring = __intel_context_ring_size(SZ_4K);
+	ce->ring = NULL;
+	ce->ring_size = SZ_4K;
 
 	ewma_runtime_init(&ce->runtime.avg);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
index f83a73a2b39fc..b10cbe8fee992 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.h
+++ b/drivers/gpu/drm/i915/gt/intel_context.h
@@ -175,11 +175,6 @@ int intel_context_prepare_remote_request(struct intel_context *ce,
 
 struct i915_request *intel_context_create_request(struct intel_context *ce);
 
-static inline struct intel_ring *__intel_context_ring_size(u64 sz)
-{
-	return u64_to_ptr(struct intel_ring, sz);
-}
-
 static inline bool intel_context_is_barrier(const struct intel_context *ce)
 {
 	return test_bit(CONTEXT_BARRIER_BIT, &ce->flags);
diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index ed8c447a7346b..90026c1771055 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -82,6 +82,7 @@ struct intel_context {
 	spinlock_t signal_lock; /* protects signals, the list of requests */
 
 	struct i915_vma *state;
+	u32 ring_size;
 	struct intel_ring *ring;
 	struct intel_timeline *timeline;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index e86897cde9846..63193c80fb117 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -845,7 +845,7 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	ring = intel_engine_create_ring(engine, (unsigned long)ce->ring);
+	ring = intel_engine_create_ring(engine, ce->ring_size);
 	if (IS_ERR(ring)) {
 		err = PTR_ERR(ring);
 		goto err_vma;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 1081cd36a2bd3..01d9896dd4844 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2793,7 +2793,7 @@ static int __live_preempt_ring(struct intel_engine_cs *engine,
 			goto err_ce;
 		}
 
-		tmp->ring = __intel_context_ring_size(ring_sz);
+		tmp->ring_size = ring_sz;
 
 		err = intel_context_pin(tmp);
 		if (err) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
index e55a887d11e2b..f343fa5fd986f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
@@ -28,7 +28,7 @@ static struct intel_context *mocs_context_create(struct intel_engine_cs *engine)
 		return ce;
 
 	/* We build large requests to read the registers from the ring */
-	ce->ring = __intel_context_ring_size(SZ_16K);
+	ce->ring_size = SZ_16K;
 
 	return ce;
 }
diff --git a/drivers/gpu/drm/i915/gt/selftest_timeline.c b/drivers/gpu/drm/i915/gt/selftest_timeline.c
index 9adbd9d147bea..7eedecfb86e59 100644
--- a/drivers/gpu/drm/i915/gt/selftest_timeline.c
+++ b/drivers/gpu/drm/i915/gt/selftest_timeline.c
@@ -874,7 +874,7 @@ static int create_watcher(struct hwsp_watcher *w,
 	if (IS_ERR(ce))
 		return PTR_ERR(ce);
 
-	ce->ring = __intel_context_ring_size(ringsz);
+	ce->ring_size = ringsz;
 	w->rq = intel_context_create_request(ce);
 	intel_context_put(ce);
 	if (IS_ERR(w->rq))
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index fc735692f21fb..99bc9fed6fbb6 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1409,11 +1409,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *vgpu)
 		intel_context_set_single_submission(ce);
 
 		/* Max ring buffer size */
-		if (!intel_uc_wants_guc_submission(&engine->gt->uc)) {
-			const unsigned int ring_size = 512 * SZ_4K;
-
-			ce->ring = __intel_context_ring_size(ring_size);
-		}
+		if (!intel_uc_wants_guc_submission(&engine->gt->uc))
+			ce->ring_size = 512 * SZ_4K;
 
 		s->shadow[i] = ce;
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
