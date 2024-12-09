Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4279B9E9708
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E7910E757;
	Mon,  9 Dec 2024 13:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkpY764T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712210E740;
 Mon,  9 Dec 2024 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751202; x=1765287202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZgX9d74DzS1vu/EFKHILvX8BMImEWY8w7YqRUH9pXY=;
 b=VkpY764THOW7A9Z7YXS3a8rVXm8Fqdke/q6iXic6Sh7eD+07AkqkSUMP
 uu0OZLybQ3StuNR77fCn0fDFh9JB0jcF1KRlZShlZ6/ZqUTPWts1O9svB
 9Q282XKFUaDBpXFDCXUqsOOsf6F7BJKbtMEV2yTsRbsFicQ2H/TV0B7wG
 PfMSubTsS3lFZgezvnfkIi8+4gTXtBtwKTAuZE0H3txVs6BnkjRStQpFg
 ej2wnkseiV3ZTqomir3Ih1S75KGNyPEGQ2br8NxstbnJhlHnANFyvY86l
 bejkbv2dUwfSEsi/4qwk9hWAYBUAsUtDVy6KX6uZ72UqwwpktUiGiFqnK A==;
X-CSE-ConnectionGUID: lzSMSFiwQwWNdw11idmFUg==
X-CSE-MsgGUID: fjCQm7rlSHyK6pai+hs3UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192023"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:21 -0800
X-CSE-ConnectionGUID: fxymClcxQeCakU2NMj1NnQ==
X-CSE-MsgGUID: N6uD/HWNQ7+u5qJHW2k0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531304"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:20 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 11/26] drm/xe/eudebug: Add UFENCE events with acks
Date: Mon,  9 Dec 2024 15:33:02 +0200
Message-ID: <20241209133318.1806472-12-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When vma is in place, debugger needs to intercept before
userspace proceeds with the workload. For example to install
a breakpoint in a eu shader.

Attach debugger in xe_user_fence, send UFENCE event
and stall normal user fence signal path to yield if
there is debugger attached to ufence.

When ack (ioctl) is received for the corresponding seqno,
signal ufence.

v2: - return err instead of 0 to guarantee signalling (Dominik)
    - checkpatch (Tilak)
    - Kconfig (Mika, Andrzej)
    - use lock instead of cmpxchg (Mika)

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 283 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_eudebug.h       |  16 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  13 ++
 drivers/gpu/drm/xe/xe_exec.c          |   2 +-
 drivers/gpu/drm/xe/xe_oa.c            |   3 +-
 drivers/gpu/drm/xe/xe_sync.c          |  45 ++--
 drivers/gpu/drm/xe/xe_sync.h          |   8 +-
 drivers/gpu/drm/xe/xe_sync_types.h    |  28 ++-
 drivers/gpu/drm/xe/xe_vm.c            |   4 +-
 include/uapi/drm/xe_drm_eudebug.h     |  13 ++
 10 files changed, 385 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index f544f60d7d6b..3cf3616e546d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -32,6 +32,7 @@
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -239,11 +240,119 @@ static void xe_eudebug_free(struct kref *ref)
 	kfree_rcu(d, rcu);
 }
 
-static void xe_eudebug_put(struct xe_eudebug *d)
+void xe_eudebug_put(struct xe_eudebug *d)
 {
 	kref_put(&d->ref, xe_eudebug_free);
 }
 
