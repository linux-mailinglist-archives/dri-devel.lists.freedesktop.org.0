Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB48D7B1E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FF010E28F;
	Mon,  3 Jun 2024 05:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2hfvrEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25D010E10B;
 Mon,  3 Jun 2024 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394367; x=1748930367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zvx7YA6mILM5Q3kj6RcUdUXE9siufZLnVWzoC76pFCs=;
 b=Z2hfvrEsX7/pZxLPXeRYl1/XjVkJ0Iqt/gX7yCdu6qGHPjqsLsh2jEi8
 O+ZuM4QkqxWtmcgFXiX5A8/SG9RlLrGrUBRgS3HrQBPGZvZjZmCCq/029
 qfyBjran0Br/i2buLEt/wq1wA86khWNr2rMukSBEMiqNirAfLPl5Hz0C8
 hig1N6Gij3Aap7kP0nDAb6FALIFlbZ6z86gE/RYw5OZKVhI5wJJ+z40V7
 AOzdyOWCfGCmqdrIbgNfaUV1CoxTR79WdOrDc7oafKX8L+hXMgt7oRID+
 A6Bxr+AjRiaRp9wH6qHRCB880xVpK18W8IaCGeVfslYaQurY/08z6M0Rt A==;
X-CSE-ConnectionGUID: AeujTeNqSfKEka+SDZd9nQ==
X-CSE-MsgGUID: ADM7Kz5bSkyWPVmm5XlWLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527513"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:26 -0700
X-CSE-ConnectionGUID: bixQvMbuQV2zSBkmQOLFew==
X-CSE-MsgGUID: jr6X34shSACe2S4FN7z3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616482"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 1/8] drm/i915: Separate VRR related register definitions
Date: Mon,  3 Jun 2024 11:18:57 +0530
Message-Id: <20240603054904.222589-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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

Move VRR related register definitions to a separate file called
intel_vrr_regs.h.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c      |   1 +
 drivers/gpu/drm/i915/display/intel_vrr_regs.h | 113 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               | 100 ----------------
 3 files changed, 114 insertions(+), 100 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 5f3657aa8313..871e6e6a184a 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_vrr.h"
+#include "intel_vrr_regs.h"
 #include "intel_dp.h"
 
 bool intel_vrr_is_capable(struct intel_connector *connector)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
