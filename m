Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE3506D9E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD91C10EEB5;
	Tue, 19 Apr 2022 13:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700CD10EEB5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:37:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42B9BB81974;
 Tue, 19 Apr 2022 13:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFE9C385A7;
 Tue, 19 Apr 2022 13:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375459;
 bh=8bW4Iiv+C0bRm2uxN+Ia7IY7tO4k+NC8BqozWsn2sFc=;
 h=From:To:Cc:Subject:Date:From;
 b=CidbhGJ1xKgASKGTmSslNTEI8J4ayXlBA8hkYmgMUSfxaZ12i9Ewu8aQkN+yHJ0DI
 4dw7qqWO9j1+2Hu4yInmI43rE2Bb9uRiPYXR5gyb0VouN0pllnbsaABlKiwHFQfJzQ
 H0TgAvXRr42i27Ifje8SZg6Q0O1pJOgLNQ4bHgv4TVnfehJ0uOeWH2yMp8aRMzPg89
 plLu+JIfLHyeg3Z9I0Z3styJCRVdQ43KXB5sDL4pCWafkUx+D7nHB6rVRAoyxuN2lG
 OoSZZE6mcRicxtCBmBrVtpPHSWCpN88GwNtOw7iQTwfS7vvMDx5x8hoeGcFcn6uMcL
 lzEz0oyBfpTfg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 00/41] OMAP1 full multiplatform conversion
Date: Tue, 19 Apr 2022 15:36:42 +0200
Message-Id: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This is the full series for converting OMAP1 to multiplatform, rebased
from my 2019 attempt to do the same thing. The soc tree contains simpler
patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
means we are getting closer to completing this for all ARMv5 platforms
(I have patches for PXA, which is the last one remaining).

Janusz already tested the branch separately and did the missing work
for the common-clk conversion after my previous approach was broken.

The fbdev, mmc and ASoC portion of Janusz' work already went into the
corresponding maintainer tree, but I include them here for reference.
Unless there are any objections, I would add the entire series to the
for-next branch of the soc tree, but only send the first 36 patches early
in the merge window. After everything else has made it in, I would rebase
the last two patches and send them separately, which may or may not make
it in the merge window.

     Arnd

