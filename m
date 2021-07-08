Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266403C165F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2546E8FB;
	Thu,  8 Jul 2021 15:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1686E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:51 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id b2so8301594oiy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1v8ZnznCUlwOzu80aP7iRZ2Mr93SQJISpdJGhA4G/WM=;
 b=Vkl5aOn60YKTo/BPeVkA8PR8sO3m8PTcp9+tIss88RJF1zZ4/4ZWALBzmfTdESANkU
 b2ZoNhfKLL4c4K1p2DvCViLBsXYlCACYM73KRT6o9F1907NlwxnqVZSUD92FDurGbG0a
 tqHXInUvILMNEvityf2BUm8h+ahIQF3oC7dQSOiNuO72hGrtQs+lynaKGj4JOlpdzGQ4
 eImIO8R3WqkkWqajhKdrTk9CVXm2fohTX1ARVM9YQcjQrFiJukyWHTn0J7O8iYz5lTSE
 b7vv4+D0aMt59+t0uL092e2PCIFOvzl6S9Dw9dUnGYcuQujGRB8jDGh8PBEqog651mPn
 fnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1v8ZnznCUlwOzu80aP7iRZ2Mr93SQJISpdJGhA4G/WM=;
 b=FcNUg7AW446pP4/4lQ9avLICkaJSt4KcePi28vV25ottS1fNcBUIoTrQYzURgW2ngV
 3SR7mApN4Z+giSOHslEgXEvZj6L+WacBaUD94Kr+1b8SBRIJD6jGES5UJjAdZPQuXYOd
 PciYKzIWKlbojQDDwJ5jmptaHCBWuQ5OhSUxkm0l3qCv+1nCYh7nafAhHAOg3IfK/aph
 EIbU5fE9m1y72EI5Ee8KQzbzI3fWgYtUIEb7iiyL4j4nzb/QKZ8BXm/T+hVkMPW+3CWc
 G9QnPKNTjP7JixBkkIllw0otrb95UO0Mz4bKCoA+jS5ydPrIvPFCY0T4L8w6sKIUgIwN
 h1kA==
X-Gm-Message-State: AOAM5307PmJ1cIXlWoQssQBZz7sCv2Of0RSO9A3NLTmq1RMpJLXho1q5
 nlZSG4MnXsMMd5+cSREgX4s2DA==
X-Google-Smtp-Source: ABdhPJw/o16PlgpgR4gccLks9uevMqo/VqFe0kB0Ymi6l/ETgkgDxNQ8uNqCMahha7UviF/P7I/fug==
X-Received: by 2002:a05:6808:1150:: with SMTP id
 u16mr14347226oiu.63.1625759331211; 
 Thu, 08 Jul 2021 08:48:51 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:50 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/30] drm/i915/gem: Remove engine auto-magic with
 FENCE_SUBMIT (v2)
Date: Thu,  8 Jul 2021 10:48:15 -0500
Message-Id: <20210708154835.528166-11-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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

Even though FENCE_SUBMIT is only documented to wait until the request in
the in-fence starts instead of waiting until it completes, it has a bit
more magic than that.  If FENCE_SUBMIT is used to submit something to a
balanced engine, we would wait to assign engines until the primary
request was ready to start and then attempt to assign it to a different
engine than the primary.  There is an IGT test (the bonded-slice subtest
of gem_exec_balancer) which exercises this by submitting a primary batch
to a specific VCS and then using FENCE_SUBMIT to submit a secondary
which can run on any VCS and have i915 figure out which VCS to run it on
such that they can run in parallel.

However, this functionality has never been used in the real world.  The
media driver (the only user of FENCE_SUBMIT) always picks exactly two
physical engines to bond and never asks us to pick which to use.

v2 (Daniel Vetter):
 - Mention the exact IGT test this breaks

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h    |  7 -------
 .../drm/i915/gt/intel_execlists_submission.c    | 17 -----------------
 3 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7b7897242a837..30498948c83d0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3493,7 +3493,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		if (args->flags & I915_EXEC_FENCE_SUBMIT)
 			err = i915_request_await_execution(eb.request,
 							   in_fence,
-							   eb.engine->bond_execute);
+							   NULL);
 		else
 			err = i915_request_await_dma_fence(eb.request,
 							   in_fence);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 5b91068ab2779..1cb9c3b70b29a 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -416,13 +416,6 @@ struct intel_engine_cs {
 	 */
 	void		(*submit_request)(struct i915_request *rq);
 
-	/*
-	 * Called on signaling of a SUBMIT_FENCE, passing along the signaling
-	 * request down to the bonded pairs.
-	 */
-	void            (*bond_execute)(struct i915_request *rq,
-					struct dma_fence *signal);
-
 	void		(*release)(struct intel_engine_cs *engine);
 
 	struct intel_engine_execlists execlists;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 98b256352c23d..56e25090da672 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3655,22 +3655,6 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
 }
 
-static void
-virtual_bond_execute(struct i915_request *rq, struct dma_fence *signal)
-{
-	intel_engine_mask_t allowed, exec;
-
-	allowed = ~to_request(signal)->engine->mask;
-
-	/* Restrict the bonded request to run on only the available engines */
-	exec = READ_ONCE(rq->execution_mask);
-	while (!try_cmpxchg(&rq->execution_mask, &exec, exec & allowed))
-		;
-
-	/* Prevent the master from being re-run on the bonded engines */
-	to_request(signal)->execution_mask &= ~allowed;
-}
-
 struct intel_context *
 intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 			       unsigned int count)
@@ -3731,7 +3715,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 	ve->base.sched_engine->schedule = i915_schedule;
 	ve->base.sched_engine->kick_backend = kick_execlists;
 	ve->base.submit_request = virtual_submit_request;
-	ve->base.bond_execute = virtual_bond_execute;
 
 	INIT_LIST_HEAD(virtual_queue(ve));
 	tasklet_setup(&ve->base.sched_engine->tasklet, virtual_submission_tasklet);
-- 
2.31.1

