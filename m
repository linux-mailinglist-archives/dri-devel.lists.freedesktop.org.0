Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54D675E23
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032D110EAFD;
	Fri, 20 Jan 2023 19:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCF210E39E;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243317; x=1705779317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6XEEI1FKRKiL/BEIedryEjxch9aMp4GChCxcfO5JYwA=;
 b=jWibrkBhz6kK0+OwXUBqnUaEv+MSHijh9IBnAw0AYd+gDcTLnRKlFFCU
 XDPKBD+PLw60AQpVCzOu6HSPQzCFKR64ro6x7WaKwFLKDXd96zLthVfaz
 Lh+1+qGoqWU07mYydLDZfhu67HHqwMpj1vXbLAjXM3YGWIkpQRkkYxWOO
 nBXg4NQwGcdFDEBKCBgwgFPiiEG9rR1h7/Kser09V3nLRRym7seSbtuC0
 YffUNIAK5XD9tcBc87vhhU3XqERtypGYLg+Cgo3hb9M7ap9RVMBJkv33r
 oxwpY2bXtdaE01pzVS3LCbVRNalh+T4VUn2oSOnfdBRVMaWvebzabstuf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903533"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903533"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518307"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518307"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/i915: Convert pll macros to _PICK_EVEN_2RANGES
Date: Fri, 20 Jan 2023 11:34:52 -0800
Message-Id: <20230120193457.3295977-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193457.3295977-1-lucas.demarchi@intel.com>
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid the array lookup, converting the PLL macros after ICL to
_PICK_EVEN_RANGES. This provides the following reduction in code size:

	$ size build64/drivers/gpu/drm/i915/i915.o{.old,.new}
	   text    data     bss     dec     hex filename
	4027456  185703    6984 4220143  4064ef build64/drivers/gpu/drm/i915/i915.o.old
	4026997  185703    6984 4219684  406324 build64/drivers/gpu/drm/i915/i915.o.new

At the same time it's safer, avoiding out-of-bounds array access.  This
allows to remove _MMIO_PLL3() that is now unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../drm/i915/display/intel_display_reg_defs.h |  1 -
 drivers/gpu/drm/i915/i915_reg.h               | 59 +++++++++----------
 2 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index 02605418ff08..a4ed1c530799 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -34,7 +34,6 @@
 #define _MMIO_PIPE3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
 #define _MMIO_PORT3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
 #define _MMIO_PHY3(phy, a, b, c)	_MMIO(_PHY3(phy, a, b, c))
-#define _MMIO_PLL3(pll, ...)		_MMIO(_PICK(pll, __VA_ARGS__))
 
 /*
  * Device info offset array based helpers for groups of registers with unevenly
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8da3546d82fb..dd1eb8b10e0e 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7232,13 +7232,15 @@ enum skl_power_gate {
 #define   PLL_LOCK		REG_BIT(30)
 #define   PLL_POWER_ENABLE	REG_BIT(27)
 #define   PLL_POWER_STATE	REG_BIT(26)
-#define ICL_DPLL_ENABLE(pll)	_MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-					   _ADLS_DPLL2_ENABLE, _ADLS_DPLL3_ENABLE)
+#define ICL_DPLL_ENABLE(pll)	_MMIO(_PICK_EVEN_2RANGES(pll, 3,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_ADLS_DPLL3_ENABLE, _ADLS_DPLL3_ENABLE))
 
 #define _DG2_PLL3_ENABLE	0x4601C
 
-#define DG2_PLL_ENABLE(pll) _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-				       _ADLS_DPLL2_ENABLE, _DG2_PLL3_ENABLE)
+#define DG2_PLL_ENABLE(pll)	_MMIO(_PICK_EVEN_2RANGES(pll, 3,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_DG2_PLL3_ENABLE, _DG2_PLL3_ENABLE))
 
 #define TBT_PLL_ENABLE		_MMIO(0x46020)
 
@@ -7251,8 +7253,9 @@ enum skl_power_gate {
 					   _MG_PLL2_ENABLE)
 
 /* DG1 PLL */
