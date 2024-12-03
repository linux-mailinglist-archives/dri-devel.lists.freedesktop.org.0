Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C752A9E1316
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 07:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2E110E8FF;
	Tue,  3 Dec 2024 06:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORAbOoqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4B610E8FB;
 Tue,  3 Dec 2024 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733205908; x=1764741908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sb167tBYI4JWh1IzbJJ4LdgbutLEO/4AwBeXAVCEKCs=;
 b=ORAbOoqAXpt4UMcV12W7MllnXrkX3stiFVHDSpdlD/3hNZCwyIzE8Rim
 znzKU6C8rGOayj+irD11urpCtk5i6Usa55b9v3sX8yT82VmJ/KJu1sCs4
 8sdDopfftnlBTNfVC6Tccps/8W2WbJ8ezYi1Xqc8sCQZ767SW9AeEoSkk
 eDHXs4k/gFPWn8XPqZuq0ggdvahUsTswbdvDOhxH7YvaxnJ/fWWqnd37X
 84d3f3uVWqD3oc0ygT8yzMCrnR311+OpQejwQ9Dcxv6tTo8+ydwSlMAb0
 ZquCVtgKGyImAghyp03EzoKyl9AH6Q1PZF+bKekuGhVw5uA0scUu+sQ5e A==;
X-CSE-ConnectionGUID: ge5M6IsHQ3iZKpEPeNK7iQ==
X-CSE-MsgGUID: WaFN9R5TQmOzj0jZs3t0og==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37058849"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37058849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:05:08 -0800
X-CSE-ConnectionGUID: kdsEgC4+S96oqjruul8/ZQ==
X-CSE-MsgGUID: lv0urCG+Q0mrXJWHu/FzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="124163842"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 22:05:07 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCHv2 03/10] drm/i915/histogram: Define registers for histogram
Date: Tue,  3 Dec 2024 11:25:13 +0530
Message-Id: <20241203055520.1704661-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203055520.1704661-1-arun.r.murthy@intel.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the register/bit definitions for global histogram.

v2: Intended the register contents, removed unused regs (Jani)

Bspec: 4270
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../drm/i915/display/intel_histogram_regs.h   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
new file mode 100644
index 000000000000..1252b4f339a6
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_HISTOGRAM_REGS_H__
+#define __INTEL_HISTOGRAM_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* GLOBAL_HIST related registers */
+#define _DPST_CTL_A					0x490C0
+#define _DPST_CTL_B					0x491C0
+#define DPST_CTL(pipe)					_MMIO_PIPE(pipe, _DPST_CTL_A, _DPST_CTL_B)
+#define  DPST_CTL_IE_HIST_EN				REG_BIT(31)
+#define  DPST_CTL_RESTORE				REG_BIT(28)
+#define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
+#define  DPST_CTL_HIST_MODE				REG_BIT(24)
+#define  DPST_CTL_ENHANCEMENT_MODE_MASK			REG_GENMASK(14, 13)
+#define  DPST_CTL_EN_MULTIPLICATIVE			REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
+#define  DPST_CTL_BIN_REG_FUNC_SEL			REG_BIT(11)
+#define  DPST_CTL_BIN_REG_FUNC_TC			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 0)
+#define  DPST_CTL_BIN_REG_FUNC_IE			REG_FIELD_PREP(DPST_CTL_BIN_REG_FUNC_SEL, 1)
+#define  DPST_CTL_BIN_REG_MASK				REG_GENMASK(6, 0)
+#define  DPST_CTL_BIN_REG_CLEAR				REG_FIELD_PREP(DPST_CTL_BIN_REG_MASK, 0)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_2INT_8FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 1)
+#define  DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC	REG_FIELD_PREP(DPST_CTL_IE_TABLE_VALUE_FORMAT, 0)
+#define  DPST_CTL_HIST_MODE_YUV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 0)
+#define  DPST_CTL_HIST_MODE_HSV				REG_FIELD_PREP(DPST_CTL_HIST_MODE, 1)
+
+#define _DPST_GUARD_A					0x490C8
+#define _DPST_GUARD_B					0x491C8
+#define DPST_GUARD(pipe)				_MMIO_PIPE(pipe, _DPST_GUARD_A, _DPST_GUARD_B)
+#define  DPST_GUARD_HIST_INT_EN				REG_BIT(31)
+#define  DPST_GUARD_HIST_EVENT_STATUS			REG_BIT(30)
+#define  DPST_GUARD_INTERRUPT_DELAY_MASK			REG_GENMASK(29, 22)
+#define  DPST_GUARD_INTERRUPT_DELAY(val)			REG_FIELD_PREP(DPST_GUARD_INTERRUPT_DELAY_MASK, val)
+#define  DPST_GUARD_THRESHOLD_GB_MASK			REG_GENMASK(21, 0)
+#define  DPST_GUARD_THRESHOLD_GB(val)			REG_FIELD_PREP(DPST_GUARD_THRESHOLD_GB_MASK, val)
+
+#define _DPST_BIN_A					0x490C4
+#define _DPST_BIN_B					0x491C4
+#define DPST_BIN(pipe)					_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
+#define  DPST_BIN_DATA_MASK				REG_GENMASK(23, 0)
+#define  DPST_BIN_BUSY					REG_BIT(31)
+
+#endif /* __INTEL_HISTOGRAM_REGS_H__ */
-- 
2.25.1

