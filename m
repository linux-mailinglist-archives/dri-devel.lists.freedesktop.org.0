Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E296C215334
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245C56E32B;
	Mon,  6 Jul 2020 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D456EB5C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593776842; bh=Mror7EhaRxvkBeJPmtCPvGSBofo331RIQIKcoOFqy6Y=;
 h=From:To:Cc:Subject:Date:References:From;
 b=MuA9Noi6uYlKU2CAFK1WTynrh42ZGRL7Tg8K7H1vyG8kWNPzuGLCruUbNWGfmOCU9
 OWZBGyUs4yf6qYpa19lLPTYLtYrfT0OfyF8lrONoflImJXKxOSmYDyUGBQyJ1Y/Ck1
 zUWj9XpA84Ujd+c37JTA/Q8748X7xbfwo9DPjvc8=
From: Ondrej Jirman <megous@megous.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>, Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 1/2] dt-bindings: display: Fix example in nwl-dsi.yaml
Date: Fri,  3 Jul 2020 13:47:16 +0200
Message-Id: <20200703114717.2140832-2-megous@megous.com>
In-Reply-To: <20200703114717.2140832-1-megous@megous.com>
References: <20200703114717.2140832-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The example is now validated against rocktech,jh057n00900 schema
that was ported to yaml, and didn't validate with:

- '#address-cells', '#size-cells', 'port@0' do not match any of
  the regexes: 'pinctrl-[0-9]+'
- 'vcc-supply' is a required property
- 'iovcc-supply' is a required property
- 'reset-gpios' is a required property

Fix it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 .../devicetree/bindings/display/bridge/nwl-dsi.yaml      | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 8aff2d68fc33..2c4c34e3bc29 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -165,6 +165,7 @@ examples:
  - |
 
    #include <dt-bindings/clock/imx8mq-clock.h>
+   #include <dt-bindings/gpio/gpio.h>
    #include <dt-bindings/interrupt-controller/arm-gic.h>
    #include <dt-bindings/reset/imx8mq-reset.h>
 
@@ -191,12 +192,12 @@ examples:
               phy-names = "dphy";
 
               panel@0 {
-                      #address-cells = <1>;
-                      #size-cells = <0>;
                       compatible = "rocktech,jh057n00900";
                       reg = <0>;
-                      port@0 {
-                           reg = <0>;
+                      vcc-supply = <&reg_2v8_p>;
+                      iovcc-supply = <&reg_1v8_p>;
+                      reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+                      port {
                            panel_in: endpoint {
                                      remote-endpoint = <&mipi_dsi_out>;
                            };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
