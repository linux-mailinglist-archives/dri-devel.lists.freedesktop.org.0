Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF11F0F21
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADD76E419;
	Sun,  7 Jun 2020 19:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C4C6E0FC
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1591537133; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=/eJ0RL2v7u35cWPZsMLVChAJs2gicig7X+Rxg7eyDKQ=;
 b=Sz6dHhm1fzdx6+RddQ+LP5zvot7bkrW16rfiBIAAQc4uJgGhmr4UDXnNZPcZ890o/LbV6v
 m6Lb2RfJh7KqOXV2jZPNy/MiA0hKgph0SgtT1S1kPCW3KOGylXpgr0hB6gly3MAsQciCDu
 WQ4pfeJsCqO3p9pm/CZo3FIBbPjvqMI=
From: Paul Cercueil <paul@crapouillou.net>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
Date: Sun,  7 Jun 2020 15:38:28 +0200
Message-Id: <20200607133832.1730288-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a follow-up on the previous discussion about the current state of
DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.

This patchset introduces the following:
* It slightly tweaks the MIPI DSI code so that it supports MIPI DBI over
  various buses. This patch has been tested with a non-upstream DRM
  panel driver for a ILI9331 DBI/8080 panel, written with the DSI
  framework (and doesn't include <drm/drm_mipi_dbi.h>), and non-upstream
  DSI/DBI host driver for the Ingenic SoCs.

* A SPI DBI host driver, using the current MIPI DSI framework. It allows
  MIPI DSI/DBI drivers to be written with the DSI framework, even if
  they are connected over SPI, instead of registering as SPI device
  drivers. Since most of these panels can be connected over various
  buses, it permits to reuse the same driver independently of the bus
  used.

* A TinyDRM driver for DSI/DBI panels, once again independent of the bus
  used; the only dependency (currently) being that the panel must
  understand DCS commands.

* A DRM panel driver to test the stack. This driver controls Ilitek
  ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 2.4"
  TFT LCD panel. This panel was converted from
  drivers/gpu/drm/tiny/ili9341.c.

I would like to emphasize that while it has been compile-tested, I did
not test it with real hardware since I do not have any DBI panel
connected over SPI. I did runtime-test the code, just without any panel
connected.

Another thing to note, is that it does not break Device Tree ABI. The
display node stays the same:

display@0 {
	compatible = "adafruit,yx240qv29", "ilitek,ili9341";
	reg = <0>;
	spi-max-frequency = <32000000>;
	dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
	reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
	rotation = <270>;
	backlight = <&backlight>;
};

The reason it works, is that the "adafruit,yx240qv29" device is probed
on the SPI bus, so it will match with the SPI/DBI host driver. This will
in turn register the very same node with the DSI bus, and the ILI9341
DRM panel driver will probe. The driver will detect that no controller
is linked to the panel, and eventually register the DBI/DSI TinyDRM
driver.

I can't stress it enough that this is a RFC, so it still has very rough
edges.

Cheers,
-Paul

Paul Cercueil (4):
  gpu/drm: dsi: Let host and device specify supported bus
  gpu/drm: Add SPI DBI host driver
  gpu/drm: Add TinyDRM for DSI/DBI panels
  gpu/drm: Add Ilitek ILI9341 DBI panel driver

 drivers/gpu/drm/bridge/Kconfig               |   8 +
 drivers/gpu/drm/bridge/Makefile              |   1 +
 drivers/gpu/drm/bridge/dbi-spi.c             | 159 +++++++++
 drivers/gpu/drm/drm_mipi_dsi.c               |   9 +
 drivers/gpu/drm/panel/Kconfig                |   9 +
 drivers/gpu/drm/panel/Makefile               |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 347 +++++++++++++++++++
 drivers/gpu/drm/tiny/Kconfig                 |   8 +
 drivers/gpu/drm/tiny/Makefile                |   1 +
 drivers/gpu/drm/tiny/tiny-dsi.c              | 262 ++++++++++++++
 include/drm/drm_mipi_dsi.h                   |  31 ++
 11 files changed, 836 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/dbi-spi.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
 create mode 100644 drivers/gpu/drm/tiny/tiny-dsi.c

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
