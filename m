Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E1807AE5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 23:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E2610E7B5;
	Wed,  6 Dec 2023 21:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7128A10E6E0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:49:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOF-0005yK-TP; Wed, 06 Dec 2023 12:48:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqO4-00DwrK-PI; Wed, 06 Dec 2023 12:48:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqO4-00FQwN-BG; Wed, 06 Dec 2023 12:48:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
Date: Wed,  6 Dec 2023 12:43:14 +0100
Message-ID: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=16547;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=k2GFiFaYZ6/MyEEBdxGCTwEk9zbvzq8wMRtSoPydEds=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF5RqQQmEdybCulNK9V3YMxDPKsaTfKYFnGRV
 U1bsm1eb3eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBeUQAKCRCPgPtYfRL+
 TpqJB/9CGLOfxn0OZPu2fq5SO+UIPaCxF8SDxTtqaOfjRcTY4DYq5FPgOugJfy6zLdhF+6xBfv/
 AYgt19X79ggxaVzm+5PqfCpFt392bAHECTynMZRK9oHdeF60v3y5HAzw646qy8WWuMGZkMSNSTt
 o6vcgSfRNPtoLzeZD7QTO3WDaJ/LypKoH9b+V9A2MuPvukehksWDlE/WMUP2xo5ywaMRe1v6A3j
 3dkewbtWUtDZkFFKAQXRLkYFemmGAHjkUvxVCyUx43KQGLqu3VJPvEBkLPqcTS8mFuc7inRwbvO
 wOInsx5dzwEwy/TXYDuhuSngXBzYd9uyKXgpsSWwaxb1XXj8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:59:57 +0000
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Shevchenko <andy@kernel.org>,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, kernel@pengutronix.de,
 linux-hardening@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Pavel Machek <pavel@ucw.cz>,
 linux-doc@vger.kernel.org, James Clark <james.clark@arm.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, greybus-dev@lists.linaro.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-gpio@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 platform-driver-x86@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 Jonathan Corbet <corbet@lwn.net>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Ray Jui <rjui@broadcom.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Mark Gross <markgross@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>,
 Sven Peter <sven@svenpeter.dev>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lu Hongfei <luhongfei@vivo.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series is based on Thierry's for-next.

It starts with some cleanups that were all sent out separately already:

 - "pwm: Reduce number of pointer dereferences in pwm_device_request()"
   https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine-koenig@pengutronix.de
 - "pwm: crc: Use consistent variable naming for driver data"
   https://lore.kernel.org/linux-pwm/20231130074133.969806-1-u.kleine-koenig@pengutronix.de
 - Two leds/qcom-lpg patches
   https://lore.kernel.org/linux-leds/20231126095230.683204-1-u.kleine-koenig@pengutronix.de
   Lee already claimed to have taken the series already, but it's not yet in
   next.
 - "leds: qcom-lpg: Introduce a wrapper for getting driver data from a pwm chip"
   https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.kleine-koenig@pengutronix.de

