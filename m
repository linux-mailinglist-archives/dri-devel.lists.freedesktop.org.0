Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB199D4F04
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 15:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE3310E97E;
	Thu, 21 Nov 2024 14:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ce5dc/w4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C12410E97E;
 Thu, 21 Nov 2024 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732200573; x=1763736573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kYrnwQMPWhuhMPnAHc99QUXzbiGL9Cj0ofVC02YvZMg=;
 b=Ce5dc/w4yZ7HezlCbbyGXiOfWifWrPkA/i1liIOhbW/V+TUKd9oby6Zz
 JnSFJE8/ZEswGzS8aNWWCeFv5gJk55d46ldMP1AwnY8a4w00EJ5R4i8mc
 qkqMIo5zKG4kPQMDUuUFP9I4t+ZPt56SGuiO+1gCDlmAcfWBPQaNTk/8E
 kjeAx+SQZYMdSrIWASTg+LrW31Zc7jiVs03nLm0vhYN3TLSIloR/lN0b6
 vTSjP/8/5TywnXxe4WfqDKSkR9k/xwEdSsoEC4t5UAkw9zHnfAPF932up
 nLUW2pq5D7qBOfYJdfG6EaOxQl60hjyp1iHBNIK02vWrw9lQOsBzyX/IH Q==;
X-CSE-ConnectionGUID: LHH1CnQ5TmyaHmXg7ISyUg==
X-CSE-MsgGUID: lJV3dyi1SkKfaSFupPr5Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35177571"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="35177571"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 06:49:33 -0800
X-CSE-ConnectionGUID: CQPWcLAAQpWzzwZn2r9k/w==
X-CSE-MsgGUID: L1geZhG0ToK4YiSbrbmXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90202332"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa010.jf.intel.com with ESMTP; 21 Nov 2024 06:49:31 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 6/8] drm/i915/histogram: histogram delay counter doesnt reset
Date: Thu, 21 Nov 2024 20:09:48 +0530
Message-Id: <20241121143949.748980-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121143949.748980-1-arun.r.murthy@intel.com>
References: <20241121143949.748980-1-arun.r.murthy@intel.com>
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
index add303df21d5..7b27c7227a8a 100644
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
@@ -86,6 +91,15 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
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

