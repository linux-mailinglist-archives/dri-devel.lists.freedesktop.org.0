Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711267B941
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D983D10E387;
	Wed, 25 Jan 2023 18:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0910E384;
 Wed, 25 Jan 2023 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674671118; x=1706207118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luFlJR26axXNGW2KOgknm2W+fbEZo21xknJ5An4dJZM=;
 b=kW18Cn7sO36LkTpVoltu3tKTEPsLZ89v9ZAry92w1zDrd34aa97B/bL0
 kbbKGKdDxYPaVg2bU0i7cEaA1Nr3o4rHGBLxD2EHYQ0Wm1Ok/jY7+o4Jc
 C7mp0fxRXfbCiAs72O9h2PDmHrm8CZzJssP5TTLzk+7VHskifMEYvPYE6
 72IeBxMDS1dD6OTdI9vUpfUDolWAgYUhYAtFlPKNTk4yPiVvi73k5QSGE
 mzbY+VRjmMOAuuGyFwBANpR++uC946VWvKkFUllGLAHLwjHMHcz3Nv1eM
 MIsbVkT5FmjBzMKBjwAAZgQLgEColYx/uS+x3fZZXhFPY+EGuQYNDPnbt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="353924011"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="353924011"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:25:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="693057953"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="693057953"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 10:25:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2.2] drm/i915: Add _PICK_EVEN_2RANGES()
Date: Wed, 25 Jan 2023 10:24:03 -0800
Message-Id: <20230125182403.7526-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124074525.xqprvxdtvkodcgdj@ldmartin-desk2.lan>
References: <20230124074525.xqprvxdtvkodcgdj@ldmartin-desk2.lan>
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
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

v2: Fix the address expansion in the example (Anusha)
v3: Also rename macro to _PICK_EVEN_2RANGES() in the documentation
    and reword it to clarify what ranges are chosen based on the index
    (Jani)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index be43580a6979..983c5aa3045b 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -119,6 +119,35 @@
  */
 #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
 
+/*
+ * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
+ * @__c_index corresponds to the index in which the second range starts to be
+ * used. Using math interval notation, the first range is used for indexes [ 0,
+ * @__c_index), while the second range is used for [ @__c_index, ... ). Example:
+ *
+ * #define _FOO_A			0xf000
+ * #define _FOO_B			0xf004
+ * #define _FOO_C			0xf008
+ * #define _SUPER_FOO_A			0xa000
+ * #define _SUPER_FOO_B			0xa100
+ * #define FOO(x)			_MMIO(_PICK_EVEN_2RANGES(x, 3,		\
+ *					      _FOO_A, _FOO_B,			\
+ *					      _SUPER_FOO_A, _SUPER_FOO_B))
+ *
+ * This expands to:
+ *	0: 0xf000,
+ *	1: 0xf004,
+ *	2: 0xf008,
+ *	3: 0xa000,
+ *	4: 0xa100,
+ *	5: 0xa200,
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

