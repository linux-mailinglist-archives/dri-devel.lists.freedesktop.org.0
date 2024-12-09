Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720609E93FE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097A610E713;
	Mon,  9 Dec 2024 12:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gzjDmYMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 688EE10E704
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JETkg
 mjDSfp+lIo8egQ4AEEqe7IPnscz/xFTqMIIcAk=; b=gzjDmYMWalJCHTYiyGOBL
 0B6jWEsMx8gBFh+LM7a8fOvKLfYOHlBuCVt6B2rDeAbJamm297YSEnHqwvDoZ5O2
 lr1GjdUFigOx1wfNpBcCpndnW/0SRNEY8VCpF4ILfaFWn8aae8gZLlZiNqolPlQe
 Nyl28aabgNp/vEzKTz8eq4=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S2;
 Mon, 09 Dec 2024 20:29:48 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 00/18] VOP Support for rk3576
Date: Mon,  9 Dec 2024 20:29:10 +0800
Message-ID: <20241209122943.2781431-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1xtF48CF43WF1xJFy7KFg_yoW5AFW8p3
 98CryrXrWxGFyjqr4kJw4UCrWFqwnayay7Ww4fG3ZrJry3tFnrKr9I9Fn8ArZxX3W8Za1U
 Cr4fJ34UGFsIvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMCJQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gCwXmdW3S-iwAABsc
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

PATCH 1 is a carryover from the working when add support for
    rk3588[0], is very usefull when some people want me
    help debug some issue online, so I really hope it can
    be merged at this round.
PATCH 2~8 are bugfix of rk3588 alpha blending which report and
    test by Derek
PATCH 9~13 are preparations for rk3576 support
PATCH 17~18 are real support for rk376

I test it with a 1080P/4K HDMI output with modetest and weston
output.

If there are some one want to have a try, I have a tree based on Linux
6.13-rc2 here[1]

[0]https://patchwork.kernel.org/project/linux-rockchip/cover/20231211115547.1784587-1-andyshrk@163.com/
[1]https://github.com/andyshrk/linux/tree/rk3576-vop2-upstream-v5

Changes in v5:
- Add axi id configuration for rk3588/rk3576
- More plane format check
- Remove the non-existent CBCR scale register.

Changes in v4:
- Typo fix: selet->select

Changes in v3:
- Split it from 10/15, as it fix a exiting compile warning.
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check
- Add comments for why we should treat rk3566 with special care.
- ordered by soc name
- Add description for newly added interrupt
- Share the alpha setup function with rk3568
- recoder the code block by soc

Changes in v2:
- split it from main patch add support for rk3576
- Add platform specific callback
- Introduce vop hardware version
- Add dt bindings
- Add platform specific callback

Andy Yan (17):
  drm/rockchip: vop2: Add debugfs support
  drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
  drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
  drm/rockchip: vop2: Fix the windows switch between different layers
  drm/rockchip: vop2: Set AXI id for rk3588
  drm/rockchip: vop2: Setup delay cycle for Esmart2/3
  drm/rockchip: vop2: Check linear format for Cluster windows on
    rk3566/8
  drm/rockchip: vop2: Add check for 32 bpp format
  drm/rockchip: vop2: Support 32x8 superblock afbc
  drm/rockchip: vop2: Add platform specific callback
  drm/rockchip: vop2: Support for different layer select configuration
    between VPs
  drm/rockchip: vop2: Introduce vop hardware version
  drm/rockchip: vop2: Register the primary plane and overlay plane
    separately
  drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
  drm/rockchip: vop2: Add uv swap for cluster window
  dt-bindings: display: vop2: Add rk3576 support
  drm/rockchip: vop2: Add support for rk3576

Min-Hua Chen (1):
  drm/rockchip: vop2: include rockchip_drm_drv.h

 .../display/rockchip/rockchip-vop2.yaml       |   13 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 1617 ++++---------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  292 ++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  | 2014 ++++++++++++++++-
 4 files changed, 2794 insertions(+), 1142 deletions(-)

-- 
2.34.1

