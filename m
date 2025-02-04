Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27CA26C72
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F89510E252;
	Tue,  4 Feb 2025 07:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcY+sLYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CCF10E26C;
 Tue,  4 Feb 2025 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652785; x=1770188785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wO9TKu8D2iXvUCit+pTwVB6ZXn0YQ/bd5JAbWiKqEqQ=;
 b=dcY+sLYqaIIb3Gz2k1rV9CMznBT2bU0HyGAa9wXOZofPLP1pmSo+fx7v
 YXxvuKaFTKwBmsAXzgGxYUORiMydkxcFJYS0M4c5bOYkl/BgfHppBLSJG
 djIMXdqgRt+Oz9T7zGmB4KdYA982sJtMmj9JdsYsHlfxTSGzPpi2fCyqF
 jlnpuv+9mikmq8vnVS82ZRgjCwWd8docZY90OHRUg+bhp/93/lrr6oAFp
 jvEpJYfHTBq4J3mzuvuu+onNwH6+evkoJLSmPb9+V2RazVgTOeNqHqkSa
 wrIE/+ObfuTPcZvtD9GU5pOkaUt9sAPVBlSQFvvpCe2bIP1Wm2KhHmVA4 w==;
X-CSE-ConnectionGUID: Fbi7hwvFSn+VQDGiR1pSOg==
X-CSE-MsgGUID: yI116EVQRtewA79jqhEegw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39196877"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39196877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:06:25 -0800
X-CSE-ConnectionGUID: Ye7UA0FPQkqiGF4RymAd0Q==
X-CSE-MsgGUID: wLYwocQETYGrUehIV5IuhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110974819"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 23:06:18 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 3/5] drm/xe: Use device wedged event
Date: Tue,  4 Feb 2025 12:35:26 +0530
Message-Id: <20250204070528.1919158-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
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
v3: Generic implementation in DRM subsystem (Lucas)
v4: Change authorship to Raag (Aravind)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f30f8f668dee..1cacefcb5afe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1120,7 +1120,8 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
+ * failure or guc loading failure. Userspace will be notified of this state
+ * through device wedged uevent.
  * If xe.wedged module parameter is set to 2, this function will be called
  * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
  * snapshot capture. In this mode, GT reset won't be attempted so the state of
@@ -1150,6 +1151,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

