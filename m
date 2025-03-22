Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AFA6C9B1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 11:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651110E31E;
	Sat, 22 Mar 2025 10:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eNYAJqDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1B510E0ED;
 Sat, 22 Mar 2025 10:41:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C888943F77;
 Sat, 22 Mar 2025 10:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F29F9C4CEED;
 Sat, 22 Mar 2025 10:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742640108;
 bh=aTXRkE0XydaINgQyfs8slD4zaVmOP6d03DD2R/YidBc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=eNYAJqDuLl2hihiBMvXZv4XT0dBnp5Pv0vakB/rZau63lv6kAu8cg27VOrxs1JH7h
 CTDhZdPiM5wQ2LXV5cwcLrwLfI/hzBUkFMB/8UVRNyN8iNONMB86aC2vsrgekjc6W0
 1yB3DgrDtj0HHRfFbGT9lwiF1DFWHKGUZrQ0CFJFV5P0mHBHa9tG59teRwdfVw34v0
 NZ0Mk6HZhmWIEaPik8EbR/FpNuURaGWUl5xxGdti7I8cBTyIPwiQtJefArZwEWsrjp
 t8GVelUZpORe0AbDP5ewsMi/u2NpXcLStSroO0hiH3tjeWMahHczfSPsMU1g1rg3Vr
 gYOkWTAA7w/jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E2B91C3600B;
 Sat, 22 Mar 2025 10:41:47 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Sat, 22 Mar 2025 19:39:38 +0900
Subject: [PATCH 3/3] test_bits: add tests for __GENMASK() and __GENMASK_ULL()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250322-consolidate-genmask-v1-3-54bfd36c5643@wanadoo.fr>
References: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
In-Reply-To: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
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
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2838;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=lw0j5DDbt4xHaeCFRpUyWkzpSYATbilmvUEdK3pbE0k=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOn3Jj//niLufKnD3jTC6+n72Eu/sp3jVnzS4C22PT/zU
 +SzKbdXd5SyMIhxMciKKbIsK+fkVugo9A479NcSZg4rE8gQBi5OAZiI91dGhquce67s/1Dt4Som
 2sKexbNwZ4nZwgOVMjz6jEdmm+yuPsfI0Hf4ssP59z3mJ9r3ra3NPvpc/8wnRbvTZS3Hf+Va+gl
 8YQcA
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
so that __GENMASK{,ULL}() are still covered.

Because __GENMASK() and __GENMASK_ULL() do use GENMASK_INPUT_CHECK(),
drop the TEST_GENMASK_FAILURES negative tests.

It would be good to have a small assembly test case for GENMASK*() in
case somebody decides to unify both in the future. However, I lack
expertise in assembly to do so. Instead add a FIXME message to
highlight the absence of the asm unit test.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
This patch previously belonged to this series:

  bits: Fixed-type GENMASK_U*() and BIT_U*()
  Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr

Below changelog also contains the history from the previous series.

Changelog:

  v6 (previous series) -> v1 (new series):

    - Add a message in the commit description to explain why the
      negative tests are dropped.

    - Add Lucas's Reviewed-by tag.

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
index 47325b41515fde2c3ed434ed6f4094925c98886b..ab88e50d2edfa2b011f07d50460ac8ea6ff99923 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -26,6 +26,23 @@ static_assert(assert_type(u16, GENMASK_U16(15, 0)) == U16_MAX);
 static_assert(assert_type(u32, GENMASK_U32(31, 0)) == U32_MAX);
 static_assert(assert_type(u64, GENMASK_U64(63, 0)) == U64_MAX);
 
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
@@ -123,6 +140,8 @@ static void genmask_input_check_test(struct kunit *test)
 
 
 static struct kunit_case bits_test_cases[] = {
+	KUNIT_CASE(__genmask_test),
+	KUNIT_CASE(__genmask_ull_test),
 	KUNIT_CASE(genmask_test),
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),

-- 
2.48.1


