Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E54989BB9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFA210E3B1;
	Mon, 30 Sep 2024 07:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsaU5xH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66210E3B0;
 Mon, 30 Sep 2024 07:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681994; x=1759217994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IbBxaLr90y+i/HUYv7f8Dy2FQ8ilzw0hvAzy09Og+vk=;
 b=LsaU5xH2E/kQa1XteidqE2bgC9IRcZsU+ofN6XrFy2bVGpPuWFfMr8yZ
 w6e33shz/StEwjamNSASrtgsZSnfzSuh7/vB9NmYAV5ed5qL+UiYc+unG
 mcGzsBzMbX8n09D+q+tK7WfAEwOf5EZxgfNohhxuUOUBbfE8zvtWKXW4O
 P9heLwXmhCHYKq67PvEgMqT/BJPxfpzrrWvo3YmMYysNZF+Zj9NNfWVpv
 gBfVadAbPcmymp4jqK6hq0g+1S2N0FeV0wT16+Q2U/ld1FCDdvTkU6i7W
 venk/xOBiRZIZ7zcqatRnMqLWXt/Jvqsoeu5JCyeXiMBiELz5OWOn9/YV Q==;
X-CSE-ConnectionGUID: HcCOipYjSkieeHP/1yVgjg==
X-CSE-MsgGUID: NVTXffNiQiaeCjOHBTjIIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315507"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:54 -0700
X-CSE-ConnectionGUID: kRb58UdsSBKgiljshzycVw==
X-CSE-MsgGUID: iWUYq9N1TCqhdePt1C5Drw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797465"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:47 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 4/5] drm/xe: Use device wedged event
Date: Mon, 30 Sep 2024 13:08:44 +0530
Message-Id: <20240930073845.347326-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930073845.347326-1-raag.jadav@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
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
index 8e9b551c7033..bbf2052a91ba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -785,6 +785,15 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
+void xe_setup_wedge_recovery(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+
+	/* Support both driver rebind and bus-reset based recovery. */
+	set_bit(DRM_WEDGE_RECOVERY_REBIND, &dev->wedge_recovery);
+	set_bit(DRM_WEDGE_RECOVERY_BUS_RESET, &dev->wedge_recovery);
+}
+
 static void xe_device_remove_display(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -991,11 +1000,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -1025,6 +1035,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

