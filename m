Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7E6C4D0D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F284810E3BF;
	Wed, 22 Mar 2023 14:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7D310E3BF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:25 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PhVgY0gJRz9tDb;
 Wed, 22 Mar 2023 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679494105; bh=K6CujEfcNUcCD9c8fWE3PQia5ltQ4OFqpq7w8AsLfA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DuzFjmvB1/J9MK7Bmi7T5fmg7UUsDVxx/e4YPxYKWQZXv1r4r9U4+DQJSIjWkb4XB
 7WGq4CCecDQ1lgxs+NoLFNRq90cuyfH5HL6z1jmaZ/wdaHQaRBX1rZK2LrGqHjvSqi
 RPabjy6AZ+oiaYGhH6/uZhWHJT1p/WGAdxK5Zi7s=
X-Riseup-User-ID: D92E7C4D4B9505C2F3350BDA29ACB68D2CDB3503F23E0A4171E1C782DD6BFECB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PhVgR5Tpcz1y7V;
 Wed, 22 Mar 2023 14:08:19 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/tests: Test drm_rect_rotate()
Date: Wed, 22 Mar 2023 11:07:00 -0300
Message-Id: <20230322140701.69852-5-arthurgrillo@riseup.net>
In-Reply-To: <20230322140701.69852-1-arthurgrillo@riseup.net>
References: <20230322140701.69852-1-arthurgrillo@riseup.net>
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
 andrealmeid@riseup.net, airled@gmail.com,
 Arthur Grillo <arthurgrillo@riseup.net>, matheus.vieira.g@usp.br
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Insert test for the drm_rect_rotate() function, create test cases
for all the rotation modes.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 74 +++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 0f7736073390..46139e796f3f 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 
 #include <drm/drm_rect.h>
+#include <drm/drm_mode.h>
 
 #include <linux/errno.h>
 
@@ -333,6 +334,78 @@ static void drm_test_rect_calc_vscale_negative_args(struct kunit *test)
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
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(-5, 0, 5, 5),
+	},
+	{
+		.name = "reflect y",
+		.rotation = DRM_MODE_REFLECT_Y,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(0, -5, 5, 5),
+	},
+	{
+		.name = "rotate 0",
+		.rotation = DRM_MODE_ROTATE_0,
+		.rect = DRM_RECT_INIT(0, 0, 5, 5),
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(0, 0, 5, 5),
+	},
+	{
+		.name = "rotate 90",
+		.rotation = DRM_MODE_ROTATE_90,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(0, -5, 10, 5),
+	},
+	{
+		.name = "rotate 180",
+		.rotation = DRM_MODE_ROTATE_180,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(-5, -10, 5, 10),
+	},
+	{
+		.name = "rotate 270",
+		.rotation = DRM_MODE_ROTATE_270,
+		.rect = DRM_RECT_INIT(0, 0, 5, 10),
+		.width = 0, .height = 0,
+		.expected = DRM_RECT_INIT(-10, 0, 10, 5),
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
+	struct drm_rect r;
+
+	memcpy(&r, &params->rect, sizeof(struct drm_rect));
+
+	drm_rect_rotate(&r, params->width, params->height, params->rotation);
+
+	drm_rect_compare(test, &r, &params->expected);
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
@@ -345,6 +418,7 @@ static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_calc_vscale),
 	KUNIT_CASE(drm_test_rect_calc_vscale_out_of_range),
 	KUNIT_CASE(drm_test_rect_calc_vscale_negative_args),
+	KUNIT_CASE_PARAM(drm_test_rect_rotate, drm_rect_rotate_gen_params),
 	{ }
 };
 
-- 
2.39.2

