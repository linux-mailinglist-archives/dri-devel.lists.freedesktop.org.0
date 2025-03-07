Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8FFA56E3D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203DC10EBEF;
	Fri,  7 Mar 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5duZbF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCE410EBED;
 Fri,  7 Mar 2025 16:49:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 18D87A43CFD;
 Fri,  7 Mar 2025 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4488CC4CEEB;
 Fri,  7 Mar 2025 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741366178;
 bh=xHN1wO8JIBs8dMNmj2V57Qxs0leYUAeta41GH32VPwo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=c5duZbF7hKLqE7lOXMf+ayDrkGeg/aTo6o3pcgA6dx/Glh5c8Py6fCrdPbPyrZ6ZC
 pFQAiPfA+QK7WLsW3uFwVnTJwFli/cKMo9tYTnLKDiQx12UAKg1zbMQygCa0unLctC
 YEuqeiZHJMIclrxFaRCZniknjxeslar4VSvIYFQ2aqN9jx4WRiE66NtrC00lcXZvw8
 aqlscA5dAw83GbCGzAOqLXiowVBO22aU78BViF5t523B2YBAMEohwXCfEs5GscZlxM
 IWgMnAcWpnc2NfAVcmxNR6JZVtOgxgK1kgOgUAS/DpjDMwv2rO8IaWo5Uve3aipvnu
 NxmrlAVmCwvPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 3B163C19F32;
 Fri,  7 Mar 2025 16:49:38 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Sat, 08 Mar 2025 01:48:52 +0900
Subject: [PATCH v6 5/7] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-fixed-type-genmasks-v6-5-f59315e73c29@wanadoo.fr>
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
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=Xu4Eq0mDLfrGXDRUnNVBdzOqH0fc/yYOLQ/094sdOiE=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmnlSfnJi37d59l98GqGt/JV2SkWCpPLb+s6bzprURa/
 O+OVOY9HaUsDGJcDLJiiizLyjm5FToKvcMO/bWEmcPKBDKEgYtTACaiXcnIsK8n+96MEyc6epR2
 LGqTSFh59p+18hHzr6L7X+7MSVxxvIWR4bvzbBenOywtZSrdMWkr5M1jqx/uF5wbKt2c8WDNnTN
 sXAA=
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

The definitions of GENMASK() and GENMASK_ULL() do not depend any more
on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
so that __GENMASK{,ULL}() is still covered.

It would be good to have a small assembly test case for GENMASK*() in
case somebody decides to unify both in the future. However, I lack
expertise in assembly to do so. Instead add a FIXME message to
highlight the absence of the asm unit test.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v5 -> v6:

    - Add a FIXME message to highlight the absence of the asm
      GENMASK*() unit tests.

  v4 -> v5:

    - No changes.

  v3 -> v4:

    - New patch.
---
 lib/test_bits.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/test_bits.c b/lib/test_bits.c
index c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..b0c29b01fb30cbcc759ac1e7106457b18bcd73a0 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -6,6 +6,23 @@
 #include <kunit/test.h>
 #include <linux/bits.h>
 
+/* FIXME: add a test case written in asm for GENMASK() and GENMASK_ULL() */
+
+static void __genmask_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
+	KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
+	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));
+}
+
+static void __genmask_ull_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ull, __GENMASK_ULL(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ull, __GENMASK_ULL(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, __GENMASK_ULL(39, 21));
+	KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, __GENMASK_ULL(63, 0));
+}
 
 static void genmask_test(struct kunit *test)
 {
@@ -93,6 +110,8 @@ static void genmask_input_check_test(struct kunit *test)
 
 
 static struct kunit_case bits_test_cases[] = {
+	KUNIT_CASE(__genmask_test),
+	KUNIT_CASE(__genmask_ull_test),
 	KUNIT_CASE(genmask_test),
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),

-- 
2.45.3


