Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF5EA705DB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E9410E5A4;
	Tue, 25 Mar 2025 16:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S0ThD/RS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2810E5A1;
 Tue, 25 Mar 2025 16:00:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 796255C6302;
 Tue, 25 Mar 2025 15:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A04BC4CEF1;
 Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742918449;
 bh=ynVZ/ERL6pJOXzFToVR2bSb2adDsr5Ec4GvxW7oEsII=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=S0ThD/RSGEUa7aPewuEoPvLOWsxWnCoRT4mJfLVqRnS9jQf8+ZgTdK81SBVTCl85u
 UydcMniLXXNu0rUMQFKsc4Pi6m71PErIclRxYyxSIpiRPx34xhODELdcco10TzeHml
 xQaoemhThWZfUj90+PZ7B0JGOESzZfCMD8qNGV0DVN1XdIY4lgtJ6l26wFGt+UasDu
 XxMf1lb8rR6CrGWdJflB6Hq1lvkxgtSN7EEdWyM5MizJK9zTqAud/ILFLRbnpMQ8W3
 WclqONtGoH+PYD2dIBbs6wRa6fmywpgR4EgffbodGF6CwcAmez2LkVsTednHExm3Wx
 05Dfag2Eh10pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 211A8C3600C;
 Tue, 25 Mar 2025 16:00:49 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 26 Mar 2025 01:00:01 +0900
Subject: [PATCH v8 6/6] test_bits: add tests for BIT_U*()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-fixed-type-genmasks-v8-6-24afed16ca00@wanadoo.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=R93dDwSH6s8Z97OP4lZgqg+YV1uvrGVln8yfI8ooE6I=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOmPLuu8Vn0Vl3J9csDV2EaOdfKGX28ong7W/7ZYJHzO6
 p2KnyeWd5SyMIhxMciKKbIsK+fkVugo9A479NcSZg4rE8gQBi5OAZjIs32MDE/8/Is1ajN+XWy5
 rtzvVCvpKm4QyVjbftWec6nxSq0pJgx/hf9x3rGRbPmbWPZo//fP75pev5J1eJE82Tn4rrlg6FY
 BNgA=
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

Add some additional tests in lib/tests/test_bits.c to cover the
expected results of the fixed type BIT_U*() macros.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changelog:

  v7 -> v8:

    - In commit db6fe4d61ece ("lib: Move KUnit tests into tests/
      subdirectory"), lib/test_bits.c was moved to
      lib/tests/test_bits.c. Adjust the patch descrption accordingly.

  v6 -> v7:

    - Add Lucas's Reviewed-by tag.

  v5 -> v6:

    - No changes.

  v4 -> v5:

    - BIT_U8()/BIT_U16() are now back to u8/u16.

  v3 -> v4:

    - New patch.
---
 lib/tests/test_bits.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/tests/test_bits.c b/lib/tests/test_bits.c
index f443476f3265c463c1219b13c1ef9663d238d58b..47325b41515fde2c3ed434ed6f4094925c98886b 100644
--- a/lib/tests/test_bits.c
+++ b/lib/tests/test_bits.c
@@ -9,6 +9,16 @@
 
 #define assert_type(t, x) _Generic(x, t: x, default: 0)
 
+static_assert(assert_type(u8, BIT_U8(0)) == 1u);
+static_assert(assert_type(u16, BIT_U16(0)) == 1u);
+static_assert(assert_type(u32, BIT_U32(0)) == 1u);
+static_assert(assert_type(u64, BIT_U64(0)) == 1ull);
+
+static_assert(assert_type(u8, BIT_U8(7)) == 0x80u);
+static_assert(assert_type(u16, BIT_U16(15)) == 0x8000u);
+static_assert(assert_type(u32, BIT_U32(31)) == 0x80000000u);
+static_assert(assert_type(u64, BIT_U64(63)) == 0x8000000000000000ull);
+
 static_assert(assert_type(unsigned long, GENMASK(31, 0)) == U32_MAX);
 static_assert(assert_type(unsigned long long, GENMASK_ULL(63, 0)) == U64_MAX);
 static_assert(assert_type(u8, GENMASK_U8(7, 0)) == U8_MAX);

-- 
2.48.1


