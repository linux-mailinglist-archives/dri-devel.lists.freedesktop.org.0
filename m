Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F883165990
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604106ECF8;
	Thu, 20 Feb 2020 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 665286EC92
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 19:45:45 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id CC44580F3;
 Wed, 19 Feb 2020 19:46:27 +0000 (UTC)
Date: Wed, 19 Feb 2020 11:45:40 -0800
From: Tony Lindgren <tony@atomide.com>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200219194540.GD37466@atomide.com>
References: <20200219191412.GA15905@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219191412.GA15905@amd>
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: daniel.thompson@linaro.org, mpartap@gmx.net, jingoohan1@gmail.com,
 merlijn@wizzup.org, martin_rysavy@centrum.cz,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, tomi.valkeinen@ti.com, jjhiblot@ti.com,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, agx@sigxcpu.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Pavel Machek <pavel@ucw.cz> [200219 19:15]:
> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Tested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/video/backlight/Kconfig  |   7 ++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c
> 
> Hi!
> 
> Here's the version of the driver I have. AFAICT
> default-brightness-level handling is ok, so does not need to be
> changed.
> 
> Lee, it would be easiest for me if you could apply it to your tree and
> push, but given enough time I can push it to Linus, too.

Oh you're using quoted-printable for patches.. Got it applied now,
and it still works. Below is also the related dts change that
I tested with.

Feel free to pick the dts change too, naturally that should
not be applied before the driver.

If you guys instead want me to pick these both into my fixes
branch, just let me know and I'll do the explaining why these
are needed as fixes. Basically we no longer have a way to enable
the LCD backlight for droid4 manually starting with v5.6-rc1
unlike earlier.

Regards,

Tony

8< ------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Wed, 19 Feb 2020 11:25:27 -0800
Subject: [PATCH] ARM: dts: droid4: Configure LED backlight for lm3532

With the LED backlight changes merged, we still need the dts configured
to have backlight working for droid4. Based on an earlier patch from
Pavel Machek <pavel@ucw.cz>, let's configure the backlight but update
the value range to be more usable.

We have a range of 256 register values split into 8 steps, so we can
generate the brightness levels backwards with:

$ for i in 0 1 2 3 4 5 6 7; do echo "255 - ${i} * (256 / 8)" | bc; done

To avoid more confusion why the LCD backlight is still not on, let's
also enable LED backlight as a loadable module for omap2plus_defconfig.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 13 +++++++++++--
 arch/arm/configs/omap2plus_defconfig            |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -182,6 +182,14 @@ vibrator {
 		pwm-names = "enable", "direction";
 		direction-duty-cycle-ns = <10000000>;
 	};
+
+	backlight: backlight {
+		compatible = "led-backlight";
+
+		leds = <&backlight_led>;
+		brightness-levels = <31 63 95 127 159 191 223 255>;
+		default-brightness-level = <6>;
+	};
 };
 
 &dss {
@@ -205,6 +213,8 @@ lcd0: display {
 		vddi-supply = <&lcd_regulator>;
 		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
 
+		backlight = <&backlight>;
+
 		width-mm = <50>;
 		height-mm = <89>;
 
@@ -393,12 +403,11 @@ led-controller@38 {
 		ramp-up-us = <1024>;
 		ramp-down-us = <8193>;
 
-		led@0 {
+		backlight_led: led@0 {
 			reg = <0>;
 			led-sources = <2>;
 			ti,led-mode = <0>;
 			label = ":backlight";
-			linux,default-trigger = "backlight";
 		};
 
 		led@1 {
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -375,6 +375,7 @@ CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_PANDORA=m
 CONFIG_BACKLIGHT_GPIO=m
+CONFIG_BACKLIGHT_LED=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
