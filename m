Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC365ECEF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D41F10E728;
	Thu,  5 Jan 2023 13:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8510E728
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:25:51 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so1994232pjk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iwwp3U8ZO9l33wBPdYbUslPJS4OdAaqOipDsvKHUvw4=;
 b=NFmtJxruhfDGIscARXxUxMnJ8bIDMuz6GQyFZIJpUMR2vjBWuzVlo1Ntr6U0LjVom8
 jNDEYi1Y1rKoBEpPcsjuNym42klClmWKmfb42EidVOf3/eE3lt8Bnzioy5yhIIV+BvO6
 1wLN3JL8YsKkZ758whFfLrA/OYsJfIEyGxDUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iwwp3U8ZO9l33wBPdYbUslPJS4OdAaqOipDsvKHUvw4=;
 b=5ZYhYxjzN9FJ18OsxyikmlMFJPP1ksb961MZQ4NUB4eVOyFzIK8BLujR4IbuuIogKB
 sPYpY7d2TESiYj1A06+qbGACAEvtRfnxNkgqiO1iB87QiU1bFGBEQ8ihlWdnNvzjTZL+
 7r2OWTIGFGmgZ/Vds3UL+R92mvfzz9l8Plg+eGJXSc3bjnBeRn96TCsu8eqvevtzyVCt
 rmYg/s5APIeJ8kwseqX/S82K1p+Or7SXt+F+cdoKOMGluxI+gX5t8LQiBsPHoNiKzDF5
 gWvB02wK1ndlaXioVX9SnY+qou/wAQcHmqNx+QYXeSCEhxJTgXV9fWv2wzymMOFuygcN
 q4Mw==
X-Gm-Message-State: AFqh2kpZS5ydz2G9FmMccS97GDxxh1G7m/vM1XIl44TNpQxoEaO/Z3Yx
 Jl3goDzXBs0xPdSFiaY/e8xqVQ==
X-Google-Smtp-Source: AMrXdXsVgq9H0r6nMlqdgVJ8rT31POYJpyYs+lssnDycN2WN43sj16tzoY0ymo5PnPD/iwAfQxhzwg==
X-Received: by 2002:a17:90b:3797:b0:226:3981:1ae3 with SMTP id
 mz23-20020a17090b379700b0022639811ae3mr24411009pjb.28.1672925151173; 
 Thu, 05 Jan 2023 05:25:51 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
 by smtp.gmail.com with ESMTPSA id
 gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:25:50 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v7 7/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
Date: Thu,  5 Jan 2023 21:24:55 +0800
Message-Id: <20230105132457.4125372-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105132457.4125372-1-treapking@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ITE IT6505 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v7:
- Fixed issues reported by dt_binding_check.
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../bindings/display/bridge/ite,it6505.yaml   | 95 ++++++++++++++++---
 1 file changed, 84 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index b16a9d9127dd..1ee7cd0d2035 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -77,20 +77,45 @@ properties:
         unevaluatedProperties: false
         description: Video port for DP output
 
-        properties:
-          endpoint:
+        patternProperties:
+          "^endpoint@[01]$":
             $ref: /schemas/graph.yaml#/$defs/endpoint-base
             unevaluatedProperties: false
 
             properties:
+              reg:
+                maxItems: 1
+
+              remote-endpoint: true
+
               data-lanes:
-                minItems: 1
-                uniqueItems: true
-                items:
-                  - enum: [ 0, 1 ]
-                  - const: 1
-                  - const: 2
-                  - const: 3
+                oneOf:
+                  - minItems: 1
+                    maxItems: 1
+                    items:
+                      enum: [0, 1, 2, 3]
+
+                  - items:
+                      - const: 0
+                      - const: 1
+
+                  - items:
+                      - const: 2
+                      - const: 3
+
+                  - items:
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+
+              mode-switch:
+                type: boolean
+                description: Register this node as a Type-C mode switch or not.
+
+            required:
+              - reg
+              - remote-endpoint
 
     required:
       - port@0
@@ -102,7 +127,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +163,11 @@ examples:
                 };
 
                 port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
                     reg = <1>;
-                    it6505_out: endpoint {
+                    it6505_out: endpoint@0 {
+                        reg = <0>;
                         remote-endpoint = <&dp_in>;
                         data-lanes = <0 1>;
                     };
@@ -148,3 +175,49 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dp-bridge@5c {
+            compatible = "ite,it6505";
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6366_vsim2_reg>;
+            pwr18-supply = <&pp1800_dpbrdg_dx>;
+            reset-gpios = <&pio 177 0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    it6505_dpi_in: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+                    ite_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    ite_typec1: endpoint@1 {
+                        reg = <1>;
+                        mode-switch;
+                        data-lanes = <2 3>;
+                        remote-endpoint = <&typec_port1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.39.0.314.g84b9a713c41-goog

