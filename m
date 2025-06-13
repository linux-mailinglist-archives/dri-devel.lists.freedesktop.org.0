Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68010AD8306
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84C610E8CC;
	Fri, 13 Jun 2025 06:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfjnC+DW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3D10E8CC;
 Fri, 13 Jun 2025 06:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749795370; x=1781331370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vueawFMOobhRWZB0k6BTdm7TWenDhYoz7aUdj3svd/c=;
 b=GfjnC+DWTuImqbToeT+9b9zznbaP9l85xtUqN8HDiMrDi//DVCFq5n77
 nkyqHhg5rypTKvwHPugefyTYIiFmDZOiUCMytWjfuqcTveSBGovgkzGQ8
 +7hVyQPH4csZDZkclQMKCiWCakjLflgaQ+i2y3moaxnXeEY7QwX229JEw
 6jzHzuc9HLNPOIPnmwVEnbEgdYLDd+LQKVMNyfh1boJYZjybJhlOKoWD1
 NUId3kKjI92rOuxhLbKZR9OOBAoXdQ48/ruQ6LaSBJvwI6CGwwndxMMbX
 VE2W1qkrXcVPbf7gW+qs5wtNsKvafR6bjMtA0RCf/Ldw6ZtNk78OxVbas g==;
X-CSE-ConnectionGUID: NwU2IfUKSJyW31QUrWiGTg==
X-CSE-MsgGUID: 8Vzs3NDtSJm1Awmk6ZK3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39608812"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="39608812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:16:10 -0700
X-CSE-ConnectionGUID: HIgLT88SRAmL7dx3ltbyRA==
X-CSE-MsgGUID: s6hepSyhR4imgbqgBxWulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152717222"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 23:16:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 2/4] drm/i915/writeback: Add writeback registers
Date: Fri, 13 Jun 2025 11:45:48 +0530
Message-Id: <20250613061550.2893526-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613061550.2893526-1-suraj.kandpal@intel.com>
References: <20250613061550.2893526-1-suraj.kandpal@intel.com>
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

