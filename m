Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187CC9526F9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDF10E350;
	Thu, 15 Aug 2024 00:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="X02NK0t/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6071910E350
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:36 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-201df0b2df4so4181555ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682076; x=1724286876;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1sRgulPJ1+mkqgVa6mf/3UC8LhJzrRLUVCX/M4EQ0c4=;
 b=X02NK0t/dJKt6RZXIs7pv69aiz9Hwj4EE8VZd8qS0kqLYOzRu8md3UiC3zoDMjpB0y
 m7fcks2ghYghYqQ2a83isxnEbOmRdgwnlDJCQ9sRC/rYswW2oW5SBJuZpRsb4pvH8mgY
 tU+Np+fLdRizb4zgpKlDZAq708pwJqEZH7Zik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682076; x=1724286876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sRgulPJ1+mkqgVa6mf/3UC8LhJzrRLUVCX/M4EQ0c4=;
 b=h1d92a64oXpvxHyjccVIDMjaoTHipS9CT+fTh+ia9btItVEoBYEsDKHUcTAcVNruiu
 56Cxu/4gNFgic7Z9pMPREOcWztuY1dv/DTiesYHXkg/UzpVTBIcqHcMA+cY1ERsvtW90
 5IizM8fI4loyy5BNB961KgN5Nn5+mh4TJx8eR5wdtiqnAHvtP5ZQcQ7KJi/1hs2HD98W
 WDiR7ysKUZBBl5RkSzRawCEYSkIcd9L6nEqY0DDFGq0g+tDQmv9r7gFENMaKPLLriieP
 PF5bRMHLR07sjyIAxrVQcm0ZxJPFUfsoGNIKp2QTXRCsA8wfFDIwVuBsJKKzAX7hBs8h
 jlWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwi+m6R8vrXEzrG1116/tPxss1o6rgNj4mf7C/JzdkTuA+X1m5oEYA78z9BBCnRknLkwWAOS4UYBPBguS1HzFewKisq/dWm6othim43TlR
X-Gm-Message-State: AOJu0Yz2G+TsNR1ejdwLy3DpT5lcwri0rtngIcgSmshviqAd0TqvwBoj
 rT7VDmErLuk4vfp3m06lXQRBhnXtUeG693uj16VLrSZ8FcKe5gAvAUXzgRinEQ==
X-Google-Smtp-Source: AGHT+IHbVzloJcEMHTMRWtdVRBjc1XqfslsElu4LQA8xI/W2vRG5qbpPTju2PgzgyOJIJKY/OqqVPg==
X-Received: by 2002:a17:902:ced0:b0:1fd:91b1:7897 with SMTP id
 d9443c01a7336-201d64d0e79mr53482475ad.65.1723682075829; 
 Wed, 14 Aug 2024 17:34:35 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f02faa5dsm2033485ad.2.2024.08.14.17.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:34 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 07/11] dt-bindings: chrome: Add ports to google,
 cros-ec-typec for DP altmode
Date: Wed, 14 Aug 2024 17:34:12 -0700
Message-ID: <20240815003417.1175506-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DT graph binding to google,cros-ec-typec so that it can combine
DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
that is connected to the usb-c-connector node's SS endpoint. This also
allows us to connect the DP and USB nodes in the graph to the USB type-c
connectors, providing the full picture of the USB type-c data flows in
the system.

Allow there to be multiple typec nodes underneath the EC node so that
one DT graph exists per DP bridge. The EC is actually controlling TCPCs
and redrivers that combine the DP and USB signals together so this more
accurately reflects the hardware design without introducing yet another
DT node underneath the EC for USB type-c.

If the type-c ports are being shared between a single DP controller then
the ports need to know about each other and determine a policy to drive
DP to one type-c port. If the type-c ports each have their own dedicated
DP controller then they're able to operate independently and enter/exit
DP altmode independently as well. We can't connect the DP controller's
endpoint to one usb-c-connector port@1 endpoint and the USB controller's
endpoint to another usb-c-connector port@1 endpoint either because the
DP muxing case would have DP connected to two usb-c-connector endpoints
which the graph binding doesn't support.

Therefore, one typec node is required per the capabilities of the type-c
port(s) being managed. This also lets us indicate which type-c ports the
DP controller is wired to. For example, if DP was connected to ports 0
and 2, while port 1 was connected to another DP controller we wouldn't
be able to implement that without having some other DT property to
indicate which output ports are connected to the DP endpoint.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 260 ++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |   7 +-
 2 files changed, 264 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..1238adfbea21 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -26,6 +26,137 @@ properties:
   '#size-cells':
     const: 0
 
