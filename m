Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5C70E0B2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D410E0E1;
	Tue, 23 May 2023 15:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EF410E0E1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:38:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
 by andre.telenet-ops.be with bizsmtp
 id 0Fen2A00H0Jkz7G01FenNV; Tue, 23 May 2023 17:38:52 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1U5o-002t4X-Th;
 Tue, 23 May 2023 17:38:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1U63-00CkgO-BR;
 Tue, 23 May 2023 17:38:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: backlight: pwm: Make power-supply not required
Date: Tue, 23 May 2023 17:38:37 +0200
Message-Id: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

make dtbs_check:

    arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-supply' is a required property
	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml

As that backlight device node already has an "enable-gpios" property to
control the power supplied to the backlight, it sounds a bit silly to
have to add a "power-supply" property just to silence this warning.  In
addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
on a disabled PWM emiting inactive state"), the Linux driver considers
the power supply optional.

Fix this by synchronizing the bindings with actual driver behavior by
making the "power-supply" optional.

Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive state")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.

Thanks!
---
 .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
index 5ec47a8c6568b60e..53569028899020d6 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -68,7 +68,6 @@ dependencies:
 required:
   - compatible
   - pwms
-  - power-supply
 
 additionalProperties: false
 
-- 
2.34.1

