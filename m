Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9D50FF0C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 15:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A8710E70A;
	Tue, 26 Apr 2022 13:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB9510E6F6;
 Tue, 26 Apr 2022 13:28:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e2so19203317wrh.7;
 Tue, 26 Apr 2022 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oM30FhmQfO46n0r+P4uRf95ZE1vZtA1tsapmUJrgQ8A=;
 b=hjeULA6v7AO+OfpirGkChZwEWze7lBBMkTJdCjewPr+LT0dulQUbdo4JVtUInnm7Wh
 gJufLH2t4IwGYRTrcz/ia+m5jyUnjVmrQgkRXTLRTh9vDZpRmI7e/WefUHxZy30I2Mkf
 QwkufHZtlmX79+h+h8thJa6e7OMO5w/Eeocxudcfnuh3XCUHOY0gSgBmXjeOf3OP1xJB
 /j9WTnKFV91Qd+3tsRQGDT7ZeUOtMyOFHiJ2x4AKbBysSpKtT4MrXP4rQ37MwlpCJ8/a
 gUqbzQU/nMJS53VgMZLiddW02ZfSEv43GTZhUweOSYkPB338VW1KyIla8m1PsmIydb3B
 OKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oM30FhmQfO46n0r+P4uRf95ZE1vZtA1tsapmUJrgQ8A=;
 b=puSurghe7VQ3ASnWedQkrrmO+jJGjV9fpNjXXW1qAqlZnt9ac0YBdbU5ACbIlxb0js
 UQ1nt/jzT1ZCYmjXxlb3GkN4U/AdOYSyfIer8jvuadVzLdaIOXZaLTZI9s7D5ruiqx2b
 jcf2PbEr+bQvFVz4YsrIhV75IQobV9WkcRgecC0JyUiNEVE3xa4PjngR5INeLH02hsGJ
 2NwcUbcsuA0BPbk87yspsNPk/V+WINGFmII7Y8hlhTupXNSF7RNE59Lc7R+YlWdMiycw
 wYECpLv1kosXifn6viaJGGCUy9yCtliRqBeQKDMGOQm7lumMKInTFbjO+nG+kZiTWgbO
 3AoQ==
X-Gm-Message-State: AOAM532ijE1AtLgG5KkzFUeJFTo1E750X8q7P0r+rHVuUJcEr5Qx3gb4
 wibMjluvON4grSWfbYLj20a8mBsVFAw=
X-Google-Smtp-Source: ABdhPJyDS7rfZJaxl74taGBA576lUrnSXeNoWZZegk2tTljZl/bug8nSglYkZZZ8WyBRvfMx45qmDQ==
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr21787118ejc.435.1650979334660; 
 Tue, 26 Apr 2022 06:22:14 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a1709060ee100b006e8a49f215dsm4889914eji.73.2022.04.26.06.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:22:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm: execution context for GEM buffers
Date: Tue, 26 Apr 2022 15:22:04 +0200
Message-Id: <20220426132208.20801-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426132208.20801-1-christian.koenig@amd.com>
References: <20220426132208.20801-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existinc TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   7 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 256 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 128 ++++++++++++++++++
 5 files changed, 405 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index f32ccce5722d..bf7dd2a78e9b 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -493,6 +493,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e88c497fa010..1b35c10df263 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -179,6 +179,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
