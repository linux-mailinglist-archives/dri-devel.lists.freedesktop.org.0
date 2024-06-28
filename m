Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E244E91BFF7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D81710EC78;
	Fri, 28 Jun 2024 13:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="reBAeG/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EBE10EC5E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:52:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 80470CE3B5E;
 Fri, 28 Jun 2024 13:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F05CC2BBFC;
 Fri, 28 Jun 2024 13:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719582399;
 bh=ONpr2j1g6b+nAqVM44FbiXV9HgLhJNk2TcpV20rk6Iw=;
 h=From:To:Cc:Subject:Date:From;
 b=reBAeG/hSYCgfhcC/jq/ZmYsEibBp5P/Dv8GuGC+Q31KtRMcZXPSr6FtMJTERX2Jg
 9I4dmUz6vc2boyfz5vWa/xOSEI+msGvoMaIXM03n/pGJHSNJG+7AZ22z/ix0mWP5mG
 sPZL66CYywktCWhHvA2IxAxxfavZxJVvKLPKiLCAoocqV6J7vtRH/H0lDVTjUmVa6+
 tsIaFvEv46JfVOtOU7k71KN/Z747sE1RCnRNZEh5j3gFSgSTgzssogs+WqvFdLMm9X
 bxTXPkhczBij+m39uAfEplaR7nbYR8PLtWjRGod2LNewqKKoHvROIBNJkBfluUBazx
 S3J9vYZVhSavQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Michael Walle <mwalle@kernel.org>
Subject: [GIT PULL] mediatek drm next for 6.11
Date: Fri, 28 Jun 2024 13:46:32 +0000
Message-Id: <20240628134632.28672-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

1. Convert to platform remove callback returning void
2. Drop chain_mode_fixup call in mode_valid()
3. Fixes the errors of MediaTek display driver found by IGT.
4. Add display support for the MT8365-EVK board
5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
6. Remove less-than-zero comparison of an unsigned value
7. Call drm_atomic_helper_shutdown() at shutdown time
8. Log errors in probe with dev_err_probe()
9. Fix possible_crtcs calculation
10. Fix spurious kfree()

Regards,
Chun-Kuang.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.11

for you to fetch changes up to 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b:

  drm/mediatek/dp: Fix spurious kfree() (2024-06-28 13:01:43 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.11

1. Convert to platform remove callback returning void
2. Drop chain_mode_fixup call in mode_valid()
3. Fixes the errors of MediaTek display driver found by IGT.
4. Add display support for the MT8365-EVK board
5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
6. Remove less-than-zero comparison of an unsigned value
7. Call drm_atomic_helper_shutdown() at shutdown time
8. Log errors in probe with dev_err_probe()
9. Fix possible_crtcs calculation
10. Fix spurious kfree()

----------------------------------------------------------------
Alexandre Mergnat (9):
      dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: dpi: add compatible for MT8365
      dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
      dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC

Douglas Anderson (1):
      drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time

Hsiao Chien Sung (15):
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Use 8-bit alpha in ETHDR
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Fix destination alpha error in OVL
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer
      drm/mediatek: Remove less-than-zero comparison of an unsigned value

Jason-JH.Lin (1):
      drm/mediatek: Fix bit depth overwritten for mtk_ovl_set bit_depth()

Michael Walle (2):
      drm/mediatek: dpi/dsi: Fix possible_crtcs calculation
      drm/mediatek/dp: Fix spurious kfree()

Nícolas F. R. A. Prado (1):
      drm/mediatek: Log errors in probe with dev_err_probe()

Sam Ravnborg (1):
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()

Uwe Kleine-König (1):
      drm/mediatek: Convert to platform remove callback returning void

 .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
 .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
 .../bindings/display/mediatek/mediatek,dpi.yaml    |   4 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
 .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
 drivers/gpu/drm/mediatek/mtk_cec.c                 |  28 ++---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c            | 109 ++++++++++------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |   8 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  18 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |  18 ++-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |  18 ++-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  18 ++-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |  25 ++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 140 +++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   6 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  31 ++---
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  18 +--
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  32 +++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   5 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  46 ++++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  42 ++-----
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |  21 ++--
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  18 ++-
 drivers/gpu/drm/mediatek/mtk_padding.c             |  25 ++--
 drivers/gpu/drm/mediatek/mtk_plane.c               |   4 +-
 31 files changed, 373 insertions(+), 280 deletions(-)
