Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4EA08112
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB210EFDA;
	Thu,  9 Jan 2025 20:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqIjjoDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2622A10EFD1;
 Thu,  9 Jan 2025 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452890; x=1767988890;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=H1oSwrcyc7yz458vGQJiR9oHN/+RIApoZWwtCbdIt0c=;
 b=HqIjjoDj/2BrTtHrfltF8lVC940T6yoBfsxM0a7CKFZEpxzTjqkNf5Sz
 vpX2KKdXnKMfvhqaZn/VDn47axYb2gaJFlcaf0QlrHQPj7npi5aPRTnUp
 dH9g1/ksGPvnm3x0lcBukNFiexLsp5BW4suKIoet4XVpDRxns2cRrfZRv
 BH/Yv4UYLFh4OjucR/aKZsBpI0SjREZs3bYwzY4jdqlYBcqA/6QNR4Ubb
 ihNntJt80zwy6sXrHQGsTFDEdEzUMxb4XxxYEpPJJqFHELpzBQL1m02hl
 SL5WxlHOI4uCfvkKdIo2FDLJV60MkhcnJ3kukuYDxYINDoqH/SzdZJTxi A==;
X-CSE-ConnectionGUID: 11jsyThURAWHUTy0XvlDkQ==
X-CSE-MsgGUID: uCv7DZd8Q5q2n7oyZEC8AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619302"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:28 -0800
X-CSE-ConnectionGUID: WpbhJktbR6aGMM1/0pA0+g==
X-CSE-MsgGUID: Z9ZVhmg0TnSHKF1m9cB7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798697"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:25 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:40 +0530
Subject: [PATCH v7 12/14] drm/i915/histogram: histogram delay counter
 doesnt reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-12-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

The delay counter for histogram does not reset and as a result the
histogram bin never gets updated. Workaround would be to use save and
restore histogram register.

v2: Follow the seq in interrupt handler
	Restore DPST bit 0
	read/write dpst ctl rg
	Restore DPST bit 1 and Guardband Delay Interrupt counter = 0
	(Suraj)
v3: updated wa version for display 13 and 14

Wa: 14014889975
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c      | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram_regs.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 499ea9157a338f5081c74dfc182371b2075634ea..039ca16023b1d56c0f1f91d3a1d8ed440e4ea675 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -52,6 +52,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	snprintf(pipe_id, sizeof(pipe_id),
 		 "PIPE=%u", intel_crtc->base.base.id);
 
+	/* Wa: 14014889975 */
+	if (IS_DISPLAY_VER(display, 13, 14))
+		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
+			     DPST_CTL_RESTORE, 0);
+
 	/*
 	 * TODO: PSR to be exited while reading the Histogram data
 	 * Set DPST_CTL Bin Reg function select to TC
@@ -93,6 +98,15 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 		return;
 	}
 
+	/* Wa: 14014889975 */
+	if (IS_DISPLAY_VER(display, 13, 14))
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */
+		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
+			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT |
+			     DPST_CTL_RESTORE,
+			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY(0x0) |
+			     DPST_CTL_RESTORE);
+
 	/* Enable histogram interrupt */
 	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe), DPST_GUARD_HIST_INT_EN,
 		     DPST_GUARD_HIST_INT_EN);
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
index 1252b4f339a63f70f44e249bdeae87805bee20fc..213c9f483567cb19a47b44953749f6baf0afe9e7 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -16,6 +16,8 @@
 #define  DPST_CTL_RESTORE				REG_BIT(28)
 #define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
 #define  DPST_CTL_HIST_MODE				REG_BIT(24)
+#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT		REG_GENMASK(23, 16)
+#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY(val)	REG_FIELD_PREP(DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT, val)
 #define  DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
 #define  DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
 #define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)

-- 
2.25.1

