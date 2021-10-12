Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2442A895
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154789E0C;
	Tue, 12 Oct 2021 15:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6989E0C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:40:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsk-0008NN-05; Tue, 12 Oct 2021 17:39:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsa-0004iS-RQ; Tue, 12 Oct 2021 17:39:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maJsa-0004WY-O6; Tue, 12 Oct 2021 17:39:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jean Delvare <jdelvare@suse.com>, Jiri Slaby <jirislaby@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Gross <mgross@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Peter Huewe <peterhuewe@gmx.de>,
 Richard Weinberger <richard@nod.at>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Fabio Estevam <festevam@gmail.com>, Heiko Schocher <hs@denx.de>,
 Len Baker <len.baker@gmx.com>, Mark Brown <broonie@kernel.org>,
 Phil Reid <preid@electromag.com.au>, Sam Ravnborg <sam@ravnborg.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-fbdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 00/20] Make some spi device drivers return zero in .remove()
Date: Tue, 12 Oct 2021 17:39:25 +0200
Message-Id: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this is v2 of my quest to make spi remove callbacks return void. Today
they return an int, but the only result of returning a non-zero value is
a warning message. So it's a bad idea to return an error code in the
expectation that not freeing some resources is ok then. The same holds
true for i2c and platform devices which benefit en passant for a few
drivers.

The patches in this series address some of the spi drivers that might
return non-zero and adapt them accordingly to return zero instead. For
most drivers it's just about not hiding the fact that they already
return zero.

Given that there are quite some more patches of this type to create
before I can change the spi remove callback, I suggest the respective
subsystem maintainers pick up these patches. There are no
interdependencies in this series.

Compared to (implicit) v1

 - I fixed a few compiler issues (this series it build tested with an
   allmoddefconfig on arm64, m68k, powerpc, riscv, s390, sparc64 and
   x86_64).
 - A few new patches (2x gpio, 2x misc, 4x mtd)
 - One patch already landed in next, this one I dropped. The drm/panel
   patch as claimed to applied, too, but not yet in next. It's included
   here, but I assume I was just too impatient and this one should be
   ignored.

Full range-diff below.

Best regards
Uwe

