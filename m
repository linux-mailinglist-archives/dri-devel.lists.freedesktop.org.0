Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6F848794
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28510EA43;
	Sat,  3 Feb 2024 16:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWsYYXK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082D010EA43
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:20 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7bf0f3bf331so130815539f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979259; x=1707584059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHK4uYY3PEuLbfB443xySfJh6mTWFIfLyC9ZOn+YSEA=;
 b=kWsYYXK2VFx5MGOwFH6l73ABzxPMc02zTT2sJUf4Gp5t8KdpzLDSSYEq0dJH8CE9Rn
 UNAHSbVpncaU7PZbsIXdpKAwF4Q7hZkkBp7MAuWLU0baGU1UMo1IlrXW1wOXm9O1fLeC
 dLdZkhj8yrjIPiny90RF0VHt+Z2i4XQwwlsMvWlCjO5x4OVet2APaomKzA/O/9pdcnso
 yvYiaPlHjn0Mt5Re0oMfYNhl+im3d5XZCHLt05lHYh0WgMoCdysQ0hhiNYG2nAjbLx9S
 Vp/BJXRyHHi7VFym/f/fztvcM6Bss8Ozx6e7Ze4aBjmxAcBGBqTrbB0B4Nl7nKHlEfyd
 79nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979259; x=1707584059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHK4uYY3PEuLbfB443xySfJh6mTWFIfLyC9ZOn+YSEA=;
 b=t0fVCz5tw3gmrKhuce9U8COXc3GLj7AhSi+7/HW/Hu0SjhSeOH2SwHOuOudlqCA0CL
 AyPq/KznpEep5nQLHc3ALNLRH2h9K5x5/xgSdEeT0HmPpOTQUcYW18v6O8rwQKrdNOZU
 HNnakvE8pb8HDFU9A2YL7HncngTsbdVuR7on10q+bRZGJ1JGe8ZIjnVT2BLRhvAw0QQB
 LSHeFimj2q0NawH/qVxcRWnsIDkqBwHKnT9vPm4bF4kUsxUlotGgIo7szYpSMz+BYBNt
 0NlvZGztlMY2vOl7Oqev5HEzpg9Bhvobm0wwR4EOHz9TAn5Vywb2nHaPrz8qTmeipC4r
 jteQ==
X-Gm-Message-State: AOJu0YwGuDHWsG9cxtzbn5u5THyRMo39mfnn4Y6XyWwKQnCucTStfneC
 nU+rJRl5IYX+hr5qthlZTqj0tjeNFpAO6WDDz6TRcFiYNU/lendd
