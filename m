Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAB8C8B34
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 19:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0D610EF03;
	Fri, 17 May 2024 17:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="QXZ9HdJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05610EF03
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 17:37:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HHbSIw115953;
 Fri, 17 May 2024 12:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715967448;
 bh=QwzJlg6Go90nYaTZryV4XJOfLUk1jVtqeECp9jUGAUg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=QXZ9HdJaYbSXdbfMwBv31ydeJghwLP96ZKlrRY99Pi16WMAMEQTDaF5F0aEEh7wch
 XAkTSuTtZZt7UC3DpbaWKT8g8DfAfDmgPCfz0xzfl83EEh87h1XeB2+7QsYJqOjMk5
 sJ9qvusXNQ4JytVr/voLMZh6bOsps2SyPDZnR9Iw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HHbSC8028873
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 May 2024 12:37:28 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 12:37:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 12:37:28 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HHbRRw013542;
 Fri, 17 May 2024 12:37:27 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
 <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
 <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
 <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
 <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
 <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
 <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v8 08/10] lib: math_kunit: Add tests for new rounding related
 macros
Date: Fri, 17 May 2024 23:07:26 +0530
Message-ID: <20240517173726.803899-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240517171532.748684-1-devarsht@ti.com>
References: <20240517171532.748684-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tests for round_closest_up/down and roundclosest macros which round
to nearest multiple of specified argument. These are tested with kunit
tool as shared here [1].

[1]: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V8 (No change, patch introduced in V8)
---
 lib/math/math_kunit.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
index 1b00e4195a1a..1955dcd5655d 100644
--- a/lib/math/math_kunit.c
+++ b/lib/math/math_kunit.c
@@ -68,6 +68,26 @@ static void round_down_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 1 << 29), 1 << 29);
 }
 
+static void round_closest_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_closest_up(17, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up(15, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up(14, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) + 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 2), 1 << 30);
+}
+
+static void round_closest_down_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_closest_down(17, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_down(15, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_down(14, 4), 12);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) + 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 2), (1 << 30) - 2);
+}
+
 /* These versions can round to numbers that aren't a power of two */
 static void roundup_test(struct kunit *test)
 {
@@ -93,6 +113,18 @@ static void rounddown_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rounddown(4, 3), 3);
 }
 
+static void roundclosest_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, roundclosest(21, 5), 20);
+	KUNIT_EXPECT_EQ(test, roundclosest(19, 5), 20);
+	KUNIT_EXPECT_EQ(test, roundclosest(17, 5), 15);
+	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30), 3), (1 << 30) - 1);
+	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30) - 1, 1 << 29), 1 << 30);
+
+	KUNIT_EXPECT_EQ(test, roundclosest(4, 3), 3);
+	KUNIT_EXPECT_EQ(test, roundclosest(5, 3), 6);
+}
+
 static void div_round_up_test(struct kunit *test)
 {
 	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(0, 1), 0);
@@ -270,8 +302,11 @@ static struct kunit_case math_test_cases[] = {
 	KUNIT_CASE(int_sqrt_test),
 	KUNIT_CASE(round_up_test),
 	KUNIT_CASE(round_down_test),
+	KUNIT_CASE(round_closest_up_test),
+	KUNIT_CASE(round_closest_down_test),
 	KUNIT_CASE(roundup_test),
 	KUNIT_CASE(rounddown_test),
+	KUNIT_CASE(roundclosest_test),
 	KUNIT_CASE(div_round_up_test),
 	KUNIT_CASE(div_round_closest_test),
 	KUNIT_CASE_PARAM(gcd_test, gcd_gen_params),
-- 
2.39.1

