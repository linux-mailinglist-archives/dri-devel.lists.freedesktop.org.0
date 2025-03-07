Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA08A56E3E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305610EBED;
	Fri,  7 Mar 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gd3jT/cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582610EBEF;
 Fri,  7 Mar 2025 16:49:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C947DA43EC3;
 Fri,  7 Mar 2025 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F28F7C4CEE2;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741366178;
 bh=54wka74Fp0zqh1u6XsUsJBRpPbsbeMMktieA0LvyD2U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Gd3jT/czaw4IDIbDQMULKTh0eKh6eT6G6106lulbyhp+4PaxuE0R8atwa0DIwtpLd
 dDZGNUw6TeKEOfiNJlffEwS/Og6BrphgzhEOg3gLDq9G1XYpJ9/7GmGMElvEQ6cc1/
 reZUMvEjQGz4161di2lPS8vCSiQSMfXY9lEB4VsHbdgvDiwK701ue25qPiKDngPSqU
 h4zIer32/tGVxlpZ57OBJebyVmAbXEW1GuehLrSrOfzTh4yF1VZseir2w91TpTUAnf
 HLD45v+2ySdNPMJ5TbMb0LN8dFcNrvkKMrkAM3D1Pum8scLReyoJd2Jib8YYsYjPKU
 MmCdZxtq2SZOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E5B4CC28B26;
 Fri,  7 Mar 2025 16:49:37 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Sat, 08 Mar 2025 01:48:49 +0900
Subject: [PATCH v6 2/7] bits: introduce fixed-type genmasks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
In-Reply-To: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6361;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=CzbCc4cvmsTpWxzZbN4iqzEc27KjdIucQoTUeKsPeQY=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmnlXvuf3uqzH59+bwYl/Ot2S+n7pBbJrfAJLle7KbO7
 5VMqt/tO0pZGMS4GGTFFFmWlXNyK3QUeocd+msJM4eVCWQIAxenAEzEk4nhf3RQ0eqcG/89G7yO
 lp/k+bFGPnD55DSml0kH59qI2C+UTGFkeDvFWqG2UeTwzMDu/gMcJqIGTpEzqmbdnWdZXC7yzp+
 VEwA=
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yury Norov <yury.norov@gmail.com>

Add GENMASK_TYPE() which generalizes __GENMASK() to support different
types, and implement fixed-types versions of GENMASK() based on it.
The fixed-type version allows more strict checks to the min/max values
accepted, which is useful for defining registers like implemented by
i915 and xe drivers with their REG_GENMASK*() macros.

The strict checks rely on shift-count-overflow compiler check to fail
the build if a number outside of the range allowed is passed.
Example:

  #define FOO_MASK GENMASK_U32(33, 4)

will generate a warning like:

  include/linux/bits.h:51:27: error: right shift count >= width of type [-Werror=shift-count-overflow]
     51 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
        |                           ^~

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Co-developed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v5 -> v6:

    - No changes.

  v4 -> v5:

    - Rename GENMASK_t() to GENMASK_TYPE().

    - Fix typo in patch description.

    - Use tab indentations instead of single space to separate the
      macro name from its body.

    - s/__GENMASK_U*()/GENMASK_U*()/g in the comment.

    - Add a tag to credit myself as Co-developer. Keep Yury as the
      main author.

    - Modify GENMASK_TYPE() to match the changes made to __GENMASK()
      in: https://github.com/norov/linux/commit/1e7933a575ed

    - Replace (t)~_ULL(0) with type_max(t). This is OK because
      GENMASK_TYPE() is not available in asm.

    - linux/const.h and asm/bitsperlong.h are not used anymore. Remove
      them.

    - Apply GENMASK_TYPE() to GENMASK_U128().

    - Remove the unsigned int cast for the U8 and U16 variants. Cast
      to the target type instead. Do that cast directly in
      GENMASK_TYPE().

  v3 -> v4:

    - The v3 is one year old. Meanwhile people started using
      __GENMASK() directly. So instead of generalizing __GENMASK() to
      support different types, add a new GENMASK_t().

    - replace ~0ULL by ~_ULL(0). Otherwise, GENMASK_t() would fail in
      asm code.

    - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
      v3, due to the integer promotion rules, these were returning a
      signed integer. By casting these to unsigned int, at least the
      signedness is kept.
---
 include/linux/bitops.h |  1 -
 include/linux/bits.h   | 55 ++++++++++++++++++++++++++++++++------------------
 2 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -8,7 +8,6 @@
 
 #include <uapi/linux/kernel.h>
 
-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
 #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
 #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
diff --git a/include/linux/bits.h b/include/linux/bits.h
index 9c1c7ce0bba6bb09490d891904c143a5394fd512..b690611c769be61ab2b5ced43c8302ba5693308b 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -2,16 +2,15 @@
 #ifndef __LINUX_BITS_H
 #define __LINUX_BITS_H
 
-#include <linux/const.h>
 #include <vdso/bits.h>
 #include <uapi/linux/bits.h>
-#include <asm/bitsperlong.h>
 
 #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
 #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
 #define BITS_PER_BYTE		8
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
@@ -20,28 +19,44 @@
  */
 #if !defined(__ASSEMBLY__)
 
-#include <linux/build_bug.h>
-#include <linux/compiler.h>
-
-#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
-
-#define GENMASK(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
-#define GENMASK_ULL(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
-
 /*
  * Missing asm support
  *
- * __GENMASK_U128() depends on _BIT128() which would not work
- * in the asm code, as it shifts an 'unsigned __int128' data
- * type instead of direct representation of 128 bit constants
- * such as long and unsigned long. The fundamental problem is
- * that a 128 bit constant will get silently truncated by the
- * gcc compiler.
+ * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),
+ * something not available in asm. Nethertheless, fixed width integers
+ * is a C concept. Assembly code can rely on the long and long long
+ * versions instead.
  */
-#define GENMASK_U128(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
+
+#include <linux/build_bug.h>
+#include <linux/compiler.h>
+#include <linux/overflow.h>
+
+#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
+
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
+#define GENMASK_TYPE(t, h, l)					\
+	((t)(GENMASK_INPUT_CHECK(h, l) +			\
+	     (type_max(t) << (l) &				\
+	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
+
+#define GENMASK(h, l)		GENMASK_TYPE(unsigned long,  h, l)
+#define GENMASK_ULL(h, l)	GENMASK_TYPE(unsigned long long, h, l)
+
+#define GENMASK_U8(h, l)	GENMASK_TYPE(u8, h, l)
+#define GENMASK_U16(h, l)	GENMASK_TYPE(u16, h, l)
+#define GENMASK_U32(h, l)	GENMASK_TYPE(u32, h, l)
+#define GENMASK_U64(h, l)	GENMASK_TYPE(u64, h, l)
+#define GENMASK_U128(h, l)	GENMASK_TYPE(u128, h, l)
 
 #else /* defined(__ASSEMBLY__) */
 

-- 
2.45.3


