Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED9660DCC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 11:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263C10E1A0;
	Sat,  7 Jan 2023 10:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773A10E1A0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 10:23:24 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id jn22so4263136plb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/gEsNzrA/Lgz87FE9mqz10fVZbIVU9EcG3Z05y5ydc=;
 b=hgJ4Os7WpWJlgsWbuHlRB+V1rpk6UR3Ooai1oGDOzAmDlcIxpZkdNr6BfuRg4w3+Ky
 kVI13jd0BVccpwZryw4DlNHjafFmMB0iseorC/ChPfyew6rewv28/dY2jcAIi8DlroQN
 hKKXr4hrQiBgNHZAPwC6D/0DXBvy5vsodNVfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/gEsNzrA/Lgz87FE9mqz10fVZbIVU9EcG3Z05y5ydc=;
 b=7CUCKSnRcZ3b43hmD9lm3lE0dotV4V4u/eo8U/BIxYJiewFMsLef497rucQaGClyX4
 2KlTSZFrtMSg+Wv96zHO1BdxneNU/SyfZL1j+B0G38gn+irA2U3+Gx3BaVSEIplvV8MK
 12dELv/EqPmpaI8EWddSRAdgvSYJrb1AdH1tQA/NqXGV5zTcR5pXTm4VctsuWKJAoHo7
 Pcd+kjBlxXeeBXfR7RjO4D8OvS90WxvO04eNQIx3N6V1jTwRTrgav/ZEgz27cz0Bpbgr
 F6pGgqylPfE/JRYpgYiEVqWbD+d7aXYZxyHE08J2xgGtftzNmAgFE+HQbo5XicngZ64I
 xf6w==
X-Gm-Message-State: AFqh2kp5Rsk878x6YypjdWxCgnq98vn5hpraQCHxy7IlTh4MZuezrnlV
 tV2J8OobOZ0cLVtxoS9PAq7udg==
X-Google-Smtp-Source: AMrXdXtnzbo8Q1fSxaMt5B/cMkNwiuw6W8IQGXbJSIiVN5t5UXvJHEUogVVEhrR3fRaghBEGjRsbMA==
X-Received: by 2002:a17:902:ec89:b0:186:b063:32e with SMTP id
 x9-20020a170902ec8900b00186b063032emr85775181plg.62.1673087003925; 
 Sat, 07 Jan 2023 02:23:23 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:180d:95e8:f4:84fb])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 02:23:23 -0800 (PST)
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
Subject: [PATCH v8 7/9] dt/bindings: display: bridge: it6505: Add mode-switch
 support
Date: Sat,  7 Jan 2023 18:22:29 +0800
Message-Id: <20230107102231.23682-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230107102231.23682-1-treapking@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
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
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
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

 .../bindings/display/bridge/ite,it6505.yaml   | 93 ++++++++++++++++---
 1 file changed, 82 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index b16a9d9127dd..8d56654634a8 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -77,20 +77,43 @@ properties:
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
@@ -102,7 +125,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +161,11 @@ examples:
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
@@ -148,3 +173,49 @@ examples:
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

