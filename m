Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67061EBAD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53A10E207;
	Mon,  7 Nov 2022 07:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10A810E1F6;
 Mon,  7 Nov 2022 07:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805617; x=1699341617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2u9lfj2xnrJBVvUgajw8pVJyYIf0XC++7SLQO/2X5xo=;
 b=Q1xcz72YRk6xa7PbVimSV2BiXdP2baK6iUwpo4MNFGKrelQnKHQgcL9U
 FwJkJ/Uop9LklEVW01Bn4Tcrj3DT5L85tYXdIfbfaXszfP0aSdk5zLmNT
 QMdyJvglZlXOXgMlCEQgwPleUn/Y8rH4vAIHwiKR/aXpr3CJ8yWkkhTik
 ymDiGqLcr8BSSzeV9S/373JNuu99FCNoTLJ7NPpSNDeRGSq2eT5yDCLVZ
 se36yiFuFuDX/KFHfwytykPkbYFhgC+D5L4dZIDrkS7IzXYdLcP2RG9Lp
 1PlcS0sa0NlFw/D7IGOL9twMlsdDAOcQzNHCoOrfZ1iRKnije3l+hqlOm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463336"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463336"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767242"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767242"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:14 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 03/15] drm/i915/mtl: Create separate reg file for PICA registers
Date: Mon,  7 Nov 2022 12:50:33 +0530
Message-Id: <20221107072045.628895-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

