Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D28FCD32
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFFD10E652;
	Wed,  5 Jun 2024 12:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEd8R5JQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC910E5FB;
 Wed,  5 Jun 2024 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717591102; x=1749127102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ds2p+RL2r24/pcth4cLI7jqdOL2q1AOUFnJTfByye8w=;
 b=NEd8R5JQ6njI1ENE83xmwv8wbJyY74dKNvAfUZEaYuq9TBqKOgqieZjq
 0PRcHcltRkH1jKs1vmwQSh6Yilbb5CXyF1VA/rVpeG00DNMFiGJnqQJZb
 VA6s+ENwMyQ4QK9X5yUM+cizMFXBKy2Cx6JPtqZciSmbC95kXDLyQjrvt
 NHE3sa1nbvArQC1Ps4Ngb+F1/Vs0wvl635z3GydIekCtXrJTKCY5QTWds
 ZE2MM8bpb+s8Yq1h8agzjjVba4wTteVUHDRx2v6bFH6e6OU/39IfFChT9
 tz3aQnQ+4nEhTMmxn11OtFtHUABC/HQhjQpqP5uCnbJMtSa3oQ8CQp/8V A==;
X-CSE-ConnectionGUID: VmaaMLguTbCxnEUcM0MsrQ==
X-CSE-MsgGUID: 8pqO9vLrQS2ywWNwsZQKAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36728145"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36728145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 05:38:22 -0700
X-CSE-ConnectionGUID: L7VrDMMaQ8epGKYz8GKT3Q==
X-CSE-MsgGUID: 5+h9BwRSR7eDsFVR4NpPKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="38216563"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 05 Jun 2024 05:38:21 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v12 1/9] drm/i915: Protect CRC reg macro arguments for
 consistency
Date: Wed,  5 Jun 2024 17:57:54 +0530
Message-Id: <20240605122802.488124-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605122802.488124-1-mitulkumar.ajitkumar.golani@intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

It's probably a good idea to start protecting all macro arguments
to avoid any cargo-cult mistakes when people go looking for examples
of how to define these things.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240531115342.2763-8-ville.syrjala@linux.intel.com
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_pipe_crc_regs.h    | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h b/drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
index 383910a785f6..4e65f51d34e6 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc_regs.h
@@ -9,7 +9,7 @@
 #include "intel_display_reg_defs.h"
 
 #define _PIPE_CRC_CTL_A			0x60050
-#define PIPE_CRC_CTL(dev_priv, pipe)		_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_CTL_A)
+#define PIPE_CRC_CTL(dev_priv, pipe)		_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_CTL_A)
 #define   PIPE_CRC_ENABLE		REG_BIT(31)
 /* skl+ source selection */
 #define   PIPE_CRC_SOURCE_MASK_SKL	REG_GENMASK(30, 28)
@@ -76,19 +76,19 @@
 #define   PIPE_CRC_EXP_RES2_MASK	REG_BIT(22, 0) /* pre-ivb */
 
 #define _PIPE_CRC_RES_RED_A		0x60060
-#define PIPE_CRC_RES_RED(dev_priv, pipe)	_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_RES_RED_A)
+#define PIPE_CRC_RES_RED(dev_priv, pipe)	_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_RES_RED_A)
 
 #define _PIPE_CRC_RES_GREEN_A		0x60064
-#define PIPE_CRC_RES_GREEN(dev_priv, pipe)	_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_RES_GREEN_A)
+#define PIPE_CRC_RES_GREEN(dev_priv, pipe)	_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_RES_GREEN_A)
 
 #define _PIPE_CRC_RES_BLUE_A		0x60068
-#define PIPE_CRC_RES_BLUE(dev_priv, pipe)	_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_RES_BLUE_A)
+#define PIPE_CRC_RES_BLUE(dev_priv, pipe)	_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_RES_BLUE_A)
 
 #define _PIPE_CRC_RES_RES1_A_I915	0x6006c /* i915+ */
-#define PIPE_CRC_RES_RES1_I915(dev_priv, pipe)	_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_RES_RES1_A_I915)
+#define PIPE_CRC_RES_RES1_I915(dev_priv, pipe)	_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_RES_RES1_A_I915)
 
 #define _PIPE_CRC_RES_RES2_A_G4X	0x60080 /* g4x+ */
