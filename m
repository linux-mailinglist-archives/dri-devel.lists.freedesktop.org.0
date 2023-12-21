Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA081ADF5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC2F10E663;
	Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD010E646;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQqPRntErOjKUxjbw9Wty6YMAMzApez6E8/rs70LTlA=;
 b=ia6ViTzTaUHKFG1ttsUgoMkRV0zst3HW4Tefkg+VxSo4At9egHANSM1W
 tq1lYer3rajPGCd07rlPS2e2HIb2ZE0QRZnyT+rYgrvfcrVwcpFfojbcd
 60wByK8wnuI/eAOFgwWWGq9CDPOXDP7jIdU+b1JDHXliKoh3oOQwftdzB
 lRX54lASg5ODoA0AWahbO4Eh8kipfy2QpAZGkLkd56AQiMSRSSqvwz3wH
 18odF/MpNYNbXd6wxjy1froEWBQx3AhjEVfSfS7IJIV8un7wAZFlc27EN
 k+51jA0ARGlFrS7G5JyIb5JNtMD4nCPEBwzRW/7YU2Osi3tlxRFIv0N+N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069767"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069767"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481360"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481360"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 08/22] drm/xe/svm: Add helper to invalidate svm range from GPU
Date: Wed, 20 Dec 2023 23:37:58 -0500
Message-Id: <20231221043812.3783313-9-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A svm subsystem friendly function is added for svm range invalidation
purpose. svm subsystem doesn't maintain xe_vma, so a temporary xe_vma
is used to call function xe_vma_invalidate_vma

Not sure whether this works or not. Will have to test. if a temporary
vma doesn't work, we will have to call the zap_pte/tlb_inv functions
directly.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 65cfac88ab2f..9805b402ebca 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1748,3 +1748,36 @@ int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
 	dma_fence_put(fence);
 	return ret;
 }
+
+/**
+ * xe_invalidate_svm_range() - a helper to invalidate a svm address range
+ *
+ * @vm: The vm that the address range belongs to
+ * @start: start of the virtual address range
+ * @size: size of the virtual address range
+ *
+ * This is a helper function supposed to be used by svm subsystem.
+ * svm subsystem doesn't maintain xe_vma, so we create a temporary
+ * xe_vma structure so we can reuse xe_vm_invalidate_vma().
+ */
+void xe_invalidate_svm_range(struct xe_vm *vm, u64 start, u64 size)
+{
+	struct xe_vma vma = {
+		.gpuva = {
+			.va = {
+				.addr = start,
+				.range = size,
+			},
+			.vm = &vm->gpuvm,
+		},
+		/** invalidate from all tiles
+		 *  FIXME: We used temporary vma in xe_bind_svm_range, so
+		 *  we lost track of which tile we are bound to. Does
+		 *  setting tile_present to all tiles cause a problem
+		 *  in xe_vm_invalidate_vma()?
+		 */
+		.tile_present = BIT(vm->xe->info.tile_count) - 1,
+	};
+
+	xe_vm_invalidate_vma(&vma);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 775d08707466..42d495997635 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -49,4 +49,5 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
 int xe_bind_svm_range(struct xe_vm *vm, struct xe_tile *tile,
 			struct hmm_range *range, u64 flags);
+void xe_invalidate_svm_range(struct xe_vm *vm, u64 start, u64 size);
 #endif
-- 
2.26.3

