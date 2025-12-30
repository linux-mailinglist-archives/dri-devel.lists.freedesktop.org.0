Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977C6CEA4E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE9810E61B;
	Tue, 30 Dec 2025 17:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 682A410E61B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:20:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A44615A1;
 Tue, 30 Dec 2025 09:20:50 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 384443F63F;
 Tue, 30 Dec 2025 09:20:55 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
Date: Tue, 30 Dec 2025 17:20:33 +0000
Message-Id: <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
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

The EDP_HOTPLUG pin is optional, and muxed with other functions (notably
HDMI CEC), so move its selection from the SoC DTSI to the boards which
apparently want it, namely those which enable eDP without "force-hpd".
By the same token we drop it from Pinebook Pro, which already uses
"force-hpd", and according to the schematics does not have the pin wired
at all.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 4dcceb9136b7..19a312baa9f1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
 		clock-names = "dp", "pclk", "grf";
-		pinctrl-names = "default";
-		pinctrl-0 = <&edp_hpd>;
 		power-domains = <&power RK3399_PD_EDP>;
 		resets = <&cru SRST_P_EDP_CTRL>;
 		reset-names = "dp";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
index 9d07353df52c..3f3cb0eb5809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
@@ -241,6 +241,8 @@ &dmc {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 
 	/*
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index eaaca08a7601..dcab04863d28 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -401,8 +401,6 @@ &cpu_l3 {
 
 &edp {
 	force-hpd;
-	pinctrl-names = "default";
-	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index a4ceafe6dd7a..80d6ea0eda84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -141,6 +141,8 @@ sdio_pwrseq: sdio-pwrseq {
 };
 
 &edp {
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_hpd>;
 	status = "okay";
 };
 
-- 
2.34.1

