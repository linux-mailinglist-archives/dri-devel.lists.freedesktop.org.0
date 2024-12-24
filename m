Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576539FC13C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF9010E27B;
	Tue, 24 Dec 2024 18:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DWuCOgsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B6210E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735064582;
 bh=ewLjLiVssbtIJKnq6jJjr+LssFd6s2dfnNkWR6EHQnA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=DWuCOgsxs8wJpfUN0/GofgWw2aOsqTqRudx53/QoYB8qo9scPqkJjUIP6bvvBaYGp
 V/TEZ34T/B3oROGjyr0Qld18plDvzLN0C2KvRZcPIfyTU80fv0gYehkdFohWLZgGv6
 SMAFIKF6WvbFhnci1dkl77Ej/eshOe6NnoGlGVYwg75vS4RNXGHAtfX5Zriec2p5ul
 F45dFpZZwcPyNubsAnS+cGWb7U9hGLzSK1nA6N0Mwzha7QZButLRzKlf1QTKXAOYZK
 A2PK20eSyo5C2wKGweksBgFLw87GKXQfa8a5LJlWmGwOBjdUBjezOW4PIAvlsCgfaF
 /unZP8pnYNCSg==
Received: from localhost (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EDF0C17E15B5;
 Tue, 24 Dec 2024 19:23:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 24 Dec 2024 20:22:44 +0200
Subject: [PATCH v4 4/4] drm/tests: connector: Add ycbcr_420_allowed tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-bridge-conn-fmt-prio-v4-4-a9ceb5671379@collabora.com>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

Extend HDMI connector output format tests to verify its registration
succeeds only when the presence of YUV420 in the supported formats
matches the state of ycbcr_420_allowed flag.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 60 ++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index 129e813cfd1b0eadc932878458855e15d2a5bceb..22e2d959eb31459f9981fef488228904d67cb6f9 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -1095,6 +1095,64 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
+struct drm_connector_hdmi_init_formats_yuv420_allowed_test {
+	unsigned long supported_formats;
+	bool yuv420_allowed;
+	int expected_result;
+};
+
+#define YUV420_ALLOWED_TEST(_formats, _allowed, _result)			\
+	{									\
+		.supported_formats = BIT(HDMI_COLORSPACE_RGB) | (_formats),	\
+		.yuv420_allowed = _allowed,					\
+		.expected_result = _result,					\
+	}
+
+static const struct drm_connector_hdmi_init_formats_yuv420_allowed_test
+drm_connector_hdmi_init_formats_yuv420_allowed_tests[] = {
+	YUV420_ALLOWED_TEST(BIT(HDMI_COLORSPACE_YUV420), true, 0),
+	YUV420_ALLOWED_TEST(BIT(HDMI_COLORSPACE_YUV420), false, -EINVAL),
+	YUV420_ALLOWED_TEST(BIT(HDMI_COLORSPACE_YUV422), true, -EINVAL),
+	YUV420_ALLOWED_TEST(BIT(HDMI_COLORSPACE_YUV422), false, 0),
+};
+
+static void
+drm_connector_hdmi_init_formats_yuv420_allowed_desc(const struct drm_connector_hdmi_init_formats_yuv420_allowed_test *t,
+						    char *desc)
+{
+	sprintf(desc, "supported_formats=0x%lx yuv420_allowed=%d",
+		t->supported_formats, t->yuv420_allowed);
+}
+
+KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_formats_yuv420_allowed,
+		  drm_connector_hdmi_init_formats_yuv420_allowed_tests,
+		  drm_connector_hdmi_init_formats_yuv420_allowed_desc);
+
+/*
+ * Test that the registration of an HDMI connector succeeds only when
+ * the presence of YUV420 in the supported formats matches the value
+ * of the ycbcr_420_allowed flag.
+ */
+static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *test)
+{
+	const struct drm_connector_hdmi_init_formats_yuv420_allowed_test *params;
+	struct drm_connector_init_priv *priv = test->priv;
+	int ret;
+
+	params = test->param_value;
+	priv->connector.ycbcr_420_allowed = params->yuv420_allowed;
+
+	ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
+				       "Vendor", "Product",
+				       &dummy_funcs,
+				       &dummy_hdmi_funcs,
+				       DRM_MODE_CONNECTOR_HDMIA,
+				       &priv->ddc,
+				       params->supported_formats,
+				       8);
+	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
+}
+
 /*
  * Test that the registration of an HDMI connector with an HDMI
  * connector type succeeds.
@@ -1186,6 +1244,8 @@ static struct kunit_case drmm_connector_hdmi_init_tests[] = {
 	KUNIT_CASE(drm_test_connector_hdmi_init_bpc_null),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_empty),
 	KUNIT_CASE(drm_test_connector_hdmi_init_formats_no_rgb),
+	KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_formats_yuv420_allowed,
+			 drm_connector_hdmi_init_formats_yuv420_allowed_gen_params),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_product),
 	KUNIT_CASE(drm_test_connector_hdmi_init_null_vendor),

-- 
2.47.0

