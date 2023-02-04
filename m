Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EA68AA19
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 14:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B2A10E1DE;
	Sat,  4 Feb 2023 13:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CBE10E1D4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 13:31:35 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 5so1487251pgd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScndThhwtHpV5F0P8Xxb0ofinCCGGRNciaNDDZjg+H0=;
 b=XMXwPJoH3Jms7/I7o0HdRZ4tUuiI4VmyzVUL9oedcnMVzKlm7ozMMe1HWsADEeRwbd
 oC+UHxdLK8yGWyjG6ha5JBruOBKtnWQuF/6JQWuoKG+nVieQxr08s56ut91LsVj2TE05
 qU0HcnTGMmxp+onUUbbVvUqAXMRjZ4An/6UKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScndThhwtHpV5F0P8Xxb0ofinCCGGRNciaNDDZjg+H0=;
 b=AcZylTat+3fhp0Ol9PpVimZrwJ/pMoy3Md16f5Ft5dCth8mft+QkHV5UYSxINW05hW
 X408i9bAsDJRw0LeriTp8wVgRmaKEwSzGy+7FaxH/UiVtu1Pm3aM3M8yNsDjMChXqbNa
 OAPdNDFZbkPWOz3Q3qfRQb6lLNWJZ0Ur8H5Lub7b4HxUYlSwyBMmPM0UpRnkCTLRYnNv
 DsgakPUGAgks6JdBAjdzL1t2jEh/rVcSrU5B2PEtbe4nVj9IML3BH6aIeZ0hWzWTMQtN
 zEq3d1fhnKJpo6kN75oWNLP7tQ+yYQMeIl47Au4NUX23L6ZbyGTbn+IODXEwocsh6WQr
 lQSQ==
X-Gm-Message-State: AO0yUKVTHiJTGsHE7EbmsbhqVl/460konwR49xjES5jylFGGtmvppcV6
 bNq1qqce+UM4cBftf9X/49ubSw==
X-Google-Smtp-Source: AK7set/zF6HqbNPS6IKmws2CM6dRhPc7IBJbyhe+r7yBH+N3hD5Manh9iXqhdIuaKdhLNAEUJTOGUA==
X-Received: by 2002:a62:388f:0:b0:590:74f1:8c8a with SMTP id
 f137-20020a62388f000000b0059074f18c8amr12515095pfa.15.1675517495112; 
 Sat, 04 Feb 2023 05:31:35 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:31:34 -0800 (PST)
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
Subject: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add mode-switch
 support
Date: Sat,  4 Feb 2023 21:30:38 +0800
Message-Id: <20230204133040.1236799-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-acpi@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, chrome-platform@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Xin Ji <xji@analogixsemi.com>,
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

Changes in v11:
- Updated the description of the endpoints in the bindings
- Referenced video-interfaces.yaml instead for the endpoints binding
- Removed duplicated definitions from inherited schema

Changes in v9:
- Fixed subject prefix again
- Changed the naming of the example node for it6505

Changes in v8:
- Updated bindings for data-lanes property
- Fixed subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check.
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index b16a9d9127dd..8ae9c5cba22c 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -75,22 +75,49 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: Video port for DP output
+        description:
+          Video port for DP output. Each endpoint connects to a video output
+          downstream, and the "data-lanes" property is used to describe the pin
+          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
+          respectively.
 
-        properties:
-          endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
             properties:
+              reg: true
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
+                  - items:
+                      - enum: [0, 1, 2, 3]
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
@@ -102,7 +129,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +165,11 @@ examples:
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
@@ -148,3 +177,49 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
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
2.39.1.519.gcb327c4b5f-goog