+  mux-gpios:
+    description: GPIOs indicating which way the DP mux is steered
+    maxItems: 1
+
+  no-hpd:
+    description: Indicates this endpoint doesn't signal HPD for DisplayPort
+    type: boolean
+
+  orientation:
+    description:
+      Indicates this endpoint assigns lanes based on altmode and
+      type-c port orientation
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Input port to receive DisplayPort (DP) data
+        unevaluatedProperties: false
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: DisplayPort data for the type-c port(s)
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description: |
+                  An array of physical DP data lane indexes
+                  - 0 is DP ML0 lane
+                  - 1 is DP ML1 lane
+                  - 2 is DP ML2 lane
+                  - 3 is DP ML3 lane
+                oneOf:
+                  - items:
+                      - const: 0
+                      - const: 1
+                  - items:
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+
+        required:
+          - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port to receive USB SuperSpeed (SS) data
+        patternProperties:
+          "^endpoint@([0-8])$":
+            $ref: /schemas/graph.yaml#/properties/endpoint
+
+        anyOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+          - required:
+              - endpoint@4
+          - required:
+              - endpoint@5
+          - required:
+              - endpoint@6
+          - required:
+              - endpoint@7
+          - required:
+              - endpoint@8
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output ports for combined DP and USB SS data
+        patternProperties:
+          "^endpoint@([0-8])$":
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description: |
+                  An array of physical USB Type-C data lane indexes.
+                  - 0 is SSRX1 lane
+                  - 1 is SSTX1 lane
+                  - 2 is SSTX2 lane
+                  - 3 is SSRX2 lane
+                minItems: 4
+                maxItems: 4
+                items:
+                  maximum: 3
+
+        anyOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+          - required:
+              - endpoint@2
+          - required:
+              - endpoint@3
+          - required:
+              - endpoint@4
+          - required:
+              - endpoint@5
+          - required:
+              - endpoint@6
+          - required:
+              - endpoint@7
+          - required:
+              - endpoint@8
+
+    required:
+      - port@2
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+
 patternProperties:
   '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -35,6 +166,38 @@ patternProperties:
 required:
   - compatible
 
+allOf:
+  - if:
+      properties:
+        no-hpd: true
+      required:
+        - no-hpd
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+  - if:
+      properties:
+        mux-gpios: true
+      required:
+        - mux-gpios
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+  - if:
+      properties:
+        orientation: true
+      required:
+        - orientation
+    then:
+      properties:
+        ports:
+          required:
+            - port@0
+
 additionalProperties: false
 
 examples:
@@ -60,6 +223,103 @@ examples:
             power-role = "dual";
             data-role = "dual";
             try-power-role = "source";
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c0_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp3_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c0_ss: endpoint {
+                  remote-endpoint = <&cros_typec_c0_ss>;
+                };
+              };
+            };
+          };
+
+          connector@1 {
+            compatible = "usb-c-connector";
+            reg = <1>;
+            power-role = "dual";
+            data-role = "dual";
+            try-power-role = "source";
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                usb_c1_hs: endpoint {
+                  remote-endpoint = <&usb_hub_dfp2_hs>;
+                };
+              };
+
+              port@1 {
+                reg = <1>;
+                usb_c1_ss: endpoint {
+                  remote-endpoint = <&cros_typec_c1_ss>;
+                };
+              };
+            };
+          };
+
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+              reg = <0>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              dp_in: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&dp_phy>;
+                data-lanes = <0 1>;
+              };
+            };
+
+            port@1 {
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              usb_in_0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&usb_ss_0_out>;
+              };
+
+              usb_in_1: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&usb_ss_1_out>;
+              };
+            };
+
+            port@2 {
+              reg = <2>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              cros_typec_c0_ss: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&usb_c0_ss>;
+                data-lanes = <0 1 2 3>;
+              };
+
+              cros_typec_c1_ss: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&usb_c1_ss>;
+                data-lanes = <2 3 0 1>;
+              };
+            };
           };
         };
       };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..c860eb7ed3f5 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -98,9 +98,6 @@ properties:
 
   gpio-controller: true
 
-  typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
-
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
     deprecated: true
@@ -166,6 +163,10 @@ patternProperties:
     type: object
     $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
 
+  "^typec(-[0-9])*$":
+    type: object
+    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+
 required:
   - compatible
 
-- 
https://chromeos.dev

