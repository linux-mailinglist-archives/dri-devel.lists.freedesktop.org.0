Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE665A1B01C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291DB10E8EF;
	Fri, 24 Jan 2025 05:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDLfQ/eU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AE210E8D7;
 Fri, 24 Jan 2025 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697989; x=1769233989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7JPZHErb037P8diDnbq60ja1hU2E+ED7lhCmk8dom20=;
 b=kDLfQ/eUUDyGREH5prZGQ/eSM96YfBJDB5tGOwkVFyzGrNcFvxDcVspF
 keYkzby237l4BO0ApLRIOl80AjhZ/40H+eLu+ZAZ48uxSeZV0/bkbO4CC
 3/vpUtzmI3aJLuYS71QSOkST7+/+lSwZdnyL+X7OIQS6pMG+mBtk0tqJk
 RykLpxmAa7QpNKPkQ793JyrdLeDWKsE6UocDmer298MwxYekY758cQODu
 tiRjaVvZ1wlswlgkuUuSmAaYW2L+vfRTbnwasljZv2dEjgZgmuvfwy0Et
 DReM/etGAktQH7ERW7USYJ4RUdHTFLwMua5VxTqeJzHLBKV6PWSYVBH8i Q==;
X-CSE-ConnectionGUID: zDxIpDkGTjSMSeEaxCAljg==
X-CSE-MsgGUID: 96FwBSk8ReGu6GCGId+xgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="60689159"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="60689159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:53:09 -0800
X-CSE-ConnectionGUID: AbxtkKzTTIeouzndK1NebQ==
X-CSE-MsgGUID: qAbh79roQJWHLikE1KOEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108218702"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 21:53:03 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, xaver.hugl@kde.org
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 lina@asahilina.net, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 2/5] drm/doc: Document device wedged event
Date: Fri, 24 Jan 2025 11:22:57 +0530
Message-Id: <20250124055300.1111274-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
References: <20250124055300.1111274-1-raag.jadav@intel.com>
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

Add documentation for device wedged event in a new 'Device wedging'
chapter. The describes basic definitions, prerequisites and consumer
expectations along with an example.

 v8: Improve documentation (Christian, Rodrigo)
 v9: Add prerequisites section (Christian)
v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)
v11: Reference wedged event in device reset section (André)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 112 ++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index b75cc9a70d1f..b1f9e213d71c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -371,9 +371,115 @@ Reporting causes of resets
 
 Apart from propagating the reset through the stack so apps can recover, it's
 really useful for driver developers to learn more about what caused the reset in
-the first place. DRM devices should make use of devcoredump to store relevant
-information about the reset, so this information can be added to user bug
-reports.
+the first place. For this, drivers can make use of devcoredump to store relevant
+information about the reset and send device wedged event with ``none`` recovery
+method (as explained in "Device Wedging" chapter) to notify userspace, so this
+information can be collected and added to user bug reports.
+
+Device wedging
+==============
+
+Drivers can optionally make use of device wedged event (implemented as
+drm_dev_wedged_event() in DRM subsystem), which notifies userspace of 'wedged'
+(hanged/unusable) state of the DRM device through a uevent. This is useful
+especially in cases where the device is no longer operating as expected and
+has become unrecoverable from driver context. Purpose of this implementation
+is to provide drivers a generic way to recover with the help of userspace
+intervention without taking any drastic measures in the driver.
+
+A 'wedged' device is basically a dead device that needs attention. The
+uevent is the notification that is sent to userspace along with a hint about
+what could possibly be attempted to recover the device and bring it back to
+usable state. Different drivers may have different ideas of a 'wedged' device
+depending on their hardware implementation, and hence the vendor agnostic
+nature of the event. It is up to the drivers to decide when they see the need
+for device recovery and how they want to recover from the available methods.
+
+Driver prerequisites
+--------------------
+
+The driver, before opting for recovery, needs to make sure that the 'wedged'
+device doesn't harm the system as a whole by taking care of the prerequisites.
+Necessary actions must include disabling DMA to system memory as well as any
+communication channels with other devices. Further, the driver must ensure
+that all dma_fences are signalled and any device state that the core kernel
+might depend on is cleaned up. Any existing mmap should be invalidated and
+page faults should be redirected to a dummy page. Once the event is sent, the
+device must be kept in 'wedged' state until the recovery is performed. New
+accesses to the device (IOCTLs) should be blocked, preferably with an error
+code that resembles the type of failure the device has encountered. This will
+signify the reason for wedging, which can be reported to the application if
+needed.
+
+Recovery
+--------
+
+Current implementation defines three recovery methods, out of which, drivers
+can use any one, multiple or none. Method(s) of choice will be sent in the
+uevent environment as ``WEDGED=<method1>[,<method2>]`` in order of less to
+more side-effects. If driver is unsure about recovery or method is unknown
+(like soft/hard reboot, firmware flashing, hardware replacement or any other
+procedure which can't be attempted on the fly), ``WEDGED=unknown`` will be
+sent instead.
+
+Userspace consumers can parse this event and attempt recovery as per the
+following expectations.
+
+    =============== ================================
+    Recovery method Consumer expectations
+    =============== ================================
+    none            optional telemetry collection
+    rebind          unbind + bind driver
+    bus-reset       unbind + reset bus device + bind
+    unknown         admin/user policy
+    =============== ================================
+
+The only exception to this is ``WEDGED=none``, which signifies that the
+device was temporarily 'wedged' at some point but was able to recover using
+device specific methods like reset. No explicit device recovery is expected
+from the consumer in this case, but it can still take additional steps like
+gathering telemetry information (devcoredump, syslog). This is useful
+because the first hang is usually the most critical one which can result in
+consequential hangs or complete wedging.
+
+Consumer prerequisites
+----------------------
+
+It is the responsibility of the consumer to make sure that the device or
+its resources are not in use by any process before attempting recovery.
+With IOCTLs blocked and device already 'wedged', all device memory should
+be unmapped and file descriptors should be closed to prevent leaks or
+undefined behavior.
+
+Example
+-------
+
+Udev rule::
+
+    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
+    RUN+="/path/to/rebind.sh $env{DEVPATH}"
+
+Recovery script::
+
+    #!/bin/sh
+
+    DEVPATH=$(readlink -f /sys/$1/device)
+    DEVICE=$(basename $DEVPATH)
+    DRIVER=$(readlink -f $DEVPATH/driver)
+
+    echo -n $DEVICE > $DRIVER/unbind
+    echo -n $DEVICE > $DRIVER/bind
+
+Customization
+-------------
+
+Although basic recovery is possible with a simple script, admin/users can
+define custom policies around recovery action. For example, if the driver
+supports multiple recovery methods, consumers can opt for the suitable one
+based on policy definition. Consumers can also choose to have the device
+available for debugging or additional data collection before attempting
+recovery. This is useful especially when the driver is unsure about recovery
+or method is unknown.
 
 .. _drm_driver_ioctl:
 
-- 
2.34.1

