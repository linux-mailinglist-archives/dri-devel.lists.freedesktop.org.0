Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34A3A1F09
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E126EB65;
	Wed,  9 Jun 2021 21:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FF66EB61
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:30:07 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso4327897pjz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eTUFkifYg4qyfhm5fhERzc/Tf0nOJIkZRnSQ1FRjgU=;
 b=SWLsok6eApBieiqTDmEhXEDo812agMqb9+oln5RfIgDHx97JmVXJcasA65qjcRP3LB
 PVUluxk1UKP5ByHyiH/wxvawubb2t2/UGFZxYFwpjWGTlh30iA4r4ZgTUT+82h0R3hcy
 DsdtyEcG06bH25mW97vJvuOO+qt6nmeyWwKHPFULYflX0pLRpM/x6ngLPnShsVfUsRSa
 lbUm+NYKzr8xd0JYadRxD9JUagYKp0eXcRJssKLeyCWY++TkutpNlusMsMhJcNySVKkN
 whp3xl0jsSEXbfzJxwI+xKUBoriUKfFhiwBLOC3KM2Jm5V98mC+3c1ymGvwAypRPB/RI
 0YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eTUFkifYg4qyfhm5fhERzc/Tf0nOJIkZRnSQ1FRjgU=;
 b=s6r2PI3ba9KhxfdjzxvtusCVM7QhDHP/4vqo7LkFzaMnt7dBLBU/xW7fYIswqoMm5Y
 ygTcK/K9lcy8k7K7enBRsXxIYCBo7CxOTnX647Ai970g3fj0USuJsT9kxtTNxlofcwPJ
 qgxUFSq/Y5X6VYxH3TiM76yPgKsnvlWM94DC8nsVeQS6E1XboRekapk68zBC1V5/gbKF
 bHXgtBdfiGMK6RrB2Wv54fLFFcL0OzOvg1xnzJmUAxCnI5vLxGvIIUrCKwVrRelIcCjn
 zuI0qqC9ogoIX8Rx9wINdAyRoyW7Vr5LUuGUh78lcWAWlc2n81TC60Pbnt9r1OeKcXWR
 +KNw==
X-Gm-Message-State: AOAM530nbud8SgBqBA60G67etk1K8F4Arx7Bp5PSnymgjL8fosijXGyI
 EnMCb0lhIUjxY9Rvgd8QZ1soFXQd1U+gyw==
X-Google-Smtp-Source: ABdhPJzN+jJFtIPgWvB61RKHIn33Jbsyu+oEOriZLjg80H9GZmqcrmbge4sVoM+mnRnNDzHS1BXoTQ==
X-Received: by 2002:a17:902:ed86:b029:10d:81ec:9087 with SMTP id
 e6-20020a170902ed86b029010d81ec9087mr1533757plj.0.1623274206878; 
 Wed, 09 Jun 2021 14:30:06 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id u14sm519133pjx.14.2021.06.09.14.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:30:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: Move intel_engine_free_request_pool to
 i915_request.c
Date: Wed,  9 Jun 2021 16:29:55 -0500
Message-Id: <20210609212959.471209-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609212959.471209-1-jason@jlekstrand.net>
References: <20210609212959.471209-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears to break encapsulation by moving an intel_engine_cs
function to a i915_request file.  However, this function is
intrinsically tied to the lifetime rules and allocation scheme of
i915_request and having it in intel_engine_cs.c leaks details of
i915_request.  We have an abstraction leak either way.  Since
i915_request's allocation scheme is far more subtle than the simple
pointer that is intel_engine_cs.request_pool, it's probably better to
keep i915_request's details to itself.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 8 --------
 drivers/gpu/drm/i915/i915_request.c       | 7 +++++--
 drivers/gpu/drm/i915/i915_request.h       | 2 --
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 9ceddfbb1687d..df6b80ec84199 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -422,14 +422,6 @@ void intel_engines_release(struct intel_gt *gt)
 	}
 }
 
-void intel_engine_free_request_pool(struct intel_engine_cs *engine)
-{
-	if (!engine->request_pool)
-		return;
-
-	kmem_cache_free(i915_request_slab_cache(), engine->request_pool);
-}
-
 void intel_engines_free(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 1014c71cf7f52..48c5f8527854b 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -106,9 +106,12 @@ static signed long i915_fence_wait(struct dma_fence *fence,
 				 timeout);
 }
 
-struct kmem_cache *i915_request_slab_cache(void)
+void intel_engine_free_request_pool(struct intel_engine_cs *engine)
 {
-	return global.slab_requests;
+	if (!engine->request_pool)
+		return;
+
+	kmem_cache_free(global.slab_requests, engine->request_pool);
 }
 
 static void i915_fence_release(struct dma_fence *fence)
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 270f6cd37650c..f84c38d29f988 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -300,8 +300,6 @@ static inline bool dma_fence_is_i915(const struct dma_fence *fence)
 	return fence->ops == &i915_fence_ops;
 }
 
-struct kmem_cache *i915_request_slab_cache(void);
-
 struct i915_request * __must_check
 __i915_request_create(struct intel_context *ce, gfp_t gfp);
 struct i915_request * __must_check
-- 
2.31.1

