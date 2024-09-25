Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B842E9862FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED110EA4C;
	Wed, 25 Sep 2024 15:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bo2pTFai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFF310EA3A;
 Wed, 25 Sep 2024 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727277493; x=1758813493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QA59+UO+MdyRDbtOwP+rkBj1Gex0ZBLsgB22/MeQDyM=;
 b=Bo2pTFai3+ZjJkNTxC3uVpDpeI8PIQ068HDzG+7mbix0VxsbiXVHkOQ5
 uvO/Sb4rAgsbCAnwZfiJk1jPwsVV3CCksKSFZbL/YZ3L5ZCH1phO0okDN
 d51tZS1UxW1cl93sAs2zMGf2rXkoICKviIlngDzs9UHfHLskSuEg/TH2Z
 BWsYG7eJzixARoCjKk7GKOdmUROkBaJbIVRRB6bz8d2/1zAIQcYyH5qv7
 c1Z4KtY6LrP3pAZF05ZvYxnyhW+0YE+z2RpXqXbajLQMBo/aFE901Yszm
 bdhBh0vgB2vwXQlUs+9jQA9UrqsKjcv9/vvKNKS08hMHfUkGOnbSwydxd A==;
X-CSE-ConnectionGUID: MKJIol9KTxK8Co+EfohWgw==
X-CSE-MsgGUID: 3aSQODhlQTqskzqQFICZgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48866908"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48866908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:17:59 -0700
X-CSE-ConnectionGUID: 2OjjlNnFSJO0KlAoFQE4+A==
X-CSE-MsgGUID: QuKFel8oTZ25m4WOZPcMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76612954"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 08:17:56 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 6/7] drm/i915/histogram: histogram delay counter doesnt reset
Date: Wed, 25 Sep 2024 20:37:53 +0530
Message-Id: <20240925150754.1876893-7-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925150754.1876893-1-arun.r.murthy@intel.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
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
Wa: 14014889975

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c  | 17 +++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram_reg.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 72e9cb5156a0..f776d87dfca0 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -74,6 +74,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 	struct intel_display *display = to_intel_display(intel_crtc);
 	char *histogram_event[] = {"HISTOGRAM=1", NULL};
 
+	/* Wa: 14014889975 */
+	if (IS_DISPLAY_VER(display, 12, 13))
+		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
+			     DPST_CTL_RESTORE, 0);
+
 	/*
 	 * TODO: PSR to be exited while reading the Histogram data
 	 * Set DPST_CTL Bin Reg function select to TC
@@ -94,6 +99,12 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
 				"sending HISTOGRAM event failed\n");
 	}
 
+	/* Wa: 14014889975 */
+	if (IS_DISPLAY_VER(display, 12, 13))
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */
+		intel_de_write(display, DPST_CTL(intel_crtc->pipe), intel_de_read(display,
+			       DPST_CTL(intel_crtc->pipe)) | DPST_CTL_RESTORE);
+
 	/* Enable histogram interrupt */
 	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe), DPST_GUARD_HIST_INT_EN,
 		     DPST_GUARD_HIST_INT_EN);
@@ -232,6 +243,12 @@ int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data)
 		return -EINVAL;
 	}
 
+	/* Wa: 14014889975 */
+	if (IS_DISPLAY_VER(display, 12, 13))
+		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt Delay Counter(bit 23:16) */
+		intel_de_write(display, DPST_CTL(intel_crtc->pipe), intel_de_read(display,
+			       DPST_CTL(intel_crtc->pipe)) | DPST_CTL_RESTORE);
+
 	/*
 	 * Set DPST_CTL Bin Reg function select to IE
 	 * Set DPST_CTL Bin Register Index to 0
diff --git a/drivers/gpu/drm/i915/display/intel_histogram_reg.h b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
index ed8f22aa8e75..ac392ed47463 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram_reg.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram_reg.h
@@ -16,6 +16,7 @@
 #define DPST_CTL_RESTORE				REG_BIT(28)
 #define DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
 #define DPST_CTL_HIST_MODE				REG_BIT(24)
+#define DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT		REG_GENMASK(23, 16)
 #define DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
 #define DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
 #define DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
-- 
2.25.1

