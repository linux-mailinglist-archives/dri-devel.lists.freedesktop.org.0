Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7165FBFFC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 06:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E011710E33C;
	Wed, 12 Oct 2022 04:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E573410E321;
 Wed, 12 Oct 2022 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665550303; x=1697086303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hzo02FYd5kgYgvebJ4cPMaJTtQSmqXNmg4sPCFpzJxM=;
 b=nvbRW788KUVD3A6SqkihoSDrJhgtY7KILfvKI7YuB3sylE1eLn473VDJ
 p1ybctg2Uk5Lv+thNt2tFXFtdUCA1ATgpE9SxL8exyp94NGMMVg1hVsng
 AcF6LAUakm4Lc78y8Bi3JRLd2goxn9Jq64WeiPNCOik516p6G6w5Ui56P
 8h1CByDYymjipiwPlxI3JddrgLSgfVqhX90FwWmHLVi/OMFV9xf6vzRwd
 yP2upQFj8LXCbsPP3BFR4RGsO35cMtzXPwXy3lIRzLenyt38gf1bNVKJY
 ++v/XB+rPkGhvecs2ndGjGwpjStr2NXk9qun4m8MsiFk4Nsqtwb2vH3Sw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284423462"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="284423462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577698661"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="577698661"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 21:51:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] drm/i915: Convert pll macros to _PICK_EVEN_RANGES
Date: Tue, 11 Oct 2022 21:51:10 -0700
Message-Id: <20221011-pick-even-ranges-v1-3-1aaea52752ed@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
References: <20221011-pick-even-ranges-v1-0-1aaea52752ed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.1
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid the array lookup, converting the PLL macros after ICL to
_PICK_EVEN_RANGES. This provides the following reduction in code size:

	$ size build64/drivers/gpu/drm/i915/i915.o{.old,.new}
	   text    data     bss     dec     hex filename
	3570297  131232    6824 3708353  3895c1 build64/drivers/gpu/drm/i915/i915.o.old
	3569686  131232    6824 3707742  38935e build64/drivers/gpu/drm/i915/i915.o.new

At the same time it's safer, avoiding out-of-bounds array access.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit 592d15e3d72009bfb9f7a933c292510f8564a4cf)
---
 drivers/gpu/drm/i915/i915_reg.h | 59 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ad8f839046f5..df30bcc53489 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7313,13 +7313,15 @@ enum skl_power_gate {
 #define   PLL_LOCK		REG_BIT(30)
 #define   PLL_POWER_ENABLE	REG_BIT(27)
 #define   PLL_POWER_STATE	REG_BIT(26)
-#define ICL_DPLL_ENABLE(pll)	_MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-					   _ADLS_DPLL2_ENABLE, _ADLS_DPLL3_ENABLE)
+#define ICL_DPLL_ENABLE(pll)	_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 3,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_ADLS_DPLL3_ENABLE, _ADLS_DPLL3_ENABLE))
 
 #define _DG2_PLL3_ENABLE	0x4601C
 
-#define DG2_PLL_ENABLE(pll) _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-				       _ADLS_DPLL2_ENABLE, _DG2_PLL3_ENABLE)
+#define DG2_PLL_ENABLE(pll)	_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 3,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_DG2_PLL3_ENABLE, _DG2_PLL3_ENABLE))
 
 #define TBT_PLL_ENABLE		_MMIO(0x46020)
 
@@ -7332,8 +7334,9 @@ enum skl_power_gate {
 					   _MG_PLL2_ENABLE)
 
 /* DG1 PLL */
-#define DG1_DPLL_ENABLE(pll)    _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-					   _MG_PLL1_ENABLE, _MG_PLL2_ENABLE)
+#define DG1_DPLL_ENABLE(pll)    _MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_MG_PLL1_ENABLE, _MG_PLL2_ENABLE))
 
 /* ADL-P Type C PLL */
 #define PORTTC1_PLL_ENABLE	0x46038
@@ -7393,9 +7396,9 @@ enum skl_power_gate {
 #define _TGL_DPLL0_CFGCR0		0x164284
 #define _TGL_DPLL1_CFGCR0		0x16428C
 #define _TGL_TBTPLL_CFGCR0		0x16429C
-#define TGL_DPLL_CFGCR0(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR0, \
-						  _TGL_DPLL1_CFGCR0, \
-						  _TGL_TBTPLL_CFGCR0)
+#define TGL_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _TGL_TBTPLL_CFGCR0, _TGL_TBTPLL_CFGCR0))
 #define RKL_DPLL_CFGCR0(pll)		_MMIO_PLL(pll, _TGL_DPLL0_CFGCR0, \
 						  _TGL_DPLL1_CFGCR0)
 
