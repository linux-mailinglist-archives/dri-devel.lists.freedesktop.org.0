Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97730A30605
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726AD10E442;
	Tue, 11 Feb 2025 08:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="bqPZmnrp";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="X6Tg75h9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142210E442
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1739263309; x=1770799309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0R9isyySuwnNx9dPUykzSU2bGVzljEuoHr9O38qK+Y=;
 b=bqPZmnrpmQxT1TCs+qBX1Gb5Z93mWt8DB07FNDXLzzp2lUrv/roDacMG
 hPgHMcvekgdXPgEXPCgE04wTt3sw2xEdzQrBDgf09hIIkesSVHxp8aQWp
 jiElBOwBDoxDtmndLOEqBb2949s2aY2KT77uuIbX9fvQJdn5FebqSO7xW
 PwaPzHsfFom9CEOmOoy9T9LBi/PZnuPCkkvF0z3jaH31aTdUoVmeIeKjL
 ovTkR9pCbaG0G1v3ktSS4otEdrFdUI6BTj/Ux7zYSEJNFJrYob9M+o+DM
 VL2S9/WnJRWqzhSn2YHveAkBPxiSDJ0x5iaEjr1pNhUkyStMRE314IGcs g==;
X-CSE-ConnectionGUID: M68Dm3NlQhGTHv/2IRQE4g==
X-CSE-MsgGUID: 4rMTWigRSCqlMw7RFcDnvA==
X-IronPort-AV: E=Sophos;i="6.13,277,1732575600"; d="scan'208";a="41744830"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 11 Feb 2025 09:41:48 +0100
X-CheckPoint: {67AB0D4C-18-EBA888C4-C1AC8B84}
X-MAIL-CPID: 3998205C48C698F448D73D29C0A891B7_0
X-Control-Analysis: str=0001.0A006366.67AB0D4D.005E, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5270A169CCC; Tue, 11 Feb 2025 09:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1739263304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0R9isyySuwnNx9dPUykzSU2bGVzljEuoHr9O38qK+Y=;
 b=X6Tg75h9ZAC+qaahQ5zW2LRbzAn8bhsXu6GjStruoYhsrGU4lChKSk6kAz/Vi9+S6IxIiv
 Yz7VZvsz0DTasttE2mCd8z+C6oy5WX8owXoWJAqtOohPUMb2iE93RxB9U8SeJlOiAtgmwU
 N3olBhd126CcFxY7JJAW+cFDWLe2rM47/2Dh4MQwW/KTYlBJb09MKXtu589IQTM5r07aiJ
 CZVwkoNSt/cmyBz0sOESvOVf1fq1n/tqp2tNqqOlEQVW+JTZiyR3d/hDkN89EoCTLeW6mB
 csFvFw6kkqv4WgEc2x183YiBslTmKpYK80dh+sJrpc5GQQPunuRtK9unFxGdGA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 Freescale i.MX91/93 DPI bridge
Date: Tue, 11 Feb 2025 09:41:18 +0100
Message-Id: <20250211084119.849324-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
References: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The i.MX91/93 contains a single syscon registers which is responsible
for configuring DPI output format. Add DT binding which represents
this configuration as a bridge.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bridge/fsl,imx9-parallel-disp-fmt.yaml    | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
new file mode 100644
index 0000000000000..54cb73b59b1eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/fsl,imx9-parallel-disp-fmt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX91/93 DPI bridge
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+
+description: |
+  The i.MX91/93 mediamix contains a single register which is responsible
+  for configuring the parallel display output format. This describes
+  this registers as bridge within the DT.
+
+properties:
+  compatible:
+    const: fsl,imx9-parallel-display-format
+
+  reg:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for DPI output (panel or bridge).
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    blk-ctrl {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        bridge@60 {
+            compatible = "fsl,imx9-parallel-display-format";
+            reg = <0x60 0x4>;
+            status = "disabled";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpi_from_lcdif: endpoint {
+                        remote-endpoint = <&lcdif_to_dpi>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpi_out: endpoint {
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

