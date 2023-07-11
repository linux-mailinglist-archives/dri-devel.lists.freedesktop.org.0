Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4661174F02F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5BA10E398;
	Tue, 11 Jul 2023 13:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4A10E0B0;
 Tue, 11 Jul 2023 13:31:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99342a599e9so734738066b.3; 
 Tue, 11 Jul 2023 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689082286; x=1691674286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fcUf6qlEp1devHcRa2kpRGF0jLq7jUmObDFD7CRLwUU=;
 b=pLxXU/eosxWDub6x82au4NixjyD5qUaxiXcF6x7k1Kz6LX9eXbAmDr/2CWb0JkGOi6
 CjeorWN0lYA+sUZc9hc/PJbnwvJggT3d7VVkFnuPXDxBJPcJ4FJEdYNVrzoN73owCgrc
 GMv79sM0jaibqi+5bJsRy6+q0FnPeHqeYs6Xz4UBdUjVm52s6bEhdM2QJhp/9GPS3ijL
 5jicy+RxvNkxmGt+WTEtEHsJW46c8SNlEAZavQrOf/E8rutc5hcS67F9a5MMoPWDD7M7
 XbHLFCQcuaPiyXU7bJl5QDAMYq6x+8BU4XTzDqwMI760ZMzicnYjU6hJ1kNMHa04LJvK
 /tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689082286; x=1691674286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fcUf6qlEp1devHcRa2kpRGF0jLq7jUmObDFD7CRLwUU=;
 b=R+bzBd0rVJLd+ilGkgSScxNsaA22TOeaABop8+ZINj1uUcZA4QMr0/xGj+gJ8Jcz51
 rbyuqYQWl4AOchUlXPjUtBwE4bYrZFxonnCk3IEpAXR7txkP3ZYhL2tFVyC/wZztT/Vk
 Dp9gyEejgCOrVvaKRtEYDk6xiQzQZJBgzxrI01Ez/uOTWD6T8LRuWyg62g6utcHqepAU
 4hPVf2KZS0OIymFQi9hfc6CAjM4zvo01PYErpjvYiODcuadM6AtxJSOMJNZSiFKlgVDp
 xVHKhh6yGwHXXZffKGQ15yWi9miN3e4MC5KZ4uQhKIs5hFAxFMYlU/VkHmLSESgM7vvP
 OKqA==
X-Gm-Message-State: ABy/qLY6kA2yqS7Ah+vF4T8wanj1yJ3rur/1+B7vjniE0yna36F3Rjzz
 VATmCuDbW0ANfVo/41XWETV+J0L9hRk=
X-Google-Smtp-Source: APBJJlF8tcZ48YHDr/1TKldszu9J4cLkajitH7H22hS8JkXV/v+6OW8dQWA71nbrWP27svrRaexZvg==
X-Received: by 2002:a17:907:c01c:b0:96a:4ea0:a1e7 with SMTP id
 ss28-20020a170907c01c00b0096a4ea0a1e7mr15547001ejc.50.1689082285772; 
 Tue, 11 Jul 2023 06:31:25 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:448d:6e36:e62e:af18])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a1709060d9b00b009932337747esm1176967eji.86.2023.07.11.06.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 06:31:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm: execution context for GEM buffers v7
Date: Tue, 11 Jul 2023 15:31:17 +0200
Message-Id: <20230711133122.3710-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133122.3710-1-christian.koenig@amd.com>
References: <20230711133122.3710-1-christian.koenig@amd.com>
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

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existing TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

v2: drop xarray and use dynamic resized array instead, the locking
    overhead is unnecessary and measurable.
v3: drop duplicate tracking, radeon is really the only one needing that.
v4: fixes issues pointed out by Danilo, some typos in comments and a
    helper for lock arrays of GEM objects.
v5: some suggestions by Boris Brezillon, especially just use one retry
    macro, drop loop in prepare_array, use flags instead of bool
