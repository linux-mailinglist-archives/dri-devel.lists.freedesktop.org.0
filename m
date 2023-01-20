Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F315675E22
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB31E10EAF9;
	Fri, 20 Jan 2023 19:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BBC10E39E;
 Fri, 20 Jan 2023 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674243317; x=1705779317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PDRZreVYUxY3F2JcBZ+8Vj7vod49Vq8JSDd72Fsl+V4=;
 b=aKJLJ7umfxZQ9k4JTccTYeoGTM4aF50A/yLlwBpbkPnAyIoQ/5gYOK+5
 +0A2sy1ozhCBnlZDzCZ1PF1FTx+I2mcHqz+8PJzIb15xkzOx9VjrIQbbQ
 7yWoB0OF9F9S7lk3feL2JP/XjNj1OYAcviMR+wTOPVTF5WaprgyT93IMJ
 PtuJg6q7uYkhQSFO1SiftbTj4KM8NOjgmKX/M/3DG92iphOOX0N6/QVb7
 NI2zrnOYPONQ10U8OUaK6OFJraEX/2TN+DjKjq0F0lK47Vbmu/Mhu4u+B
 DPBsC0BWkRJTmCJKXwJUnPm2rK3W+7Z7vns8ZTbNE5a6CZZIEI17BfcMi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="411903528"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="411903528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834518297"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="834518297"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:35:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
Date: Fri, 20 Jan 2023 11:34:50 -0800
Message-Id: <20230120193457.3295977-2-lucas.demarchi@intel.com>
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

It's a constant pattern in the driver to need to use 2 ranges of MMIOs
based on port, phy, pll, etc. When that happens, instead of using
_PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
due to some reasons like:

1) It increases the code size since the array is declared
   in each call site
2) Developers need to be careful not to incur an
   out-of-bounds array access
3) Developers need to be careful that the indexes match the
   table. For that it may be that the table needs to contain
   holes, making (1) even worse.

Add a variant of _PICK_EVEN() that works with 2 ranges and selects which
one to use depending on the index value.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index be43580a6979..b7ec87464d69 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -119,6 +119,34 @@
  */
 #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
 
+/*
+ * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
+ * The first range is used for indexes below @__c_index, and the second
+ * range is used for anything above it. Example::
+ *
+ * #define _FOO_A			0xf000
+ * #define _FOO_B			0xf004
+ * #define _FOO_C			0xf008
+ * #define _SUPER_FOO_A			0xa000
+ * #define _SUPER_FOO_B			0xa100
+ * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,		\
+ *					      _FOO_A, _FOO_B,			\
+ *					      _SUPER_FOO_A, _SUPER_FOO_B))
+ *
+ * This expands to:
+ *	0: 0xf000,
+ *	1: 0xf004,
+ *	2: 0xf008,
+ *	3: 0xa100,
+ *	4: 0xa200,
+ *	5: 0xa300,
+ *	...
+ */
+#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
+	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
+	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
+				   _PICK_EVEN((__index) - (__c_index), __c, __d)))
+
 /*
  * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
  *
-- 
2.39.0