+struct xe_eudebug_ack {
+	struct rb_node rb_node;
+	u64 seqno;
+	u64 ts_insert;
+	struct xe_user_fence *ufence;
+};
+
+#define fetch_ack(x) rb_entry(x, struct xe_eudebug_ack, rb_node)
+
+static int compare_ack(const u64 a, const u64 b)
+{
+	if (a < b)
+		return -1;
+	else if (a > b)
+		return 1;
+
+	return 0;
+}
+
+static int ack_insert_cmp(struct rb_node * const node,
+			  const struct rb_node * const p)
+{
+	return compare_ack(fetch_ack(node)->seqno,
+			   fetch_ack(p)->seqno);
+}
+
+static int ack_lookup_cmp(const void * const key,
+			  const struct rb_node * const node)
+{
+	return compare_ack(*(const u64 *)key,
+			   fetch_ack(node)->seqno);
+}
+
+static struct xe_eudebug_ack *remove_ack(struct xe_eudebug *d, u64 seqno)
+{
+	struct rb_root * const root = &d->acks.tree;
+	struct rb_node *node;
+
+	spin_lock(&d->acks.lock);
+	node = rb_find(&seqno, root, ack_lookup_cmp);
+	if (node)
+		rb_erase(node, root);
+	spin_unlock(&d->acks.lock);
+
+	if (!node)
+		return NULL;
+
+	return rb_entry_safe(node, struct xe_eudebug_ack, rb_node);
+}
+
+static void ufence_signal_worker(struct work_struct *w)
+{
+	struct xe_user_fence * const ufence =
+		container_of(w, struct xe_user_fence, eudebug.worker);
+
+	if (READ_ONCE(ufence->signalled))
+		xe_sync_ufence_signal(ufence);
+
+	xe_sync_ufence_put(ufence);
+}
+
+static void kick_ufence_worker(struct xe_user_fence *f)
+{
+	queue_work(f->xe->eudebug.ordered_wq, &f->eudebug.worker);
+}
+
+static void handle_ack(struct xe_eudebug *d, struct xe_eudebug_ack *ack,
+		       bool on_disconnect)
+{
+	struct xe_user_fence *f = ack->ufence;
+	u64 signalled_by;
+	bool signal = false;
+
+	spin_lock(&f->eudebug.lock);
+	if (!f->eudebug.signalled_seqno) {
+		f->eudebug.signalled_seqno = ack->seqno;
+		signal = true;
+	}
+	signalled_by = f->eudebug.signalled_seqno;
+	spin_unlock(&f->eudebug.lock);
+
+	if (signal)
+		kick_ufence_worker(f);
+	else
+		xe_sync_ufence_put(f);
+
+	eu_dbg(d, "ACK: seqno=%llu: signalled by %llu (%s) (held %lluus)",
+	       ack->seqno, signalled_by,
+	       on_disconnect ? "disconnect" : "debugger",
+	       ktime_us_delta(ktime_get(), ack->ts_insert));
+
+	kfree(ack);
+}
+
+static void release_acks(struct xe_eudebug *d)
+{
+	struct xe_eudebug_ack *ack, *n;
+	struct rb_root root;
+
+	spin_lock(&d->acks.lock);
+	root = d->acks.tree;
+	d->acks.tree = RB_ROOT;
+	spin_unlock(&d->acks.lock);
+
+	rbtree_postorder_for_each_entry_safe(ack, n, &root, rb_node)
+		handle_ack(d, ack, true);
+}
+
 static struct task_struct *find_get_target(const pid_t nr)
 {
 	struct task_struct *task;
@@ -328,6 +437,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
 
 	eu_dbg(d, "session %lld detached with %d", d->session, err);
 
+	release_acks(d);
+
 	/* Our ref with the connection_link */
 	xe_eudebug_put(d);
 
@@ -453,7 +564,7 @@ _xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
-static struct xe_eudebug *
+struct xe_eudebug *
 xe_eudebug_get(struct xe_file *xef)
 {
 	struct xe_eudebug *d;
@@ -792,7 +903,7 @@ static struct xe_eudebug_event *
 xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
 			u32 len)
 {
-	const u16 max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_OP;
+	const u16 max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE;
 	const u16 known_flags =
 		DRM_XE_EUDEBUG_EVENT_CREATE |
 		DRM_XE_EUDEBUG_EVENT_DESTROY |
@@ -827,7 +938,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_OP;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -902,6 +1013,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 	return ret;
 }
 
+static long
+xe_eudebug_ack_event_ioctl(struct xe_eudebug *d,
+			   const unsigned int cmd,
+			   const u64 arg)
+{
+	struct drm_xe_eudebug_ack_event __user * const user_ptr =
+		u64_to_user_ptr(arg);
+	struct drm_xe_eudebug_ack_event user_arg;
+	struct xe_eudebug_ack *ack;
+	struct xe_device *xe = d->xe;
+
+	if (XE_IOCTL_DBG(xe, _IOC_SIZE(cmd) < sizeof(user_arg)))
+		return -EINVAL;
+
+	/* Userland write */
+	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_WRITE)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&user_arg,
+					    user_ptr,
+					    sizeof(user_arg))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_arg.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	ack = remove_ack(d, user_arg.seqno);
+	if (XE_IOCTL_DBG(xe, !ack))
+		return -EINVAL;
+
+	handle_ack(d, ack, false);
+
+	return 0;
+}
+
 static int do_eu_control(struct xe_eudebug *d,
 			 const struct drm_xe_eudebug_eu_control * const arg,
 			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
@@ -1093,7 +1242,10 @@ static long xe_eudebug_ioctl(struct file *file,
 		ret = xe_eudebug_eu_control(d, arg);
 		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
 		break;
-
+	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
+		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
+		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -1792,6 +1944,9 @@ xe_eudebug_connect(struct xe_device *xe,
 	INIT_KFIFO(d->events.fifo);
 	INIT_WORK(&d->discovery_work, discovery_work_fn);
 
+	spin_lock_init(&d->acks.lock);
+	d->acks.tree = RB_ROOT;
+
 	d->res = xe_eudebug_resources_alloc();
 	if (IS_ERR(d->res)) {
 		err = PTR_ERR(d->res);
@@ -2486,6 +2641,70 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
 	return 0;
 }
 
+static int xe_eudebug_track_ufence(struct xe_eudebug *d,
+				   struct xe_user_fence *f,
+				   u64 seqno)
+{
+	struct xe_eudebug_ack *ack;
+	struct rb_node *old;
+
+	ack = kzalloc(sizeof(*ack), GFP_KERNEL);
+	if (!ack)
+		return -ENOMEM;
+
+	ack->seqno = seqno;
+	ack->ts_insert = ktime_get();
+
+	spin_lock(&d->acks.lock);
+	old = rb_find_add(&ack->rb_node,
+			  &d->acks.tree, ack_insert_cmp);
+	if (!old) {
+		kref_get(&f->refcount);
+		ack->ufence = f;
+	}
+	spin_unlock(&d->acks.lock);
+
+	if (old) {
+		eu_dbg(d, "ACK: seqno=%llu: already exists", seqno);
+		kfree(ack);
+		return -EEXIST;
+	}
+
+	eu_dbg(d, "ACK: seqno=%llu: tracking started", seqno);
+
+	return 0;
+}
+
+static int vm_bind_ufence_event(struct xe_eudebug *d,
+				struct xe_user_fence *ufence)
+{
+	struct xe_eudebug_event *event;
+	struct xe_eudebug_event_vm_bind_ufence *e;
+	const u32 sz = sizeof(*e);
+	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	u64 seqno;
+	int ret;
+
+	seqno = atomic_long_inc_return(&d->events.seqno);
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					seqno, flags, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_vm_bind_ufence,
+		     e, vm_bind_ref_seqno, ufence->eudebug.bind_ref_seqno);
+
+	ret = xe_eudebug_track_ufence(d, ufence, seqno);
+	if (!ret)
+		ret = xe_eudebug_queue_event(d, event);
+
+	return ret;
+}
+
 void xe_eudebug_vm_init(struct xe_vm *vm)
 {
 	INIT_LIST_HEAD(&vm->eudebug.events);
@@ -2673,6 +2892,24 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
 		xe_eudebug_put(d);
 }
 
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	d = ufence->eudebug.debugger;
+	if (!d || xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	err = vm_bind_ufence_event(d, ufence);
+	if (err) {
+		eu_err(d, "error %d on %s", err, __func__);
+		xe_eudebug_disconnect(d, err);
+	}
+
+	return err;
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_exec_queue *q;
@@ -2765,3 +3002,39 @@ static void discovery_work_fn(struct work_struct *work)
 
 	xe_eudebug_put(d);
 }
+
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence,
+			    struct xe_file *xef,
+			    struct xe_vm *vm)
+{
+	u64 bind_ref;
+
+	/* Drop if OA */
+	if (!vm)
+		return;
+
+	spin_lock(&vm->eudebug.lock);
+	bind_ref = vm->eudebug.ref_seqno;
+	spin_unlock(&vm->eudebug.lock);
+
+	spin_lock_init(&ufence->eudebug.lock);
+	INIT_WORK(&ufence->eudebug.worker, ufence_signal_worker);
+
+	ufence->eudebug.signalled_seqno = 0;
+
+	if (bind_ref) {
+		ufence->eudebug.debugger = xe_eudebug_get(xef);
+
+		if (ufence->eudebug.debugger)
+			ufence->eudebug.bind_ref_seqno = bind_ref;
+	}
+}
+
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence)
+{
+	if (!ufence->eudebug.debugger)
+		return;
+
+	xe_eudebug_put(ufence->eudebug.debugger);
+	ufence->eudebug.debugger = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index ccc7202b3308..13ba0167b31b 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -15,6 +15,7 @@ struct xe_vm;
 struct xe_vma;
 struct xe_exec_queue;
 struct xe_hw_engine;
+struct xe_user_fence;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -41,6 +42,13 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm);
 void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
 void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
 
