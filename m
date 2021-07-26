Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68E3D65FD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 19:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649146E997;
	Mon, 26 Jul 2021 17:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jul 2021 11:58:22 UTC
Received: from forward105o.mail.yandex.net (forward105o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A096E82F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 11:58:22 +0000 (UTC)
Received: from iva8-40f91c705526.qloud-c.yandex.net
 (iva8-40f91c705526.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:b9a7:0:640:40f9:1c70])
 by forward105o.mail.yandex.net (Yandex) with ESMTP id 57BEC4200B66;
 Mon, 26 Jul 2021 14:51:31 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net
 (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
 by iva8-40f91c705526.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 lkre8hYrIW-pTH0Ga7j; Mon, 26 Jul 2021 14:51:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1627300291; bh=syS++HTe1Cfn1grqGafzmOlSb2JtfOhz46f0mgWNJy4=;
 h=Date:Subject:To:From:Message-Id:Cc;
 b=E0wy+n4muSO1ZLMeBWliO0BhcyWs6KoSoeJWdqaCR52kWT6mHi7gxowiUFGY6irYT
 be1AwLTE4dNL+xYTAkyBJYWgCXYptO8V83/LNeZFDp4RbyoGeo2C+M9Dr7oKoKzW4P
 dZKZcvyhEJp7DS7GLat0LUjSneb5gTIb+hVwaHc8=
Authentication-Results: iva8-40f91c705526.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id PIKatQa27D-pR2S8g73; Mon, 26 Jul 2021 14:51:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/8] arm: ep93xx: CCF conversion
Date: Mon, 26 Jul 2021 14:50:44 +0300
Message-Id: <20210726115058.23729-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jul 2021 17:47:34 +0000
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
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Krzysztof Kozlowski <krzk@kernel.org>,
 "open list:INPUT KEYBOARD, MOUSE, JOYSTICK,
 TOUCHSCREEN..." <linux-input@vger.kernel.org>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series series of patches converts ep93xx to Common Clock Framework.

It consists of preparation patches to use clk_prepare_enable where it is 
needed, instead of clk_enable used in ep93xx drivers prior to CCF and
a patch converting mach-ep93xx/clock.c to CCF.

Link: https://lore.kernel.org/patchwork/cover/1445563/
Link: https://lore.kernel.org/patchwork/patch/1435884/

Alexander Sverdlin (7):
  iio: ep93xx: Prepare clock before using it
  spi: spi-ep93xx: Prepare clock before using it
  Input: ep93xx_keypad: Prepare clock before using it
  video: ep93xx: Prepare clock before using it
  dmaengine: ep93xx: Prepare clock before using it
  ASoC: cirrus: i2s: Prepare clock before using it
  pwm: ep93xx: Prepare clock before using it

Nikita Shubin (1):
  ep93xx: clock: convert in-place to COMMON_CLK

 arch/arm/Kconfig                       |   2 +-
 arch/arm/mach-ep93xx/clock.c           | 975 ++++++++++++++-----------
 arch/arm/mach-ep93xx/core.c            |   2 +-
 arch/arm/mach-ep93xx/soc.h             |  42 +-
 drivers/dma/ep93xx_dma.c               |   6 +-
 drivers/iio/adc/ep93xx_adc.c           |   6 +-
 drivers/input/keyboard/ep93xx_keypad.c |   4 +-
 drivers/pwm/pwm-ep93xx.c               |  12 +-
 drivers/spi/spi-ep93xx.c               |   4 +-
 drivers/video/fbdev/ep93xx-fb.c        |   4 +-
 sound/soc/cirrus/ep93xx-i2s.c          |  12 +-
 11 files changed, 605 insertions(+), 464 deletions(-)


base-commit: 64376a981a0e2e57c46efa63197c2ebb7dab35df
-- 
2.26.2

