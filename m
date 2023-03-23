Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABF6C68F3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C023210E7E4;
	Thu, 23 Mar 2023 12:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4EB10E7E4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576143; x=1711112143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rtry40K/oOutzMIOKnbjgiZvCJrbQWE8MR4qSVu7qso=;
 b=PBI3I6g3C7auTvXkmcGwOOBR0NMPR0dGo5JwCggtdvzbkyfps+Eln2Nk
 SA1zAXO4kJ1TeqP7+IWKoLNUSMCIF6FxwJRV2vGSM+k0ZDuPSI+UHlULF
 bGYKDvH0sWfW37qQAG0CZnSfwmsVXYqpTi8U+PCrgwOnbNVZf66liqWaW
 BAuae+/84/pYIGhL1tHDrDyN/ChqwnSTMk8EgyT9aPbGPTQ+3XJ9g9sJN
 ED2+VEDi7l+/9FgnmpSnj0TQglr+vQmJNX7grZpnI5Z2Cdx8bs5cw5yqU
 9M343ybCHq+fgTY78z/tDcblQEGONk34r+S7CCvtRAiFrnyVHI0qW/64W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336982591"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336982591"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="793010864"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="793010864"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:35 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] accel/ivpu: Fix VPU clock calculation
Date: Thu, 23 Mar 2023 13:55:03 +0100
Message-Id: <20230323125504.2586442-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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

The driver calculates the wrong frequency because it ignores
the workpoint config and this cause undesired power/performance
characteristics. Fix this by using the workpoint config in
the freq calculations.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
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

