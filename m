Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690039E970C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402C10E74E;
	Mon,  9 Dec 2024 13:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4yQpSZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D35610E75A;
 Mon,  9 Dec 2024 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751207; x=1765287207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=de/u2tWBFVAIdQnJDSDQoU0pPV3M20qjM9UvPCWy9Wk=;
 b=I4yQpSZ+UJ+8cvbFQnDS5IBzHw41RujFl3c+FhH5b5pN9GflFgB7jbF0
 zGFWemo1e751abCpGYSeiZ/IybE+6oOungaZduC4iF/cMtSNIiEvYk+GU
 fHte+IA/naiAhzKNJDCMqhLfq23N6j85FR3UEz/5b0oOeXKd7N6592bPq
 YXeb/AbTbjJMkhOR+sYoSe6yUGkEVcCaIQVdm6KHvzIH3pqWFGz9/B/kH
 3YKEozkjCv5Jl/BQqPxQswu3M/rOIQ+1hOZLSLf7Jh//f1QHBrVreT6xi
 QnlweeW1Lae8OwZtUpkIGZexuN/8hBojDjHGN44I2Tw0/c0vAvQ6asgL6 w==;
X-CSE-ConnectionGUID: Hld7nBTBReylJHTEWgNVzQ==
X-CSE-MsgGUID: VMHg4P7PRs6CfrDDy/Pc2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192064"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:27 -0800
X-CSE-ConnectionGUID: 37JK02koTcSf/c/MbvXsjw==
X-CSE-MsgGUID: BH1pn6BQQhKpbVr7WYr/vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531326"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:26 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
Date: Mon,  9 Dec 2024 15:33:05 +0200
Message-ID: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Debugger needs to read/write program's vmas including userptr_vma.
Since hmm_range_fault is used to pin userptr vmas, it is possible
to map those vmas from debugger context.

v2: pin pages vs notifier, move to vm.c (Matthew)
v3: - iterate over system pages instead of DMA, fixes iommu enabled
    - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h      |  3 +++
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 9d87df75348b..e5949e4dcad8 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
 		return ret;
 	}
 
-	return -EINVAL;
+	return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
+				    buf, bytes, write);
 }
 
 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0f17bc8b627b..224ff9e16941 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	struct xe_userptr *up = &uvma->userptr;
+	struct xe_res_cursor cur = {};
+	int cur_len, ret = 0;
+
+	while (true) {
+		down_read(&vm->userptr.notifier_lock);
+		if (!xe_vma_userptr_check_repin(uvma))
+			break;
+
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_del_init(&uvma->userptr.invalidate_link);
+		spin_unlock(&vm->userptr.invalidated_lock);
+
+		up_read(&vm->userptr.notifier_lock);
+		ret = xe_vma_userptr_pin_pages(uvma);
+		if (ret)
+			return ret;
+	}
+
+	if (!up->sg) {
+		ret = -EINVAL;
+		goto out_unlock_notifier;
+	}
+
+	for (xe_res_first_sg_system(up->sg, offset, len, &cur); cur.remaining;
+	     xe_res_next(&cur, cur_len)) {
+		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
+
+		cur_len = min(cur.size, cur.remaining);
+		if (write)
+			memcpy(ptr, buf, cur_len);
+		else
+			memcpy(buf, ptr, cur_len);
+		kunmap_local(ptr);
+		buf += cur_len;
+	}
+	ret = len;
+
+out_unlock_notifier:
+	up_read(&vm->userptr.notifier_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 23adb7442881..372ad40ad67f 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -280,3 +280,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+
+int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
+			 void *buf, u64 len, bool write);
-- 
2.43.0

