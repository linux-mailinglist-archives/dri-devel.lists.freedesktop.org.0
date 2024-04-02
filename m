Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299178950CB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5F110FC4D;
	Tue,  2 Apr 2024 10:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXpEDWed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35F610FC47
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055016; x=1743591016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cl/Ll5zdwKjg2SJbM46mMQgW9zJsaGI+yiH8oBrZcas=;
 b=fXpEDWedudeGUJHeWIFaFhcKQVMcwPM8hRKS8pylgtDhsntQF4ZnnDON
 SZoWxN7CJEe4foEbwOC0DXg0l7JVZchMKIVOMSp676ub1eblLGZSvR6Gk
 qg0blHhwJ58RpqqidxWX+s/Dh8+llRJAdWQsZiLmap0YKH7ZPgOosqMQK
 6qc5aBB3ZybFQgoZrvyQR0olFAUq6UN0wsoLxQO1pgYJr/v2lrpxFIURh
 H02SkwlkIe+QTRj8rIdMiGR+oHG74zn6+miTLkGTv/RpWIt25f97iUkX/
 ex8JngCHx+4wHlbB9VT6fP54F+1tp610xapWDIFinljedlQriNAVkT5h9 A==;
X-CSE-ConnectionGUID: zoO4MfvMRoacKqugtjZCyQ==
X-CSE-MsgGUID: EBTcU6LhRQK7P2ghgMN1SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944449"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002524"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:14 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 6/8] accel/ivpu: Return max freq for
 DRM_IVPU_PARAM_CORE_CLOCK_RATE
Date: Tue,  2 Apr 2024 12:49:27 +0200
Message-ID: <20240402104929.941186-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

DRM_IVPU_PARAM_CORE_CLOCK_RATE returned current NPU frequency which
could be 0 if device was sleeping. This value wasn't really useful to
the user space, so return max freq instead which can be used to estimate
NPU performance.

Fixes: c39dc15191c4 ("accel/ivpu: Read clock rate only if device is up")
Cc: <stable@vger.kernel.org> # v6.7
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     | 18 +-----------------
 drivers/accel/ivpu/ivpu_hw.h      |  6 ++++++
 drivers/accel/ivpu/ivpu_hw_37xx.c |  7 ++++---
 drivers/accel/ivpu/ivpu_hw_40xx.c |  6 ++++++
 4 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 303d92753387..77283daaedd1 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -131,22 +131,6 @@ static int ivpu_get_capabilities(struct ivpu_device *vdev, struct drm_ivpu_param
 	return 0;
 }
 
-static int ivpu_get_core_clock_rate(struct ivpu_device *vdev, u64 *clk_rate)
-{
-	int ret;
-
-	ret = ivpu_rpm_get_if_active(vdev);
-	if (ret < 0)
-		return ret;
-
-	*clk_rate = ret ? ivpu_hw_reg_pll_freq_get(vdev) : 0;
-
-	if (ret)
-		ivpu_rpm_put(vdev);
-
-	return 0;
-}
-
 static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
@@ -170,7 +154,7 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 		args->value = vdev->platform;
 		break;
 	case DRM_IVPU_PARAM_CORE_CLOCK_RATE:
-		ret = ivpu_get_core_clock_rate(vdev, &args->value);
+		args->value = ivpu_hw_ratio_to_freq(vdev, vdev->hw->pll.max_ratio);
 		break;
 	case DRM_IVPU_PARAM_NUM_CONTEXTS:
 		args->value = ivpu_get_context_count(vdev);
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index b2909168a0a6..094c659d2800 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -21,6 +21,7 @@ struct ivpu_hw_ops {
 	u32 (*profiling_freq_get)(struct ivpu_device *vdev);
 	void (*profiling_freq_drive)(struct ivpu_device *vdev, bool enable);
 	u32 (*reg_pll_freq_get)(struct ivpu_device *vdev);
+	u32 (*ratio_to_freq)(struct ivpu_device *vdev, u32 ratio);
 	u32 (*reg_telemetry_offset_get)(struct ivpu_device *vdev);
 	u32 (*reg_telemetry_size_get)(struct ivpu_device *vdev);
 	u32 (*reg_telemetry_enable_get)(struct ivpu_device *vdev);
@@ -130,6 +131,11 @@ static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
 	return vdev->hw->ops->reg_pll_freq_get(vdev);
 };
 
