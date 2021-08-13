Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E703EBD54
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAA6E8CF;
	Fri, 13 Aug 2021 20:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720A6E8D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:42 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v2so6736556edq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bs10p23sJWJDZZNCcTGppQo97upc2uTkLgGG89DVdpg=;
 b=lJKNKsFyyvM8zMfy4wA0T+fIu2tMRlj6ys+Bf+FsZsPSjQbLhLKGrLJXrKhc/wIZ/g
 s5J/n9o5G0Qb0qrLXI0/OBk4ZfatHjDW7SQN7/qYyWx28ZRv1DctU7HGeZ+NoyfzBOie
 HLLE2sWC5m+kE9jEa9vdsGgiTvK1N+xQwmJ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bs10p23sJWJDZZNCcTGppQo97upc2uTkLgGG89DVdpg=;
 b=X9bLd5A/3u3TolLOaHtco0Ib8I5LmGiJypcFRuIKQ/vbQIsh5Pss6H05t6bPGRFj7h
 fagDO1yyMgXlROXThlBzWcuLv59moOQUJlHfMFpzSSGJ/kfseq6JxlyGjvwgnRoxKSAA
 DoZGn/xATPgUhy9pYoJYrBfVCio/j/pHBNnuxa+r9ZQ74+Ovu0AwXb1y1pejPW/kM7PU
 EmpTxsWzwDEMeGzL2CnhrtE8wGEI6oiPdog0AhTrnxiYrNEJgzagFDRjXIwkCdat+6Sd
 Vg/VQ93OhD5X7SHC8WYRuxwo9YVEoHF2s1GTlAx3Q/71JNHWr21MS9OhX5STZc5slJe3
 ytow==
X-Gm-Message-State: AOAM5323Cod/ShSGM6d6dLvzVn8AzkYy0nd3id/XwmOwFm4uiyEOq5hn
 VPFNMUw/PGQe0qVacuaCUfxUYC1rE/fZww==
X-Google-Smtp-Source: ABdhPJxA4fCN9NdWYxER76qUyb+wPQxhwzQPLAHzBZ1m+WoT5XfAdOLM1dlaTJkHSyazHnCzVRQhAw==
X-Received: by 2002:aa7:c795:: with SMTP id n21mr5272461eds.182.1628886641125; 
 Fri, 13 Aug 2021 13:30:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
Subject: [PATCH 01/11] drm/i915: Release i915_gem_context from a worker
Date: Fri, 13 Aug 2021 22:30:23 +0200
Message-Id: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
 2 files changed, 23 insertions(+), 2 deletions(-)

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
-- 
2.32.0

