Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44830371896
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3B476E8DD;
	Mon,  3 May 2021 15:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273A6E8DA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:57:59 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id gj14so3366843pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOJc6Wbo+mGPM1Xn4HHj4tdptEl+2G1bmLy48WVpzrw=;
 b=012+nApqKVXF4VC2mRZT14svXbiTf0RQHRGO6EMdcXVOG2/VxsysL9sx41epx5xWYo
 8WhOU/n9XXGyOEIgpCTx3JbpNT9JmwyEsDvtmZIFykxEPPwrS7SV7s20z1m/W2d9ZhXI
 ly7xjfGltfGS+viMAe+G7UWrSeTLXwCd88aMXFBu6ibTVrfT5qeLXB0Avcu4M9VqwUs3
 cqR5H0lNc6SvPDHJrINDo20nCf/vmNXZr6WQ3QqYq/TG4jr9lvnz8OzcfEAHAPJpIZWl
 3LNEIKg8+ZuEnX4NIsTFNhREq6VYCl4ifcE+BM3jzVVcwSAFhzgMiUqZ7TUtcOCc8vqH
 WnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOJc6Wbo+mGPM1Xn4HHj4tdptEl+2G1bmLy48WVpzrw=;
 b=XeHYeAlLQVOGxlB8abMgc66z+QRIVyxLNPTDauV4uX4wW9d73DrLCy506BNoIeCbNb
 gQdG2UWoVPLXKezYG7d2XGVbfdvbgxspqj4EIydi+NCmK/O+zbTDLtrdKWgMmsJHKgUO
 +H0xxqV6eVzwk6pPPA5oookCFkXBjDHwlyXDjgemD78k0dwxHUARoOrcQHXAIiqA1xKo
 amPuGXkeHh9hx1VUssraiCEpuoI0v4HKJ6BqX+KKqEsVdQOPDICcl2sEvzoQhq/qIVV3
 Uw3/21qnrWUEqQap1RgEAS4tdlOxiv4+No257LuxJKVlsdnzDmCW5Ep25b8oYXXZCn81
 vxZg==
X-Gm-Message-State: AOAM531Kjk8CWGf7kE3l1iH0mp/HUPAz7Kde5dQCv/ExAvJUHltx6zEr
 18uoAuJLOhy4OzlUoABfyYQKlEpy+k5/CQ==
X-Google-Smtp-Source: ABdhPJwhdDqbIso57TiLnBNPfPXSgVTG09quY+DGuJaozAvisiPsctBd0H95XnkuXQrOBBh6Oew6bA==
X-Received: by 2002:a17:90a:7893:: with SMTP id
 x19mr22544103pjk.3.1620057478540; 
 Mon, 03 May 2021 08:57:58 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:57:57 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/27] drm/i915: Stop storing the ring size in the ring pointer
Date: Mon,  3 May 2021 10:57:23 -0500
Message-Id: <20210503155748.1961781-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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

Previously, we were storing the ring size in the ring pointer before it
was actually allocated.  We would then guard setting the ring size on
checking for CONTEXT_ALLOC_BIT.  This is error-prone at best and really
only saves us a few bytes on something that already burns at least 4K.
Instead, this patch adds a new ring_size field and makes everything use
that.

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
