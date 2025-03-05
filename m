Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C5A4FF4A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375710E78C;
	Wed,  5 Mar 2025 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEW7VRMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED6D10E298;
 Wed,  5 Mar 2025 13:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BBB75C68DD;
 Wed,  5 Mar 2025 12:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4B89C4CEEA;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=jBulJBsQDsmZ+7gYslIXgaGx3Z1AxV9nKCERdGzerFY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=WEW7VRMAup3lMtM0xi5hp8QFrMhhIM+A6pdLbYkS+LJOepwAhaNN1qylX4eRmP0YM
 bPvnPf2dfzJcWWw7Z+y6z/K6wanMhxgDOsT/i/xhH0/1shXfwZIhBkS298VKCKLe/g
 WzBnpw6+NBt6pfduj0lpSXwvKTLVIFjdveOlhSu978WLFvKx5fK+G/Cfx9w/B4+xsP
 oByyXq05gPLILP7eMSbFmQuBghC86vgqttnlwBBq48acYAHCsYPBkBSo9Zfz5b6d7X
 cYlDWgUi1rMiADJKZOQiIEC13TZQLD+/BSSNyJvV+6Dr9EPi/+tW8dmLUXIgcbY65r
 9cukkz4h2O3TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AB5BFC19F32;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:19 +0900
Subject: [PATCH v4 7/8] test_bits: add tests for fixed-type genmasks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-7-1873dcdf6723@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=6fF3lmUI34VqSidAE1kjdgVqFzIg5Vy61JGFsmAXd2w=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvDn+Xs2896/u5IRHUivE994NEE9/e/zhaYFrIUJ9I
 tuevBa721HKwiDGxSArpsiyrJyTW6Gj0Dvs0F9LmDmsTCBDGLg4BWAifCqMDNtuKi+QNrT6yrTy
 7ILVka/t3s09136hftIn4yk3+w3PB19kZDiXLaKjs1B/ofdvr0bLHXd0pHr82QS/zVq5e86PCQp
 LrzAAAA==
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Add some additional tests in lib/test_bits.c to cover the
expected/non-expected values of the fixed-type genmasks.

Also check that the result value matches the expected type. Since
those are known at build time, use static_assert() instead of normal
kunit tests.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v3 -> v4:

    - Adjust the type of GENMASK_U8()/GENMASK_U16() from u8/u16 to
      unsigned int.

    - Reorder the tests to match the order in which the macros are
      declared in bits.h.
---
 lib/test_bits.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/test_bits.c b/lib/test_bits.c
index dc93ded9fdb201e0d44b3c1cd71e233fd62258a5..c3a40995a2577322252371eb10ada0c33fb5d9b4 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -5,7 +5,16 @@
 
 #include <kunit/test.h>
 #include <linux/bits.h>
+#include <linux/types.h>
 
+#define assert_type(t, x) _Generic(x, t: x, default: 0)
+
+static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
+static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
+static_assert(assert_type(unsigned int, GENMASK_U8(7, 0)) == U8_MAX);
+static_assert(assert_type(unsigned int, GENMASK_U16(15, 0)) == U16_MAX);
+static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
+static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
 static void __genmask_test(struct kunit *test)
 {
@@ -30,11 +39,21 @@ static void genmask_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 6ul, GENMASK(2, 1));
 	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, GENMASK(31, 0));
 
+	KUNIT_EXPECT_EQ(test, 1u, GENMASK_U8(0, 0));
+	KUNIT_EXPECT_EQ(test, 3u, GENMASK_U16(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x10000, GENMASK_U32(16, 16));
+
 #ifdef TEST_GENMASK_FAILURES
 	/* these should fail compilation */
 	GENMASK(0, 1);
 	GENMASK(0, 10);
 	GENMASK(9, 10);
+
+	GENMASK_U32(0, 31);
+	GENMASK_U64(64, 0);
+	GENMASK_U32(32, 0);
+	GENMASK_U16(16, 0);
+	GENMASK_U8(8, 0);
 #endif
 
 

-- 
2.45.3


