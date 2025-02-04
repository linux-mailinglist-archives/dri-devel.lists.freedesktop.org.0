Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9DA26D88
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AC010E5B8;
	Tue,  4 Feb 2025 08:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg8uHmh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C8C10E5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658798; x=1770194798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70jRqJrGNlhnNBNAkrtupNooKWw+g6MbMe2nWI+VujA=;
 b=jg8uHmh3varBlxY26E4XvkqFi1OgW3wcSsXggxPEtrZKY91NR95zjkLD
 T/CFqZmAL2qDibpuCJLNplm+pxwG6mdNREej2eJ0Lm21Ra2m7H1bYVELk
 2VZw3nJ/HHo7htjG21tD9dEgvUZhEh4wClv6TdbHuh49HsQ1gVT5FKKue
 O4VEW8pFXaOpdM7jVFttr95YOVYWTmxOI+6WFE835PH3+aExKKYw9Ln+s
 IS6RqN44gxJvBT55//iBMWd+1kPbXSCEMidX81h+XC6GHkKGC3p3S9q4H
 76ikGiGeYKnKFCpQymgdD48ZcgVXvCH3W4efvcBCAKoXFc+HpDHhYlK2d Q==;
X-CSE-ConnectionGUID: u/rh8Ml7SSejSUBw/DW8xQ==
X-CSE-MsgGUID: BG/LVxVnTUCfPPudlls2vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434744"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434744"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:37 -0800
X-CSE-ConnectionGUID: qITRx2i/Tsm8tKtVUL20Tg==
X-CSE-MsgGUID: 4XCGh0f9SeGFnY0WSWjcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531618"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:36 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 6/6] accel/ivpu: Implement D0i2 disable test mode
Date: Tue,  4 Feb 2025 09:46:22 +0100
Message-ID: <20250204084622.2422544-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Add power_profile firmware boot param and set it to 0 by default
which is default FW power profile.

Implement IVPU_TEST_MODE_D0I2_DISABLE which is used for setting
power profile boot param value to 1 which prevents NPU from entering
d0i2 power state.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h | 2 ++
 drivers/accel/ivpu/ivpu_fw.c  | 4 ++++
 drivers/accel/ivpu/ivpu_hw.c  | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 73d808068c8b7..92753effb1c99 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -111,6 +111,7 @@ struct ivpu_wa_table {
 	bool disable_clock_relinquish;
 	bool disable_d0i3_msg;
 	bool wp0_during_power_up;
+	bool disable_d0i2;
 };
 
 struct ivpu_hw_info;
@@ -208,6 +209,7 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_TURBO		  BIT(9)
 #define IVPU_TEST_MODE_CLK_RELINQ_DISABLE BIT(10)
 #define IVPU_TEST_MODE_CLK_RELINQ_ENABLE  BIT(11)
+#define IVPU_TEST_MODE_D0I2_DISABLE       BIT(12)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index cfe8f79ec5a6f..7a1bb92d8c816 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -534,6 +534,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->d0i3_entry_vpu_ts);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
 		 boot_params->system_time_us);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = %u\n",
+		 boot_params->power_profile);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
@@ -634,6 +636,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 		boot_params->d0i3_delayed_entry = 1;
 	boot_params->d0i3_residency_time_us = 0;
 	boot_params->d0i3_entry_vpu_ts = 0;
+	if (IVPU_WA(disable_d0i2))
+		boot_params->power_profile = 1;
 
 	boot_params->system_time_us = ktime_to_us(ktime_get_real());
 	wmb(); /* Flush WC buffers after writing bootparams */
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 4d9f30e3b505d..ec9a3629da3a9 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -77,11 +77,15 @@ static void wa_init(struct ivpu_device *vdev)
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
 		vdev->wa.wp0_during_power_up = true;
 
+	if (ivpu_test_mode & IVPU_TEST_MODE_D0I2_DISABLE)
+		vdev->wa.disable_d0i2 = true;
+
 	IVPU_PRINT_WA(punit_disabled);
 	IVPU_PRINT_WA(clear_runtime_mem);
 	IVPU_PRINT_WA(interrupt_clear_with_0);
 	IVPU_PRINT_WA(disable_clock_relinquish);
 	IVPU_PRINT_WA(wp0_during_power_up);
+	IVPU_PRINT_WA(disable_d0i2);
 }
 
 static void timeouts_init(struct ivpu_device *vdev)
-- 
2.45.1

