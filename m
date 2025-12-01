Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3460C9721D
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256A10E3AE;
	Mon,  1 Dec 2025 11:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W3+FpNn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001D810E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6FB56016B;
 Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F8FAC4CEF1;
 Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764590005;
 bh=0nMJ0F2u0g5tfi1U82ygJgaOgW4YChsxsA3FwPtCIoY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=W3+FpNn/9/OtDVt3k2X0c10JxWWchRqIYaKLQvRcKbW3258FW1CmHnTw4w9UHtMkL
 2GeVI4NRKS38vEIrKE2aqXpvGkroTkLRgWNWsiI03E15MS9ONmQdoG40/n1BKpOS4Z
 yyWcfNRutYHbNzqcaVR2TSOzEvqhSn9QPr7kq+BeKHeBQ9n6PM+KAxX8RtJLKCKaow
 UUIXTKCU5vI/phCOHYDUZvTZIqQ1CDxW55qnZKtMcIGxMqs+4t4K2bpJ+B5lFFgryr
 lHc07iENbEK3P6UNJfj043FdsZICHcIh8YQTEkgRKYDwXoBXoxDmvg4qQpVyY3gqNn
 ORbkDwOzrDNTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 5C100D116F5;
 Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v6 0/4] backlight: add new max25014 backlight driver
Date: Mon, 01 Dec 2025 12:53:19 +0100
Message-Id: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+BLWkC/23NzWrDMAzA8VcpPs9D8me8095j7KA4cmto4+GU0
 FHy7nM7WALLzTL6/XUXE9fMk3g73EXlOU+5jG1wLwcRTzQeWeahzUKBsuCUkxe6tRcaaRR4G5C
 RkhVt/atyyrdn6uOzzac8XUv9fpZnfPz+Rryya2RGCRK4i5FD63X8fiyxjNdazufXWC7iUZrVq
 jsMG62atmnwxD0aZNrVetUBcaN10wPoZLgn7e3+bfOnEWB72zTtaOgVAZG2aVfbVSP4jbZNB3J
 E1mtw/X+9LMsPhwCQh50BAAA=
X-Change-ID: 20250626-max25014-4207591e1af5
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590004; l=4564;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=0nMJ0F2u0g5tfi1U82ygJgaOgW4YChsxsA3FwPtCIoY=;
 b=0lbejPBBqafdrfT0aI0CHFJD41yFIchpfq4m6Fz7r5gOfezIZC52it3MGOmbfoa+pkvqoQaz2
 2PiHMMjaRNcD+GY+SlKLgROngLwWnrR4FmZwPrfbe4gXI4jBN1Cqhpx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Maxim MAX25014 is an automotive grade backlight driver IC. Its
datasheet can be found at [1].

With its integrated boost controller, it can power 4 channels (led
strings) and has a number of different modes using pwm and or i2c.
Currently implemented is only i2c control.

link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX25014.pdf [1]

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v6:
- fixup changes in v4 where default brightness handling was changed but
  not noted
- remove leftover comment about initializing brightness
- use BIT definitions for fields in the DIAG register
- apply reverse christmas tree initialization of local variables
- remove !=0 from checks, just check if (ret)
- remove > 0 from checks, just check if (val)
- use dev_err_probe() more
- set enable gpio high in the get() instead of seperately calling set()
- change usleep_range() to fsleep()
- remove null checks when setting gpio value
- get regular regulator, not optional to avoid further NULL checks in
  case none is provided
- introduce max25014_initial_power_state() to check if the bootloader
  has already initialized the backlight and to correctly set props.power
- squash max25014_register_control() into max25014_update_status()
- in max25014_configure() perform extra checking on the DISABLE register
  now that the state from the bootloader is taken into account
- Link to v5: https://lore.kernel.org/r/20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com

Changes in v5:
- moved comment about current functions of the driver to the actual
  comment section of the commit
- fixed the led@0 property, regex patternProperty is not needed as of
  now
- added extra clarification about the ISET field/register
- moved #address-cells and #size-cells to the correct location
- remove leftover default-brightness in backlight nodes
- Link to v4: https://lore.kernel.org/r/20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com

Changes in v4:
- remove setting default brightness, let backlight core take care of it
- use a led node to describe the backlight
- use led-sources to enable specific channels
- also wait 2ms when there is a supply but no enable
- change dev_warn() to dev_err() in error path in max25014_check_errors()
- set backlight_properties.scale to BACKLIGHT_SCALE_LINEAR
- rebase latest next
- add address-cells and size-cells to i2c4 in av101hdt-a10.dtso
- Link to v3: https://lore.kernel.org/r/20250911-max25014-v3-0-d03f4eba375e@gocontroll.com

Changes in v3:
- fixed commit message type intgrated -> integrated
- added maximum and description to maxim,iset-property
- dropped unused labels and pinctrl in bindings example
- put the compatible first in the bindings example and dts
- removed brackets around defines
- removed the leftover pdata struct field
- removed the initial_brightness struct field
- Link to v2: https://lore.kernel.org/r/20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com

Changes in v2:
- Remove leftover unused property from the bindings example
- Complete the bindings example with all properties
- Remove some double info from the maxim,iset property
- Remove platform_data header, fold its data into the max25014 struct
- Don't force defines to be unsigned
- Remove stray struct max25014 declaration
- Remove chipname and device from the max25014 struct
- Inline the max25014_backlight_register() and strings_mask() functions
- Remove CONFIG_OF ifdef
- Link to v1: https://lore.kernel.org/r/20250725-max25014-v1-0-0e8cce92078e@gocontroll.com

---
Maud Spierings (4):
      dt-bindings: backlight: Add max25014 support
      backlight: add max25014atg backlight
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

 .../bindings/leds/backlight/maxim,max25014.yaml    | 107 ++++++
 MAINTAINERS                                        |   6 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  30 ++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |  25 +-
 drivers/video/backlight/Kconfig                    |   7 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/max25014.c                 | 419 +++++++++++++++++++++
 7 files changed, 594 insertions(+), 1 deletion(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20250626-max25014-4207591e1af5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


