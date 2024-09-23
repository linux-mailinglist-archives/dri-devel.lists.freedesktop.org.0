Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01797E52F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 05:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA310E371;
	Mon, 23 Sep 2024 03:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPW7mqAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1606C10E36E;
 Mon, 23 Sep 2024 03:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063986; x=1758599986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q5U9v1JUywxsBmUJ9c9VCNOOFna6CAS58ufXIazjDPw=;
 b=bPW7mqAOXpXLzbMHBDMS1J0McVRlrV1cZLoYe35RVzKf/91lU9MI2sjC
 hIGxXb1+DKzf7F/PvDDHEeDFbZlr3Y0Y3R3UZvesicm6NYcoZLy+jbnSY
 PXcibpb5SH7aoterkxH/7RJTC8rzQ6TCzQVF2kCgYYyGJnYF+HFfazWr4
 dNSmC/F/Ow5A5jQp2wV+jAU5JgbNRERtcLaiWquK4paal5/LUZsr70g2S
 Y9txIBd61rOi2CIMoPU23Q6jGTwuBm7ia9SUVfrvP6/zbbc6JiNBeFTZp
 FICMR2J/n39SHyJoWhNV1LagMdzyI/z7j8pl7+6I+gYQi6mH18ExUftPU Q==;
X-CSE-ConnectionGUID: OU4N/J7QTZK4WaRZ2tRHvA==
X-CSE-MsgGUID: x41mtKKGT7qUkgNpFFAh8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29718252"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="29718252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:59:45 -0700
X-CSE-ConnectionGUID: G7eSwJ7FSC6VDiF4IQ4ZrA==
X-CSE-MsgGUID: l/iedVPmTFuIw83u7C70LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="101667480"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa002.jf.intel.com with ESMTP; 22 Sep 2024 20:59:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 3/4] drm/xe: Use device wedged event
Date: Mon, 23 Sep 2024 09:28:25 +0530
Message-Id: <20240923035826.624196-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035826.624196-1-raag.jadav@intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
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

KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=bus-reset
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
 drivers/gpu/drm/xe/xe_device.c | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_device.h |  1 +
 drivers/gpu/drm/xe/xe_pci.c    |  2 ++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cb5a9fd820cf..8edafea18f45 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -783,6 +783,15 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
+void xe_setup_wedge_recovery(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+
+	/* Support both driver rebind and bus reset based recovery. */
+	set_bit(DRM_WEDGE_RECOVERY_REBIND, &dev->wedge_recovery);
+	set_bit(DRM_WEDGE_RECOVERY_BUS_RESET, &dev->wedge_recovery);
+}
+
 static void xe_device_remove_display(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -989,11 +998,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -1023,6 +1033,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+
+		/* Notify userspace of wedged device */
+		drm_dev_wedged_event(&xe->drm, DRM_WEDGE_RECOVERY_BUS_RESET);
 	}
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 4c3f0ebe78a9..ca4b3935a982 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -186,6 +186,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+void xe_setup_wedge_recovery(struct xe_device *xe);
 void xe_device_declare_wedged(struct xe_device *xe);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index edaeefd2d648..e7a1d59c40a9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -860,6 +860,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_driver_cleanup;
 
+	xe_setup_wedge_recovery(xe);
+
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
-- 
2.34.1