-#define PIPE_CRC_RES_RES2_G4X(dev_priv, pipe)	_MMIO_TRANS2(dev_priv, pipe, _PIPE_CRC_RES_RES2_A_G4X)
+#define PIPE_CRC_RES_RES2_G4X(dev_priv, pipe)	_MMIO_TRANS2((dev_priv), (pipe), _PIPE_CRC_RES_RES2_A_G4X)
 
 /* ivb */
 #define _PIPE_CRC_EXP_2_A_IVB		0x60054
@@ -117,36 +117,36 @@
 /* ivb */
 #define _PIPE_CRC_RES_1_A_IVB		0x60064
 #define _PIPE_CRC_RES_1_B_IVB		0x61064
-#define PIPE_CRC_RES_1_IVB(pipe)		_MMIO_PIPE(pipe, _PIPE_CRC_RES_1_A_IVB, _PIPE_CRC_RES_1_B_IVB)
+#define PIPE_CRC_RES_1_IVB(pipe)		_MMIO_PIPE((pipe), _PIPE_CRC_RES_1_A_IVB, _PIPE_CRC_RES_1_B_IVB)
 
 /* ivb */
 #define _PIPE_CRC_RES_2_A_IVB		0x60068
 #define _PIPE_CRC_RES_2_B_IVB		0x61068
-#define PIPE_CRC_RES_2_IVB(pipe)		_MMIO_PIPE(pipe, _PIPE_CRC_RES_2_A_IVB, _PIPE_CRC_RES_2_B_IVB)
+#define PIPE_CRC_RES_2_IVB(pipe)		_MMIO_PIPE((pipe), _PIPE_CRC_RES_2_A_IVB, _PIPE_CRC_RES_2_B_IVB)
 
 /* ivb */
 #define _PIPE_CRC_RES_3_A_IVB		0x6006c
 #define _PIPE_CRC_RES_3_B_IVB		0x6106c
-#define PIPE_CRC_RES_3_IVB(pipe)		_MMIO_PIPE(pipe, _PIPE_CRC_RES_3_A_IVB, _PIPE_CRC_RES_3_B_IVB)
+#define PIPE_CRC_RES_3_IVB(pipe)		_MMIO_PIPE((pipe), _PIPE_CRC_RES_3_A_IVB, _PIPE_CRC_RES_3_B_IVB)
 
 /* ivb */
 #define _PIPE_CRC_RES_4_A_IVB		0x60070
 #define _PIPE_CRC_RES_4_B_IVB		0x61070
-#define PIPE_CRC_RES_4_IVB(pipe)		_MMIO_PIPE(pipe, _PIPE_CRC_RES_4_A_IVB, _PIPE_CRC_RES_4_B_IVB)
+#define PIPE_CRC_RES_4_IVB(pipe)		_MMIO_PIPE((pipe), _PIPE_CRC_RES_4_A_IVB, _PIPE_CRC_RES_4_B_IVB)
 
 /* ivb */
 #define _PIPE_CRC_RES_5_A_IVB		0x60074
 #define _PIPE_CRC_RES_5_B_IVB		0x61074
-#define PIPE_CRC_RES_5_IVB(pipe)		_MMIO_PIPE(pipe, _PIPE_CRC_RES_5_A_IVB, _PIPE_CRC_RES_5_B_IVB)
+#define PIPE_CRC_RES_5_IVB(pipe)		_MMIO_PIPE((pipe), _PIPE_CRC_RES_5_A_IVB, _PIPE_CRC_RES_5_B_IVB)
 
 /* hsw+ */
 #define _PIPE_CRC_EXP_A_HSW		0x60054
 #define _PIPE_CRC_EXP_B_HSW		0x61054
-#define PIPE_CRC_EXP_HSW(pipe)			_MMIO_PIPE(pipe, _PIPE_CRC_EXP_A_HSW, _PIPE_CRC_EXP_B_HSW)
+#define PIPE_CRC_EXP_HSW(pipe)			_MMIO_PIPE((pipe), _PIPE_CRC_EXP_A_HSW, _PIPE_CRC_EXP_B_HSW)
 
 /* hsw+ */
 #define _PIPE_CRC_RES_A_HSW		0x60064
 #define _PIPE_CRC_RES_B_HSW		0x61064
-#define PIPE_CRC_RES_HSW(pipe)			_MMIO_PIPE(pipe, _PIPE_CRC_RES_A_HSW, _PIPE_CRC_RES_B_HSW)
+#define PIPE_CRC_RES_HSW(pipe)			_MMIO_PIPE((pipe), _PIPE_CRC_RES_A_HSW, _PIPE_CRC_RES_B_HSW)
 
 #endif /* __INTEL_PIPE_CRC_REGS_H__ */
-- 
2.25.1

