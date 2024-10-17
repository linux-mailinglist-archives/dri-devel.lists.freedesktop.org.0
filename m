Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0C9A25CA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AF10E85C;
	Thu, 17 Oct 2024 14:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnLxFJxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679F10E85A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177117; x=1760713117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QrRkCicFE7PJNiwRNlzq86FgC/iZrKu0QE7kw9EjTuY=;
 b=PnLxFJxzEu3fTFtM10Te7LYuQHqNxnajQUbtQ5ztzUc0XlsQeCXHeYKc
 /eh/wUcu9RDUzoJ+HUmweVpvMqNwsh9AY5oXrtEFakpTgo1kctP6DgBCU
 h8Yqrw1XwsD/ZzFZx9jwdXt75A6KYKz8+i8+sMSUpsJiSwyFFfN84GqzS
 MvWHg049+3eRQeSxio7ogvv/tw3RjnQTQPISiGtKrnCozHmHrKDIXleIV
 3BtbyS9MVGsL611biBWFj1UORIOe8Unr05hx+vJO+ALMr+rODgYzfKYf2
 yL+IGh6JfpZ/PsS+WiWC8EhW3cVP+Qr5WO+KyynGbkXI5vp3geN3KrbN5 w==;
X-CSE-ConnectionGUID: WlYeezCfSPCpUlZYRTZsnA==
X-CSE-MsgGUID: 2khVTa0wTI+S6zP6VgiZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790364"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:37 -0700
X-CSE-ConnectionGUID: yWv/5C8ASeG91Mt0X7dIyg==
X-CSE-MsgGUID: JxkATs/DToiIviED/hBLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374555"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:36 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 09/11] accel/ivpu: Add debug Kconfig option
Date: Thu, 17 Oct 2024 16:58:15 +0200
Message-ID: <20241017145817.121590-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Add CONFIG_DRM_ACCEL_IVPU_DEBUG option that:
 - Adds -DDEBUG that enables printk regardless of the kernel config
 - Enables unsafe module params (that are now disabled by default)

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/Kconfig    | 10 ++++++++++
 drivers/accel/ivpu/Makefile   |  2 ++
 drivers/accel/ivpu/ivpu_drv.c |  2 ++
 drivers/accel/ivpu/ivpu_fw.c  |  2 ++
 drivers/accel/ivpu/ivpu_pm.c  |  2 ++
 5 files changed, 18 insertions(+)

diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
index e4d418b44626e..8858b32e05640 100644
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -16,3 +16,13 @@ config DRM_ACCEL_IVPU
 	  and Deep Learning applications.
 
 	  If "M" is selected, the module will be called intel_vpu.
+
+config DRM_ACCEL_IVPU_DEBUG
+	bool "Intel NPU debug mode"
+	depends on DRM_ACCEL_IVPU
+	default n
+	help
+	  Choose this option to enable additional
+	  debug features for the Intel NPU driver:
+	  - Always print debug messages regardless of dyndbg config,
+	  - Enable unsafe module params.
diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index e73937c86d9ad..1029e0bab0615 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -24,4 +24,6 @@ intel_vpu-$(CONFIG_DEV_COREDUMP) += ivpu_coredump.o
 
 obj-$(CONFIG_DRM_ACCEL_IVPU) += intel_vpu.o
 
+subdir-ccflags-$(CONFIG_DRM_ACCEL_IVPU_DEBUG) += -DDEBUG
+
 CFLAGS_ivpu_trace_points.o = -I$(src)
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index f5a8d93fe2a57..ca2bf47ce2484 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -43,8 +43,10 @@ module_param_named(dbg_mask, ivpu_dbg_mask, int, 0644);
 MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
 
 int ivpu_test_mode;
+#if IS_ENABLED(CONFIG_DRM_ACCEL_IVPU_DEBUG)
 module_param_named_unsafe(test_mode, ivpu_test_mode, int, 0644);
 MODULE_PARM_DESC(test_mode, "Test mode mask. See IVPU_TEST_MODE_* macros.");
+#endif
 
 u8 ivpu_pll_min_ratio;
 module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index be367465e7df4..d358cf0b0f972 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -46,8 +46,10 @@
 #define IVPU_FOCUS_PRESENT_TIMER_MS 1000
 
 static char *ivpu_firmware;
+#if IS_ENABLED(CONFIG_DRM_ACCEL_IVPU_DEBUG)
 module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
 MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
+#endif
 
 static struct {
 	int gen;
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index e567df79a6129..dbc0711e28d13 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -24,8 +24,10 @@
 #include "vpu_boot_api.h"
 
 static bool ivpu_disable_recovery;
+#if IS_ENABLED(CONFIG_DRM_ACCEL_IVPU_DEBUG)
 module_param_named_unsafe(disable_recovery, ivpu_disable_recovery, bool, 0644);
 MODULE_PARM_DESC(disable_recovery, "Disables recovery when NPU hang is detected");
+#endif
 
 static unsigned long ivpu_tdr_timeout_ms;
 module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
-- 
2.45.1

