Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CFB3A1C21
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786C16EAB6;
	Wed,  9 Jun 2021 17:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C5E6EAA4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:41 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t9so20142751pgn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sg/RDSIpH9ANRtVdKJYWolhXQFuO7nZkkGIGEry1Wg0=;
 b=LYeXGr3EqvxlS+o+XCXon3IrGbE6Bsy7psfBFm0PytqkZa6/TM2BwPgsc0pSn6M/9G
 KW6UXpgflYkshAnrvLt7WTxy9ygkE3AvQippP7QMPPyyFkcmcycrkIxO4yz8+JHeHlAH
 TuJqVUu8XEiEea35lFe8aKlT6DLCqLu71bAYmCzOFDJoZsIqzDrcWzhpfPVhU/Lrzwoz
 PUHMbFkRqv2gW2y46PaK1V2J3AIUgzc/ndYnvA6LUq+VRpAZ3ZxduD01PtHN1nUbr6+X
 N6EDgkxJfOhWV/LacTgCaYg37LsO2kZCZLwPJI+WtJuA0HByqMEmWpO4O6M0QosSj6F3
 km0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sg/RDSIpH9ANRtVdKJYWolhXQFuO7nZkkGIGEry1Wg0=;
 b=JWKzzatSRptlhe1rRXaehyqrEc9e/pktO/Tor5xpg9DihBE5A48yeRaBXR/wL2eJ14
 b3ikT61+eDrqx33rsnrEaWSXDc67ydnxjcg4/tvNM/Dp6zEXfpGtyrYOxf8lLph39rO2
 9HAAa8Sa+lbMhDz5lRVdfDk9BgOsBC7rmJmEtqo9fTT8NvOdRyDKgi1Ow12EEkPXmYFQ
 toiWSXwU+EaMPuRT4ta3rlvPE2fH0JeFgBr9gT6IjpvubPiSyw09xAW+P0orWfTSGNPm
 IMU0Ah+7fsKoQs7BzBmdwW1OpGqC59Vh2ffCSkhOebA00RWyXdVgI94XDVc0K6LXTRA2
 zvpA==
X-Gm-Message-State: AOAM533OKW8f68xCHiycnl2SpnI2LtzJ/a2X0t9EYCy3OTeHIx4hvMKK
 ykJG0yyeBPMYk24ikM9Z4kKEiw9Oyt3Asg==
X-Google-Smtp-Source: ABdhPJz5RHGRNgJR2UUD6BUOc+yJ5MEGqX/AMXHGhr04ShXpiKng1UII7YgajacYES73ifTlogs7sA==
X-Received: by 2002:a63:ed4d:: with SMTP id m13mr794514pgk.433.1623260680708; 
 Wed, 09 Jun 2021 10:44:40 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/31] drm/i915/gem: Remove engine auto-magic with
 FENCE_SUBMIT (v2)
Date: Wed,  9 Jun 2021 12:43:57 -0500
Message-Id: <20210609174418.249585-11-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
index a6a3b67aa0019..88e7cbf8fc5f8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3474,7 +3474,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		if (args->flags & I915_EXEC_FENCE_SUBMIT)
 			err = i915_request_await_execution(eb.request,
 							   in_fence,
-							   eb.engine->bond_execute);
+							   NULL);
 		else
 			err = i915_request_await_dma_fence(eb.request,
 							   in_fence);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index e113f93b32745..eeedb2f457ae5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -447,13 +447,6 @@ struct intel_engine_cs {
 	 */
 	void		(*submit_request)(struct i915_request *rq);
 
-	/*
-	 * Called on signaling of a SUBMIT_FENCE, passing along the signaling
-	 * request down to the bonded pairs.
-	 */
-	void            (*bond_execute)(struct i915_request *rq,
-					struct dma_fence *signal);
-
 	/*
 	 * Call when the priority on a request has changed and it and its
 	 * dependencies may need rescheduling. Note the request itself may
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 38fe91205c77d..01e77ba397372 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3587,22 +3587,6 @@ static void virtual_submit_request(struct i915_request *rq)
 	spin_unlock_irqrestore(&ve->base.active.lock, flags);
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
@@ -3656,7 +3640,6 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 
 	ve->base.schedule = i915_schedule;
 	ve->base.submit_request = virtual_submit_request;
-	ve->base.bond_execute = virtual_bond_execute;
 
 	INIT_LIST_HEAD(virtual_queue(ve));
 	ve->base.execlists.queue_priority_hint = INT_MIN;
-- 
2.31.1

