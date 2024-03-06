Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CF8733D3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 11:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF9911258A;
	Wed,  6 Mar 2024 10:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Rxx7UCOb";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="W/Rm+8ri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBF011274E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709720271; x=1741256271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BQHn5cMhACeKzP4WjQoGsW0iJFib1tQeq8/rY6dbVNs=;
 b=Rxx7UCObU+r3W2vShLZVRS1PJyAI7OQCEzz1YCx+9X37UuVjI603nhPA
 rbyIqr6UTAZKPH3EVnbqFwIQkxMGVixVVzYTE/Uc9v0iuMmJMj2rSjKyW
 Hg+aKTnBa4GDt+nx2vtGbuRlE3zCjajEvwOWMw8ssj95RxHvsgAsf4ety
 in/eN5CSpPqaDNEYysWDkbeKvYUH1jbJAdyWiuW4vYaQVRZWowhRZ23hP
 YFSJEAKytTU/JhNZRfqA3zp94AH+Sx6g2U61OpBTd2tXPPZshOPnZIOOe
 w5VlpAgy769dQety2hiD9qFVIm8ym2xgzPNp0SyW4uE7x4EGSWiz9AK56 A==;
X-IronPort-AV: E=Sophos;i="6.06,208,1705359600"; d="scan'208";a="35760944"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Mar 2024 11:17:50 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A03716FFD7; Wed,  6 Mar 2024 11:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1709720266; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=BQHn5cMhACeKzP4WjQoGsW0iJFib1tQeq8/rY6dbVNs=;
 b=W/Rm+8ri6ogmIreodRdN33aw/V9mbNfIpdf7R2INzcis8fj/c7CNBmrc27Ue0Lko8Hvp+O
 cupE9Qzu89YfXBFzcl18ET/vJ+OyQgnugeBPEbV1coQzEg1KdtHMAJZxrxqy/o0mph/f6W
 brX00EfQXtjDEyMJZAXhpA8hG4VtNgvBEEGcsk0tqntYeUFcJFdHIy8tWh/CNLsKxDe3h+
 cEKuJ1ZytdUggu0SMduiwnrOdIz02UewOcgcmtUqeoEPyE3W0Gkn2Gu0EcJ3dUk1cSRckQ
 Eue+SH7F6u0W7a2eldCtBp9mn2yvlQoN1Bi5zFTZm/0XoDVF8nH5LmdC/9hbIA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: [PATCH v15 8/8] arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI
 support
Date: Wed,  6 Mar 2024 11:16:25 +0100
Message-Id: <20240306101625.795732-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
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

Add HDMI connector and connect it to MHDP output. Enable peripherals
for HDMI output.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   | 20 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     | 11 ++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a259853..406c8229097cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -53,6 +53,10 @@ &btn2 {
 	gpios = <&gpio3 17 GPIO_ACTIVE_LOW>;
 };
 
+&dcss {
+	status = "okay";
+};
+
 &gpio_leds {
 	led3 {
 		label = "led3";
@@ -60,6 +64,14 @@ led3 {
 	};
 };
 
+&hdmi_connector {
+	port {
+		hdmi_connector_in: endpoint {
+			remote-endpoint = <&mhdp_out>;
+		};
+	};
+};
+
 &i2c1 {
 	expander2: gpio@25 {
 		compatible = "nxp,pca9555";
@@ -91,6 +103,14 @@ &led2 {
 	gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 };
 
+&mhdp {
+	status = "okay";
+};
+
+&mhdp_out {
+	remote-endpoint = <&hdmi_connector_in>;
+};
+
 /* PCIe slot on X36 */
 &pcie0 {
 	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 427467df42bfa..9fe262a41b398 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -89,6 +89,17 @@ gpio_delays: gpio-delays {
 		gpio-line-names = "LVDS_BRIDGE_EN_1V8";
 	};
 
+	hdmi_connector: connector {
+		compatible = "hdmi-connector";
+		label = "X11";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+			};
+		};
+	};
+
 	panel: panel-lvds {
 		/*
 		 * Display is not fixed, so compatible has to be added from
-- 
2.34.1

