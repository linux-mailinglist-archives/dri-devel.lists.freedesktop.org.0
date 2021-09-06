Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520DD4020D9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 23:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E6D89CF8;
	Mon,  6 Sep 2021 21:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99289CE1;
 Mon,  6 Sep 2021 21:01:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="283747437"
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="283747437"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,273,1624345200"; d="scan'208";a="537362178"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 14:01:08 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, ville.syrjala@linux.intel.com, ppaalanen@gmail.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net,
 Shashank.Sharma@amd.com, Uma Shankar <uma.shankar@intel.com>
Subject: [RFC v2 06/22] drm/i915/xelpd: Add register definitions for Plane
 Degamma
Date: Tue,  7 Sep 2021 03:08:48 +0530
Message-Id: <20210906213904.27918-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
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

Add macros to define Plane Degamma registers

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 313432ed6196..919982c878ac 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -262,6 +262,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 					      INTEL_INFO(dev_priv)->cursor_offsets[PIPE_A] + (reg) + \
 					      DISPLAY_MMIO_BASE(dev_priv))
 
+/* Plane Gamma Registers */
+#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
+
 #define __MASKED_FIELD(mask, value) ((mask) << 16 | (value))
 #define _MASKED_FIELD(mask, value) ({					   \
 	if (__builtin_constant_p(mask))					   \
@@ -11366,6 +11369,55 @@ enum skl_power_gate {
 					_PAL_PREC_MULTI_SEG_DATA_A, \
 					_PAL_PREC_MULTI_SEG_DATA_B)
 
+/* Display13 Plane Degmma Reg */
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B	0x712d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A	0x701d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B	0x711d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A	0x702d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B	0x712d4
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_A	0x704d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1_B	0x714d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_A	0x705d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_2_B	0x715d0
+#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_1_B)
+#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
+						_PLANE_PRE_CSC_GAMC_INDEX_2_B)
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_PRE_CSC_GAMC_DATA_1_A	0x704d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1_B	0x714d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_A	0x705d4
+#define _PLANE_PRE_CSC_GAMC_DATA_2_B	0x715d4
+#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_1_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_1_B)
+#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)	_PIPE(pipe, _PLANE_PRE_CSC_GAMC_DATA_2_A, \
+						_PLANE_PRE_CSC_GAMC_DATA_2_B)
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+		_PLANE_PRE_CSC_GAMC_DATA_2(pipe))
+
 /* pipe CSC & degamma/gamma LUTs on CHV */
 #define _CGM_PIPE_A_CSC_COEFF01	(VLV_DISPLAY_BASE + 0x67900)
 #define _CGM_PIPE_A_CSC_COEFF23	(VLV_DISPLAY_BASE + 0x67904)
-- 
2.26.2