v6: minor changes suggested by Thomas, Boris and Danilo
v7: minor typos pointed out by checkpatch.pl fixed

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@redhat.com>
Tested-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   6 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 333 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 123 +++++++++++++
 5 files changed, 476 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a79fd3549ff8..a52e6f4117d6 100644
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
index cc9c9947fdef..c0b4063a3ee6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -194,6 +194,12 @@ config DRM_TTM
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
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1c0f5204e47b..021b3f0ac152 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..ff69cf0fb42a
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
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
+ *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+ *	drm_exec_until_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_retry_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_prepare_obj(&exec, boB, 1);
+ *		drm_exec_retry_on_contention(&exec);
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
+#define DRM_EXEC_DUMMY ((void *)~0)
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	drm_gem_object_put(exec->prelocked);
+	exec->prelocked = NULL;
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @flags: controls locking behavior, see DRM_EXEC_* defines
+ *
+ * Initialize the object and make sure that we can track locked objects.
+ */
+void drm_exec_init(struct drm_exec *exec, uint32_t flags)
+{
+	exec->flags = flags;
+	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects = 0;
+	exec->contended = DRM_EXEC_DUMMY;
+	exec->prelocked = NULL;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finalize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
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
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the array */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects == exec->max_objects)) {
+		size_t size = exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects = tmp;
+		exec->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] = obj;
+
+	return 0;
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
+	/* Always cleanup the contention so that error handling can kick in */
+	exec->contended = NULL;
+	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret))
+		goto error_unlock;
+
+	exec->prelocked = obj;
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+
+error_dropref:
+	drm_gem_object_put(obj);
+	return ret;
+}
+
+/**
+ * drm_exec_lock_obj - lock a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to lock
+ *
+ * Lock a GEM object for use and grab a reference to it.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked (can be suppressed by setting the DRM_EXEC_IGNORE_DUPLICATES
+ * flag), -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+		return 0;
+	}
+
+	if (exec->flags & DRM_EXEC_INTERRUPTIBLE_WAIT)
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
+	if (unlikely(ret == -EALREADY) &&
+	    exec->flags & DRM_EXEC_IGNORE_DUPLICATES)
+		return 0;
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_lock_obj);
+
+/**
+ * drm_exec_unlock_obj - unlock a GEM object in this exec context
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to unlock
+ *
+ * Unlock the GEM object and remove it from the collection of locked objects.
+ * Should only be used to unlock the most recently locked objects. It's not time
+ * efficient to unlock objects locked long ago.
+ */
+void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	unsigned int i;
+
+	for (i = exec->num_objects; i--;) {
+		if (exec->objects[i] == obj) {
+			dma_resv_unlock(obj->resv);
+			for (++i; i < exec->num_objects; ++i)
+				exec->objects[i - 1] = exec->objects[i];
+			--exec->num_objects;
+			drm_gem_object_put(obj);
+			return;
+		}
+
+	}
+}
+EXPORT_SYMBOL(drm_exec_unlock_obj);
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots.
+ *
+ * Returns: -EDEADLK if a contention is detected, -EALREADY when object is
+ * already locked, -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_obj(exec, obj);
+	if (ret)
+		return ret;
+
+	ret = dma_resv_reserve_fences(obj->resv, num_fences);
+	if (ret) {
+		drm_exec_unlock_obj(exec, obj);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+/**
+ * drm_exec_prepare_array - helper to prepare an array of objects
+ * @exec: the drm_exec object with the state
+ * @objects: array of GEM object to prepare
+ * @num_objects: number of GEM objects in the array
+ * @num_fences: number of fences to reserve on each GEM object
+ *
+ * Prepares all GEM objects in an array, aborts on first error.
+ * Reserves @num_fences on each GEM object after locking it.
+ *
+ * Returns: -EDEADLOCK on contention, -EALREADY when object is already locked,
+ * -ENOMEM when memory allocation failed and zero for success.
+ */
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < num_objects; ++i) {
+		ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
+		if (unlikely(ret))
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_exec_prepare_array);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..73205afec162
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+#define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
+#define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @flags: Flags to control locking behavior
+	 */
+	uint32_t		flags;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backed off for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object due to contention
+	 */
+	struct drm_gem_object *prelocked;
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
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])
+
+/**
+ * drm_exec_until_all_locked - loop until all GEM objects are locked
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * locked and no more contention exists. At the beginning of the loop it is
+ * guaranteed that no GEM object is locked.
+ *
+ * Since labels can't be defined local to the loops body we use a jump pointer
+ * to make sure that the retry is only used from within the loops body.
+ */
+#define drm_exec_until_all_locked(exec)				\
+	for (void *__drm_exec_retry_ptr; ({			\
+		__label__ __drm_exec_retry;			\
+__drm_exec_retry:						\
+		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
+		(void)__drm_exec_retry_ptr;			\
+		drm_exec_cleanup(exec);				\
+	});)
+
+/**
+ * drm_exec_retry_on_contention - restart the loop to grap all locks
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_retry_on_contention(exec)			\
+	do {							\
+		if (unlikely(drm_exec_is_contended(exec)))	\
+			goto *__drm_exec_retry_ptr;		\
+	} while (0)
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
+void drm_exec_init(struct drm_exec *exec, uint32_t flags);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+void drm_exec_unlock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+int drm_exec_prepare_array(struct drm_exec *exec,
+			   struct drm_gem_object **objects,
+			   unsigned int num_objects,
+			   unsigned int num_fences);
+
+#endif
-- 
2.34.1

