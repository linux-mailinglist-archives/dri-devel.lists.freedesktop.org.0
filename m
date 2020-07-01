Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DB211CD1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000B6EA76;
	Thu,  2 Jul 2020 07:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287AE6E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599495; bh=mqI4DMxpU5nv3gGp6GplYAwWUJ0ad4+0Fg/Z0K5Wudc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=FHBeQ5nFreZDNM/2l/SYGog3iYLNPDSfkXOtAYK1Yz5XNjf2LVKMIpAto++BlDQqw
 N6kczy9TekXltpwUeR34bXP1B8iCG2G0phR9JtIpxL5pAPtyxK2E4CIGLQ46zY9oRF
 Y2UrLFQKlLmaZnQiOx89ytpZIhLjU4VL6R0VbEQA=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v6 13/13] arm64: dts: sun50i-a64-pinephone: Add touchscreen
 support
Date: Wed,  1 Jul 2020 12:31:26 +0200
Message-Id: <20200701103126.1512615-14-megous@megous.com>
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pinephone has a Goodix GT917S capacitive touchscreen controller on
I2C0 bus. Add support for it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 85a7aa5efd32..2d5694446d17 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -123,6 +123,25 @@ &ehci1 {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt917s", "goodix,gt911";
+		reg = <0x5d>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 4 IRQ_TYPE_LEVEL_HIGH>; /* PH4 */
+		irq-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+		reset-gpios = <&pio 7 11 GPIO_ACTIVE_HIGH>; /* PH11 */
+		AVDD28-supply = <&reg_ldo_io0>;
+		VDDIO-supply = <&reg_ldo_io0>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1440>;
+	};
+};
+
 &i2c1 {
 	status = "okay";
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
