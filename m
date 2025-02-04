Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29FBA26D87
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCE510E5B7;
	Tue,  4 Feb 2025 08:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ek58CKGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467010E5B8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658796; x=1770194796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwPa64ROmLN8hzng7S4FPqAmcosL1sxgJ9rXWkLN3og=;
 b=Ek58CKGARXF2GXlSfam14VOpOQS0Rod+/dyhtOlIwnGBFa0O6gYhyOg4
 nKS3JH3kGhuwU0v/LkDUh/deNnc6nNwAIC9fxRD4MLwW1k7wQgtX9kYQN
 dg92XIwNxbi9kySSJd5DuIQ8OQm3URwqqUItBtyQbm6pTpVMWBgYMPTjx
 PrPlpeNKr8YTRO6ZZWsAWfxAXYKj91CzfbBITLU2NPlz+sPPVeRcvCEHW
 NoG8BA7Mz/pKxZsDpeSm1F9uEOxdqO4UcNHCGeKn0aTYV0rLf3DAqG2R1
 oBCNNSD0DwN0AZZQxrdlSDiTnbli00EOP5Ty80gqlMYkwlv0p47PitxWc Q==;
X-CSE-ConnectionGUID: zy27DoMGTqu3TJN/gZfCDA==
X-CSE-MsgGUID: n+PZnck7QpOGxuAwgmSCdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39434741"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39434741"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:36 -0800
X-CSE-ConnectionGUID: 1j0RQfO8RZSEuqnzNILEmA==
X-CSE-MsgGUID: gm0P9nbxSQCE/mVC0lLarw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="115531610"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:46:34 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 5/6] accel/ivpu: Add test modes to toggle clock relinquish
 disable
Date: Tue,  4 Feb 2025 09:46:21 +0100
Message-ID: <20250204084622.2422544-6-jacek.lawrynowicz@linux.intel.com>
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

Add IVPU_TEST_MODE_CLK_RELINQ_[DISABLE|ENABLE] that overrides
workaround for disabling clock relinquish for testing purposes.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h | 2 ++
 drivers/accel/ivpu/ivpu_hw.c  | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index ca21102ca366c..73d808068c8b7 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -206,6 +206,8 @@ extern bool ivpu_force_snoop;
 #define IVPU_TEST_MODE_MIP_DISABLE        BIT(6)
 #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
 #define IVPU_TEST_MODE_TURBO		  BIT(9)
+#define IVPU_TEST_MODE_CLK_RELINQ_DISABLE BIT(10)
+#define IVPU_TEST_MODE_CLK_RELINQ_ENABLE  BIT(11)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index f31702b3ecbdc..4d9f30e3b505d 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -68,6 +68,12 @@ static void wa_init(struct ivpu_device *vdev)
 	    ivpu_revision(vdev) < IVPU_HW_IP_REV_LNL_B0)
 		vdev->wa.disable_clock_relinquish = true;
 
+	if (ivpu_test_mode & IVPU_TEST_MODE_CLK_RELINQ_ENABLE)
+		vdev->wa.disable_clock_relinquish = false;
+
+	if (ivpu_test_mode & IVPU_TEST_MODE_CLK_RELINQ_DISABLE)
+		vdev->wa.disable_clock_relinquish = true;
+
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
 		vdev->wa.wp0_during_power_up = true;
 
-- 
2.45.1

