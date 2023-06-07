Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04751727907
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8530A10E596;
	Thu,  8 Jun 2023 07:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5C10E4B3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 11:56:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rm8-0008S2-31; Wed, 07 Jun 2023 13:56:28 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rm6-005jFb-JT; Wed, 07 Jun 2023 13:56:26 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rm5-00CStO-ML; Wed, 07 Jun 2023 13:56:25 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/8] dt-bindings: display: panel: mipi-dbi-spi: add
 shineworld lh133k compatible
Date: Wed,  7 Jun 2023 13:55:00 +0200
Message-Id: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 08 Jun 2023 07:44:49 +0000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Shineworld LH133K is a 1.3" 240x240px RGB LCD with a MIPI DBI
compatible SPI interface.
The initialization procedure is quite basic with the exception of
requiring inverted colors.
A basic mipi-dbi-cmd[1] script to get the display running thus looks
like this:

    $ cat shineworld,lh133k.txt
    command 0x11 # exit sleep mode
    delay 120

    # The display seems to require display color inversion, so enable it.
    command 0x21 # INVON

    # Enable normal display mode (in contrast to partial display mode).
    command 0x13 # NORON
    command 0x29 # MIPI_DCS_SET_DISPLAY_ON

    $ mipi-dbi-cmd shineworld,lh133k.bin shineworld,lh133k.txt

[1]: https://github.com/notro/panel-mipi-dbi

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
---
 .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index 9b701df5e9d28..c07da1a9e6288 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -67,6 +67,7 @@ properties:
     items:
       - enum:
           - sainsmart18
+          - shineworld,lh133k
       - const: panel-mipi-dbi-spi
 
   write-only:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b0..b0afa421bc4a5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1189,6 +1189,8 @@ patternProperties:
     description: SHIFT GmbH
   "^shimafuji,.*":
     description: Shimafuji Electric, Inc.
+  "^shineworld,.*":
+    description: ShineWorld Innovations
   "^shiratech,.*":
     description: Shiratech Solutions
   "^si-en,.*":

base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
-- 
2.39.2

