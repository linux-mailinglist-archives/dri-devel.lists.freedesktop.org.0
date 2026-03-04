Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LN7DjcrqGnJpAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C119A1FFE2A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ED410E9D8;
	Wed,  4 Mar 2026 12:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhOvgt9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9BB10E9D8;
 Wed,  4 Mar 2026 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772628788; x=1804164788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=19JY18kccZQ/dj7cU8t7VeIDuTaUvaFBEfRob4jl0l4=;
 b=LhOvgt9cCZZemJ9wsZCbl3D1JHsTIK+Dj4ouczOhmDJ0ors8oHVL/IBd
 6QOvcWG1qikH9OtaYOrwkTLvVzdRdwoJh33HubQwfxVN8iXh2YjWvPB01
 GjUprjrmDhFVg80fAdGpWkGyhJrFlWvO5HnL0WkGKKaa+ZlG52QOPzKsI
 gfLmj8R1H7RefumY6L9dHtpBb0OO+84JgQ8f84EtYMamtZ7DPNTwU12cI
 S9lfGLxQP3sPsTSuJT5bW5qFbgoTIbrK6SYwBK48nmAValxUFXtnDiC4q
 EQFxFv11A6uNQyMEx6Z0CEHeSdTp/+VrqOk9CsclEGUeLixhWXm7Dw0Lh w==;
X-CSE-ConnectionGUID: iHvJYzVNSYSkkSRjy5W74Q==
X-CSE-MsgGUID: z1EJhQ/WTH28HGoWILXlTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73594474"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73594474"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:53:01 -0800
X-CSE-ConnectionGUID: MOCk908fTy2kPvnF98Pajg==
X-CSE-MsgGUID: n2OFe5//RC+pYk1VEaqmag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215705495"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:52:59 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>,
 David Howells <dhowells@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/xe: Add watch_queue-based device event
 notification
Date: Wed,  4 Mar 2026 13:52:20 +0100
Message-ID: <20260304125220.165004-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
References: <20260304125220.165004-1-thomas.hellstrom@linux.intel.com>
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
X-Rspamd-Queue-Id: C119A1FFE2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,redhat.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Add a watch_queue notification channel tied to struct xe_vm so that
userspace can subscribe to asynchronous GPU device events via the
general kernel notification mechanism.

Introduce DRM_IOCTL_XE_WATCH_QUEUE to let userspace subscribe a
notification pipe (opened with pipe2(O_NOTIFICATION_PIPE)) to the device
event stream.  Embed the watch_id field (0-255) in the WATCH_INFO_ID
field of every notification, allowing multiple watches to share a single
pipe and be told apart by the reader.

Deliver notifications as struct drm_xe_watch_notification records, with
type always set to WATCH_TYPE_DRM_XE_NOTIFY and subtype drawn from enum
drm_xe_watch_event.  Define DRM_XE_WATCH_EVENT_DEVICE_RESET as the
first event, to be posted by the GPU reset path to inform userspace that
in-flight work has been lost.  Expose xe_watch_queue_post_event() as the
in-kernel posting API.

Add event definitions in a separate uapi header, <drm/xe_drm_events.h>.
The main reason is that the header needs to include <linux/watch_queue.h>
which in turn includes <linux/fcntl.h> which may conflict with the
system <fcntl.h>. Hence user-space must pay special attention when including
this file.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig           |   1 +
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   7 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_vm.c           |   7 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 drivers/gpu/drm/xe/xe_watch_queue.c  | 107 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_watch_queue.h  |  20 +++++
 include/uapi/drm/xe_drm.h            |  46 ++++++++++++
 include/uapi/drm/xe_drm_events.h     |  56 ++++++++++++++
 10 files changed, 251 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_watch_queue.h
 create mode 100644 include/uapi/drm/xe_drm_events.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..dbdc2fb49c53 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -25,6 +25,7 @@ config DRM_XE
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
+	select WATCH_QUEUE
 	# xe depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
 	select BACKLIGHT_CLASS_DEVICE if ACPI
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ff778fb2d4ff..1129583865ad 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -144,6 +144,7 @@ xe-y += xe_bb.o \
 	xe_vsec.o \
 	xe_wa.o \
 	xe_wait_user_fence.o \
+	xe_watch_queue.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..89bc221546ce 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
 #include <linux/units.h>
+#include <linux/watch_queue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_client.h>
@@ -75,6 +76,7 @@
 #include "xe_vsec.h"
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
+#include "xe_watch_queue.h"
 
 #include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
