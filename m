Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549384DAD4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 08:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83FB10E338;
	Thu,  8 Feb 2024 07:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6rh7uuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5520610E1DB;
 Thu,  8 Feb 2024 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707378317; x=1738914317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P15aik6EeWQ68wbdtouiUXL4nbhhcZPj2FNurlsAsHc=;
 b=f6rh7uuu1AD7qy4C8lwUQHpmNpgkz8WNwFsafeaE8RGlvvec08g6Vlxo
 8DF8lPslbvQdDVqRr59z6ls/sJsNzxEfLf2FgMqpcNfvn/4MmrnnEdfcm
 ABQfanop0usOoIQ3jNYf0/5CYPdGDvkxz1gv5izCkHdvYXlhqFmELceC9
 HkXSg92+IbB+z0CHpcSaAnGJG8M8yoPgt34/m4k4E58H3CxkDaMi1ygmz
 0C1pr4swm0TeOVte1Z2gsdzd1UgD1XaIzD54wUKaIZ9/n9SyEq9oqBKxn
 vjjlzio/UB1mfOQuoVMrlKrnHwquAYpVRuqVHE0pZwfbzaanDoCb8NY1E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12242643"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="12242643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6195657"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 3/3] drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*
Date: Wed,  7 Feb 2024 23:45:21 -0800
Message-ID: <20240208074521.577076-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208074521.577076-1-lucas.demarchi@intel.com>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
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

Now that include/linux/bits.h implements fixed-width GENMASK_*, use them
to implement the i915/xe specific macros. Converting each driver to use
the generic macros are left for later, when/if other driver-specific
macros are also generalized.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 108 +++------------------------
 1 file changed, 11 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index a685db1e815d..52f99eb96f86 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -9,76 +9,19 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 
-/**
- * REG_BIT() - Prepare a u32 bit value
- * @__n: 0-based bit number
- *
- * Local wrapper for BIT() to force u32, with compile time checks.
- *
- * @return: Value with bit @__n set.
- */
-#define REG_BIT(__n)							\
-	((u32)(BIT(__n) +						\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
-				 ((__n) < 0 || (__n) > 31))))
-
-/**
- * REG_BIT8() - Prepare a u8 bit value
- * @__n: 0-based bit number
- *
- * Local wrapper for BIT() to force u8, with compile time checks.
- *
- * @return: Value with bit @__n set.
- */
-#define REG_BIT8(__n)                                                   \
-	((u8)(BIT(__n) +                                                \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
-				 ((__n) < 0 || (__n) > 7))))
-
-/**
- * REG_GENMASK() - Prepare a continuous u32 bitmask
- * @__high: 0-based high bit
- * @__low: 0-based low bit
- *
- * Local wrapper for GENMASK() to force u32, with compile time checks.
- *
- * @return: Continuous bitmask from @__high to @__low, inclusive.
- */
-#define REG_GENMASK(__high, __low)					\
-	((u32)(GENMASK(__high, __low) +					\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&	\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
-
-/**
- * REG_GENMASK64() - Prepare a continuous u64 bitmask
- * @__high: 0-based high bit
- * @__low: 0-based low bit
- *
- * Local wrapper for GENMASK_ULL() to force u64, with compile time checks.
- *
- * @return: Continuous bitmask from @__high to @__low, inclusive.
+/*
+ * Wrappers over the generic BIT_* and GENMASK_* implementations,
+ * for compatibility reasons with previous implementation
  */
-#define REG_GENMASK64(__high, __low)					\
-	((u64)(GENMASK_ULL(__high, __low) +				\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&		\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
+#define REG_GENMASK(__high, __low)	GENMASK_U32(__high, __low)
+#define REG_GENMASK64(__high, __low)	GENMASK_U64(__high, __low)
+#define REG_GENMASK16(__high, __low)	GENMASK_U16(__high, __low)
+#define REG_GENMASK8(__high, __low)	GENMASK_U8(__high, __low)
 
-/**
- * REG_GENMASK8() - Prepare a continuous u8 bitmask
- * @__high: 0-based high bit
- * @__low: 0-based low bit
- *
- * Local wrapper for GENMASK() to force u8, with compile time checks.
- *
- * @return: Continuous bitmask from @__high to @__low, inclusive.
- */
-#define REG_GENMASK8(__high, __low)                                     \
-	((u8)(GENMASK(__high, __low) +                                  \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
-				 __is_constexpr(__low) &&               \
-				 ((__low) < 0 || (__high) > 7 || (__low) > (__high)))))
+#define REG_BIT(__n)			BIT_U32(__n)
+#define REG_BIT64(__n)			BIT_U64(__n)
+#define REG_BIT16(__n)			BIT_U16(__n)
+#define REG_BIT8(__n)			BIT_U8(__n)
 
 /*
  * Local integer constant expression version of is_power_of_2().
@@ -143,35 +86,6 @@
  */
 #define REG_FIELD_GET64(__mask, __val)	((u64)FIELD_GET(__mask, __val))
 
-/**
- * REG_BIT16() - Prepare a u16 bit value
- * @__n: 0-based bit number
- *
- * Local wrapper for BIT() to force u16, with compile time
- * checks.
- *
- * @return: Value with bit @__n set.
- */
-#define REG_BIT16(__n)                                                   \
-	((u16)(BIT(__n) +                                                \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
-				 ((__n) < 0 || (__n) > 15))))
-
-/**
- * REG_GENMASK16() - Prepare a continuous u8 bitmask
- * @__high: 0-based high bit
- * @__low: 0-based low bit
- *
- * Local wrapper for GENMASK() to force u16, with compile time
- * checks.
- *
- * @return: Continuous bitmask from @__high to @__low, inclusive.
- */
-#define REG_GENMASK16(__high, __low)                                     \
-	((u16)(GENMASK(__high, __low) +                                  \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
-				 __is_constexpr(__low) &&               \
-				 ((__low) < 0 || (__high) > 15 || (__low) > (__high)))))
 
 /**
  * REG_FIELD_PREP16() - Prepare a u16 bitfield value
-- 
2.43.0

