Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B740A224BA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEEF10E89F;
	Wed, 29 Jan 2025 19:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVMD6qJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277D510E891;
 Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180284; x=1769716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nciPxFvstE0jnIfkv9sxAaPixL57x1YqKHRhjscrXiM=;
 b=dVMD6qJvclgYGTdaENWkOvldfRaHEf6XlDzcDTbQ8sq0jqsn25ZDy5Lu
 8lgom2IGu5w8XwdIHQu8ylJdM6RGlAvSSibOw5ImT07WPLrR8/pqEfwgs
 HUkKUUy8AAXDEuibB3yNVIJRxeCQvFZuUkJaz8xJez4OnRYi9D0z4k3+W
 oWPQH90h2Ho4jr6l+yVGsVnzLsWLna9cX9DNGw+oAueiPSKgOu5b0cLWs
 NstDG61jG0XKWyA9nHwBZllZjVn0u3rj6DAi9jm9YnhOkHgjzNPsHMGmJ
 yfCAC+qnintNjb8BN7PcUY22S/G0VJVqpE0hquoRw14fdgDylocJDzqtJ g==;
X-CSE-ConnectionGUID: seAtHXHmSS6cJ4D1EZyD5A==
X-CSE-MsgGUID: 3KviBirDQRGHeMYgntigfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132817"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
X-CSE-ConnectionGUID: hjreNarNSCiyobS2tjT+hA==
X-CSE-MsgGUID: 8C9gnYKVSNeeJUETx7ACrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392160"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 18/33] drm/xe: Enable CPU address mirror uAPI
Date: Wed, 29 Jan 2025 11:51:57 -0800
Message-Id: <20250129195212.745731-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Support for CPU address mirror bindings in SRAM fully in place, enable the
implementation.

v3:
 - s/system allocator/CPU address mirror (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c  |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 56ece53b2069..ee150139470f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -429,6 +429,16 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return err;
 }
 
+/**
+ * xe_svm_has_mapping() - SVM has mappings
+ * @vm: The VM.
+ * @start: Start address.
+ * @end: End address.
+ *
+ * Check if an address range has SVM mappings.
+ *
+ * Return: True is address range has a SVM mapping, False otherwise
+ */
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
 {
 	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d8c78ecd54ec..3ac03e0dc41b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3020,12 +3020,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling CPU address mirror for now */
-		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 !xe_vm_in_fault_mode(vm))) {
 			err = -EINVAL;
-- 
2.34.1

