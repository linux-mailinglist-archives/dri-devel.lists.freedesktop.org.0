Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F808CE391
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CC710E2FC;
	Fri, 24 May 2024 09:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="sU/8zD5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A39010E1D8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:35:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44O9ZDEn038389;
 Fri, 24 May 2024 04:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716543313;
 bh=xGzgAbqslB1rt11Bkclq9cD769C5sYNmcnBRwDPmOQg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sU/8zD5ieCISKoGlXHigATk6t5vD3/6/ZSQZ7Vj8Flp2dzJJP7raBsjIBQQNOjjxd
 ieQzLe84t/5O4jUSfoYVkfN9yP3mNj5HPBuCHOY8RNflTR/gbHSLa+D5esmZ1YXA8O
 gbT1xJncXllNMHIEseYmIv1dPsx9zgsMClEzqzEM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44O9ZDkL023841
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2024 04:35:13 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 04:35:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 04:35:12 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.102] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44O9ZBjt060484;
 Fri, 24 May 2024 04:35:12 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>
Subject: [PATCH v3 1/2] drm/bridge: sii902x: Fix mode_valid hook
Date: Fri, 24 May 2024 15:05:08 +0530
Message-ID: <20240524093509.127189-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524093509.127189-1-j-choudhary@ti.com>
References: <20240524093509.127189-1-j-choudhary@ti.com>
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
So add the mode_valid hook in drm_bridge_funcs as well with proper
clock checks for maximum and minimum pixel clock supported by the
bridge.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 37 ++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2fbeda9025bf..bae551e107f9 100644
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
@@ -310,12 +318,26 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	return num;
 }
 
+static enum
+drm_mode_status sii902x_validate(struct sii902x *sii902x,
+				 const struct drm_display_mode *mode)
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
 static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
 					       struct drm_display_mode *mode)
 {
-	/* TODO: check mode */
+	struct sii902x *sii902x = connector_to_sii902x(connector);
+	const struct drm_display_mode *mod = mode;
 
-	return MODE_OK;
+	return sii902x_validate(sii902x, mod);
 }
 
 static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
@@ -504,6 +526,16 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static enum drm_mode_status
+sii902x_bridge_mode_valid(struct drm_bridge *bridge,
+			  const struct drm_display_info *info,
+			  const struct drm_display_mode *mode)
+{
+	struct sii902x *sii902x = bridge_to_sii902x(bridge);
+
+	return sii902x_validate(sii902x, mode);
+}
+
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
@@ -516,6 +548,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
 	.atomic_check = sii902x_bridge_atomic_check,
+	.mode_valid = sii902x_bridge_mode_valid,
 };
 
 static int sii902x_mute(struct sii902x *sii902x, bool mute)
-- 
2.25.1

