Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF7AA4FF46
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB2710E784;
	Wed,  5 Mar 2025 13:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IjgW0rzb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B404010E2A3;
 Wed,  5 Mar 2025 13:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21FC3A44EE4;
 Wed,  5 Mar 2025 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 512E4C4CEE2;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=n0fFRuhHRihK5Ss638hxm2XFfikVwOkjc/8x8iOccTc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=IjgW0rzb5cvCxl1tLdS+qKkQLO/qXnvdlQx+Lv9OO552fJ2gh4PKIrdvcJN54CnMw
 YmCMkoOmK2fgD07M3Vxn5HmVwKNfdoGT/v4nbgxGvZMWY/MH9v72ml8Bpk+N/t8kaA
 TuD59TA/hYVO71E4QHP39Uu5FN2c7GY4WiOeZOUUny2QbXz4gn4Qo0Eh8gesFuGgtn
 rF3/DMBjB0Kz9krKFHLOtAN/Sauw28kv34gbHcWGm0HEYzN5deKMwNtdMmpbGTCTcD
 SpJoStOy75jV0PfF3pdxTPsINgt+lI3L0KnG6xp5UVqZxYDZihGWBATx42KCyz1OTI
 zchO5t+OHUZpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 43068C28B23;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:14 +0900
Subject: [PATCH v4 2/8] bits: split the definition of the asm and non-asm
 GENMASK()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-2-1873dcdf6723@wanadoo.fr>
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
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=8ZMKzF5zIF0GZ21khxd7rKfGPQljVe1hrWQ81ny4PLk=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvH7tb7504iaTa5t6js2mbJeOxt0P2+Kbk6eFaRjss
 yx7kWzZUcrCIMbFICumyLKsnJNboaPQO+zQX0uYOaxMIEMYuDgFYCLyVxgZWuuCGgWa1gZ3TeNR
 WzuH0euLw4YvTRoWUQ1HzmXavF3rxfCH99SUuc7xTD8DZ91rPDxZ5KeFSa1LqOinr/qGa+wKU6s
 ZAA==
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

In an upcoming change, GENMASK() and its friends will indirectly
depend on sizeof() which is not available in asm.

Instead of adding further complexity to __GENMASK() to make it work
for both asm and non asm, just split the definition of the two
variants.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/bits.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 14fd0ca9a6cd17339dd2f69e449558312a8a001b..5f68980a1b98d771426872c74d7b5c0f79e5e802 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -19,23 +19,17 @@
  * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
  */
 #if !defined(__ASSEMBLY__)
+
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
+
 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
-#else
-/*
- * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
- * disable the input check if that is the case.
- */
-#define GENMASK_INPUT_CHECK(h, l) 0
-#endif
 
 #define GENMASK(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
 #define GENMASK_ULL(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
 
-#if !defined(__ASSEMBLY__)
 /*
  * Missing asm support
  *
@@ -48,6 +42,12 @@
  */
 #define GENMASK_U128(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
-#endif
+
+#else /* defined(__ASSEMBLY__) */
+
+#define GENMASK(h, l) __GENMASK(h, l)
+#define GENMASK_ULL(h, l) __GENMASK_ULL(h, l)
+
+#endif /* !defined(__ASSEMBLY__) */
 
 #endif	/* __LINUX_BITS_H */

-- 
2.45.3