-#define DG1_DPLL_ENABLE(pll)    _MMIO_PLL3(pll, _DPLL0_ENABLE, _DPLL1_ENABLE, \
-					   _MG_PLL1_ENABLE, _MG_PLL2_ENABLE)
+#define DG1_DPLL_ENABLE(pll)    _MMIO(_PICK_EVEN_2RANGES(pll, 2,			\
+							_DPLL0_ENABLE, _DPLL1_ENABLE,	\
+							_MG_PLL1_ENABLE, _MG_PLL2_ENABLE))
 
 /* ADL-P Type C PLL */
 #define PORTTC1_PLL_ENABLE	0x46038
@@ -7312,9 +7315,9 @@ enum skl_power_gate {
 #define _TGL_DPLL0_CFGCR0		0x164284
 #define _TGL_DPLL1_CFGCR0		0x16428C
 #define _TGL_TBTPLL_CFGCR0		0x16429C
-#define TGL_DPLL_CFGCR0(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR0, \
-						  _TGL_DPLL1_CFGCR0, \
-						  _TGL_TBTPLL_CFGCR0)
+#define TGL_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _TGL_TBTPLL_CFGCR0, _TGL_TBTPLL_CFGCR0))
 #define RKL_DPLL_CFGCR0(pll)		_MMIO_PLL(pll, _TGL_DPLL0_CFGCR0, \
 						  _TGL_DPLL1_CFGCR0)
 
@@ -7327,40 +7330,36 @@ enum skl_power_gate {
 #define _TGL_DPLL0_CFGCR1		0x164288
 #define _TGL_DPLL1_CFGCR1		0x164290
 #define _TGL_TBTPLL_CFGCR1		0x1642A0
-#define TGL_DPLL_CFGCR1(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _TGL_TBTPLL_CFGCR1)
+#define TGL_DPLL_CFGCR1(pll)		_MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
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
+#define DG1_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _DG1_DPLL2_CFGCR0, _DG1_DPLL3_CFGCR0))
 
 #define _DG1_DPLL2_CFGCR1               0x16C288
 #define _DG1_DPLL3_CFGCR1               0x16C290
-#define DG1_DPLL_CFGCR1(pll)            _MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _DG1_DPLL2_CFGCR1, \
-						   _DG1_DPLL3_CFGCR1)
+#define DG1_DPLL_CFGCR1(pll)            _MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
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
+#define ADLS_DPLL_CFGCR0(pll)		_MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
+					      _TGL_DPLL0_CFGCR0, _TGL_DPLL1_CFGCR0,	\
+					      _ADLS_DPLL4_CFGCR0, _ADLS_DPLL3_CFGCR0))
 
-#define _ADLS_DPLL3_CFGCR1		0x1642C4
 #define _ADLS_DPLL4_CFGCR1		0x164298
-#define ADLS_DPLL_CFGCR1(pll)		_MMIO_PLL3(pll, _TGL_DPLL0_CFGCR1, \
-						   _TGL_DPLL1_CFGCR1, \
-						   _ADLS_DPLL4_CFGCR1, \
-						   _ADLS_DPLL3_CFGCR1)
+#define _ADLS_DPLL3_CFGCR1		0x1642C4
+#define ADLS_DPLL_CFGCR1(pll)		_MMIO(_PICK_EVEN_2RANGES(pll, 2,		\
+					      _TGL_DPLL0_CFGCR1, _TGL_DPLL1_CFGCR1,	\
+					      _ADLS_DPLL4_CFGCR1, _ADLS_DPLL3_CFGCR1))
 
 /* BXT display engine PLL */
 #define BXT_DE_PLL_CTL			_MMIO(0x6d000)
-- 
2.39.0

