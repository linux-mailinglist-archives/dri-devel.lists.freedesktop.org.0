Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D334A75DF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B645B10E356;
	Wed,  2 Feb 2022 16:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0760810E355
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643819490;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=i8pTmnLmwlb11chyD0dSM2jAOpH2BALjlZjdfMA39JQ=;
 b=BTgrLYoMPcJmsQIQZCxQB6UDEt/oYFEBtjxtqDtyRUDMWQ8Bumz/zwd+PyPOaAGFVc
 9uxwAMbG85QgTusZRhvSrCMEF3pHymddXA7voKiOG9+N0i6VpdwFqdN9fNmGynoFuS1O
 BtXCyPPp9LIsKTkC44TGRIpbU4D40TtEsg+zG7r8YwXJ1pt3GsdfQRC6Nnk4hiPKtD4T
 bqmGb3KZM8LfPlidwOBy+ExbwDWcVVgSmSBUC068IRnag7RqAWJ7RWL2NP4sMn/R1kIz
 AfrcT4ufrxAHgNzC29fJPeRz1dkwclH10yr8Pfy/KR72iJZqLDCQTmh53LP2pCUcbK/Q
 Q4Rg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UMf2MwPVbjc9Y="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12GVTBms
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 17:31:29 +0100 (CET)
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
Subject: [PATCH v13 7/9] drm/bridge: display-connector: add ddc-en gpio support
Date: Wed,  2 Feb 2022 17:31:21 +0100
Message-Id: <0a2546cbb7995841a9b91bf3dfd3c76dcaa3346a.1643819482.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1643819482.git.hns@goldelico.com>
References: <cover.1643819482.git.hns@goldelico.com>
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

"hdmi-connector.yaml" bindings defines an optional property
"ddc-en-gpios" for a single gpio to enable DDC operation.

Usually this controls +5V power on the HDMI connector.
This +5V may also be needed for HPD.

This was not reflected in code.

Now, the driver activates the ddc gpio after probe and
deactivates after remove so it is "almost on".

But only if this driver is loaded (and not e.g. blacklisted
as module).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
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

