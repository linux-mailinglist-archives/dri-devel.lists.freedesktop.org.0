Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47892A554
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D1210E360;
	Mon,  8 Jul 2024 15:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="tFYlUdap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BE510E376
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 15:01:48 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C0C7588729;
 Mon,  8 Jul 2024 17:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720450906;
 bh=mqSTohvMgRIhGEWHVCWzYU5kobWF8CMwHlA2yrhy678=;
 h=From:To:Cc:Subject:Date:From;
 b=tFYlUdap21uExbEaLAcEDboWbhy4d0sa9ZXgXWpXs6l5itPloI4HHoAlnEP/kkHnj
 yxC69wN/WE5roa2aYp/DV3d+S40rsxw44Xsknk/Ft7uBYaHWUbxyVxMiqTDNXbBdy+
 ZFWpYqXYrjNgG1i2Od68UM8W7rVZ6zkMkkKCFjvCBletYCcdB1oOUFovoGau/n8mqB
 RoPqGf54oFhrnYMhPqBlkDEZZXAaQAvtztf+eQPeIEa3PrsjcZfsIUeuthqf4BhVMe
 IMbYHh+ztIZPGdVadUGRECuD8B0lLKuzTB73cx2EKzvPlTnKo6/l6iuyNxEn47ITtf
 Mx13qBtRA+nHQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Date: Mon,  8 Jul 2024 17:01:13 +0200
Message-ID: <20240708150130.54484-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document default DP port preemphasis configurable via new DT property
"toshiba,pre-emphasis". This is useful in case the DP link properties
are known and starting link training from preemphasis setting of 0 dB
is not useful. The preemphasis can be set separately for both DP lanes
in range 0=0dB, 1=3.5dB, 2=6dB .

This is an endpoint property, not a port property, because the TC9595
datasheet does mention that the DP might operate in some sort of split
mode, where each DP lane is used to feed one display, so in that case
there might be two endpoints.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: - Fix the type to u8 array
    - Fix the enum items to match what they represent
V3: - Update commit message, expand on this being an endpoint property
V4: - Fix ref: /schemas/graph.yaml#/$defs/port-base and add unevaluatedProperties
---
 .../display/bridge/toshiba,tc358767.yaml      | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index 2ad0cd6dd49e0..b78f64c9c5f44 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -92,12 +92,31 @@ properties:
             reference to a valid DPI output or input endpoint node.
 
       port@2:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: |
             eDP/DP output port. The remote endpoint phandle should be a
             reference to a valid eDP panel input endpoint node. This port is
             optional, treated as DP panel if not defined
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              toshiba,pre-emphasis:
+                description:
+                  Display port output Pre-Emphasis settings for both DP lanes.
+                $ref: /schemas/types.yaml#/definitions/uint8-array
+                minItems: 2
+                maxItems: 2
+                items:
+                  enum:
+                    - 0 # No pre-emphasis
+                    - 1 # 3.5dB pre-emphasis
+                    - 2 # 6dB pre-emphasis
+
     oneOf:
       - required:
           - port@0
-- 
2.43.0

