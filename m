Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E036C4D09
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DE910E372;
	Wed, 22 Mar 2023 14:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55FE10E372
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:08 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PhVgD2CFlzDqtg;
 Wed, 22 Mar 2023 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679494088; bh=QqZ04kQxqtCri+iC38PuLoTkG4/ahUrSurM/vq+14GE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GPZEq2GZ+zLYisxorysCIs8Cmh6rBt07GAgOr5k4RjP+avKwXcufZF8H9etLys0zP
 HwXYDn9slTumUjOBbsK6zLShp16ht7d8LlVGdtbzTsqiq6qbHgXko9vIzGxCiBGiL+
 6ZeqO4tDMdxM48cIztBpEYN+IH5ELxKoS2cexEXc=
X-Riseup-User-ID: 9EB5AF76C62338B51544C52F379EB54F39A5056697C177633B445E6CFFA4149E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PhVg66b2qz1y7V;
 Wed, 22 Mar 2023 14:08:02 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/tests: Test drm_rect_intersect()
Date: Wed, 22 Mar 2023 11:06:57 -0300
Message-Id: <20230322140701.69852-2-arthurgrillo@riseup.net>
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

Insert test for the drm_rect_intersect() function, it also create a
helper for comparing drm_rects more easily.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index e9809ea32696..f700984f70a8 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -9,6 +9,15 @@
 
 #include <drm/drm_rect.h>
 
+static void drm_rect_compare(struct kunit *test, const struct drm_rect *r,
+			     const struct drm_rect *expected)
+{
+	KUNIT_EXPECT_EQ(test, r->x1, expected->x1);
+	KUNIT_EXPECT_EQ(test, r->y1, expected->y1);
+	KUNIT_EXPECT_EQ(test, drm_rect_width(r), drm_rect_width(expected));
+	KUNIT_EXPECT_EQ(test, drm_rect_height(r), drm_rect_height(expected));
+}
+
 static void drm_test_rect_clip_scaled_div_by_zero(struct kunit *test)
 {
 	struct drm_rect src, dst, clip;
@@ -196,11 +205,32 @@ static void drm_test_rect_clip_scaled_signed_vs_unsigned(struct kunit *test)
 	KUNIT_EXPECT_FALSE_MSG(test, drm_rect_visible(&src), "Source should not be visible\n");
 }
 
+static void drm_test_rect_intersect(struct kunit *test)
+{
+	struct drm_rect r1, r2;
+	bool visible;
+
+	drm_rect_init(&r1, 0, 0, 2, 2);
+	drm_rect_init(&r2, 1, 1, 2, 2);
+
+	visible = drm_rect_intersect(&r1, &r2);
+
+	KUNIT_EXPECT_TRUE_MSG(test, visible, "Interserction should be a visible rect");
+	drm_rect_compare(test, &r1, &DRM_RECT_INIT(1, 1, 1, 1));
+
+	drm_rect_init(&r1, 0, 0, 1, 1);
+
+	visible = drm_rect_intersect(&r1, &r2);
+
+	KUNIT_EXPECT_FALSE_MSG(test, visible, "Interserction should not be a visible rect");
+}
+
 static struct kunit_case drm_rect_tests[] = {
 	KUNIT_CASE(drm_test_rect_clip_scaled_div_by_zero),
 	KUNIT_CASE(drm_test_rect_clip_scaled_not_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_clipped),
 	KUNIT_CASE(drm_test_rect_clip_scaled_signed_vs_unsigned),
+	KUNIT_CASE(drm_test_rect_intersect),
 	{ }
 };
 
-- 
2.39.2

