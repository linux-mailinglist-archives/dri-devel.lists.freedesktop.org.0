Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B68543DA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFC510E481;
	Wed, 14 Feb 2024 08:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNZG9Jvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCBD10E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898394; x=1739434394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXmZEfvfrUNgZuM/ybHwOYHXw2Ig09z6vVqzy06e7vc=;
 b=hNZG9JvpPRozaNaN5waVVjxn9hhY1mQX9LkBoDYzEMN6KgfenzZJiY4H
 7diHuT6cIbRymciDGVSYUUb4ptlpwHpxYDH90tHu7qm4kDL5GTBIwbEr0
 prPCw5G4XbjquLDc9zsZH3hLaAU4RwlBzupUJSIKhuoDsYKe8Gz6hl8YL
 7i+ZGN1pCnof02b35x2uU1yYzELA4Kcdrs0IXS5iDWh2wLhtu6Ug+RTTF
 /giSwEhXEfj1WKj7oep7Efb0NJro+x2xw3TsCYPi43fXFIY08d5NHpngK
 uhKJ8Tx4aPeLujjZeNpkf7ApJQJQPBKaouf8jv+++OAVYtE8eA0OSEyFp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651660"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407402"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:13 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Krystian Pradzynski <krystian.pradzynski@intel.com>
Subject: [PATCH 4/8] accel/ivpu: Add support for FW boot param system_time_us
Date: Wed, 14 Feb 2024 09:13:01 +0100
Message-ID: <20240214081305.290108-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

From: Krystian Pradzynski <krystian.pradzynski@intel.com>

Add support for FW boot API param system_time_us.
According to the API description this field should
be set to system time in microseconds starting from 1970.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 186d0857410c..304c95d0f25d 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -468,6 +468,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->d0i3_residency_time_us);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_entry_vpu_ts = %llu\n",
 		 boot_params->d0i3_entry_vpu_ts);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
+		 boot_params->system_time_us);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
@@ -479,11 +481,14 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 		boot_params->d0i3_residency_time_us =
 			ktime_us_delta(ktime_get_boottime(), vdev->hw->d0i3_entry_host_ts);
 		boot_params->d0i3_entry_vpu_ts = vdev->hw->d0i3_entry_vpu_ts;
+		boot_params->system_time_us = ktime_to_us(ktime_get_real());
 
 		ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_residency_time_us = %lld\n",
 			 boot_params->d0i3_residency_time_us);
 		ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_entry_vpu_ts = %llu\n",
 			 boot_params->d0i3_entry_vpu_ts);
+		ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
+			 boot_params->system_time_us);
 
 		boot_params->save_restore_ret_address = 0;
 		vdev->pm->is_warmboot = true;
@@ -561,6 +566,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->d0i3_residency_time_us = 0;
 	boot_params->d0i3_entry_vpu_ts = 0;
 
+	boot_params->system_time_us = ktime_to_us(ktime_get_real());
 	wmb(); /* Flush WC buffers after writing bootparams */
 
 	ivpu_fw_boot_params_print(vdev, boot_params);
-- 
2.43.0