Add writeback registers to its own file.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
new file mode 100644
index 000000000000..dd872b6f8103
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_WRITEBACK_REGS_H__
+#define __INTEL_WRITEBACK_REGS_H__
+
+#include "intel_display_reg_defs.h"
+
+/* WD 0 and 1 */
+#define TRANSCODER_WD0_OFFSET	0x6e000
+#define TRANSCODER_WD1_OFFSET	0x6d800
+
+/* WD 0 and 1 */
+#define PIPE_WD0_OFFSET		0x7e000
+#define PIPE_WD1_OFFSET		0x7d000
+
+/* Gen12 WD */
+#define _MMIO_WD(tc, wd0, wd1)	_MMIO_TRANS((tc) - TRANSCODER_WD_0, wd0, wd1)
+
+#define WD_TRANS_ENABLE		REG_BIT(31)
+#define WD_TRANS_STATE		REG_BIT(30)
+
+/* WD transcoder control */
+#define _WD_TRANS_FUNC_CTL_0	0x6e400
+#define _WD_TRANS_FUNC_CTL_1	0x6ec00
+#define WD_TRANS_FUNC_CTL(tc)	_MMIO_WD(tc,\
+				_WD_TRANS_FUNC_CTL_0,\
+				_WD_TRANS_FUNC_CTL_1)
+
+#define TRANS_WD_FUNC_ENABLE		REG_BIT(31)
+#define WD_TRIGGERED_CAP_MODE_ENABLE	REG_BIT(30)
+#define START_TRIGGER_FRAME		REG_BIT(29)
+#define STOP_TRIGGER_FRAME		REG_BIT(28)
+#define WD_INPUT_SELECT_MASK		REG_GENMASK(14, 12)
+#define WD_INPUT_PIPE_A			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 0)
+#define WD_INPUT_PIPE_B			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 5)
+#define WD_INPUT_PIPE_C			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 6)
+#define WD_INPUT_PIPE_D			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 7)
+#define WD_COLOR_MODE_MASK		REG_GENMASK(22, 20)
+#define WD_PIX_FMT_YUYV			REG_FIELD_PREP(WD_COLOR_MODE_MASK, 1)
+#define WD_PIX_FMT_XYUV8888		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 2)
+#define WD_PIX_FMT_XBGR8888		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 3)
+#define WD_PIX_FMT_Y410			REG_FIELD_PREP(WD_COLOR_MODE_MASK, 4)
+#define WD_PIX_FMT_YUV422		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 5)
+#define WD_PIX_FMT_XBGR2101010		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 6)
+#define WD_PIX_FMT_RGB565		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 7)
+#define WD_FRAME_NUMBER_MASK		REG_GENMASK(3, 0)
+#define WD_FRAME_NUMBER(n)		REG_FIELD_PREP(WD_FRAME_NUMBER_MASK, n)
+
+#define _WD_STRIDE_0			0x6e510
+#define _WD_STRIDE_1			0x6ed10
+#define WD_STRIDE(tc)			_MMIO_WD(tc,\
+					_WD_STRIDE_0,\
+					_WD_STRIDE_1)
+#define WD_STRIDE_MASK			REG_GENMASK(15, 6)
+
+#define _WD_STREAMCAP_CTL0		0x6e590
+#define _WD_STREAMCAP_CTL1		0x6ed90
+#define WD_STREAMCAP_CTL(tc)		_MMIO_WD(tc,\
+					_WD_STREAMCAP_CTL0,\
+					_WD_STREAMCAP_CTL1)
+
+#define WD_STREAM_CAP_MODE_EN		REG_BIT(31)
+#define WD_SLICING_STRAT_MASK		REG_GENMASK(25, 24)
+#define WD_SLICING_STRAT_1_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 0)
+#define WD_SLICING_STRAT_2_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 1)
+#define WD_SLICING_STRAT_4_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 2)
+#define WD_SLICING_STRAT_8_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 3)
+#define WD_STREAM_OVERRUN_STATUS	1
+
+#define _WD_SURF_0			0x6e514
+#define _WD_SURF_1			0x6ed14
+#define WD_SURF(tc)			_MMIO_WD(tc,\
+					_WD_SURF_0,\
+					_WD_SURF_1)
+
+#define _WD_IMR_0			0x6e560
+#define _WD_IMR_1			0x6ed60
+#define WD_IMR(tc)			_MMIO_WD(tc,\
+					_WD_IMR_0,\
+					_WD_IMR_1)
+#define WD_FRAME_COMPLETE_INT		REG_BIT(7)
+#define WD_GTT_FAULT_INT		REG_BIT(6)
+#define WD_VBLANK_INT			REG_BIT(5)
+#define WD_OVERRUN_INT			REG_BIT(4)
+#define WD_CAPTURING_INT		REG_BIT(3)
+#define WD_WRITE_COMPLETE_INT		REG_BIT(2)
+
+#define _WD_IIR_0			0x6e564
+#define _WD_IIR_1			0x6ed64
+#define WD_IIR(tc)			_MMIO_WD(tc,\
+					_WD_IIR_0,\
+					_WD_IIR_1)
+
+#define _WD_FRAME_STATUS_0		0x6e56b
+#define _WD_FRAME_STATUS_1		0x6ed6b
+#define WD_FRAME_STATUS(tc)		_MMIO_WD(tc,\
+					_WD_FRAME_STATUS_0,\
+					_WD_FRAME_STATUS_1)
+
+#define WD_FRAME_COMPLETE		REG_BIT(31)
+#define WD_STATE_MASK			REG_GENMASK(26, 24)
+#define WD_STATE_IDLE			REG_FIELD_PREP(WD_STATE_MASK, 0)
+#define WD_STATE_CAPSTART		REG_FIELD_PREP(WD_STATE_MASK, 1)
+#define WD_STATE_FRAME_START		REG_FIELD_PREP(WD_STATE_MASK, 2)
+#define WD_STATE_CAPACITIVE		REG_FIELD_PREP(WD_STATE_MASK, 3)
+#define WD_STATE_TG_DONE		REG_FIELD_PREP(WD_STATE_MASK, 4)
+#define WD_STATE_WDX_DONE		REG_FIELD_PREP(WD_STATE_MASK, 5)
+#define WD_STATE_QUICK_CAP		REG_FIELD_PREP(WD_STATE_MASK, 6)
+
+#define _WD_27_M_0			0x6e524
+#define _WD_27_M_1			0x6ed24
+#define WD_27_M(tc)			_MMIO_WD(tc,\
+					_WD_27_M_0,\
+					_WD_27_M_1)
+
+#define _WD_27_N_0			0x6e528
+
+/* Address looks wrong in bspec: */
+#define _WD_27_N_1			0x6ec28
+#define WD_27_N(tc)			_MMIO_WD(tc,\
+					_WD_27_N_0,\
+					_WD_27_N_1)
+
+#define _WD_TAIL_CFG_0			0x6e520
+#define _WD_TAIL_CFG_1			0x6ed20
+
+#define WD_TAIL_CFG(tc)			_MMIO_WD(tc,\
+					_WD_TAIL_CFG_0,\
+					_WD_TAIL_CFG_1)
+
+#endif /* __INTEL_WRITEBACK_REGS_H__ */
-- 
2.34.1

