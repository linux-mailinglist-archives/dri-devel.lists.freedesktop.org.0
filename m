Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC578C933
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930A10E42C;
	Tue, 29 Aug 2023 16:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3305D10E416;
 Tue, 29 Aug 2023 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324797; x=1724860797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWEfxb4Mt2XXx66Z7UHWDh5j6pxl+2VhRAxn/xi1egk=;
 b=WY4wSvRAN+5ZKbnsW6FsORjdwdIJDH2dLtyjH5U01iqymuUZRQ6RAEal
 CGmowVcKu0cR0LH5XtCYgLvNSeEVOi2Sumo/0nnJbuqWcIuvi5ttDt9Sq
 gtjzDSnCy/562V+uwkZoAphbJpvAcCK//VkrveBVJp1k6X+DVN8IF/2Ko
 3PnZXUEtia0rSSM0asdlv37FhgQjHHRqU1WROgS6aHEnMVfwZlY31HNlN
 yDodp0Wzo7CLd+O2HYRuFW77KmudjUO4MLjzqLS7pXG5q+wjqrdWJYmLn
 nwi9mjpYAlQmPmG+NqlBBEYx0jpYF2nUpy8S/fmDRHR6RjT7s7VgwajL/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769465"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555157"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555157"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:38 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 28/33] drm/i915/xelpd: Add register definitions for Plane Post
 CSC
Date: Tue, 29 Aug 2023 21:34:17 +0530
Message-ID: <20230829160422.1251087-29-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add macros to define Plane Post CSC registers

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 73 +++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d26d6294d231..5e4271e7b735 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6226,6 +6226,79 @@ enum skl_power_gate {
 
 #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
 
+/* Display13 Plane Gamma Reg */
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A	0x70160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B	0x71160
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A	0x70260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B	0x71260
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A	0x70164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B	0x71164
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A	0x70264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B	0x71264
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
+							_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A	0x701d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B	0x711d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A	0x702d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B	0x712d8
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A	0x701dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B	0x711dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A	0x702dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B	0x712dc
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_INDEX_1_A	0x704d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1_B	0x714d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_A	0x705d8
+#define _PLANE_POST_CSC_GAMC_INDEX_2_B	0x715d8
+#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_1_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_1_B)
+#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_2_A, \
+						_PLANE_POST_CSC_GAMC_INDEX_2_B)
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+		_PLANE_POST_CSC_GAMC_INDEX_2(pipe))
+
+#define _PLANE_POST_CSC_GAMC_DATA_1_A	0x704dc
+#define _PLANE_POST_CSC_GAMC_DATA_1_B	0x714dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_A	0x705dc
+#define _PLANE_POST_CSC_GAMC_DATA_2_B	0x715dc
+#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_1_A, \
+						_PLANE_POST_CSC_GAMC_DATA_1_B)
+#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)	_PIPE(pipe, _PLANE_POST_CSC_GAMC_DATA_2_A, \
+						_PLANE_POST_CSC_GAMC_DATA_2_B)
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)	\
+		_MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+		_PLANE_POST_CSC_GAMC_DATA_2(pipe))
+
 /* Display13 Plane Degmma Reg */
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
 #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
-- 
2.38.1

