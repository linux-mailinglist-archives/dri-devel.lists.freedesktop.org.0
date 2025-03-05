Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A5A4FF44
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374BB10E2A6;
	Wed,  5 Mar 2025 13:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gffUIweQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A57510E29A;
 Wed,  5 Mar 2025 13:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 260825C68DB;
 Wed,  5 Mar 2025 12:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E51BC4CEF0;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=JScz0TMKAGSf8jK8FVCMAWHGLNQQuW9+1Mg0FeL7qBY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=gffUIweQ/Bb7UFBgz8soHCXlOKD1vef2JrAsdFXBFjccwLc3aRzaGsL8Kq81OPLvl
 k4G8bHExolEJbm0JI0OGYAXNzIwn9+EHOLRC6DXp8OdkMO7ghexIwx4wNsy2I1m35D
 NIzay4CHS3ym9jki1LQPC3mO6D1HgszZL2k7uRwmtAI4Lm7Ssfhav9pNqM1f5PEAa9
 KmXZbRXDZwXgogXWt1xaEQ3RXBTWE+qqRtw5b6SyR89dx8CsJjgzX1eK+iZK/0Q5Rd
 +mivCbJoJEmXT7RSFqu8KNki/W1bdqsOd96fSu9nDmb5lpFCVESoR8KnJRWUtRA1Q3
 walmIj96rqU+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 970C7C28B22;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:18 +0900
Subject: [PATCH v4 6/8] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-6-1873dcdf6723@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=lN5M+jT7BPUL1L2f+TXlK22h8uB9+ou65Ns8DPPWhbE=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvNk8vt7wX+gw4+8GP/VW/qczK4IX73JNd6n3WJDFf
 bNUindXRykLgxgXg6yYIsuyck5uhY5C77BDfy1h5rAygQxh4OIUgImkr2dkuGvsEv798t09L8rK
 zhjcdyuW0pz2tEXLtGzSm62zNKJ23GFkmFJ1X2v5s51MPQf6f6l5q2XNlzNkbbqwksl6QumENp7
 VjAA=
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

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 lib/test_bits.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/test_bits.c b/lib/test_bits.c
index c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..dc93ded9fdb201e0d44b3c1cd71e233fd62258a5 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -7,6 +7,22 @@
 #include <linux/bits.h>
 
 
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
+
 static void genmask_test(struct kunit *test)
 {
 	KUNIT_EXPECT_EQ(test, 1ul, GENMASK(0, 0));
@@ -93,6 +109,8 @@ static void genmask_input_check_test(struct kunit *test)
 
 
 static struct kunit_case bits_test_cases[] = {
+	KUNIT_CASE(__genmask_test),
+	KUNIT_CASE(__genmask_ull_test),
 	KUNIT_CASE(genmask_test),
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),

-- 
2.45.3


