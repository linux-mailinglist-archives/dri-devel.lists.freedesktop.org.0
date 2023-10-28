Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16837DA7E7
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76D710E137;
	Sat, 28 Oct 2023 16:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B5810E090
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508794; x=1730044794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KjAFh0RjmAMAo/cb/hm7iM8iF3Ui7vG2Ep1coHlOY1M=;
 b=n3rpzMzMOHFNBY9Qdbdr5C0JFjbb6jpz3d9xX5atj67As1Uub/hCCftW
 Q2xHoB+/WKwa9q3Sl9n2dFtJeNaKnjuC9dHeC2ZRI+FXcymILJrtvMTnQ
 BGfsSbDhiuctpZG4k3hoeFr8toV2osBZyf0n+XnDFTWvpePVb1ZTXXkee
 a/hbNafI774y2JGhiORAAgGwkK1MtB2Ix8MHEtcLHnZdWf6H+d7PJdLEB
 86YuH4PHZ2dpSDAA72AS1TedXDy/muKqk1OIBOw21b0ZWiENYJbLbNQVj
 1NGPgVZpBcmH3W7+R89wl0FQF+O+pXE7sb4e8eeLR7MuOctf1jp2ZqEdI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152650"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152650"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516391"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516391"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:45 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] accel/ivpu: Assure device is off if power up sequence fail
Date: Sat, 28 Oct 2023 17:59:30 +0200
Message-Id: <20231028155936.1183342-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should not leave device half enabled if there is failure somewhere
it power up sequence. Fix device init and resume paths.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  2 +-
 drivers/accel/ivpu/ivpu_pm.c  | 30 +++++++++++++++++-------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 39bac45d88b5..064cabef41bb 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -543,7 +543,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	/* Power up early so the rest of init code can access VPU registers */
 	ret = ivpu_hw_power_up(vdev);
 	if (ret)
-		goto err_xa_destroy;
+		goto err_power_down;
 
 	ret = ivpu_mmu_global_context_init(vdev);
 	if (ret)
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 74688cc57583..7d17f7ea4949 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -70,27 +70,31 @@ static int ivpu_resume(struct ivpu_device *vdev)
 	ret = ivpu_hw_power_up(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
-		return ret;
+		goto err_power_down;
 	}
 
 	ret = ivpu_mmu_enable(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to resume MMU: %d\n", ret);
-		ivpu_hw_power_down(vdev);
-		return ret;
+		goto err_power_down;
 	}
 
 	ret = ivpu_boot(vdev);
-	if (ret) {
-		ivpu_mmu_disable(vdev);
-		ivpu_hw_power_down(vdev);
-		if (!ivpu_fw_is_cold_boot(vdev)) {
-			ivpu_warn(vdev, "Failed to resume the FW: %d. Retrying cold boot..\n", ret);
-			ivpu_pm_prepare_cold_boot(vdev);
-			goto retry;
-		} else {
-			ivpu_err(vdev, "Failed to resume the FW: %d\n", ret);
-		}
+	if (ret)
+		goto err_mmu_disable;
+
+	return 0;
+
+err_mmu_disable:
+	ivpu_mmu_disable(vdev);
+err_power_down:
+	ivpu_hw_power_down(vdev);
+
+	if (!ivpu_fw_is_cold_boot(vdev)) {
+		ivpu_pm_prepare_cold_boot(vdev);
+		goto retry;
+	} else {
+		ivpu_err(vdev, "Failed to resume the FW: %d\n", ret);
 	}
 
 	return ret;
-- 
2.25.1

