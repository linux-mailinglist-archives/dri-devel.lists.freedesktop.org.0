Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67088D4879
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B842510E294;
	Thu, 30 May 2024 09:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ROHtKFyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F6F10E407
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:29:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U9TXbe029495;
 Thu, 30 May 2024 04:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717061373;
 bh=bzdQA4f7yubFxJV1WfxmtUTE0oDaJo8ZXSwzNBvLJd8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ROHtKFyH3ZRpeGSBs+lHfVnO+XCY02vq7yyTj5HqAjZVoqmknVnaTY5JjashWhevL
 K9y85GYsDHAMScmez9bmMx8/ouKqLFrYvOXSHe9aO+JVTPpSIB6x8Sxd535dgoBQV9
 kOEue34+sh7zTHvlP9Vkhd/1NQljOntaJwEXTaIM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U9TXMB124232
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 04:29:33 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:29:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:29:32 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.102])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U9TWfK074195;
 Thu, 30 May 2024 04:29:32 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <mripard@kernel.org>, <sam@ravnborg.org>, <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/2] drm/bridge: sii902x: Fix mode_valid hook
Date: Thu, 30 May 2024 14:59:29 +0530
Message-ID: <20240530092930.434026-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530092930.434026-1-j-choudhary@ti.com>
References: <20240530092930.434026-1-j-choudhary@ti.com>
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

Currently, mode_valid hook returns all mode as valid and it is
defined only in drm_connector_helper_funcs. With the introduction of
'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
bridge_attach call for cases when the encoder has this flag enabled.
So move the mode_valid hook to drm_bridge_funcs with proper clock
checks for maximum and minimum pixel clock supported by the bridge.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2fbeda9025bf..6a6055a4ccf9 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -163,6 +163,14 @@
 
 #define SII902X_AUDIO_PORT_INDEX		3
 
+/*
+ * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
+ * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
+ * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
+ */
+#define SII902X_MIN_PIXEL_CLOCK_KHZ		25000
+#define SII902X_MAX_PIXEL_CLOCK_KHZ		165000
+
 struct sii902x {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
@@ -310,17 +318,8 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	return num;
 }
 
-static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
-					       struct drm_display_mode *mode)
-{
-	/* TODO: check mode */
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
 	.get_modes = sii902x_get_modes,
-	.mode_valid = sii902x_mode_valid,
 };
 
 static void sii902x_bridge_disable(struct drm_bridge *bridge)
@@ -504,6 +503,20 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static enum drm_mode_status
+sii902x_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_info *info,
+			  const struct drm_display_mode *mode)
+{
+	if (mode->clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_LOW;
+
+	if (mode->clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
@@ -516,6 +529,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
 	.atomic_check = sii902x_bridge_atomic_check,
+	.mode_valid = sii902x_bridge_mode_valid,
 };
 
 static int sii902x_mute(struct sii902x *sii902x, bool mute)
-- 
2.25.1