new file mode 100644
index 000000000000..b5695a95dd4a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_VRR_REGS_H__
+#define __INTEL_VRR_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* VRR registers */
+#define _TRANS_VRR_CTL_A		0x60420
+#define _TRANS_VRR_CTL_B		0x61420
+#define _TRANS_VRR_CTL_C		0x62420
+#define _TRANS_VRR_CTL_D		0x63420
+#define TRANS_VRR_CTL(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
+#define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
+#define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
+#define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
+#define   VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
+#define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
+#define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
+#define   XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
+#define   XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK,\
+						(x))
+
+#define _TRANS_VRR_VMAX_A		0x60424
+#define _TRANS_VRR_VMAX_B		0x61424
+#define _TRANS_VRR_VMAX_C		0x62424
+#define _TRANS_VRR_VMAX_D		0x63424
+#define TRANS_VRR_VMAX(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMAX_A)
+#define   VRR_VMAX_MASK			REG_GENMASK(19, 0)
+
+#define _TRANS_VRR_VMIN_A		0x60434
+#define _TRANS_VRR_VMIN_B		0x61434
+#define _TRANS_VRR_VMIN_C		0x62434
+#define _TRANS_VRR_VMIN_D		0x63434
+#define TRANS_VRR_VMIN(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMIN_A)
+#define   VRR_VMIN_MASK			REG_GENMASK(15, 0)
+
+#define _TRANS_VRR_VMAXSHIFT_A		0x60428
+#define _TRANS_VRR_VMAXSHIFT_B		0x61428
+#define _TRANS_VRR_VMAXSHIFT_C		0x62428
+#define _TRANS_VRR_VMAXSHIFT_D		0x63428
+#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
+					_TRANS_VRR_VMAXSHIFT_A)
+#define   VRR_VMAXSHIFT_DEC_MASK	REG_GENMASK(29, 16)
+#define   VRR_VMAXSHIFT_DEC		REG_BIT(16)
+#define   VRR_VMAXSHIFT_INC_MASK	REG_GENMASK(12, 0)
+
+#define _TRANS_VRR_STATUS_A		0x6042C
+#define _TRANS_VRR_STATUS_B		0x6142C
+#define _TRANS_VRR_STATUS_C		0x6242C
+#define _TRANS_VRR_STATUS_D		0x6342C
+#define TRANS_VRR_STATUS(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
+#define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
+#define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
+#define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
+#define   VRR_STATUS_NO_FLIP_FRAME	REG_BIT(28)
+#define   VRR_STATUS_VRR_EN_LIVE	REG_BIT(27)
+#define   VRR_STATUS_FLIPS_SERVICED	REG_BIT(26)
+#define   VRR_STATUS_VBLANK_MASK	REG_GENMASK(22, 20)
+#define   STATUS_FSM_IDLE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
+#define   STATUS_FSM_WAIT_TILL_FDB	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 1)
+#define   STATUS_FSM_WAIT_TILL_FS	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 2)
+#define   STATUS_FSM_WAIT_TILL_FLIP	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 3)
+#define   STATUS_FSM_PIPELINE_FILL	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 4)
+#define   STATUS_FSM_ACTIVE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
+#define   STATUS_FSM_LEGACY_VBLANK	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 6)
+
+#define _TRANS_VRR_VTOTAL_PREV_A	0x60480
+#define _TRANS_VRR_VTOTAL_PREV_B	0x61480
+#define _TRANS_VRR_VTOTAL_PREV_C	0x62480
+#define _TRANS_VRR_VTOTAL_PREV_D	0x63480
+#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
+					_TRANS_VRR_VTOTAL_PREV_A)
+#define   VRR_VTOTAL_FLIP_BEFR_BNDR	REG_BIT(31)
+#define   VRR_VTOTAL_FLIP_AFTER_BNDR	REG_BIT(30)
+#define   VRR_VTOTAL_FLIP_AFTER_DBLBUF	REG_BIT(29)
+#define   VRR_VTOTAL_PREV_FRAME_MASK	REG_GENMASK(19, 0)
+
+#define _TRANS_VRR_FLIPLINE_A		0x60438
+#define _TRANS_VRR_FLIPLINE_B		0x61438
+#define _TRANS_VRR_FLIPLINE_C		0x62438
+#define _TRANS_VRR_FLIPLINE_D		0x63438
+#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
+					_TRANS_VRR_FLIPLINE_A)
+#define   VRR_FLIPLINE_MASK		REG_GENMASK(19, 0)
+
+#define _TRANS_VRR_STATUS2_A		0x6043C
+#define _TRANS_VRR_STATUS2_B		0x6143C
+#define _TRANS_VRR_STATUS2_C		0x6243C
+#define _TRANS_VRR_STATUS2_D		0x6343C
+#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS2_A)
+#define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
+
+#define _TRANS_PUSH_A			0x60A70
+#define _TRANS_PUSH_B			0x61A70
+#define _TRANS_PUSH_C			0x62A70
+#define _TRANS_PUSH_D			0x63A70
+#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_PUSH_A)
+#define   TRANS_PUSH_EN			REG_BIT(31)
+#define   TRANS_PUSH_SEND		REG_BIT(30)
+
+#define _TRANS_VRR_VSYNC_A		0x60078
+#define TRANS_VRR_VSYNC(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
+#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
+#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
+#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
+#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
+
+#endif /* __INTEL_VRR_REGS__ */
+
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 6877e2f0fbc3..4ff590114c52 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1228,106 +1228,6 @@
 #define PIPESRC(pipe)		_MMIO_TRANS2(dev_priv, (pipe), _PIPEASRC)
 #define TRANS_MULT(trans)	_MMIO_TRANS2(dev_priv, (trans), _TRANS_MULT_A)
 
