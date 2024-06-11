Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC65903B62
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679FB10E5EC;
	Tue, 11 Jun 2024 12:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNRZRmOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3460710E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107484; x=1749643484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j3PV+RNIDsIYji166H54PimSmfyryfQqgrzJT9MpCiw=;
 b=fNRZRmOXvdGPPwNO/mkmX2XifUs0M6ma/6yvdQfjErJFjrQuJlz3B88b
 rqwzv0aNvPv2PLR+n1ffYNiZ0cC6aEekaMgCyeRJW6YJYIDC0b1KVK60b
 PQdFJn5mzXqiDoRfF6B/+Kj6YuVw5+xV8UIgOYM2S+PHm0DlEPH0axBue
 QU6tv6WGZopyfvdM2VdtThvAcgx6XDBhvwRSGVu/3ujcnO2+YlL1R0YBJ
 05NqMv7qENNMoFBWfqURYclL5G2tOd4HFdh5RaUrELFOWli1d602iC5l1
 GV9n7pqHt/CzFkPlLDg50z0xB3PnZOp24BNdHgGv3Ove+ldrMoFIjq9Cn Q==;
X-CSE-ConnectionGUID: wFllmzFSRiqc+ZS3uJzrfA==
X-CSE-MsgGUID: A2KteS4vTR+sBc2dSeUs/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296037"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:44 -0700
X-CSE-ConnectionGUID: j5MI0omZQce4F9Gv/g1aWA==
X-CSE-MsgGUID: FWKskpxNQMGWT/14W5yZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39876976"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:42 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 04/15] accel/ivpu: Disable disable_clock_relinquish WA for LNL
 B0+
Date: Tue, 11 Jun 2024 14:04:21 +0200
Message-ID: <20240611120433.1012423-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

This WA is only needed for LNL revision A.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h | 2 ++
 drivers/accel/ivpu/ivpu_hw.c  | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index dc6ad1978a3b..d340bd8d66eb 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -32,6 +32,8 @@
 #define IVPU_HW_IP_50XX 50
 #define IVPU_HW_IP_60XX 60
 
+#define IVPU_HW_IP_REV_LNL_B0 4
+
 #define IVPU_HW_BTRS_MTL 1
 #define IVPU_HW_BTRS_LNL 2
 
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index daf1e4afb479..09398a17c710 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -61,7 +61,8 @@ static void wa_init(struct ivpu_device *vdev)
 	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
 		vdev->wa.interrupt_clear_with_0 = ivpu_hw_btrs_irqs_clear_with_0_mtl(vdev);
 
-	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_LNL)
+	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_LNL &&
+	    ivpu_revision(vdev) < IVPU_HW_IP_REV_LNL_B0)
 		vdev->wa.disable_clock_relinquish = true;
 
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
-- 
2.45.1

