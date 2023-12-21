Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0381AE01
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E280010E675;
	Thu, 21 Dec 2023 04:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBDA10E65C;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48hfptNhzrcO9krlOeJxd2g9CKO7QM3DEf3WOpS2jvo=;
 b=HOrECIuFMjmYrZ1bqw6kaT13ZO+GmzJ5KBiY5+XLLHu3lWDuGY++cEMI
 mYBBnyezfX4Dn3dCFIvIyYGnic+M/r6PCHq/b6vEIYh/Dnwja2wppIyQq
 OJFdMZPmHrpkRGxdipOpP6dzkdijl9XGHJomY5I5ZgkuKxG75ZAcmJcUj
 nluKHH96jzoWDH0YgHXy5gHEXkloquygc80L1Q7HMByf9vZfKz55EDTy9
 C+b8jqtp2FJOCz7rQW2N9Uu30PWV9lGZuSR6W/5czWttvtDzZlk7wOgKK
 rgVdDaoVcEbaMvxDyT77uwUGNhoC2No7sm7JhdPJgwkpzN62hbr1F4Djo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069778"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481391"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481391"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 18/22] drm/xe/svm: Move a few structures to xe_gt.h
Date: Wed, 20 Dec 2023 23:38:08 -0500
Message-Id: <20231221043812.3783313-19-oak.zeng@intel.com>
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

Move access_type and pagefault struct to header file so it
can be shared with svm sub-system. This is preparation work
for enabling page fault for svm.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h           | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 21 ---------------------
 2 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4486e083f5ef..51dd288cf1cf 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,6 +17,26 @@
 			  xe_hw_engine_is_valid((hwe__)))
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+enum access_type {
+	ACCESS_TYPE_READ = 0,
+	ACCESS_TYPE_WRITE = 1,
+	ACCESS_TYPE_ATOMIC = 2,
+	ACCESS_TYPE_RESERVED = 3,
+};
+
+struct pagefault {
+	u64 page_addr;
+	u32 asid;
+	u16 pdata;
+	u8 vfid;
+	u8 access_type;
+	u8 fault_type;
+	u8 fault_level;
+	u8 engine_class;
+	u8 engine_instance;
+	u8 fault_unsuccessful;
+	bool trva_fault;
+};
 
 #ifdef CONFIG_FAULT_INJECTION
 #include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 4489aadc7a52..6de1ff195aaa 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,27 +23,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-struct pagefault {
-	u64 page_addr;
-	u32 asid;
-	u16 pdata;
-	u8 vfid;
-	u8 access_type;
-	u8 fault_type;
-	u8 fault_level;
-	u8 engine_class;
-	u8 engine_instance;
-	u8 fault_unsuccessful;
-	bool trva_fault;
-};
-
-enum access_type {
-	ACCESS_TYPE_READ = 0,
-	ACCESS_TYPE_WRITE = 1,
-	ACCESS_TYPE_ATOMIC = 2,
-	ACCESS_TYPE_RESERVED = 3,
-};
-
 enum fault_type {
 	NOT_PRESENT = 0,
 	WRITE_ACCESS_VIOLATION = 1,
-- 
2.26.3

