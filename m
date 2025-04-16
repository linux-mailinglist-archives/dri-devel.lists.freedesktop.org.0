Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EDA8B6C8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD3810E8C5;
	Wed, 16 Apr 2025 10:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHKjIdD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A677310E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799208; x=1776335208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gp/Odoeoa8IbM+F+5igIKr4cz00157lZ/ApAagaWtSY=;
 b=NHKjIdD8Shaz0xXw2RTFllnEubxudrnQihx5HkCJhfLFYCrgxHyQxpv3
 grpOQqW+QOkiCbOajZ6l0KI/59LBuN0SSt8qrxa25sg39FhepYnUYPJ+k
 RSFmZXP8o+lK3q3ZSrjxBWoENQTBqEDGAegQ/zc31ZOBRk850Jf2kAeNT
 znP3HbdkKAzsGbEyBr7lCGs3N8pWxBaYHyLg0wSWkVANvXd8orE6UJGOD
 PMQOJdavMJ0ecdEN0iNQUl+iOITrGqy4M2JqsVQKWKKO5a5Zs/KXR7tRd
 5+D+kuu5v1lJni5yarOVWirozocI8P9ME/klT4PZaykBPnbVBekR+llT2 w==;
X-CSE-ConnectionGUID: fwR+AkWYQiC5SZOTiFg6kg==
X-CSE-MsgGUID: FyzQPLdDTHSB7zPk0qbwQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46355026"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46355026"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:26:47 -0700
X-CSE-ConnectionGUID: mSjTUNgnSqyehtaqWIpOew==
X-CSE-MsgGUID: ghiPisA9TjOR4EfntgdOoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="161379945"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:26:44 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Correct DCT interrupt handling
Date: Wed, 16 Apr 2025 12:26:16 +0200
Message-ID: <20250416102616.384577-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Fix improper use of dct_active_percent field in DCT interrupt handler
causing DCT to never get enabled. Set dct_active_percent internally before
IPC to ensure correct driver value even if IPC fails.
Set default DCT value to 30 accordingly to HW architecture specification.

Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.h |  2 +-
 drivers/accel/ivpu/ivpu_pm.c      | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
index 300f749971d4..d2d82651976d 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
@@ -14,7 +14,7 @@
 #define PLL_PROFILING_FREQ_DEFAULT   38400000
 #define PLL_PROFILING_FREQ_HIGH      400000000
 
-#define DCT_DEFAULT_ACTIVE_PERCENT 15u
+#define DCT_DEFAULT_ACTIVE_PERCENT 30u
 #define DCT_PERIOD_US		   35300u
 
 int ivpu_hw_btrs_info_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 1fe03fc16bbc..ea30db181cd7 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -448,16 +448,17 @@ int ivpu_pm_dct_enable(struct ivpu_device *vdev, u8 active_percent)
 	active_us = (DCT_PERIOD_US * active_percent) / 100;
 	inactive_us = DCT_PERIOD_US - active_us;
 
+	vdev->pm->dct_active_percent = active_percent;
+
+	ivpu_dbg(vdev, PM, "DCT requested %u%% (D0: %uus, D0i2: %uus)\n",
+		 active_percent, active_us, inactive_us);
+
 	ret = ivpu_jsm_dct_enable(vdev, active_us, inactive_us);
 	if (ret) {
 		ivpu_err_ratelimited(vdev, "Failed to enable DCT: %d\n", ret);
 		return ret;
 	}
 
-	vdev->pm->dct_active_percent = active_percent;
-
-	ivpu_dbg(vdev, PM, "DCT set to %u%% (D0: %uus, D0i2: %uus)\n",
-		 active_percent, active_us, inactive_us);
 	return 0;
 }
 
@@ -465,15 +466,16 @@ int ivpu_pm_dct_disable(struct ivpu_device *vdev)
 {
 	int ret;
 
+	vdev->pm->dct_active_percent = 0;
+
+	ivpu_dbg(vdev, PM, "DCT requested to be disabled\n");
+
 	ret = ivpu_jsm_dct_disable(vdev);
 	if (ret) {
 		ivpu_err_ratelimited(vdev, "Failed to disable DCT: %d\n", ret);
 		return ret;
 	}
 
-	vdev->pm->dct_active_percent = 0;
-
-	ivpu_dbg(vdev, PM, "DCT disabled\n");
 	return 0;
 }
 
@@ -486,7 +488,7 @@ void ivpu_pm_irq_dct_work_fn(struct work_struct *work)
 	if (ivpu_hw_btrs_dct_get_request(vdev, &enable))
 		return;
 
-	if (vdev->pm->dct_active_percent)
+	if (enable)
 		ret = ivpu_pm_dct_enable(vdev, DCT_DEFAULT_ACTIVE_PERCENT);
 	else
 		ret = ivpu_pm_dct_disable(vdev);
-- 
2.43.0

