Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426ABCF9EB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7744110E346;
	Sat, 11 Oct 2025 17:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="tqjlmaHY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f++N/k58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BD10E345
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVMt0wx4z9smD;
 Sat, 11 Oct 2025 19:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LjHuRvAlrfCTpQDqtJrxybp4IoylwmrNNBs7s/aRME=;
 b=tqjlmaHY1CGDfdfoJiakvgTc2fopzFqf6q/gsCflhFR4rHqU7L2EEsms4bzwKYHXYz4b3o
 V4g3hvuaXo0bCu32JJofDqANm16PwIHAoIdMxp8k3XYBbb1aUiV89Cfwkiuh5FNeDj4yG7
 hZREnFB1IqgP33ytoWRKCIeNMlY0UFL39PEVLLkgWGc7Dr6eQE0y2fIkIrrJdPxXnUGR75
 GFi5jlbVW+STjYsMTgEa8bW66No4Si3qYAQIfKYhSY3/r+VQTe/2uA14Duw8s/Z0QgQh09
 HcwGhM9Itesjg3icn3UyLkYdVflVpDhJsiR1bSWFPgjr58F2pvp2xZkLc3bziQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LjHuRvAlrfCTpQDqtJrxybp4IoylwmrNNBs7s/aRME=;
 b=f++N/k58Ot2ykVd+EAPD/3jivNMZ2j25H2ZOquPo6g9OT0UyYX8s1RAcZUpBhHcLHz3SO7
 4aDJ3l5xEysB1uf9Is7mT1ZPiZYweub6nq7FdwUyYhmy8bGpRx3MykW/4PIZt146zL/3UW
 x5c6nPQJN6Vo0pjn9sFuBKu+e9TXEr/7eFrscX4GZd5NlMDG3qO6hSw3N+Ip1nobyiYDRi
 Jk0WiuNIDJvOu0NbI7PkIliODsQZ0Qbix4FP1S+SVRnBDYMxtRXRLowvYkm5FsmTZ8PAMp
 vXv6EG10as4nBcYQJfP3Xx7oliOur4qUXxNQA9HWIpRTsCM7TRwX5Y2G7Fmufw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream CSR
 module
Date: Sat, 11 Oct 2025 18:51:53 +0200
Message-ID: <20251011170213.128907-39-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xry4amm6fd4yjhbdnui4z36buro1w5ge
X-MBO-RS-ID: 7d7d6d1d1f9255c8d3d
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

i.MX95 DISPLAY STREAM_CSR includes registers to control DSI PHY settings.
Add dt-schema for it.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../imx/nxp,imx95-display-stream-csr.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
new file mode 100644
index 0000000000000..61153120c9378
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx95-display-stream-csr.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/nxp,imx95-display-stream-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX95 Display Stream Block Control
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx95-display-stream-csr
+          - nxp,imx95-master-stream-csr
+          - nxp,imx95-mipi-tx-phy-csr
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@4ad00000 {
+      compatible = "nxp,imx95-display-stream-csr", "syscon";
+      reg = <0x4ad00000 0x10000>;
+      clocks = <&scmi_clk 62>;
+    };
+...
-- 
2.51.0

