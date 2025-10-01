Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD638BB00AC
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 12:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97D110E353;
	Wed,  1 Oct 2025 10:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJPyXYEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF8A10E352
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759315413; x=1790851413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bWmA9Tk3eujgXqyEBHu9n8IVLdOnZI9tp/yroCWjpZ0=;
 b=BJPyXYEdvxhcggC0MV/yNM3P/RZ8Pbnkje6LJ2wXD7Tvq7BV9TzeQhzY
 24HhGWQFN9Lc0CyKjD+t+BeehG07p8wNaoR96nvC1nmAfXUWlD9So+unO
 oMW3qRIAT+ZYbj7iNGOz6DUavljy/v0ftfHP2gslmeWrzgVCXh6JVT7lk
 8DlPPjTtuqNGH6YYN30eEbd2x3X9UVS/5dck+FAX+5K/P7rK5sPuOaFGP
 Pd2WdsR5yehRycGFIt9ClxSiEosv+oJQuKGv7dHRG3Dao8IHdEgBgvmM8
 MmcEvqDNUbPc38r7fvWsScZ2NFooO2y3vZShiF85dsjLB7IGivt8ObA5+ A==;
X-CSE-ConnectionGUID: 2y/RF6adSO6agYE5ycDvQg==
X-CSE-MsgGUID: HxBulxTBSVOFvT1GfJKTJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61293981"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61293981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:43:33 -0700
X-CSE-ConnectionGUID: dRkYbOPpR/KdpGc1yFeqVA==
X-CSE-MsgGUID: FuWvEBGWQU6do7t4XcE7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178357476"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:43:32 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix DCT active percent format
Date: Wed,  1 Oct 2025 12:43:22 +0200
Message-ID: <20251001104322.1249896-1-karol.wachowski@linux.intel.com>
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

The pcode MAILBOX STATUS register PARAM2 field expects DCT active
percent in U1.7 value format. Convert percentage value to this
format before writing to the register.

Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
 drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
 drivers/accel/ivpu/ivpu_pm.c      | 9 +++++++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index afdb3b2aa72a..aa33f562d29c 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -752,7 +752,7 @@ int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable)
 	}
 }
 
-void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent)
+void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u8 active_percent)
 {
 	u32 val = 0;
 	u32 cmd = enable ? DCT_ENABLE : DCT_DISABLE;
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
index 032c384ac3d4..c4c10e22f30f 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
@@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
 bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
 bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
 int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
-void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent);
+void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u8 active_percent);
 u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
 u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
 u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 7514f580eef4..63c95307faa1 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -502,6 +502,11 @@ void ivpu_pm_irq_dct_work_fn(struct work_struct *work)
 	else
 		ret = ivpu_pm_dct_disable(vdev);
 
-	if (!ret)
-		ivpu_hw_btrs_dct_set_status(vdev, enable, vdev->pm->dct_active_percent);
+	if (!ret) {
+		/* Convert percent to U1.7 format */
+		u8 val = DIV_ROUND_CLOSEST(vdev->pm->dct_active_percent * 128, 100);
+
+		ivpu_hw_btrs_dct_set_status(vdev, enable, val);
+	}
+
 }
-- 
2.43.0

