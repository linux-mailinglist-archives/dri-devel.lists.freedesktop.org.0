Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A820A507318
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5010E0A5;
	Tue, 19 Apr 2022 16:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8C10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:38:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0BF76B81BEA;
 Tue, 19 Apr 2022 16:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DADDC385A5;
 Tue, 19 Apr 2022 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386330;
 bh=FZxabP3Lf+vmXJCuw613CFE9/4wnNO59YtnyVVUeDJI=;
 h=From:To:Cc:Subject:Date:From;
 b=HSVhn/t8iHi95w3pqb1y15mAY6meRjNGbPNpl2GlYxpCrFzPeZOR790DQQe/knRXA
 yS+mNPjKsB65ZXGW8SGxFQ7fNR3AvfeVZXu9W6Q+CZbSF5MkVbwBmOaGKKMBERIdqk
 DI86039X4mAzQ0KpITliKZKLHrJC9PeK1QrLuk+C5I/n+30zJDNjqYYlfQdkhAg11w
 6qGSTcy9j05Xrq2zDR1bwVkMvruNOitS1pjEKQG1QxFx3V9bHp2360qXyqNsajk+VT
 ynjXZzd1Zi2MEvuyInWhUHqvxL5C1UgbJIS34bjSEeKRW0dtFHTwy6XxbXamP/T5bf
 0Z7TnJPfxPFJg==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/48] ARM: PXA multiplatform support
Date: Tue, 19 Apr 2022 18:37:22 +0200
Message-Id: <20220419163810.2118169-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This revisits a series I sent a few years ago:

https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/

All the other ARMv5 conversions are under way now, with
OMAP1 being the only one still not in linux-next yet,
and PXA completing the set.

Most of the patches are unchanged from before, furtunately
the PXA code is fairly stable. I addressed Robert's comments,
pulled in two patches from Dmitry, and added the last a the
final four patches to finish off the multiplatform conversion.

I hope someone is left to test these on PXA: if this works,
I'd like to merge it for 5.19. A git tree with these is avaialable
for testing at

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18

    Arnd