Uwe Kleine-König (20):
  drm/panel: s6e63m0: Make s6e63m0_remove() return void
  gpio: max730x: Make __max730x_remove() return void
  gpio: mc33880: Drop if with an always false condition
  hwmon: max31722: Warn about failure to put device in stand-by in
    .remove()
  input: adxl34xx: Make adxl34x_remove() return void
  input: touchscreen: tsc200x: Make tsc200x_remove() return void
  media: cxd2880: Eliminate dead code
  mfd: mc13xxx: Make mc13xxx_common_exit() return void
  mfd: stmpe: Make stmpe_remove() return void
  mfd: tps65912: Make tps65912_device_exit() return void
  misc: ad525x_dpot: Make ad_dpot_remove() return void
  misc: lis3lv02d: Make lis3lv02d_remove_fs() return void
  mtd: dataflash: Warn about failure to unregister mtd device
  mtd: mchp23k256: Warn about failure to unregister mtd device
  mtd: mchp48l640: Warn about failure to unregister mtd device
  mtd: sst25l: Warn about failure to unregister mtd device
  serial: max310x: Make max310x_remove() return void
  serial: sc16is7xx: Make sc16is7xx_remove() return void
  staging: fbtft: Make fbtft_remove_common() return void
  tpm: st33zp24: Make st33zp24_remove() return void

 drivers/char/tpm/st33zp24/i2c.c                   |  5 +----
 drivers/char/tpm/st33zp24/spi.c                   |  5 +----
 drivers/char/tpm/st33zp24/st33zp24.c              |  3 +--
 drivers/char/tpm/st33zp24/st33zp24.h              |  2 +-
 drivers/gpio/gpio-max7300.c                       |  4 +++-
 drivers/gpio/gpio-max7301.c                       |  4 +++-
 drivers/gpio/gpio-max730x.c                       |  6 +-----
 drivers/gpio/gpio-mc33880.c                       |  2 --
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c |  3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c |  3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c     |  4 +---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h     |  2 +-
 drivers/hwmon/max31722.c                          |  8 +++++++-
 drivers/input/misc/adxl34x-i2c.c                  |  4 +++-
 drivers/input/misc/adxl34x-spi.c                  |  4 +++-
 drivers/input/misc/adxl34x.c                      |  4 +---
 drivers/input/misc/adxl34x.h                      |  2 +-
 drivers/input/touchscreen/tsc2004.c               |  4 +++-
 drivers/input/touchscreen/tsc2005.c               |  4 +++-
 drivers/input/touchscreen/tsc200x-core.c          |  4 +---
 drivers/input/touchscreen/tsc200x-core.h          |  2 +-
 drivers/media/spi/cxd2880-spi.c                   | 13 +------------
 drivers/mfd/mc13xxx-core.c                        |  4 +---
 drivers/mfd/mc13xxx-i2c.c                         |  3 ++-
 drivers/mfd/mc13xxx-spi.c                         |  3 ++-
 drivers/mfd/mc13xxx.h                             |  2 +-
 drivers/mfd/stmpe-i2c.c                           |  4 +++-
 drivers/mfd/stmpe-spi.c                           |  4 +++-
 drivers/mfd/stmpe.c                               |  4 +---
 drivers/mfd/stmpe.h                               |  2 +-
 drivers/mfd/tps65912-core.c                       |  4 +---
 drivers/mfd/tps65912-i2c.c                        |  4 +++-
 drivers/mfd/tps65912-spi.c                        |  4 +++-
 drivers/misc/ad525x_dpot-i2c.c                    |  3 ++-
 drivers/misc/ad525x_dpot-spi.c                    |  3 ++-
 drivers/misc/ad525x_dpot.c                        |  4 +---
 drivers/misc/ad525x_dpot.h                        |  2 +-
 drivers/misc/lis3lv02d/lis3lv02d.c                |  3 +--
 drivers/misc/lis3lv02d/lis3lv02d.h                |  2 +-
 drivers/misc/lis3lv02d/lis3lv02d_spi.c            |  4 +++-
 drivers/mtd/devices/mchp23k256.c                  |  9 ++++++++-
 drivers/mtd/devices/mchp48l640.c                  |  8 +++++++-
 drivers/mtd/devices/mtd_dataflash.c               |  5 ++++-
 drivers/mtd/devices/sst25l.c                      |  8 +++++++-
 drivers/platform/x86/hp_accel.c                   |  3 ++-
 drivers/staging/fbtft/fbtft-core.c                |  8 +-------
 drivers/staging/fbtft/fbtft.h                     |  8 +++++---
 drivers/tty/serial/max310x.c                      |  7 +++----
 drivers/tty/serial/sc16is7xx.c                    | 12 +++++++-----
 include/linux/mfd/tps65912.h                      |  2 +-
 include/linux/spi/max7301.h                       |  2 +-
 51 files changed, 119 insertions(+), 104 deletions(-)

