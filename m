Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FC44F64CF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE8E10E490;
	Wed,  6 Apr 2022 16:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB2310E4A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649262372;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=mli3SbgeH19fgUBo5oZuvEr6dwkaZKlBs97YGkIQ7hs=;
 b=nsU4EAHVPqOBc/UhjsucwxH7FmmTnqkrBcLV+5wU0lhjFkvbHGhmU8sO2OZkIp8jfc
 8ZVolO/atWFtL6TudRpV2LzL7Q5gYYMQapaiW2PvgWOPh50RGg8NylbbdJeHm0dXAbeH
 9IqW83C49wlZHqA906arnKfEdITXN2YDRFpQzPVHkxvWTN5uz7jOReup+maPRT6gSwps
 ovWdCGcp1kh/8ACg+vPH9sTr3s1udEXB01JuRh/1J2VOtjr5Xk4cIuN/w1NByaI/twwl
 gy/6uq9AEBArqiU8ZtBwO2aQUCcykCYyso2wWseVJPM8vdfeR96fxFt5gq34mvllcVIv
 DH4w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbgcbPa"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy36GQCgVN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 6 Apr 2022 18:26:12 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v17 1/6] drm/ingenic: Implement proper
 .atomic_get_input_bus_fmts
Date: Wed,  6 Apr 2022 18:26:03 +0200
Message-Id: <ca7426ff9d5690488765822e3dae72e639241def.1649262368.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649262368.git.hns@goldelico.com>
References: <cover.1649262368.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

The .atomic_get_input_bus_fmts() callback of our top bridge should
return the possible input formats for a given output format. If the
requested output format is not supported, then NULL should be returned,
otherwise the bus format negociation will end with a bus format that the
encoder does not support.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 ++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a4f5a323f4906..8eb0ad501a7b9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -833,6 +833,32 @@ static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
 	}
 }
 
+static u32 *
+ingenic_drm_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					     struct drm_bridge_state *bridge_state,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state,
+					     u32 output_fmt,
+					     unsigned int *num_input_fmts)
+{
+	switch (output_fmt) {
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB888_3X8:
+	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
+		break;
+	default:
+		*num_input_fmts = 0;
+		return NULL;
+	}
+
+	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
+							  crtc_state, conn_state,
+							  output_fmt,
+							  num_input_fmts);
+}
+
 static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(arg);
@@ -984,7 +1010,7 @@ static const struct drm_bridge_funcs ingenic_drm_bridge_funcs = {
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
+	.atomic_get_input_bus_fmts = ingenic_drm_bridge_atomic_get_input_bus_fmts,
 };
 
 static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
-- 
2.33.0

