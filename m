Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01670A5B60D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 02:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA910E507;
	Tue, 11 Mar 2025 01:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="dovkdPDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C4E10E501
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=jXYs1u+pjL0qr1vHTKm0DQerWnFqgvy1EC6wUyQXJiA=; b=dovkdPDUdcFfcNgj
 HMFaZotBxaTqsUneRHr978c+UFzi4ix5UUa6CM3TCDbuH81bY1G+jrGZGcGFb0fQcNKeI5AjrC/xF
 nM5dPVofxgGcOJ3mqPJZUpsnff+teQLatal19+d8k2sbNJP8IVkDMjmlYqoACZ0V6ciTk2XADymeC
 yKaUY0/KkpmDUiDFFcktY4e5952URL5LxT7H5vGPpHTc/89Mo7GnCGULaBGsorMIf3gEt22OyOQJZ
 8qMA61y5zV5alFGPG1aPkReIJyGQ4MlfjeK+l4uxq3tSHtFLlk9f8yg5i/KK7xBBX+cNSlT3lwzwv
 CMA9/hZxhUQ1SIlu6A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1trokq-0042n5-1X;
 Tue, 11 Mar 2025 01:50:00 +0000
From: linux@treblig.org
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, sre@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linus.walleij@linaro.org, brgl@bgdev.pl, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 0/9] Remove pcf50633
Date: Tue, 11 Mar 2025 01:49:50 +0000
Message-ID: <20250311014959.743322-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/

Remove it.

I've split this up based on the subcomponents to make the size
of each patch sensible.

v2
  Moved most of the mfd updates out of the subsystem patches.
  Swung the backlight nearer the end, since we can't avoid fixing
  up the core.

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Dr. David Alan Gilbert (9):
  mfd: pcf50633-adc:  Remove
  rtc: pcf50633: Remove
  mfd: pcF50633-gpio: Remove
  Input: pcf50633-input - Remove
  regulator: pcf50633-regulator: Remove
  power: supply: pcf50633: Remove charger
  backlight: pcf50633-backlight: Remove
  mfd: pcf50633: Remove irq code
  mfd: pcf50633: Remove remains

 arch/mips/configs/ip27_defconfig             |   3 -
 drivers/input/misc/Kconfig                   |   7 -
 drivers/input/misc/Makefile                  |   1 -
 drivers/input/misc/pcf50633-input.c          | 113 -----
 drivers/mfd/Kconfig                          |  24 -
 drivers/mfd/Makefile                         |   4 -
 drivers/mfd/pcf50633-adc.c                   | 255 ----------
 drivers/mfd/pcf50633-core.c                  | 304 ------------
 drivers/mfd/pcf50633-gpio.c                  |  92 ----
 drivers/mfd/pcf50633-irq.c                   | 312 -------------
 drivers/power/supply/Kconfig                 |   6 -
 drivers/power/supply/Makefile                |   1 -
 drivers/power/supply/pcf50633-charger.c      | 466 -------------------
 drivers/regulator/Kconfig                    |   7 -
 drivers/regulator/Makefile                   |   1 -
 drivers/regulator/pcf50633-regulator.c       | 124 -----
 drivers/rtc/Kconfig                          |   7 -
 drivers/rtc/Makefile                         |   1 -
 drivers/rtc/rtc-pcf50633.c                   | 284 -----------
 drivers/video/backlight/Kconfig              |   7 -
 drivers/video/backlight/Makefile             |   1 -
 drivers/video/backlight/pcf50633-backlight.c | 154 ------
 include/linux/mfd/pcf50633/adc.h             |  69 ---
 include/linux/mfd/pcf50633/backlight.h       |  42 --
 include/linux/mfd/pcf50633/core.h            | 232 ---------
 include/linux/mfd/pcf50633/gpio.h            |  48 --
 include/linux/mfd/pcf50633/mbc.h             | 130 ------
 include/linux/mfd/pcf50633/pmic.h            |  68 ---
 28 files changed, 2763 deletions(-)
 delete mode 100644 drivers/input/misc/pcf50633-input.c
 delete mode 100644 drivers/mfd/pcf50633-adc.c
 delete mode 100644 drivers/mfd/pcf50633-core.c
 delete mode 100644 drivers/mfd/pcf50633-gpio.c
 delete mode 100644 drivers/mfd/pcf50633-irq.c
 delete mode 100644 drivers/power/supply/pcf50633-charger.c
 delete mode 100644 drivers/regulator/pcf50633-regulator.c
 delete mode 100644 drivers/rtc/rtc-pcf50633.c
 delete mode 100644 drivers/video/backlight/pcf50633-backlight.c
 delete mode 100644 include/linux/mfd/pcf50633/adc.h
 delete mode 100644 include/linux/mfd/pcf50633/backlight.h
 delete mode 100644 include/linux/mfd/pcf50633/core.h
 delete mode 100644 include/linux/mfd/pcf50633/gpio.h
 delete mode 100644 include/linux/mfd/pcf50633/mbc.h
 delete mode 100644 include/linux/mfd/pcf50633/pmic.h

-- 
2.48.1

