Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B8966C17
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4410EAF5;
	Fri, 30 Aug 2024 22:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyNZJ/Op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA3910E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:29:11 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-829e8718502so89005839f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031750; x=1725636550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yb3wjHwKHyyErGOdPoNDwcSg6+46HG6ew+HhAf+N6s0=;
 b=EyNZJ/OpieF79HAQ/8PtUuqeVGwDUuPG7eadXNU/vuYBiYM0PUm9FaGNEQntlbmGBk
 QAKf2r6CQw09T3wFp515L9Oz76Ut9USOhgnf7LVWzmhKLrkQlbV9C4woJ9sVpktq8fB2
 YqOIMnEMejQpEY+HDoxi2rMEMEhNGtsP470SuDOI/+zaw4e0+5c1LS6T1SLEkQQdKn75
 adiOEo/VAtKZwFmLSXdzUKhzwMm4WI4KbTXQKCdkjE0uB6i/iTvqpTSJdWcF5gWXjH5B
 ul6cOh5ZFFU4PNxZSy4Gs1yyyZRvDDXN0DvKcMcnmEZrzAY0IchVMKDviqPZm+ppvIGQ
 1/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031750; x=1725636550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yb3wjHwKHyyErGOdPoNDwcSg6+46HG6ew+HhAf+N6s0=;
 b=ipfTsMNKEzPjRDcx3GqDXtjIuVisOjDUQ6Ju87JfJHoN6fszd1IkwEt8TyOwKKuv/E
 2vz//de3SmCt+bnr+ZJwQv7yOVjDOc3YW4LFGxP2TmAeYRHM7wQrBq+HkJtjUdV6UA9P
 gd/tMaIaj94EGx0iUKxvyQ8PNv3exb1qf8FS3eRNzN9+NgMSpIRyuF1MPaAO0LWAVtkG
 vCXjjN3EWsSxCvksjLITh78GEp8sWDS0kKoYccIds2GDInwUnfBG8PsIMAIRYO4ZNeBU
 VNmVa1Ou7LEosYNP6N2cwKHH0WvSwzT+aBxQDjeolOMryRM6V0/QD41i0mFPrcATHafi
 TpYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZP6S6zBR+7IQSxzhru38hcZfBQw5liiJk5Hk5JE128p3A6pG/vhI5uXce+t4gc62GjAi4egTF7FY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV9JSfp7zSoWlKJU0Lmzyqadt77C7arvPcjKYx3J+JDY3VURGj
 lCL6V0eBYB4v/VTJ/4FT4M9zY9gkVBYXTX80dLwJcEoUVbXR0IBT
X-Google-Smtp-Source: AGHT+IEz3mBaOKwLFj/ZjEG+4BFbjz/K3mBFBjE2qjFqGXqza5qxYjxCZaoYDNjR8MMS6ENuF16KGA==
X-Received: by 2002:a05:6602:2d8e:b0:825:2c2c:bd8f with SMTP id
 ca18e2360f4ac-82a11094862mr827663739f.14.1725031750178; 
 Fri, 30 Aug 2024 08:29:10 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a2f081csm92197439f.10.2024.08.30.08.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:29:09 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, krzk+dt@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: [PATCH v5? 5/6] dt-bindings: display: rockchip: Add schema for RK3588
 DW HDMI QP TX machine
Date: Fri, 30 Aug 2024 10:28:56 -0500
Message-ID: <20240830152856.9079-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
References: <20240830152132.8894-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
new file mode 100644
index 000000000..e71544ced
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip DW HDMI QP TX Encoder
+
+maintainers:
+  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
+  - Shimrra Shai <shimrrashai@gmail.com>
+
+description:
+  The Rockchip RK3588 SoC integrates the Synopsys DesignWare HDMI QP TX
+  controller IP and an HDMI/eDP TX Combo PHY based on a Samsung IP block.
+
+allOf:
+  - $ref: /schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
+  - $ref: /schemas/sound/dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-dw-hdmi-qp
+
+  clocks:
+    minItems: 4
+    items:
+      - description: Peripheral/APB bus clock
+      - description: EARC RX biphase clock
+      - description: Reference clock
+      - description: Audio interface clock
+      # The next clocks are optional, but shall be specified in this
+      # order when present.
+      - description: TMDS/FRL link clock
+      - description: Video datapath clock
+
+  clock-names:
+    minItems: 4
+    items:
+      - const: pclk
+      - const: earc
+      - const: ref
+      - const: aud
+      - enum: [hdp, hclk_vo1]
+      - const: hclk_vo1
+
+  interrupts:
+    items:
+      - description: AVP Unit interrupt
+      - description: CEC interrupt
+      - description: eARC RX interrupt
+      - description: Main Unit interrupt
+      - description: HPD interrupt
+
+  interrupt-names:
+    items:
+      - const: avp
+      - const: cec
+      - const: earc
+      - const: main
+      - const: hpd
+
+  phys:
+    maxItems: 1
+    description: The HDMI/eDP PHY.
+
+  phy-names:
+    const: hdmi
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    minItems: 2
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: ref
+      - const: hdp
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Most HDMI QP related data is accessed through SYS GRF regs.
+
+  rockchip,vo1-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Additional HDMI QP related data is accessed through VO1 GRF regs.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phys
+  - phy-names
+  - ports
+  - resets
+  - reset-names
+  - rockchip,grf
+  - rockchip,vo1-grf
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      hdmi@fde80000 {
+        compatible = "rockchip,rk3588-dw-hdmi-qp";
+        reg = <0x0 0xfde80000 0x0 0x20000>;
+        clocks = <&cru PCLK_HDMITX0>,
+                 <&cru CLK_HDMITX0_EARC>,
+                 <&cru CLK_HDMITX0_REF>,
+                 <&cru MCLK_I2S5_8CH_TX>,
+                 <&cru CLK_HDMIHDP0>,
+                 <&cru HCLK_VO1>;
+        clock-names = "pclk", "earc", "ref", "aud", "hdp", "hclk_vo1";
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
+        interrupt-names = "avp", "cec", "earc", "main", "hpd";
+        phys = <&hdptxphy_hdmi0>;
+        phy-names = "hdmi";
+        power-domains = <&power RK3588_PD_VO1>;
+        resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
+        reset-names = "ref", "hdp";
+        rockchip,grf = <&sys_grf>;
+        rockchip,vo1-grf = <&vo1_grf>;
+        #sound-dai-cells = <0>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            hdmi0_in_vp0: endpoint {
+                remote-endpoint = <&vp0_out_hdmi0>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            hdmi0_out_con0: endpoint {
+                remote-endpoint = <&hdmi_con0_in>;
+            };
+          };
+        };
+      };
+    };