@@ -110,6 +112,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
+	init_watch_list(&xef->watch_list, NULL);
+
 	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
 	if (task) {
 		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
@@ -124,6 +128,8 @@ static void xe_file_destroy(struct kref *ref)
 {
 	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
 
+	remove_watch_from_object(&xef->watch_list, NULL, 0, true);
+
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	xa_destroy(&xef->vm.xa);
@@ -211,6 +217,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_WATCH_QUEUE, xe_watch_queue_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index caa8f34a6744..a42e6125c069 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -11,6 +11,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
+#include <linux/watch_queue.h>
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
@@ -629,6 +630,11 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#ifdef CONFIG_WATCH_QUEUE
+	/** @watch_list: per-file notification source for device events */
+	struct watch_list watch_list;
+#endif
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 548b0769b3ef..1f331a2b2ecc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_print.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
+#include <uapi/drm/xe_drm_events.h>
 #include <linux/ascii85.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
@@ -40,6 +41,7 @@
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
+#include "xe_watch_queue.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -567,13 +569,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	if (err) {
-		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
+		xe_watch_queue_post_vm_err_event(vm->xef, vm->id, err);
+		drm_dbg(&vm->xe->drm, "VM worker error: %d\n", err);
 		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
 
 	free_preempt_fences(&preempt_fences);
-
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
@@ -2008,6 +2010,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto err_close_and_put;
 
+	vm->id = id;
 	args->vm_id = id;
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1f6f7e30e751..df559cf87b4c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -365,6 +365,8 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: Xe file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+	/** @id: The id of the VM in the VM table of @xef. */
+	u32 id;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
diff --git a/drivers/gpu/drm/xe/xe_watch_queue.c b/drivers/gpu/drm/xe/xe_watch_queue.c
new file mode 100644
index 000000000000..14c93cdebefe
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_watch_queue.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/slab.h>
+#include <linux/watch_queue.h>
+
+#include <uapi/drm/xe_drm.h>
+#include <uapi/drm/xe_drm_events.h>
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_macros.h"
+#include "xe_watch_queue.h"
+
+/**
+ * struct xe_watch_notification_vm_err - kernel-side VM error event notification
+ *
+ * Layout mirrors &struct drm_xe_watch_notification_vm_err.
+ *
+ * @base: common watch notification header; type is %WATCH_TYPE_DRM_XE_NOTIFY,
+ *        subtype is %DRM_XE_WATCH_EVENT_VM_ERR
+ * @vm_id: ID of the VM that hit error
+ * @error_code: error code describing the error condition (negative errno)
+ */
+struct xe_watch_notification_vm_err {
+	struct watch_notification base;
+	u32 vm_id;
+	s32 error_code;
+};
+
+/**
+ * xe_watch_queue_ioctl() - Subscribe a pipe to per-file device event notifications
+ * @dev: DRM device
+ * @data: pointer to &struct drm_xe_watch_queue from userspace
+ * @file: DRM file handle of the subscribing process
+ *
+ * Subscribes a notification pipe to receive Xe device events for the calling
+ * process's file handle.  Only events scoped to this file (e.g. VM error on a
+ * VM owned by this file) are delivered.  The pipe must have been opened with
+ * O_NOTIFICATION_PIPE and sized with %IOC_WATCH_QUEUE_SET_SIZE before calling
+ * this IOCTL.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int xe_watch_queue_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+	struct xe_device *xe = to_xe_device(dev);
+	struct drm_xe_watch_queue *args = data;
+	struct watch_queue *wqueue;
+	struct watch *watch;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, args->flags || args->pad))
+		return -EINVAL;
+	if (XE_IOCTL_DBG(xe, args->watch_id > 0xff))
+		return -EINVAL;
+
+	wqueue = get_watch_queue(args->fd);
+	if (XE_IOCTL_DBG(xe, IS_ERR(wqueue)))
+		return PTR_ERR(wqueue);
+
+	watch = kzalloc(sizeof(*watch), GFP_KERNEL | __GFP_ACCOUNT);
+	if (XE_IOCTL_DBG(xe, !watch)) {
+		ret = -ENOMEM;
+		goto out_put_queue;
+	}
+
+	init_watch(watch, wqueue);
+	watch->id = 0;
+	watch->info_id = (u32)args->watch_id << WATCH_INFO_ID__SHIFT;
+
+	ret = add_watch_to_object(watch, &xef->watch_list);
+	if (XE_IOCTL_DBG(xe, ret))
+		kfree(watch);
+
+out_put_queue:
+	put_watch_queue(wqueue);
+	return ret;
+}
+
+/**
+ * xe_watch_queue_post_vm_err_event() - Post a VM error event
+ * @xef: xe file handle that owns the VM
+ * @vm_id: userspace ID of the VM that hit error
+ * @error_code: error code describing the error condition (negative errno)
+ *
+ * Posts a %DRM_XE_WATCH_EVENT_VM_ERR notification carrying @vm_id and
+ * @error_code to every pipe that @xef has subscribed via
+ * %DRM_IOCTL_XE_WATCH_QUEUE.  Only the owning process is notified,
+ * preventing information leaks to other clients.
+ */
+void xe_watch_queue_post_vm_err_event(struct xe_file *xef, u32 vm_id,
+				      int error_code)
+{
+	struct xe_watch_notification_vm_err n = {};
+
+	n.base.type    = WATCH_TYPE_DRM_XE_NOTIFY;
+	n.base.subtype = DRM_XE_WATCH_EVENT_VM_ERR;
+	n.base.info    = watch_sizeof(struct xe_watch_notification_vm_err);
+	n.vm_id        = vm_id;
+	n.error_code   = error_code;
+
+	post_watch_notification(&xef->watch_list, &n.base, current_cred(), 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_watch_queue.h b/drivers/gpu/drm/xe/xe_watch_queue.h
new file mode 100644
index 000000000000..ad199ee68205
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_watch_queue.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_WATCH_QUEUE_H_
+#define _XE_WATCH_QUEUE_H_
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_file;
+struct xe_file;
+
+int xe_watch_queue_ioctl(struct drm_device *dev, void *data,
+			 struct drm_file *file);
+void xe_watch_queue_post_vm_err_event(struct xe_file *xef, u32 vm_id,
+				      int error_code);
+
+#endif /* _XE_WATCH_QUEUE_H_ */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ef2565048bdf..bc3917700c82 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_WATCH_QUEUE
  */
 
 /*
@@ -107,6 +108,7 @@ extern "C" {
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
+#define DRM_XE_WATCH_QUEUE		0x0f
 
 /* Must be kept compact -- no holes */
 
@@ -125,6 +127,7 @@ extern "C" {
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_WATCH_QUEUE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_WATCH_QUEUE, struct drm_xe_watch_queue)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2357,6 +2360,49 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: DRM_XE_WATCH_QUEUE
+ *
+ * Subscribe a notification pipe to receive device events for the calling
+ * process's DRM file handle.  Events are scoped to the subscribing file:
+ * only events that belong to that file (for example, VM error on a VM created
+ * through the same file) are delivered, preventing information leaks between
+ * processes sharing the same GPU device.
+ *
+ * The pipe must first be opened with O_NOTIFICATION_PIPE (i.e. O_EXCL passed
+ * to pipe2()) and sized via %IOC_WATCH_QUEUE_SET_SIZE before subscribing.
+ *
+ * Events are delivered as notification records read from the pipe.  The
+ * @watch_id field is embedded in the notification info field and can be used
+ * to distinguish multiple watches sharing a pipe.
+ *
+ * Currently defined event subtypes:
+ *  - %DRM_XE_WATCH_EVENT_VM_ERR - a VM owned by this file has encountered an error
+ */
+
+/**
+ * struct drm_xe_watch_queue - subscribe to device event notifications
+ *
+ * Used with %DRM_IOCTL_XE_WATCH_QUEUE.  Notifications are scoped to the
+ * DRM file handle used to issue this IOCTL.
+ */
+struct drm_xe_watch_queue {
+	/** @fd: file descriptor of pipe opened with O_NOTIFICATION_PIPE */
+	__u32 fd;
+
+	/**
+	 * @watch_id: identifier (0–255) embedded in the watch notification
+	 * info field; allows multiplexing several watches on one pipe
+	 */
+	__u32 watch_id;
+
+	/** @flags: must be zero */
+	__u32 flags;
+
+	/** @pad: reserved, must be zero */
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/xe_drm_events.h b/include/uapi/drm/xe_drm_events.h
new file mode 100644
index 000000000000..91813548ae01
--- /dev/null
+++ b/include/uapi/drm/xe_drm_events.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _UAPI_XE_DRM_EVENTS_H_
+#define _UAPI_XE_DRM_EVENTS_H_
+
+#include <linux/types.h>
+#include <linux/watch_queue.h>
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * enum drm_xe_watch_event - Xe device watch event subtypes
+ *
+ * Subtypes for notifications delivered via %WATCH_TYPE_DRM_XE_NOTIFY when
+ * reading from a pipe subscribed with %DRM_IOCTL_XE_WATCH_QUEUE.
+ */
+enum drm_xe_watch_event {
+	/**
+	 * @DRM_XE_WATCH_EVENT_VM_ERR: a VM has encountered an error.
+	 *
+	 * Indicates that a memory allocation failure occurred within the
+	 * given VM.  The vm_id of the affected VM is carried in the
+	 * @drm_xe_watch_notification_vm_err::vm_id field of the extended
+	 * notification record.
+	 */
+	DRM_XE_WATCH_EVENT_VM_ERR = 0,
+};
+
+/**
+ * struct drm_xe_watch_notification_vm_err - VM error event notification
+ *
+ * Notification record delivered for %DRM_XE_WATCH_EVENT_VM_ERR.
+ * The record type is always %WATCH_TYPE_DRM_XE_NOTIFY and the subtype is
+ * %DRM_XE_WATCH_EVENT_VM_ERR.
+ */
+struct drm_xe_watch_notification_vm_err {
+	/** @base: common watch notification header */
+	struct watch_notification base;
+
+	/** @vm_id: ID of the VM that hit out-of-memory */
+	__u32 vm_id;
+
+	/** @error_code: error code describing the error condition (negative errno) */
+	__s32 error_code;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.53.0