Arnd Bergmann (30):
  video: fbdev: omapfb: lcd_ams_delta: fix unused variable warning
  ARM: omap1: innovator: pass lcd control address as pdata
  ARM: omap1: move lcd_dma code into omapfb driver
  ARM: omap1: declare a dummy omap_set_dma_priority
  fbdev: omap: pass irqs as resource
  ARM: omap1: ams-delta: remove camera leftovers
  ARM: omap1: move mach/usb.h to include/linux/soc
  ARM: omap1: move some headers to include/linux/soc
  ARM: omap1: move perseus spi pinconf to board file
  ARM: omap1: move CF chipselect setup to board file
  fbdev: omap: avoid using mach/*.h files
  usb: omap: avoid mach/*.h headers
  clocksource: ti-dmtimer: avoid using mach/hardware.h
  serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
  input: omap: void using mach/*.h headers
  ARM: omap1: innovator: move ohci phy power handling to board file
  ARM: omap1: move 32k counter from plat-omap to mach-omap1
  ARM: omap: remove debug-leds driver
  ARM: omap: dma: make usb support optional
  dma: omap: hide legacy interface
  ARM: omap1: dma: remove omap2 specific bits
  ARM: omap1: move plat/dma.c to mach/omap-dma.c
  ARM: omap: split up arch/arm/plat-omap/Kconfig
  ARM: omap: un-merge plat/sram.c
  ARM: omap: remove empty plat-omap directory
  ARM: omap1: relocate static I/O mapping
  ARM: omap1: use pci_remap_iospace() for omap_cf
  ARM: omap1: move mach/*.h into mach directory
  ARM: omap1: fix build with no SoC selected
  [TO BE REBASED] ARM: omap1: enable multiplatform

Janusz Krzysztofik (11):
  ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
  ARM: OMAP1: clock: Fix early UART rate issues
  ARM: OMAP1: clock: Fix UART rate reporting algorithm
  ARM: OMAP1: clock: Remove unused code
  ARM: OMAP1: clock: Remove noop code
  usb: host: ohci-omap: Make it CCF clk API compatible
  usb: gadget: omap_udc: Make it CCF clk API compatible
  [MERGED] video: fbdev: omap: Make it CCF clk API compatible
  [MERGED] mmc: omap: Make it CCF clk API compatible
  [MERGED] ASoC: ti: osk5912: Make it CCF clk API compatible
  [TO BE REBASED] ARM: OMAP1: clock: Convert to CCF

 arch/arm/Kconfig                              |  16 -
 arch/arm/Kconfig.debug                        |   6 +-
 arch/arm/Makefile                             |   1 -
 arch/arm/configs/omap1_defconfig              |   3 +
 arch/arm/mach-omap1/Kconfig                   |  72 ++
 arch/arm/mach-omap1/Makefile                  |   6 +-
 arch/arm/mach-omap1/ams-delta-fiq-handler.S   |   3 +-
 arch/arm/mach-omap1/ams-delta-fiq.c           |   2 +
 arch/arm/mach-omap1/ams-delta-fiq.h           |   2 +-
 arch/arm/mach-omap1/board-ams-delta.c         |  18 +-
 arch/arm/mach-omap1/board-fsample.c           |  10 +-
 arch/arm/mach-omap1/board-generic.c           |   8 +-
 arch/arm/mach-omap1/board-h2.c                |  14 +-
 arch/arm/mach-omap1/board-h3.c                |  16 +-
 arch/arm/mach-omap1/board-htcherald.c         |  10 +-
 arch/arm/mach-omap1/board-innovator.c         |  34 +-
 arch/arm/mach-omap1/board-nokia770.c          |   8 +-
 arch/arm/mach-omap1/board-osk.c               |  49 +-
 arch/arm/mach-omap1/board-palmte.c            |  14 +-
 arch/arm/mach-omap1/board-palmtt.c            |  14 +-
 arch/arm/mach-omap1/board-palmz71.c           |  14 +-
 arch/arm/mach-omap1/board-perseus2.c          |  15 +-
 arch/arm/mach-omap1/board-sx1-mmc.c           |   3 +-
 arch/arm/mach-omap1/board-sx1.c               |  12 +-
 arch/arm/mach-omap1/clock.c                   | 797 +++++++-----------
 arch/arm/mach-omap1/clock.h                   | 191 ++---
 arch/arm/mach-omap1/clock_data.c              | 508 +++++------
 arch/arm/mach-omap1/common.h                  |   3 +-
 arch/arm/mach-omap1/devices.c                 |  12 +-
 arch/arm/mach-omap1/dma.c                     |   2 +-
 arch/arm/mach-omap1/fb.c                      |  19 +-
 arch/arm/mach-omap1/flash.c                   |   5 +-
 arch/arm/mach-omap1/fpga.c                    |   3 +-
 arch/arm/mach-omap1/gpio15xx.c                |   3 +-
 arch/arm/mach-omap1/gpio16xx.c                |   5 +-
 arch/arm/mach-omap1/gpio7xx.c                 |   3 +-
 .../mach-omap1/{include/mach => }/hardware.h  | 136 +--
 arch/arm/mach-omap1/i2c.c                     |   3 +-
 arch/arm/mach-omap1/id.c                      |   5 +-
 arch/arm/mach-omap1/include/mach/io.h         |  45 -
 arch/arm/mach-omap1/include/mach/lcdc.h       |  44 -
 arch/arm/mach-omap1/include/mach/memory.h     |  12 -
 arch/arm/mach-omap1/include/mach/uncompress.h | 117 ---
 arch/arm/mach-omap1/io.c                      |  12 +-
 arch/arm/mach-omap1/irq.c                     |   4 +-
 arch/arm/mach-omap1/{include/mach => }/irqs.h |   2 -
 arch/arm/mach-omap1/mcbsp.c                   |  17 +-
 .../mach-omap1/{include/mach => }/mtd-xip.h   |   3 +-
 arch/arm/mach-omap1/mux.c                     |   6 +-
 arch/arm/mach-omap1/mux.h                     | 144 ++++
 arch/arm/mach-omap1/ocpi.c                    |   8 +-
 .../dma.c => mach-omap1/omap-dma.c}           | 259 ++----
 .../mach-omap1/{include/mach => }/omap1510.h  |   0
 .../mach-omap1/{include/mach => }/omap16xx.h  |   0
 .../mach-omap1/{include/mach => }/omap7xx.h   |   0
 arch/arm/mach-omap1/pm.c                      |   9 +-
 arch/arm/mach-omap1/pm.h                      |   2 +
 arch/arm/mach-omap1/reset.c                   |   3 +-
 arch/arm/mach-omap1/serial.c                  |  10 +-
 .../mach-omap1/{include/mach => }/serial.h    |   0
 arch/arm/mach-omap1/sleep.S                   |   2 +-
 arch/arm/mach-omap1/soc.h                     |   6 +-
 arch/arm/mach-omap1/sram-init.c               |  91 +-
 arch/arm/mach-omap1/sram.S                    |   4 +-
 arch/arm/mach-omap1/sram.h                    |   4 +-
 arch/arm/mach-omap1/{include/mach => }/tc.h   |   2 -
 arch/arm/mach-omap1/time.c                    |   7 +-
 arch/arm/mach-omap1/timer.c                   |   1 +
 arch/arm/mach-omap1/timer32k.c                | 100 ++-
 arch/arm/mach-omap1/usb.c                     |   8 +-
 arch/arm/mach-omap1/usb.h                     |  25 +
 arch/arm/mach-omap2/Kconfig                   |  49 ++
 arch/arm/mach-omap2/sram.c                    |  91 +-
 arch/arm/mach-omap2/sram.h                    |   5 +-
 arch/arm/plat-omap/Kconfig                    | 119 ---
 arch/arm/plat-omap/Makefile                   |  13 -
 arch/arm/plat-omap/counter_32k.c              | 114 ---
 arch/arm/plat-omap/debug-leds.c               | 171 ----
 arch/arm/plat-omap/include/plat/counter-32k.h |   1 -
 arch/arm/plat-omap/include/plat/cpu.h         |  21 -
 arch/arm/plat-omap/include/plat/sram.h        |   8 -
 arch/arm/plat-omap/sram.c                     | 129 ---
 drivers/clocksource/timer-ti-dm.c             |   2 +-
 drivers/dma/ti/omap-dma.c                     |  19 +-
 drivers/input/keyboard/omap-keypad.c          |   1 +
 drivers/mmc/host/omap.c                       |  23 +-
 drivers/pcmcia/Kconfig                        |   3 +-
 drivers/pcmcia/omap_cf.c                      |  48 +-
 drivers/spi/Kconfig                           |   2 +-
 drivers/spi/spi-omap-uwire.c                  |  15 +-
 drivers/tty/serial/8250/8250.h                |   1 +
 drivers/usb/gadget/udc/omap_udc.c             |  19 +-
 drivers/usb/host/Kconfig                      |   2 +-
 drivers/usb/host/ohci-omap.c                  |  60 +-
 drivers/usb/phy/Kconfig                       |   3 +-
 drivers/usb/phy/phy-isp1301-omap.c            |   6 +-
 drivers/video/backlight/Kconfig               |   4 +-
 drivers/video/backlight/omap1_bl.c            |   4 +-
 drivers/video/fbdev/Makefile                  |   2 +-
 drivers/video/fbdev/omap/Kconfig              |   4 +-
 drivers/video/fbdev/omap/Makefile             |   5 +
 drivers/video/fbdev/omap/hwa742.c             |   6 +-
 drivers/video/fbdev/omap/lcd_ams_delta.c      |   5 +-
 .../video/fbdev/omap}/lcd_dma.c               |   7 +-
 .../video/fbdev/omap}/lcd_dma.h               |   2 -
 drivers/video/fbdev/omap/lcd_inn1510.c        |   9 +-
 drivers/video/fbdev/omap/lcd_osk.c            |   4 +-
 drivers/video/fbdev/omap/lcdc.c               |  16 +-
 drivers/video/fbdev/omap/lcdc.h               |  35 +
 drivers/video/fbdev/omap/omapfb.h             |   2 +
 drivers/video/fbdev/omap/omapfb_main.c        |  19 +-
 drivers/video/fbdev/omap/sossi.c              |   9 +-
 include/linux/omap-dma.h                      |  28 +-
 include/linux/platform_data/usb-omap1.h       |   2 +
 include/linux/soc/ti/omap1-io.h               | 143 ++++
 .../mux.h => include/linux/soc/ti/omap1-mux.h | 142 +---
 .../soc.h => include/linux/soc/ti/omap1-soc.h |  22 -
 .../usb.h => include/linux/soc/ti/omap1-usb.h |  28 +-
 sound/soc/ti/osk5912.c                        |   4 +-
 119 files changed, 1809 insertions(+), 2610 deletions(-)
 rename arch/arm/mach-omap1/{include/mach => }/hardware.h (59%)
 delete mode 100644 arch/arm/mach-omap1/include/mach/io.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/lcdc.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/memory.h
 delete mode 100644 arch/arm/mach-omap1/include/mach/uncompress.h
 rename arch/arm/mach-omap1/{include/mach => }/irqs.h (99%)
 rename arch/arm/mach-omap1/{include/mach => }/mtd-xip.h (97%)
 create mode 100644 arch/arm/mach-omap1/mux.h
 rename arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} (84%)
 rename arch/arm/mach-omap1/{include/mach => }/omap1510.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap16xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/omap7xx.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/serial.h (100%)
 rename arch/arm/mach-omap1/{include/mach => }/tc.h (98%)
 create mode 100644 arch/arm/mach-omap1/usb.h
 delete mode 100644 arch/arm/plat-omap/Kconfig
 delete mode 100644 arch/arm/plat-omap/Makefile
 delete mode 100644 arch/arm/plat-omap/counter_32k.c
 delete mode 100644 arch/arm/plat-omap/debug-leds.c
 delete mode 100644 arch/arm/plat-omap/include/plat/counter-32k.h
 delete mode 100644 arch/arm/plat-omap/include/plat/cpu.h
 delete mode 100644 arch/arm/plat-omap/include/plat/sram.h
 delete mode 100644 arch/arm/plat-omap/sram.c
 rename {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c (98%)
 rename {arch/arm/mach-omap1/include/mach => drivers/video/fbdev/omap}/lcd_dma.h (98%)
 create mode 100644 include/linux/soc/ti/omap1-io.h
 rename arch/arm/mach-omap1/include/mach/mux.h => include/linux/soc/ti/omap1-mux.h (53%)
 rename arch/arm/mach-omap1/include/mach/soc.h => include/linux/soc/ti/omap1-soc.h (90%)
 rename arch/arm/mach-omap1/include/mach/usb.h => include/linux/soc/ti/omap1-usb.h (86%)

-- 
2.29.2

Cc: Russell King <linux@armlinux.org.uk>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: Kevin Hilman <khilman@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Mark Brown <broonie@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: alsa-devel@alsa-project.org
