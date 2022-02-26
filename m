Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B674C5706
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 18:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570210E2FB;
	Sat, 26 Feb 2022 17:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9A310E2FA
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1645895585;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=Itv7i6Bm9qZTP8Djtnn3kfJowIcb04gXWZLzQuWU4eI=;
 b=SY9lMrn0n3OMql/lFd2TXmtXDus93skI0DVEBQZI2xDQdwt+pXUj4o1sr6YS7tlIPb
 BIHDP9L9iLeTgky6h+CHqSJj/jlGc+RZizXvyqow7QTWEnyyglSn4u+OY8qXOxf+6wov
 SI3BJ3XwHmsiRBWmTEfERJegK5QrwzXNGpaKaV43d2z2LttGaHpQ6nhrewgTRMAUBOt/
 SUK4SXagUqOG8qQ+rpYOXNxFWR6HThWMEK1U36EEnaMckB+Jl8k48uA3/E790sw86fBj
 A5EqGWqflY6lC1XNpj+7v7rYaIHFaLkLtaxe2QAz66fHpFwEDO9XYchFCUgJAQa2xtB8
 ATDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcK1D0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.40.1 SBL|AUTH)
 with ESMTPSA id V41e6fy1QHD5E20
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 26 Feb 2022 18:13:05 +0100 (CET)
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
Subject: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation for
 8 bit modes
Date: Sat, 26 Feb 2022 18:13:02 +0100
Message-Id: <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1645895582.git.hns@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
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

Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")

introduced a new mechanism to negotiate bus formats between hdmi connectors
and bridges which is to be used e.g. for the jz4780 based CI20 board.

In this case dw-hdmi sets up a list of formats in
dw_hdmi_bridge_atomic_get_output_bus_fmts().

This includes e.g. MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the CI20 but
only produces a black screen.

Analysis revealed an omission in

Commit 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")

to check for 8 bit with when adding UYVY8 or YUV8 formats.

This fix is based on the observation that max_bpc = 0 when running this
function while info->bpc = 8.

Adding the proposed patch makes the jz4780/CI20 panel work again with default
MEDIA_BUS_FMT_RGB888_1X24 mode.

Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
Fixes: 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 43e375da131e8..c08e2cc96584c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2621,11 +2621,13 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
-		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
+	if (max_bpc >= 8 && info->bpc >= 8) {
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+			output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
-		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+			output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
+	}
 
 	/* Default 8bit RGB fallback */
 	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-- 
2.33.0

