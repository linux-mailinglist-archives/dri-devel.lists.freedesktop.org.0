Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F58A01456
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 13:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2926510E149;
	Sat,  4 Jan 2025 12:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dAwITT5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB2510E149
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2025 12:42:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DF1DFA4032F;
 Sat,  4 Jan 2025 12:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B0FC4CED1;
 Sat,  4 Jan 2025 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735994552;
 bh=i3MCDANbM1srZh8kgYeU036iM9ApZitZLDa4c9jlvhI=;
 h=From:To:Subject:Date:From;
 b=dAwITT5jmQfKT+RNq/xcYyBsrL2wFV6NRm8WWvNl16/oLZgf5At/OaJP/0OwuW54/
 FT3lTKPwdhXAvux7jpe7TtD2P5zX6zjpx24CDkA6mI/x3vE9jFFLkQlKyf3ELfz5XZ
 1wDF4x/R9siHR2lvCGL1oG3cM/aNfuoNqApNsa/S42GEZeCw+rbXbymeYJuTXBUyl8
 5UmyxwHOYjN4ytdq+XIzHzPcAYDiJl58YLNSxOXqQaw7gfjQEXp+iimAwn7DMGBcX6
 9kZJ8y+N/SmDZ9oQ35Scafgcpc7vDV/85qpvsXQGu0Ikn23psSR8wc0+U3zKcRxtSz
 6vMjAWs2Whlzg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Guoqing Jiang <guoqing.jiang@canonical.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Arnd Bergmann <arnd@arndb.de>,
 Liankun Yang <liankun.yang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes 20250104
Date: Sat,  4 Jan 2025 12:42:27 +0000
Message-Id: <20250104124227.45505-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, Dave & Daniel:

This includes:

1. Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
2. Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
3. Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
4. Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
5. Add support for 180-degree rotation in the display driver
6. Stop selecting foreign drivers
7. Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
8. Fix YCbCr422 color format issue for DP
9. Fix mode valid issue for dp
10. dp: Reference common DAI properties
11. dsi: Add registers to pdata to fix MT8186/MT8188
12. Remove unneeded semicolon
13. Add return value check when reading DPCD
14. Initialize pointer in mtk_drm_of_ddp_path_build_one()

Regards,
Chun-Kuang.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250104

for you to fetch changes up to f563dd9ca6cb6ed52c5fb6e4285d1ef26cfa7e8a:

  drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one() (2025-01-04 12:15:19 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250104

1. Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
2. Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
3. Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
4. Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
5. Add support for 180-degree rotation in the display driver
6. Stop selecting foreign drivers
7. Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
8. Fix YCbCr422 color format issue for DP
9. Fix mode valid issue for dp
10. dp: Reference common DAI properties
11. dsi: Add registers to pdata to fix MT8186/MT8188
12. Remove unneeded semicolon
13. Add return value check when reading DPCD
14. Initialize pointer in mtk_drm_of_ddp_path_build_one()

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
      drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()

Arnd Bergmann (1):
      drm/mediatek: stop selecting foreign drivers

Chun-Kuang Hu (3):
      Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
      Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
      drm/mediatek: Remove unneeded semicolon

Daniel Golle (1):
      drm/mediatek: Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported

Fei Shao (1):
      dt-bindings: display: mediatek: dp: Reference common DAI properties

Guoqing Jiang (1):
      drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err

Jason-JH.Lin (2):
      drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
      drm/mediatek: Add support for 180-degree rotation in the display driver

Liankun Yang (3):
      drm/mediatek: Fix YCbCr422 color format issue for DP
      drm/mediatek: Fix mode valid issue for dp
      drm/mediatek: Add return value check when reading DPCD

 .../bindings/display/mediatek/mediatek,dp.yaml     | 19 +++++-
 drivers/gpu/drm/mediatek/Kconfig                   |  5 --
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 25 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 69 ++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 46 +++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 13 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 49 +++++++++------
 7 files changed, 142 insertions(+), 84 deletions(-)
