Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31209AFBB83
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1410E554;
	Mon,  7 Jul 2025 19:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFfnV9Ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E7810E546;
 Mon,  7 Jul 2025 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751915314; x=1783451314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+AIr79H684tpFcfHu4CEdKxm2WsQCW5SxNyLqwnGP6g=;
 b=oFfnV9KeE3tbLGx1cRssknveiZx32RPdsykI6X2HYLILqA6wBEI8cyVR
 eV8GYQyJAwEPjO+uKnyMDc0S+GE1u9xql/KAXu1l2kq+K2idMBSneAv9t
 NhSknZCfju2fHHC9dVu1rXQSU8dyekKIfZTjBbH4AoQMiaIqNbvGNE96f
 NVXnFWKhIXGsNRRZBOUsV8yXeuHlI3c5kDuBwq8eOehneU6i5/4+ac3ck
 ZzWIxkDojR6AwsyyQ5xhNq4IGL3pMgn0wE1IjLyoxp1lcLIyKBI1tVuav
 xLpcAvO7DlppjVv7cDcqULwzPP5ESgKuFoiy/1oTPjHEGJyFeJA1RfQ4b Q==;
X-CSE-ConnectionGUID: SXeeAYwrQheTHZL9bIOzXg==
X-CSE-MsgGUID: IFpJm3SsRTqZwLau3Mp1zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57945683"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57945683"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 12:08:33 -0700
X-CSE-ConnectionGUID: eCrHPqIWQryHHi3MDL1g4Q==
X-CSE-MsgGUID: QrCjeT3tTT6eU0N+wMhdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154707517"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 12:08:30 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v7 6/9] drm/xe/xe_late_bind_fw: Reload late binding fw in rpm
 resume
Date: Tue,  8 Jul 2025 00:42:34 +0530
Message-Id: <20250707191237.1782824-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707191237.1782824-1-badal.nilawar@intel.com>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
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

Reload late binding fw during runtime resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c           | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 9804508ee90d..54ba0b57185b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -82,7 +82,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
-static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 28d56ed2bfdc..07e437390539 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -12,5 +12,6 @@ struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..734fe259600e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_trace.h"
@@ -550,6 +551,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

