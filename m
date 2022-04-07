Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E144F7DB8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1946A10E6C3;
	Thu,  7 Apr 2022 11:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [81.169.146.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D037D10E69B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1649330173;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=ghuIHOXwcBIPtNzAtXxIIrMgvWMfEspBSWPIcijGCo0=;
 b=lzV7xcfX/NnVZKB2WsRCTREkq6y1NvR6MFt70ozwrwoK7e4D/lrT6EpMQONq3PnuPS
 hDrDIYhC1OFobcDxQH/vTUQXCT1tz0AavoFfOzFWw67vxmKkbxi8dEeU42SPbIOxBT4o
 JGepwZTTUmN2yypLrJ3TKrc6qeHy95z20Us907dZ4FZcmJ3zKq6x+Y8gmvfTXMnVoiGb
 JXkzdTfFo0V38Q+eN7Dy/jsI3Cb18UpyXNkmMKY77YmE902LbMi+o95Nwn23nMtRolqj
 qxkb1E0a1vLlNCrGqydsxx0eaIVYBWbxR+iVUvu/2kV483bRaKBOtnrgvAmcJtu0AwLy
 3dJw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1KHeBQyh+ITDDFsCr4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id k708cfy37BGCjxD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 7 Apr 2022 13:16:12 +0200 (CEST)
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
Subject: [PATCH v18 1/3] drm/bridge: display-connector: add ddc-en gpio support
Date: Thu,  7 Apr 2022 13:16:09 +0200
Message-Id: <3607e924b7c0cf0be956c0d49894be1442dbda41.1649330171.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 letux-kernel@openphoenux.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"hdmi-connector.yaml" bindings defines an optional property
"ddc-en-gpios" for a single gpio to enable DDC operation.

Usually this controls +5V power on the HDMI connector.
This +5V may also be needed for HPD.

This was not reflected in code but is needed to make the CI20
board work.

Now, the driver activates the ddc gpio after probe and
deactivates after remove so it is "almost on".

But only if this driver is loaded (and not e.g. blacklisted
as module).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index d24f5b90feabf..e4d52a7e31b71 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -24,6 +24,7 @@ struct display_connector {
 	int			hpd_irq;
 
 	struct regulator	*dp_pwr;
+	struct gpio_desc	*ddc_en;
 };
 
 static inline struct display_connector *
@@ -345,6 +346,17 @@ static int display_connector_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* enable DDC */
+	if (type == DRM_MODE_CONNECTOR_HDMIA) {
+		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
+						       GPIOD_OUT_HIGH);
+
+		if (IS_ERR(conn->ddc_en)) {
+			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
+			return PTR_ERR(conn->ddc_en);
+		}
+	}
+
 	conn->bridge.funcs = &display_connector_bridge_funcs;
 	conn->bridge.of_node = pdev->dev.of_node;
 
@@ -373,6 +385,9 @@ static int display_connector_remove(struct platform_device *pdev)
 {
 	struct display_connector *conn = platform_get_drvdata(pdev);
 
+	if (conn->ddc_en)
+		gpiod_set_value(conn->ddc_en, 0);
+
 	if (conn->dp_pwr)
 		regulator_disable(conn->dp_pwr);
 
-- 
2.33.0

