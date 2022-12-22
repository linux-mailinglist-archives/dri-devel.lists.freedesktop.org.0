Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDA65489B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630010E59C;
	Thu, 22 Dec 2022 22:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A510E599
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671748728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwxYSowsUOVXzzYlhvfbTb6mQSaIuo8BKUhLeaVJXnY=;
 b=SkvcGMpr5NsWnlA3MyPQ3ofD4FcwhFDFaGhrQQJrkMrNk71ff1Jd5/SLrU9NC8CFUjhkVc
 BFHZnOWxMa1ZBOK1uv1GSmT0G3M3bc7kKbV9/bfx9e7WnCaTpvhcSrXdv+8aXC5AunxC/n
 TCR+dgMBfy41Fhpguxd0xUmAUJ3wBI4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-hzvTHrIOM_Crv3HHD-dzJQ-1; Thu, 22 Dec 2022 17:38:45 -0500
X-MC-Unique: hzvTHrIOM_Crv3HHD-dzJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h64-20020a1c2143000000b003d65ff910e1so2901598wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwxYSowsUOVXzzYlhvfbTb6mQSaIuo8BKUhLeaVJXnY=;
 b=q/Qzi76fKDdOIS+nKRjIOcdLPTp9HJoGIkcx+eAbFpG3WFvjec+Pd+E7P5Conlv2N8
 4qrCIaY6BzwYHDXAtzCQn7JCEOscpvVc/bBNW+NLyR7GEVoUsUWIB+6RD/tKPlYkVu5X
 g239axljc0G8FmiVS//FrDxAe6VoRpE6vHaWzbieyCZG5tUaMzo1RBpAB1Zd3TWVzQz3
 Mj3rEiwv3vTKLnZ+qoyBwyIcdQMzlDqZS5UuBWL2ISVP+mOvuE9Ik6Epk+Se3/TBXg8f
 WmOAsmU9ckp+ScX4VxGXfvXRHr6lIlCPyHJbj6D3nPmLcW4Pb9AQBFn2pNkkShbzcLWR
 78iw==
X-Gm-Message-State: AFqh2kruAsSlVGhzkC1Djlg+VwQ0vLcKLTNacOTdgvsMr1ICacbcKtLg
 FCghR8kShuRTNDlTAaxUsdnlIfW9/7Qn9d4cxM9sff0IYXAeXQ11LNBTpB+omIPZYXJPy8YYSuO
 OTSZ5R/HvDJzH3ultjf2yRwHder1G
X-Received: by 2002:a05:600c:1f12:b0:3d2:267d:64bd with SMTP id
 bd18-20020a05600c1f1200b003d2267d64bdmr6313211wmb.3.1671748724361; 
 Thu, 22 Dec 2022 14:38:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtj1GOClBqgj08o5W4U34PiMnriSuW9A874fwaAVPy8exsgnTQ+N7dR0zR/XVRxgoDUmZD9nw==
X-Received: by 2002:a05:600c:1f12:b0:3d2:267d:64bd with SMTP id
 bd18-20020a05600c1f1200b003d2267d64bdmr6313197wmb.3.1671748724177; 
 Thu, 22 Dec 2022 14:38:44 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n25-20020a7bc5d9000000b003d969a595fbsm2386239wmk.10.2022.12.22.14.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:38:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: display: Add Himax HX8394 panel controller
 bindings
Date: Thu, 22 Dec 2022 23:38:28 +0100
Message-Id: <20221222223830.2494900-3-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222223830.2494900-1-javierm@redhat.com>
References: <20221222223830.2494900-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Martijn Braam <martijn@brixit.nl>, Rob Herring <robh+dt@kernel.org>,
 Ondrej Jirman <megi@xff.cz>, Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings for panels based on the Himax HX8394 controller,
such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
through a MIPI-DSI video interface.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/panel/himax,hx8394.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
new file mode 100644
index 000000000000..a8084e95f2fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx8394.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX8394 MIPI-DSI LCD panel controller device tree bindings
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+description:
+  Device tree bindings for panels based on the Himax HX8394 controller,
+  such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
+  a MIPI-DSI video interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      # HannStar HSD060BHW4 5.99" 720x1440 TFT LCD panel
+      - hannstar,hsd060bhw4
+
+  port: true
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vcc-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - iovcc-supply
+  - reset-gpios
+  - backlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "hannstar,hsd060bhw4";
+            reg = <0>;
+            vcc-supply = <&reg_2v8_p>;
+            iovcc-supply = <&reg_1v8_p>;
+            reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.38.1

