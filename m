Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BAA53FD8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1510E8B4;
	Thu,  6 Mar 2025 01:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+JRm59+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C6310E894;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N4qBeHBx6nSs9nyK3doWFDFzaFCC3fEzzUBvwL+2C2o=;
 b=F+JRm59+mVHRnUeKuhZeJU+A88Ncguxj1qB5kduHxSD+JqERcsnKl4XR
 92Te+nRREbNnN5v283IwqDO2NICbWrD2HwTxe8Cp1GsqtHCs4YgZeldwQ
 yriCJ2y9OpYSYdbwHDISHy/sfINE2TnMT10aPjnooZq0dSXrBwopHxyml
 h8OIp6ZbbFy+k8VWvXFsJWemz780KEiBQTY1gjtR7XDoEPd0BjJrY+jfx
 2fPVhgtMf0a7fBz/l4COOxj+bQVTnRXp40lj1TEr0olyD4nbBJIvDJeLd
 YGAqBjSWys7WaFqLsU5E+URUMAUPqKMagZ2dj/2SRCDGh002mJ+7e1BxR w==;
X-CSE-ConnectionGUID: RySUQUMSQI+xI20LDvHIEg==
X-CSE-MsgGUID: 6V4WnfwCSiueeSNYc4UGKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427377"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427377"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: zyNLQg87QzifoEy+n7US7w==
X-CSE-MsgGUID: SRSCcXcjTMqlnGeE1zVyAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063287"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 18/32] drm/xe: Enable CPU address mirror uAPI
Date: Wed,  5 Mar 2025 17:26:43 -0800
Message-Id: <20250306012657.3505757-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
v7:
 - Only enable uAPI if selected by GPU SVM (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80b57d7a3f4c..0586ddb82e1e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3109,14 +3109,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling CPU address mirror for now */
-		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
-				 !xe_vm_in_fault_mode(vm))) {
+				 (!xe_vm_in_fault_mode(vm) ||
+				 !IS_ENABLED(CONFIG_DRM_GPUSVM)))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
-- 
2.34.1

