Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3223A0B5E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42CD6ECA4;
	Wed,  9 Jun 2021 04:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813196EC86
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:23 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso638186pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sgele2oDgXsYUD7TuLFu9+dvT7yZeM1YGlkIHrb0l3Q=;
 b=FIKu/+Rwb/XKrIFTtHg9IEXFhcl6u119JfADbeB3PmH1tX5CFUlMEhIpQI7UgXWyOf
 0fvQWcdDlPE9t7Wv4+s2WkLTtUS8qr7lHSkhfC79dB5upJOACt0J1Om0fRAjtSn2Rb68
 fTMRhjMwiPCo52BfKDNoz2UmaJh5WFEshDQc6laP5Snsj7D0QwbzQxuoSvGDH5xzK7r2
 IjjUQhXblCMoaMxSflwCQQrJcv1v88JhGPjB9DuDGeSRpk1xgYls5jRSJ0YGxL9Lmibp
 73QAEkuABXa/gSv6//i9lBybz2j4EcCEz07ccE/8vZvtBbUJvlypzlT14FoOKgYLFyJK
 Osdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sgele2oDgXsYUD7TuLFu9+dvT7yZeM1YGlkIHrb0l3Q=;
 b=rZ36zZuAGkh1QyBw6I8BCyDdlBVVYBVCzI+peuaOFQdRLnlQ5k7U4SXEg5j4hIuK9R
 cGMOX7vrUtHK0ULCTl9UOiltdGtEtu9hRwBOxdCoJRoWZ+5Z5wRxi5R4mnduQAkPvbDV
 5tG2PqTVS77An7mkJcgxhpUFbTpFBZV0g5oEEW+o41oVkR8p+hXpUG9lZlN4tshEnI7A
 0Hz3cryXGxo0QHLDXh9Ej/uKnRpjvJT6ZtvSjdkgJkl0SeM1RYxhJYV2MQiWgteImkyX
 nMYfSY7Ju0kpYh9pPeuBUr2z0oDZ8kULqH77ljCFk2pVfnSARQUx9BzY1C7rCCOwKSMV
 hn4A==
X-Gm-Message-State: AOAM530Qey8Fk0z1B4bMqaUPbprakVRgTlWtGuCmhEG9n2pgfMb2dTNZ
 YF1zsTbIyK10HuSiwXSfGvDLekuKrINnmw==
X-Google-Smtp-Source: ABdhPJzgvB/ymB9UL/4ZorjRs0UJFP5wCF+lTJxNg9YoheopteqNXATvfCUPbykR9m4mdYz06CnzLg==
X-Received: by 2002:a17:902:748c:b029:105:a850:2449 with SMTP id
 h12-20020a170902748cb0290105a8502449mr3254178pll.75.1623213382744; 
 Tue, 08 Jun 2021 21:36:22 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:22 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/31] drm/i915: Stop storing the ring size in the ring
 pointer (v2)
Date: Tue,  8 Jun 2021 23:35:44 -0500
Message-Id: <20210609043613.102962-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, we were storing the ring size in the ring pointer before it
was actually allocated.  We would then guard setting the ring size on
checking for CONTEXT_ALLOC_BIT.  This is error-prone at best and really
only saves us a few bytes on something that already burns at least 4K.
Instead, this patch adds a new ring_size field and makes everything use
that.

v2 (Daniel Vetter):
 - Replace 512 * SZ_4K with SZ_2M

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
index ddc3cc3f8f092..a4faf06022d5a 100644
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
index 4033184f13b9f..bd63813c8a802 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -371,7 +371,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
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
index a27bac0a4bfb8..8ada1afe3d229 100644
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
index ea2203af0764d..ed5a8142c543d 100644
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
index b9bb0e6e97f7f..8763bbeca0f77 100644
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
index 64da0c91dec1d..d0b6a3afcf44e 100644
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
index 734c37c5e3474..b56a8e37a3cd6 100644
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
+			ce->ring_size = SZ_2M;
 
 		s->shadow[i] = ce;
 	}
-- 
2.31.1

