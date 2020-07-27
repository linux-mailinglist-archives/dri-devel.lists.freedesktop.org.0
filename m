Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29422FDEA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2643A6E0CF;
	Mon, 27 Jul 2020 23:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A09F89CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595868388; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=MtLblppNNVqqD4yIcKXJwzqFKv9axvFG2JT5i06IIaw=;
 b=B/WCCelMAS1f/6HHzqQavBAgjXw8kYhLil0R6m8apbVssD4XbI9ipotp+ivDXDkSfVU36c
 pcYaXEPTxgItpQ47eknnwdNj6IB6IZaFsu4H3jYcneJyhz9a5HsU6Oo1pZnztE+3QvkqsP
 410dAs5dpZJRDoI7pgHCkaRJapBT4CM=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 0/6] DBI/DSI, panel drivers, and tinyDRM compat
Date: Mon, 27 Jul 2020 18:46:07 +0200
Message-Id: <20200727164613.19744-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a follow-up on the previous discussion about the current state of
DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.

For the record, here is a small sum-up of the current situation:

- the current MIPI DBI code (drivers/gpu/drm/drm_mipi_dbi.c) is lagging
  way behind the MIPI DSI code (drivers/gpu/drm/drm_mipi_dsi.c). While
  the DSI code adds a proper bus support, with support for host drivers
  and client devices, there is no such thing with the DBI code. As such,
  it is currently impossible to write a standard DRM panel driver for a
  DBI panel.

- Even if the MIPI DBI code was updated with a proper bus, many panels
  and MIPI controllers support both DSI and DBI, so it would be a pain
  to support them without resolving to duplicating each driver.

- The panel drivers written against the DBI code are all "tinyDRM"
  drivers, which means that they will register a full yet simple DRM
  driver, and cannot be used as regular DRM panels for a different DRM
  driver.

- These "tinyDRM" drivers all use SPI directly, even though the panels
  they're driving can work on other interfaces (e.g. i8080 bus). Which
  means that one driver written for e.g. a ILI9341 would not work if
  the control interface is not SPI.

- The "tinyDRM" common code is entangled with DBI and there is no clear
  separation between the two. It could very well be moved to a single
  "tinyDRM" driver that works with a DRM panel obtained from devicetree,
  because the only requirement is that the panel supports a few given
  DCS commands.

This patchset introduces the following:

* Patch [2/6] slightly tweaks the MIPI DSI code so that it now also
  supports MIPI DBI over various hardware buses. Because if you think
  about it, DSI is just the same as DBI just on a different hardware
  bus. The DSI host drivers, now DSI/DBI host drivers, set compatibility
  bits for the hardware buses they support (DSI, DBI/i8080, DBI/SPI9,
  DBI/SPI+GPIO), which is matched against the hardware bus that panel
  drivers request.

* For the DBI panels connected over SPI, a new DSI/DBI host driver is
  added in patch [3/6]. It allows MIPI DBI panel drivers to be written
  with the DSI/DBI framework, even if they are connected over SPI,
  instead of registering as SPI device drivers. Since most of these
  panels can be connected over various buses, it permits to reuse the
  same driver independently of the bus used.

* Patch [4/6] adds a panel driver for NewVision NV3052C based panels.
  This has been successfully tested on the Anbernic RG350M handheld
  console, along with the dbi-spi bridge and the ingenic-drm driver.

* A TinyDRM driver for DSI/DBI panels, once again independent of the bus
  used; the only dependency (currently) being that the panel must
  understand DCS commands.

* A DRM panel driver to test the stack. This driver controls Ilitek
  ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 2.4"
  TFT LCD panel. This panel was converted from
  drivers/gpu/drm/tiny/ili9341.c.

Patches [1-4] were successfully tested on hardware.
Patches [5-6] were compile-tested and runtime-tested but without
hardware connected, so I'd want a Tested-by on these two.

Another thing to note, is that it does not break Device Tree ABI. The
display node stays the same:

spi {
	...

	display@0 {
		compatible = "adafruit,yx240qv29", "ilitek,ili9341";
		reg = <0>;
		spi-max-frequency = <32000000>;
		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
		rotation = <270>;
		backlight = <&backlight>;
	};
};

The reason it works, is that the "adafruit,yx240qv29" device is probed
on the SPI bus, so it will match with the SPI/DBI host driver. This will
in turn register the very same node with the DSI bus, and the ILI9341
DRM panel driver will probe. The driver will detect that no controller
is linked to the panel, and eventually register the DBI/DSI TinyDRM
driver.

One drawback of this approach, is that the "adafruit,yx240qv29" must be
added to the dbi-spi bridge driver (unless a custom rule is added for a
"dbi-spi" fallback compatible string). I still think that it's a small
price to pay to avoid breaking the Device Tree bindings.

Feedback welcome.

Cheers,
-Paul

Paul Cercueil (6):
  dt-bindings: display: Document NewVision NV3052C DT node
  drm: dsi: Let host and device specify supported bus
  drm/bridge: Add SPI DBI host driver
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/tiny: Add TinyDRM for DSI/DBI panels
  drm/panel: Add Ilitek ILI9341 DBI panel driver

 .../display/panel/newvision,nv3052c.yaml      |  69 +++
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/dbi-spi.c              | 262 +++++++++
 drivers/gpu/drm/drm_mipi_dsi.c                |   9 +
 drivers/gpu/drm/panel/Kconfig                 |  18 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  | 345 ++++++++++++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 523 ++++++++++++++++++
 drivers/gpu/drm/tiny/Kconfig                  |   8 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/tiny-dsi.c               | 266 +++++++++
 include/drm/drm_mipi_dsi.h                    |  31 ++
 13 files changed, 1543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
 create mode 100644 drivers/gpu/drm/bridge/dbi-spi.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
 create mode 100644 drivers/gpu/drm/tiny/tiny-dsi.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
