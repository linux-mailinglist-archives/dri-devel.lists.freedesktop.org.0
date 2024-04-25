Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FCF8B2550
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BDC11A57C;
	Thu, 25 Apr 2024 15:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cNbRwOOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07FD11A577
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9268ECE1AD1;
 Thu, 25 Apr 2024 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75BCC113CE;
 Thu, 25 Apr 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714059544;
 bh=3a2+j1JZDUVjbZREnQkHm3jUlHCl+/8Ud/MU8EZhSr4=;
 h=From:To:Cc:Subject:Date:From;
 b=cNbRwOOUo/rAWZjzz1g/0cfZy2LKy7k9CupiKmcLn5/4SOrvxu/CllNUk4+awGjxN
 6PweI28WX2HYpQ8FcVGnF0jUaZecOyB2wSwIjAGK67Ndm7FmPRLWAAuHKL14YfgH/O
 YwsrjqOP6fP4kOH5cU8LA0Yyq8geKlVvX7ryxHVy7IbtgJK1EGaH411jLI59ZcErRa
 6R8iiKcH6jV21OJthTXmHIpsRtoHRwyMvk9gv8cmMFBBy2thFicWKWQsp8INvU84n+
 6GhVoGmjPyiKMPiJMhOFzLjJpn6udKMoPamtMVzXk9LcnPXaj5SAxVV9H36a9pqr9g
 zWEqUl0tsPmnw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Justin Green <greenjustin@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wojciech Macek <wmacek@chromium.org>,
 Shuijing Li <shuijing.li@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 6.10
Date: Thu, 25 Apr 2024 15:38:59 +0000
Message-Id: <20240425153859.3579-1-chunkuang.hu@kernel.org>
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

1. Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
2. Add GAMMA 12-bit LUT support for MT8188
3. Add 0 size check to mtk_drm_gem_obj
4. Init `ddp_comp` with devm_kcalloc()
5. Rename mtk_drm_* to mtk_*
6. Drop driver owner initialization
7. Fix mtk_dp_aux_transfer return value
8. Correct calculation formula of PHY Timing

Regards,
Chun-Kuang.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.10

for you to fetch changes up to 417d8c47271d5cf1a705e997065873b2a9a36fd4:

  drm/mediatek: dsi: Correct calculation formula of PHY Timing (2024-04-22 13:40:34 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.10

1. Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()
2. Add GAMMA 12-bit LUT support for MT8188
3. Add 0 size check to mtk_drm_gem_obj
4. Init `ddp_comp` with devm_kcalloc()
5. Rename mtk_drm_* to mtk_*
6. Drop driver owner initialization
7. Fix mtk_dp_aux_transfer return value
8. Correct calculation formula of PHY Timing

----------------------------------------------------------------
Douglas Anderson (1):
      drm/mediatek: Init `ddp_comp` with devm_kcalloc()

Hsiao Chien Sung (14):
      drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
      drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
      drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
      drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
      drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
      drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
      drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
      drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
      drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
      drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
      drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
      drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
      drm/mediatek: Rename mtk_ddp_comp functions

Jason-JH.Lin (3):
      dt-bindings: display: mediatek: gamma: Change MT8195 to single enum group
      dt-bindings: display: mediatek: gamma: Add support for MT8188
      drm/mediatek: Add gamma support for MT8195

Justin Green (1):
      drm/mediatek: Add 0 size check to mtk_drm_gem_obj

Krzysztof Kozlowski (11):
      drm/mediatek: aal: drop driver owner initialization
      drm/mediatek: ccorr: drop driver owner initialization
      drm/mediatek: color: drop driver owner initialization
      drm/mediatek: gamma: drop driver owner initialization
      drm/mediatek: merge: drop driver owner initialization
      drm/mediatek: ovl: drop driver owner initialization
      drm/mediatek: ovl_adaptor: drop driver owner initialization
      drm/mediatek: rdma: drop driver owner initialization
      drm/mediatek: ethdr: drop driver owner initialization
      drm/mediatek: mdp_rdma: drop driver owner initialization
      drm/mediatek: padding: drop driver owner initialization

Markus Elfring (1):
      drm/mediatek: Use devm_platform_get_and_ioremap_resource() in mtk_hdmi_ddc_probe()

Shuijing Li (1):
      drm/mediatek: dsi: Correct calculation formula of PHY Timing

Wojciech Macek (1):
      drm/mediatek: dp: Fix mtk_dp_aux_transfer return value

 .../bindings/display/mediatek/mediatek,gamma.yaml  |   5 +
 drivers/gpu/drm/mediatek/Makefile                  |  12 +-
 .../drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c}    | 218 ++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_crtc.h                |  28 +++
 .../{mtk_drm_ddp_comp.c => mtk_ddp_comp.c}         |  51 ++---
 .../{mtk_drm_ddp_comp.h => mtk_ddp_comp.h}         |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   5 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |  30 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  34 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  33 ++--
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |   5 +-
 .../gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c}  |  68 +++----
 .../gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h}  |  23 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  14 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   1 -
 drivers/gpu/drm/mediatek/mtk_padding.c             |   5 +-
 .../drm/mediatek/{mtk_drm_plane.c => mtk_plane.c}  |  26 +--
 .../drm/mediatek/{mtk_drm_plane.h => mtk_plane.h}  |   4 +-
 30 files changed, 305 insertions(+), 314 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (95%)
