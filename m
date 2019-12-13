Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E542611E1E0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9FA6E32A;
	Fri, 13 Dec 2019 10:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455EE6E32A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:23:51 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id n12so1572602lfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FdZMsBqEbI+tKRcrYN3mlj0caHs87oCPMakau3b/WEI=;
 b=UoQ5LPX8h/Bu4y6S6dBFhZxYgQgR3bNg7GL/mrwN6JKfFcZkbyXIIqjgRvkf2v7Tna
 39TLYiWz3EvlbTA8X3Q/OY6RaozFSS78rbrQ1rMA/AIUqaDhR4yzkgSaX8DsmjTumBXN
 vLADbiSq8V9erL9NUQKqHvZ5ok43MsMa1YWo5BR8g43GyYhMIdXrmt40X3v5HzAlHyhV
 P3ZMmGLSn0gKAn6nIKDQODSzWJ+gHTwncubuiU1cff6afMSDK3G+5XcNZ9E6ZHbJSuFk
 RHR8gnQIKIRqU+YcpX2XI7AmqeAn1SUyNSvEEgCxPOqg1yTOhl81O6IgRzt125itgZdC
 qBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FdZMsBqEbI+tKRcrYN3mlj0caHs87oCPMakau3b/WEI=;
 b=B9Y9YgrdxkVOQm0PgOtA+s01ZfzSMkOtITkX78E6TSMbgWmex+oIwXE17wr2Ru7771
 g7Rh/TQXjK0095uP/ABXC6ostx1Am0VqK7ADLN1g6UAw4nbX9d4nYn/PaedKA7venblU
 +qZSLBHBszzh6h3gjx9WiUwbc370cyDYqtkTY82jCFUtcgkWGZWA/gHswuGq4/ZDwLGF
 cXkxH1zUdfhSlo+BUly4AdYGHvHpO3w4HOBdKRaSnTAN0rwhlL908fwJ+130gPx1DBYa
 DUKQHPG+7ykrXEvecbeyUMZRfo6p/dQ9/F+x0IgvF5S+blMhvhC6WF9P+b7Ro833rFPy
 dczQ==
X-Gm-Message-State: APjAAAVMpTYDMHMqbOWySn2QruNx5bXOMW3E2S+GbDrFxHYHPJtNqm79
 GWI6XSSilSxfZej3z0rwTpZY0w==
X-Google-Smtp-Source: APXvYqxXiDXGDxAXwBAohHdxeUGUBb2HkBPNW8qIDEAy3YNVAA7sv0+DVKeGVszfBS2sX/0gmmKYGw==
X-Received: by 2002:a19:114:: with SMTP id 20mr8414187lfb.25.1576232629513;
 Fri, 13 Dec 2019 02:23:49 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id d20sm4312122lfm.32.2019.12.13.02.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:23:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] backlight: pwm_bl: Switch to full GPIO descriptor
Date: Fri, 13 Dec 2019 11:23:46 +0100
Message-Id: <20191213102346.9577-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Guan Xuetao <gxt@pku.edu.cn>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PWM backlight still supports passing a enable GPIO line as
platform data using the legacy <linux/gpio.h> API.

It turns out that ever board using this mechanism except one
is pass .enable_gpio = -1. So we drop all these cargo-culted -1's
from all instances of this platform data in the kernel.

The remaning board, Palm TC, is converted to pass a machine
descriptior table with the "enable" GPIO instead, and delete the
platform data entry for enable_gpio and the code handling it
and things should work smoothly with the new API.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Guan Xuetao <gxt@pku.edu.cn>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Located a missing removal of .enable_gpio in the Palm TC
  board file, pointed out by Daniel.
- Grepped to ascertain there is not a single instance of
  the string "enable_gpio" in the affected board files.
