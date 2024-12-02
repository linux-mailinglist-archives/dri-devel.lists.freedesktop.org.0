Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D28E9E0A11
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D7010E7EC;
	Mon,  2 Dec 2024 17:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="roR0wmND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8210E75D;
 Mon,  2 Dec 2024 17:35:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A487F5C5D80;
 Mon,  2 Dec 2024 17:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E788C4CED9;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733160904;
 bh=9iW7A+YjBOO9RVnkPZTBuwbq0imIzWIqQzS9oUoJV80=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=roR0wmNDodAzyFfPTgFBBp/KqBd/M1Zco1d6OqO8B8sJlOTrYchslvtT08b9PEPAD
 spi3Zv5Lq4VW/Jihv7VnCNPNtkCFI4MsIeV4lzHFYmMaP7dYZGXCQ8d5TXlEApUNZq
 8xoSLxg+uBDYJRHUQDRQQNT2XbDMV9G+MwlYNwxH7cmYQ06PHmtyFfEE6xh1DLG/UW
 fBq0X8GswKgLTC9l8wZKXKu8xTD6Nt4EJlv1q0krvN4+bcuQhKCJFdz8WlioK9jwoK
 9VKeyHkx1LzW8cff48edd8HPqMCYIPhMmgODxWxXnUj/PlHgA8fMAPfb7UemLpzrLf
 oQq2wYAjdEIDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F2538D7833D;
 Mon,  2 Dec 2024 17:35:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:24 +0900
Subject: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3781;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=ut5SHXlG8TFqM4dSL1voozHgmPfm9PCB5ssUWoNnPGc=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+748Gv37O5/hx2ynzqG0iN+cezF1/Uri8ynPxlkd99
 448enNwUUcpC4MYF4OsmCLLsnJOboWOQu+wQ38tYeawMoEMYeDiFICJTCliZNgwxSRxxgaPNqN9
 SvblgqYXk6R6q/p2hk3PmPP5/5TfZXaMDPsvHppbuS+xzuf2BZ0oL/Hl4l8WKni3vHLVk9a2ddC
 S5AQA
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

__is_constexpr(), while being one of the most glorious one liner hack
ever witnessed by mankind, is overly complex. Following the adoption
of C11 in the kernel, this macro can be simplified through the use of
a _Generic() selection.

First, split the macro in two:

  - __is_const_zero(x): an helper macro; tells whether x is the
    integer constant expression 0 or something else.

  - is_const(x): replacement of __is_constexpr(); tells whether x is a
    integer constant expression.

The split serves two purposes: first make it easier to understand;
second, __is_const_zero() will be reused as a building block for other
is_const_*() macros that will be introduced later on.

The core principle of __is_constexpr() to abuse the return type of the
ternary operator remains, but all the surrounding sizeof() hack
disappear.

On a side note, while not relevant to the kernel, __is_constexpr()
relied on the GNU extension that sizeof(void) is 1. const_expr() does
not use any GNU extensions, making it ISO C compliant.

__is_constexpr() is temporarily kept and will be removed once all its
users get migrated to is_const() (or one of its friend).

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/compiler.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc7bffab9097f8b0450 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
 #define statically_true(x) (__builtin_constant_p(x) && (x))
 #define statically_false(x) (__builtin_constant_p(x) && (x) == 0)
 
+/*
+ * Whether x is the integer constant expression 0 or something else.
+ *
+ * Details:
+ *   - The C11 standard defines in §6.3.2.3.3
+ *       (void *)<integer constant expression with the value 0>
+ *     as a null pointer constant (c.f. the NULL macro).
+ *   - If x evaluates to the integer constant expression 0,
+ *       (void *)(x)
+ *     is a null pointer constant. Else, it is a void * expression.
+ *   - In a ternary expression:
+ *       condition ? operand1 : operand2
+ *     if one of the two operands is of type void * and the other one
+ *     some other pointer type, the C11 standard defines in §6.5.15.6
+ *     the resulting type as below:
+ *       if one operand is a null pointer constant, the result has the
+ *       type of the other operand; otherwise [...] the result type is
+ *       a pointer to an appropriately qualified version of void.
+ *   - As such, in
+ *       0 ? (void *)(x) : (char *)0
+ *     if x is the integer constant expression 0, operand1 is a null
+ *     pointer constant and the resulting type is that of operand2:
+ *     char *. If x is anything else, the type is void *.
+ *   - The (long) cast silences a compiler warning for when x is not 0.
+ *   - Finally, the _Generic() dispatches the resulting type into a
+ *     Boolean.
+ *
+ * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
+ */
+#define __is_const_zero(x) \
+	_Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
+
+/*
+ * Returns a constant expression while determining if its argument is a
+ * constant expression, most importantly without evaluating the argument.
+ *
+ * If getting a constant expression is not relevant to you, use the more
+ * powerful __builtin_constant_p() instead.
+ */
+#define is_const(x) __is_const_zero(0 * (x))
+
 /*
  * This is needed in functions which generate the stack canary, see
  * arch/x86/kernel/smpboot.c::start_secondary() for an example.

-- 
2.45.2


