Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048ED84DAD3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 08:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F310E33F;
	Thu,  8 Feb 2024 07:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJCNTELL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B7410E280;
 Thu,  8 Feb 2024 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707378317; x=1738914317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4UY2L4RJrFs6qSEBykdb5P7iOGl7l18XZf5QdzVkjg=;
 b=HJCNTELLX9ttNzPrgsaVkn+qvxeYpPLAcuPS7fj7uVjx2jyfy8BJwwT8
 sLn3zibxpWg9Zd5aIUhrVnms4zjWxJXGAPQ1+EZJhwz38Jwghg/q1P07g
 kfImAnLqY+KqkXlebyDJepNHxHcjSvedmZqWASkD4hna7sQC7sut2JQnV
 euU4S4q50vhYzCjZbeb2CShnBQ7aSpTyt3INVaEJkMLMcJAw5Y+UXPBwI
 Et1ZOnaOAaAqu55D1SxImBiPLV333Y9kTH4Q7vURrZXdw6tHCDEywbff4
 ellTTLivnVbawR9AZvxVInj9dbxuzjP/HZWwaox+dSv/3FFdNt/c8MqJ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12242637"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="12242637"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6195648"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Date: Wed,  7 Feb 2024 23:45:19 -0800
Message-ID: <20240208074521.577076-2-lucas.demarchi@intel.com>
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

From: Yury Norov <yury.norov@gmail.com>

Generalize __GENMASK() to support different types, and implement
fixed-types versions of GENMASK() based on it. The fixed-type version
allows more strict checks to the min/max values accepted, which is
useful for defining registers like implemented by i915 and xe drivers
with their REG_GENMASK*() macros.

The strict checks rely on shift-count-overflow compiler check to
fail the build if a number outside of the range allowed is passed.
Example:

	#define FOO_MASK GENMASK_U32(33, 4)

will generate a warning like:

	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
	      |                               ^~

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/bitops.h |  1 -
 include/linux/bits.h   | 32 ++++++++++++++++++++++----------
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 2ba557e067fe..1db50c69cfdb 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -15,7 +15,6 @@
 #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
 #endif
 
-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
 #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
 #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
diff --git a/include/linux/bits.h b/include/linux/bits.h
index 7c0cf5031abe..bd56f32de44e 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -6,6 +6,8 @@
 #include <vdso/bits.h>
 #include <asm/bitsperlong.h>
 
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
+
 #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
@@ -30,16 +32,26 @@
 #define GENMASK_INPUT_CHECK(h, l) 0
 #endif
 
-#define __GENMASK(h, l) \
-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
-#define GENMASK(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
+/*
+ * Generate a mask for the specified type @t. Additional checks are made to
+ * guarantee the value returned fits in that type, relying on
+ * shift-count-overflow compiler check to detect incompatible arguments.
+ * For example, all these create build errors or warnings:
+ *
+ * - GENMASK(15, 20): wrong argument order
+ * - GENMASK(72, 15): doesn't fit unsigned long
+ * - GENMASK_U32(33, 15): doesn't fit in a u32
+ */
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
 
-#define __GENMASK_ULL(h, l) \
-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
-#define GENMASK_ULL(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
+#define GENMASK(h, l)		__GENMASK(unsigned long,  h, l)
+#define GENMASK_ULL(h, l)	__GENMASK(unsigned long long, h, l)
+#define GENMASK_U8(h, l)	__GENMASK(u8,  h, l)
+#define GENMASK_U16(h, l)	__GENMASK(u16, h, l)
+#define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
+#define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
 
 #endif	/* __LINUX_BITS_H */
-- 
2.43.0