Arnd Bergmann (46):
  ARM: pxa: split mach/generic.h
  ARM: pxa: make mainstone.h private
  ARM: pxa: make mach/regs-uart.h private
  ARM: pxa: remove mach/dma.h
  ARM: pxa: split up mach/hardware.h
  ARM: pxa: stop using mach/bitfield.h
  ARM: pxa: move mach/sound.h to linux/platform_data/
  ARM: pxa: move regs-lcd.h into driver
  watchdog: sa1100: use platform device registration
  ARM: pxa: pxa2xx-ac97-lib: use IRQ resource
  ARM: pxa: move pcmcia board data into mach-pxa
  ARM: pxa: make addr-map.h header local
  ARM: pxa: use pdev resource for palmld mmio
  ARM: pxa: maybe fix gpio lookup tables
  ARM: pxa: tosa: use gpio descriptor for audio
  ARM: pxa: poodle: use platform data for poodle asoc driver
  ARM: pxa: corgi: use gpio descriptors for audio
  ARM: pxa: hx4700: use gpio descriptors for audio
  ARM: pxa: lubbock: pass udc irqs as resource
  ARM: pxa: spitz: use gpio descriptors for audio
  ARM: pxa: eseries: use gpio lookup for audio
  ARM: pxa: z2: use gpio lookup for audio device
  ARM: pxa: magician: use platform driver for audio
  ARM: pxa: mainstone-wm97xx: use gpio lookup table
  ARM: pxa: zylonite: use gpio lookup instead mfp header
  input: touchscreen: mainstone: fix pxa2xx+pxa3xx configuration
  input: touchscreen: mainstone: sync with zylonite driver
  Input: touchscreen: use wrapper for pxa2xx ac97 registers
  ASoC: pxa: use pdev resource for FIFO regs
  ASoC: pxa: ac97: use normal MMIO accessors
  ASoC: pxa: i2s: use normal MMIO accessors
  ARM: pxa: pcmcia: move smemc configuration back to arch
  ARM: pxa: remove get_clk_frequency_khz()
  cpufreq: pxa3: move clk register access to clk driver
  ARM: pxa: move smemc register access from clk to platform
  ARM: pxa: move clk register definitions to driver
  power: tosa: simplify probe function
  ARM: pxa: tosa: use gpio lookup for battery
  ARM: pxa: remove unused mach/bitfield.h
  ARM: mmp: remove tavorevb board support
  ARM: mmp: rename pxa_register_device
  ARM: pxa: move plat-pxa to drivers/soc/
  ARM: PXA: fix multi-cpu build of xsc3
  ARM: pxa: move mach/*.h to mach-pxa/
  ARM: pxa: remove support for MTD_XIP
  ARM: pxa: convert to multiplatform

Dmitry Torokhov (2):
  Input: wm97xx - switch to using threaded IRQ
  Input: wm97xx - get rid of irq_enable method in wm97xx_mach_ops

 arch/arm/Kconfig                              |  22 --
 arch/arm/Makefile                             |   1 -
 arch/arm/common/locomo.c                      |   1 -
 arch/arm/common/sa1111.c                      |   5 +-
 arch/arm/include/asm/hardware/sa1111.h        |   2 -
 arch/arm/mach-mmp/Kconfig                     |  10 +-
 arch/arm/mach-mmp/Makefile                    |   1 -
 arch/arm/mach-mmp/devices.c                   |   2 +-
 arch/arm/mach-mmp/devices.h                   |  10 +-
 arch/arm/mach-mmp/mfp.h                       |   2 +-
 arch/arm/mach-mmp/mmp2.h                      |  48 ++---
 arch/arm/mach-mmp/pxa168.h                    |  60 +++---
 arch/arm/mach-mmp/pxa910.h                    |  38 ++--
 arch/arm/mach-mmp/tavorevb.c                  | 113 -----------
 arch/arm/mach-mmp/ttc_dkb.c                   |   6 +-
 arch/arm/mach-pxa/Kconfig                     |  14 ++
 arch/arm/mach-pxa/Makefile                    |  18 +-
 arch/arm/mach-pxa/Makefile.boot               |   3 -
 .../mach-pxa/{include/mach => }/addr-map.h    |   0
 arch/arm/mach-pxa/am300epd.c                  |   2 +-
 .../arm/mach-pxa/balloon3-pcmcia.c            |   4 +-
 arch/arm/mach-pxa/balloon3.c                  |   4 +-
 .../mach-pxa/{include/mach => }/balloon3.h    |   0
 arch/arm/mach-pxa/cm-x300.c                   |  12 +-
 arch/arm/mach-pxa/colibri-evalboard.c         |   1 -
 .../arm/mach-pxa/colibri-pcmcia.c             |   2 +-
 arch/arm/mach-pxa/colibri-pxa270-income.c     |   1 -
 arch/arm/mach-pxa/colibri-pxa270.c            |   2 +-
 arch/arm/mach-pxa/colibri-pxa300.c            |   3 +-
 arch/arm/mach-pxa/colibri-pxa320.c            |   2 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c            |   3 +-
 arch/arm/mach-pxa/colibri.h                   |   2 +-
 arch/arm/mach-pxa/corgi.c                     |  23 ++-
 arch/arm/mach-pxa/{include/mach => }/corgi.h  |   0
 arch/arm/mach-pxa/corgi_pm.c                  |   5 +-
 arch/arm/mach-pxa/csb726.c                    |   5 +-
 arch/arm/mach-pxa/csb726.h                    |   2 +-
 arch/arm/mach-pxa/devices.c                   |  17 +-
 .../arm/mach-pxa/e740-pcmcia.c                |   4 +-
 .../{include/mach => }/eseries-gpio.h         |   0
 arch/arm/mach-pxa/eseries.c                   |  36 +++-
 arch/arm/mach-pxa/ezx.c                       |   1 -
 arch/arm/mach-pxa/generic.c                   |  62 ++++--
 arch/arm/mach-pxa/generic.h                   |   9 -
 arch/arm/mach-pxa/gumstix.c                   |   1 -
 arch/arm/mach-pxa/gumstix.h                   |   2 +-
 arch/arm/mach-pxa/h5000.c                     |   2 +-
 .../arm/mach-pxa/hx4700-pcmcia.c              |   4 +-
 arch/arm/mach-pxa/hx4700.c                    |  18 +-
 arch/arm/mach-pxa/{include/mach => }/hx4700.h |   0
 arch/arm/mach-pxa/idp.c                       |   2 -
 arch/arm/mach-pxa/idp.h                       |   2 +-
 arch/arm/mach-pxa/include/mach/bitfield.h     | 114 -----------
 arch/arm/mach-pxa/include/mach/dma.h          |  17 --
 arch/arm/mach-pxa/include/mach/generic.h      |   1 -
 arch/arm/mach-pxa/include/mach/mtd-xip.h      |  36 ----
 arch/arm/mach-pxa/include/mach/uncompress.h   |  70 -------
 arch/arm/mach-pxa/irq.c                       |   5 +-
 arch/arm/mach-pxa/{include/mach => }/irqs.h   |   0
 arch/arm/mach-pxa/littleton.c                 |   1 -
 arch/arm/mach-pxa/lpd270.c                    |   6 +-
 arch/arm/mach-pxa/lubbock.c                   |  17 +-
 .../arm/mach-pxa/{include/mach => }/lubbock.h |   4 +-
 arch/arm/mach-pxa/magician.c                  |  56 +++++-
 .../mach-pxa/{include/mach => }/magician.h    |   2 +-
 arch/arm/mach-pxa/mainstone.c                 |  17 +-
 .../mach-pxa/{include/mach => }/mainstone.h   |   4 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                |   3 +-
 arch/arm/mach-pxa/mfp-pxa2xx.h                |   2 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c                |   3 +-
 arch/arm/mach-pxa/mfp-pxa3xx.h                |   2 +-
 arch/arm/mach-pxa/{include/mach => }/mfp.h    |   2 +-
 arch/arm/mach-pxa/mioa701.c                   |   4 +-
 arch/arm/mach-pxa/mxm8x10.c                   |   8 +-
 arch/arm/mach-pxa/palm27x.c                   |   2 +-
 .../arm/mach-pxa/palmld-pcmcia.c              |   5 +-
 arch/arm/mach-pxa/palmld.c                    |  23 ++-
 arch/arm/mach-pxa/{include/mach => }/palmld.h |   0
 arch/arm/mach-pxa/palmt5.c                    |  11 +-
 arch/arm/mach-pxa/palmt5.h                    |   2 +-
 .../arm/mach-pxa/palmtc-pcmcia.c              |   4 +-
 arch/arm/mach-pxa/palmtc.c                    |   4 +-
 arch/arm/mach-pxa/{include/mach => }/palmtc.h |   0
 arch/arm/mach-pxa/palmte2.c                   |   2 +-
 arch/arm/mach-pxa/palmtreo.c                  |   4 +-
 .../arm/mach-pxa/palmtx-pcmcia.c              |   4 +-
 arch/arm/mach-pxa/palmtx.c                    |  13 +-
 arch/arm/mach-pxa/{include/mach => }/palmtx.h |   0
 arch/arm/mach-pxa/palmz72.c                   |   2 +-
 arch/arm/mach-pxa/pcm027.h                    |   2 +-
 arch/arm/mach-pxa/pcm990-baseboard.c          |   2 +-
 arch/arm/mach-pxa/pcm990_baseboard.h          |   2 +-
 arch/arm/mach-pxa/poodle.c                    |  31 ++-
 arch/arm/mach-pxa/{include/mach => }/poodle.h |   2 -
 arch/arm/mach-pxa/pxa-dt.c                    |   2 +-
 arch/arm/mach-pxa/pxa-regs.h                  |  52 +++++
 arch/arm/mach-pxa/pxa25x.c                    |  12 +-
 arch/arm/mach-pxa/pxa25x.h                    |   6 +-
 arch/arm/mach-pxa/pxa27x-udc.h                |   2 +
 arch/arm/mach-pxa/pxa27x.c                    |  12 +-
 arch/arm/mach-pxa/pxa27x.h                    |   6 +-
 .../mach-pxa/{include/mach => }/pxa2xx-regs.h |  47 +----
 arch/arm/mach-pxa/pxa2xx.c                    |  30 ++-
 arch/arm/mach-pxa/pxa300.c                    |   1 +
 arch/arm/mach-pxa/pxa320.c                    |   1 +
 .../mach-pxa/{include/mach => }/pxa3xx-regs.h |  71 +------
 arch/arm/mach-pxa/pxa3xx-ulpi.c               |   2 +-
 arch/arm/mach-pxa/pxa3xx.c                    |  19 +-
 arch/arm/mach-pxa/pxa3xx.h                    |   6 +-
 arch/arm/mach-pxa/pxa930.c                    |   1 +
 .../mach-pxa/{include/mach => }/regs-ost.h    |   4 +-
 arch/arm/mach-pxa/regs-rtc.h                  |   2 +-
 arch/arm/mach-pxa/regs-u2d.h                  |   2 -
 .../mach-pxa/{include/mach => }/regs-uart.h   |   2 +
 arch/arm/mach-pxa/reset.c                     |   9 +-
 arch/arm/mach-pxa/{include/mach => }/reset.h  |   2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                |   2 +-
 arch/arm/mach-pxa/sleep.S                     |   9 +-
 arch/arm/mach-pxa/smemc.c                     |  13 +-
 arch/arm/mach-pxa/{include/mach => }/smemc.h  |   0
 arch/arm/mach-pxa/spitz.c                     |  37 +++-
 arch/arm/mach-pxa/{include/mach => }/spitz.h  |   0
 arch/arm/mach-pxa/spitz_pm.c                  |   3 +-
 arch/arm/mach-pxa/standby.S                   |   3 +-
 arch/arm/mach-pxa/tosa.c                      |  47 ++++-
 arch/arm/mach-pxa/{include/mach => }/tosa.h   |   0
 .../arm/mach-pxa/trizeps4-pcmcia.c            |   6 +-
 arch/arm/mach-pxa/trizeps4.c                  |   6 +-
 .../mach-pxa/{include/mach => }/trizeps4.h    |   1 +
 .../arm/mach-pxa/viper-pcmcia.c               |   6 +-
 .../arm/mach-pxa/viper-pcmcia.h               |   0
 arch/arm/mach-pxa/viper.c                     |   8 +-
 .../arm/mach-pxa/vpac270-pcmcia.c             |   4 +-
 arch/arm/mach-pxa/vpac270.c                   |   4 +-
 .../arm/mach-pxa/{include/mach => }/vpac270.h |   0
 arch/arm/mach-pxa/xcep.c                      |   4 +-
 arch/arm/mach-pxa/z2.c                        |  13 +-
 arch/arm/mach-pxa/{include/mach => }/z2.h     |   0
 arch/arm/mach-pxa/zeus.c                      |   8 +-
 arch/arm/mach-pxa/zylonite.c                  |  34 +++-
 arch/arm/mach-pxa/zylonite.h                  |   2 +
 arch/arm/mach-pxa/zylonite_pxa300.c           |   1 +
 arch/arm/mach-pxa/zylonite_pxa320.c           |   1 +
 arch/arm/mach-sa1100/generic.c                |   6 +-
 arch/arm/mach-sa1100/include/mach/reset.h     |   1 -
 arch/arm/mm/copypage-xsc3.c                   |   2 +
 arch/mips/alchemy/devboards/db1300.c          |   9 -
 drivers/ata/pata_palmld.c                     |   3 +-
 drivers/clk/pxa/clk-pxa.c                     |   8 +-
 drivers/clk/pxa/clk-pxa.h                     |   9 +-
 drivers/clk/pxa/clk-pxa25x.c                  |  46 ++---
 drivers/clk/pxa/clk-pxa27x.c                  |  68 +++----
 drivers/clk/pxa/clk-pxa2xx.h                  |  58 ++++++
 drivers/clk/pxa/clk-pxa3xx.c                  | 139 +++++++++++--
 drivers/cpufreq/pxa2xx-cpufreq.c              |   6 +-
 drivers/cpufreq/pxa3xx-cpufreq.c              |  65 +++---
 drivers/input/mouse/pxa930_trkball.c          |   1 -
 drivers/input/touchscreen/Kconfig             |   2 +
 drivers/input/touchscreen/mainstone-wm97xx.c  | 130 ++++++------
 drivers/input/touchscreen/wm97xx-core.c       |  42 +---
 drivers/input/touchscreen/zylonite-wm97xx.c   |  43 ++--
 drivers/leds/leds-locomo.c                    |   1 -
 drivers/mmc/host/pxamci.c                     |   2 +-
 drivers/mtd/maps/pxa2xx-flash.c               |   2 -
 drivers/pcmcia/Makefile                       |  13 --
 drivers/pcmcia/pxa2xx_base.c                  |  48 ++---
 drivers/pcmcia/pxa2xx_sharpsl.c               |   3 +-
 drivers/pcmcia/sa1111_generic.c               |   1 -
 drivers/pcmcia/sa1111_lubbock.c               |   1 -
 drivers/pcmcia/soc_common.c                   |   2 -
 drivers/pcmcia/soc_common.h                   | 120 +----------
 drivers/power/supply/tosa_battery.c           | 189 ++++++++++--------
 drivers/rtc/rtc-pxa.c                         |   2 -
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 .../arm/plat-pxa => drivers/soc/pxa}/Kconfig  |   5 +-
 .../arm/plat-pxa => drivers/soc/pxa}/Makefile |   4 -
 {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c  |   2 +-
 {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c  |   0
 drivers/usb/gadget/udc/pxa25x_udc.c           |  37 ++--
 drivers/usb/gadget/udc/pxa25x_udc.h           |   7 +-
 drivers/usb/host/ohci-pxa27x.c                |   3 +-
 .../video/fbdev/pxa3xx-regs.h                 |  24 +--
 drivers/video/fbdev/pxafb.c                   |   4 +-
 drivers/watchdog/sa1100_wdt.c                 |  88 +++++---
 include/linux/clk/pxa.h                       |  16 ++
 include/linux/platform_data/asoc-poodle.h     |  16 ++
 .../linux/platform_data/asoc-pxa.h            |   4 +-
 include/linux/platform_data/video-pxafb.h     |  22 +-
 .../hardware.h => include/linux/soc/pxa/cpu.h |  61 +-----
 .../plat => include/linux/soc/pxa}/mfp.h      |   6 +-
 include/linux/soc/pxa/smemc.h                 |  13 ++
 include/linux/wm97xx.h                        |   4 -
 include/pcmcia/soc_common.h                   | 125 ++++++++++++
 include/sound/pxa2xx-lib.h                    |   4 +
 sound/arm/pxa2xx-ac97-lib.c                   | 145 +++++++++-----
 .../arm/pxa2xx-ac97-regs.h                    |  42 ++--
 sound/arm/pxa2xx-ac97.c                       |   3 +-
 sound/soc/pxa/corgi.c                         |  43 ++--
 sound/soc/pxa/e740_wm9705.c                   |  37 ++--
 sound/soc/pxa/e750_wm9705.c                   |  33 ++-
 sound/soc/pxa/e800_wm9712.c                   |  33 ++-
 sound/soc/pxa/em-x270.c                       |   2 +-
 sound/soc/pxa/hx4700.c                        |  34 ++--
 sound/soc/pxa/magician.c                      | 141 ++++---------
 sound/soc/pxa/mioa701_wm9713.c                |   2 +-
 sound/soc/pxa/palm27x.c                       |   2 +-
 sound/soc/pxa/poodle.c                        |  51 ++---
 sound/soc/pxa/pxa2xx-ac97.c                   |  24 ++-
 sound/soc/pxa/pxa2xx-i2s.c                    | 112 ++++++-----
 sound/soc/pxa/spitz.c                         |  58 +++---
 sound/soc/pxa/tosa.c                          |  18 +-
 sound/soc/pxa/z2.c                            |   8 +-
 213 files changed, 1902 insertions(+), 1936 deletions(-)
 delete mode 100644 arch/arm/mach-mmp/tavorevb.c
 delete mode 100644 arch/arm/mach-pxa/Makefile.boot
 rename arch/arm/mach-pxa/{include/mach => }/addr-map.h (100%)
 rename drivers/pcmcia/pxa2xx_balloon3.c => arch/arm/mach-pxa/balloon3-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/balloon3.h (100%)
 rename drivers/pcmcia/pxa2xx_colibri.c => arch/arm/mach-pxa/colibri-pcmcia.c (99%)
 rename arch/arm/mach-pxa/{include/mach => }/corgi.h (100%)
 rename drivers/pcmcia/pxa2xx_e740.c => arch/arm/mach-pxa/e740-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/eseries-gpio.h (100%)
 rename drivers/pcmcia/pxa2xx_hx4700.c => arch/arm/mach-pxa/hx4700-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/hx4700.h (100%)
 delete mode 100644 arch/arm/mach-pxa/include/mach/bitfield.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/dma.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/generic.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/mtd-xip.h
 delete mode 100644 arch/arm/mach-pxa/include/mach/uncompress.h
 rename arch/arm/mach-pxa/{include/mach => }/irqs.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/lubbock.h (95%)
 rename arch/arm/mach-pxa/{include/mach => }/magician.h (99%)
 rename arch/arm/mach-pxa/{include/mach => }/mainstone.h (98%)
 rename arch/arm/mach-pxa/{include/mach => }/mfp.h (91%)
 rename drivers/pcmcia/pxa2xx_palmld.c => arch/arm/mach-pxa/palmld-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmld.h (100%)
 rename drivers/pcmcia/pxa2xx_palmtc.c => arch/arm/mach-pxa/palmtc-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtc.h (100%)
 rename drivers/pcmcia/pxa2xx_palmtx.c => arch/arm/mach-pxa/palmtx-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtx.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/poodle.h (98%)
 create mode 100644 arch/arm/mach-pxa/pxa-regs.h
 rename arch/arm/mach-pxa/{include/mach => }/pxa2xx-regs.h (76%)
 rename arch/arm/mach-pxa/{include/mach => }/pxa3xx-regs.h (61%)
 rename arch/arm/mach-pxa/{include/mach => }/regs-ost.h (94%)
 rename arch/arm/mach-pxa/{include/mach => }/regs-uart.h (99%)
 rename arch/arm/mach-pxa/{include/mach => }/reset.h (92%)
 rename arch/arm/mach-pxa/{include/mach => }/smemc.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/spitz.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/tosa.h (100%)
 rename drivers/pcmcia/pxa2xx_trizeps4.c => arch/arm/mach-pxa/trizeps4-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/trizeps4.h (99%)
 rename drivers/pcmcia/pxa2xx_viper.c => arch/arm/mach-pxa/viper-pcmcia.c (97%)
 rename include/linux/platform_data/pcmcia-pxa2xx_viper.h => arch/arm/mach-pxa/viper-pcmcia.h (100%)
 rename drivers/pcmcia/pxa2xx_vpac270.c => arch/arm/mach-pxa/vpac270-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/vpac270.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/z2.h (100%)
 create mode 100644 drivers/clk/pxa/clk-pxa2xx.h
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Kconfig (83%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Makefile (51%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c (99%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c (100%)
 rename arch/arm/mach-pxa/include/mach/regs-lcd.h => drivers/video/fbdev/pxa3xx-regs.h (90%)
 create mode 100644 include/linux/clk/pxa.h
 create mode 100644 include/linux/platform_data/asoc-poodle.h
 rename arch/arm/mach-pxa/include/mach/audio.h => include/linux/platform_data/asoc-pxa.h (93%)
 rename arch/arm/mach-pxa/include/mach/hardware.h => include/linux/soc/pxa/cpu.h (75%)
 rename {arch/arm/plat-pxa/include/plat => include/linux/soc/pxa}/mfp.h (98%)
 create mode 100644 include/linux/soc/pxa/smemc.h
 create mode 100644 include/pcmcia/soc_common.h
 rename arch/arm/mach-pxa/include/mach/regs-ac97.h => sound/arm/pxa2xx-ac97-regs.h (71%)

-- 
2.29.2

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Tomas Cech <sleep_walker@suse.com>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Helge Deller <deller@gmx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-leds@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: alsa-devel@alsa-project.org
