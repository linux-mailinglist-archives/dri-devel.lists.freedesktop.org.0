Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3AA8B6C9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111AD10E08A;
	Wed, 16 Apr 2025 10:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3P6Mr3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E98A10E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799221; x=1776335221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKIvuNtj4z1K6N7YK0HOrQxGtFQ/sHYmsHeXJbaxjvE=;
 b=l3P6Mr3ngcjHHoc4PXbAdADfYXLdCLcOMXR4o8Y5JZVsGWSzLuHOvi/j
 uLL/Mpsg4XnhtRBN6OcY70Ra/PxicQoz9RbIZrdd+rO790OGQlRPWMTxk
 pwiiKCbNNeUG1TuGTIT2heL96nexPu510zKPtpO3n3LVVAJypTPHUIeuh
 JDoRyhx3JV4+8l1j1PyXv9plskpPqZEgktzRZbd6cIlDqlbFXkcXavc+e
 kChmHtHMYgipeBjVeK+i4rWjkklUV/FTwnbRoKn7nZkJ/9CoY+AjBT61S
 MdnjMi3bA+ivPMDkvztD/m2UxofrUbQ4D9I2CfCyyC0Go6vZrq3sHTbZ3 A==;
X-CSE-ConnectionGUID: 8CC5rq+JQya3DsbpaZr9MQ==
X-CSE-MsgGUID: eeSPqfxzTAGIOee1Go6TKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46229239"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46229239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:00 -0700
X-CSE-ConnectionGUID: nDhBdLW9SdeoURpPcb1qrw==
X-CSE-MsgGUID: QQqli8U2TsmXN9M+RtBurg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="131333839"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:26:58 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix the D0i2 disable test mode
Date: Wed, 16 Apr 2025 12:26:29 +0200
Message-ID: <20250416102629.384626-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>

Correct setup of D0i2 disable which was
by mistake set up to value 1 and use BIT(1) instead.

Fixes: 011529fe8112 ("accel/ivpu: Implement D0i2 disable test mode")
Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 5e1d709c6a46..ccaaf6c100c0 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -544,7 +544,7 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->d0i3_entry_vpu_ts);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
 		 boot_params->system_time_us);
-	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = %u\n",
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = 0x%x\n",
 		 boot_params->power_profile);
 }
 
@@ -646,7 +646,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->d0i3_residency_time_us = 0;
 	boot_params->d0i3_entry_vpu_ts = 0;
 	if (IVPU_WA(disable_d0i2))
-		boot_params->power_profile = 1;
+		boot_params->power_profile |= BIT(1);
 
 	boot_params->system_time_us = ktime_to_us(ktime_get_real());
 	wmb(); /* Flush WC buffers after writing bootparams */
-- 
2.43.0

