Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0489E971E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CE910E767;
	Mon,  9 Dec 2024 13:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IolEBWzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4B010E768;
 Mon,  9 Dec 2024 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751228; x=1765287228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=90FvMUCLQi8mDjtBvWw+swGOj430xuNure4yFSG5B6I=;
 b=IolEBWzd8/PCPSJa+8WCBQHBXJSM4PoVeFhcZQBMWABs9C7ig0X63pED
 JZsGrebwligQqm6KBvCXXOOlQ71FyK70YvjpzHVxs/e7Q6KZDx39I2UP5
 QK6B7IzkyHuYL78oj1R/HSUOhVM8692C0VwO1dGHJAnk0Lx93e0y89HCj
 sruWzNuoHgZTFFvjXhmzwpxo8ai62U9Wgb/JaJofCiCJeh8A58PPFgLkM
 0qt81CdOyhGAiT0TODoPKECfoRFvxnDvPlVEAq2flELMSDtASlZ9tYE4a
 gGUnFqxFsIPQCbgr/ig+4BbUJvjS77zXMe/FV+S3P+y6/J26qwAG7Tz1G g==;
X-CSE-ConnectionGUID: v50arGQfS1Kg7/kbv4z+jg==
X-CSE-MsgGUID: UwnGw1zYRxO72IVlzGM+/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192214"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:47 -0800
X-CSE-ConnectionGUID: AFt/k6KfRNm8xPW4e5YaaA==
X-CSE-MsgGUID: Wxzb7kBeS1a1dDfw7eeegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531391"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:45 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 25/26] drm/xe/vm: Support for adding null page VMA to VM on
 request
Date: Mon,  9 Dec 2024 15:33:16 +0200
Message-ID: <20241209133318.1806472-26-mika.kuoppala@linux.intel.com>
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

From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
access will halt the corresponding EUs. So, in order to activate the
debugger, kmd needs to install the temporal page to unhalt the EUs.
Plan to be used for pagefault handling when the EU debugger is running.
The idea is to install a null page vma if the pagefault is from an invalid
access. After installing null page pte, the user debugger can continue to
run/inspect without causing a fatal failure or reset and stop.
Based on Bruce's implementation [1].

[1] https://lore.kernel.org/intel-xe/20230829231648.4438-1-yu.bruce.chang@intel.com/

Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Co-developed-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 474521d0fea9..ff45e5264aed 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3552,3 +3552,26 @@ int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
 	up_read(&vm->userptr.notifier_lock);
 	return ret;
 }
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma;
+	u32 page_size;
+	int err;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	page_size = vm->flags & XE_VM_FLAG_64K ? SZ_64K : SZ_4K;
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + page_size - 1, 0, VMA_CREATE_FLAG_IS_NULL);
+	if (IS_ERR_OR_NULL(vma))
+		return vma;
+
+	err = xe_vm_insert_vma(vm, vma);
+	if (err) {
+		xe_vma_destroy_late(vma);
+		return ERR_PTR(err);
+	}
+
+	return vma;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 372ad40ad67f..2ae3749cfd82 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -283,3 +283,5 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
 int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
 			 void *buf, u64 len, bool write);
+
+struct xe_vma *xe_vm_create_null_vma(struct xe_vm *vm, u64 addr);
-- 
2.43.0

