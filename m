Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600236E18D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 00:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C096EC5D;
	Wed, 28 Apr 2021 22:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1E96ECE6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 22:29:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id C9C991F42CA8
Received: by jupiter.universe (Postfix, from userid 1000)
 id A528F4800BA; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv2 0/5] Support for GE B1x5v2 and B1x5Pv2
Date: Thu, 29 Apr 2021 00:29:48 +0200
Message-Id: <20210428222953.235280-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for another General Electric patient
monitor series (similar to existing Bx50v3), which is based on
i.MX6DL using Congatec's QMX6 module.

The module uses an I2C RTC to provide the i.MX6 32768 Hz clock,
so it's important to keep it enabled. Not doing so results in
incorrect timings of watchdog and i.MX6 RTC. The bootloader
enables the watchdog, so disabling the clock results in system
reboot. [0]

The second patch is required for B155v2, which uses a 1366x768
G156XTN01 panel. The 1366 width is not supported by the display
pipeline and result in boot hanging without the patch. [1]

Patches 3+4 are updating DT bindings for the new board compatible
values.

Patch 5 adds the board files.

Changes since PATCHv1:
 * https://lore.kernel.org/lkml/20210222171247.97609-1-sebastian.reichel@collabora.com/
 * drop patch 5 (applied)
 * instead of using 'protected-clocks' in RTC node, add fixed-clock
   node as suggested by Saravana Kannan
 * rebased to current master (68a32ba14177)

Thanks,

[0] There has been a discussion for the problem on the mailinglists
last year. The discussion died off, when I told people their ideas
don't work. I hope using protected-clocks is fine for this usecase.

https://lore.kernel.org/linux-clk/20191108170135.9053-1-sebastian.reichel@collabora.com/

[1] I've sent this before as a separate patch in September, but
nobody seemed to care. This adds full context for the problem.

https://lore.kernel.org/dri-devel/20200910162831.321556-1-sebastian.reichel@collabora.com/

-- Sebastian

Sebastian Reichel (5):
  rtc: m41t80: add support for fixed clock
  drm/imx: Add 8 pixel alignment fix
  dt-bindings: vendor-prefixes: add congatec
  dt-bindings: arm: fsl: add GE B1x5pv2 boards
  ARM: dts: imx6: Add GE B1x5v2

 .../devicetree/bindings/arm/fsl.yaml          |  11 +
 .../devicetree/bindings/rtc/rtc-m41t80.txt    |   9 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-b105pv2.dts          |  35 +
 arch/arm/boot/dts/imx6dl-b105v2.dts           |  35 +
 arch/arm/boot/dts/imx6dl-b125pv2.dts          |  33 +
 arch/arm/boot/dts/imx6dl-b125v2.dts           |  33 +
 arch/arm/boot/dts/imx6dl-b155v2.dts           |  36 +
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi         | 434 ++++++++++++
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi          |  61 ++
 arch/arm/boot/dts/imx6dl-qmx6.dtsi            | 624 ++++++++++++++++++
 drivers/gpu/drm/imx/imx-drm-core.c            |  19 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |   5 +
 drivers/gpu/drm/imx/ipuv3-crtc.c              |  11 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  19 +-
 drivers/gpu/ipu-v3/ipu-dc.c                   |   5 +
 drivers/gpu/ipu-v3/ipu-di.c                   |   7 +
 drivers/rtc/rtc-m41t80.c                      |  12 +
 19 files changed, 1390 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-b105pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b105v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b155v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-qmx6.dtsi

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
