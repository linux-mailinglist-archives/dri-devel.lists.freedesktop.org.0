Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CBC808244
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD90E10E7F1;
	Thu,  7 Dec 2023 08:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id A054810E7F1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 07:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=PU5zt
 QGenpctCMZfYqfAf9LCbmtxHDSN+kd7IKKdbdQ=; b=JmmOp7v+BMo8r0exoD/AC
 KgfvTeIuO375D+UjCcwfPL+arfEtWXK6iZVQl9AF3YxXfnSnnT6JCb/kKbBUXaPN
 Ff2Zpnw0/OWltsIH7J4GPnTgo00GH+9KagwJbInaArsWElDdDPyUe0xiiSmJwzAj
 +aXjRiVD5abBsmfN6BMUgs=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDnDypMe3FlBlEFCg--.42141S2;
 Thu, 07 Dec 2023 15:59:12 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v4 00/17] Add VOP2 support on rk3588
Date: Thu,  7 Dec 2023 15:59:06 +0800
Message-Id: <20231207075906.651771-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnDypMe3FlBlEFCg--.42141S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW7tr4UAr4UWry5KFW5GFg_yoWrCw47p3
 95Cry5XrWxCFW2qrs3tw1rCrWftanrAay7Gws3G3ZIv3W3KF1UKwnIg3Z5Zr9rWr1xZFy2
 kF4UJ347Wr42vr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrcTPUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgs-XmVOA0WqfQACsA
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
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

My current test(1080P/4KP60) is runing with a HDMI driver pick from
downstream bsp kernel.

A branch based on linux-6.7 rc4 containing all the series and
HDMI driver(not compatible with mainline rk3568 hdmi) picked
from downstream bsp kernel is available [0].

[0]https://github.com/andyshrk/linux/commits/rk3588-vop2-upstream-linux-6.7-rc4-2023-12-07

Changes in v4:
- fix the POST_BUF_EMPTY irq when set mode
- use full stop at all the description's end.
- address Krzysztof's review about dt-binding in v3
- keep all VOP2_FEATURE_HAS_xxx macros increase in order.
- address Sascha's review about debugfs
- Add const for rockchip,rk3588-iommu compatible

Changes in v3:
- split from the vop2 driver patch
- put bool variable yuv_overlay next to other bool variable
- define macro for RK3568_OVL_CTRL__YUV_MODE
- just write RK3568_OVL_CTRL register once in function
  vop2_setup_layer_mixer
- constrain properties in allOf:if:then
- some description updates
- change the subject as Krzysztof suggested, and add his ACK
- add braces for x in macro vop2_output_if_is_yyy(x)
- clear the bits of a mask before setting it in rk3588_set_intf_mux
- add more comments.
- put regs dump info in vop2_data

Changes in v2:
- fix errors when running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
- split form vop driver patch
- add rk3588_ prefix for functions which are rk3588 only
- make some calculation as fixed value and keep calculation formula as
  comment
- check return value for some cru calculation functions.
- check return value for syscon_regmap_lookup_by_phandle
- add NV20/NV30 for esmart plane

Andy Yan (17):
  drm/rockchip: move output interface related definition to
    rockchip_drm_drv.h
  Revert "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume"
  drm/rockchip: vop2: set half_block_en bit in all mode
  drm/rockchip: vop2: clear afbc en and transform bit for cluster window
    at linear mode
  drm/rockchip: vop2: Add write mask for VP config done
  drm/rockchip: vop2: Set YUV/RGB overlay mode
  drm/rockchip: vop2: set bg dly and prescan dly at vop2_post_config
  drm/rockchip: vop2: rename grf to sys_grf
  dt-bindings: soc: rockchip: add rk3588 vop/vo syscon
  dt-bindings: display: vop2: Add rk3588 support
  dt-bindings: rockchip,vop2: Add more endpoint definition
  drm/rockchip: vop2: Add support for rk3588
  drm/rockchip: vop2: rename VOP_FEATURE_OUTPUT_10BIT to
    VOP2_VP_FEATURE_OUTPUT_10BIT
  drm/rockchip: vop2: Add debugfs support
  dt-bindings: iommu: rockchip: Add Rockchip RK3588
  arm64: dts: rockchip: Add vop on rk3588
  MAINTAINERS: Add myself as a reviewer for rockchip drm

 .../display/rockchip/rockchip-vop2.yaml       | 100 ++-
 .../bindings/iommu/rockchip,iommu.yaml        |  11 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   2 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |  96 +++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   1 -
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |   1 -
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   1 -
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |  18 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |  12 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 761 +++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  | 111 ++-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   1 -
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |   1 -
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 414 +++++++++-
 include/dt-bindings/soc/rockchip,vop2.h       |   4 +
 19 files changed, 1441 insertions(+), 97 deletions(-)

-- 
2.34.1