+int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
+void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, struct xe_vm *vm);
+void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
+
+struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
+void xe_eudebug_put(struct xe_eudebug *d);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -66,6 +74,14 @@ static inline void xe_eudebug_vm_bind_start(struct xe_vm *vm) { }
 static inline void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range) { }
 static inline void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err) { }
 
+static inline int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence) { return 0; }
+static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence,
+					  struct xe_file *xef, struct xe_vm *vm) { }
+static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
+
+static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
+static inline void xe_eudebug_put(struct xe_eudebug *d) { }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index cbc316ec3593..ffb0dc71430a 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -150,6 +150,14 @@ struct xe_eudebug {
 		atomic_long_t seqno;
 	} events;
 
+	/* user fences tracked by this debugger */
+	struct {
+		/** @lock: guards access to tree */
+		spinlock_t lock;
+
+		struct rb_root tree;
+	} acks;
+
 	/** @ops operations for eu_control */
 	struct xe_eudebug_eu_control_ops *ops;
 };
@@ -313,4 +321,9 @@ struct xe_eudebug_event_vm_bind_op {
 	u64 range; /* Zero for unmap all ? */
 };
 
+struct xe_eudebug_event_vm_bind_ufence {
+	struct xe_eudebug_event base;
+	u64 vm_bind_ref_seqno;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 31cca938956f..17dd7a3f8354 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -159,7 +159,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	vm = q->vm;
 
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
 					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8dd55798ab31..a32dc3fdabe7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1379,7 +1379,8 @@ static int xe_oa_parse_syncs(struct xe_oa *oa, struct xe_oa_open_param *param)
 	}
 
 	for (num_syncs = 0; num_syncs < param->num_syncs; num_syncs++) {
-		ret = xe_sync_entry_parse(oa->xe, param->xef, &param->syncs[num_syncs],
+		ret = xe_sync_entry_parse(oa->xe, param->xef, NULL,
+					  &param->syncs[num_syncs],
 					  &param->syncs_user[num_syncs], 0);
 		if (ret)
 			goto err_syncs;
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 42f5bebd09e5..3e7398983b52 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -15,27 +15,20 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_device_types.h"
+#include "xe_eudebug.h"
 #include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
-struct xe_user_fence {
-	struct xe_device *xe;
-	struct kref refcount;
-	struct dma_fence_cb cb;
-	struct work_struct worker;
-	struct mm_struct *mm;
-	u64 __user *addr;
-	u64 value;
-	int signalled;
-};
-
 static void user_fence_destroy(struct kref *kref)
 {
 	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
 						 refcount);
 
 	mmdrop(ufence->mm);
+
+	xe_eudebug_ufence_fini(ufence);
+
 	kfree(ufence);
 }
 
@@ -49,7 +42,10 @@ static void user_fence_put(struct xe_user_fence *ufence)
 	kref_put(&ufence->refcount, user_fence_destroy);
 }
 
