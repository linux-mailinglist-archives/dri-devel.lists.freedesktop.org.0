Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F39AFD0F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C1D10EA33;
	Fri, 25 Oct 2024 08:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqp39dA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8010EA35;
 Fri, 25 Oct 2024 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729846147; x=1761382147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JwkocReqtyRt0zYjlyUPartVAUOebyiEt6E2ydkMjFU=;
 b=eqp39dA65FqQRzeQxZFdS82bD2+NO/l869YFlV7P+GN/0blyrCSpiN8U
 0O+luLTWjt03gaBv7zJ6VJwJPSQSiJgfuAGc6MfH6lCj+kU0KkpKVHPD+
 bHG7VfcUGdgoqqpeGwotJCh8gqcFcFWyINincbvjCcOw7W3vYiO2NVyRK
 FmIYJGlOUuCvb21w3qq66af3KlLpgVqWcdgZoHYE3xYZvB4L5DoSiyAoy
 f5c1vf8vT2y7RheYjUWrAQlkmWHzLe7fbU+HxAsKpYXpVqHkAlxD43DS5
 LNTCw5zhHbdyqVxBn/4ov1cEXMO2nXGEFfn7An/7PqQH0Iinu4S2jajro w==;
X-CSE-ConnectionGUID: W2dR/+GJT5qlkrBIIp/SNg==
X-CSE-MsgGUID: sWOd3+GPTjiDAuMOJprw3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32369512"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="32369512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 01:49:07 -0700
X-CSE-ConnectionGUID: a/oWB9piQj+Ee923mMFE5A==
X-CSE-MsgGUID: J4RLUBdBSmWCe8Oq2B0bBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80768563"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 01:49:01 -0700
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
Subject: [PATCH v8 2/4] drm/doc: Document device wedged event
Date: Fri, 25 Oct 2024 14:18:15 +0530
Message-Id: <20241025084817.144621-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025084817.144621-1-raag.jadav@intel.com>
References: <20241025084817.144621-1-raag.jadav@intel.com>
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

Add documentation for device wedged event in a new 'Device wedging'
chapter. The describes basic definitions and consumer expectations
along with an example.

v8: Improve documentation (Christian, Rodrigo)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 370d820be248..11a7446233b5 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -362,6 +362,81 @@ the first place. DRM devices should make use of devcoredump to store relevant
 information about the reset, so this information can be added to user bug
 reports.
 
+Device wedging
+==============
+
+Drivers can optionally make use of device wedged event (implemented as
+drm_dev_wedged_event() in DRM subsystem) which notifies userspace of wedged
+(hanged/unusable) state of the DRM device through a uevent. This is useful
+especially in cases where the device is no longer operating as expected even
+after a reset and has become unrecoverable from driver context. Purpose of
+this implementation is to provide drivers a generic way to recover with the
+help of userspace intervention without taking any drastic measures in the
+driver.
+
+A 'wedged' device is basically a dead device that needs attention. The
+uevent is the notification that is sent to userspace along with a hint about
+what could possibly be attempted to recover the device and bring it back to
+usable state. Different drivers may have different ideas of a 'wedged' device
+depending on their hardware implementation, and hence the vendor agnostic
+nature of the event. It is up to the drivers to decide when they see the need
+for recovery and how they want to recover from the available methods.
+
+Recovery
+--------
+
+Current implementation defines two recovery methods, out of which, drivers
+can use any one, both or none. Method(s) of choice will be sent in the uevent
+environment as ``WEDGED=<method1>[,<method2>]`` in order of less to more side
+effects. If driver is unsure about recovery or method is unknown (like reboot,
+firmware flashing, hardware replacement or any other procedure which can't be
+attempted on the fly), ``WEDGED=none`` will be sent instead.
+
+It is the responsibility of the driver to perform required cleanups (like
+disabling system memory access or signalling dma_fences) and prepare itself
+for the recovery before sending the event. Once the event is sent, driver
+should block all IOCTLs with an error code. This will signify the reason for
+wegeding which can be reported to the application if needed.
+
+Userspace consumers can parse this event and attempt recovery as per below
+expectations.
+
+    =============== ==================================
+    Recovery method Consumer expectations
+    =============== ==================================
+    rebind          unbind + rebind driver
+    bus-reset       unbind + reset bus device + rebind
+    none            admin/user policy
+    =============== ==================================
+
+Example for rebind
+~~~~~~~~~~~~~~~~~~
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
+    sleep 1
+    echo -n $DEVICE > $DRIVER/bind
+
+Although scripts are simple enough for basic recovery, admin/users can define
+customized policies around recovery action. For example if the driver supports
+multiple recovery methods, consumers can opt for the suitable one based on
+policy definition. Consumers can also take additional steps like gathering
+telemetry information (devcoredump, syslog), or have the device available for
+further debugging and data collection before performing the recovery. This is
+useful especially when the driver is unsure about recovery or method is unknown.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.34.1

