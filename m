Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C4989BB6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13910E3B7;
	Mon, 30 Sep 2024 07:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6gcz2mX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0A10E3B5;
 Mon, 30 Sep 2024 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681988; x=1759217988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ot8CwKy9aFzh2XqNcy0XgW2wiUIEEhhDu8b4OvvgZBk=;
 b=b6gcz2mXxB054qp3N3/4kp0d12ZDLY8WZgaB3xbNpktLRKdFAO8bQ6kA
 NyUETvtHI9gDusbEvqONyup023crbPHkCcm3G7UiOJv143eAHdxOFI7Zo
 zbisflLITH0sSosuEEJZShRk5IDUxN5FVS1Ufe9bJM65R2emlYMKxAZeQ
 EJaw9f35X5P8shiOVl+uC2Nf7AOndESqqZ+GroPeQqg91Zcl3nU1Jm2ST
 HnrbF+DBHQGSs80O9ycZMFzS/Vxov5LS/OQHPzIgdw1DZ2pI/ywEqaKKz
 zWQ/zhanlJvSdxVQ6vK2xE9D4u319FQxGMkrbekdr3rO0t/UqObsxYKew A==;
X-CSE-ConnectionGUID: UPzi2pLlR5uwjgkSbQp+/A==
X-CSE-MsgGUID: zZjmMFj+THyEKQH03veAoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315493"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:48 -0700
X-CSE-ConnectionGUID: Ax07ZjdkQgeqzgCqfeWq+w==
X-CSE-MsgGUID: 7fRadhUZSXOf62vRIilCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797453"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:42 -0700
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
Subject: [PATCH v7 3/5] drm/doc: Document device wedged event
Date: Mon, 30 Sep 2024 13:08:43 +0530
Message-Id: <20240930073845.347326-4-raag.jadav@intel.com>
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

Add documentation for device wedged event along with its consumer
expectations. For now it is amended to 'Device reset' chapter, but
with extended functionality in the future it can be refactored into
its own chapter.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 370d820be248..c1186dfd283d 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -313,6 +313,22 @@ driver separately, with no common DRM interface. Ideally this should be properly
 integrated at DRM scheduler to provide a common ground for all drivers. After a
 reset, KMD should reject new command submissions for affected contexts.
 
+Drivers can optionally make use of device wedged event (implemented as
+drm_dev_wedged_event() in DRM subsystem) which notifies userspace of wedged
+(hanged/unusable) state of the DRM device through a uevent. This is useful
+especially in cases where the device is no longer operating as expected even
+after a hardware reset and has become unrecoverable from driver context.
+Purpose of this implementation is to provide drivers a generic way to recover
+with the help of userspace intervention, and hence the vendor agnostic nature
+of the event.
+
+Different drivers may have different ideas of a "wedged device" depending on
+their hardware implementation. It is up to the drivers to decide when they see
+the need for recovery and how they want to recover from the available methods.
+Current implementation defines three recovery methods, out of which, drivers
+can choose to support any one or multiple of them. Preferred recovery method
+will be sent in the uevent environment as WEDGED=<method>.
+
 User Mode Driver
 ----------------
 
@@ -323,6 +339,32 @@ if the UMD requires it. After detecting a reset, UMD will then proceed to report
 it to the application using the appropriate API error code, as explained in the
 section below about robustness.
 
+On device wedged scenario, userspace will receive a uevent from KMD with
+its preferred recovery method in the uevent environment as WEDGED=<method>.
+Userspace consumers (sysadmin) can define udev rules to parse this event
+and take respective action to recover the device.
+
+.. table:: Wedged Device Recovery
+
+    =============== ==================================
+    Recovery method Consumer expectations
+    =============== ==================================
+    rebind          unbind + rebind driver
+    bus-reset       unbind + reset bus device + rebind
+    reboot          reboot system
+    =============== ==================================
+
+Userspace consumers can optionally read the recovery methods supported by the
+device via ``wedge_recovery`` sysfs attribute::
+
+  $ cat /sys/class/drm/card<N>/wedge_recovery
+  rebind
+  bus-reset
+  reboot
+
+This is useful in cases where the device supports multiple recovery methods
+which can be used as fallbacks.
+
 Robustness
 ----------
 
-- 
2.34.1

