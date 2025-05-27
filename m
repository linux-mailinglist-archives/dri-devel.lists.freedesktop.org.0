Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8FDAC4E66
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F0810E4BF;
	Tue, 27 May 2025 12:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R4/S/4Af";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB210E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347889;
 bh=PDRraluMv402z66JOvqFUR/pJRZy6LQeNSrabWEsSyY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=R4/S/4AfRhLvxwwjx94VuOuLqutTFenopeo1tGUkfk1eFNmhys50yojp3GPGN8g/2
 pdGhzyMnAT/KylFBppdUe6v6tuAUEPTrZJJy3hF0idv5x2kgxlfywBLfe5Zjx8Lbk0
 e63U2g5tM4fJ/+z7IDoGkW+0lu4dm2QTGXXGB/OWY0xLNijQFFYYjMGjU+0fRJCGSP
 KbSFMm0P4UHalMpONQuRf2Tc3lV3clUVm3AiErjNh02rqcjVpda3roS4ZUX91PaDY+
 P7breEtD+3fxySeh8l/O40RVfgaAhBzYDTezK8MDLtznlN5H/ThxXFoWu5OvAVLXBR
 wKSY0oTtqrNig==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 3BAB217E37C0;
 Tue, 27 May 2025 14:11:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:17 +0300
Subject: [PATCH v5 09/19] drm/tests: hdmi: Add macro to simplify EDID setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-9-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
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

Factor out the HDMI connector initialization from
drm_kunit_helper_connector_hdmi_init_funcs() into a common
__connector_hdmi_init() function, while extending its functionality to
allow setting custom (i.e. non-default) EDID data.

Introduce a macro as a wrapper over the new helper to allow dropping the
open coded EDID setup from all test cases.

The actual conversion will be handled separately; for now just apply it
to drm_kunit_helper_connector_hdmi_init() helper.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 00576f747f1f36a100e13b0316cb492f76474d45..beee73e7a4d297dd068a42b583fa547e93e7301e 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
 
 static
 struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+__connector_hdmi_init(struct kunit *test,
+		      unsigned int formats,
+		      unsigned int max_bpc,
+		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
+		      const void *edid_data, size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv;
 	struct drm_connector *conn;
@@ -197,29 +198,38 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
 
 	drm_mode_config_reset(drm);
 
+	if (edid_data && edid_len) {
+		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
+		KUNIT_ASSERT_GT(test, ret, 0);
+	}
+
 	return priv;
 }
 
+static
+struct drm_atomic_helper_connector_hdmi_priv *
+drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
+					   unsigned int formats,
+					   unsigned int max_bpc,
+					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
+{
+	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
+}
+
+#define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
+	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
+
 static
 struct drm_atomic_helper_connector_hdmi_priv *
 drm_kunit_helper_connector_hdmi_init(struct kunit *test,
 				     unsigned int formats,
 				     unsigned int max_bpc)
 {
-	struct drm_atomic_helper_connector_hdmi_priv *priv;
-	int ret;
-
-	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
-							  formats, max_bpc,
-							  &dummy_connector_hdmi_funcs);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
-
-	ret = set_connector_edid(test, &priv->connector,
-				 test_edid_hdmi_1080p_rgb_max_200mhz,
-				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
-	KUNIT_ASSERT_GT(test, ret, 0);
-
-	return priv;
+	return drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				formats,
+				max_bpc,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_max_200mhz);
 }
 
 /*

-- 
2.49.0

