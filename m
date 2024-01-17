Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF8830EF4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2810E8A1;
	Wed, 17 Jan 2024 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BDA10E88C;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a0CyKgI90QVtJzTmA2DuaoGo2T/vpJ7XqCsA6jXeFbo=;
 b=HJDg7ENA8T2Vwx/OJ5Hv6L8Y0Otw94Fj76Dl6A4SPWnHqBT3DhAtOJZ1
 x5s8suNhnOBPa/CRcetnZPwnPNatl9xl6Wz4n/lxBE0Jdl2IukoXVSOCn
 jFjGTL4KhvIk0/3QyI/IPwa1QT9yZxIZlQJruKjWK5oVqKsZ06oGdia40
 ODYk1862aqwqH5tiO+RliQXHW2gLcLHmcy+iaXG2qZet41+0/UYHcYM+j
 3yJ0qCy4wMNQ3B6dqn4ahBAaYdUSa/XG4bIFxbEtZKh/ec7PUmnXP/JGJ
 yxM5dQDaEbVefOryd1+bV3ZgAsPEzA+DNL4HbsCHuLc15ZWF337qnk6Av Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657627"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657627"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089257"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089257"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 14/23] drm/xe/svm: trace svm range migration
Date: Wed, 17 Jan 2024 17:12:14 -0500
Message-Id: <20240117221223.18540-15-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add function to trace svm range migration, either
from vram to sram, or sram to vram

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm_migrate.c |  1 +
 drivers/gpu/drm/xe/xe_trace.h       | 30 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
index 3be26da33aa3..b4df411e04f3 100644
--- a/drivers/gpu/drm/xe/xe_svm_migrate.c
+++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
@@ -201,6 +201,7 @@ vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
 	if (!migrate_vma.cpages)
 		goto free_buf;
 
+	trace_xe_svm_migrate_vram_to_sram(range);
 	for (i = 0; i < npages; i++) {
 		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
 							migrate_vma.dst + i);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 50380f5173ca..960eec38aee5 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -21,6 +21,7 @@
 #include "xe_guc_exec_queue_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "xe_svm.h"
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
@@ -601,6 +602,35 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+DECLARE_EVENT_CLASS(xe_svm_migrate,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range),
+
+		    TP_STRUCT__entry(
+			     __field(u64, start)
+			     __field(u64, end)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->start = range->start;
+			   __entry->end = range->end;
+			   ),
+
+		    TP_printk("Migrate svm range [0x%016llx,0x%016llx)",  __entry->start,
+			      __entry->end)
+);
+
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_vram_to_sram,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range)
+);
+
+
+DEFINE_EVENT(xe_svm_migrate, xe_svm_migrate_sram_to_vram,
+		    TP_PROTO(struct xe_svm_range *range),
+		    TP_ARGS(range)
+);
+
 DECLARE_EVENT_CLASS(xe_buddy_block,
                TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
                TP_ARGS(block, size, pfn),
-- 
2.26.3

