Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7259E131F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 07:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081CA10E8FA;
	Tue,  3 Dec 2024 06:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V82Pm5k0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C5510E90E;
 Tue,  3 Dec 2024 06:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733205918; x=1764741918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qbWH9TCYiUD5So5XSp3fosO3QPyS+tOV6J2XW6u8+8Q=;
 b=V82Pm5k0zpWqlF5JOFp15daRbthmOaS/OxVOoWf//enqwGhFI4BQgzys
 5DtBzAQ/I12w7SE++dNXiGxe1IBkkMPAexnNIOsPdXBNJYw2Iga+IR6uV
 uvWR3K6Rt4R72o+8+V64YzHU9kUsQgcoirjf4qD2mtCdvqltD6U//MDx/
 1l+0t6h3VcCo+9mfA9leMfjJQK7xPkNSyj2bX7jmwnhLq2q/jUDxrcN5y
 MyzZOkBTZiIreM2ryvbVygcGv5KwJgZ0yGjU6IcOl5YJr9nu0CDgXJBDQ
 QAf6SalLjZxtQdFxXLrLG+uMTpQIQsc0i65ZZVmDe4Sa0ro+DBF9wLvDQ A==;
X-CSE-ConnectionGUID: PwVwjex7TgK7SXANKsfd8A==
X-CSE-MsgGUID: BwGMLYPGTv25apFGvpJDIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37058864"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37058864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:05:18 -0800
X-CSE-ConnectionGUID: 8T6uPJJuQyeVmUBgxibcmg==
X-CSE-MsgGUID: bB9zCtC3QLasALUKdWYYKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="124163885"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 22:05:17 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 08/10] drm/i915/histogram: histogram delay counter doesnt
 reset
Date: Tue,  3 Dec 2024 11:25:18 +0530
Message-Id: <20241203055520.1704661-9-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203055520.1704661-1-arun.r.murthy@intel.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_histogram.c     | 14 ++++++++++++++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index 8f25cfe00ba5..66006b75efaa 100644
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
@@ -101,6 +106,15 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
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

