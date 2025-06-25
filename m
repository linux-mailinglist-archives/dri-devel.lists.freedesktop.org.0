Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D0AE8AD3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFA010E7AA;
	Wed, 25 Jun 2025 16:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewEYtxLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4510E7A7;
 Wed, 25 Jun 2025 16:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750870617; x=1782406617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E72XAmwLEXP/cIfDQ5XSxKLgy7353qIEmfUuR7ydBVY=;
 b=ewEYtxLUFy2VK8NYZEAu2K7vr6o7uWUbqKHRYH8jPvfNuBEzQyxPVHmd
 tEHMFj7lvcV5CyDRcZZc4T1t/4brPlpGiGWY0AJqbx6FwXT/hsOFj+5r6
 s58sH9P2vPVbQNAnffmoraZjvuq8t2KprdTrMNbKMwSW9CBDeKFUWqSd4
 QgFsHbd8MuISR4Ylip2t6HlO7bNutzGyTkNXMNRYfU8vSWLqsJpKRHYzg
 /PuW4tfpE9lTgmHy0xAxrn7klrANIr+YSZGNWqwpO5aNnV1uVN2c/cipW
 bw085evX9gHs2rYjBh/jsTTb3l15o24Xl8/n2Q0B7c6UxUfORs/NMaDUa g==;
X-CSE-ConnectionGUID: 3Y6AGoFjRmGaCai5Imt7Eg==
X-CSE-MsgGUID: gOFvFwXvS1yqvTmkY4eTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53214455"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53214455"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 09:56:56 -0700
X-CSE-ConnectionGUID: 3uBLudaDRKmk2vQH8jnnpw==
X-CSE-MsgGUID: VC4Q+YAtSg+EZyqY7EcukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151696699"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:56:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v4 06/10] drm/xe/xe_late_bind_fw: Reload late binding fw in
 rpm resume
Date: Wed, 25 Jun 2025 22:30:11 +0530
Message-Id: <20250625170015.33912-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625170015.33912-1-badal.nilawar@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
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

v2: Flush worker during runtime suspend

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c           | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 52243063d98a..737780336000 100644
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
index ff749edc005b..91923fd4af80 100644
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
@@ -460,6 +461,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -550,6 +553,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.34.1

