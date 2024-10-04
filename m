Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B49903CB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 15:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F9F10E190;
	Fri,  4 Oct 2024 13:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aR+Y+LFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AC210E190
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 13:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728047966; x=1759583966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8q+fL8ozGz00pBvykEHIsy/NJ1pedAwnFx2umbvu5TE=;
 b=aR+Y+LFvPLMOPJwyOyx1KzskMOdskAvNAaJs9HxaXE44jsPuda8cOnfA
 34mL+hNsP8L6IEj8qUw7mSrt4NX5dV0fypvA6vA7piKBQDJnGQ1Lk9JUY
 nRhwEOUx2e+Qj+3alxiIxJuLyAgS4r8PfZGdsyFEKHenPwfkdxoc35JD7
 xP6etqTqIgSgT2JfdiWT1QWVe4QIJHvvjfbc5lHTU5Ay35HN2VBPa0BA4
 aN9NTzsWQKDJw1MTUc6SLshyZlT7TAJY/Obckl2zw71m7Ihcwowv/42Zj
 qCUMTi2CQQK0YGG0eICRGO8x6d91AbUGA5NyQYUTZjnEvdRsdAO169Rzo g==;
X-CSE-ConnectionGUID: X9RG+2TGSw+jvDAQvGronA==
X-CSE-MsgGUID: ySF0J76BRxafxIGlIDSuiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27149265"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27149265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:26 -0700
X-CSE-ConnectionGUID: xM5Eze2vRp6yb7a7uFzrOA==
X-CSE-MsgGUID: lNs+4jOGRsSkfosWTheuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74694803"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 06:19:25 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 1/2] accel/ivpu: Add initial Panther Lake support
Date: Fri,  4 Oct 2024 18:25:04 +0200
Message-Id: <20241004162505.1695605-2-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
References: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
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

Add support for the 5th generation of Intel NPU that
is going to be present in PTL_P (Panther Lake) CPUs.
NPU5 code reuses almost all of previous driver code.

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  1 +
 drivers/accel/ivpu/ivpu_drv.h | 10 +++++++---
 drivers/accel/ivpu/ivpu_fw.c  |  3 +++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c91400ecf926..1b3127ce0ee2 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -722,6 +722,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_MTL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_ARL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 63f13b697eed..d0f750c5c453 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -23,9 +23,10 @@
 #define DRIVER_DESC "Driver for Intel NPU (Neural Processing Unit)"
 #define DRIVER_DATE "20230117"
 
-#define PCI_DEVICE_ID_MTL   0x7d1d
-#define PCI_DEVICE_ID_ARL   0xad1d
-#define PCI_DEVICE_ID_LNL   0x643e
+#define PCI_DEVICE_ID_MTL	0x7d1d
+#define PCI_DEVICE_ID_ARL	0xad1d
+#define PCI_DEVICE_ID_LNL	0x643e
+#define PCI_DEVICE_ID_PTL_P	0xb03e
 
 #define IVPU_HW_IP_37XX 37
 #define IVPU_HW_IP_40XX 40
@@ -215,6 +216,8 @@ static inline int ivpu_hw_ip_gen(struct ivpu_device *vdev)
 		return IVPU_HW_IP_37XX;
 	case PCI_DEVICE_ID_LNL:
 		return IVPU_HW_IP_40XX;
+	case PCI_DEVICE_ID_PTL_P:
+		return IVPU_HW_IP_50XX;
 	default:
 		dump_stack();
 		ivpu_err(vdev, "Unknown NPU IP generation\n");
@@ -229,6 +232,7 @@ static inline int ivpu_hw_btrs_gen(struct ivpu_device *vdev)
 	case PCI_DEVICE_ID_ARL:
 		return IVPU_HW_BTRS_MTL;
 	case PCI_DEVICE_ID_LNL:
+	case PCI_DEVICE_ID_PTL_P:
 		return IVPU_HW_BTRS_LNL;
 	default:
 		dump_stack();
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index ede6165e09d9..33ce4680c2cd 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -58,11 +58,14 @@ static struct {
 	{ IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
 	{ IVPU_HW_IP_40XX, "vpu_40xx.bin" },
 	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
+	{ IVPU_HW_IP_50XX, "vpu_50xx.bin" },
+	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
 };
 
 /* Production fw_names from the table above */
 MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
 MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
+MODULE_FIRMWARE("intel/vpu/vpu_50xx_v0.0.bin");
 
 static int ivpu_fw_request(struct ivpu_device *vdev)
 {
-- 
2.34.1