@@ -252,6 +258,7 @@ config DRM_AMDGPU
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 15fe3163f822..ee8573b683f3 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -37,6 +37,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..805fb4850cf9
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,256 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	drm_exec_while_not_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_lock(&exec, boB, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	xa_for_each(&exec->duplicates, index, obj) {
+		drm_gem_object_put(obj);
+		xa_erase(&exec->duplicates, index);
+	}
+
+	xa_for_each(&exec->locked, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+		xa_erase(&exec->locked, index);
+	}
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked and duplicate
+ * objects.
+ */
+void drm_exec_init(struct drm_exec *exec, bool interruptible)
+{
+	exec->interruptible = interruptible;
+	ww_acquire_init(&exec->ticket, &reservation_ww_class);
+	xa_init_flags(&exec->duplicates, XA_FLAGS_ALLOC);
+	xa_init_flags(&exec->locked, XA_FLAGS_ALLOC);
+	exec->contended = DRM_EXEC_DUMMY;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finilize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	if (exec->contended != DRM_EXEC_DUMMY)
+		drm_gem_object_put(exec->contended);
+	drm_exec_unlock_all(exec);
+	xa_destroy(&exec->duplicates);
+	xa_destroy(&exec->locked);
+	ww_acquire_fini(&exec->ticket);
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the xa and reserve fences */
+static int drm_exec_obj_locked(struct xarray *xa, struct drm_gem_object *obj,
+			       unsigned int num_fences)
+{
+	uint32_t index = 0;
+	int ret;
+
+	if (xa) {
+		ret = xa_alloc(xa, &index, obj, xa_limit_32b, GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+
+	if (num_fences) {
+		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		if (ret)
+			goto error_erase;
+	}
+
+	return 0;
+
+error_erase:
+	if (xa)
+		xa_erase(xa, index);
+	return ret;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			return ret;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(&exec->locked, obj, 0);
+	if (unlikely(ret))
+		goto error_unlock;
+
+	exec->contended = NULL;
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. All
+ * succesfully locked objects are put into the locked container. Duplicates
+ * detected as well and automatically moved into the duplicates container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->interruptible)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret == -EALREADY)) {
+		struct xarray *xa = &exec->duplicates;
+
+		/*
+		 * If this is the first locked GEM object it was most likely
+		 * just contended. So don't add it to the duplicates, just
+		 * reserve the fence slots.
+		 */
+		if (xa_load(&exec->locked, 0) == obj)
+			xa = NULL;
+
+		ret = drm_exec_obj_locked(&exec->duplicates, obj, num_fences);
+		if (ret)
+			return ret;
+
+	} else if (unlikely(ret)) {
+		return ret;
+
+	} else {
+		ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
+		if (ret)
+			goto error_unlock;
+	}
+
+	drm_gem_object_get(obj);
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..48b6f9c24be5
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+#include <linux/xarray.h>
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @interruptible: If locks should be taken interruptible
+	 */
+	bool			interruptible;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @locked: container for the locked GEM objects
+	 */
+	struct xarray		locked;
+
+	/**
+	 * @duplicates: container for the duplicated GEM objects
+	 */
+	struct xarray		duplicates;
+
+	/**
+	 * @contended: contended GEM object we backet of for.
+	 */
+	struct drm_gem_object	*contended;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	xa_for_each(&(exec)->locked, index, obj)
+
+/**
+ * drm_exec_for_each_duplicate_object - iterate over all the duplicate objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the duplicate GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_duplicate_object(exec, index, obj)	\
+	xa_for_each(&(exec)->duplicates, index, obj)
+
+/**
+ * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * prepared and no more contention exists.
+ *
+ * At the beginning of the loop it is guaranteed that no GEM object is locked.
+ */
+#define drm_exec_while_not_all_locked(exec)	\
+	while (drm_exec_cleanup(exec))
+
+/**
+ * drm_exec_continue_on_contention - continue the loop when we need to cleanup
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_continue_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		continue
+
+/**
+ * drm_exec_break_on_contention - break a subordinal loop on contention
+ * @exec: drm_exec object
+ *
+ * Control flow helper to break a subordinal loop when a contention was detected
+ * and we need to clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_break_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		break
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+/**
+ * drm_exec_has_duplicates - check for duplicated GEM object
+ * @exec: drm_exec object
+ *
+ * Return true if the drm_exec object has encountered some already locked GEM
+ * objects while trying to lock them. This can happen if multiple GEM objects
+ * share the same underlying resv object.
+ */
+static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
+{
+	return !xa_empty(&exec->duplicates);
+}
+
+void drm_exec_init(struct drm_exec *exec, bool interruptible);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+
+#endif
-- 
2.25.1

