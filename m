Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9EC63A1E6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFAA10E1D9;
	Mon, 28 Nov 2022 07:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0323110E141
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 19:20:57 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id 928531C0049;
 Sun, 27 Nov 2022 20:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on srv01.abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.6
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by srv01.abscue.de (Postfix) with ESMTPSA id 7D9961C0048;
 Sun, 27 Nov 2022 20:20:55 +0100 (CET)
From: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: display: panel: mipi-dbi-spi: Add io-supply
Date: Sun, 27 Nov 2022 20:14:33 +0100
Message-Id: <20221127191433.1363395-5-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221127191433.1363395-2-otto.pflueger@abscue.de>
References: <20221127191433.1363395-2-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Nov 2022 07:18:16 +0000
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
Cc: =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the new io-supply property, which specifies the
regulator for the I/O voltage supply on platforms where the panel
panel power and I/O supplies are separate.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index d55bf12ecead..68cbdfab5438 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -22,8 +22,9 @@ description: |
   The standard defines the following interface signals for type C:
   - Power:
     - Vdd: Power supply for display module
+      Called power-supply in this binding.
     - Vddi: Logic level supply for interface signals
-    Combined into one in this binding called: power-supply
+      Called io-supply in this binding.
   - Interface:
     - CSx: Chip select
     - SCL: Serial clock
@@ -80,6 +81,11 @@ properties:
       Controller data/command selection (D/CX) in 4-line SPI mode.
       If not set, the controller is in 3-line SPI mode.
 
+  io-supply:
+    description: |
+      Logic level supply for interface signals (Vddi).
+      No need to set if this is the same as power-supply.
+
   power-supply:
     description: Power supply for the display module (Vdd).
 
-- 
2.30.2
