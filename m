Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59049E9700
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5533810E743;
	Mon,  9 Dec 2024 13:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWAjm2J5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449D10E748;
 Mon,  9 Dec 2024 13:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751191; x=1765287191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNzKJ557BMcxI2zE5cRgA79+1J7ZSisRgX0YkmChjLs=;
 b=RWAjm2J5+OqjRqF3HjfvrkSj30PCdLE05r4GqX3I8pWIAfKl8CtR8qTh
 JxwIgrJ4gOc1Akb8kKG/OuVrdglfl8D7TQxXr0ZaGVOh+nI1i55ok1++H
 SBIzvfVwcx1L2RTfw+UvoLwfD7KY/bpUgusOuac7yfzd5cLQnymB0UmMU
 5gNigjLNe0gpmCWKaqvGonVVeLhVh9Z/ZoMhgqQtre1/KydQW8EFEkU3i
 TdvmMuq0KVcbbzo9DPN4ajjcNla2GnLK6/E4Rr8O25/b/FSraguCGjuqB
 fCQMlCoi+kr1Ish/aR9EPVE6rWFwQcFIS0ldbXeA9hSuBK8x8TJmOQLgP A==;
X-CSE-ConnectionGUID: pp8A6re7S2W+7Z9I58L8fw==
X-CSE-MsgGUID: +gk9k+cbSX+FVsnfYuYmRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34191942"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34191942"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:11 -0800
X-CSE-ConnectionGUID: se54qCDHRLqVgNq3RR5jUg==
X-CSE-MsgGUID: 4zeihSdESdG58YhAheQTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531262"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:09 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 05/26] drm/xe/eudebug: Introduce exec queue placements event
Date: Mon,  9 Dec 2024 15:32:56 +0200
Message-ID: <20241209133318.1806472-6-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