X-Google-Smtp-Source: AGHT+IH5DzrelkZeUzQOrbkI+GctzSKGfiIH9RZE+YFrVkDU00cTd2CRzJq//djvwBf6b1rrDqsQQQ==
X-Received: by 2002:a6b:5819:0:b0:7c0:409e:e3c5 with SMTP id
 m25-20020a6b5819000000b007c0409ee3c5mr5574885iob.19.1706979259164; 
 Sat, 03 Feb 2024 08:54:19 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXyOusTxAlEpAGlVDzNppwPsOqKckjm7lzwaCDbk6BJXWppLX7luv3fv5T0RSa5IzcdTQ7VwdHiKJ+0mT3b+ebzMbtut5OfmBMbUET5BV5ADOvN8uuvTTA5Zpn1ViPvRYwd5UUil8Z3a8lHC7Je0LPNbREzDR7R2vYu5SnvQ0qChXh7IaU8w/1fBVNQvschkCOvUnidyCQi0TMWC+RXvO7Ebcsi9fmLs+1CxyljaOLzlGRfYlsvPL5peem3JM0/HJkIEKuOnO9nDYKPlvD21irh+rwl2ze/t9idOn6BT2hqU5KEsryzAa1k4tgXK/GjW45TPqymEA/GquwctU4VldBwtDY4bDgdx5hEFeZsl6MHjEl2ZfOMazVnqAwiiT+DRVRsO4Zf09i28gfbWNK8P+Guka9VZM6iEYmMnpHpWjpWByNVY3FkuHO16LAfKay0uZUXHZteofRXFMLY2wT1s6xGVjXHGcmg9N7D6T8x2T5DBPYkrLc6sFH+2E1nzEFEFsPsLwkQRL+h87diA7AuIDqFeq4hQzGCAVigzRi5mAAknvFOiNVkOjx2uaVQwurSHvB9d5dT4poievAH/jkGiNaQVRCk152bP4QLPJHLeqzzCu/jr0kFPc25ZbApxcToIHcHzjM1Pmn5DMF2mxDpc8IUXuVwNWgT7ZE7mpovYvyq7jGeaB2Z0mcIjMcXpcIZoqWaOx8VagivoUmpGMNMGa21eG8+Vdv+aVlwN0l8LmzkkNamRwKTM4g7B6dwMlMC9MNnIrRDVF8rb0ja5kx43Ifwy8lCIi7AONLkciGw1dVR9+UEpO4KuKNm67CEzvCrxykvmAI6d8BB0efxYQ6e1Pl29sXmpXT/z/+Dse0auIzT4H0FQfEkO//4htSCy6oliv6omAsMZMMRr9Wj9gwrH/m+0w1QjRghCkiySHtI6eeBdwEw7rM58x1bBZCnKJSgfsQXw0
 sfJvvq0jKffalZMFTlDiHXwfsmaWZZguesYFTHSgC6j4BAOBu0KcNqADA3m2HqTp9nv/g7kGB1gY7aNY6cYj1YLFrcTePHBl8NLNtrtgczP2D8Y2E7mlOCEJJI4ebctHmnH1pZjWQU95luF1YCMOHFedMkYepuL5oIUOTukmoCI3x5cMy40sPwXlNqk2aF22Fodwztf824P6ccxmWCriu5UxydYuzgSw==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:15 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [PATCH V8 09/12] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI TX
Date: Sat,  3 Feb 2024 10:52:49 -0600
Message-ID: <20240203165307.7806-10-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
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

From: Lucas Stach <l.stach@pengutronix.de>

The HDMI TX controller on the i.MX8MP SoC is a Synopsys designware IP
core with a little bit of SoC integration around it.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

---
V3:  Change name and location to better idenfity as a bridge and
     HDMI 2.0a transmitter

     Fix typos and feedback from Rob and added ports.
---
 .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
new file mode 100644
index 000000000000..3791c9f4ebab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP DWC HDMI TX Encoder
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+description:
+  The i.MX8MP HDMI transmitter is a Synopsys DesignWare
+  HDMI 2.0a TX controller IP.
+
+allOf:
+  - $ref: /schemas/display/bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mp-hdmi-tx
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
+      - const: cec
+      - const: pix
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel RGB input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI output port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    hdmi@32fd8000 {
+        compatible = "fsl,imx8mp-hdmi-tx";
+        reg = <0x32fd8000 0x7eff>;
+        interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+                 <&clk IMX8MP_CLK_HDMI_REF_266M>,
+                 <&clk IMX8MP_CLK_32K>,
+                 <&hdmi_tx_phy>;
+        clock-names = "iahb", "isfr", "cec", "pix";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX>;
+        reg-io-width = <1>;
+        ports {
+           #address-cells = <1>;
+           #size-cells = <0>;
+           port@0 {
+             reg = <0>;
+
+             hdmi_tx_from_pvi: endpoint {
+               remote-endpoint = <&pvi_to_hdmi_tx>;
+             };
+          };
+
+          port@1 {
+            reg = <1>;
+              hdmi_tx_out: endpoint {
+                remote-endpoint = <&hdmi0_con>;
+              };
+          };
+        };
+    };
-- 
2.43.0

