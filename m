Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A16C4618
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B43E10E8DD;
	Wed, 22 Mar 2023 09:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B4A10E8D8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476777; x=1711012777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfco+ENYd8C959t0uV6IkRwnEY3ulR1Rl4Rk0Fflxyk=;
 b=RwBLPDvPCtYOT1v14nfSM5JHHx5pJspa+sjodJfi032fkdDBqB9TEECI
 irJFwvOMy9nyp8NJM+d7YV1TqhufeFL1Dl1kW7Ly5x9knZDiF194iBnAe
 yxcCm4eIvDrNH/tF49Bp3qTliKmgZw0hHPJS7uqHquCLjt73vhFBvF+VH
 GdcTLhnIsZRbBavzDLVvsq4P7mVVHBY1ULnjl9tWOzoQLeaff9HQk8nz8
 h5dUZUiSK5qWmUKl8L3tsMmhFlUd56o/MURnmLF3ruWkqJp0L/wO12ET0
 /ehUop1DgFmgkjKB1RuUkbMOpy4skw4jcnhcpoUsfjy4wJD/dwtRsXIUv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904365"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904365"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229866"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229866"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:36 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] accel/ivpu: Fix VPU clock calculation
Date: Wed, 22 Mar 2023 10:19:00 +0100
Message-Id: <20230322091900.1982453-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VPU cpu clock frequency depends on the workpoint configuration
that was granted by the punit. Previously driver was passing
incorrect frequency to the VPU firmware.

Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 98c8a4aa25f0..382ec127be8e 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -29,7 +29,6 @@
 
 #define PLL_REF_CLK_FREQ	     (50 * 1000000)
 #define PLL_SIMULATION_FREQ	     (10 * 1000000)
-#define PLL_RATIO_TO_FREQ(x)	     ((x) * PLL_REF_CLK_FREQ)
 #define PLL_DEFAULT_EPP_VALUE	     0x80
 
 #define TIM_SAFE_ENABLE		     0xf1d0dead
@@ -789,6 +788,19 @@ static void ivpu_hw_mtl_wdt_disable(struct ivpu_device *vdev)
 	REGV_WR32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, val);
 }
 
+static u32 ivpu_hw_mtl_pll_to_freq(u32 ratio, u32 config)
+{
+	u32 pll_clock = PLL_REF_CLK_FREQ * ratio;
+	u32 cpu_clock;
+
+	if ((config & 0xff) == PLL_RATIO_4_3)
+		cpu_clock = pll_clock * 2 / 4;
+	else
+		cpu_clock = pll_clock * 2 / 5;
+
+	return cpu_clock;
+}
+
 /* Register indirect accesses */
 static u32 ivpu_hw_mtl_reg_pll_freq_get(struct ivpu_device *vdev)
 {
@@ -800,7 +812,7 @@ static u32 ivpu_hw_mtl_reg_pll_freq_get(struct ivpu_device *vdev)
 	if (!ivpu_is_silicon(vdev))
 		return PLL_SIMULATION_FREQ;
 
-	return PLL_RATIO_TO_FREQ(pll_curr_ratio);
+	return ivpu_hw_mtl_pll_to_freq(pll_curr_ratio, vdev->hw->config);
 }
 
 static u32 ivpu_hw_mtl_reg_telemetry_offset_get(struct ivpu_device *vdev)
-- 
2.25.1

