Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB79CD676
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 06:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1410E395;
	Fri, 15 Nov 2024 05:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XODZshFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F410E392;
 Fri, 15 Nov 2024 05:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731647373; x=1763183373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fYm9xN7kmZ2yLSGE6Lfl00Iucn/UE7iDcKr64hDvRQI=;
 b=XODZshFxmH8dyroqAjoEmYdJdXf2vdTZa3xTu2k8NnI2whSM4khgAsZb
 yDfA8+L66vCSrPAW1mcYOo8QDvUz3GV9ZRBj8C206VZdvs284AyC7LbMQ
 iooStHlscxao5EDRh9KaKhLFBNonqcB4No5fQS72qdDtyyOkVyWHu4HqO
 SF4rsBCgJqZgLUpMQuLLU87zFL2EYwRt6b09eUUmhQfO5CudCUfDjao9O
 R7ygl8LY0viX7PAqMRfcGGjJhkpvPdBXcrKbn6FYSFSdivC57jfN650tc
 UIc0Px28W8Nh4wQ2tddQdK6aJI3JYRbLK+nI8lrX4B6mqN3s+pO7/RyVj g==;
X-CSE-ConnectionGUID: 300BFmgwQIa49jURua5bYQ==
X-CSE-MsgGUID: XCaNpYXASluOhgfHJYTJ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31023943"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31023943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 21:09:33 -0800
X-CSE-ConnectionGUID: ldAFOMI7Sd692FwYO++jKg==
X-CSE-MsgGUID: Qu7Mel6hT765UCaNudSjuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="92493563"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2024 21:09:27 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 3/4] drm/xe: Use device wedged event
Date: Fri, 15 Nov 2024 10:37:32 +0530
Message-Id: <20241115050733.806934-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115050733.806934-1-raag.jadav@intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
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

This was previously attempted as xe specific reset uevent but dropped
in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
as part of refactoring.

Now that we have device wedged event provided by DRM core, make use
of it and support both driver rebind and bus-reset based recovery.
With this in place userspace will be notified of wedged device, on
the basis of which, userspace may take respective action to recover
the device.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=rebind,bus-reset
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5208
MAJOR=226
MINOR=0

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)
v3: Generic re-implementation in DRM subsystem (Lucas)
v4: Change authorship to Raag (Aravind)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..5878b331e35c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -989,11 +989,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a mudule
+ * This is a final state that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
+ * failure or guc loading failure. Userspace will be notified of this state
+ * by a DRM uevent.
  * If xe.wedged module parameter is set to 2, this function will be called
  * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
  * snapshot capture. In this mode, GT reset won't be attempted so the state of
@@ -1023,6 +1024,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+
+		/* Notify userspace of wedged device */
+		drm_dev_wedged_event(&xe->drm,
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1

