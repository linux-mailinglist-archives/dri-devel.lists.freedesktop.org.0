Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A04ACF40C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466C510E884;
	Thu,  5 Jun 2025 16:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6I6sf/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A895D10E884
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749140491; x=1780676491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cjSfA5kWz8OIWyiWCxiJUuCfhiohW3IBa3nosCf2Ww4=;
 b=R6I6sf/PwGtt4qEtrMMkX7IMzCO5aowbwzuxk5BU0T5+82svkj/VJ2Gf
 neHrFcsZ3rUgF2NaxDEXXdDHrsjWlQAnDzIPT7NUdkHqwINoBmz0YivP/
 6orSGe8k/hWlNxmhueawg2u3WQ7+N0wOY1xZV6PqhUhsbMQcs2N/Tp723
 j9/DF8f5cq6/LW369KQqspT6ZDeWth8inDIN43LnmXHOpy8smOBfT9wTg
 mJuUwTDhUSv2pdsEjwKLKWZcaIHSedUg7WnV0pDZoSueboBZ15tURDD81
 gMMYmNCeIV8Jz+hA4pSvo3zlRLY25Kfb7ZJm7rf2GoB8qdv2T55tKG27d w==;
X-CSE-ConnectionGUID: WA3jJB47SRSoMM3B5tZqgA==
X-CSE-MsgGUID: 3xXJn8zBS5S/cvxwRC7Lvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51415943"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51415943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:21:30 -0700
X-CSE-ConnectionGUID: DlRw8bODQcS7l2jl7kWZ3w==
X-CSE-MsgGUID: fYFV9kAcRnqnPNV724FH9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146515213"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:21:29 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Add initial Wildcat Lake support
Date: Thu,  5 Jun 2025 18:19:47 +0200
Message-ID: <20250605161947.1237727-1-maciej.falkowski@linux.intel.com>
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

Add support for Wildcat Lake (WCL) CPUs.
Wildcat Lake contains NPU5 just like Panther Lake
hence the initial support is very simple and adds
only PCI IDs.

Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c   | 1 +
 drivers/accel/ivpu/ivpu_drv.h   | 3 +++
 drivers/accel/ivpu/ivpu_hw_ip.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 0e7748c5e117..3d6d52492536 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -704,6 +704,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_ARL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index b6d6b3238b59..17aa3532c76d 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -26,6 +26,7 @@
 #define PCI_DEVICE_ID_ARL	0xad1d
 #define PCI_DEVICE_ID_LNL	0x643e
 #define PCI_DEVICE_ID_PTL_P	0xb03e
+#define PCI_DEVICE_ID_WCL	0xfd3e
 
 #define IVPU_HW_IP_37XX 37
 #define IVPU_HW_IP_40XX 40
@@ -241,6 +242,7 @@ static inline int ivpu_hw_ip_gen(struct ivpu_device *vdev)
 	case PCI_DEVICE_ID_LNL:
 		return IVPU_HW_IP_40XX;
 	case PCI_DEVICE_ID_PTL_P:
+	case PCI_DEVICE_ID_WCL:
 		return IVPU_HW_IP_50XX;
 	default:
 		dump_stack();
@@ -257,6 +259,7 @@ static inline int ivpu_hw_btrs_gen(struct ivpu_device *vdev)
 		return IVPU_HW_BTRS_MTL;
 	case PCI_DEVICE_ID_LNL:
 	case PCI_DEVICE_ID_PTL_P:
+	case PCI_DEVICE_ID_WCL:
 		return IVPU_HW_BTRS_LNL;
 	default:
 		dump_stack();
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index 823f6a57dc54..2bf9882ab52e 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -683,6 +683,7 @@ static void pwr_island_delay_set(struct ivpu_device *vdev)
 		return;
 
 	switch (ivpu_device_id(vdev)) {
+	case PCI_DEVICE_ID_WCL:
 	case PCI_DEVICE_ID_PTL_P:
 		post = high ? 18 : 0;
 		post1 = 0;
-- 
2.43.0

