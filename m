Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27AA7149E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D24710E69B;
	Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EtKCSX2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E810E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984406;
 bh=NZ6fclDwbegk6vjdEVRrCydF7IGqCGp8TxBQFTP5dcw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EtKCSX2tSNqPl4heucqQ/poDA9wvikAgKOQauF9vNy2sIoj4chyNlIBRcVNzNDuQ4
 H0jwxSA0nHahcE489nmPlKozMSc3bTfvELrxVppWOy2gn5Y6+8ep0kucOstS/A0A+M
 KzN/2WDR8TCXUODltOH/xVnF9BDw0z1jACQRXUHuFLnVYSl/e1rdbtiq71i48IWbGU
 23RyK7ofii0qhuz2p/E9pqoK1P8rSnn4ciFxmOK/tky5yPTVIKd+Zapg066wUmr/+w
 b30apyqqQ/oAHT+epMYlBZGK8KOpadVV7LncjaXPa+WIkWKe6leXZDrhnHqxYy7WNc
 eSy134gN5mbVA==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BE53017E0E8D;
 Wed, 26 Mar 2025 11:20:06 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:57 +0200
Subject: [PATCH v3 08/15] drm/tests: hdmi: Add macros to simplify EDID
 setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-8-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
In-Reply-To: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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

Introduce a few macros to facilitate setting custom (i.e. non-default)
EDID data during connector initialization.

The actual conversion to use the new helpers is handled separately.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 43 +++++++++++-----------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 7ffd666753b10bc991894e238206a3c5328d0e23..bcbd146fb655f4402529e59af09c99dbae7be0bf 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -140,10 +140,12 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+connector_hdmi_init_with_edid_funcs(struct kunit *test,
+				    unsigned int formats,
+				    unsigned int max_bpc,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    const char *edid_data,
+				    size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -197,30 +199,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
 
 	drm_mode_config_reset(drm);
 
+	if (edid_data && edid_len) {
+		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
+		KUNIT_ASSERT_GT(test, ret, 0);
+	}
+
 	return priv;
 }
 
-static
-struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init(struct kunit *test,
-				     unsigned int formats,
-				     unsigned int max_bpc)
-{
-	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	int ret;
+#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bpc, funcs)		\
+	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL, 0)
 
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  formats, max_bpc,
-							  &dummy_connector_hdmi_funcs);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+#define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
+	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
 
-	ret = set_connector_edid(test, &priv->connector,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
+#define drm_kunit_helper_connector_hdmi_init_with_edid(test, formats, max_bpc, edid)		\
+	drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc,		\
+							     &dummy_connector_hdmi_funcs, edid)
 
-	return priv;
-}
+#define drm_kunit_helper_connector_hdmi_init(test, formats, max_bpc)				\
+	drm_kunit_helper_connector_hdmi_init_with_edid(test, formats, max_bpc,			\
+						       test_edid_hdmi_1080p_rgb_max_200mhz)
 
 /*
  * Test that if we change the RGB quantization property to a different

-- 
2.49.0

