Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9963762B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8754D10E6CA;
	Thu, 24 Nov 2022 10:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BF010E262
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 10:21:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so80152pjo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 02:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9KcK1J3it0ftVBy4iMTAiutJ0HoDn4vV6l4PCThFvs=;
 b=EcrwUdGALRkhCF6+jeFlkUBLXIIWyUjpF4rTujN1HxPt2yoZ7bvcgpfN4ZwRsrq2M0
 ySDGRxTUTbLvGC/Sp+B/GHjpyxsqQj/pVTPgwu4fMEuINxqsrxM2OrlP7AbgmQqvP4SW
 MDTgPw1Wfh+96fRcWBl7io3b6fkJXmpeHm+/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9KcK1J3it0ftVBy4iMTAiutJ0HoDn4vV6l4PCThFvs=;
 b=M7ko3IZM6tPeL0RDNrOYwysEWooqQpjCg/d0n3Fco2FPdShxjTLe1NB/VcLV6bPi16
 byddrlz2fT5sqxsRpGvcXyfiv+tsZevs7lNm1fXS6pJOQgNTDosz7L+MdyqZCSmbDCoa
 phhU3BE6k9skc7rOPUZMFyYTpJv7NMN4aQQ4E8FDmoCBsQrO9WtAu8IVtqppFg4jGiKR
 AxC4aBO8SFLuiR+AxCTYvTm5OM1MxFFV8E3qflfnsdWwqCyHhYh3LG7HIaGGVKn7hSFf
 G3/zarXiHNyiS3QeKl3xVifeG5KN6ey3Yh9CxkMqLzBbu/O5ZI6oPrNcUBNtdEpZArXt
 Bw6w==
X-Gm-Message-State: ANoB5plGuxIuSsISlaq9zzQ1HkYdiGKUDNXyoSybppENEx/hx00lGvo4
 4I9ep05yUWlYjINwXGX5d8gW5Q==
X-Google-Smtp-Source: AA0mqf46GQ5ufhbsGjVkzHAuwHzwpntLipYUVoKE+qWJzofRfTXK5R5FNxhQAwt7WLq+0sY+rWaWLg==
X-Received: by 2002:a17:902:e492:b0:186:5f71:7939 with SMTP id
 i18-20020a170902e49200b001865f717939mr15675016ple.162.1669285286917; 
 Thu, 24 Nov 2022 02:21:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d446:708:8556:dfee])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:21:26 -0800 (PST)
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
Subject: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Date: Thu, 24 Nov 2022 18:20:52 +0800
Message-Id: <20221124102056.393220-4-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221124102056.393220-1-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
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
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Allen Chen <allen.chen@ite.com.tw>,
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

---

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..5fdbf1f3bab8 100644
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
@@ -112,10 +113,36 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/properties/port-base
         description:
           Video port for panel or connector.
 
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            unevaluatedProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
+
+              remote-endpoint: true
+
+              data-lanes:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - enum: [ 0, 1, 2, 3]
+
+              mode-switch:
+                type: boolean
+                description: Register this node as a Type-C mode switch or not.
+
+            required:
+              - reg
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -186,3 +213,45 @@ examples:
             };
         };
     };
+  - |
+    &i2c3 {
+	anx_bridge_dp: anx7625-dp@58 {
+	    compatible = "analogix,anx7625";
+	    reg = <0x58>;
+	    pinctrl-names = "default";
+	    pinctrl-0 = <&anx7625_dp_pins>;
+	    enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
+	    reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+	    vdd10-supply = <&pp1100_dpbrdg>;
+	    vdd18-supply = <&pp1800_dpbrdg_dx>;
+	    vdd33-supply = <&pp3300_dpbrdg_dx>;
+	    analogix,audio-enable;
+
+	    ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+		    reg = <0>;
+		    anx7625_dp_in: endpoint {
+			bus-type = <7>;
+			remote-endpoint = <&dpi_out>;
+		    };
+		};
+
+		port@1 {
+		    reg = <1>;
+		    anx_typec0: endpoint@0 {
+			mode-switch;
+			data-lanes = <0 1>;
+			remote-endpoint = <&typec_port0>;
+		    };
+		    anx_typec1: endpoint@1 {
+			mode-switch;
+			data-lanes = <2 3>;
+			remote-endpoint = <&typec_port1>;
+		    };
+		};
+	    };
+	};
+    };
-- 
2.38.1.584.g0f3c55d4c2-goog

