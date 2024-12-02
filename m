Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90FA9E0A19
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A43110E803;
	Mon,  2 Dec 2024 17:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnpeLmKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C12510E7F8;
 Mon,  2 Dec 2024 17:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5B024A410F2;
 Mon,  2 Dec 2024 17:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE828C4AF0C;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733160905;
 bh=uAZMv8YsD+O3wlShIE66KqQtYXWRRt5F/8DqFrLry7o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=bnpeLmKTZ0P/1nIlgfq6P/89fGBp79XUw1RuAsTRlXRHCp2izeFvyG+TI1GSO6Kkj
 +vSOTNpWal9tOo9dbUTbh9ga3NCi42/NymrTLb22Q4h+u/cokTPsWtrlid/tRFM1T1
 6dV8OjkixQG4eXBo6SkrUV3AeE/R4D8dTZFDlu9F64ELfy0Kyibo9a/OngDbjQ2PZS
 fRCmDaWTk6tZnYjK8xTrQZoanmydKBBAOMVkExgd7RD1+VOe0fYp5Yw3cTebcM93v7
 5dsvx+CeiiRXTK43GkDDCdvLdYPnost8GIN8ypR562MwwNxO1YQn1QxI+326LAvREB
 1xToeg5fGWCxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E082BD7833D;
 Mon,  2 Dec 2024 17:35:04 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Tue, 03 Dec 2024 02:33:32 +0900
Subject: [PATCH 10/10] compiler.h: remove __is_constexpr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-is_constexpr-refactor-v1-10-4e4cbaecc216@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3686;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=KhSEJ/z9NSPJazKznaA4eGwJC3/rNJqN3dS4dHFF/N0=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOm+7485PP/cFjpv4ddvR2VLOPkvvJfXCD3qLZ3Eld3nt
 LjUeklRRykLgxgXg6yYIsuyck5uhY5C77BDfy1h5rAygQxh4OIUgImY+zH8T7uwUoiP88gRLpWl
 X/NO/Lygvi6i7yFjyKWdpdGpMdvv/2P4H5bWr3/0ydJ1OX+dF13m2GEVIfQr88mHOomEbc+bzFv
 kGAE=
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

Now that all the users of __is_constexpr() have been migrated to
is_const() or one of its friends, remove it.

The homage to Martin Uecker's genius hack remains in the documentation
of __is_const_zero().

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/compiler.h | 47 -----------------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 165aa5b9bc484376087a130a1ac1f3edb50c983d..7ba75044828129cf1f81f458ade695786dbf132a 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -252,53 +252,6 @@ static inline void *offset_to_ptr(const int *off)
 #define __must_be_cstr(p) \
 	__BUILD_BUG_ON_ZERO_MSG(__annotated(p, nonstring), "must be cstr (NUL-terminated)")
 
-/*
- * This returns a constant expression while determining if an argument is
- * a constant expression, most importantly without evaluating the argument.
- * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
- *
- * Details:
- * - sizeof() return an integer constant expression, and does not evaluate
- *   the value of its operand; it only examines the type of its operand.
- * - The results of comparing two integer constant expressions is also
- *   an integer constant expression.
- * - The first literal "8" isn't important. It could be any literal value.
- * - The second literal "8" is to avoid warnings about unaligned pointers;
- *   this could otherwise just be "1".
- * - (long)(x) is used to avoid warnings about 64-bit types on 32-bit
- *   architectures.
- * - The C Standard defines "null pointer constant", "(void *)0", as
- *   distinct from other void pointers.
- * - If (x) is an integer constant expression, then the "* 0l" resolves
- *   it into an integer constant expression of value 0. Since it is cast to
- *   "void *", this makes the second operand a null pointer constant.
- * - If (x) is not an integer constant expression, then the second operand
- *   resolves to a void pointer (but not a null pointer constant: the value
- *   is not an integer constant 0).
- * - The conditional operator's third operand, "(int *)8", is an object
- *   pointer (to type "int").
- * - The behavior (including the return type) of the conditional operator
- *   ("operand1 ? operand2 : operand3") depends on the kind of expressions
- *   given for the second and third operands. This is the central mechanism
- *   of the macro:
- *   - When one operand is a null pointer constant (i.e. when x is an integer
- *     constant expression) and the other is an object pointer (i.e. our
- *     third operand), the conditional operator returns the type of the
- *     object pointer operand (i.e. "int *"). Here, within the sizeof(), we
- *     would then get:
- *       sizeof(*((int *)(...))  == sizeof(int)  == 4
- *   - When one operand is a void pointer (i.e. when x is not an integer
- *     constant expression) and the other is an object pointer (i.e. our
- *     third operand), the conditional operator returns a "void *" type.
- *     Here, within the sizeof(), we would then get:
- *       sizeof(*((void *)(...)) == sizeof(void) == 1
- * - The equality comparison to "sizeof(int)" therefore depends on (x):
- *     sizeof(int) == sizeof(int)     (x) was a constant expression
- *     sizeof(int) != sizeof(void)    (x) was not a constant expression
- */
-#define __is_constexpr(x) \
-	(sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
-
 /*
  * Whether 'type' is a signed type or an unsigned type. Supports scalar types,
  * bool and also pointer types.

-- 
2.45.2


