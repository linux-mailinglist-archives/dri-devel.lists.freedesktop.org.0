Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF563D942
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECE210E482;
	Wed, 30 Nov 2022 15:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE1510E482
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:22:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuS-00009r-WF; Wed, 30 Nov 2022 16:22:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuI-001LdM-Fl; Wed, 30 Nov 2022 16:21:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuI-001VqY-Bk; Wed, 30 Nov 2022 16:21:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 00/11] pwm: Allow .get_state to fail
Date: Wed, 30 Nov 2022 16:21:37 +0100
Message-Id: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4201;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OJndCEVt3aO3P0WDGIcSb4svVqFYr4L7BRkc05e7KK8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjh3TeeKE42zO/dADA8GIRueUo9ayiBLrzlu5BRvEE
 w4nESiyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4d03gAKCRDB/BR4rcrsCSMiB/
 9P92eEh5i/ykm3IhBfm7shzbMkb/wG7nDkc+vvv70Z73UbyxFvKLzsJ+xK5VXqTCLlo8DUkfo9BJPh
 gr8T1RvP6HUtOELqCuQE6ruqv9wlN28AYIytMCoO+QvOqLdbM84LW89W1fK1B6ImECmggYrGw60CXE
 f7Rv+b9z4cETy+dLsOSVyQ0zsix7/7HyoqlinRbwr3R1SJewjSjU++PJ6H8LCe6DcYMwdJkpBaC2Ol
 hVLwWlo1eF82Cow8M5bd0+XSEZXpG5oFaf6CebgL+JYlfUHRWLzOpJpq6RAXCmfilUqisk0cROhhop
 q2OYuXh1amqkiMJYz8hRni9/YulIOt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I forgot about this series and was remembered when I talked to Conor
Dooley about how .get_state() should behave in an error case.

Compared to (implicit) v1, sent with Message-Id: 20220916151506.298488-1-u.kleine-koenig@pengutronix.de
I changed:

 - Patch #1 which does the prototype change now just adds "return 0" to
   all implementations and so gets simpler and doesn't change behaviour.
   The adaptions to the different .get_state() implementations are split
   out into individual patches to ease review.
 - One minor inconsistency fixed in "pwm: Handle .get_state() failures"
   that I noticed while looking into this patch.
 - I skipped changing sun4i.c as I don't know how to handle the error
   there. Someone might want to have a look. (That's not ideal, but it's
   not worse than the same issue before this series.)

In v1 Thierry had the concern:

| That raises the question about what to do in these cases. If we return
| an error, that could potentially throw off consumers. So perhaps the
| closest would be to return a disabled PWM? Or perhaps it'd be up to the
| consumer to provide some fallback configuration for invalidly configured
| or unconfigured PWMs.

.get_state() is only called in pwm_device_request on a pwm_state that a
consumer might see. Before my series a consumer might have seen a
partial modified pwm_state (because .get_state() might have modified
.period, then stumbled and returned silently). The last patch ensures
that this partial modification isn't given out to the consumer. Instead
they now see the same as if .get_state wasn't implemented at all.

Best regards
Uwe

Uwe Kleine-König (11):
  pwm: Make .get_state() callback return an error code
  pwm/tracing: Also record trace events for failed API calls
  drm/bridge: ti-sn65dsi86: Propagate errors in .get_state() to the
    caller
  leds: qcom-lpg: Propagate errors in .get_state() to the caller
  pwm: crc: Propagate errors in .get_state() to the caller
  pwm: cros-ec: Propagate errors in .get_state() to the caller
  pwm: imx27: Propagate errors in .get_state() to the caller
  pwm: mtk-disp: Propagate errors in .get_state() to the caller
  pwm: rockchip: Propagate errors in .get_state() to the caller
  pwm: sprd: Propagate errors in .get_state() to the caller
  pwm: Handle .get_state() failures

 drivers/gpio/gpio-mvebu.c             |  9 ++++++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
 drivers/pwm/core.c                    | 28 +++++++++++++++++----------
 drivers/pwm/pwm-atmel.c               |  6 ++++--
 drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
 drivers/pwm/pwm-crc.c                 | 10 ++++++----
 drivers/pwm/pwm-cros-ec.c             |  8 +++++---
 drivers/pwm/pwm-dwc.c                 |  6 ++++--
 drivers/pwm/pwm-hibvt.c               |  6 ++++--
 drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
 drivers/pwm/pwm-imx27.c               |  8 +++++---
 drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
 drivers/pwm/pwm-iqs620a.c             |  6 ++++--
 drivers/pwm/pwm-keembay.c             |  6 ++++--
 drivers/pwm/pwm-lpss.c                |  6 ++++--
 drivers/pwm/pwm-meson.c               |  8 +++++---
 drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
 drivers/pwm/pwm-pca9685.c             |  8 +++++---
 drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
 drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
 drivers/pwm/pwm-sifive.c              |  6 ++++--
 drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
 drivers/pwm/pwm-sprd.c                |  8 +++++---
 drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
 drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
 drivers/pwm/pwm-sunplus.c             |  6 ++++--
 drivers/pwm/pwm-visconti.c            |  6 ++++--
 drivers/pwm/pwm-xilinx.c              |  8 +++++---
 include/linux/pwm.h                   |  4 ++--
 include/trace/events/pwm.h            | 20 +++++++++----------
 31 files changed, 174 insertions(+), 109 deletions(-)


base-commit: 50315945d178eebec4e8e2c50c265767ddb926eb
-- 
2.38.1