This commit introduces the DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
which provides dbgUMD with information about the hw engines utilized
during execution. The event is sent for every logical ring context (lrc)
in scenarios involving parallel submission.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 99 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_eudebug_types.h | 26 +++++++
 include/uapi/drm/xe_drm_eudebug.h     | 17 +++++
 3 files changed, 133 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 3ca46ec838b9..cbcf7a72fdba 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -717,7 +717,7 @@ static struct xe_eudebug_event *
 xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
 			u32 len)
 {
-	const u16 max_event = DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE;
+	const u16 max_event = DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS;
 	const u16 known_flags =
 		DRM_XE_EUDEBUG_EVENT_CREATE |
 		DRM_XE_EUDEBUG_EVENT_DESTROY |
@@ -752,7 +752,7 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
 		u64_to_user_ptr(arg);
 	struct drm_xe_eudebug_event user_event;
 	struct xe_eudebug_event *event;
-	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE;
+	const unsigned int max_event = DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS;
 	long ret = 0;
 
 	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
@@ -1206,12 +1206,88 @@ static int send_exec_queue_event(struct xe_eudebug *d, u32 flags,
 	return xe_eudebug_queue_event(d, event);
 }
 
-static int exec_queue_create_event(struct xe_eudebug *d,
-				   struct xe_file *xef, struct xe_exec_queue *q)
+static int send_exec_queue_placements_event(struct xe_eudebug *d,
+					    u64 client_handle, u64 vm_handle,
+					    u64 exec_queue_handle, u64 lrc_handle,
+					    u32 num_placements, u64 *instances,
+					    u64 seqno)
+{
+	struct xe_eudebug_event_exec_queue_placements *e;
+	const u32 sz = struct_size(e, instances, num_placements);
+	struct xe_eudebug_event *event;
+
+	event = xe_eudebug_create_event(d,
+					DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
+					seqno, DRM_XE_EUDEBUG_EVENT_CREATE, sz);
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	write_member(struct drm_xe_eudebug_event_exec_queue_placements, e, client_handle,
+		     client_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue_placements, e, vm_handle, vm_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue_placements, e, exec_queue_handle,
+		     exec_queue_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue_placements, e, lrc_handle, lrc_handle);
+	write_member(struct drm_xe_eudebug_event_exec_queue_placements, e, num_placements,
+		     num_placements);
+
+	memcpy(e->instances, instances, num_placements * sizeof(*instances));
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int send_exec_queue_placements_events(struct xe_eudebug *d, struct xe_exec_queue *q,
+					     u64 client_handle, u64 vm_handle,
+					     u64 exec_queue_handle, u64 *lrc_handles)
+{
+
+	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE] = {};
+	unsigned long mask = q->logical_mask;
+	u32 num_placements = 0;
+	int ret, i, j;
+	u64 seqno;
+
+	for_each_set_bit(i, &mask, sizeof(q->logical_mask) * 8) {
+		if (XE_WARN_ON(num_placements == XE_HW_ENGINE_MAX_INSTANCE))
+			break;
+
+		eci[num_placements].engine_class = xe_to_user_engine_class[q->class];
+		eci[num_placements].engine_instance = i;
+		eci[num_placements++].gt_id = q->gt->info.id;
+	}
+
+	ret = 0;
+	for (i = 0; i < q->width; i++) {
+		seqno = atomic_long_inc_return(&d->events.seqno);
+
+		ret = send_exec_queue_placements_event(d, client_handle, vm_handle,
+						       exec_queue_handle, lrc_handles[i],
+						       num_placements, (u64 *)eci, seqno);
+		if (ret)
+			return ret;
+
+		/*
+		 * Parallel submissions must be logically contiguous,
+		 * so the next placement is just q->logical_mask >> 1
+		 */
+		for (j = 0; j < num_placements; j++) {
+			eci[j].engine_instance++;
+			XE_WARN_ON(eci[j].engine_instance >= XE_HW_ENGINE_MAX_INSTANCE);
+		}
+	}
+
+	return ret;
+}
+
+static int exec_queue_create_events(struct xe_eudebug *d,
+				    struct xe_file *xef, struct xe_exec_queue *q)
 {
 	int h_c, h_vm, h_queue;
 	u64 h_lrc[XE_HW_ENGINE_MAX_INSTANCE], seqno;
 	int i;
+	int ret = 0;
 
 	if (!xe_exec_queue_is_lr(q))
 		return 0;
@@ -1252,9 +1328,14 @@ static int exec_queue_create_event(struct xe_eudebug *d,
 	 * we disconnect
 	 */
 
-	return send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
-				     h_c, h_vm, h_queue, q->class,
-				     q->width, h_lrc, seqno);
+	ret = send_exec_queue_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
+				  h_c, h_vm, h_queue, q->class,
+				  q->width, h_lrc, seqno);
+
+	if (ret)
+		return ret;
+
+	return send_exec_queue_placements_events(d, q, h_c, h_vm, h_queue, h_lrc);
 }
 
 static int exec_queue_destroy_event(struct xe_eudebug *d,
@@ -1317,7 +1398,7 @@ void xe_eudebug_exec_queue_create(struct xe_file *xef, struct xe_exec_queue *q)
 	if (!d)
 		return;
 
-	xe_eudebug_event_put(d, exec_queue_create_event(d, xef, q));
+	xe_eudebug_event_put(d, exec_queue_create_events(d, xef, q));
 }
 
 void xe_eudebug_exec_queue_destroy(struct xe_file *xef, struct xe_exec_queue *q)
@@ -1355,7 +1436,7 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 		if (!exec_queue_class_is_tracked(q->class))
 			continue;
 
-		err = exec_queue_create_event(d, xef, q);
+		err = exec_queue_create_events(d, xef, q);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index 4824c4159036..bdffdfb1abff 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -202,4 +202,30 @@ struct xe_eudebug_event_exec_queue {
 	u64 lrc_handle[] __counted_by(width);
 };
 
+struct xe_eudebug_event_exec_queue_placements {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+
+	/** @client_handle: client for the engine create/destroy */
+	u64 client_handle;
+
+	/** @vm_handle: vm handle for the engine create/destroy */
+	u64 vm_handle;
+
+	/** @exec_queue_handle: engine handle */
+	u64 exec_queue_handle;
+
+	/** @engine_handle: engine class */
+	u64 lrc_handle;
+
+	/** @num_placements: all possible placements for given lrc */
+	u32 num_placements;
+
+	/** @pad: padding */
+	u32 pad;
+
+	/** @instances: num_placements sized array containing drm_xe_engine_class_instance*/
+	u64 instances[]; __counted_by(num_placements);
+};
+
 #endif
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index ac44e890152a..21690008a869 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -27,6 +27,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_OPEN		2
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS 5
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -61,6 +62,22 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
+struct drm_xe_eudebug_event_exec_queue_placements {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 num_placements;
+	__u32 pad;
+	/**
+	 * @instances: user pointer to num_placements sized array of struct
+	 * drm_xe_engine_class_instance
+	 */
+	__u64 instances[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

