Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782F6782E0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 18:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26410E519;
	Mon, 23 Jan 2023 17:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362FC10E518;
 Mon, 23 Jan 2023 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674494384; x=1706030384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYlTUJia2PPRqzLHgZoAan+KxnPulykiLoi1lyWnpoM=;
 b=jP8WhLONgBIoPxRHSR07TEgOljj2xBJt25xWTXcRVqCMkiA/uFowM4n1
 WuYwg0X1ISLhD/GfqPMNKVpPLOvQit4J+BWzirt9PaXwJPjLRzJM3tqmc
 6O9ePdOwX6dq1r9ZYTU6zvb9oQvWXiuEYAUAd+EuycuN+5erlMQKisOrR
 2hmiQa9Y8KDPaVgjNCA7577jLys1315yW1Oh9mOhrHpd+NZtTkv5j/8u/
 7M8/Sks9W/wS0ibu8eTKkzSSsF0g1roAKY5WPwn/dRmhSYvLRwOg0CV7e
 O952blHRsQMWuFDzmehRpBU+O8rWwrdoZyUSevlASGe7Ii07MVTiGXMzu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328185707"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="328185707"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:16:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639264909"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="639264909"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:16:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2.1] drm/i915: Add _PICK_EVEN_2RANGES()
Date: Mon, 23 Jan 2023 09:15:56 -0800
Message-Id: <20230123171556.3322164-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193457.3295977-2-lucas.demarchi@intel.com>
References: <20230120193457.3295977-2-lucas.demarchi@intel.com>
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

v2: Fix the address expansion in the  example (Anusha)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index be43580a6979..bab6a9ec2ddd 100644
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