+static inline u32 ivpu_hw_ratio_to_freq(struct ivpu_device *vdev, u32 ratio)
+{
+	return vdev->hw->ops->ratio_to_freq(vdev, ratio);
+}
+
 static inline u32 ivpu_hw_reg_telemetry_offset_get(struct ivpu_device *vdev)
 {
 	return vdev->hw->ops->reg_telemetry_offset_get(vdev);
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 5e2865f9f7d6..bd25e2d9fb0f 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -803,12 +803,12 @@ static void ivpu_hw_37xx_profiling_freq_drive(struct ivpu_device *vdev, bool ena
 	/* Profiling freq - is a debug feature. Unavailable on VPU 37XX. */
 }
 
-static u32 ivpu_hw_37xx_pll_to_freq(u32 ratio, u32 config)
+static u32 ivpu_hw_37xx_ratio_to_freq(struct ivpu_device *vdev, u32 ratio)
 {
 	u32 pll_clock = PLL_REF_CLK_FREQ * ratio;
 	u32 cpu_clock;
 
-	if ((config & 0xff) == PLL_RATIO_4_3)
+	if ((vdev->hw->config & 0xff) == PLL_RATIO_4_3)
 		cpu_clock = pll_clock * 2 / 4;
 	else
 		cpu_clock = pll_clock * 2 / 5;
@@ -827,7 +827,7 @@ static u32 ivpu_hw_37xx_reg_pll_freq_get(struct ivpu_device *vdev)
 	if (!ivpu_is_silicon(vdev))
 		return PLL_SIMULATION_FREQ;
 
-	return ivpu_hw_37xx_pll_to_freq(pll_curr_ratio, vdev->hw->config);
+	return ivpu_hw_37xx_ratio_to_freq(vdev, pll_curr_ratio);
 }
 
 static u32 ivpu_hw_37xx_reg_telemetry_offset_get(struct ivpu_device *vdev)
@@ -1050,6 +1050,7 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
 	.profiling_freq_get = ivpu_hw_37xx_profiling_freq_get,
 	.profiling_freq_drive = ivpu_hw_37xx_profiling_freq_drive,
 	.reg_pll_freq_get = ivpu_hw_37xx_reg_pll_freq_get,
+	.ratio_to_freq = ivpu_hw_37xx_ratio_to_freq,
 	.reg_telemetry_offset_get = ivpu_hw_37xx_reg_telemetry_offset_get,
 	.reg_telemetry_size_get = ivpu_hw_37xx_reg_telemetry_size_get,
 	.reg_telemetry_enable_get = ivpu_hw_37xx_reg_telemetry_enable_get,
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index e4eddbf5d11c..b0b88d4c8926 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -980,6 +980,11 @@ static u32 ivpu_hw_40xx_reg_pll_freq_get(struct ivpu_device *vdev)
 	return PLL_RATIO_TO_FREQ(pll_curr_ratio);
 }
 
+static u32 ivpu_hw_40xx_ratio_to_freq(struct ivpu_device *vdev, u32 ratio)
+{
+	return PLL_RATIO_TO_FREQ(ratio);
+}
+
 static u32 ivpu_hw_40xx_reg_telemetry_offset_get(struct ivpu_device *vdev)
 {
 	return REGB_RD32(VPU_40XX_BUTTRESS_VPU_TELEMETRY_OFFSET);
@@ -1230,6 +1235,7 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
 	.profiling_freq_get = ivpu_hw_40xx_profiling_freq_get,
 	.profiling_freq_drive = ivpu_hw_40xx_profiling_freq_drive,
 	.reg_pll_freq_get = ivpu_hw_40xx_reg_pll_freq_get,
+	.ratio_to_freq = ivpu_hw_40xx_ratio_to_freq,
 	.reg_telemetry_offset_get = ivpu_hw_40xx_reg_telemetry_offset_get,
 	.reg_telemetry_size_get = ivpu_hw_40xx_reg_telemetry_size_get,
 	.reg_telemetry_enable_get = ivpu_hw_40xx_reg_telemetry_enable_get,
-- 
2.43.2

