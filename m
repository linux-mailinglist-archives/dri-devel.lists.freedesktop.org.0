Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBB41BA72
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9DB6E9BD;
	Tue, 28 Sep 2021 22:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E2A6E9BC;
 Tue, 28 Sep 2021 22:32:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="212071041"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="212071041"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 15:32:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="554368128"
Received: from pop-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.36.249])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2021 15:32:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PATCH] drm/locking: add backtrace for locking contended locks
 without backoff
Date: Wed, 29 Sep 2021 01:32:41 +0300
Message-Id: <20210928223241.22149-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

If drm_modeset_lock() returns -EDEADLK, the caller is supposed to drop
all currently held locks using drm_modeset_backoff(). Failing to do so
will result in warnings and backtraces on the paths trying to lock a
contended lock. Add support for optionally printing the backtrace on the
path that hit the deadlock and didn't gracefully handle the situation.

For example, the patch [1] inadvertently dropped the return value check
and error return on replacing calc_watermark_data() with
intel_compute_global_watermarks(). The backtraces on the subsequent
locking paths hitting WARN_ON(ctx->contended) were unhelpful, but adding
the backtrace to the deadlock path produced this helpful printout:

<7> [98.002465] drm_modeset_lock attempting to lock a contended lock without backoff:
   drm_modeset_lock+0x107/0x130
   drm_atomic_get_plane_state+0x76/0x150
   skl_compute_wm+0x251d/0x2b20 [i915]
   intel_atomic_check+0x1942/0x29e0 [i915]
   drm_atomic_check_only+0x554/0x910
   drm_atomic_nonblocking_commit+0xe/0x50
   drm_mode_atomic_ioctl+0x8c2/0xab0
   drm_ioctl_kernel+0xac/0x140

Add new CONFIG_DRM_DEBUG_MODESET_LOCK to enable modeset lock debugging
with stack depot and trace.

[1] https://lore.kernel.org/r/20210924114741.15940-4-jani.nikula@intel.com

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig            | 13 ++++++++
 drivers/gpu/drm/drm_modeset_lock.c | 49 ++++++++++++++++++++++++++++--
 include/drm/drm_modeset_lock.h     |  8 +++++
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b17e231ca6f7..7334975c788b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -100,6 +100,19 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
           This has the potential to use a lot of memory and print some very
           large kernel messages. If in doubt, say "N".
 
+config DRM_DEBUG_MODESET_LOCK
+	bool "Enable backtrace history for lock contention"
+	depends on STACKTRACE_SUPPORT
+	select STACKDEPOT
+	depends on EXPERT
+	help
+	  Enable debug tracing of failures to gracefully handle drm modeset lock
+	  contention. A history of each drm modeset lock path hitting -EDEADLK
+	  will be saved until gracefully handled, and the backtrace will be
+	  printed when attempting to lock a contended lock.
+
+	  If in doubt, say "N".
+
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index bf8a6e823a15..4d32b61fa1fd 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -25,6 +25,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_modeset_lock.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: kms locking
@@ -77,6 +78,45 @@
 
 static DEFINE_WW_CLASS(crtc_ww_class);
 
+#if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
+static noinline depot_stack_handle_t __stack_depot_save(void)
+{
+	unsigned long entries[8];
+	unsigned int n;
+
+	n = stack_trace_save(entries, ARRAY_SIZE(entries), 1);
+
+	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
+}
+
+static void __stack_depot_print(depot_stack_handle_t stack_depot)
+{
+	struct drm_printer p = drm_debug_printer("drm_modeset_lock");
+	unsigned long *entries;
+	unsigned int nr_entries;
+	char *buf;
+
+	buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
+	if (!buf)
+		return;
+
+	nr_entries = stack_depot_fetch(stack_depot, &entries);
+	stack_trace_snprint(buf, PAGE_SIZE, entries, nr_entries, 2);
+
+	drm_printf(&p, "attempting to lock a contended lock without backoff:\n%s", buf);
+
+	kfree(buf);
+}
+#else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
+static depot_stack_handle_t __stack_depot_save(void)
+{
+	return 0;
+}
+static void __stack_depot_print(depot_stack_handle_t stack_depot)
+{
+}
+#endif /* CONFIG_DRM_DEBUG_MODESET_LOCK */
+
 /**
  * drm_modeset_lock_all - take all modeset locks
  * @dev: DRM device
@@ -225,7 +265,9 @@ EXPORT_SYMBOL(drm_modeset_acquire_fini);
  */
 void drm_modeset_drop_locks(struct drm_modeset_acquire_ctx *ctx)
 {
-	WARN_ON(ctx->contended);
+	if (WARN_ON(ctx->contended))
+		__stack_depot_print(ctx->stack_depot);
+
 	while (!list_empty(&ctx->locked)) {
 		struct drm_modeset_lock *lock;
 
@@ -243,7 +285,8 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
 {
 	int ret;
 
-	WARN_ON(ctx->contended);
+	if (WARN_ON(ctx->contended))
+		__stack_depot_print(ctx->stack_depot);
 
 	if (ctx->trylock_only) {
 		lockdep_assert_held(&ctx->ww_ctx);
@@ -274,6 +317,7 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
 		ret = 0;
 	} else if (ret == -EDEADLK) {
 		ctx->contended = lock;
+		ctx->stack_depot = __stack_depot_save();
 	}
 
 	return ret;
@@ -296,6 +340,7 @@ int drm_modeset_backoff(struct drm_modeset_acquire_ctx *ctx)
 	struct drm_modeset_lock *contended = ctx->contended;
 
 	ctx->contended = NULL;
+	ctx->stack_depot = 0;
 
 	if (WARN_ON(!contended))
 		return 0;
diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index aafd07388eb7..b84693fbd2b5 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -24,6 +24,8 @@
 #ifndef DRM_MODESET_LOCK_H_
 #define DRM_MODESET_LOCK_H_
 
+#include <linux/types.h> /* stackdepot.h is not self-contained */
+#include <linux/stackdepot.h>
 #include <linux/ww_mutex.h>
 
 struct drm_modeset_lock;
@@ -51,6 +53,12 @@ struct drm_modeset_acquire_ctx {
 	 */
 	struct drm_modeset_lock *contended;
 
+	/*
+	 * Stack depot for debugging when a contended lock was not backed off
+	 * from.
+	 */
+	depot_stack_handle_t stack_depot;
+
 	/*
 	 * list of held locks (drm_modeset_lock)
 	 */
-- 
2.30.2

