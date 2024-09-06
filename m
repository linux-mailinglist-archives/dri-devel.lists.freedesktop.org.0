Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2BC96EFD9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E362610E9D7;
	Fri,  6 Sep 2024 09:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/a3Z1q2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0294E10E9D6;
 Fri,  6 Sep 2024 09:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725615788; x=1757151788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZoDYzFYkCfOvNoivmgreA9sJeEKgLI2XYiUtKHwuF8Y=;
 b=e/a3Z1q233iaeBzCiu8105AdmpREcWq3UzZJLcdBDvKkj10cmmGDBC+L
 Gn+dZ7IfPJXtACqGX7kcKiNa5jeUZe+Hag22oc3RTfasOcJPbInQdhzsd
 0KeJvDx4q4P9GGbxTcSzlt1CwHYThX0vw94iVyVySg1yQI/s/dCyZb5tk
 esuNp7fNSle59P6SlNszGNTzijhDvELSC2n7eoZ5x/t7tKr1U2S2tBRG7
 0uwJ6itMzWjp3Tglg7sbfNLAC8lHgGLKT9d/LbsiQgy/whf0hnsUkM12N
 83hcdVWd3yq+ac3yuzjQKaMwcIGbEd8/ysJCIB/Bm+T7w9bfowaXTUxOw g==;
X-CSE-ConnectionGUID: qq7LqNXuTnKVfb9qN5H7xw==
X-CSE-MsgGUID: +ngLrX0OQoew8NOlMUtpcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34965500"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="34965500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:43:07 -0700
X-CSE-ConnectionGUID: bGk0hAUSQLetFQeYUsNvVQ==
X-CSE-MsgGUID: me5WrnfzR0WZpb9jHphpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="103377576"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa001.jf.intel.com with ESMTP; 06 Sep 2024 02:43:02 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 2/3] drm/xe: Use device wedged event
Date: Fri,  6 Sep 2024 15:12:24 +0530
Message-Id: <20240906094225.3082162-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906094225.3082162-1-raag.jadav@intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
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

Now that we have device wedged event supported by DRM core, make use
of it. With this in place userspace will be notified of wedged device,
on the basis of which, userspace may take respective action to recover
the device.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[307.420340] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=1
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5106
MAJOR=226
MINOR=0

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)
v3: Generic re-implementation in DRM subsystem (Lucas)
v4: Change authorship to Raag (Aravind)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b..58d571967f83 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -959,11 +959,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -993,6 +994,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+
+		/* Notify userspace of wedged device */
+		drm_dev_wedged_event(&xe->drm);
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1