In the following patches I changed:

 - "pwm: cros-ec: Change prototype of helper to prepare further changes" +
   This was simplified in response to feedback by Tzung-Bi Shih
 - Make pwmchip_priv() static (and don't export it), let drivers use a new
   pwmchip_get_drvdata() instead.
 - For drm/ti-sn65dsi86.c and leds/qcom-lpg make use of
   pwmchip_set_drvdata() which makes the conversion to
   devm_pwmchip_alloc() much prettier.
 - Some cleanups here and there
 - Add review tags received in v3
   I kept all tags even though the pwmchip_alloc() patches changed
   slightly. Most of the time that's only
   s/pwmchip_priv/pwmchip_get_drvdata/ though. Still, if you object,
   just tell me. (This affects Paul Cercueil on patch #68, Conor Dooley
   on patch #76 and Greg for patch #109.)

I kept the pwmchip_alloc() + pwmchip_register() approach despite Bart
not liking it. To balance that out I don't like Bart's alternative
approach. There are no technically relevant differences between the two
approaches and no benchmarks that show either of the two to be better
than the other. Conceptually the design ideas around pwmchip_alloc() +
pwmchip_register() are used in several other subsystems, so it's a
proven way to do things.

In the discussion about v3 Bart pointed out that there is an imbalance
in the function naming, as pwmchip_alloc() must be paired with
pwmchip_put() (and not something like pwmchip_free()). (This is hidden
from the drivers though, as they all use a devm_pwmchip_alloc() which
does the right thing for them.) I could be talked into renaming
pwmchip_alloc() to pwmchip_get_new(). I hesitated to do that though as
other subsystems also use foo_alloc() and I'm ambivalent about which is
the better name.

Thierry objected to patch "pwm: Ensure that pwm_chips are allocated
using pwmchip_alloc()". I still think it's a nice idea to do that. It
only adds very little overhead in a slow path and might save some time
for people working on an out-of-tree driver. So it also helps the folks
who currently work on new drivers for mainline who rebase on a tree
containing this series. I won't insist about that one though, it can
just be dropped.

Otherwise I should have addressed all feedback and hope the series is
now pretty enough to not cause further concerns.

The last patch shows a prototype of the motivation for improving the
lifetime tracking implemented in this series. It contains a character
device userspace API to use PWMs that is considerably faster and easier
to use than the sysfs API; apply() is faster by a factor of 4 on my test
machine (arm/stm32mp1).

Note that currently there is no known issue with lifetimes in the pwm
subsystem as device links ensure that consumers go away if a pwm_chip
gets unbound. There was an issue before, but that wasn't PWM specific
and is fixed in v6.7-rc1~77^2~3 ("driver core: Release all resources
during unbind before updating device links")[1]
In the presence of character devices making use of PWMs, such an
improved lifetime tracking becomes necessary, otherwise unloading
drivers (or unbinding/hotplugging devices) might crash the kernel.

As calls to .apply() are serialized now, the locking in several drivers
could just be dropped in a future cleanup. I didn't do that now to not
enlarge the series still more and maybe the locking in the core can be
changed to be more fine-grained (abusing(?) a reader-writer-lock) which
would allow concurrent callers for different lines of a single pwm_chip.
In that case the locking must not be dropped.

Also the explicit device links could be dropped now as they are not
strictly needed any more (though requested PWMs might just stop working
when the lowlevel driver is unbound which is a bit ugly, but can happen
at any time for other reasons). Also on systems probed from device tree
there are device links between consumers and providers anyhow. (Don't
know about ACPI systems, I think there are device links then.)

Best regards
Uwe

[1] This fix is also backported to the various stable releases
(v6.6.3, v6.5.13, v6.1.64, v5.15.140; about to go into v5.10.x, v5.4.x,
v4.19.x and v4.14.x)

Uwe Kleine-König (115):
  pwm: Reduce number of pointer dereferences in pwm_device_request()
  pwm: crc: Use consistent variable naming for driver data
  leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
  leds: qcom-lpg: Consistenly use dev_err_probe() in .probe()'s error path
  leds: qcom-lpg: Introduce a wrapper for getting driver data from a pwm chip
  pwm: cros-ec: Change prototype of helpers to prepare further changes
  pwm: Provide a macro to get the parent device of a given chip
  pwm: ab8500: Make use of pwmchip_parent() macro
  pwm: atmel: Make use of pwmchip_parent() macro
  pwm: atmel-tcb: Make use of pwmchip_parent() macro
  pwm: bcm-kona: Make use of pwmchip_parent() macro
  pwm: crc: Make use of pwmchip_parent() macro
  pwm: cros-ec: Make use of pwmchip_parent() macro
  pwm: dwc: Make use of pwmchip_parent() macro
  pwm: ep93xx: Make use of pwmchip_parent() macro
  pwm: fsl-ftm: Make use of pwmchip_parent() macro
  pwm: img: Make use of parent device pointer in driver data
  pwm: imx27: Make use of pwmchip_parent() macro
  pwm: jz4740: Make use of pwmchip_parent() macro
  pwm: lpc18xx-sct: Make use of parent device pointer in driver data
  pwm: lpss: Make use of pwmchip_parent() macro
  pwm: mediatek: Make use of pwmchip_parent() macro
  pwm: meson: Make use of pwmchip_parent() macro
  pwm: mtk-disp: Make use of pwmchip_parent() macro
  pwm: omap: Make use of pwmchip_parent() macro
  pwm: pca9685: Store parent device in driver data
  pwm: raspberrypi-poe: Make use of pwmchip_parent() macro
  pwm: rcar: Make use of pwmchip_parent() macro
  pwm: rz-mtu3: Make use of pwmchip_parent() macro
  pwm: samsung: Make use of pwmchip_parent() macro
  pwm: sifive: Make use of pwmchip_parent() macro
  pwm: stm32-lp: Make use of pwmchip_parent() macro
  pwm: stm32: Make use of pwmchip_parent() macro
  pwm: stmpe: Make use of pwmchip_parent() macro
  pwm: sun4i: Make use of pwmchip_parent() macro
  pwm: tiecap: Make use of pwmchip_parent() macro
  pwm: tiehrpwm: Make use of pwmchip_parent() macro
  pwm: twl-led: Make use of pwmchip_parent() macro
  pwm: twl: Make use of pwmchip_parent() macro
  pwm: vt8500: Make use of pwmchip_parent() macro
  staging: greybus: pwm: Make use of pwmchip_parent() macro
  pwm: Provide wrappers for storing and getting driver private data
  pwm: Provide devm_pwmchip_alloc() function
  pwm: ab8500: Make use of devm_pwmchip_alloc() function
  pwm: apple: Make use of devm_pwmchip_alloc() function
  pwm: atmel-hlcdc: Make use of devm_pwmchip_alloc() function
  pwm: atmel: Make use of devm_pwmchip_alloc() function
  pwm: atmel-tcb: Make use of devm_pwmchip_alloc() function
  pwm: bcm2835: Make use of devm_pwmchip_alloc() function
  pwm: bcm-iproc: Make use of devm_pwmchip_alloc() function
  pwm: bcm-kona: Make use of devm_pwmchip_alloc() function
  pwm: berlin: Make use of devm_pwmchip_alloc() function
  pwm: brcmstb: Make use of devm_pwmchip_alloc() function
  pwm: clk: Make use of devm_pwmchip_alloc() function
  pwm: clps711x: Make use of devm_pwmchip_alloc() function
  pwm: crc: Make use of devm_pwmchip_alloc() function
  pwm: cros-ec: Make use of devm_pwmchip_alloc() function
  pwm: dwc: Make use of devm_pwmchip_alloc() function
  pwm: ep93xx: Make use of devm_pwmchip_alloc() function
  pwm: fsl-ftm: Make use of devm_pwmchip_alloc() function
  pwm: hibvt: Make use of devm_pwmchip_alloc() function
  pwm: img: Make use of devm_pwmchip_alloc() function
  pwm: imx1: Make use of devm_pwmchip_alloc() function
  pwm: imx27: Make use of devm_pwmchip_alloc() function
  pwm: imx-tpm: Make use of devm_pwmchip_alloc() function
  pwm: intel-lgm: Make use of devm_pwmchip_alloc() function
  pwm: iqs620a: Make use of devm_pwmchip_alloc() function
  pwm: jz4740: Make use of devm_pwmchip_alloc() function
  pwm: keembay: Make use of devm_pwmchip_alloc() function
  pwm: lp3943: Make use of devm_pwmchip_alloc() function
  pwm: lpc18xx-sct: Make use of devm_pwmchip_alloc() function
  pwm: lpc32xx: Make use of devm_pwmchip_alloc() function
  pwm: lpss-*: Make use of devm_pwmchip_alloc() function
  pwm: mediatek: Make use of devm_pwmchip_alloc() function
  pwm: meson: Make use of devm_pwmchip_alloc() function
  pwm: microchip-core: Make use of devm_pwmchip_alloc() function
  pwm: mtk-disp: Make use of devm_pwmchip_alloc() function
  pwm: mxs: Make use of devm_pwmchip_alloc() function
  pwm: ntxec: Make use of devm_pwmchip_alloc() function
  pwm: omap-dmtimer: Make use of devm_pwmchip_alloc() function
  pwm: pca9685: Make use of devm_pwmchip_alloc() function
  pwm: pxa: Make use of devm_pwmchip_alloc() function
  pwm: raspberrypi-poe: Make use of devm_pwmchip_alloc() function
  pwm: rcar: Make use of devm_pwmchip_alloc() function
  pwm: renesas-tpu: Make use of devm_pwmchip_alloc() function
  pwm: rockchip: Make use of devm_pwmchip_alloc() function
  pwm: rz-mtu3: Make use of devm_pwmchip_alloc() function
  pwm: samsung: Make use of devm_pwmchip_alloc() function
  pwm: sifive: Make use of devm_pwmchip_alloc() function
  pwm: sl28cpld: Make use of devm_pwmchip_alloc() function
  pwm: spear: Make use of devm_pwmchip_alloc() function
  pwm: sprd: Make use of devm_pwmchip_alloc() function
  pwm: sti: Make use of devm_pwmchip_alloc() function
  pwm: stm32-lp: Make use of devm_pwmchip_alloc() function
  pwm: stm32: Make use of devm_pwmchip_alloc() function
  pwm: stmpe: Make use of devm_pwmchip_alloc() function
  pwm: sun4i: Make use of devm_pwmchip_alloc() function
  pwm: sunplus: Make use of devm_pwmchip_alloc() function
  pwm: tegra: Make use of devm_pwmchip_alloc() function
  pwm: tiecap: Make use of devm_pwmchip_alloc() function
  pwm: twl-led: Make use of devm_pwmchip_alloc() function
  pwm: twl: Make use of devm_pwmchip_alloc() function
  pwm: visconti: Make use of devm_pwmchip_alloc() function
  pwm: vt8500: Make use of devm_pwmchip_alloc() function
  pwm: xilinx: Make use of devm_pwmchip_alloc() function
  gpio: mvebu: Make use of devm_pwmchip_alloc() function
  drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
  leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
  staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
  pwm: Ensure that pwm_chips are allocated using pwmchip_alloc()
  pwm: Ensure a struct pwm has the same lifetime as its pwm_chip
  pwm: Ensure the memory backing a PWM chip isn't freed while used
  pwm: Add more locking
  pwm: Make pwmchip_[sg]et_drvdata a wrapper around dev_set_drvdata
  WIP: pwm: Add support for pwmchip devices for faster and easier userspace access

 .../driver-api/driver-model/devres.rst        |   1 +
 Documentation/driver-api/pwm.rst              |  10 +-
 drivers/gpio/gpio-mvebu.c                     |  18 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  27 +-
 drivers/leds/rgb/leds-qcom-lpg.c              |  75 ++-
 drivers/pwm/Kconfig                           |   4 -
 drivers/pwm/Makefile                          |   3 +-
 drivers/pwm/core.c                            | 490 +++++++++++++++---
 drivers/pwm/pwm-ab8500.c                      |  36 +-
 drivers/pwm/pwm-apple.c                       |  18 +-
 drivers/pwm/pwm-atmel-hlcdc.c                 |  35 +-
 drivers/pwm/pwm-atmel-tcb.c                   |  26 +-
 drivers/pwm/pwm-atmel.c                       |  37 +-
 drivers/pwm/pwm-bcm-iproc.c                   |  19 +-
 drivers/pwm/pwm-bcm-kona.c                    |  21 +-
 drivers/pwm/pwm-bcm2835.c                     |  17 +-
 drivers/pwm/pwm-berlin.c                      |  29 +-
 drivers/pwm/pwm-brcmstb.c                     |  17 +-
 drivers/pwm/pwm-clk.c                         |  27 +-
 drivers/pwm/pwm-clps711x.c                    |  21 +-
 drivers/pwm/pwm-crc.c                         |  26 +-
 drivers/pwm/pwm-cros-ec.c                     |  55 +-
 drivers/pwm/pwm-dwc-core.c                    |  25 +-
 drivers/pwm/pwm-dwc.c                         |  18 +-
 drivers/pwm/pwm-dwc.h                         |   9 +-
 drivers/pwm/pwm-ep93xx.c                      |  21 +-
 drivers/pwm/pwm-fsl-ftm.c                     |  48 +-
 drivers/pwm/pwm-hibvt.c                       |  25 +-
 drivers/pwm/pwm-img.c                         |  51 +-
 drivers/pwm/pwm-imx-tpm.c                     |  34 +-
 drivers/pwm/pwm-imx1.c                        |  20 +-
 drivers/pwm/pwm-imx27.c                       |  26 +-
 drivers/pwm/pwm-intel-lgm.c                   |  17 +-
 drivers/pwm/pwm-iqs620a.c                     |  37 +-
 drivers/pwm/pwm-jz4740.c                      |  35 +-
 drivers/pwm/pwm-keembay.c                     |  17 +-
 drivers/pwm/pwm-lp3943.c                      |  17 +-
 drivers/pwm/pwm-lpc18xx-sct.c                 |  35 +-
 drivers/pwm/pwm-lpc32xx.c                     |  21 +-
 drivers/pwm/pwm-lpss-pci.c                    |  10 +-
 drivers/pwm/pwm-lpss-platform.c               |  10 +-
 drivers/pwm/pwm-lpss.c                        |  34 +-
 drivers/pwm/pwm-lpss.h                        |   1 -
 drivers/pwm/pwm-mediatek.c                    |  28 +-
 drivers/pwm/pwm-meson.c                       |  57 +-
 drivers/pwm/pwm-microchip-core.c              |  17 +-
 drivers/pwm/pwm-mtk-disp.c                    |  25 +-
 drivers/pwm/pwm-mxs.c                         |  32 +-
 drivers/pwm/pwm-ntxec.c                       |  30 +-
 drivers/pwm/pwm-omap-dmtimer.c                |  46 +-
 drivers/pwm/pwm-pca9685.c                     |  98 ++--
 drivers/pwm/pwm-pxa.c                         |  21 +-
 drivers/pwm/pwm-raspberrypi-poe.c             |  20 +-
 drivers/pwm/pwm-rcar.c                        |  25 +-
 drivers/pwm/pwm-renesas-tpu.c                 |  18 +-
 drivers/pwm/pwm-rockchip.c                    |  24 +-
 drivers/pwm/pwm-rz-mtu3.c                     |  38 +-
 drivers/pwm/pwm-samsung.c                     |  56 +-
 drivers/pwm/pwm-sifive.c                      |  30 +-
 drivers/pwm/pwm-sl28cpld.c                    |  13 +-
 drivers/pwm/pwm-spear.c                       |  17 +-
 drivers/pwm/pwm-sprd.c                        |  50 +-
 drivers/pwm/pwm-sti.c                         |  34 +-
 drivers/pwm/pwm-stm32-lp.c                    |  29 +-
 drivers/pwm/pwm-stm32.c                       |  53 +-
 drivers/pwm/pwm-stmpe.c                       |  58 ++-
 drivers/pwm/pwm-sun4i.c                       |  38 +-
 drivers/pwm/pwm-sunplus.c                     |  17 +-
 drivers/pwm/pwm-tegra.c                       |  27 +-
 drivers/pwm/pwm-tiecap.c                      |  55 +-
 drivers/pwm/pwm-tiehrpwm.c                    |  72 +--
 drivers/pwm/pwm-twl-led.c                     |  58 ++-
 drivers/pwm/pwm-twl.c                         |  50 +-
 drivers/pwm/pwm-visconti.c                    |  17 +-
 drivers/pwm/pwm-vt8500.c                      |  41 +-
 drivers/pwm/pwm-xilinx.c                      |  34 +-
 drivers/pwm/sysfs.c                           |  64 +--
 drivers/staging/greybus/pwm.c                 | 130 ++---
 include/linux/platform_data/x86/pwm-lpss.h    |   4 +-
 include/linux/pwm.h                           |  43 +-
 include/uapi/linux/pwm.h                      |  23 +
 81 files changed, 1690 insertions(+), 1325 deletions(-)
 create mode 100644 include/uapi/linux/pwm.h

base-commit: 6d0589a70587116c7ff09e027659c6254f883b2d
-- 
2.42.0
