Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF1725AF3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738A10E4A5;
	Wed,  7 Jun 2023 09:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133F10E4A5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686131107; x=1717667107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eo4V2SP+B9kF2vMf6cUc/Ehf7CKZGRtQ1T1e6fvM2Pw=;
 b=BB/ClmGWkwjObzT7e1MngE0lhUV8Or54aiZ58PX1dg76/sl4i5NtS6bs
 1k7BDCvp0Q5RnXo20TexJXrcoY8N1pfAuY2sANZzohPc75hl87+E8Q7ql
 PEugjsixEiSSXU7aqwP/jShuK20IENFPVrVcZhBYfmao64ex3PqjFiFYJ
 mJ10ErMo7zJl/jj4ZvxhTNSs7wnoi+EpfompOuquoQA80lMmTrvsIG4WG
 pyl2Pu3E8xx1qLoI6m7S68Mhhg4R+Pa/oFH8e/IRmzP4oIrWf2B0O3mk+
 h+yx6sCT5W0agsRPL+7kHAzkn1eJRivdJL5Oi7CMy83TUZUujjTP4Stho Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336564976"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="336564976"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774447529"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="774447529"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:45:04 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Fix sporadic VPU boot failure
Date: Wed,  7 Jun 2023 11:45:02 +0200
Message-Id: <20230607094502.388489-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

Wait for AON bit in HOST_SS_CPR_RST_CLR to return 0 before
starting VPUIP power up sequence, otherwise the VPU device
may sporadically fail to boot.

An error in power up sequence is propagated to the runtime
power management - the device will be in an error state
until the VPU driver is reloaded.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Cc: stable@vger.kernel.org # 6.3.x
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c     | 13 ++++++++++++-
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 382ec127be8e..efae679d7b7a 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -197,6 +197,11 @@ static void ivpu_pll_init_frequency_ratios(struct ivpu_device *vdev)
 	hw->pll.pn_ratio = clamp_t(u8, fuse_pn_ratio, hw->pll.min_ratio, hw->pll.max_ratio);
 }
 
+static int ivpu_hw_mtl_wait_for_vpuip_bar(struct ivpu_device *vdev)
+{
+	return REGV_POLL_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, AON, 0, 100);
+}
+
 static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
@@ -239,6 +244,12 @@ static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
 			ivpu_err(vdev, "Timed out waiting for PLL ready status\n");
 			return ret;
 		}
+
+		ret = ivpu_hw_mtl_wait_for_vpuip_bar(vdev);
+		if (ret) {
+			ivpu_err(vdev, "Timed out waiting for VPUIP bar\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -256,7 +267,7 @@ static int ivpu_pll_disable(struct ivpu_device *vdev)
 
 static void ivpu_boot_host_ss_rst_clr_assert(struct ivpu_device *vdev)
 {
-	u32 val = REGV_RD32(MTL_VPU_HOST_SS_CPR_RST_CLR);
+	u32 val = 0;
 
 	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, TOP_NOC, val);
 	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, DSS_MAS, val);
diff --git a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h b/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
index d83ccfd9a871..593b8ff07417 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_mtl_reg.h
@@ -91,6 +91,7 @@
 #define MTL_VPU_HOST_SS_CPR_RST_SET_MSS_MAS_MASK			BIT_MASK(11)
 
 #define MTL_VPU_HOST_SS_CPR_RST_CLR					0x00000098u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_AON_MASK				BIT_MASK(0)
 #define MTL_VPU_HOST_SS_CPR_RST_CLR_TOP_NOC_MASK			BIT_MASK(1)
 #define MTL_VPU_HOST_SS_CPR_RST_CLR_DSS_MAS_MASK			BIT_MASK(10)
 #define MTL_VPU_HOST_SS_CPR_RST_CLR_MSS_MAS_MASK			BIT_MASK(11)
-- 
2.25.1