(Patch is part of the series to add C10/C20 PHY support, which is in
review : https://patchwork.freedesktop.org/series/109714/)

Create a separate file to store registers for PICA chips
C10 and C20.

Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../gpu/drm/i915/display/intel_cx0_reg_defs.h | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h b/drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h
new file mode 100644
index 000000000000..dfe156141d73
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __INTEL_CX0_REG_DEFS_H__
+#define __INTEL_CX0_REG_DEFS_H__
+
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_A		0x64040
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_B		0x64140
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC1		0x16F240
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC2		0x16F440
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC3		0x16F640
+#define _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC4		0x16F840
+#define _XELPDP_PORT_M2P_MSGBUS_CTL(port, lane)		(_PICK(port, \
+							 [PORT_A] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_A, \
+							 [PORT_B] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_B, \
+							 [PORT_TC1] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC1, \
+							 [PORT_TC2] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC2, \
+							 [PORT_TC3] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC3, \
+							 [PORT_TC4] = _XELPDP_PORT_M2P_MSGBUS_CTL_LN0_USBC4) + ((lane) * 4))
+
+#define XELPDP_PORT_M2P_MSGBUS_CTL(port, lane)		_MMIO(_XELPDP_PORT_M2P_MSGBUS_CTL(port, lane))
+#define  XELPDP_PORT_M2P_TRANSACTION_PENDING		REG_BIT(31)
+#define  XELPDP_PORT_M2P_COMMAND_TYPE_MASK		REG_GENMASK(30, 27)
+#define  XELPDP_PORT_M2P_COMMAND_WRITE_UNCOMMITTED	REG_FIELD_PREP(XELPDP_PORT_M2P_COMMAND_TYPE_MASK, 0x1)
+#define  XELPDP_PORT_M2P_COMMAND_WRITE_COMMITTED	REG_FIELD_PREP(XELPDP_PORT_M2P_COMMAND_TYPE_MASK, 0x2)
+#define  XELPDP_PORT_M2P_COMMAND_READ			REG_FIELD_PREP(XELPDP_PORT_M2P_COMMAND_TYPE_MASK, 0x3)
+#define  XELPDP_PORT_M2P_DATA_MASK			REG_GENMASK(23, 16)
+#define  XELPDP_PORT_M2P_DATA(val)			REG_FIELD_PREP(XELPDP_PORT_M2P_DATA_MASK, val)
+#define  XELPDP_PORT_M2P_TRANSACTION_RESET		REG_BIT(15)
+#define  XELPDP_PORT_M2P_ADDRESS_MASK			REG_GENMASK(11, 0)
+#define  XELPDP_PORT_M2P_ADDRESS(val)			REG_FIELD_PREP(XELPDP_PORT_M2P_ADDRESS_MASK, val)
+
+#define XELPDP_PORT_P2M_MSGBUS_STATUS(port, lane)	_MMIO(_XELPDP_PORT_M2P_MSGBUS_CTL(port, lane) + 8)
+#define  XELPDP_PORT_P2M_RESPONSE_READY			REG_BIT(31)
+#define  XELPDP_PORT_P2M_COMMAND_TYPE_MASK		REG_GENMASK(30, 27)
+#define  XELPDP_PORT_P2M_COMMAND_READ_ACK		0x4
+#define  XELPDP_PORT_P2M_COMMAND_WRITE_ACK		0x5
+#define  XELPDP_PORT_P2M_DATA_MASK			REG_GENMASK(23, 16)
+#define  XELPDP_PORT_P2M_DATA(val)			REG_FIELD_PREP(XELPDP_PORT_P2M_DATA_MASK, val)
+#define  XELPDP_PORT_P2M_ERROR_SET			REG_BIT(15)
+
+#define  XELPDP_MSGBUS_TIMEOUT_SLOW			1
+#define  XELPDP_MSGBUS_TIMEOUT_FAST_US			2
+#define XELPDP_PCLK_PLL_ENABLE_TIMEOUT_US		3200
+#define XELPDP_PCLK_PLL_DISABLE_TIMEOUT_US		20
+#define XELPDP_PORT_BUF_SOC_READY_TIMEOUT_US		100
+#define XELPDP_PORT_RESET_START_TIMEOUT_US		5
+#define XELPDP_PORT_POWERDOWN_UPDATE_TIMEOUT_US		100
+#define XELPDP_PORT_RESET_END_TIMEOUT			15
+#define XELPDP_REFCLK_ENABLE_TIMEOUT_US			1
+
+#define _XELPDP_PORT_BUF_CTL1_LN0_A			0x64004
+#define _XELPDP_PORT_BUF_CTL1_LN0_B			0x64104
+#define _XELPDP_PORT_BUF_CTL1_LN0_USBC1			0x16F200
+#define _XELPDP_PORT_BUF_CTL1_LN0_USBC2			0x16F400
+#define _XELPDP_PORT_BUF_CTL1_LN0_USBC3			0x16F600
+#define _XELPDP_PORT_BUF_CTL1_LN0_USBC4			0x16F800
+#define _XELPDP_PORT_BUF_CTL1(port)			(_PICK(port, \
+							 [PORT_A] = _XELPDP_PORT_BUF_CTL1_LN0_A, \
+							 [PORT_B] = _XELPDP_PORT_BUF_CTL1_LN0_B, \
+							 [PORT_TC1] = _XELPDP_PORT_BUF_CTL1_LN0_USBC1, \
+							 [PORT_TC2] = _XELPDP_PORT_BUF_CTL1_LN0_USBC2, \
+							 [PORT_TC3] = _XELPDP_PORT_BUF_CTL1_LN0_USBC3, \
+							 [PORT_TC4] = _XELPDP_PORT_BUF_CTL1_LN0_USBC4))
+
+#define XELPDP_PORT_BUF_CTL1(port)			_MMIO(_XELPDP_PORT_BUF_CTL1(port))
+#define  XELPDP_PORT_BUF_SOC_PHY_READY			REG_BIT(24)
+#define  XELPDP_PORT_REVERSAL				REG_BIT(16)
+
+#define  XELPDP_TC_PHY_OWNERSHIP			REG_BIT(6)
+#define  XELPDP_TCSS_POWER_REQUEST			REG_BIT(5)
+#define  XELPDP_TCSS_POWER_STATE			REG_BIT(4)
+#define  XELPDP_PORT_WIDTH_MASK				REG_GENMASK(3, 1)
+#define  XELPDP_PORT_WIDTH(val)				REG_FIELD_PREP(XELPDP_PORT_WIDTH_MASK, val)
+
+#define XELPDP_PORT_BUF_CTL2(port)			_MMIO(_XELPDP_PORT_BUF_CTL1(port) + 4)
+#define  XELPDP_LANE0_PIPE_RESET			REG_BIT(31)
+#define  XELPDP_LANE1_PIPE_RESET			REG_BIT(30)
+#define  XELPDP_LANE0_PHY_CURRENT_STATUS		REG_BIT(29)
+#define  XELPDP_LANE1_PHY_CURRENT_STATUS		REG_BIT(28)
+#define  XELPDP_LANE0_POWERDOWN_UPDATE			REG_BIT(25)
+#define  XELPDP_LANE1_POWERDOWN_UPDATE			REG_BIT(24)
+#define  XELPDP_LANE0_POWERDOWN_NEW_STATE_MASK		REG_GENMASK(23, 20)
+#define  XELPDP_LANE0_POWERDOWN_NEW_STATE(val)		REG_FIELD_PREP(XELPDP_LANE0_POWERDOWN_NEW_STATE_MASK, val)
+#define  XELPDP_LANE1_POWERDOWN_NEW_STATE_MASK		REG_GENMASK(19, 16)
+#define  XELPDP_LANE1_POWERDOWN_NEW_STATE(val)		REG_FIELD_PREP(XELPDP_LANE1_POWERDOWN_NEW_STATE_MASK, val)
+#define  XELPDP_POWER_STATE_READY_MASK			REG_GENMASK(7, 4)
+#define  XELPDP_POWER_STATE_READY(val)			REG_FIELD_PREP(XELPDP_POWER_STATE_READY_MASK, val)
+
+#define XELPDP_PORT_BUF_CTL3(port)			_MMIO(_XELPDP_PORT_BUF_CTL1(port) + 8)
+#define  XELPDP_PLL_LANE_STAGGERING_DELAY_MASK		REG_GENMASK(15, 8)
+#define  XELPDP_PLL_LANE_STAGGERING_DELAY(val)		REG_FIELD_PREP(XELPDP_PLL_LANE_STAGGERING_DELAY_MASK, val)
+#define  XELPDP_POWER_STATE_ACTIVE_MASK			REG_GENMASK(3, 0)
+#define  XELPDP_POWER_STATE_ACTIVE(val)			REG_FIELD_PREP(XELPDP_POWER_STATE_ACTIVE_MASK, val)
+
+#define _XELPDP_PORT_CLOCK_CTL_A			0x640E0
+#define _XELPDP_PORT_CLOCK_CTL_B			0x641E0
+#define _XELPDP_PORT_CLOCK_CTL_USBC1			0x16F260
+#define _XELPDP_PORT_CLOCK_CTL_USBC2			0x16F460
+#define _XELPDP_PORT_CLOCK_CTL_USBC3			0x16F660
+#define _XELPDP_PORT_CLOCK_CTL_USBC4			0x16F860
+#define XELPDP_PORT_CLOCK_CTL(port)			_MMIO(_PICK(port, \
+							[PORT_A] = _XELPDP_PORT_CLOCK_CTL_A, \
+							[PORT_B] = _XELPDP_PORT_CLOCK_CTL_B, \
+							[PORT_TC1] = _XELPDP_PORT_CLOCK_CTL_USBC1, \
+							[PORT_TC2] = _XELPDP_PORT_CLOCK_CTL_USBC2, \
+							[PORT_TC3] = _XELPDP_PORT_CLOCK_CTL_USBC3, \
+							[PORT_TC4] = _XELPDP_PORT_CLOCK_CTL_USBC4))
+
+#define XELPDP_LANE0_PCLK_PLL_REQUEST			REG_BIT(31)
+#define XELPDP_LANE0_PCLK_PLL_ACK			REG_BIT(30)
+#define XELPDP_LANE0_PCLK_REFCLK_REQUEST		REG_BIT(29)
+#define XELPDP_LANE0_PCLK_REFCLK_ACK			REG_BIT(28)
+#define XELPDP_LANE1_PCLK_PLL_REQUEST			REG_BIT(27)
+#define XELPDP_LANE1_PCLK_PLL_ACK			REG_BIT(26)
+#define XELPDP_LANE1_PCLK_REFCLK_REQUEST		REG_BIT(25)
+#define XELPDP_LANE1_PCLK_REFCLK_ACK			REG_BIT(24)
+#define XELPDP_TBT_CLOCK_REQUEST			REG_BIT(19)
+#define XELPDP_TBT_CLOCK_ACK				REG_BIT(18)
+#define XELPDP_DDI_CLOCK_SELECT_MASK			REG_GENMASK(15, 12)
+#define XELPDP_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XELPDP_DDI_CLOCK_SELECT_MASK, val)
+#define XELPDP_DDI_CLOCK_SELECT_NONE			0x0
+#define XELPDP_DDI_CLOCK_SELECT_MAXPCLK			0x8
+#define XELPDP_DDI_CLOCK_SELECT_DIV18CLK		0x9
+#define XELPDP_DDI_CLOCK_SELECT_TBT_162			0xc
+#define XELPDP_DDI_CLOCK_SELECT_TBT_270			0xd
+#define XELPDP_DDI_CLOCK_SELECT_TBT_540			0xe
+#define XELPDP_DDI_CLOCK_SELECT_TBT_810			0xf
+#define XELPDP_FORWARD_CLOCK_UNGATE			REG_BIT(10)
+#define XELPDP_LANE1_PHY_CLOCK_SELECT			REG_BIT(8)
+#define XELPDP_SSC_ENABLE_PLLA				REG_BIT(1)
+#define XELPDP_SSC_ENABLE_PLLB				REG_BIT(0)
+
+#endif /* __INTEL_CX0_REG_DEFS_H__ */
-- 
2.25.1

