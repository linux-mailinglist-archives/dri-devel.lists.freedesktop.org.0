Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D9752EC9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF63A10E7BA;
	Fri, 14 Jul 2023 01:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3CB10E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5BE961BB2;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100CAC433BA;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=nF3EmHcWtWLkDXimiim466Bc4X1g6roUx9bQ5B5nTbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HcGm+D1MFbHeRrqPgs09yEHJ6hehNFtSasXHXiCZuIaxuERiQyVdeijfqnXsOqxO6
 lQB1VVq0EEPdIzXfdQ9BlLMg7tKl21kHAGdGT9gRizA2x3n++ZvgIiNnPOUI1yayLS
 t4dTkGuqB4Vl5eddSjAzcwU8NuFP//QGaItP4bAhtE5424LER77xSxI0FDratLQGQM
 dKBpUE+8vwKtGwLygQdxWsm02ojpJnl5CMglOYqHggudOtYrMm6cQWlvuXn9SGQCJi
 rQsg/F4OrDDliadPUrreGgrrT2mG+cp3/YSPKuNkmTKjPl7807ev7IiRhLt+zima2u
 uLmqbAsCnHATg==
Received: by mercury (Postfix, from userid 1000)
 id F0C5910676F7; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 15/19] dt-bindings: display: st7789v: bound the number of
 Rx data lines
Date: Fri, 14 Jul 2023 03:37:52 +0200
Message-Id: <20230714013756.1546769-16-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

The ST7789V LCD controller supports regular SPI wiring, as well as no Rx
data line at all. The operating system needs to know whether it can read
registers from the device or not. Let's detail this specific design
possibility by bounding the spi-rx-bus-width property.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Tested-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 9f4157b02b84..905c064cd106 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -29,6 +29,10 @@ properties:
   spi-cpha: true
   spi-cpol: true
 
+  spi-rx-bus-width:
+    minimum: 0
+    maximum: 1
+
   dc-gpios:
     maxItems: 1
     description: DCX pin, Display data/command selection pin in parallel interface
-- 
2.40.1

