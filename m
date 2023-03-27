Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB76CA626
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 15:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E840910E5C4;
	Mon, 27 Mar 2023 13:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C7410E5C5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 13:39:33 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PlYnx1t2Cz9sxg;
 Mon, 27 Mar 2023 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679924373; bh=/bfFGeqwiqoMHm+NmXx6be5uF11lPLbY8nHHZIjdVqM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Afve9XREglBVefOZ6izy+fJf54Zyk/czU02APq1nNepXQWSfehH4xxBW4Wwuhcq5a
 PYdz9VrdTIiJKYntMDhHdR7QN/KF3ziT3D76hgp0hQRAm+Bmyj0iWGOdnREmla6DHH
 qhRsPDtKISf+KNjm16FzTd2Fs0bx9Xiwp2nyuROc=
X-Riseup-User-ID: 2F549D14A803D7B119720449EEC47D34385F0980A59F0E61CE3BA1750F3FB841
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PlYnr0Hkgz1yBT;
 Mon, 27 Mar 2023 13:39:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/tests: Test drm_rect_rotate()
Date: Mon, 27 Mar 2023 10:38:47 -0300
Message-Id: <20230327133848.5250-5-arthurgrillo@riseup.net>
In-Reply-To: <20230327133848.5250-1-arthurgrillo@riseup.net>
References: <20230327133848.5250-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
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
Cc: carlos.craveiro@usp.br, tales.aparecida@gmail.com, dlatypov@google.com,
 javierm@redhat.com, mairacanal@riseup.net, maxime@cerno.tech,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>,
 matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert test for the drm_rect_rotate() function, create test cases
for all the rotation modes.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index a14da86ef435..bb3fff09cb7b 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_rect.h>
+#include <drm/drm_mode.h>
 
 #include <linux/string_helpers.h>
 #include <linux/errno.h>
@@ -441,6 +442,76 @@ static void drm_test_rect_calc_vscale_negative_args(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, scaling_factor, -EINVAL);
 }
 
+struct drm_rect_rotate_case {
+	const char *name;
+	unsigned int rotation;
+	struct drm_rect rect;
+	int width, height;
+	struct drm_rect expected;
+};
+
+static const struct drm_rect_rotate_case drm_rect_rotate_cases[] = {
+	{
+		.name = "reflect x",
+		.rotation = DRM_MODE_REFLECT_X,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 5, 5),
+	},
+	{
+		.name = "reflect y",
+		.rotation = DRM_MODE_REFLECT_Y,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 5, 5, 5),
+	},
+	{
+		.name = "rotate 0",
+		.rotation = DRM_MODE_ROTATE_0,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 5, 5),
+	},
+	{
+		.name = "rotate 90",
+		.rotation = DRM_MODE_ROTATE_90,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 10, 5),
+	},
+	{
+		.name = "rotate 180",
+		.rotation = DRM_MODE_ROTATE_180,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 5, 10),
+	},
+	{
+		.name = "rotate 270",
+		.rotation = DRM_MODE_ROTATE_270,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 5, .height = 10,
+		.expected = DRM_RECT_INIT(0, 0, 10, 5),
+	},
+};
+
+static void drm_rect_case_desc(const struct drm_rect_rotate_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(drm_rect_rotate, drm_rect_rotate_cases, drm_rect_case_desc);
+
+static void drm_test_rect_rotate(struct kunit *test)
+{
+	const struct drm_rect_rotate_case *params = test->param_value;
+	struct drm_rect r = params->rect;
+
+	drm_rect_rotate(&r, params->width, params->height, params->rotation);
+
+	drm_rect_compare(test, &r, &params->expected);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -453,6 +524,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_calc_vscale),
 	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
 	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.39.2

