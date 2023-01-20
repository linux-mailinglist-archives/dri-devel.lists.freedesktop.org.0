Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E0675E26
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6200810EB00;
	Fri, 20 Jan 2023 19:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594A10E39E;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243318; x=1705779318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+A6u6Dm+W6VYAnIKR343UApRkptUBLSsC6KlmZwUjTw=;
 b=BGPuaRaq1XoMRN3o0WTjh9JejfsAiremnRacgS51x2agORsEBMlbOO51
 lJyMpf88P1D6az6u/AGogbJBNDtTcx6pQuoEgoiQO4ElQ+B6oit+2NzEk
 7SKPkWxQVfEk1xsluJmh4bZrEQDn6+pUjP9JxCOHaRo9X5/x56DlMl0aY
 rZicjJ88/ejx6oBHPKR1hgYdVCMpmFX05ESAIMFu0KZJhCxHgrM8vqElD
 EVwXHDuLvs6USjQbos6f+e9/6pkQndZLKYZjOGjbaji7R0Pe3hWMYNQXF
 F+qt7MKhWzBTb3i9FVfJ6csrEDXf+Crd71qthotexKDgDXNwNMyOT00ab g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903538"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518310"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518310"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/i915: Replace _MMIO_PHY3() with
 _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:53 -0800
Message-Id: <20230120193457.3295977-5-lucas.demarchi@intel.com>
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

As done previously for pll, also convert users of _PHY3() to
_PICK_EVEN_2RANGES(). Size comparison of i915.o:

	$ size build64/drivers/gpu/drm/i915/i915.o{.old,.new}
	   text    data     bss     dec     hex filename
	4026997  185703    6984 4219684  406324 build64/drivers/gpu/drm/i915/i915.o.old
	4026288  185703    6984 4218975  40605f build64/drivers/gpu/drm/i915/i915.o.new

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../drm/i915/display/intel_display_reg_defs.h    |  3 ---
 drivers/gpu/drm/i915/i915_reg.h                  | 16 +++++++++-------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index a4ed1c530799..f1681e1396b5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -29,11 +29,8 @@
 #define _MMIO_PLL(pll, a, b)		_MMIO(_PLL(pll, a, b))
 #define _MMIO_PHY(phy, a, b)		_MMIO(_PHY(phy, a, b))
 
-#define _PHY3(phy, ...)			_PICK(phy, __VA_ARGS__)
-
 #define _MMIO_PIPE3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
 #define _MMIO_PORT3(pipe, a, b, c)	_MMIO(_PICK(pipe, a, b, c))
-#define _MMIO_PHY3(phy, a, b, c)	_MMIO(_PHY3(phy, a, b, c))
 
 /*
  * Device info offset array based helpers for groups of registers with unevenly
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index dd1eb8b10e0e..fe6385443c4a 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -541,9 +541,10 @@
 #define _BXT_PHY0_BASE			0x6C000
 #define _BXT_PHY1_BASE			0x162000
 #define _BXT_PHY2_BASE			0x163000
-#define BXT_PHY_BASE(phy)		_PHY3((phy), _BXT_PHY0_BASE, \
-						     _BXT_PHY1_BASE, \
-						     _BXT_PHY2_BASE)
+#define BXT_PHY_BASE(phy)							\
+	 _PICK_EVEN_2RANGES(phy, 1,						\
+			    _BXT_PHY0_BASE, _BXT_PHY0_BASE,			\
+			    _BXT_PHY1_BASE, _BXT_PHY2_BASE)
 
 #define _BXT_PHY(phy, reg)						\
 	_MMIO(BXT_PHY_BASE(phy) - _BXT_PHY0_BASE + (reg))
@@ -566,13 +567,14 @@
 #define BXT_PHY_CTL(port)		_MMIO_PORT(port, _BXT_PHY_CTL_DDI_A, \
 							 _BXT_PHY_CTL_DDI_B)
 
-#define _PHY_CTL_FAMILY_EDP		0x64C80
 #define _PHY_CTL_FAMILY_DDI		0x64C90
+#define _PHY_CTL_FAMILY_EDP		0x64C80
 #define _PHY_CTL_FAMILY_DDI_C		0x64CA0
 #define   COMMON_RESET_DIS		(1 << 31)
-#define BXT_PHY_CTL_FAMILY(phy)		_MMIO_PHY3((phy), _PHY_CTL_FAMILY_DDI, \
-							  _PHY_CTL_FAMILY_EDP, \
-							  _PHY_CTL_FAMILY_DDI_C)
+#define BXT_PHY_CTL_FAMILY(phy)							\
+	 _MMIO(_PICK_EVEN_2RANGES(phy, 1,					\
+				  _PHY_CTL_FAMILY_DDI, _PHY_CTL_FAMILY_DDI,	\
+				  _PHY_CTL_FAMILY_EDP, _PHY_CTL_FAMILY_DDI_C))
 
 /* BXT PHY PLL registers */
 #define _PORT_PLL_A			0x46074
-- 
2.39.0

