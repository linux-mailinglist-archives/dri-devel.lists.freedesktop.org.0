Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A351DEB9
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 20:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8D010F12A;
	Fri,  6 May 2022 18:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FDE10F127
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 18:10:41 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nn2PU-0005VY-2Y; Fri, 06 May 2022 20:10:36 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v0.5 0/9] i.MX8MP HDMI support
Date: Fri,  6 May 2022 20:10:25 +0200
Message-Id: <20220506181034.2001548-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

second round of the i.MX8MP HDMI work. Still not split up into proper
parts for merging through the various trees this needs to go into, but
should make it easy for people to test.

I've worked in the feedback I got from the last round, including fixing
the system hang that could happen when the drivers were built as modules.

Series is based on linux-next/master, as there are some prerequisite
patches in both the drm and imx tree already. The last patch from [1]
and the patches from [2] need to be applied. Please note that this series
expects the sync polarity from the LCDIF to be set according to the
comments I made in [2]. Please test and provide feedback.

Regards,
Lucas

[1] https://lore.kernel.org/all/20220406153402.1265474-1-l.stach@pengutronix.de/
[2] https://lore.kernel.org/all/20220322142853.125880-1-marex@denx.de/

Lucas Stach (9):
  dt-bindings: display: imx: add binding for i.MX8MP HDMI TX
  drm/imx: add bridge wrapper driver for i.MX8MP DWC HDMI
  dt-bindings: display: imx: add binding for i.MX8MP HDMI PVI
  drm/imx: add driver for HDMI TX Parallel Video Interface
  dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
  phy: freescale: add Samsung HDMI PHY
  arm64: dts: imx8mp: add HDMI irqsteer
  arm64: dts: imx8mp: add HDMI display pipeline
  arm64: dts: imx8mp-evk: enable HDMI

 .../display/imx/fsl,imx8mp-hdmi-pvi.yaml      |   83 ++
 .../bindings/display/imx/fsl,imx8mp-hdmi.yaml |   73 ++
 .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     |   62 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   19 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   94 ++
 drivers/gpu/drm/imx/Kconfig                   |    1 +
 drivers/gpu/drm/imx/Makefile                  |    2 +
 drivers/gpu/drm/imx/bridge/Kconfig            |   18 +
 drivers/gpu/drm/imx/bridge/Makefile           |    4 +
 drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c     |  201 +++
 drivers/gpu/drm/imx/bridge/imx-hdmi.c         |  141 +++
 drivers/phy/freescale/Kconfig                 |    6 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 1078 +++++++++++++++++
 14 files changed, 1783 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pvi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
 create mode 100644 drivers/gpu/drm/imx/bridge/Kconfig
 create mode 100644 drivers/gpu/drm/imx/bridge/Makefile
 create mode 100644 drivers/gpu/drm/imx/bridge/imx-hdmi-pvi.c
 create mode 100644 drivers/gpu/drm/imx/bridge/imx-hdmi.c
 create mode 100644 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

-- 
2.30.2

