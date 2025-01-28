Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E91A20DFA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A269A10E6B3;
	Tue, 28 Jan 2025 16:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZAzASAc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5577110E6BE;
 Tue, 28 Jan 2025 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080384; x=1769616384;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=S3tCtPwDyTrwZ4hW+8pXWh+mAnLjcAgep9k6JveBlI0=;
 b=kZAzASAcrTqPWdjvvNxyrgNe1sm6MzavdHPU8+DRxiQOkJYDfL5TAsC2
 MAYMvlTQpyEaD8OGv8cZqcl+IwBdSuuYQ5zUQ/WTgN8R8KucaabJvOvXt
 n2MBHjA4FcCjdvJpj2EavPGvhYj1Qk4pVRBlvuLagb1ScS/bzN/4XUg1Y
 yhQ2P4W+yWsO66Sdyh5BVBwqE45jbP22bM0FDPHHhF/EiRlatPgRE8mt2
 gI3dzjtLCj/3mCJsVpsOXzF7Aiv6wY/T5Hqp4iFpbOifymXW4CCDU6YhH
 jQ+sFrAsxE/BTH/PzFlT9f+BcsmRZVCDeMacL7VpcbTkmjOUjR2wLl2Zw Q==;
X-CSE-ConnectionGUID: E95/aH4tRj+RzJ7D1V7sqw==
X-CSE-MsgGUID: /1U//4gISUu8Cr8wqdxtbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745063"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:24 -0800
X-CSE-ConnectionGUID: un3bJSB9RW6s1zoio1Fgrw==
X-CSE-MsgGUID: ow/6p6DoSOqydWmv3vzlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145977020"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:21 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:18 +0530
Subject: [PATCH v8 12/14] drm/i915/histogram: histogram delay counter
 doesnt reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-12-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
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
index aa02e7ce42b930a858de4ad7e0d39d93fa7d4298..dd4ab30795df48011013c019d7525e046cdd5404 100644
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

