Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FAA43453
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEEF10E577;
	Tue, 25 Feb 2025 04:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDX0YO6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846E810E4A1;
 Tue, 25 Feb 2025 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458535; x=1771994535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mzomJ9BJ8Mdv0tNYnIghG4EHsOIsMlVoZGx9nCaoEIg=;
 b=JDX0YO6ItPf36ZJbcBCujqkLYdwu6VGpyd59YxGGvCoQa+SaJxehBZxj
 TlFMJSBCn0lWI58fz1mGvkqzJkVJYl/q+OPWwknWoOqx7BTpddED/oRk7
 UeFyTxMrZaxe4aDu8Z4gXH7bB4P4CHcC2Mvo4s/qUyyN5QHMRNYdlAEPe
 liOLz0JdhYtntumKXas98sGEWcOxRiCGurP/aquVqK5Pkp8DfNWpEKvHK
 yioDhimCeFHpmSl2L/hWv6/vPU8nKBhlFLvUQQlQXis4uP2daT41Wh1ue
 HR4emRbYf823wfioWL4TqtrW5ZnevCB/jtsdK8PgRLhh5Vd1LYSvo+lAZ g==;
X-CSE-ConnectionGUID: b/z7HIWES260y8WWptkH3g==
X-CSE-MsgGUID: 20rJ8M/fRwmoAatCV06+VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885036"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:14 -0800
X-CSE-ConnectionGUID: mN+75kXiRc+4P9D6U+oN1Q==
X-CSE-MsgGUID: bAJewMcSSvKgFd5MHav+dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290311"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 22/32] drm/xe: Add drm_gpusvm_devmem to xe_bo
Date: Mon, 24 Feb 2025 20:43:01 -0800
Message-Id: <20250225044311.3178695-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 60c522866500..15a92e3d4898 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 
+#include <drm/drm_gpusvm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -80,6 +81,9 @@ struct xe_bo {
 	 */
 	u16 cpu_caching;
 
+	/** @devmem_allocation: SVM device memory allocation */
+	struct drm_gpusvm_devmem devmem_allocation;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
-- 
2.34.1

