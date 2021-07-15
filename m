Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7D3CA744
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB946E8A0;
	Thu, 15 Jul 2021 18:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38006E898;
 Thu, 15 Jul 2021 18:50:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210657856"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="210657856"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="452504628"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 15 Jul 2021 11:49:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Jul 2021 21:49:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm: Introduce drm_modeset_lock_ctx_retry()
Date: Thu, 15 Jul 2021 21:49:51 +0300
Message-Id: <20210715184954.7794-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
References: <20210715184954.7794-1-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Quite a few places are hand rolling the modeset lock backoff dance.
Let's suck that into a helper macro that is easier to use without
forgetting some steps.

The main downside is probably that the implementation of
drm_with_modeset_lock_ctx() is a bit harder to read than a hand
rolled version on account of being split across three functions,
but the actual code using it ends up being much simpler.

Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modeset_lock.c | 44 ++++++++++++++++++++++++++++++
 include/drm/drm_modeset_lock.h     | 20 ++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index fcfe1a03c4a1..083df96632e8 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -425,3 +425,47 @@ int drm_modeset_lock_all_ctx(struct drm_device *dev,
 	return 0;
 }
 EXPORT_SYMBOL(drm_modeset_lock_all_ctx);
+
+void _drm_modeset_lock_begin(struct drm_modeset_acquire_ctx *ctx,
+			     struct drm_atomic_state *state,
+			     unsigned int flags, int *ret)
+{
+	drm_modeset_acquire_init(ctx, flags);
+
+	if (state)
+		state->acquire_ctx = ctx;
+
+	*ret = -EDEADLK;
+}
+EXPORT_SYMBOL(_drm_modeset_lock_begin);
+
+bool _drm_modeset_lock_loop(int *ret)
+{
+	if (*ret == -EDEADLK) {
+		*ret = 0;
+		return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(_drm_modeset_lock_loop);
+
+void _drm_modeset_lock_end(struct drm_modeset_acquire_ctx *ctx,
+			   struct drm_atomic_state *state,
+			   int *ret)
+{
+	if (*ret == -EDEADLK) {
+		if (state)
+			drm_atomic_state_clear(state);
+
+		*ret = drm_modeset_backoff(ctx);
+		if (*ret == 0) {
+			*ret = -EDEADLK;
+			return;
+		}
+	}
+
+	drm_modeset_drop_locks(ctx);
+	drm_modeset_acquire_fini(ctx);
+}
+EXPORT_SYMBOL(_drm_modeset_lock_end);
diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index aafd07388eb7..5eaad2533de5 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -26,6 +26,7 @@
 
 #include <linux/ww_mutex.h>
 
+struct drm_atomic_state;
 struct drm_modeset_lock;
 
 /**
@@ -203,4 +204,23 @@ modeset_lock_fail:							\
 	if (!drm_drv_uses_atomic_modeset(dev))				\
 		mutex_unlock(&dev->mode_config.mutex);
 
+void _drm_modeset_lock_begin(struct drm_modeset_acquire_ctx *ctx,
+			     struct drm_atomic_state *state,
+			     unsigned int flags,
+			     int *ret);
+bool _drm_modeset_lock_loop(int *ret);
+void _drm_modeset_lock_end(struct drm_modeset_acquire_ctx *ctx,
+			   struct drm_atomic_state *state,
+			   int *ret);
+
+/*
+ * Note that one must always use "continue" rather than
+ * "break" or "return" to handle errors within the
+ * drm_modeset_lock_ctx_retry() block.
+ */
+#define drm_modeset_lock_ctx_retry(ctx, state, flags, ret) \
+	for (_drm_modeset_lock_begin((ctx), (state), (flags), &(ret)); \
+	     _drm_modeset_lock_loop(&(ret)); \
+	     _drm_modeset_lock_end((ctx), (state), &(ret)))
+
 #endif /* DRM_MODESET_LOCK_H_ */
-- 
2.31.1

