Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94D848791
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B7B10EA3C;
	Sat,  3 Feb 2024 16:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lon/yWCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AF010EA32
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:08 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7c00128de31so113761139f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979247; x=1707584047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iN7CHiElDXoarw0CBzFnW/ft9HNctCbMZzIXIZ/bUo8=;
 b=Lon/yWCTCTV1CMGh1W0yqbkzFG1z07/zjqQfCk2e/51rGPzBFquqxrCeFKSlI3XPZJ
 AMCfRSH3Y3NkE/y9h65e5OVwsOyhnl0Fj5YShrAUBB6ZrNfq6A7ADZbM4HmQ+4yvy9Pz
 FnPE2anbeMr9zLvRWsJ9J2VjLTI+Rteeb33U0KHq66RnvWW2tiqOPOXruqDFMkwqUsjK
 2F28dsmo+KYqCUUhQ04soyhk9u6d0hVGruCQWaXy99+to1bBdkfXgerP8gqzMoH0UOhx
 exzIU5eQDZLFtz/c9Jv4pKD6d0afeRbAqKN7gLAYkVoc8r/fhIzMABN+jP0PhluIjm1o
 nnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979247; x=1707584047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iN7CHiElDXoarw0CBzFnW/ft9HNctCbMZzIXIZ/bUo8=;
 b=rf2y8fiBsGVaprt0BIv857/DX6mv3VltyJDLmPdw5Uw+ZABkuL19lgCXZIQA7+vpOl
 sb5E6Aag3e/7l8cgkAb/Z4p+Tr0UBEdAoFYQdlGUgDXBze4BoVV8B3OK2ypohj9sLviB
 8x9iNrkeMuD91qFmvqkWAyPgxHkyFI8Wgw7a/Tc1k2Hpxzy6yyBpvUbKlp/S48d44i8J
 VTw1BP9uWUcLkl+rMxknKOGnZeJSJIX5hs9h/+PFhVfPbfaTtalenK8xLPECcANiMTsX
 XeugGM9vqzmv2EWn9fDKkAlJFBta9HTlX9uOjH5DFQnxwemw++jIAKrB4f6vcAf4WdTo
 KrSw==
X-Gm-Message-State: AOJu0YzBL4GHI2QhP6EnXK55n1WsgD5IPeL60F1ju7EU2Odm7GuTlmWS
 aFkhR+++YdJKcmIh1wYG6rJeatroc1FgwLuDJ62Wa8SRXMgT+okW
X-Google-Smtp-Source: AGHT+IHF9zh6CYjYVL5XR4aOsuCz2JWMZKXEuAxJLr9Xj8pwzfzLUwChQP/CnjWMh7hRgUYvMP22WA==
X-Received: by 2002:a5e:d915:0:b0:7bc:3cb7:b68b with SMTP id
 n21-20020a5ed915000000b007bc3cb7b68bmr9293261iop.17.1706979247353; 
 Sat, 03 Feb 2024 08:54:07 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVWZ3cE3qI9Oj54mFr3sAnVJXSwCFl8jEzpL9ucr/wb7wJtIiD8UuODjyzAMUp0ByTuWPWRCY3gFUaj6Tl1QSSEoFmjcqHnSIJm/CcYV2fBCR2TzZs6oMwGgz5yIoAFA319P7Cu/VvHvowXSFkPvrNG9Nk/p1zhIlaMWQVBz3OSXWpNjQTYmfW/BQolQDULLpBgKPdzTdQSV0JBqGa3HHFXp7F4tkWXzXv1y6RIxVcEbZ3kiXP0iTHuyLXiXyDE4oE+kWbIvORuO/pbkidoXGyPiHMTqHlcHCP6RyLAHu+WtrTwo+g1+tIBsqmnd3WPmnxcuegvPP95EWGHrYIdQSQ5Idbi4CwazuUWx2XpS24CfIaw8kbQLVFgOMCHdlhz9Pvz9XROrEFXVxzlJ1bvLegZgn8gzI1xXH9W9HOzuq1PMFioWzwvJdcCATyJeg2qPCZ0qZmHTBpt4mrW4zoAK/0TSwlUiG4XVET3T0cSJu0+3pOg4A8dzMvmlv9bwJT/FzSWVlGCyECr0tPGwNLcgv5hJ6a0E9vBLE0gA+Zuo671skr3tDr+otnlIdQfBv84iJVTiq/BagoTPx5fjx91RezHWRZi4PLpR88/htGeuFRZKJmoFIW9O+A0i1CMkwW+tpboQCIaRk8nL/tEsGc5GwTjAYBBAYnxrTMIYXQe6J1iCDjMHb50yy0ys1CsDDDN9O/57CQQ4yNiXYw57qtRvh6wglVsdEk2/o9OSlbUtzmv5X+RKM6+Jo5v6ACtTp/2R3Kb5XJX8DBNHt8MLEpAE6H0oiw7YZMxPMfrqUrsQx0rM+vHkHSPYfqbFKv6kSt+4S7NC61JYbp/haR+aVmsLSl9dfvWtwtdXMop/gIejD9oK83qBw6/OQfe3Qd2eZvpRGa7q+KETghsHfoNPq9ANbXAHYAP1lzUKelCh9KJtcEdUT0G9eyxTOPnnWm++V0vH82B46
 Op9yK3+Tazd+mB0eyGk7bUQiVbqEL1o+LnXA3pkY2OhBG/HNhjdGW/YhvFGDeSNAwHjh81LUNI122dg4+sDdF5D0ZfPnEwslU0jnCcOQ0rvvfxkXCjqSo0ypjOan2P0+R1Xtrho+l5/mS7NurD/WMxlLi/NHZGM3zN7RAGATKJEfT+oXCbdVquZgIBh5CsV6bN3/B7/E+jpc2JhNIVIy0qd4W//NRD7kGqGSt3b/48KAOc5HsaYPhWjAAPDDbPhE9SKMsAJIWwu5h+hYv8VkCh9cO6E/9aUkv7S+j0YQdt1N2R21dDVg==
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:06 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: [PATCH V8 07/12] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
Date: Sat,  3 Feb 2024 10:52:47 -0600
Message-ID: <20240203165307.7806-8-aford173@gmail.com>
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

Add binding for the i.MX8MP HDMI parallel video interface block.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V8:  Add interrupt-parent

V7:  No Change

V6:  Add s-o-b message for myself (Adam)

V5:  I tried to help move this along, so I took Lucas' patch and
     attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.
     Removed the pipe character from the Description.
     Increased the register size from 0x40 to 0x44.
---
 .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
new file mode 100644
index 000000000000..56da1636014c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pvi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI Parallel Video Interface
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+description:
+  The HDMI parallel video interface is a timing and sync generator block in the
+  i.MX8MP SoC, that sits between the video source and the HDMI TX controller.
+
+properties:
+  compatible:
+    const: fsl,imx8mp-hdmi-pvi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+        description: Input from the LCDIF controller.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the HDMI TX controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    display-bridge@32fc4000 {
+        compatible = "fsl,imx8mp-hdmi-pvi";
+        reg = <0x32fc4000 0x44>;
+        interrupt-parent = <&irqsteer_hdmi>;
+        interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                pvi_from_lcdif3: endpoint {
+                    remote-endpoint = <&lcdif3_to_pvi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                pvi_to_hdmi_tx: endpoint {
+                    remote-endpoint = <&hdmi_tx_from_pvi>;
+                };
+            };
+        };
+    };
-- 
2.43.0

