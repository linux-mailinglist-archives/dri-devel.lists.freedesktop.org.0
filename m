Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE1A705D8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7559310E5A0;
	Tue, 25 Mar 2025 16:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A/mVVA9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86710E59A;
 Tue, 25 Mar 2025 16:00:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C733A4AB3D;
 Tue, 25 Mar 2025 15:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14F53C4CEEF;
 Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742918449;
 bh=0MgHXb0J9A/vlPO8SY2whMNKBj8R4Rsvop50Z26NQ3o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=A/mVVA9v2v9buK38So11Q5AI7ibZq1R0Tl0Uz/3/QHGulUg8i0K5CTZP1WRUYXDZT
 s67seeJl5A/re5LH+E2Ac6+gLmLvKX+hF7n+rK5TtyqRE4/DtuSEWkzm6/PRGFDjhs
 qgbm4SgDv5Z4w9+KdB6zQSFf0ajE3v0r/uUk+N6Os/0WAzqq6KGg1z1tZ0C/Z2MN6i
 Gnw9iKzQBZA1I1VB0wDYdy3yplQRHGPEGkKcGk/Zs1Y0pR2d4rSUBieIIMMXMR/tXO
 M7uvznwt4dsGVeMPpCExydESfMt48UNYovI6nG2bRo6/QvxWtClMVdD/7+hsMm2VId
 1BP8hhJfyL0QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC22C3600B;
 Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 26 Mar 2025 01:00:00 +0900
Subject: [PATCH v8 5/6] test_bits: add tests for GENMASK_U*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-fixed-type-genmasks-v8-5-24afed16ca00@wanadoo.fr>
References: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
In-Reply-To: <20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=Nb/G0eCNCNsy7H+SqFg3vz5WdbZbgtEPSfg4VSWoDLg=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmPLmuZWLx5XdtmddnzTrXHjbsRirLftRcHlV3ve82Ze
 PtK2PkLHaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACaSsIaR4UTMnxXpZsEWv/zz
 O2U9jNom2c1a/K0zImnWe8t21YI39xj+52aEnPt9+sn5rB87ZMrPrgwo6FvdGd7VIdcZ4f990uc
 YVgA=
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

Add some additional tests in lib/tests/test_bits.c to cover the
expected/non-expected values of the fixed-type GENMASK_U*() macros.

Also check that the result value matches the expected type. Since
those are known at build time, use static_assert() instead of normal
kunit tests.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v7 -> v8:

    - In commit db6fe4d61ece ("lib: Move KUnit tests into tests/
      subdirectory"), lib/test_bits.c was moved to
      lib/tests/test_bits.c. Adjust the patch descrption accordingly.

  v6 -> v7:
  v5 -> v6:

    - No changes.

  v4 -> v5:

    - Revert v4 change. GENMASK_U8()/GENMASK_U16() are now back to
      u8/u16.

  v3 -> v4:

    - Adjust the type of GENMASK_U8()/GENMASK_U16() from u8/u16 to
      unsigned int.

    - Reorder the tests to match the order in which the macros are
      declared in bits.h.
---
 lib/tests/test_bits.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/lib/tests/test_bits.c b/lib/tests/test_bits.c
index c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..f443476f3265c463c1219b13c1ef9663d238d58b 100644
--- a/lib/tests/test_bits.c
+++ b/lib/tests/test_bits.c
@@ -5,6 +5,16 @@
 
 #include <kunit/test.h>
 #include <linux/bits.h>
+#include <linux/types.h>
+
+#define assert_type(t, x) _Generic(x, t: x, default: 0)
+
+static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
+static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
+static_assert(assert_type(u8, GENMASK_U8(7, 0)) == U8_MAX);
+static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
+static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
+static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
 
 static void genmask_test(struct kunit *test)
@@ -14,11 +24,21 @@ static void genmask_test(struct kunit *test)
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
2.48.1