Range-diff against v1:
 1:  73a1a54d9ea0 =  1:  87fd7940fbfd drm/panel: s6e63m0: Make s6e63m0_remove() return void
 2:  3bcc8e8bd1a3 <  -:  ------------ hwmon: adt7x10: Make adt7x10_remove() return void
 -:  ------------ >  2:  305311d63bbb gpio: max730x: Make __max730x_remove() return void
 -:  ------------ >  3:  0cafc31ea5c5 gpio: mc33880: Drop if with an always false condition
 3:  07f067732aa9 !  4:  f39467b50f06 hwmon: max31722: Warn about failure to put device in stand-by in .remove()
    @@ Commit message
         nothing happens apart from emitting a generic error message. Make this
         error message more device specific and return zero instead.
     
    -    Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
         Acked-by: Michael Hennerich <michael.hennerich@analog.com>
    +    Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
     
      ## drivers/hwmon/max31722.c ##
     @@ drivers/hwmon/max31722.c: static int max31722_probe(struct spi_device *spi)
 4:  0b0a5497d105 =  5:  de3a78214008 input: adxl34xx: Make adxl34x_remove() return void
 5:  0d4f14bc2dd6 !  6:  9629ac3f9e13 input: touchscreen: tsc200x: Make tsc200x_remove() return void
    @@ drivers/input/touchscreen/tsc2005.c: static int tsc2005_probe(struct spi_device
     -	return tsc200x_remove(&spi->dev);
     +	tsc200x_remove(&spi->dev);
     +
    -+	return 0
    ++	return 0;
      }
      
      #ifdef CONFIG_OF
 6:  a68bbd23223b =  7:  1aab41df9262 media: cxd2880: Eliminate dead code
 7:  3801b37ac18f !  8:  745d1a5f840e mfd: mc13xxx: Make mc13xxx_common_exit() return void
    @@ drivers/mfd/mc13xxx-spi.c: static int mc13xxx_spi_probe(struct spi_device *spi)
      {
     -	return mc13xxx_common_exit(&spi->dev);
     +	mc13xxx_common_exit(&spi->dev);
    -+	return 0
    ++	return 0;
      }
      
      static struct spi_driver mc13xxx_spi_driver = {
 8:  22159093ce71 =  9:  7ee04277db66 mfd: stmpe: Make stmpe_remove() return void
 9:  f91da216c752 = 10:  4a21c90a57f8 mfd: tps65912: Make tps65912_device_exit() return void
 -:  ------------ > 11:  f92aa824fd1c misc: ad525x_dpot: Make ad_dpot_remove() return void
 -:  ------------ > 12:  5b2fccd09a24 misc: lis3lv02d: Make lis3lv02d_remove_fs() return void
 -:  ------------ > 13:  609ab18323fc mtd: dataflash: Warn about failure to unregister mtd device
 -:  ------------ > 14:  3b220d5fa547 mtd: mchp23k256: Warn about failure to unregister mtd device
 -:  ------------ > 15:  baf6f4b3a8c7 mtd: mchp48l640: Warn about failure to unregister mtd device
 -:  ------------ > 16:  edf3788a30b0 mtd: sst25l: Warn about failure to unregister mtd device
10:  f2def77b74d1 ! 17:  614f7c001377 serial: max310x: Make max310x_remove() return void
    @@ drivers/tty/serial/max310x.c: static int max310x_spi_probe(struct spi_device *sp
      {
     -	return max310x_remove(&spi->dev);
     +	max310x_remove(&spi->dev);
    -+	return 0
    ++	return 0;
      }
      
      static const struct spi_device_id max310x_id_table[] = {
11:  283e4bbeff38 ! 18:  35d1f5b36de5 serial: sc16is7xx: Make sc16is7xx_remove() return void
    @@ drivers/tty/serial/sc16is7xx.c: static int sc16is7xx_probe(struct device *dev,
      {
      	struct sc16is7xx_port *s = dev_get_drvdata(dev);
      	int i;
    +@@ drivers/tty/serial/sc16is7xx.c: static int sc16is7xx_remove(struct device *dev)
    + 	kthread_stop(s->kworker_task);
    + 
    + 	clk_disable_unprepare(s->clk);
    +-
    +-	return 0;
    + }
    + 
    + static const struct of_device_id __maybe_unused sc16is7xx_dt_ids[] = {
     @@ drivers/tty/serial/sc16is7xx.c: static int sc16is7xx_spi_probe(struct spi_device *spi)
      
      static int sc16is7xx_spi_remove(struct spi_device *spi)
12:  5093fbdceee5 ! 19:  d9ec9a96fbb8 staging: fbtft: Make fbtft_remove_common() return void
    @@ drivers/staging/fbtft/fbtft-core.c: EXPORT_SYMBOL(fbtft_probe_common);
      
     
      ## drivers/staging/fbtft/fbtft.h ##
    +@@ drivers/staging/fbtft/fbtft.h: void fbtft_unregister_backlight(struct fbtft_par *par);
    + int fbtft_init_display(struct fbtft_par *par);
    + int fbtft_probe_common(struct fbtft_display *display, struct spi_device *sdev,
    + 		       struct platform_device *pdev);
    +-int fbtft_remove_common(struct device *dev, struct fb_info *info);
    ++void fbtft_remove_common(struct device *dev, struct fb_info *info);
    + 
    + /* fbtft-io.c */
    + int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len);
     @@ drivers/staging/fbtft/fbtft.h: static int fbtft_driver_remove_spi(struct spi_device *spi)                 \
      {                                                                          \
      	struct fb_info *info = spi_get_drvdata(spi);                       \
13:  9156e6380a5e = 20:  89d0b85968a9 tpm: st33zp24: Make st33zp24_remove() return void

base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.30.2

