Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491EE3EC213
	for <lists+dri-devel@lfdr.de>; Sat, 14 Aug 2021 12:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35C6E822;
	Sat, 14 Aug 2021 10:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5E6E7F1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Aug 2021 10:43:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k4so8437902wms.3
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Aug 2021 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CyDGn+m3A62QU/f5ahs1P8PN0sPNitsk0uBwhLraIGg=;
 b=hoz1sOfO1U7isCTJyaYB3tv91GogfJw9C+h8KcBCGPm1Pn2xVtB6MitpDsKLoyuyBR
 tUqn0kSdZYKKynL9CljP0jFMjA3WyKn2idRu3oixv+98446LpOLYT6bPm/k4lDjFl3PK
 O/hciPvMPM1jScpR1qprvZ2TfUpicD9d5DOSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CyDGn+m3A62QU/f5ahs1P8PN0sPNitsk0uBwhLraIGg=;
 b=GOaF5Z1kN2xHZMPIX3I8t0J1Z2hh9cbIaYj7H9KVbM1YVLL8tgsKI2IMOLddMZRICy
 VWf1Y3cOzgEm7UVQhIkSBOAMIx1IpoEdIGbp5H3WP0UsHgDxBe0W0uAGl6LmzSFB0tcS
 2uFkNb+iALdgUvJu8fs/U1fDIETwV4DROYcJam30tPn33/V69b7GKZq7h/t96aUbjAmV
 4ECIXG3nOP0CJ3ups+wwQasVudqIcYhMypA0SVr6cUKd4chzJT6lKROaGX2qfvf3KvgJ
 XEqiY84ceGWJVHj0mA2bwgECpHSC6ZndhNFlJr9ljqkr7b9dY0tnLcxwsbpHlmQRUW8l
 RvcQ==
X-Gm-Message-State: AOAM530Ut7QLbCAhHPZNe4pktp9vSwEme4CY4p1z29UeR5uzxYbalAV4
 1WbQb3DmYTdd9kYvT1L3qJ8Lmw==
X-Google-Smtp-Source: ABdhPJxbmml8chvHH/JLOwxQOSBIIrJ5F8p83MufDVLxuwWlvWOdwfqO3g/rQY9w+Pzr6/kQNSAhrg==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr6471984wmj.119.1628937805523; 
 Sat, 14 Aug 2021 03:43:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t8sm4995434wrx.27.2021.08.14.03.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 03:43:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH] drm/i915: Release i915_gem_context from a worker
Date: Sat, 14 Aug 2021 12:43:19 +0200
Message-Id: <20210814104319.3226156-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
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

The only reason for this really is the i915_gem_engines->fence
callback engines_notify(), which exists purely as a fairly funky
reference counting scheme for that. Otherwise all other callers are
from process context, and generally fairly benign locking context.

Unfortunately untangling that requires some major surgery, and we have
a few i915_gem_context reference counting bugs that need fixing, and
they blow in the current hardirq calling context, so we need a
stop-gap measure.

Put a FIXME comment in when this should be removable again.

v2: Fix mock_context(), noticed by intel-gfx-ci.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 12 ++++++++++++
 drivers/gpu/drm/i915/gem/selftests/mock_context.c |  1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index fd169cf2f75a..051bc357ff65 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -986,9 +986,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
 	return err;
 }
 
-void i915_gem_context_release(struct kref *ref)
+static void i915_gem_context_release_work(struct work_struct *work)
 {
-	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
+	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
+						    release_work);
 
 	trace_i915_context_free(ctx);
 	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
@@ -1002,6 +1003,13 @@ void i915_gem_context_release(struct kref *ref)
 	kfree_rcu(ctx, rcu);
 }
 
+void i915_gem_context_release(struct kref *ref)
+{
+	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
+
+	queue_work(ctx->i915->wq, &ctx->release_work);
+}
+
 static inline struct i915_gem_engines *
 __context_engines_static(const struct i915_gem_context *ctx)
 {
@@ -1303,6 +1311,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
 	ctx->sched = pc->sched;
 	mutex_init(&ctx->mutex);
 	INIT_LIST_HEAD(&ctx->link);
+	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
 
 	spin_lock_init(&ctx->stale.lock);
 	INIT_LIST_HEAD(&ctx->stale.engines);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 94c03a97cb77..0c38789bd4a8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -288,6 +288,18 @@ struct i915_gem_context {
 	 */
 	struct kref ref;
 
+	/**
+	 * @release_work:
+	 *
+	 * Work item for deferred cleanup, since i915_gem_context_put() tends to
+	 * be called from hardirq context.
+	 *
+	 * FIXME: The only real reason for this is &i915_gem_engines.fence, all
+	 * other callers are from process context and need at most some mild
+	 * shuffling to pull the i915_gem_context_put() call out of a spinlock.
+	 */
+	struct work_struct release_work;
+
 	/**
 	 * @rcu: rcu_head for deferred freeing.
 	 */
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index fee070df1c97..067d68a6fe4c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -23,6 +23,7 @@ mock_context(struct drm_i915_private *i915,
 	kref_init(&ctx->ref);
 	INIT_LIST_HEAD(&ctx->link);
 	ctx->i915 = i915;
+	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
 
 	mutex_init(&ctx->mutex);
 
-- 
2.32.0

