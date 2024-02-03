Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D473D848787
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542E10E840;
	Sat,  3 Feb 2024 16:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jLRIWlg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119F10E840
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:53:36 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so184916139f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979216; x=1707584016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkvYfuuKpH2RXM+gZl2DrO4caEYcPakC9a9yPqGZtlw=;
 b=jLRIWlg9skXTjwLS4S/JS0A9+NesoHgJ7OirtK6fdhVgY+lCHCPFRx/mNoODkyOr/N
 p/HB6b42jTGB3vn46Kbk0HR3us7mGPV8O01E/ulyXJ1Ulu5EcCTnVMI4EZybO9TyvUL5
 hpzcWG9ACY0nTKMGfPnmFNqP8xC44EeSniF5VLw/gfdQ1o5HZR4H8Dplxkxwiarr4CXi
 05WVKi+jjHsyIi8l4qzz6k4NHFeGMiXynKJP2PgxfQlDKgbJPiNUXETgri0tqjtT8NJ4
 AyV55akJmKu/n5fbtdF4YnTwzNY7hdk81hoFKGScI8TZsJKWW2XS7x2pxal/zdAC9xYy
 UvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979216; x=1707584016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkvYfuuKpH2RXM+gZl2DrO4caEYcPakC9a9yPqGZtlw=;
 b=Uwu4yIGPRciMwKkWXMy8b4ooDLBobzVdnFAH70F7WSue+2t5EX/d4XeVEu7R3XwnXA
 ElX2jn6rZ0j6iwsi6qFAYraNdHhR3HYToTIMpgghpzlP14WxoI1QSXGRfNFPsVvI0EB/
 dhoLDXGlghMOnS3uvMUMN/podAn+4h6mjUrt9jeeNrksoKSCz9KOXCoA97w6cWxWyK9A
 05yYK61Rtpn5u+PV6Ef7xjcepyNpsxMi8648Sa5UqtHuJn8h9oahwYQReYdxJVT0hhqB
 ouNYqgJC0FShApXBuz90ZODnZC4o9AK1GK7vLaHeMw/dfByLRh3Mfafk1uhxFa/gya1+
 MdKA==
X-Gm-Message-State: AOJu0YwhIE24GHBr33asosyB0ek9KYER3/14molEhb/5iz+XEy7nQIIb
 TCMGIDdX0d7F9BxucYTpOEgGeAd36BErBx+v9jnWPRqkF/9QAPNT
X-Google-Smtp-Source: AGHT+IEnlehfxC3EzWtYjfCC3lg1i9dFNOJn0VmenuEK/v0vuI8ECXoRZdHOVhb90XAj8e9K5eLOTA==
X-Received: by 2002:a05:6602:122e:b0:7c2:c868:d864 with SMTP id
 z14-20020a056602122e00b007c2c868d864mr3311227iot.10.1706979215630; 
 Sat, 03 Feb 2024 08:53:35 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVjSq9uyvcTPIb1quTtFSupfo+AL7NwJHi6Gu9nFWWPsmK3n0IEtNuMcvPWgzs9ROEuzmDK7+Wupt2U4qGGShNuzx2ikrWYvZJ/eLQgqMNjsPAmbBFMoOlIfiUgvt9rDcSf90uM05CbsK7HmPlbjA4HdOvDHgzozVjMJ4nYwd3PIt7kwXGtQX+NC0ehIFWD/Iqc3ihmxr3qjqO0ux70S7eSaXSAudI43x6cWqJTIpY9O7Z0EJAQBAerJvvb63N4nuYp0CDntCNnt9jv5xL8UiE2YnKrLFgPQWmetCSi3NNhyIXe3NjiYKKKQjVdr/L6ApH0/1upjtGlWPICCQGcbX+MsVUVWD+10W428nzxIH+5dSaEUNKgA2UXG5O+3x8BPM42Lk1nw6769jHifqDAbmh8oYgREXJt43SEtWs0Q2Kw+8fa29c5MY4eUANjOM2LEd29krLgsvnzynjeAcWOgT2StD4fdgMHOHikKBm0upJuFRx6E24nV2rMqvEYYXlvVptT1CRz0FQaq3BXGZ2/+tYak8y962zSr0Z97YrKXI65juREBPHm/SogAU7MW2Vmz8Bug/jcPZt1ycppSiD3Y3CyVrF9zGlf3Ym+b7QEVGQVh43eY119Xx42CFZZjbRmMfdnRHG7LBZF0uGpH3ekeVHTbnVURFewtaY8GnQvpu/5v7C7deIBXMNhFN4aYbmBMWPdE7xaGuzpxOx85u4690rcnBzSOP37lsU/rU26nkQFukAKLzdkSNZCuiNoN55jijF5Q0zBbV6q5CMc2GY8g3jy0gMHsI2IHqeG+o/JM3vWdqh2gpJDd7rE7ckT5vg27ALY/Y2rER5Tbsanb4jlygSWOkMuURwUEdv0oecCQ2UxmAtpFh68Dr5hso0K9/yy7hag2o9VcCLmnHXBC2VVS4vSWHddjoSYUei0RdcQJO7eNCotvGJXUrv9rha08zAHKY94An
 d4r+OPZZMUhxaoi6lIu2Mv8TVSA6zWR4R7R+d4rA+c/RakQwPr38lbHRVnrC3W7wuFaXfGqiZswJWCs9+HeFccxOyl7VxYNRbbmce3Dyn+5gm+OpGoD+yu7xaaUBGZSoE2L3R/KWDDKIRnq98KiwcqGM1DcpLSTdJq1lC7Ni01p+sRk70WhetbCqzNgP6N/NWFDqhP2I0RhVgFQAw47O++snhkvHAL9d1il3HDdBnzucrXNqTLTuqp8gBJKqbZXj7hqlNYjBjc
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:53:32 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Subject: [PATCH V8 01/12] dt-bindings: phy: add binding for the i.MX8MP HDMI
 PHY
Date: Sat,  3 Feb 2024 10:52:41 -0600
Message-ID: <20240203165307.7806-2-aford173@gmail.com>
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

Add a DT binding for the HDMI PHY found on the i.MX8MP SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
V3:  Removed mintems at the request of Krzysztof and add his
     reviewed-by

V2:  I tried to help move this along, so I took Lucas' patch and
     attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.

     Added phy-cells to the required list and fixed an error due
     to the word 'binding' being in the title.
---
 .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
new file mode 100644
index 000000000000..c43e86a8c2e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI PHY
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mp-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ref
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    phy@32fdff00 {
+        compatible = "fsl,imx8mp-hdmi-phy";
+        reg = <0x32fdff00 0x100>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+                 <&clk IMX8MP_CLK_HDMI_24M>;
+        clock-names = "apb", "ref";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.43.0

