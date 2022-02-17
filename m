Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD54B9AEE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B25210EAE6;
	Thu, 17 Feb 2022 08:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182D10EAC6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:30:04 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAs-0002Dy-CC; Thu, 17 Feb 2022 09:30:02 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAp-00ClSY-Li; Thu, 17 Feb 2022 09:29:59 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/23] drm/rockchip: RK356x VOP2 support
Date: Thu, 17 Feb 2022 09:29:31 +0100
Message-Id: <20220217082954.2967889-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v6 of adding RK356x VOP2 support. Biggest change this time is
that I no longer modify struct drm_encoder, instead the rockchip drivers
now embed struct drm_encoder in a rockchip specific struct.

Sascha

Changes since v5:
- Add new patch to fix dw-hdmi of_graph binding
- Drop "drm/encoder: Add of_graph port to struct drm_encoder" and solve
  issue internally in the driver
- make checkpatch cleaner

Changes since v4:
- Reorder patches in a way that binding/dts/driver patches are closer together
- Drop clk patches already applied by Heiko

Changes since v3:
- added changelog to each patch
- Add 4k support to hdmi driver
- rebase on v5.17-rc1

Changes since v2:
- Add pin names to HDMI supply pin description
- Add hclk support to HDMI driver
- Dual license rockchip-vop2 binding, update binding
- Add HDMI connector to board dts files
- drop unnecessary gamma_lut registers from vop2
- Update dclk_vop[012] clock handling, no longer hacks needed
- Complete regmap conversion

Changes since v1:
- drop all unnecessary waiting for frames within atomic modeset and plane update
- Cluster subwin support removed
- gamma support removed
- unnecessary irq_lock removed
- interrupt handling simplified
- simplified zpos handling
- drop is_alpha_support(), use fb->format->has_alpha instead
- use devm_regulator_get() rather than devm_regulator_get_optional() for hdmi regulators
- Use fixed number of planes per video port
- Drop homegrown regmap code from vop2 driver (not complete yet)
- Add separate include file for vop2 driver to not pollute the vop include

Andy Yan (1):
  drm: rockchip: Add VOP2 driver

Benjamin Gaignard (1):
  dt-bindings: display: rockchip: dw-hdmi: Add compatible for rk3568
    HDMI

Douglas Anderson (2):
  drm/rockchip: dw_hdmi: Use auto-generated tables
  drm/rockchip: dw_hdmi: Set cur_ctr to 0 always

Michael Riesch (1):
  arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a

Nickey Yang (1):
  drm/rockchip: dw_hdmi: add default 594Mhz clk for 4K@60hz

Sascha Hauer (17):
  drm/rockchip: Embed drm_encoder into rockchip_decoder
  drm/rockchip: dw_hdmi: rename vpll clock to reference clock
  dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
  arm64: dts: rockchip: rk3399: rename HDMI ref clock to 'ref'
  drm/rockchip: dw_hdmi: add rk3568 support
  drm/rockchip: dw_hdmi: add regulator support
  dt-bindings: display: rockchip: dw-hdmi: Add regulator support
  drm/rockchip: dw_hdmi: Add support for hclk
  dt-bindings: display: rockchip: dw-hdmi: Add additional clock
  drm/rockchip: dw_hdmi: drop mode_valid hook
  dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
  arm64: dts: rockchip: rk356x: Add VOP2 nodes
  arm64: dts: rockchip: rk356x: Add HDMI nodes
  arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi
  drm/rockchip: Make VOP driver optional
  dt-bindings: display: rockchip: Add binding for VOP2
  dt-bindings: display: rockchip: dw-hdmi: fix ports description

 .../display/rockchip/rockchip,dw-hdmi.yaml    |   53 +-
 .../display/rockchip/rockchip-vop2.yaml       |  140 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |    2 +-
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   47 +
 arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   47 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   83 +
 drivers/gpu/drm/rockchip/Kconfig              |   14 +
 drivers/gpu/drm/rockchip/Makefile             |    4 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   32 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   18 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |    2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   17 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  294 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   32 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   34 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   17 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2708 +++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  477 +++
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   26 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  281 ++
 include/dt-bindings/soc/rockchip,vop2.h       |   14 +
 26 files changed, 4175 insertions(+), 195 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
 create mode 100644 include/dt-bindings/soc/rockchip,vop2.h

-- 
2.30.2

