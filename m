Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4049F9150
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C17D10E156;
	Fri, 20 Dec 2024 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUzhr2UA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C6A10E14B;
 Fri, 20 Dec 2024 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734694266; x=1766230266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBiB0Q5zHdVMabu10o/KiQgmUWnvenJ0r6Y9qeteFhY=;
 b=WUzhr2UAxcKHuaNJvgNRlU0vfz1QKslsCg/5xrcsiBSvwQyUDtmL0JFt
 yUZdlCKLQ17EkQfsbYL/YNNKzVV+FDzTVw+bDXLPmwWrz6p/0TibT1Vf3
 dYr0t7mskMvNMPXfLPRPSwej4o67Ex3NwL808kC66P2hWdyvIpVogZh9d
 hA13g1griwNzD3L1OjNF0VaQtGn4dOy96b6by8rFxUXmtevO2iuKeLswu
 wBZRKwid5nIqWk70the51ga0d1US7bmnQHVgulSe6mz2aOoZtJlrkhoC3
 3d67pwtZfVe2HMY47P4WS/x7BWlA6la1tJhyLa0JnJl2ECKxw6eXvUj5R Q==;
X-CSE-ConnectionGUID: TR+F4c0ZSdqsCA8bsBd5ow==
X-CSE-MsgGUID: 9JtUtxqFQEK37F3V8nTQWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34524532"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="34524532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:31:05 -0800
X-CSE-ConnectionGUID: gHEwAM5sTLK1HkH4MBg1kQ==
X-CSE-MsgGUID: MjRsYopNTaavVu+xwWbGIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98687155"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 03:31:02 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
Date: Fri, 20 Dec 2024 13:31:08 +0200
Message-ID: <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
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

Implement debugger vm access for userptrs.

When bind is done, take ref to current task so that
we know from which vm the address was bound. Then during
debugger pread/pwrite we use this target task as
parameter to access the debuggee vm with access_process_vm().

This is based on suggestions from Thomas, Joonas and Simona.

v2: need to add offset into vma (Dominik)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c  | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |  4 ++++
 drivers/gpu/drm/xe/xe_vm.h       | 28 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 9d87df75348b..8b29192ab110 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3074,6 +3074,19 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
 		xe_bo_put(bo);
 
 		return ret;
+	} else if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+
+		/*
+		 * XXX: access_remote_vm() would fit as userptr notifier has
+		 * mm ref so we would not need to carry task ref at all.
+		 * But access_remote_vm is not exported. access_process_vm()
+		 * is exported so use it instead.
+		 */
+		return access_process_vm(userptr->eudebug.task,
+					 xe_vma_userptr(vma) + offset_in_vma,
+					 buf, bytes,
+					 write ? FOLL_WRITE : 0);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1cb21325d8dd..235ae2db5188 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -999,6 +999,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			}
 
 			userptr->notifier_seq = LONG_MAX;
+
+			xe_eudebug_track_userptr_task(userptr);
 		}
 
 		xe_vm_get(vm);
@@ -1023,6 +1025,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		if (userptr->sg)
 			xe_hmm_userptr_free_sg(uvma);
 
+		xe_eudebug_untrack_userptr_task(userptr);
+
 		/*
 		 * Since userptr pages are not pinned, we can't remove
 		 * the notifer until we're sure the GPU is not accessing
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 23adb7442881..4334cf2b0d9d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -274,9 +274,35 @@ static inline void vm_dbg(const struct drm_device *dev,
 			  const char *format, ...)
 { /* noop */ }
 #endif
-#endif
 
 struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
+{
+	/*
+	 * We could use the mm which is on notifier. But
+	 * the access_remote_vm() is not exported. Thus
+	 * we get reference to task for access_process_vm()
+	 */
+	userptr->eudebug.task = get_task_struct(current);
+}
+
+static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
+{
+	put_task_struct(userptr->eudebug.task);
+}
+#else
+static inline void xe_eudebug_track_userptr_task(struct xe_userptr *userptr)
+{
+}
+
+static inline void xe_eudebug_untrack_userptr_task(struct xe_userptr *userptr)
+{
+}
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 557b047ebdd7..26176ccbcbbc 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -68,6 +68,12 @@ struct xe_userptr {
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	struct {
+		struct task_struct *task;
+	} eudebug;
+#endif
 };
 
 struct xe_vma {
-- 
2.43.0

