Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA88A97329
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3E810E602;
	Tue, 22 Apr 2025 16:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaukckeW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2CE10E5E8;
 Tue, 22 Apr 2025 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745340965; x=1776876965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LnyII8Aw95sbsAFlLw5SExL7JirdjFdF+m1oCMg1B/Q=;
 b=AaukckeWqmqkxKuQNq4J0dvP7Eyi6VcjRb6LGxcVJLPBQLvV1l4kFI95
 zaAdd/CVFR5VDdO6z+hYt9TNcAJhvAr1VKd1eSK1fjkE0M/KantU192di
 Y6cVb+t9hTwfuk/E1Im2AW04D81kYAQO8X/COkmGitjXPWy060LAYmoa0
 PmUjeIp5viylu1XtUId45avV+XMS8/i8iqGUpC+QE4xUA5qwXjf1GX0KF
 /VHycVq2SDBkISDzh8qt3jGmiZykoWxfl8vGdwQESR77SJM35ejTDN0bk
 oPCi6ToU/sMUqt1V73h2wRJBKIuUjcSd7LDjghOtQcR8rS1DEy/kHTkmt A==;
X-CSE-ConnectionGUID: sJEdrtgjTISvpwvdFKCJRw==
X-CSE-MsgGUID: YZCr7fRuRxWCZyt6H4M/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46613169"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46613169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:05 -0700
X-CSE-ConnectionGUID: 8E5dtAyDRWuwmyrQ8qKT/g==
X-CSE-MsgGUID: py1ssNBkQ5G/I1oKlKtZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136855405"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 3/5] drm/gpusvm: Add timeslicing support to GPU SVM
Date: Tue, 22 Apr 2025 09:57:21 -0700
Message-Id: <20250422165723.584286-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422165723.584286-1-matthew.brost@intel.com>
References: <20250422165723.584286-1-matthew.brost@intel.com>
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

Add timeslicing support to GPU SVM which will guarantee the GPU a
minimum execution time on piece of physical memory before migration back
to CPU. Intended to implement strict migration policies which require
memory to be in a certain placement for correct execution.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
 include/drm/drm_gpusvm.h     | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index edf107809d20..40a56f38ff8e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1770,6 +1770,8 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
 		goto err_finalize;
 
 	/* Upon success bind devmem allocation to range and zdd */
+	devmem_allocation->timeslice_expiration = get_jiffies_64() +
+		msecs_to_jiffies(ctx->timeslice_ms);
 	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
 
 err_finalize:
@@ -1990,6 +1992,13 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
+	if (page) {
+		zdd = page->zone_device_data;
+		if (time_before64(get_jiffies_64(),
+				  zdd->devmem_allocation->timeslice_expiration))
+			return 0;
+	}
+
 	start = ALIGN_DOWN(fault_addr, size);
 	end = ALIGN(fault_addr + 1, size);
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 9fd25fc880a4..cce217bc136f 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -89,6 +89,7 @@ struct drm_gpusvm_devmem_ops {
  * @ops: Pointer to the operations structure for GPU SVM device memory
  * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
  * @size: Size of device memory allocation
+ * @timeslice_expiration: Timeslice expiration in jiffies
  */
 struct drm_gpusvm_devmem {
 	struct device *dev;
@@ -97,6 +98,7 @@ struct drm_gpusvm_devmem {
 	const struct drm_gpusvm_devmem_ops *ops;
 	struct drm_pagemap *dpagemap;
 	size_t size;
+	u64 timeslice_expiration;
 };
 
 /**
@@ -283,6 +285,8 @@ struct drm_gpusvm {
  * @check_pages_threshold: Check CPU pages for present if chunk is less than or
  *                         equal to threshold. If not present, reduce chunk
  *                         size.
+ * @timeslice_ms: The timeslice MS which in minimum time a piece of memory
+ *		  remains with either exclusive GPU or CPU access.
  * @in_notifier: entering from a MMU notifier
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
@@ -292,6 +296,7 @@ struct drm_gpusvm {
  */
 struct drm_gpusvm_ctx {
 	unsigned long check_pages_threshold;
+	unsigned long timeslice_ms;
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
-- 
2.34.1

