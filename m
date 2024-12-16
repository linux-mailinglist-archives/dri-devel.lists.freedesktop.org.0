Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2F9F32D8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A6F10E6A0;
	Mon, 16 Dec 2024 14:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTiuGk2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0AB10E692;
 Mon, 16 Dec 2024 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734358641; x=1765894641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4OHPMDOAAPb8J5rJXxpYnRqkgZC9AeDOeomzy/3ci3A=;
 b=iTiuGk2fBy8hKGMngFO7GI5C8gJiErfVVFer/ixub0HXbtidWlbNspz0
 SUa9ePJ2r8uo/ESNLfSxK+QN0ncOTsv5fwsCe/udK7iCzJ6oHPJp+h672
 hOIX7fBxm83M/CvJbJiF9gdLaj/fb7MIALzxmcOtc6BwScwKzf4wZouXz
 UJT3pZmk011bEkWZgTw+ej3HJOzkEmICWvAu1kYbAG/KypW8EXVvw6VDx
 qtqZo/WsJsgWVUxlZDtxYQx9L3sm1Nln8uwa+mjVC2pR5EaihuE5KNLAV
 fg9VMhydeVtLMWY8wOKN4A+uXTzD23sOqH6FsGsoTkRClXE/p2dRkA6xm A==;
X-CSE-ConnectionGUID: U26B8ZqISraPDWV2PxMBYw==
X-CSE-MsgGUID: 22xdzEH8Q8eDzRiJlWTPjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46137106"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46137106"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 06:17:20 -0800
X-CSE-ConnectionGUID: +YzmFvWdRw22i/zzVM/HIg==
X-CSE-MsgGUID: llG1kUl/R4uLI1ko3Vb+Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102306430"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 06:17:18 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
Date: Mon, 16 Dec 2024 16:17:21 +0200
Message-ID: <20241216141721.2051279-1-mika.kuoppala@linux.intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c  | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 11 +++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  6 ++++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 9d87df75348b..980b5a1383ad 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3074,6 +3074,18 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
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
+					 xe_vma_userptr(vma), buf, bytes,
+					 write ? FOLL_WRITE : 0);
 	}
 
 	return -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0f17bc8b627b..c23bb4547d66 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -999,6 +999,14 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			}
 
 			userptr->notifier_seq = LONG_MAX;
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+			/*
+			 * We could use the mm which is on notifier. But
+			 * the access_remote_vm() is not exported. Thus
+			 * we get reference to task for access_process_vm()
+			 */
+			userptr->eudebug.task = get_task_struct(current);
+#endif
 		}
 
 		xe_vm_get(vm);
@@ -1023,6 +1031,9 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		if (userptr->sg)
 			xe_hmm_userptr_free_sg(uvma);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+		put_task_struct(userptr->eudebug.task);
+#endif
 		/*
 		 * Since userptr pages are not pinned, we can't remove
 		 * the notifer until we're sure the GPU is not accessing
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

