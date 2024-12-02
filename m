Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4019E0A15
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4C310E7F8;
	Mon,  2 Dec 2024 17:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rJoAowSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A22C10E7F4;
 Mon,  2 Dec 2024 17:35:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4ABB25C5FC0;
 Mon,  2 Dec 2024 17:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6AFFC4CEDF;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733160904;
 bh=XFZ/ReIcnrUD50vCJZHFqXxOz1HrqXseDp2bfbIhVEs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rJoAowSx1LVP7Btyr5lB+8xAdHd7iP7/JAEPrrfN3Xk7muPKGT0/iepah+m+/jhba
 Ar74BLMFdFjoY6XfhjnKewDWfDbbNWm8KYhpPdmtR2c2uI1UoMu+gcUuSlNiVE2y5C
 cLzPppN5gmQTXbxsUODrezXWUbzKIUKreCWfcnGpNv2fMKpniPb2PWEjRBFVycjnqw
 +Px5hGZDoxjmwuxyNrSYJlgdwGWpKd7HSDVJ0o3CXNlMYqxpUOmzvzH4PZ+3tlPI/n
 qt8BcDigGGcCkkUpKS8OkwRHfN7edpW8csZ9LebomUgjbSxuaK0Xl8HZmJN/u+6al8
 HnaEvpg18+ZYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A7656D7833E;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:30 +0900
Subject: [PATCH 08/10] drm/i915/reg: replace __is_const_expr() by
 is_const_true() or is_const()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-8-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 David Laight <David.Laight@aculab.com>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
Cc: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6558;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=IT41eIS+OIIsRMdNS4yKlf8V72ofU+yIl1OolUa3zxc=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+748G+l5SvWBYeEcwf3ZH9lTPGKdm67Bt3/tZLGav/
 10qOqOto5SFQYyLQVZMkWVZOSe3Qkehd9ihv5Ywc1iZQIYwcHEKwESexjIyLH55gHdrk2cszxbF
 xhXdX74eKihrm/W6N9dCbd7DwkLng4wM65yVF6n33pSYytozo6h2wxde748zo9jPf1NZx+O44VI
 lOwA=
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

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Most of the use of __is_const_expr() in i915_reg_defs.h are just to
test whether an expression is known to be true. Because those checks
are all done in a BUILD_BUG_ON_ZERO(), replace those with
is_const_true().

Replace the few other occurrences of __is_const_expr() with is_const().

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 47 +++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index e251bcc0c89f5710125bc70f07851b2cb978c89c..6ed2fb9cf506a3bd6467ba30f9d0e863d62762f3 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -19,8 +19,7 @@
  */
 #define REG_BIT(__n)							\
 	((u32)(BIT(__n) +						\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
-				 ((__n) < 0 || (__n) > 31))))
+	       BUILD_BUG_ON_ZERO(is_const_true((__n) < 0 || (__n) > 31))))
 
 /**
  * REG_BIT8() - Prepare a u8 bit value
@@ -32,8 +31,7 @@
  */
 #define REG_BIT8(__n)                                                   \
 	((u8)(BIT(__n) +                                                \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
-				 ((__n) < 0 || (__n) > 7))))
+	      BUILD_BUG_ON_ZERO(is_const_true((__n) < 0 || (__n) > 7))))
 
 /**
  * REG_GENMASK() - Prepare a continuous u32 bitmask
@@ -46,9 +44,9 @@
  */
 #define REG_GENMASK(__high, __low)					\
 	((u32)(GENMASK(__high, __low) +					\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&	\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
+	       BUILD_BUG_ON_ZERO(is_const_true((__low) < 0 ||		\
+					       (__high) > 31 ||		\
+					       (__low) > (__high)))))
 
 /**
  * REG_GENMASK64() - Prepare a continuous u64 bitmask
@@ -61,9 +59,9 @@
  */
 #define REG_GENMASK64(__high, __low)					\
 	((u64)(GENMASK_ULL(__high, __low) +				\
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&		\
-				 __is_constexpr(__low) &&		\
-				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
+	       BUILD_BUG_ON_ZERO(is_const_true((__low) < 0 ||		\
+					       (__high) > 63 ||		\
+					       (__low) > (__high)))))
 
 /**
  * REG_GENMASK8() - Prepare a continuous u8 bitmask
@@ -76,9 +74,9 @@
  */
 #define REG_GENMASK8(__high, __low)                                     \
 	((u8)(GENMASK(__high, __low) +                                  \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
-				 __is_constexpr(__low) &&               \
-				 ((__low) < 0 || (__high) > 7 || (__low) > (__high)))))
+	      BUILD_BUG_ON_ZERO(is_const_true((__low) < 0 ||            \
+					      (__high) > 7 ||           \
+					      (__low) > (__high)))))
 
 /*
  * Local integer constant expression version of is_power_of_2().
@@ -97,10 +95,10 @@
  */
 #define REG_FIELD_PREP(__mask, __val)						\
 	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
-	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
+	       BUILD_BUG_ON_ZERO(!is_const(__mask)) +				\
 	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
 	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
-	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
+	       BUILD_BUG_ON_ZERO(is_const_true(~((__mask) >> __bf_shf(__mask)) & (__val)))))
 
 /**
  * REG_FIELD_PREP8() - Prepare a u8 bitfield value
@@ -114,10 +112,10 @@
  */
 #define REG_FIELD_PREP8(__mask, __val)                                          \
 	((u8)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
-	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO(!is_const(__mask)) +                           \
 	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U8_MAX) +          \
 	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
-	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
+	       BUILD_BUG_ON_ZERO(is_const_true(~((__mask) >> __bf_shf(__mask)) & (__val)))))
 
 /**
  * REG_FIELD_GET() - Extract a u32 bitfield value
@@ -154,8 +152,7 @@
  */
 #define REG_BIT16(__n)                                                   \
 	((u16)(BIT(__n) +                                                \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
-				 ((__n) < 0 || (__n) > 15))))
+	       BUILD_BUG_ON_ZERO(is_const_true((__n) < 0 || (__n) > 15))))
 
 /**
  * REG_GENMASK16() - Prepare a continuous u8 bitmask
@@ -169,9 +166,9 @@
  */
 #define REG_GENMASK16(__high, __low)                                     \
 	((u16)(GENMASK(__high, __low) +                                  \
-	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
-				 __is_constexpr(__low) &&               \
-				 ((__low) < 0 || (__high) > 15 || (__low) > (__high)))))
+	       BUILD_BUG_ON_ZERO(is_const_true((__low) < 0 ||            \
+					       (__high) > 15 ||          \
+					       (__low) > (__high)))))
 
 /**
  * REG_FIELD_PREP16() - Prepare a u16 bitfield value
@@ -186,10 +183,10 @@
  */
 #define REG_FIELD_PREP16(__mask, __val)                                          \
 	((u16)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +      \
-	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +             \
+	       BUILD_BUG_ON_ZERO(!is_const(__mask)) +                            \
 	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U16_MAX) +          \
 	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
-	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
+	       BUILD_BUG_ON_ZERO(is_const_true(~((__mask) >> __bf_shf(__mask)) & (__val)))))
 
 #define __MASKED_FIELD(mask, value) ((mask) << 16 | (value))
 #define _MASKED_FIELD(mask, value) ({					   \
@@ -237,7 +234,7 @@
  *	...
  */
 #define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
-	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
+	(BUILD_BUG_ON_ZERO(!is_const(__c_index)) +				\
 	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
 				   _PICK_EVEN((__index) - (__c_index), __c, __d)))
 

-- 
2.45.2


