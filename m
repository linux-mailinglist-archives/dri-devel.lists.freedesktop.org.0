Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFB96C4BE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377410E80D;
	Wed,  4 Sep 2024 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLC3zidp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246A10E7AA;
 Wed,  4 Sep 2024 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725469444; x=1757005444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9qrPMqk3cQ13L61pb7DTfiRZK2thR8wlUG8WTxZuDLg=;
 b=BLC3zidpaN5OHMMF68edfVCL1Vd6IOh3hUvws9b2FBzrE7nK8A8GTS4K
 M24WPUdIQ95y9ldtRkJdVEuE43b8hNpLj5ts86rvvGDymoX71mgBchPVx
 ZjAAsPIqY3PFXqfHdlKSxPEMU00jBm1K9JmiDX2//Y3rVmZi/JWR1LpV5
 C5WbylBPMLgn+7kQBWiGjDVlwmOb9XySjk2L14Qm4AsMIMyOJgl4SwtJJ
 MmTzvn1SfNcGgWExehPvLpmi0IQpTf8DY3X+JpguP4p0YwBqLoY+OpY4Q
 XzJaqQNE3GxRmOdlZZsMSTdrZc+1TM76zg2wz56R2nRz56lOCPdIvRUho g==;
X-CSE-ConnectionGUID: un1W2DCcQTiuabYfVmFE1g==
X-CSE-MsgGUID: QuBecWYmQLWDzLgZZzTXvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27067471"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="27067471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:02 -0700
X-CSE-ConnectionGUID: gzmVvd1kShuZdTkdlJi09g==
X-CSE-MsgGUID: 98sVJKw8TIyAuFQXdqOZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="70151018"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:04:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, boris.brezillon@collabora.com,
 lionel.g.landwerlin@intel.com, kenneth.w.graunke@intel.com
Subject: [PATCH 1/2] drm/xe: Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Date: Wed,  4 Sep 2024 10:04:59 -0700
Message-Id: <20240904170500.3303081-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904170500.3303081-1-matthew.brost@intel.com>
References: <20240904170500.3303081-1-matthew.brost@intel.com>
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

Add DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP which will install exec IOCTL
fence into external BO's dma-resv bookkeep slot rather than write slot.
A bit of confusion of the usage of the dma-buf sync uAPI lead to using
the write slot. With a proper user space the bookkeep slot is
sufficient as user space will install read / write dependencies. Flags
is added to not break old user spaces.

Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e..54ec1cbce895 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -849,6 +849,11 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP - Insert exec IOCTL fences into
+ *    external BO's bookkeep slots rather than write slots. A bit of confusion
+ *    the dma-buf sync uAPI lead using the write slots but with a proper user
+ *    space implementation only bookkeep is required as user space will install
+ *    read / write dependecies. Flag added as an opt in to correct usage model.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -857,6 +862,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.34.1

