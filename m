Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229681ADF4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD4C10E667;
	Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E379410E654;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f40+dO32XfCQXtj0bJ18zsnoVP4q5bzdJvLh70FVUGk=;
 b=fiLhHv252zYocMHIcUWrpHBEpa8ZL2qGdWN2B/mnzJgIkjCVtnefDous
 URTfVkEHyOfb4bOTH2X2cdK3tyxUTRpLnqoDW8ML+Y2hPX+1lv0xdKFXh
 I8nBNl0m466IwwEly1QnDDWWZSh+uxFfHM/iJu95fkknLBNyRaDELrs4Z
 4eBvmVdcytXBxTcor7LWhu23mOHqWmSuH4k5WbGm703h+dUK9J3LkkoF4
 +Tqr7/H27P5WE9XrKBZBdQQhA+sxwRZRWXV+IxgP36hWlcb9erbiOmuej
 kne+cQlZYG5X6DseXtDz2YA+FH+AlNiqArYQenKLkx+lzWCc3Y0cqjfyy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069772"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069772"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481372"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481372"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 12/22] drm/xe/svm: Trace buddy block allocation and free
Date: Wed, 20 Dec 2023 23:38:02 -0500
Message-Id: <20231221043812.3783313-13-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm_devmem.c |  5 ++++-
 drivers/gpu/drm/xe/xe_trace.h      | 35 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
index 445e0e1bc3b4..5cd54dde4a9d 100644
--- a/drivers/gpu/drm/xe/xe_svm_devmem.c
+++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
@@ -95,6 +95,7 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
 		block->private = meta;
 		block_pfn_first =
 					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
+		trace_xe_buddy_block_alloc(block, size, block_pfn_first);
 		for(i = 0; i < pages_per_block; i++) {
 			struct page *page;
 
@@ -159,8 +160,10 @@ void xe_devm_page_free(struct page *page)
 
 	xe_assert(tile->xe, i < pages_per_block);
 	clear_bit(i, meta->bitmap);
-	if (bitmap_empty(meta->bitmap, pages_per_block))
+	if (bitmap_empty(meta->bitmap, pages_per_block)) {
 		free_block(block);
+		trace_xe_buddy_block_free(block, size, block_pfn_first);
+	}
 }
 
 static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 63867c0fa848..50380f5173ca 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -11,6 +11,7 @@
 
 #include <linux/tracepoint.h>
 #include <linux/types.h>
+#include <drm/drm_buddy.h>
 
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
@@ -600,6 +601,40 @@ DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
 
 );
 
+DECLARE_EVENT_CLASS(xe_buddy_block,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn),
+
+               TP_STRUCT__entry(
+                               __field(u64, block)
+                               __field(u64, header)
+                               __field(u64, size)
+                               __field(u64, pfn)
+               ),
+
+               TP_fast_assign(
+                               __entry->block = (u64)block;
+                               __entry->header = block->header;
+                               __entry->size = size;
+                               __entry->pfn = pfn;
+               ),
+
+               TP_printk("xe svm: allocated block %llx, block header %llx, size %llx, pfn %llx\n",
+                       __entry->block, __entry->header, __entry->size, __entry->pfn)
+);
+
+
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_alloc,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn)
+);
+
+
+DEFINE_EVENT(xe_buddy_block, xe_buddy_block_free,
+               TP_PROTO(struct drm_buddy_block *block, u64 size, u64 pfn),
+               TP_ARGS(block, size, pfn)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.26.3