-static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
+static struct xe_user_fence *user_fence_create(struct xe_device *xe,
+					       struct xe_file *xef,
+					       struct xe_vm *vm,
+					       u64 addr,
 					       u64 value)
 {
 	struct xe_user_fence *ufence;
@@ -70,12 +66,14 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	ufence->mm = current->mm;
 	mmgrab(ufence->mm);
 
+	xe_eudebug_ufence_init(ufence, xef, vm);
+
 	return ufence;
 }
 
-static void user_fence_worker(struct work_struct *w)
+void xe_sync_ufence_signal(struct xe_user_fence *ufence)
 {
-	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+	XE_WARN_ON(!ufence->signalled);
 
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
@@ -87,12 +85,25 @@ static void user_fence_worker(struct work_struct *w)
 		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
+	wake_up_all(&ufence->xe->ufence_wq);
+}
+
+static void user_fence_worker(struct work_struct *w)
+{
+	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
+	int ret;
+
 	/*
 	 * Wake up waiters only after updating the ufence state, allowing the UMD
 	 * to safely reuse the same ufence without encountering -EBUSY errors.
 	 */
 	WRITE_ONCE(ufence->signalled, 1);
-	wake_up_all(&ufence->xe->ufence_wq);
+
+	/* Lets see if debugger wants to track this */
+	ret = xe_eudebug_vm_bind_ufence(ufence);
+	if (ret)
+		xe_sync_ufence_signal(ufence);
+
 	user_fence_put(ufence);
 }
 