-/* VRR registers */
-#define _TRANS_VRR_CTL_A		0x60420
-#define _TRANS_VRR_CTL_B		0x61420
-#define _TRANS_VRR_CTL_C		0x62420
-#define _TRANS_VRR_CTL_D		0x63420
-#define TRANS_VRR_CTL(dev_priv, trans)			_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_CTL_A)
-#define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
-#define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
-#define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
-#define   VRR_CTL_PIPELINE_FULL_MASK		REG_GENMASK(10, 3)
-#define   VRR_CTL_PIPELINE_FULL(x)		REG_FIELD_PREP(VRR_CTL_PIPELINE_FULL_MASK, (x))
-#define   VRR_CTL_PIPELINE_FULL_OVERRIDE	REG_BIT(0)
-#define	  XELPD_VRR_CTL_VRR_GUARDBAND_MASK	REG_GENMASK(15, 0)
-#define	  XELPD_VRR_CTL_VRR_GUARDBAND(x)	REG_FIELD_PREP(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, (x))
-
-#define _TRANS_VRR_VMAX_A		0x60424
-#define _TRANS_VRR_VMAX_B		0x61424
-#define _TRANS_VRR_VMAX_C		0x62424
-#define _TRANS_VRR_VMAX_D		0x63424
-#define TRANS_VRR_VMAX(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMAX_A)
-#define   VRR_VMAX_MASK			REG_GENMASK(19, 0)
-
-#define _TRANS_VRR_VMIN_A		0x60434
-#define _TRANS_VRR_VMIN_B		0x61434
-#define _TRANS_VRR_VMIN_C		0x62434
-#define _TRANS_VRR_VMIN_D		0x63434
-#define TRANS_VRR_VMIN(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VMIN_A)
-#define   VRR_VMIN_MASK			REG_GENMASK(15, 0)
-
-#define _TRANS_VRR_VMAXSHIFT_A		0x60428
-#define _TRANS_VRR_VMAXSHIFT_B		0x61428
-#define _TRANS_VRR_VMAXSHIFT_C		0x62428
-#define _TRANS_VRR_VMAXSHIFT_D		0x63428
-#define TRANS_VRR_VMAXSHIFT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
-					_TRANS_VRR_VMAXSHIFT_A)
-#define   VRR_VMAXSHIFT_DEC_MASK	REG_GENMASK(29, 16)
-#define   VRR_VMAXSHIFT_DEC		REG_BIT(16)
-#define   VRR_VMAXSHIFT_INC_MASK	REG_GENMASK(12, 0)
-
-#define _TRANS_VRR_STATUS_A		0x6042C
-#define _TRANS_VRR_STATUS_B		0x6142C
-#define _TRANS_VRR_STATUS_C		0x6242C
-#define _TRANS_VRR_STATUS_D		0x6342C
-#define TRANS_VRR_STATUS(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS_A)
-#define   VRR_STATUS_VMAX_REACHED	REG_BIT(31)
-#define   VRR_STATUS_NOFLIP_TILL_BNDR	REG_BIT(30)
-#define   VRR_STATUS_FLIP_BEF_BNDR	REG_BIT(29)
-#define   VRR_STATUS_NO_FLIP_FRAME	REG_BIT(28)
-#define   VRR_STATUS_VRR_EN_LIVE	REG_BIT(27)
-#define   VRR_STATUS_FLIPS_SERVICED	REG_BIT(26)
-#define   VRR_STATUS_VBLANK_MASK	REG_GENMASK(22, 20)
-#define   STATUS_FSM_IDLE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 0)
-#define   STATUS_FSM_WAIT_TILL_FDB	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 1)
-#define   STATUS_FSM_WAIT_TILL_FS	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 2)
-#define   STATUS_FSM_WAIT_TILL_FLIP	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 3)
-#define   STATUS_FSM_PIPELINE_FILL	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 4)
-#define   STATUS_FSM_ACTIVE		REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 5)
-#define   STATUS_FSM_LEGACY_VBLANK	REG_FIELD_PREP(VRR_STATUS_VBLANK_MASK, 6)
-
-#define _TRANS_VRR_VTOTAL_PREV_A	0x60480
-#define _TRANS_VRR_VTOTAL_PREV_B	0x61480
-#define _TRANS_VRR_VTOTAL_PREV_C	0x62480
-#define _TRANS_VRR_VTOTAL_PREV_D	0x63480
-#define TRANS_VRR_VTOTAL_PREV(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
-					_TRANS_VRR_VTOTAL_PREV_A)
-#define   VRR_VTOTAL_FLIP_BEFR_BNDR	REG_BIT(31)
-#define   VRR_VTOTAL_FLIP_AFTER_BNDR	REG_BIT(30)
-#define   VRR_VTOTAL_FLIP_AFTER_DBLBUF	REG_BIT(29)
-#define   VRR_VTOTAL_PREV_FRAME_MASK	REG_GENMASK(19, 0)
-
-#define _TRANS_VRR_FLIPLINE_A		0x60438
-#define _TRANS_VRR_FLIPLINE_B		0x61438
-#define _TRANS_VRR_FLIPLINE_C		0x62438
-#define _TRANS_VRR_FLIPLINE_D		0x63438
-#define TRANS_VRR_FLIPLINE(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, \
-					_TRANS_VRR_FLIPLINE_A)
-#define   VRR_FLIPLINE_MASK		REG_GENMASK(19, 0)
-
-#define _TRANS_VRR_STATUS2_A		0x6043C
-#define _TRANS_VRR_STATUS2_B		0x6143C
-#define _TRANS_VRR_STATUS2_C		0x6243C
-#define _TRANS_VRR_STATUS2_D		0x6343C
-#define TRANS_VRR_STATUS2(dev_priv, trans)	_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_STATUS2_A)
-#define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
-
-#define _TRANS_PUSH_A			0x60A70
-#define _TRANS_PUSH_B			0x61A70
-#define _TRANS_PUSH_C			0x62A70
-#define _TRANS_PUSH_D			0x63A70
-#define TRANS_PUSH(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_PUSH_A)
-#define   TRANS_PUSH_EN			REG_BIT(31)
-#define   TRANS_PUSH_SEND		REG_BIT(30)
-
-#define _TRANS_VRR_VSYNC_A		0x60078
-#define TRANS_VRR_VSYNC(dev_priv, trans)		_MMIO_TRANS2(dev_priv, trans, _TRANS_VRR_VSYNC_A)
-#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
-#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
-#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
-#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
-
 /* VGA port control */
 #define ADPA			_MMIO(0x61100)
 #define PCH_ADPA                _MMIO(0xe1100)
-- 
2.25.1

