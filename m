Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E14F7DBA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D3A10E6CB;
	Thu,  7 Apr 2022 11:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0D10E6D4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330173;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=mli3SbgeH19fgUBo5oZuvEr6dwkaZKlBs97YGkIQ7hs=;
 b=m+N+EovPDYaXEeM9dWP3zoGWYJWca46FkN9WJtA3Fp9OD6gDw8lhy8F6UIhKYymgtf
 CebZrV9paQ7V2hCHLxk+eDvmDD6Zv7KEt1mIyl4NcnfoXykSWOh0CTNOHllo1D3SnYAx
 xLMLaJFTTJEKmSNRdzrAa6LhHEQVAmitRACoYQIqjNYk4/0rW76atCXzxf0jy62TwrN3
 QIf3OxXquiWooLHgN/8C9aVxJQDrRs+w5YqaTNVQgQR2co30vFGJJkwoJ0iCCgz441/y
 8g20Y+pa2FHriVyAq1YDSn7pkt/2aQbb4YWyxmXjxVxyz5svJ1gpgxhhBEsZx7popfjQ
 kx4w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFsCr4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy37BGDjxE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 7 Apr 2022 13:16:13 +0200 (CEST)
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
Subject: [PATCH v18 2/3] drm/ingenic: Implement proper
 .atomic_get_input_bus_fmts
Date: Thu,  7 Apr 2022 13:16:10 +0200
Message-Id: <ab25925723cff2f3e773e7137567ef86fff5fdba.1649330171.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1649330170.git.hns@goldelico.com>
References: <cover.1649330170.git.hns@goldelico.com>
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

