Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ECA455583
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 08:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504BA6E93B;
	Thu, 18 Nov 2021 07:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47B46E489
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:34:02 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0e-0005tZ-F7; Wed, 17 Nov 2021 15:34:00 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mnM0a-001P66-W3; Wed, 17 Nov 2021 15:33:56 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
Date: Wed, 17 Nov 2021 15:33:35 +0100
Message-Id: <20211117143347.314294-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 18 Nov 2021 07:28:27 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds initial graphics support for the Rockchip RK356[68]
SoCs.  Graphics support is based around the VOP2 controller which
replaces the VOP controller found on earlier Rockchip SoCs. The driver
has been tested with HDMI support included in this series and MIPI-DSI
which is not included because it needs some more work. The driver is
taken from the downstream Rockchip kernel and heavily polished, most non
standard features have been removed for now. I tested the driver with
the libdrm modetest utility and also with weston with both pixman and
panfrost driver support. Michael Riesch reported the driver to work on
the RK3566 as well, but device tree support for this SoC is not yet
included in this series.

The HDMI changes are based on patches from Benjamin Gaignard, but
modified a bit as I found out that the HDMI port on the RK3568 only
needs one additional clock, not two. Also I added regulator support
which is needed to get the HDMI up on the rk3568-EVB board.

All review and testing feedback welcome

Sascha

Benjamin Gaignard (2):
  dt-bindings: display: rockchip: Add compatible for rk3568 HDMI
  drm/rockchip: dw_hdmi: add rk3568 support

Sascha Hauer (10):
  drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
  drm/rockchip: dw_hdmi: add regulator support
  of: graph: Allow disabled endpoints
  dt-bindings: of: graph: Allow disabled endpoints
  dt-bindings: display: rockchip: Add binding for VOP2
  arm64: dts: rockchip: rk356x: Add VOP2 nodes
  arm64: dts: rockchip: rk356x: Add HDMI nodes
  arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi
  drm/rockchip: Make VOP driver optional
  drm: rockchip: Add VOP2 driver

 .../display/rockchip/rockchip,dw-hdmi.yaml    |   12 +-
 .../display/rockchip/rockchip-vop2.yaml       |  114 +
 .../bindings/media/video-interfaces.yaml      |    8 +
 arch/arm/configs/multi_v7_defconfig           |    1 +
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   24 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  117 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/gpu/drm/drm_of.c                      |    6 +-
 drivers/gpu/drm/rockchip/Kconfig              |   13 +
 drivers/gpu/drm/rockchip/Makefile             |    4 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  137 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   22 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  774 ++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 3611 +++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  916 +++++
 drivers/of/property.c                         |    3 +
 17 files changed, 5731 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c

-- 
2.30.2

