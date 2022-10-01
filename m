Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86785F2056
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 00:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117510E6A1;
	Sat,  1 Oct 2022 22:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5CE10E69C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wXt4GaDsjAdr2LMYyinR8p7dTQP0kPJ7ltIX1XVYmi8=; b=Yj3ryFfRkGWwur8AiLZboF5TAj
 C7y60KMldv8bGoNpeFQR77Tyoo6/w2Zkqb+GtNhw7qD19jb03eEJTees2vX+xCFi7PPc7GSpT3ON6
 hh+oPJaeCNrV+hsGAyJS+0Y2nD4DRtcFsR72uvtT6pMg5eCwUQ2EiquDX7Val6nsPB7DcrJuhChRG
 qqjHxyL81TMiOZFJLumknJ2vWWiy8YBzIvAvs3H0DqL7ZryaHNthJ3s5wrZY7VEUzyWBygw9IGdni
 Lshc4ZuMfmoy4VyvLEjLvv5exA947dJ1p8M1r5G6CAKZfj8WLDTFl0lwtKdbbHJLeNN8PMsOOuqcD
 OlhIPdIg==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oel4T-002xSh-05; Sun, 02 Oct 2022 00:34:57 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: [PATCH v3 1/2] drm/tests: Split drm_test_dp_mst_calc_pbn_mode into
 parameterized tests
Date: Sat,  1 Oct 2022 19:34:21 -0300
Message-Id: <20221001223422.857505-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_test_dp_mst_calc_pbn_mode is based on a loop that executes tests
for a couple of test cases. This could be better represented by
parameterized tests, provided by KUnit.

So, convert the drm_test_dp_mst_calc_pbn_mode into parameterized tests.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
v1 -> v2: https://lore.kernel.org/dri-devel/20220925222719.345424-1-mcanal@igalia.com/T/#m056610a23a63109484afeafefb5846178c4d36b2
- Add Michał's Reviewed-by tag.

v2 -> v3: https://lore.kernel.org/dri-devel/20220927221206.55930-1-mcanal@igalia.com/T/#m2dc961da2d4921566cd0f9a8ed9d2d33a1cf4416
- No changes.
---
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    | 77 +++++++++++++------
 1 file changed, 53 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
index 65c9d225b558..12f41881db6b 100644
--- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
@@ -16,33 +16,62 @@
 
 #include "../display/drm_dp_mst_topology_internal.h"
 
+struct drm_dp_mst_calc_pbn_mode_test {
+	const int clock;
+	const int bpp;
+	const bool dsc;
+	const int expected;
+};
+
+static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases[] = {
+	{
+		.clock = 154000,
+		.bpp = 30,
+		.dsc = false,
+		.expected = 689
+	},
+	{
+		.clock = 234000,
+		.bpp = 30,
+		.dsc = false,
+		.expected = 1047
+	},
+	{
+		.clock = 297000,
+		.bpp = 24,
+		.dsc = false,
+		.expected = 1063
+	},
+	{
+		.clock = 332880,
+		.bpp = 24,
+		.dsc = true,
+		.expected = 50
+	},
+	{
+		.clock = 324540,
+		.bpp = 24,
+		.dsc = true,
+		.expected = 49
+	},
+};
+
 static void drm_test_dp_mst_calc_pbn_mode(struct kunit *test)
 {
-	int pbn, i;
-	const struct {
-		int rate;
-		int bpp;
-		int expected;
-		bool dsc;
-	} test_params[] = {
-		{ 154000, 30, 689, false },
-		{ 234000, 30, 1047, false },
-		{ 297000, 24, 1063, false },
-		{ 332880, 24, 50, true },
-		{ 324540, 24, 49, true },
-	};
-
-	for (i = 0; i < ARRAY_SIZE(test_params); i++) {
-		pbn = drm_dp_calc_pbn_mode(test_params[i].rate,
-					   test_params[i].bpp,
-					   test_params[i].dsc);
-		KUNIT_EXPECT_EQ_MSG(test, pbn, test_params[i].expected,
-				    "Expected PBN %d for clock %d bpp %d, got %d\n",
-		     test_params[i].expected, test_params[i].rate,
-		     test_params[i].bpp, pbn);
-	}
+	const struct drm_dp_mst_calc_pbn_mode_test *params = test->param_value;
+
+	KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp, params->dsc),
+			params->expected);
 }
 
+static void dp_mst_calc_pbn_mode_desc(const struct drm_dp_mst_calc_pbn_mode_test *t, char *desc)
+{
+	sprintf(desc, "Clock %d BPP %d DSC %s", t->clock, t->bpp, t->dsc ? "enabled" : "disabled");
+}
+
+KUNIT_ARRAY_PARAM(drm_dp_mst_calc_pbn_mode, drm_dp_mst_calc_pbn_mode_cases,
+		  dp_mst_calc_pbn_mode_desc);
+
 static bool
 sideband_msg_req_equal(const struct drm_dp_sideband_msg_req_body *in,
 		       const struct drm_dp_sideband_msg_req_body *out)
@@ -271,7 +300,7 @@ static void drm_test_dp_mst_sideband_msg_req_decode(struct kunit *test)
 }
 
 static struct kunit_case drm_dp_mst_helper_tests[] = {
-	KUNIT_CASE(drm_test_dp_mst_calc_pbn_mode),
+	KUNIT_CASE_PARAM(drm_test_dp_mst_calc_pbn_mode, drm_dp_mst_calc_pbn_mode_gen_params),
 	KUNIT_CASE(drm_test_dp_mst_sideband_msg_req_decode),
 	{ }
 };
-- 
2.37.3

