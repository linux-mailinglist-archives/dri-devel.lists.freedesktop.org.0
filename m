Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9804B358A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 15:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317EB10E551;
	Sat, 12 Feb 2022 14:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A34B10E470
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1644675572;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=76+TPRGf0MB6hHRwPaUxmX8Eixo5outKfV374UIYYws=;
 b=aWk329+8WtFTSQFW0tU4F4FsNyw+Wkka7OQy5wrqZB5FszkqVeZz+DsRD4HtFLn61G
 JIkU5vbSNE2HAGQZ1kxZe8pzFGN4pxAmdUBOUD8UXfMkKQrBDncboNcj5/ZY6YvdUVry
 entTLZAURbz8+usjomfqZjltgbMKaqCZr+FqK+PyVVd+szjq7yF4Dak5UgrQeitTu7kY
 eWhZdIrMaleqVCG+VzKpoDWV41jFXcq1KUHCSrdtRHXOXXVTJ+g6Ky3DWMx7djdmiRJJ
 LD1k9ugwTz0YP78q6B53eIfmy0O4bZsnpTQ34fOsNdvDuHU+c//3xDN/hRFrqJDQ8rSR
 QUOg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVblcdY="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y1CEJVsqW
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 12 Feb 2022 15:19:31 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v14 5/9] drm/bridge: dw-hdmi: repair interworking with
 hdmi-connector for jz4780
Date: Sat, 12 Feb 2022 15:19:23 +0100
Message-Id: <8703a3e48574c09e8756b79e8f69be7d84926fe9.1644675566.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1644675566.git.hns@goldelico.com>
References: <cover.1644675566.git.hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")

introduced a new mechanism to negotiate bus formats between hdmi connector
and the synopsys hdmi driver inside the jz4780.

By this, the dw-hdmi is no longer the only bridge and sets up a list
of formats in dw_hdmi_bridge_atomic_get_output_bus_fmts().

This includes MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the jz4780 but only
produces a black screen.

This fix is based on the observation that max_bpc = 0 when running this
function while info->bpc = 8. Since the formats checks before this always test
for max_bpc >= info->pbc indirectly my assumption is that we must check it
here as well.

Adding the proposed patch makes the CI20/jz4780 panel work again in
MEDIA_BUS_FMT_RGB888_1X24 mode.

Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b0d8110dd412c..826a055a7a273 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2620,10 +2620,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (max_bpc >= info->bpc && info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
-- 
2.33.0

