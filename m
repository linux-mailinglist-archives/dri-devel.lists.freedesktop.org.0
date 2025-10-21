Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB36BF707E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D210E603;
	Tue, 21 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoI6ulDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556C10E601
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761056516; x=1792592516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fC9flwJxK8qyLsUO+5J2jTUYpRCWIway2v3jhwToJ2s=;
 b=KoI6ulDZiz340jIU6X7tpt4xNT4BObSZysi+hHZxllz+0pDpHqyOz49R
 MDEUmfw4LFR08ZOqC37B/E3KfVSuWDIk2XYDPNhUYnowrDbZ3wHWYnrGg
 wf/FIvaFxUorXOrqS4SWpWIf5zhvzzdGtYS4562442rAjlo+c4uanr+Yr
 D8tTZ3zIs2NzSz1brI3qfqjrHhFO7ToqoxNazxFEo8OGmD12KmaeGBFrA
 V6fHvXs5/G/AY2103omI3nAoU/zhHQnIXJfqpil/7SvQcOoChQRDfz+wC
 yE+dPKgwTabytEfCvmS25Wyew6XDzzn3QYICO9rLFMlMg3c8C1u5BbUIb A==;
X-CSE-ConnectionGUID: GYFYoaPyTAecPKutpUsuXA==
X-CSE-MsgGUID: QUf3aZefT6+NhoZEZMShsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73854419"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="73854419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:21:56 -0700
X-CSE-ConnectionGUID: 3VSxP5KZREySWrdVwyqdwQ==
X-CSE-MsgGUID: +xlIFeAzQHm/arRrVN23hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="220772043"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:21:55 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Add support for Nova Lake's NPU
Date: Tue, 21 Oct 2025 16:19:48 +0200
Message-ID: <20251021141948.2216735-1-maciej.falkowski@linux.intel.com>
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

Add support for NPU6 generation that
will be present on Nova Lake CPUs.
As with previous generations, it maintains compatibility
so no bigger functional changes.

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c   | 1 +
 drivers/accel/ivpu/ivpu_drv.h   | 4 ++++
 drivers/accel/ivpu/ivpu_fw.c    | 2 ++
 drivers/accel/ivpu/ivpu_hw_ip.c | 7 +++++++
 4 files changed, 14 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 7d1ab3cf661d..75ae49f8d19c 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -708,6 +708,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_NVL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 0a04e037cc2e..4e9cf04fa5e4 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -27,6 +27,7 @@
 #define PCI_DEVICE_ID_LNL	0x643e
 #define PCI_DEVICE_ID_PTL_P	0xb03e
 #define PCI_DEVICE_ID_WCL	0xfd3e
+#define PCI_DEVICE_ID_NVL	0xd71d
 
 #define IVPU_HW_IP_37XX 37
 #define IVPU_HW_IP_40XX 40
@@ -246,6 +247,8 @@ static inline int ivpu_hw_ip_gen(struct ivpu_device *vdev)
 	case PCI_DEVICE_ID_PTL_P:
 	case PCI_DEVICE_ID_WCL:
 		return IVPU_HW_IP_50XX;
+	case PCI_DEVICE_ID_NVL:
+		return IVPU_HW_IP_60XX;
 	default:
 		dump_stack();
 		ivpu_err(vdev, "Unknown NPU IP generation\n");
@@ -262,6 +265,7 @@ static inline int ivpu_hw_btrs_gen(struct ivpu_device *vdev)
 	case PCI_DEVICE_ID_LNL:
 	case PCI_DEVICE_ID_PTL_P:
 	case PCI_DEVICE_ID_WCL:
+	case PCI_DEVICE_ID_NVL:
 		return IVPU_HW_BTRS_LNL;
 	default:
 		dump_stack();
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 1bf809f63c3f..10248fcc45ce 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -56,12 +56,14 @@ static struct {
 	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
 	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v1.bin" },
 	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
+	{ IVPU_HW_IP_60XX, "intel/vpu/vpu_60xx_v1.bin" },
 };
 
 /* Production fw_names from the table above */
 MODULE_FIRMWARE("intel/vpu/vpu_37xx_v1.bin");
 MODULE_FIRMWARE("intel/vpu/vpu_40xx_v1.bin");
 MODULE_FIRMWARE("intel/vpu/vpu_50xx_v1.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_60xx_v1.bin");
 
 static int ivpu_fw_request(struct ivpu_device *vdev)
 {
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index 2bf9882ab52e..9d32273e94ed 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -691,6 +691,13 @@ static void pwr_island_delay_set(struct ivpu_device *vdev)
 		status = high ? 46 : 3;
 		break;
 
+	case PCI_DEVICE_ID_NVL:
+		post = high ? 198 : 17;
+		post1 = 0;
+		post2 = high ? 198 : 17;
+		status = 0;
+		break;
+
 	default:
 		dump_stack();
 		ivpu_err(vdev, "Unknown device ID\n");
-- 
2.43.0

