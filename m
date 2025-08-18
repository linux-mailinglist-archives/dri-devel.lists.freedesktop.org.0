Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196EDB2B36C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D31A10E4E8;
	Mon, 18 Aug 2025 21:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NtDIIjNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF32810E4DB;
 Mon, 18 Aug 2025 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552679; x=1787088679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gh6pYXa3kQHrr0HDCd8d2s80l1fKF2XaDZvZsG52G9g=;
 b=NtDIIjNWsbOPDnOcDDP/9Of6AtZiNiIl74DlX8+tJOCTN8QRgOHCgcRu
 HmM+/QLJy6XS1lr0HsHMg8zxr8ljYVDRCoN5fQQGLC0EmFEn5kfXfL6AF
 /YenP0SNkpJd+oR2bgmxTB7zOlD5g97qcLvkMZxMeHVaDdU+07xV6n9iz
 H/ltGmId8KCVG1cWvgvCkxqq37y0Zjry4B5sXiJm7wTDX7XbDpjfosEsu
 aBDRoaeXjDjqqc/PMoTk1OUIlZDE+iQu16rHvU0XnLM2bmNmlh8vyQewq
 4Xk32S3JmH/rvOEqpMRknI4WJhZ6eFMQ7uRPymqkl+r0y1LHof3CAmzpQ g==;
X-CSE-ConnectionGUID: kTrbb/mVQXqH80J5IK5VFA==
X-CSE-MsgGUID: FHQOxsN0QeO7f2gHwE9XuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815245"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:09 -0700
X-CSE-ConnectionGUID: S9Cz1R/kSp2sEpKMVatdzQ==
X-CSE-MsgGUID: /VwoF5K3TseNh3ffrp201A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186316"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 15/24] drm/xe/svm: Support DRM_XE_SVM_MEM_RANGE_ATTR_PAT
 memory attribute
Date: Tue, 19 Aug 2025 03:27:44 +0530
Message-Id: <20250818215753.2762426-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

This attributes sets the pat_index for the svm used vma range, which is
utilized to ascertain the coherence.

v2 (Matthew Brost)
- Pat index sanity check

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b5fc1eedf095..3bd52063f9c2 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -9,6 +9,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
 
@@ -121,7 +122,12 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			      struct xe_vma **vmas, int num_vmas,
 			      struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.pat_index = op->pat_index.val;
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -229,8 +235,22 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
-		/*TODO: Add valid pat check */
+	{
+		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+
+		if (XE_IOCTL_DBG(xe, !coh_mode))
+			return false;
+
+		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->pat_index.reserved))
+			return false;
 		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
-- 
2.34.1