---
 arch/arm/mach-pxa/cm-x300.c               |  1 -
 arch/arm/mach-pxa/colibri-pxa270-income.c |  1 -
 arch/arm/mach-pxa/ezx.c                   |  1 -
 arch/arm/mach-pxa/hx4700.c                |  1 -
 arch/arm/mach-pxa/lpd270.c                |  1 -
 arch/arm/mach-pxa/magician.c              |  1 -
 arch/arm/mach-pxa/mainstone.c             |  1 -
 arch/arm/mach-pxa/mioa701.c               |  1 -
 arch/arm/mach-pxa/palm27x.c               |  1 -
 arch/arm/mach-pxa/palmtc.c                | 11 ++++++++++-
 arch/arm/mach-pxa/palmte2.c               |  1 -
 arch/arm/mach-pxa/pcm990-baseboard.c      |  1 -
 arch/arm/mach-pxa/tavorevb.c              |  2 --
 arch/arm/mach-pxa/viper.c                 |  1 -
 arch/arm/mach-pxa/z2.c                    |  2 --
 arch/arm/mach-pxa/zylonite.c              |  1 -
 arch/arm/mach-s3c24xx/mach-h1940.c        |  1 -
 arch/arm/mach-s3c24xx/mach-rx1950.c       |  1 -
 arch/arm/mach-s3c64xx/dev-backlight.c     |  3 ---
 arch/arm/mach-s3c64xx/mach-crag6410.c     |  1 -
 arch/arm/mach-s3c64xx/mach-hmt.c          |  1 -
 arch/arm/mach-s3c64xx/mach-smartq.c       |  1 -
 arch/arm/mach-s3c64xx/mach-smdk6410.c     |  2 +-
 arch/unicore32/kernel/puv3-nb0916.c       |  1 -
 drivers/video/backlight/pwm_bl.c          | 19 -------------------
 include/linux/pwm_backlight.h             |  2 --
 26 files changed, 11 insertions(+), 49 deletions(-)

diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index 425855f456f2..2e35354b61f5 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -312,7 +312,6 @@ static struct pwm_lookup cm_x300_pwm_lookup[] = {
 static struct platform_pwm_backlight_data cm_x300_backlight_data = {
 	.max_brightness	= 100,
 	.dft_brightness	= 100,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device cm_x300_backlight_device = {
diff --git a/arch/arm/mach-pxa/colibri-pxa270-income.c b/arch/arm/mach-pxa/colibri-pxa270-income.c
index dbad2f13706c..e5879e8b0682 100644
--- a/arch/arm/mach-pxa/colibri-pxa270-income.c
+++ b/arch/arm/mach-pxa/colibri-pxa270-income.c
@@ -202,7 +202,6 @@ static struct pwm_lookup income_pwm_lookup[] = {
 static struct platform_pwm_backlight_data income_backlight_data = {
 	.max_brightness	= 0x3ff,
 	.dft_brightness	= 0x1ff,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device income_backlight = {
diff --git a/arch/arm/mach-pxa/ezx.c b/arch/arm/mach-pxa/ezx.c
index ec10851b63cf..eb85950e7c0e 100644
--- a/arch/arm/mach-pxa/ezx.c
+++ b/arch/arm/mach-pxa/ezx.c
@@ -55,7 +55,6 @@ static struct pwm_lookup ezx_pwm_lookup[] __maybe_unused = {
 static struct platform_pwm_backlight_data ezx_backlight_data = {
 	.max_brightness	= 1023,
 	.dft_brightness	= 1023,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device ezx_backlight_device = {
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 311268d186ab..60186224df49 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -557,7 +557,6 @@ static struct platform_device hx4700_lcd = {
 static struct platform_pwm_backlight_data backlight_data = {
 	.max_brightness = 200,
 	.dft_brightness = 100,
-	.enable_gpio    = -1,
 };
 
 static struct platform_device backlight = {
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index 20e00e970385..6fc40bc06910 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -277,7 +277,6 @@ static struct pwm_lookup lpd270_pwm_lookup[] = {
 static struct platform_pwm_backlight_data lpd270_backlight_data = {
 	.max_brightness	= 1,
 	.dft_brightness	= 1,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device lpd270_backlight_device = {
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index e1a394ac3eea..9b5b17b8b8b7 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -402,7 +402,6 @@ static void magician_backlight_exit(struct device *dev)
 static struct platform_pwm_backlight_data backlight_data = {
 	.max_brightness	= 272,
 	.dft_brightness	= 100,
-	.enable_gpio	= -1,
 	.init		= magician_backlight_init,
 	.notify		= magician_backlight_notify,
 	.exit		= magician_backlight_exit,
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 1b7882920164..d1010ec26e9f 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -256,7 +256,6 @@ static struct pwm_lookup mainstone_pwm_lookup[] = {
 static struct platform_pwm_backlight_data mainstone_backlight_data = {
 	.max_brightness	= 1023,
 	.dft_brightness	= 1023,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device mainstone_backlight_device = {
diff --git a/arch/arm/mach-pxa/mioa701.c b/arch/arm/mach-pxa/mioa701.c
index c360023a989c..ed02e9c71cd8 100644
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@ -177,7 +177,6 @@ static struct pwm_lookup mioa701_pwm_lookup[] = {
 static struct platform_pwm_backlight_data mioa701_backlight_data = {
 	.max_brightness	= 100,
 	.dft_brightness	= 50,
-	.enable_gpio	= -1,
 };
 
 /*
diff --git a/arch/arm/mach-pxa/palm27x.c b/arch/arm/mach-pxa/palm27x.c
index 3ad0b3915ae1..a577ebc06b7a 100644
--- a/arch/arm/mach-pxa/palm27x.c
+++ b/arch/arm/mach-pxa/palm27x.c
@@ -318,7 +318,6 @@ static void palm27x_backlight_exit(struct device *dev)
 static struct platform_pwm_backlight_data palm27x_backlight_data = {
 	.max_brightness	= 0xfe,
 	.dft_brightness	= 0x7e,
-	.enable_gpio	= -1,
 	.init		= palm27x_backlight_init,
 	.notify		= palm27x_backlight_notify,
 	.exit		= palm27x_backlight_exit,
diff --git a/arch/arm/mach-pxa/palmtc.c b/arch/arm/mach-pxa/palmtc.c
index f52bd155e825..6f21c7be3042 100644
--- a/arch/arm/mach-pxa/palmtc.c
+++ b/arch/arm/mach-pxa/palmtc.c
@@ -175,6 +175,15 @@ static inline void palmtc_keys_init(void) {}
  * Backlight
  ******************************************************************************/
 #if defined(CONFIG_BACKLIGHT_PWM) || defined(CONFIG_BACKLIGHT_PWM_MODULE)
+
+static struct gpiod_lookup_table palmtc_pwm_bl_gpio_table = {
+	.dev_id = "pwm-backlight.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO_NR_PALMTC_BL_POWER,
+			    "enable", GPIO_ACTIVE_HIGH),
+	},
+};
+
 static struct pwm_lookup palmtc_pwm_lookup[] = {
 	PWM_LOOKUP("pxa25x-pwm.1", 0, "pwm-backlight.0", NULL, PALMTC_PERIOD_NS,
 		   PWM_POLARITY_NORMAL),
@@ -183,7 +192,6 @@ static struct pwm_lookup palmtc_pwm_lookup[] = {
 static struct platform_pwm_backlight_data palmtc_backlight_data = {
 	.max_brightness	= PALMTC_MAX_INTENSITY,
 	.dft_brightness	= PALMTC_MAX_INTENSITY,
-	.enable_gpio	= GPIO_NR_PALMTC_BL_POWER,
 };
 
 static struct platform_device palmtc_backlight = {
@@ -196,6 +204,7 @@ static struct platform_device palmtc_backlight = {
 
 static void __init palmtc_pwm_init(void)
 {
+	gpiod_add_lookup_table(&palmtc_pwm_bl_gpio_table);
 	pwm_add_table(palmtc_pwm_lookup, ARRAY_SIZE(palmtc_pwm_lookup));
 	platform_device_register(&palmtc_backlight);
 }
diff --git a/arch/arm/mach-pxa/palmte2.c b/arch/arm/mach-pxa/palmte2.c
index a92b9665f425..1d815d657a45 100644
--- a/arch/arm/mach-pxa/palmte2.c
+++ b/arch/arm/mach-pxa/palmte2.c
@@ -176,7 +176,6 @@ static void palmte2_backlight_exit(struct device *dev)
 static struct platform_pwm_backlight_data palmte2_backlight_data = {
 	.max_brightness	= PALMTE2_MAX_INTENSITY,
 	.dft_brightness	= PALMTE2_MAX_INTENSITY,
-	.enable_gpio	= -1,
 	.init		= palmte2_backlight_init,
 	.notify		= palmte2_backlight_notify,
 	.exit		= palmte2_backlight_exit,
diff --git a/arch/arm/mach-pxa/pcm990-baseboard.c b/arch/arm/mach-pxa/pcm990-baseboard.c
index cb1c56769fbc..bf613f88d70b 100644
--- a/arch/arm/mach-pxa/pcm990-baseboard.c
+++ b/arch/arm/mach-pxa/pcm990-baseboard.c
@@ -154,7 +154,6 @@ static struct pwm_lookup pcm990_pwm_lookup[] = {
 static struct platform_pwm_backlight_data pcm990_backlight_data = {
 	.max_brightness	= 1023,
 	.dft_brightness	= 1023,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device pcm990_backlight_device = {
diff --git a/arch/arm/mach-pxa/tavorevb.c b/arch/arm/mach-pxa/tavorevb.c
index 93466fa3b0fe..a15eb3b9484d 100644
--- a/arch/arm/mach-pxa/tavorevb.c
+++ b/arch/arm/mach-pxa/tavorevb.c
@@ -178,13 +178,11 @@ static struct platform_pwm_backlight_data tavorevb_backlight_data[] = {
 		/* primary backlight */
 		.max_brightness	= 100,
 		.dft_brightness	= 100,
-		.enable_gpio	= -1,
 	},
 	[1] = {
 		/* secondary backlight */
 		.max_brightness	= 100,
 		.dft_brightness	= 100,
-		.enable_gpio	= -1,
 	},
 };
 
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index c06031da6676..3aa34e9a15d3 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -404,7 +404,6 @@ static void viper_backlight_exit(struct device *dev)
 static struct platform_pwm_backlight_data viper_backlight_data = {
 	.max_brightness	= 100,
 	.dft_brightness	= 100,
-	.enable_gpio	= -1,
 	.init		= viper_backlight_init,
 	.notify		= viper_backlight_notify,
 	.exit		= viper_backlight_exit,
diff --git a/arch/arm/mach-pxa/z2.c b/arch/arm/mach-pxa/z2.c
index 900cefc4c5ea..21fd76bb09cd 100644
--- a/arch/arm/mach-pxa/z2.c
+++ b/arch/arm/mach-pxa/z2.c
@@ -210,13 +210,11 @@ static struct platform_pwm_backlight_data z2_backlight_data[] = {
 		/* Keypad Backlight */
 		.max_brightness	= 1023,
 		.dft_brightness	= 0,
-		.enable_gpio	= -1,
 	},
 	[1] = {
 		/* LCD Backlight */
 		.max_brightness	= 1023,
 		.dft_brightness	= 512,
-		.enable_gpio	= -1,
 	},
 };
 
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index bf2ab5bd49ec..79f0025fa17a 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -117,7 +117,6 @@ static struct pwm_lookup zylonite_pwm_lookup[] = {
 static struct platform_pwm_backlight_data zylonite_backlight_data = {
 	.max_brightness	= 100,
 	.dft_brightness	= 100,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device zylonite_backlight_device = {
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 74d6b68e91c7..e1c372e5447b 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -516,7 +516,6 @@ static void h1940_backlight_exit(struct device *dev)
 static struct platform_pwm_backlight_data backlight_data = {
 	.max_brightness = 100,
 	.dft_brightness = 50,
-	.enable_gpio    = -1,
 	.init           = h1940_backlight_init,
 	.notify		= h1940_backlight_notify,
 	.exit           = h1940_backlight_exit,
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 29f9b345a531..93aff84804bd 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -529,7 +529,6 @@ static int rx1950_backlight_notify(struct device *dev, int brightness)
 static struct platform_pwm_backlight_data rx1950_backlight_data = {
 	.max_brightness = 24,
 	.dft_brightness = 4,
-	.enable_gpio = -1,
 	.init = rx1950_backlight_init,
 	.notify = rx1950_backlight_notify,
 	.exit = rx1950_backlight_exit,
diff --git a/arch/arm/mach-s3c64xx/dev-backlight.c b/arch/arm/mach-s3c64xx/dev-backlight.c
index 799cfdf0606b..09e6da305f60 100644
--- a/arch/arm/mach-s3c64xx/dev-backlight.c
+++ b/arch/arm/mach-s3c64xx/dev-backlight.c
@@ -65,7 +65,6 @@ static struct samsung_bl_drvdata samsung_dfl_bl_data __initdata = {
 	.plat_data = {
 		.max_brightness = 255,
 		.dft_brightness = 255,
-		.enable_gpio    = -1,
 		.init           = samsung_bl_init,
 		.exit           = samsung_bl_exit,
 	},
@@ -111,8 +110,6 @@ void __init samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
 		samsung_bl_data->dft_brightness = bl_data->dft_brightness;
 	if (bl_data->lth_brightness)
 		samsung_bl_data->lth_brightness = bl_data->lth_brightness;
-	if (bl_data->enable_gpio >= 0)
-		samsung_bl_data->enable_gpio = bl_data->enable_gpio;
 	if (bl_data->init)
 		samsung_bl_data->init = bl_data->init;
 	if (bl_data->notify)
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 8ec6a4f5eb05..da9654255e3f 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -114,7 +114,6 @@ static struct pwm_lookup crag6410_pwm_lookup[] = {
 static struct platform_pwm_backlight_data crag6410_backlight_data = {
 	.max_brightness	= 1000,
 	.dft_brightness	= 600,
-	.enable_gpio	= -1,
 };
 
 static struct platform_device crag6410_backlight_device = {
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/mach-hmt.c
index bfe9881d12cc..e7080215c624 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -115,7 +115,6 @@ static void hmt_bl_exit(struct device *dev)
 static struct platform_pwm_backlight_data hmt_backlight_data = {
 	.max_brightness	= 100 * 256,
 	.dft_brightness	= 40 * 256,
-	.enable_gpio	= -1,
 	.init		= hmt_bl_init,
 	.notify		= hmt_bl_notify,
 	.exit		= hmt_bl_exit,
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 951208f168e7..4be0a276dd51 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -150,7 +150,6 @@ static int smartq_bl_init(struct device *dev)
 static struct platform_pwm_backlight_data smartq_backlight_data = {
 	.max_brightness	= 1000,
 	.dft_brightness	= 600,
-	.enable_gpio	= -1,
 	.init		= smartq_bl_init,
 };
 
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index 908e5aa831c8..56f406c0c3dd 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -623,7 +623,7 @@ static struct pwm_lookup smdk6410_pwm_lookup[] = {
 };
 
 static struct platform_pwm_backlight_data smdk6410_bl_data = {
-	.enable_gpio = -1,
+	/* Intentionally blank */
 };
 
 static struct dwc2_hsotg_plat smdk6410_hsotg_pdata;
diff --git a/arch/unicore32/kernel/puv3-nb0916.c b/arch/unicore32/kernel/puv3-nb0916.c
index a3bf2ffc54dd..e251f5028396 100644
--- a/arch/unicore32/kernel/puv3-nb0916.c
+++ b/arch/unicore32/kernel/puv3-nb0916.c
@@ -55,7 +55,6 @@ static struct pwm_lookup nb0916_pwm_lookup[] = {
 static struct platform_pwm_backlight_data nb0916_backlight_data = {
 	.max_brightness	= 100,
 	.dft_brightness	= 100,
-	.enable_gpio	= -1,
 };
 
 static struct gpio_keys_button nb0916_gpio_keys[] = {
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index efb4efc2a13d..82b8d7594701 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -7,7 +7,6 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -258,8 +257,6 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			     &data->post_pwm_on_delay);
 	of_property_read_u32(node, "pwm-off-delay-ms", &data->pwm_off_delay);
 
-	data->enable_gpio = -EINVAL;
-
 	/*
 	 * Determine the number of brightness levels, if this property is not
 	 * set a default table of brightness levels will be used.
@@ -502,22 +499,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
-	/*
-	 * Compatibility fallback for drivers still using the integer GPIO
-	 * platform data. Must go away soon.
-	 */
-	if (!pb->enable_gpio && gpio_is_valid(data->enable_gpio)) {
-		ret = devm_gpio_request_one(&pdev->dev, data->enable_gpio,
-					    GPIOF_OUT_INIT_HIGH, "enable");
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request GPIO#%d: %d\n",
-				data->enable_gpio, ret);
-			goto err_alloc;
-		}
-
-		pb->enable_gpio = gpio_to_desc(data->enable_gpio);
-	}
-
 	/*
 	 * If the GPIO is not known to be already configured as output, that
 	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
index 8ea265a022fd..06086cb93b6f 100644
--- a/include/linux/pwm_backlight.h
+++ b/include/linux/pwm_backlight.h
@@ -16,8 +16,6 @@ struct platform_pwm_backlight_data {
 	unsigned int *levels;
 	unsigned int post_pwm_on_delay;
 	unsigned int pwm_off_delay;
-	/* TODO remove once all users are switched to gpiod_* API */
-	int enable_gpio;
 	int (*init)(struct device *dev);
 	int (*notify)(struct device *dev, int brightness);
 	void (*notify_after)(struct device *dev, int brightness);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
