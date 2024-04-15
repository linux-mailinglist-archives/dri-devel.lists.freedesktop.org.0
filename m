Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB68A56F5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818B10EB3C;
	Mon, 15 Apr 2024 16:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PTetTvaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3714F10EAA6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gvP98hInYZFCEb5VK1mtdtvDH7LnJs48ws8WOxjRwBY=; b=PTetTvaZs9ggupnEFrB7AJU0mZ
 mJlQ0/crf9ub0UjAEW+yON6fneMulycSAmSWYD8W9Y1qc6PX7tT2IQRH1Totn/HtrtTWyBzTPj1VH
 A9/EIuFWKtXSyAICrMXVafo8CME8B+jfM66c8QsZS37Xw5LgCg7fJJta6znGYAq1o7kUHEoC6CNc5
 ESgt1pfc/8A7I3IuKP845m+bDx9caKo6qCUyTqVzaJugm8lrakjPwit8ExvQ5OVWfAP39KuIz6CfQ
 3IK0jTfIpbcMrB/OAX4dcoSdxd3JALXeduAX7V2MuiYkuLH352ApZHFnYkcurK/XVP4swAy3SFExS
 RBajd2Hg==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwOmZ-004p8n-Ta; Mon, 15 Apr 2024 18:02:12 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>, Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2] ARM: dts: bcm2835: Enable 3D rendering through V3D
Date: Mon, 15 Apr 2024 13:00:39 -0300
Message-ID: <20240415160129.14149-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RPi 0-3 is packed with a GPU that provides 3D rendering capabilities to
the RPi. Currently, the downstream kernel uses an overlay to enable the
GPU and use GPU hardware acceleration. When deploying a mainline kernel
to the RPi 0-3, we end up without any GPU hardware acceleration
(essentially, we can't use the OpenGL driver).

Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/41694292-af1f-4760-a7b6-101ed5dd6f9d@gmx.net/T/

* As mentioned by Krzysztof, enabling should be done in last place of
	override/extend. Therefore, I'm disabling V3D in the common dtsi
	and enabling in the last place of extend, i.e. the RPi DTS files.

 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi      | 1 +
 arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts   | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts        | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts   | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts   | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts        | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts  | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts   | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts     | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts      | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts      | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts  | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts | 4 ++++
 15 files changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 9261b67dbee1..69e34831de51 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			status = "disabled";
 		};
 
 		vc4: gpu {
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
index 069b48272aa5..495ab1dfd2ce 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a-plus.dts
@@ -128,3 +128,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
index 2726c00431e8..4634d88ce3af 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-a.dts
@@ -121,3 +121,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
index c57b999a4520..45fa0f6851fc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-plus.dts
@@ -130,3 +130,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
index ae6d3a9586ab..c1dac5d704aa 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b-rev2.dts
@@ -121,3 +121,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
index 72764be75a79..72ca31f2a7d6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts
@@ -115,3 +115,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
index 3f9d198ac3ab..881a07d2f28f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-cm1-io1.dts
@@ -95,3 +95,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
index 1f0b163e400c..1c7324067442 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero-w.dts
@@ -134,6 +134,10 @@ &uart1 {
 	status = "okay";
 };
 
+&v3d {
+	status = "okay";
+};
+
 &wifi_pwrseq {
 	reset-gpios = <&gpio 41 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
index 539c19c10946..1568ddc78f22 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts
@@ -117,3 +117,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
index 79918033750e..8fab6293d1c7 100644
--- a/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dts
@@ -129,3 +129,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
index 3548306dfbcb..dc45b56054c7 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
@@ -156,3 +156,7 @@ &uart1 {
 	pinctrl-0 = <&uart1_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
index 2f1800cbc522..ce3a9f7ff529 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dts
@@ -161,3 +161,7 @@ &uart1 {
 &wifi_pwrseq {
 	reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
index 61270340075c..e398546d105b 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-3-b.dts
@@ -149,6 +149,10 @@ &sdhost {
 	bus-width = <4>;
 };
 
+&v3d {
+	status = "okay";
+};
+
 &wifi_pwrseq {
 	reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts b/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
index 72d26d130efa..50471ada79b3 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dts
@@ -94,3 +94,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_gpio14>;
 	status = "okay";
 };
+
+&v3d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts b/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
index 85cf594724ef..876f697e7300 100644
--- a/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts
@@ -132,6 +132,10 @@ &uart1 {
 	status = "okay";
 };
 
+&v3d {
+	status = "okay";
+};
+
 &wifi_pwrseq {
 	reset-gpios = <&gpio 41 GPIO_ACTIVE_LOW>;
 };
-- 
2.44.0

