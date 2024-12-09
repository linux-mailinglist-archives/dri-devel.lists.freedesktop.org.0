Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109129E9BD0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216010E4F3;
	Mon,  9 Dec 2024 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNm37ae3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990D210E4EA;
 Mon,  9 Dec 2024 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762104; x=1765298104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QkeKg5OGIv7MEk/nJfgP2v+7Bkem4NU0C3pXe9YC5mo=;
 b=DNm37ae3zFTgwmsoYT+leAJeDBE2KLjwsjyp41h2qwaWCP5L2RQFhRsv
 FJmtrjfKL6w7o0fQO5r4tyWK82UYNdzqyCYktwM7lMjzi8nudwWreU7Bz
 cl5VsLZwop31m1VvhXnvKeihxJ8m/0wmorXFdycevY2LN//XvsDXQbxZR
 +3TzQL14SaOct3lUwKrfrvhiQBmKO6GrEq72NrebIMXl7AC/PV0lx4lHY
 aaIyj+WjYhVSdSNIG5K5/ofAMMmbj6rDpQSnWBiT8mLUm7oZJoe8dtVEy
 tExlKBzPxFOQwPqGbnbXGnJ/31bxkdRX1mCzfJnRlM+QImCN38/DMSc8h g==;
X-CSE-ConnectionGUID: maHmW5ZzRXS+Teayys2o/g==
X-CSE-MsgGUID: fCVIJGvvQjO097m8POImJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551678"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551678"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:35:04 -0800
X-CSE-ConnectionGUID: PTXiLz8jSNqdamQyFox2Vg==
X-CSE-MsgGUID: /QCM9G+cS36Wc9TXyLnN3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371756"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:35:02 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/10] drm/i915/histogram: histogram delay counter doesnt reset
Date: Mon,  9 Dec 2024 21:55:02 +0530
Message-Id: <20241209162504.2146697-9-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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
 drivers/gpu/drm/i915/display/intel_histogram.c     | 14 ++++++++++++++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 29e7bd928c9b..39d96c86bb89 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -59,6 +59,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
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
@@ -99,6 +104,15 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
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
index 1252b4f339a6..213c9f483567 100644
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

