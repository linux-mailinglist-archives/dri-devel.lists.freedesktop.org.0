Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0696BB74
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728A910E67F;
	Wed,  4 Sep 2024 12:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="l1FPea8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6798210E386
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Pox9q
 DQ86t18rogfI7aGKkiX3ROJpF4gTG4iFYPl5Og=; b=l1FPea8SzzM9Y5ECYKdc/
 fJ8H8bthWBycnKgg1kv94fYoYm2GbgYn4XViTdUXL4bfJkRRD9WVWK9V06rTZFwt
 2dmLSNt691kO97SoPOz+88kuqhmG8WbgHhKUiQyf3VcRczrKQGvw3g+dCp8h12Y9
 sGw4GbRneWfagi1utAHVEc=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wA3HxFgTNhmiRMZCA--.50872S2;
 Wed, 04 Sep 2024 20:02:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: detlev.casanova@collabora.com
Cc: sjoerd@collabora.com, sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 00/11] VOP Support for rk3576
Date: Wed,  4 Sep 2024 20:02:27 +0800
Message-Id: <20240904120238.3856782-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3HxFgTNhmiRMZCA--.50872S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyDArW5Aw18tFy8XF1UWrg_yoW8AF43pw
 s8ua43XrW8CFy2qrn7tws8CrWrtwnayayxKw4fG3W3Jw1IyF9rGr9xuFn8ZrZxtF1xZa1U
 Crs8KayUGF4Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMHqxUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQdQXmVOCpvzKwAAsC
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

From: Andy Yan <andy.yan@rock-chips.com>


Thanks for the basic work from Collabora, I can bringup a HDMI
display out on rk3576.

The hdmi depends on WIP patch from Cristian[0]

I test it with a 1080P/4K HDMI output with modetest and weston output.

If there are some one want to have a try, I have a tree here[1]
[0]https://lore.kernel.org/lkml/20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com/
[1]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v2

Changes in v2:
- split it from main patch add support for rk3576
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add platform specific callback

Andy Yan (11):
  drm/rockchip: vop2: Add debugfs support
  drm/rockchip: vop2: Support for different layer selet configuration
    between VPs
  drm/rockchip: vop2: Support 32x8 superblock afbc
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576
  phy: phy-rockchip-samsung-hdptx: Don't request
    RST_PHY/RST_ROPLL/RST_LCPLL

 .../display/rockchip/rockchip-vop2.yaml       |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1560 ++++---------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  274 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 1989 ++++++++++++++++-
 .../phy/rockchip/phy-rockchip-samsung-hdptx.c |   17 +-
 5 files changed, 2701 insertions(+), 1140 deletions(-)

-- 
2.34.1

