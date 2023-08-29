Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6578C92C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B410E421;
	Tue, 29 Aug 2023 15:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B9910E40A;
 Tue, 29 Aug 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324794; x=1724860794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cvpcY2iePscV4T8xoYEZYxgs2BGhWDVtlGobxLU0hKI=;
 b=KrO4e63lidBuGCYQQOh+FPtbzlaTIxTQrMyL28991wfmwPW80iB1Si/L
 836GAGPyXphY5uctCzt5iYIqsqEUNzmbz887Hp2z7ECxXIaMs4Z2gkoep
 u6XYHnqTQQyIuJZxLgvyhh4/tvX0HvlVRa9y0fjDGNs7Sag5uZPkEa1qd
 2AEXBKVGB7jLWHnLywrsGJ/eGZCfEB8z56Y6qxxdm5qdN+WT9zRHa4fc7
 hWa3xXIQki95xYmIKcFAAJ3tHeC6x9TWiDfCvfMc9k6czKieLuJE/lVK2
 0AXxpZ95w3R45sRa3oxpNinObkpAVoiyTSkIvZWE/pmTgQTpwjeLWNLrE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769451"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769451"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555107"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555107"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:32 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 25/33] drm/i915/xelpd: Add register definitions for Plane Degamma
Date: Tue, 29 Aug 2023 21:34:14 +0530
Message-ID: <20230829160422.1251087-26-uma.shankar@intel.com>
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

Add macros to define Plane Degamma registers

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h | 49 +++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d50bfe1000d3..5fa7461066ab 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6226,6 +6226,55 @@ enum skl_power_gate {
 
 #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i) * 4)
 
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
 /* Plane CSC Registers */
 #define _PLANE_CSC_RY_GY_1_A	0x70210
 #define _PLANE_CSC_RY_GY_2_A	0x70310
-- 
2.38.1

