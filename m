Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0022497D258
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A1110E094;
	Fri, 20 Sep 2024 08:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="XkbuQzK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9D1310E094
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=BEGbI
 sQTh+g3JWARPrbSM2LwRVGpbQaDzPpAvAWnYdQ=; b=XkbuQzK5OxEZbDHFOwj2N
 Psnjq7i20w5qVIu/QhkgSmvMfmRVaz9p2PCh8vadah/rSPQdKKDhrvA91htuxsjj
 6Zm3voIpxCnswed2YVrPsKNHT9fPN3F9gILxRJI9cZUAxCkF7IT9DGKRHfCxN/h+
 Aq1MpTNYkN2X5xSBhOFVVc=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp2 (Coremail) with SMTP id sSgvCgBHPThcL+1mkXNnBg--.49626S2;
 Fri, 20 Sep 2024 16:16:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 00/15] VOP Support for rk3576
Date: Fri, 20 Sep 2024 16:16:24 +0800
Message-ID: <20240920081626.6433-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: sSgvCgBHPThcL+1mkXNnBg--.49626S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1fXF4UAF4UGF13uw4UArb_yoW5Xr15p3
 98CryrXrZ7CFyjqrn7Gw4UCrWSqwnayay7Ww4fG3ZrA3WSyFnrKr9xuFn8ZrZIq3WxZF4U
 Crs7X34UGF4IvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UtWrAUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hRgXmWX0hsNzwABsA
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

PATCH 1 is a carryover from the working when add support for rk3588,
        is very usefull when some people want me help debug some issue
        online, so I really hope it can be merged at this round.
PATCH 2~5 are bugfix of rk3588 alpha blending which report and test by
         Derek
PATCH 6~13 are preparations for rk3576 support
PATCH 14~15 are real support for rk376

The hdmi depends on WIP patch from Cristian[1]
I test it with a 1080P/4K HDMI output with modetest and weston output.

If there are some one want to have a try, I have a tree here[2]

[0] https://patchwork.kernel.org/project/linux-rockchip/cover/20231211115547.1784587-1-andyshrk@163.com/
[1] https://lore.kernel.org/lkml/20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com/
[2] https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v3

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- split it from main patch add support for rk3576
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add platform specific callback

Andy Yan (15):
  drm/rockchip: vop2: Add debugfs support
  drm/rockchip: Set dma mask to 64 bit
  drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
  drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
  drm/rockchip: vop2: Fix the windows switch between different layers
  drm/rockchip: vop2: include rockchip_drm_drv.h
  drm/rockchip: vop2: Support 32x8 superblock afbc
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Support for different layer selet configuration
    between VPs
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

 .../display/rockchip/rockchip-vop2.yaml       |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1572 ++++---------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  274 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 1948 ++++++++++++++++-
 5 files changed, 2683 insertions(+), 1128 deletions(-)

-- 
2.34.1

