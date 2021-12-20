Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A045547A84D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 12:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC33C10EA33;
	Mon, 20 Dec 2021 11:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF4F10E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 11:06:50 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1mzGVE-0004wz-DM; Mon, 20 Dec 2021 12:06:48 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1mzGVA-00EmDw-Fp; Mon, 20 Dec 2021 12:06:44 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/22] drm/rockchip: RK356x VOP2 support
Date: Mon, 20 Dec 2021 12:06:08 +0100
Message-Id: <20211220110630.3521121-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


Third round of patches and last one for this year. I hopefully integrated
all review feedback. Additionally the driver is now fully converted to
regmap, so no struct vop_reg necessary anymore.

Sascha

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

Michael Riesch (1):
  arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a

Sascha Hauer (19):
  drm/rockchip: dw_hdmi: Do not leave clock enabled in error case
  drm/rockchip: dw_hdmi: rename vpll clock to reference clock
  drm/rockchip: dw_hdmi: add rk3568 support
  drm/rockchip: dw_hdmi: add regulator support
  drm/rockchip: dw_hdmi: Add support for hclk
  dt-bindings: display: rockchip: dw-hdmi: Make unwedge pinctrl optional
  dt-bindings: display: rockchip: dw-hdmi: use "ref" as clock name
  dt-bindings: display: rockchip: dw-hdmi: Add regulator support
  dt-bindings: display: rockchip: dw-hdmi: Add additional clock
  dt-bindings: display: rockchip: Add binding for VOP2
  arm64: dts: rockchip: rk3399: reorder hmdi clocks
  arm64: dts: rockchip: rk3399: rename HDMI ref clock to 'ref'
  arm64: dts: rockchip: rk356x: Add VOP2 nodes
  arm64: dts: rockchip: rk356x: Add HDMI nodes
  arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi
  clk: rk3568: drop CLK_SET_RATE_PARENT from dclk_vop*
  clk: rk3568: Add CLK_SET_RATE_PARENT to the HDMI reference clock
  drm/encoder: Add of_graph port to struct drm_encoder
  drm/rockchip: Make VOP driver optional

 .../display/rockchip/rockchip,dw-hdmi.yaml    |   28 +-
 .../display/rockchip/rockchip-vop2.yaml       |  146 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |    6 +-
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   48 +
 arch/arm64/boot/dts/rockchip/rk3566.dtsi      |    4 +
 .../boot/dts/rockchip/rk3568-evb1-v10.dts     |   48 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      |    4 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   85 +
 drivers/clk/rockchip/clk-rk3568.c             |    8 +-
 drivers/gpu/drm/rockchip/Kconfig              |   14 +
 drivers/gpu/drm/rockchip/Makefile             |    4 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  125 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |    2 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   15 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 2768 +++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  480 +++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |  285 ++
 include/drm/drm_encoder.h                     |    2 +
 include/dt-bindings/soc/rockchip,vop2.h       |   14 +
 21 files changed, 4063 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
 create mode 100644 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
 create mode 100644 include/dt-bindings/soc/rockchip,vop2.h

-- 
2.30.2

