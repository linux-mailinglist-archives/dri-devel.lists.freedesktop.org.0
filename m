Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E845A08105
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A710EFB9;
	Thu,  9 Jan 2025 20:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/2NyCFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1B610EFBA;
 Thu,  9 Jan 2025 20:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452865; x=1767988865;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fNgbONyYUduk/i9ngG+NkXc4+30szMNcWEM/3Cor0DM=;
 b=n/2NyCFlqkds8AIETlSw5RNonYxj1UMFlmQrIizHBE0YOKyPL4teIl+9
 YEwCmMn2vmkGiA7sHAyLJsUr/+nVffF9fRz2FfGNl20PuAUNU+iAUMiJG
 yg/6zCscw0g40KRPRNTzZwoUpXCaaeiooBYSYBp1QX16QmJNu3s7SE8jL
 I57DFIGfIMApn7o8xr+jtTlEuEaueZweKqXnRy34724swRr+uHKG0cBA3
 ZpCxriIhHq7g5uEYrS+MkPGcvcXIpOGCR8uOQICpPnbdxhD1B5/JPDDCA
 2X4hHxdL8E/Ft5sU0TbMShPed6SdOgJH1soA2QUKbmju1PhRLWKwJqmJg A==;
X-CSE-ConnectionGUID: hJccpUl0TxSR+cufrfhfvg==
X-CSE-MsgGUID: apwOuJy9Rw6GuJtClk7QFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619199"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:05 -0800
X-CSE-ConnectionGUID: FzBs48VZRFO2cxa0wv+Tzw==
X-CSE-MsgGUID: Gta+wSYSQRuomqoAgeIWDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798635"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:02 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:33 +0530
Subject: [PATCH v7 05/14] drm/i915/histogram: Define registers for
 histogram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-dpst-v7-5-605cb0271162@intel.com>
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

Add the register/bit definitions for global histogram.

v2: Intended the register contents, removed unused regs (Jani)

Bspec: 4270
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_histogram_regs.h    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
new file mode 100644
index 0000000000000000000000000000000000000000..1252b4f339a63f70f44e249bdeae87805bee20fc
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

