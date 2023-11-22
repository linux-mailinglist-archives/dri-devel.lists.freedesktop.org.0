Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A17F46F9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C951E10E623;
	Wed, 22 Nov 2023 12:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1882D10E623
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ilNby
 /QAqRj73jJ/nJZxXwIxgE03/s4paCuCwX+Dnos=; b=LTLhlE9ReggCMZFRPUHJu
 V194d46IlMwgwtO3gaDGksxSAQb2E1+uVdNa1Hj6voML6fE+BDI2pRRx/3AHyjls
 X3tzBZv2YZQkgcCLd3aRqYYpj0I0QNXEU21odHVhdQ9PQOra/6KDuAXI1Hzbskgd
 s5IncOYQ1SW8ec0GNHndM0=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wDXXym9+V1lS1OxCA--.53034S2;
 Wed, 22 Nov 2023 20:53:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v2 00/12] Add VOP2 support on rk3588
Date: Wed, 22 Nov 2023 20:53:16 +0800
Message-Id: <20231122125316.3454268-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXXym9+V1lS1OxCA--.53034S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW7tr4UArW3uryDCrWxJFb_yoW5CrWkpw
 s5Cry5ZrWxCFW2qrn3twn5CrWft3ZrAayfKws3GasIv3WfKF1UKwnxW3Z5Z3sxWw17ZFy2
 kr4UJ347Gr42vr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrcTPUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEAYwXl8YMqat1gAAsQ
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de,
 chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

This patch sets aims at enable the VOP2 support on rk3588.

Main feature of VOP2 on rk3588:
Four video ports:
VP0 Max 4096x2160
VP1 Max 4096x2160
VP2 Max 4096x2160
VP3 Max 2048x1080

4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
4 4K Esmart windows with line RGB/YUV support

The current version support all the 8 windows with all the suppported
plane format.

And we don't have a upstreamed encoder/connector(HDMI/DP) for rk3588
yet, Cristian from collabora is working on adding upstream support for
HDMI on rk3588.

My current test is runing with a HDMI driver pick from downstream bsp kernel.

A branch based on linux-6.7 rc2 containing all the series and
HDMI driver(not compatible with mainline rk3568 hdmi) picked from downstream bsp kernel
is available [0].

[0]https://github.com/andyshrk/linux/tree/rk3588-vop2-upstream-linux-6.7-rc2-2023-11-22

Changes in v2:
- fix errors when running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
- split dt-bindings form vop driver patch
- add rk3588_ prefix for functions which are rk3588 only
- make some calculation as fixed value and keep calculation formula as
  comment
- check return value for some cru calculation functions.
- check return value for syscon_regmap_lookup_by_phandle
- add NV20/NV30 for esmart plane

Andy Yan (12):
  drm/rockchip: move output interface related definition to
    rockchip_drm_drv.h
  Revert "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume"
  drm/rockchip: vop2: set half_block_en bit in all mode
  drm/rockchip: vop2: clear afbc en and transform bit for cluster window
    at linear mode
  drm/rockchip: vop2: Set YUV/RGB overlay mode
  drm/rockchip: vop2: rename grf to sys_grf
  dt-bindings: soc: rockchip: add rk3588 vop/vo syscon
  dt-bindings: display: vop2: Add rk3588 support
  dt-bindings: soc: vop2: Add more endpoint definition
  drm/rockchip: vop2: Add support for rk3588
  drm/rockchip: vop2: Add debugfs support
  arm64: dts: rockchip: Add vop on rk3588

 .../display/rockchip/rockchip-vop2.yaml       |  27 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   2 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |  96 ++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   1 -
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |  18 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  12 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 845 +++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  82 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   1 -
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |   1 -
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 221 +++++
 include/dt-bindings/soc/rockchip,vop2.h       |   4 +
 17 files changed, 1257 insertions(+), 58 deletions(-)

-- 
2.34.1

