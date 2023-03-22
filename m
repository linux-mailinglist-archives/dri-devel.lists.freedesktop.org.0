Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C46C480E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3BB10E904;
	Wed, 22 Mar 2023 10:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3010E904
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:47:12 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c18so18859520ple.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679482031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qv3ksKSCg+9IA4ODwUD5ZGbwkN5dvfp2M1XcwFFi/6g=;
 b=JIReK93e9p3sTkiq3OYuLEGCFxKP8/gMxCdLkl5MQ2WZ/V1EsedH8G9N3s0sFDYqM0
 n3ozxCe5Fwxogi2DmK7gyr0EPq0l9phlm8ldgXITjZw02JzuJwUqwQJShe6K4otInt++
 QYNbFnmRRl3NxLtntHjKLLvQM/IKRg9pkpbbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qv3ksKSCg+9IA4ODwUD5ZGbwkN5dvfp2M1XcwFFi/6g=;
 b=PW3B9lDJMIg+m5a+dS7r7HuXQ4L+RLazqo7AsFM9h0lsLIys9yRkTj913Ah9GfBP9T
 yM7FuyM8tCY1hVJcTXI/oFHx5+9wjohaIbtWlzvoOxX7P2OS0AIvZRmlV+IKpCFcnf10
 5FvU9eewdfBq8xJkBd6A/Oc3UQ3Q+FQWfkwCp2Ra9BSe+HsbxuEhjW6ewg7ciUnpRIpk
 mMrYvWJAGApAPUV3y32EGmL2EFlJLgWAHs2ZJUIbt/imI+N1X+D2j7w8N4fwasJ5RQev
 O+BZOOzWF9QHiW9vpsVVvc46v3wf7M+cgAx6Z/m+I+Ryda77rReSThDDW18raONaaxHE
 Msdw==
X-Gm-Message-State: AO0yUKWnKVjvcmbWKFDcDBXFXzXephr6CePqAOxk3ry7hXQJoQbCAMNT
 xo5H1tB40nQb4+05igkXVbYXIA==
X-Google-Smtp-Source: AK7set+f9Wb+Q2WCbYZ0MAoO/CIWeV7uIpVl8+z0cc76zHIsYDd9CwxxsIb/zDGYgilYuXTTcCb1dg==
X-Received: by 2002:a17:90b:1c04:b0:23f:48b9:266d with SMTP id
 oc4-20020a17090b1c0400b0023f48b9266dmr3089936pjb.21.1679482030989; 
 Wed, 22 Mar 2023 03:47:10 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:343d:79bf:55f9:1da5])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:47:10 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
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
Subject: [PATCH v14 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
Date: Wed, 22 Mar 2023 18:46:33 +0800
Message-Id: <20230322104639.221402-5-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
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
 Allen Chen <allen.chen@ite.com.tw>, Chen-Yu Tsai <wenst@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Analogix 7625 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Also include the link to the product brief in the bindings.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

(no changes since v12)

Changes in v12:
- Removed the 4-lane binding in analogix,anx7625.yaml
- Reworded the description for the mode-switch property

Changes in v11:
- Updated the description of the endpoints
- Referenced video-interfaces.yaml instead for the endpoints

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v9:
- Collected Reviewed-by tag

Changes in v8:
- Updated anx7625 bindings for data-lane property
- Fixed the subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../display/bridge/analogix,anx7625.yaml      | 88 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..a50de536cffd 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description: |
   The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
-  designed for portable devices.
+  designed for portable devices. Product brief is available at
+  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
 
 properties:
   compatible:
@@ -112,9 +113,40 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
-          Video port for panel or connector.
+          Video port for panel or connector. Each endpoint connects to a video
+          output downstream, and the "data-lanes" property is used to describe
+          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1,
+          SSRX2, SSTX2, respectively.
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            properties:
+              reg: true
+
+              remote-endpoint: true
+
+              data-lanes:
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
+              mode-switch:
+                type: boolean
+                description: Serves as Type-C mode switch if present.
+
+            required:
+              - remote-endpoint
 
     required:
       - port@0
@@ -186,3 +218,53 @@ examples:
             };
         };
     };
+  - |
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&anx7625_dp_pins>;
+            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1100_dpbrdg>;
+            vdd18-supply = <&pp1800_dpbrdg_dx>;
+            vdd33-supply = <&pp3300_dpbrdg_dx>;
+            analogix,audio-enable;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx7625_dp_in: endpoint {
+                        bus-type = <7>;
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    reg = <1>;
+                    anx_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    anx_typec1: endpoint@1 {
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
2.40.0.rc1.284.g88254d51c5-goog

