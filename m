Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37DA39F254
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F096EB63;
	Tue,  8 Jun 2021 09:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F068C6EB5F;
 Tue,  8 Jun 2021 09:29:05 +0000 (UTC)
IronPort-SDR: ujSUgvMq+0OQpZofaLvXvSYlmogDJmM1k3tcF5iUee9gRgL5S/ctbLVpGKCdcP/11HAGE7uT/l
 E/18h/VJgdAA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226150951"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226150951"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:05 -0700
IronPort-SDR: +MEZaF26X/9BamTNsBW6+FtSz3ZVVPUnAkB7MoS7rkq7LYeUxap/koG22eS6ZvK0CGR1FDVHy/
 grPkwQwfSA0Q==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="551544373"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.115])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:29:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915: Break out dma_resv ww locking utilities to
 separate files
Date: Tue,  8 Jun 2021 11:28:39 +0200
Message-Id: <20210608092846.64198-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we're about to add more ww-related functionality,
break out the dma_resv ww locking utilities to their own files

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/Makefile               |  1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h  |  1 +
 drivers/gpu/drm/i915/gt/intel_renderstate.h |  1 +
 drivers/gpu/drm/i915/i915_gem.c             | 56 ------------------
 drivers/gpu/drm/i915/i915_gem.h             | 12 ----
 drivers/gpu/drm/i915/i915_gem_ww.c          | 63 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gem_ww.h          | 21 +++++++
 7 files changed, 87 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
 create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4f22cac1c49b..ea8ee4b3e018 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -45,6 +45,7 @@ i915-y += i915_drv.o \
 	  i915_switcheroo.o \
 	  i915_sysfs.o \
 	  i915_utils.o \
+	  i915_gem_ww.o \
 	  intel_device_info.o \
 	  intel_dram.o \
 	  intel_memory_region.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 1fafcc89ecee..789529b424c1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -15,6 +15,7 @@
 #include "i915_gem_object_types.h"
 #include "i915_gem_gtt.h"
 #include "i915_vma_types.h"
+#include "i915_gem_ww.h"
 
 /*
  * XXX: There is a prevalence of the assumption that we fit the
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.h b/drivers/gpu/drm/i915/gt/intel_renderstate.h
index 48f009203917..4da4c5234ef0 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.h
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include "i915_gem.h"
+#include "i915_gem_ww.h"
 
 struct i915_request;
 struct intel_context;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 3f060ab58c5d..ce64d3005cf2 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1204,62 +1204,6 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 	return ret;
 }
 
-void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
-{
-	ww_acquire_init(&ww->ctx, &reservation_ww_class);
-	INIT_LIST_HEAD(&ww->obj_list);
-	ww->intr = intr;
-	ww->contended = NULL;
-}
-
-static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
-{
-	struct drm_i915_gem_object *obj;
-
-	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
-		list_del(&obj->obj_link);
-		i915_gem_object_unlock(obj);
-		i915_gem_object_put(obj);
-	}
-}
-
-void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
-{
-	list_del(&obj->obj_link);
-	i915_gem_object_unlock(obj);
-	i915_gem_object_put(obj);
-}
-
-void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
-{
-	i915_gem_ww_ctx_unlock_all(ww);
-	WARN_ON(ww->contended);
-	ww_acquire_fini(&ww->ctx);
-}
-
-int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
-{
-	int ret = 0;
-
-	if (WARN_ON(!ww->contended))
-		return -EINVAL;
-
-	i915_gem_ww_ctx_unlock_all(ww);
-	if (ww->intr)
-		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, &ww->ctx);
-	else
-		dma_resv_lock_slow(ww->contended->base.resv, &ww->ctx);
-
-	if (!ret)
-		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
-	else
-		i915_gem_object_put(ww->contended);
-
-	ww->contended = NULL;
-
-	return ret;
-}
-
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_gem_device.c"
 #include "selftests/i915_gem.c"
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 440c35f1abc9..d0752e5553db 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -123,16 +123,4 @@ static inline bool __tasklet_is_scheduled(struct tasklet_struct *t)
 	return test_bit(TASKLET_STATE_SCHED, &t->state);
 }
 
-struct i915_gem_ww_ctx {
-	struct ww_acquire_ctx ctx;
-	struct list_head obj_list;
-	bool intr;
-	struct drm_i915_gem_object *contended;
-};
-
-void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
-void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
-int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
-void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
-
 #endif /* __I915_GEM_H__ */
diff --git a/drivers/gpu/drm/i915/i915_gem_ww.c b/drivers/gpu/drm/i915/i915_gem_ww.c
new file mode 100644
index 000000000000..3f6ff139478e
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_gem_ww.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+#include <linux/dma-resv.h>
+#include "i915_gem_ww.h"
+#include "gem/i915_gem_object.h"
+
+void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
+{
+	ww_acquire_init(&ww->ctx, &reservation_ww_class);
+	INIT_LIST_HEAD(&ww->obj_list);
+	ww->intr = intr;
+	ww->contended = NULL;
+}
+
+static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
+{
+	struct drm_i915_gem_object *obj;
+
+	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
+		list_del(&obj->obj_link);
+		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
+	}
+}
+
+void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
+{
+	list_del(&obj->obj_link);
+	i915_gem_object_unlock(obj);
+	i915_gem_object_put(obj);
+}
+
+void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
+{
+	i915_gem_ww_ctx_unlock_all(ww);
+	WARN_ON(ww->contended);
+	ww_acquire_fini(&ww->ctx);
+}
+
+int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
+{
+	int ret = 0;
+
+	if (WARN_ON(!ww->contended))
+		return -EINVAL;
+
+	i915_gem_ww_ctx_unlock_all(ww);
+	if (ww->intr)
+		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, &ww->ctx);
+	else
+		dma_resv_lock_slow(ww->contended->base.resv, &ww->ctx);
+
+	if (!ret)
+		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
+	else
+		i915_gem_object_put(ww->contended);
+
+	ww->contended = NULL;
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
new file mode 100644
index 000000000000..f2d8769e4118
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_gem_ww.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+#ifndef __I915_GEM_WW_H__
+#define __I915_GEM_WW_H__
+
+#include <drm/drm_drv.h>
+
+struct i915_gem_ww_ctx {
+	struct ww_acquire_ctx ctx;
+	struct list_head obj_list;
+	struct drm_i915_gem_object *contended;
+	bool intr;
+};
+
+void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
+void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
+int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
+void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
+#endif
-- 
2.31.1

