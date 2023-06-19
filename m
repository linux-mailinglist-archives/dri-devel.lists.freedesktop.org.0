Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB77735BCB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD6A10E0A3;
	Mon, 19 Jun 2023 16:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F1A10E133
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:00:05 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687190404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVUzYNK+7sbh2q7WBtob0P71hT2E9rlyk6vugFQoNpY=;
 b=Y4l3+yUOQykuCzo+vU+xw529bZRclt7eFIRF8OpfIjde9VVogH+p5HSLe1WZGGvg436lAJ
 ScaulGKAg2ufZgCtYVrAO5mC8GlwZBjsPRstxW/E6CB8cXC20NpY1RfuLDhwC8fX9QsQ8x
 xKjn04eBWBa7aFs55wzUD9U8RUdU3MIXzv4CJXdS40sr0r+74o6LByXQCMdjCd437r21m2
 vtzYY53rrdHz2yrRD4G491WzCtw6pMo5swgzHaFxfBSjJjvVK846uAk4z7Lsc930mTCa/G
 qgp97GMihq9ePd1iE41DKgfA1BqiF+Yg9RMFss6f6t9gIogI4CE8KQQPPQ1deQ==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C44A1BF205;
 Mon, 19 Jun 2023 16:00:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] dt-bindings: display: st7789v: bound the number of Rx
 data lines
Date: Mon, 19 Jun 2023 17:59:54 +0200
Message-Id: <20230619155958.3119181-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
References: <20230619155958.3119181-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ST7789V LCD controller supports regular SPI wiring, as well as no Rx
data line at all. The operating system needs to know whether it can read
registers from the device or not. Let's detail this specific design
possibility by bounding the spi-rx-bus-width property.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 0ccf0487fd8e..a25df7e1df88 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -29,6 +29,10 @@ properties:
   spi-cpha: true
   spi-cpol: true
 
+  spi-rx-bus-width:
+    minimum: 0
+    maximum: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

