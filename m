Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D73A0B6E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D516ECB4;
	Wed,  9 Jun 2021 04:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB646ECB1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:37 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id y12so6544999pgk.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sg/RDSIpH9ANRtVdKJYWolhXQFuO7nZkkGIGEry1Wg0=;
 b=K3h4NXkC9P36xWMVwhjtNCkAWubGpVjgrZ6w+0Xpv/FjQqZERKHL/NSiMjCLpLeZTF
 Yg+eEC5rpiVXcBVpFa95p1hj8TLv44qQYRnERmrH6uXME7YMmC9jb8yqs12qCA8NJsht
 8u8wMqkng1nn6ZIhkeIjk/BUScVBOpT+4ozawS1C15R6PKiYpme1mucovKn7lp6tfQi8
 oNdzKxV09YXFG7efYKPekuT5M3BVL6gK/D6SVObFHL299y8v4+UtP5UdNFAa+1HgrBqm
 ACgRtpSd/Rg2u/6rH42lILXcrirzhlVRVjlxUHe+mO1D3prwMRZ0Hk5qOAnCQkbBUTdW
 j54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sg/RDSIpH9ANRtVdKJYWolhXQFuO7nZkkGIGEry1Wg0=;
 b=uA/9KIMp4c5YoIF6WpjyI+DIJ8PDUGu5fPD5EBcYG3OLhdJC7DD3o4NIu3iq7KRnsJ
 B1EI8MbvE30LPvKosHtCqIQuhqQ17BFgXbcKrlnxuEsV40cc4vk9O6QZTKd06WHWghQr
 ta6Vj/ylU117JjkDdrDHa//l2jTfAGe+nANRS1/R1OmZlYUNxAMR0cisMUxHZ6KqZv6b
 Seb6eY+gQ0TLeSsxgCKIKMasYDyswpGhS5u0xrAbPO+zJQ3AgF9UIzOy3uMuy8RzY43y
 VKepi3gWMVpZjuPwG2a7AKGmXmzw8SL5qBDecxwEtM/AVWi6WRpihMuoXiosFoolWpFQ
 dx/A==
X-Gm-Message-State: AOAM5321BZpNMakUDXku3ayrBtiHlB7WKoZYoRWQ8z3nqYdyZI0YpOMd
 +FX3c+KpvxtLzd8EQs9cAAJP0gjyi6oEIQ==
X-Google-Smtp-Source: ABdhPJz3IPbLUSckJaRf9y6TMDvE1yY5Jjo0vPhodliobCqqz4bOlIIZh13dAv0ajEJVtB8/WvuiXg==
X-Received: by 2002:a62:87c9:0:b029:2ea:572c:e4b1 with SMTP id
 i192-20020a6287c90000b02902ea572ce4b1mr3510284pfe.34.1623213396717; 
 Tue, 08 Jun 2021 21:36:36 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:36 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/31] drm/i915/gem: Remove engine auto-magic with
 FENCE_SUBMIT (v2)
Date: Tue,  8 Jun 2021 23:35:52 -0500
Message-Id: <20210609043613.102962-11-jason@jlekstrand.net>
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

