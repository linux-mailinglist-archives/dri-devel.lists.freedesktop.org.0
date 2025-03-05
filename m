Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8DA4FF4D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A9010E793;
	Wed,  5 Mar 2025 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ORmSVe8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7FB10E2A3;
 Wed,  5 Mar 2025 13:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22008A44EF0;
 Wed,  5 Mar 2025 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6522FC4CEEC;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=sg/JYTKwpy/LiLXDO/LiieI5R+JANZCMl/3ZAHkza+E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ORmSVe8LPafMf2l4zSmixJdvDBBShlbDYuRr73U+517dS1a6SMRpgVaxxi4/9Wx2n
 o9NvOQ2dePhLeuEXKrHq/2dJVMp+JGgakwTnEz9s2n5YNwxvE606UJLMyl55XtApKv
 RlULL0A8qvCLBygyxeSMlNePK7N8gCexzgpfORFCq51D71SNPonpeG4yh49EDQnttf
 p5/Z22UlD1TH/KbROM8TWYEC1AKkThxsfwPsgLpYjjDCD+QJM6LCoPXmt22ifBEuPC
 K/HloWJxnlFJ+j6JlafqtSS5SZsetPyvpZgnXmBfVdDDWLDBx5WjlL+FHoSpKvDN4Z
 Oa9OK5qK1xGdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 59FA7C19F32;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:15 +0900
Subject: [PATCH v4 3/8] bits: introduce fixed-type genmasks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
In-Reply-To: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4515;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=mtX+7K6RlQPvgXcR1fwXiZPp9ranIvAEaE9ZvCHecUI=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvP5ahtzRvXgrs6h/e6VV2Kkbbg7p2754dU2Q35BdZ
 T9xC2dgRykLgxgXg6yYIsuyck5uhY5C77BDfy1h5rAygQxh4OIUgImYFTP8T47i2LHtF4/7o0vz
 L/rIvTthmFubIiP1NLiRM6KskqlVj5Hhp2jQhYxrB4wu/ymMieo8ecn4hBHLjx8pU89t/lr15og
 SBwA=
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

Add __GENMASK_t() which generalizes __GENMASK() to support different
types, and implement fixed-types versions of GENMASK() based on it.
The fixed-type version allows more strict checks to the min/max values
accepted, which is useful for defining registers like implemented by
i915 and xe drivers with their REG_GENMASK*() macros.

The strict checks rely on shift-count-overflow compiler check to fail
the build if a number outside of the range allowed is passed.
Example:

	#define FOO_MASK GENMASK_U32(33, 4)

will generate a warning like:

	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
	      |                               ^~

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v3 -> v4:

    - The v3 is one year old. Meanwhile people started using
      __GENMASK() directly. So instead of generalizing __GENMASK() to
      support different types, add a new GENMASK_t().

    - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
      in asm code.

    - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
      v3, due to the integer promotion rules, these were returning a
      signed integer. By casting these to unsigned int, at least the
      signedness is kept.
---
 include/linux/bitops.h |  1 -
 include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

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
index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -12,6 +12,7 @@
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
 #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
 #define BITS_PER_BYTE		8
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
@@ -25,14 +26,38 @@
 
 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
 
-#define GENMASK(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
-#define GENMASK_ULL(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
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
+#define GENMASK_t(t, h, l)				\
+	(GENMASK_INPUT_CHECK(h, l) +			\
+	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
+	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
+
+#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
+#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
 
 /*
  * Missing asm support
  *
+ * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
+ * code as BITS_PER_TYPE() relies on sizeof(), something not available in
+ * asm. Nethertheless, the concept of fixed width integers is a C thing which
+ * does not apply to assembly code.
+ */
+#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
+#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
+#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
+#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
+
+/*
  * __GENMASK_U128() depends on _BIT128() which would not work
  * in the asm code, as it shifts an 'unsigned __int128' data
  * type instead of direct representation of 128 bit constants

-- 
2.45.3


