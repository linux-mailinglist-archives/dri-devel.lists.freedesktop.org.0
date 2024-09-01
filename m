Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252A9674A0
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1E010E183;
	Sun,  1 Sep 2024 04:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="od7QrA7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1978610E183
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:31 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3df02c407c4so1884738b6e.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163650; x=1725768450;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wd502yvg5fXt4u5g230ZTpdeyPtCH4Yq39fj6qZgjT4=;
 b=od7QrA7axGiVf158QKrfRqsIdLrlIAWki6fGjBi4DT1BygEMYv1kEIP4rpmgcGrnxs
 YxVdYvFSOf3hNnRJ69xGSBH55lwYZp20IuFirWnyP9MqntoYC5JBXEMPyoWPEREEHGjB
 sNvMIz0x/H6Dap708QN1TlBVFfwc52ogP/TA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163650; x=1725768450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wd502yvg5fXt4u5g230ZTpdeyPtCH4Yq39fj6qZgjT4=;
 b=dzxjKJtdV8MgPD2ojvDqCJ9ryuUm0MYpxfTe572EZMO7/1+48CFAxuuJFPNYZQTtIi
 N24ArcV0nTiUcsV19wTEW3U8lqrjvTq6hOVdpO/WInDkWwn+UP7qK/sq/e/3d2lyGnug
 M64WHITZbiOLsESV0RWR6WB860Qs6nVaa9U0PXy4iHJXuhfkZc/tZ1cs4RQ6kEqnj4B7
 e7sJhuH/YnmaT//jq8D9nn2k79ahLlJDDDU55MPhbpMzS2DOFjCDX7OOrLH52QdygtbP
 fEJtGDeoPVLj08WYv6oXJHR0s/73la6e0O2ZhmyhmLuMbkXar6GLgUlKeHhn3veRKIpd
 B5VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXiFb/Wmz8skwCtuKizva/H0YINkORBtKnUPIYwv7vXfIsYQYCOtCbZ/1aamr0kVV6YP8h7B1L51Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDb1nk6BvhQyBjv6BDMQp7V5rEWPCQDXccZcDQLPcKlavnfgZp
 RS/G8TGGomSEWhXgOO03kqge4dhd7COff2jNQByDn2jM4yhsPri2mAi3XP3V+3NQc56Ibsjam2Y
 =
X-Google-Smtp-Source: AGHT+IGL4OiCHHZFsgZPnNJ0c3FJUh9XkC9nxzYLew8976ZXhgGWIxU50B53RDoHj8H5q7Hy8p3c6w==
X-Received: by 2002:a05:6808:318c:b0:3dc:299d:c505 with SMTP id
 5614622812f47-3df22d06635mr3681624b6e.37.1725163650076; 
 Sat, 31 Aug 2024 21:07:30 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-715e5763a67sm4833459b3a.216.2024.08.31.21.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:29 -0700 (PDT)
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
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v4 13/18] dt-bindings: usb-switch: Extend for DisplayPort
 altmode
Date: Sat, 31 Aug 2024 21:06:51 -0700
Message-ID: <20240901040658.157425-14-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
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

Extend the usb-switch binding to support DisplayPort (DP) alternate
modes. A third port for the DP signal is necessary when a mode-switch is
muxing USB and DP together onto a usb type-c connector. Add data-lanes
to the usbc output node to allow a device using this binding to remap
the data lanes on the output. Add an example to show how this new port
can be used.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/usb/usb-switch.yaml   | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index f5dc7e23b134..816f295f322f 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -52,6 +52,14 @@ properties:
           endpoint:
             $ref: '#/$defs/usbc-in-endpoint'
 
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: '#/$defs/dp-endpoint'
+
 oneOf:
   - required:
       - port
@@ -65,6 +73,19 @@ $defs:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
     description: Super Speed (SS) output endpoint to a type-c connector
     unevaluatedProperties: false
+    properties:
+      data-lanes:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An array of physical USB Type-C data lane indexes.
+          - 0 is SSRX1 lane
+          - 1 is SSTX1 lane
+          - 2 is SSTX2 lane
+          - 3 is SSRX2 lane
+        minItems: 4
+        maxItems: 4
+        items:
+          maximum: 3
 
   usbc-in-endpoint:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
@@ -79,7 +100,75 @@ $defs:
         items:
           maximum: 8
 
+  dp-endpoint:
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    description: DisplayPort (DP) input from the DP PHY
+    unevaluatedProperties: false
+    properties:
+      data-lanes:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          An array of physical DP data lane indexes
+          - 0 is DP ML0 lane
+          - 1 is DP ML1 lane
+          - 2 is DP ML2 lane
+          - 3 is DP ML3 lane
+        oneOf:
+          - items:
+              - const: 0
+              - const: 1
+          - items:
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
+
 examples:
+  # A USB + DP mode and orientation switch which muxes DP altmode
+  # and USB onto a usb-c-connector node.
+  - |
+    device {
+      mode-switch;
+      orientation-switch;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          endpoint {
+            remote-endpoint = <&usb_c_connector>;
+            data-lanes = <0 1 2 3>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          endpoint {
+            remote-endpoint = <&usb_ss_phy>;
+          };
+        };
+
+        port@2 {
+          reg = <2>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          endpoint {
+            remote-endpoint = <&dp_phy>;
+            data-lanes = <0 1 2 3>;
+          };
+        };
+      };
+    };
+
   # A USB orientation switch which flips the pin orientation
   # for a usb-c-connector node.
   - |
-- 
https://chromeos.dev

