Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03398600C0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82F10E9F3;
	Thu, 22 Feb 2024 18:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mTSHWqR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0C710E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:15:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 87B4061A0A;
 Thu, 22 Feb 2024 18:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A3DC43390;
 Thu, 22 Feb 2024 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708625741;
 bh=FToiCTeWI9VwQwoCsKkGAFwvO2aDbYDuSZipU8NTJaA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mTSHWqR10ebW0iYXmHiNjwiOlWTjXZdomazVXqGPdXmH0FT42aa3uH12WDKYtIw5l
 luHtwROfuOqVJ92yi6+a7/wC8ZALUz7D4d0ny4mK/OWxtostW8afuHJFCtHVxN07xF
 lie1/d+XxpGe+Nt/Nmogm6XKMIScDORBiYs4moUa8SoNivpRWIoDl1tM/C555ghEvh
 1uPmnToaDngOXkbkoJXY0NNUom8ucan7VQQMcKUONKokrEiz9gz42iyulRc1ngSkN5
 tN5DeSQoZU+1ZuT2I6dQ02h3oE3NvqpH/V7520oJJw6jgaZZM5xRmCmJYrr/GxMn5J
 HgphwXmemucyw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Feb 2024 19:14:12 +0100
Subject: [PATCH v7 26/36] drm/tests: Add infoframes test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-kms-hdmi-connector-state-v7-26-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8417; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FToiCTeWI9VwQwoCsKkGAFwvO2aDbYDuSZipU8NTJaA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+376ip07NfvGz0cTX0R81Hgmuy8055ZR8IrghuXPo
 +W8Hh9r6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEYjgZ/tlv3P/Z3KvG7bjs
 pA3tucpH+tleiWS5rxa/uKuY48Chv2cY/lef/yMeua4nOGJDg1HUPfHmffxTNyxawRqps6umZcv
 rvywA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The previous patch added the generation of the infoframes matching an
HDMI connector state. Let's add a few tests to make sure it works as
expected.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 219 +++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index b9c80d282380..07066b704b36 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -219,6 +219,217 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, 0);
 }
 
+/*
+ * Test that the registration of an HDMI connector with a NULL vendor
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       NULL, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of an HDMI connector with a NULL product
+ * fails.
+ */
+static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", NULL,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a valid, shorter than
+ * the max length, product name succeeds, and is stored padded with 0.
+ */
+static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd',
+	};
+	const char *product_name = "Prod";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a valid, at max
+ * length, product name succeeds, and is stored padded without any
+ * trailing \0.
+ */
+static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const unsigned char expected_product[DRM_CONNECTOR_HDMI_PRODUCT_LEN] = {
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r', 'o', 'd', 'u', 'c', 't',
+		'P', 'r',
+	};
+	const char *product_name = "ProductProductPr";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.product,
+			   expected_product,
+			   sizeof(priv->connector.hdmi.product));
+}
+
+/*
+ * Test that the registration of a connector with a product name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *product_name = "ProductProductProduct";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(product_name), DRM_CONNECTOR_HDMI_PRODUCT_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", product_name,
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that the registration of a connector with a vendor name smaller
+ * than the maximum length succeeds, and is stored padded with zeros.
+ */
+static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd',
+	};
+	const char *vendor_name = "Vend";
+	int ret;
+
+	KUNIT_ASSERT_LT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name at the
+ * maximum length succeeds, and is stored padded without the trailing
+ * zero.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char expected_vendor[DRM_CONNECTOR_HDMI_VENDOR_LEN] = {
+		'V', 'e', 'n', 'd', 'o', 'r',
+		'V', 'e',
+	};
+	const char *vendor_name = "VendorVe";
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_MEMEQ(test,
+			   priv->connector.hdmi.vendor,
+			   expected_vendor,
+			   sizeof(priv->connector.hdmi.vendor));
+}
+
+/*
+ * Test that the registration of a connector with a vendor name larger
+ * than the maximum length fails.
+ */
+static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *test)
+{
+	struct drm_connector_init_priv *priv = test->priv;
+	const char *vendor_name = "VendorVendor";
+	int ret;
+
+	KUNIT_ASSERT_GT(test, strlen(vendor_name), DRM_CONNECTOR_HDMI_VENDOR_LEN);
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       vendor_name, "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       BIT(HDMI_COLORSPACE_RGB),
+				       8);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
 /*
  * Test that the registration of a connector with an invalid maximum bpc
  * count fails.
@@ -499,6 +710,14 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_product),
+	KUNIT_CASE(drm_test_connector_hdmi_init_null_vendor),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_product_valid),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_exact),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_length_too_long),
+	KUNIT_CASE(drm_test_connector_hdmi_init_vendor_valid),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
 			 drm_connector_hdmi_init_type_valid_gen_params),
 	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,

-- 
2.43.2

