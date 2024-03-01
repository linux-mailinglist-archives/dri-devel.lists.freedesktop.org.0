Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AE86DB11
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 06:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63F10EB00;
	Fri,  1 Mar 2024 05:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="jw8lNIGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CEB10EB00
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 05:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709270827; x=1740806827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IhGPBUWg3qceaIkkK5kwlbLjnbUs6jBuPNESxu+YQ7w=;
 b=jw8lNIGD2GNxJmrXdtqUBSdESKMQYa/Se1MfQ9XUGUWRAKblGPQHJmF4
 hbHhzGs3XWS+QZNNhnTed2FLg9aIAATOZEB5XJkzWnpBj5T9zoKazQwqC
 gdm6KTyiQP3e5JBz5eSfgEe3Cg6NSEvxYR5ZsPtsmaDjWruzOiilyxevS
 SBgp2A1CZuSlVO/wR9NGqRVhPU8hjKJiCnvc7Ic0WTMIaqwVsNW6CBk1X
 WtmKBK62CJcIp0pDc50VYLZebFZnzAwsnsE79Lz7COiJ6C8vEO7JxqKUN
 hn0b0QPjw72HKYKq8iYSegWOWG9Pq2nWDUF9SLa7uSaEQ+3UggPpXx1AM Q==;
X-CSE-ConnectionGUID: RVqRYtjHQXSOPFAZiw5ImA==
X-CSE-MsgGUID: 2hUX5WdHQgSqvISYQXzmsA==
X-IronPort-AV: E=Sophos;i="6.06,195,1705388400"; d="scan'208";a="17588057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Feb 2024 22:27:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 22:26:55 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 22:26:46 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>, Durai Manickam KR
 <durai.manickamkr@microchip.com>
Subject: [PATCH v9 7/8] drm: atmel-hlcdc: add support for DSI output formats
Date: Fri, 1 Mar 2024 10:55:33 +0530
Message-ID: <20240301052534.38651-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240301052534.38651-1-manikandan.m@microchip.com>
References: <20240301052534.38651-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add support for the following DPI mode if the encoder type
is DSI as per the XLCDC IP datasheet:
- 16BPPCFG1
- 16BPPCFG2
- 16BPPCFG3
- 18BPPCFG1
- 18BPPCFG2
- 24BPP

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: update output format using is_xlcdc flag]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 70 +++++++++++++++++--
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index fdd3a6bc0f79..0f7ffb3ced20 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -301,11 +301,60 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 
 }
 
-#define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
-#define ATMEL_HLCDC_RGB565_OUTPUT	BIT(1)
-#define ATMEL_HLCDC_RGB666_OUTPUT	BIT(2)
-#define ATMEL_HLCDC_RGB888_OUTPUT	BIT(3)
-#define ATMEL_HLCDC_OUTPUT_MODE_MASK	GENMASK(3, 0)
+#define ATMEL_HLCDC_RGB444_OUTPUT		BIT(0)
+#define ATMEL_HLCDC_RGB565_OUTPUT		BIT(1)
+#define ATMEL_HLCDC_RGB666_OUTPUT		BIT(2)
+#define ATMEL_HLCDC_RGB888_OUTPUT		BIT(3)
+#define ATMEL_HLCDC_DPI_RGB565C1_OUTPUT		BIT(4)
+#define ATMEL_HLCDC_DPI_RGB565C2_OUTPUT		BIT(5)
+#define ATMEL_HLCDC_DPI_RGB565C3_OUTPUT		BIT(6)
+#define ATMEL_HLCDC_DPI_RGB666C1_OUTPUT		BIT(7)
+#define ATMEL_HLCDC_DPI_RGB666C2_OUTPUT		BIT(8)
+#define ATMEL_HLCDC_DPI_RGB888_OUTPUT		BIT(9)
+#define ATMEL_HLCDC_OUTPUT_MODE_MASK		GENMASK(3, 0)
+#define ATMEL_XLCDC_OUTPUT_MODE_MASK		GENMASK(9, 0)
+
+static int atmel_xlcdc_connector_output_dsi(struct drm_encoder *encoder,
+					    struct drm_display_info *info)
+{
+	int j;
+	unsigned int supported_fmts = 0;
+
+	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
+	case 0:
+		break;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		return ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+		return ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		return ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return ATMEL_HLCDC_DPI_RGB888_OUTPUT;
+	default:
+		return -EINVAL;
+	}
+
+	for (j = 0; j < info->num_bus_formats; j++) {
+		switch (info->bus_formats[j]) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			supported_fmts |= ATMEL_HLCDC_DPI_RGB565C1_OUTPUT;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			supported_fmts |= ATMEL_HLCDC_DPI_RGB666C1_OUTPUT;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+			supported_fmts |= ATMEL_HLCDC_DPI_RGB666C2_OUTPUT;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			supported_fmts |= ATMEL_HLCDC_DPI_RGB888_OUTPUT;
+			break;
+		default:
+			break;
+		}
+	}
+	return supported_fmts;
+}
 
 static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 {
@@ -318,6 +367,13 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 	encoder = state->best_encoder;
 	if (!encoder)
 		encoder = connector->encoder;
+	/*
+	 * atmel-hlcdc to support DSI formats with DSI video pipeline
+	 * when DRM_MODE_ENCODER_DSI type is set by
+	 * connector driver component.
+	 */
+	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI)
+		return atmel_xlcdc_connector_output_dsi(encoder, info);
 
 	switch (atmel_hlcdc_encoder_get_bus_fmt(encoder)) {
 	case 0:
@@ -358,7 +414,7 @@ static int atmel_hlcdc_connector_output_mode(struct drm_connector_state *state)
 
 static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 {
-	unsigned int output_fmts = ATMEL_HLCDC_OUTPUT_MODE_MASK;
+	unsigned int output_fmts;
 	struct atmel_hlcdc_crtc_state *hstate;
 	struct drm_connector_state *cstate;
 	struct drm_connector *connector;
@@ -366,6 +422,8 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
 	int i;
 
 	crtc = drm_crtc_to_atmel_hlcdc_crtc(state->crtc);
+	output_fmts = crtc->dc->desc->is_xlcdc ? ATMEL_XLCDC_OUTPUT_MODE_MASK :
+		      ATMEL_HLCDC_OUTPUT_MODE_MASK;
 
 	for_each_new_connector_in_state(state->state, connector, cstate, i) {
 		unsigned int supported_fmts = 0;
-- 
2.25.1