@@ -7408,40 +7411,36 @@ enum skl_power_gate {
 #define _TGL_DPLL0_CFGCR1		0x164288
 #define _TGL_DPLL1_CFGCR1		0x164290
 #define _TGL_TBTPLL_CFGCR1		0x1642A0
-#define TGL_DPLL_CFGCR1(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _TGL_TBTPLL_CFGCR1)
+#define TGL_DPLL_CFGCR1(pll)		_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR1, _TGL_DPLL1_CFGCR1,	\
+					      _TGL_TBTPLL_CFGCR1, _TGL_TBTPLL_CFGCR1))
 #define RKL_DPLL_CFGCR1(pll)		_MMIO_PLL(pll, _TGL_DPLL0_CFGCR1, \
 						  _TGL_DPLL1_CFGCR1)
 
 #define _DG1_DPLL2_CFGCR0		0x16C284
 #define _DG1_DPLL3_CFGCR0		0x16C28C
-#define DG1_DPLL_CFGCR0(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR0, \
-						   _TGL_DPLL1_CFGCR0, \
-						   _DG1_DPLL2_CFGCR0, \
-						   _DG1_DPLL3_CFGCR0)
+#define DG1_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _DG1_DPLL2_CFGCR0, _DG1_DPLL3_CFGCR0))
 
 #define _DG1_DPLL2_CFGCR1               0x16C288
 #define _DG1_DPLL3_CFGCR1               0x16C290
-#define DG1_DPLL_CFGCR1(pll)            _MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _DG1_DPLL2_CFGCR1, \
-						   _DG1_DPLL3_CFGCR1)
+#define DG1_DPLL_CFGCR1(pll)            _MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR1, _TGL_DPLL1_CFGCR1,	\
+					      _DG1_DPLL2_CFGCR1, _DG1_DPLL3_CFGCR1))
 
 /* For ADL-S DPLL4_CFGCR0/1 are used to control DPLL2 */
-#define _ADLS_DPLL3_CFGCR0		0x1642C0
 #define _ADLS_DPLL4_CFGCR0		0x164294
-#define ADLS_DPLL_CFGCR0(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR0, \
-						   _TGL_DPLL1_CFGCR0, \
-						   _ADLS_DPLL4_CFGCR0, \
-						   _ADLS_DPLL3_CFGCR0)
+#define _ADLS_DPLL3_CFGCR0		0x1642C0
+#define ADLS_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _ADLS_DPLL4_CFGCR0, _ADLS_DPLL3_CFGCR0))
 
-#define _ADLS_DPLL3_CFGCR1		0x1642C4
 #define _ADLS_DPLL4_CFGCR1		0x164298
-#define ADLS_DPLL_CFGCR1(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _ADLS_DPLL4_CFGCR1, \
-						   _ADLS_DPLL3_CFGCR1)
+#define _ADLS_DPLL3_CFGCR1		0x1642C4
+#define ADLS_DPLL_CFGCR1(pll)		_MMIO(_PICK_EVEN_RANGES(pll, (pll) < 2,		\
+					      _TGL_DPLL0_CFGCR1, _TGL_DPLL1_CFGCR1,	\
+					      _ADLS_DPLL4_CFGCR1, _ADLS_DPLL3_CFGCR1))
 
 #define _DKL_PHY1_BASE			0x168000
 #define _DKL_PHY2_BASE			0x169000

-- 
b4 0.10.1
