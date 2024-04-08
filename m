Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE589BA1E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FC811227E;
	Mon,  8 Apr 2024 08:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="WvaGTU3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at gabe;
 Mon, 08 Apr 2024 08:23:05 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DFA11227E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 08:23:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4388EbRs066002;
 Mon, 8 Apr 2024 03:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1712564077;
 bh=NUKcQYRoTYLYqdvcwZphrmf2j6qENBLGk6sl8qdeZ3I=;
 h=From:To:CC:Subject:Date;
 b=WvaGTU3Dlg9n67WZSyE9UyRWIkR9aZgAq7MO/ehBsQwmUWvBqaajPETiBF1RH6mTm
 nUTt7ifRHrbJeYJJoceFqKpPFBS4MPJSqR1VhWklJSMZTzcF/cQ+z2Pl2wSTs385Op
 WcUrBAnmt8MjBqqKTtt/gLOvnewiNuhyobohBoJM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4388Ebjm081569
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Apr 2024 03:14:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Apr 2024 03:14:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Apr 2024 03:14:36 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.252])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4388Ea75031270;
 Mon, 8 Apr 2024 03:14:36 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/bridge: sii902x: Fix mode_valid hook
Date: Mon, 8 Apr 2024 13:44:35 +0530
Message-ID: <20240408081435.216927-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
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

Currently, mode_valid hook returns all mode as valid. Add the check
for the maximum and minimum pixel clock that the bridge can support
while validating a mode.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 8f84e98249c7..658819199c84 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -163,6 +163,16 @@
 
 #define SII902X_AUDIO_PORT_INDEX		3
 
+/*
+ * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
+ * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
+ * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
+ *
+ * (drm_display_mode clock is in kHz)
+ */
+#define SII902X_MIN_PIXEL_CLOCK			25000
+#define SII902X_MAX_PIXEL_CLOCK			165000
+
 struct sii902x {
 	struct i2c_client *i2c;
 	struct regmap *regmap;
@@ -313,7 +323,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
 static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
 					       struct drm_display_mode *mode)
 {
-	/* TODO: check mode */
+	if (mode->clock < SII902X_MIN_PIXEL_CLOCK)
+		return MODE_CLOCK_LOW;
+
+	if (mode->clock > SII902X_MAX_PIXEL_CLOCK)
+		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
 }
-- 
2.25.1