@@ -111,6 +122,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 }
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
+			struct xe_vm *vm,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags)
@@ -192,7 +204,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		if (exec) {
 			sync->addr = sync_in.addr;
 		} else {
-			sync->ufence = user_fence_create(xe, sync_in.addr,
+			sync->ufence = user_fence_create(xe, xef, vm,
+							 sync_in.addr,
 							 sync_in.timeline_value);
 			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
 				return PTR_ERR(sync->ufence);
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 256ffc1e54dc..f5bec2b1b4f6 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -9,8 +9,12 @@
 #include "xe_sync_types.h"
 
 struct xe_device;
-struct xe_exec_queue;
 struct xe_file;
+struct xe_exec_queue;
+struct drm_syncobj;
+struct dma_fence;
+struct dma_fence_chain;
+struct drm_xe_sync;
 struct xe_sched_job;
 struct xe_vm;
 
@@ -19,6 +23,7 @@ struct xe_vm;
 #define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
+			struct xe_vm *vm,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags);
@@ -40,5 +45,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
+void xe_sync_ufence_signal(struct xe_user_fence *ufence);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 30ac3f51993b..dcd3165e66a7 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -6,13 +6,31 @@
 #ifndef _XE_SYNC_TYPES_H_
 #define _XE_SYNC_TYPES_H_
 
+#include <linux/dma-fence-array.h>
+#include <linux/kref.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
-struct drm_syncobj;
-struct dma_fence;
-struct dma_fence_chain;
-struct drm_xe_sync;
-struct user_fence;
+struct xe_user_fence {
+	struct xe_device *xe;
+	struct kref refcount;
+	struct dma_fence_cb cb;
+	struct work_struct worker;
+	struct mm_struct *mm;
+	u64 __user *addr;
+	u64 value;
+	int signalled;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	struct {
+		spinlock_t lock;
+		struct xe_eudebug *debugger;
+		u64 bind_ref_seqno;
+		u64 signalled_seqno;
+		struct work_struct worker;
+	} eudebug;
+#endif
+};
 
 struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e83420473763..0f17bc8b627b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3037,9 +3037,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	xe_eudebug_vm_bind_start(vm);
+
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0) |
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index cc34c522fa4d..1d5f1411c9a8 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -17,6 +17,7 @@ extern "C" {
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
 #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
 
 /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
 struct drm_xe_eudebug_event {
@@ -32,6 +33,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	6
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND		7
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		8
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -174,6 +176,17 @@ struct drm_xe_eudebug_event_vm_bind_op {
 	__u64 range; /* XXX: Zero for unmap all? */
 };
 
+struct drm_xe_eudebug_event_vm_bind_ufence {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+};
+
+struct drm_xe_eudebug_ack_event {
+	__u32 type;
+	__u32 flags; /* MBZ */
+	__u64 seqno;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

