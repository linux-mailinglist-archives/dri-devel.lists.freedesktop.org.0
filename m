Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F109FC8F6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300F10E74B;
	Thu, 26 Dec 2024 06:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="LS4C2XH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127216.xmail.ntesmail.com
 (mail-m127216.xmail.ntesmail.com [115.236.127.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE210E74A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:33:31 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc5110e;
 Thu, 26 Dec 2024 14:33:26 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 00/17] Add eDP support for RK3588
Date: Thu, 26 Dec 2024 14:32:56 +0800
Message-Id: <20241226063313.3267515-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhIS1YYGk0dQ09MTEJOHUpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a9401ab8ab803a3kunm6dc5110e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Tgw4DTIOCEwOGk49ETdO
 MB4wFD5VSlVKTEhOSkJPQ0tDTU5MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITUJLNwY+
DKIM-Signature: a=rsa-sha256;
 b=LS4C2XH5YX3jpuM0BRLyZjigaXN2JeKdAZASXp4dqcfoBypO3KrU2CkUuPKM7quHE4Rf4ZmcvUVmRJ3G7TwpQ/A6IaoLGRPnHarNgp32+to0CQ6dRmWDMUD/k3dAqbsE0TSV6s1VqPsYq9dhD6xmqzeI2FILScel/mDiHZDWv+Q=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=WtDvYzoJBC9gaqFxvXZe9/0NcEOfevXaBFtnWX74jvo=;
 h=date:mime-version:subject:message-id:from;
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

These patchs have been tested with a 1536x2048p60 eDP panel on
RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
on RK3399 sapphire excavator board.

Patch 1~3   are the RK3588 eDP support of Rockchip analogix_dp driver.
Patch 4~7   are the eDP mode support of samsung hdptx phy driver.
Patch 8~9   are the RK3588 eDP support of Aanalogix DP driver. Add phy
            interfaces is to configure the HDMI/eDP TX Combo PHY.
Patch 10~13 are to support to get panel from the DP AUX bus.
Patch 14~15 are the renaming of hdptxphy node. It is not only used by
            HDMI display but also for the eDP display.
Patch 16    is the addition of RK3588 eDP0 node.
Patch 17    is to enable the eDP0 display on RK3588S EVB1 board.

Damon Ding (17):
  drm/rockchip: analogix_dp: Use formalized struct definition for grf
    field
  dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
  drm/rockchip: analogix_dp: Add support for RK3588
  phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
    ROPLL_REF
  phy: phy-rockchip-samsung-hdptx: Supplement some register names with
    their full version
  phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
    registers
  phy: phy-rockchip-samsung-hdptx: Add support for eDP mode
  drm/bridge: analogix_dp: Add support for RK3588
  drm/bridge: analogix_dp: Add support for phy configuration.
  dt-bindings: display: rockchip: analogix-dp: Add support to get panel
    from the DP AUX bus
  drm/bridge: analogix_dp: Add a new member aux to struct
    analogix_dp_plat_data
  drm/rockchip: analogix_dp: Add support to get panel from the DP AUX
    bus
  drm/bridge: analogix_dp: Convert &analogix_dp_device.aux into a
    pointer
  dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
    HDMI TX Controller
  arm64: dts: rockchip: Fix label name of hdptxphy for RK3588
  arm64: dts: rockchip: Add eDP0 node for RK3588
  arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

 .../rockchip/rockchip,analogix-dp.yaml        |  12 +-
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  32 +-
 .../dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   2 +-
 .../rockchip/rk3588-coolpi-cm5-genbook.dts    |   2 +-
 .../boot/dts/rockchip/rk3588-evb1-v10.dts     |   2 +-
 .../rk3588-friendlyelec-cm3588-nas.dts        |   2 +-
 .../arm64/boot/dts/rockchip/rk3588-jaguar.dts |   2 +-
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |   2 +-
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   2 +-
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |   2 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts |   2 +-
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-evb1-v10.dts    |  52 +
 .../dts/rockchip/rk3588s-indiedroid-nova.dts  |   2 +-
 .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   |   2 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5a.dts     |   2 +-
 .../boot/dts/rockchip/rk3588s-rock-5c.dts     |   2 +-
 .../drm/bridge/analogix/analogix_dp_core.c    |  97 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |   2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  54 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 217 +++-
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 988 +++++++++++++++++-
 include/drm/bridge/analogix_dp.h              |   5 +-
 26 files changed, 1326 insertions(+), 167 deletions(-)

-- 
2.34.1

