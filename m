Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57858B0139
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDD510FD66;
	Wed, 24 Apr 2024 05:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="A/5tAD1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7470410FD66
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937391; x=1745473391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yyPs4AwQF2sQjCTCDS+LBYKuRFhFcwhT0V8y0ED5pcE=;
 b=A/5tAD1itWqpeocV1sPjLpMaJNakTsTzQKPD4ED3h4p1l09d4N2m8vpl
 m+A/u0EEWW7jsSrbRhin2uMRf1W7iqa2TLtIyv0gM/tIUmo/pfBfYB4Aw
 CGdZ9WPpy5a6gyzl7nSIxG+nu+GOUrMcZyPJL0KvRoG63/JF2mSkJXkpZ
 11yn4iq3j0bxrDuCMrwxhwce/413JBGk/OfByFNmO8H4FqQwWPAkeQb8l
 9i6ThqXIsNHbsfuu27KuKk6uoxHMS3ZoeAHZlMWgb4DAKjTTVZwhRSwpW
 MYRJL3uYcOh40d8/K1n8I0uTofh/V9ZCUC7Buk85lmas1YGI2alLjXN+X A==;
X-CSE-ConnectionGUID: IIomXHMkRVGwWaCsBommpQ==
X-CSE-MsgGUID: 5ionKT28RNmLBWSn4A8l8g==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="24473826"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:36:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:35:30 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:35:20 -0700
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
Subject: [PATCH RESEND v9 7/8] drm: atmel-hlcdc: add support for DSI output
 formats
Date: Wed, 24 Apr 2024 11:03:50 +0530
Message-ID: <20240424053351.589830-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424053351.589830-1-manikandan.m@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
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
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

