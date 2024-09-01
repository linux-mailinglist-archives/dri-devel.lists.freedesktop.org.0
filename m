Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F9967690
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 15:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF7310E00D;
	Sun,  1 Sep 2024 13:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LFs28TBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DFE10E00D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 13:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B466E5C4D20;
 Sun,  1 Sep 2024 13:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413AEC4CEC3;
 Sun,  1 Sep 2024 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725196440;
 bh=TsJk1UslMdTzF39qT2aKFXcW5AVFwY/n1oi5BBSvDac=;
 h=From:To:Cc:Subject:Date:From;
 b=LFs28TByEBAyyAoduQhLjyAowqYt8AQKf9cZ5Kw8g4aS9vYMoLgpp4Vw9zNKNqVCg
 QmrEFpBNhbbGvUiMBWMPsnUQdyMCzla4WajVQSnknnuvCwT3Kzow2ZJaJ21nIju1jJ
 lZM/rnJWYJ27yRPVbWT4oJILDqR5k36jsYW64UvFCx60+FLVB4lVB54N5PHJbMMhVQ
 9JCuZ5J9loiqDA8/eJRVsAl4NpinmdinXJrHa8RFUZXgGJ9BXqTHQK5v3y9Ax89yap
 t9Y78H33DwQebGvd3WFLDUWiG0NZ/jHXSGf2/lJQ8KunHppIaH9/GThQBRXSZZrZbQ
 wwMnzyG1A5ACA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Shuijing Li <shuijing.li@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Rohit Agarwal <rohiagar@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.12
Date: Sun,  1 Sep 2024 13:13:54 +0000
Message-Id: <20240901131354.2686-1-chunkuang.hu@kernel.org>
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

1. Support alpha blending
2. Remove cl in struct cmdq_pkt
3. Fixup for ovl adaptor
4. Declare Z Position for all planes
5. Drop unnecessary check for property presence
6. Add dsi per-frame lp code for mt8188
7. Fix missing configuration flags in mtk_crtc_ddp_config()
8. Use spin_lock_irqsave() for CRTC event lock
9. Add power domain binding to the mediatek DPI controller

Regards,
Chun-Kuang.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.12

for you to fetch changes up to 5474d49b2f79b41f2ab09b0deb9d97d47b18d094:

  dt-bindings: display: mediatek: dpi: Add power domains (2024-08-30 12:12:40 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.12

1. Support alpha blending
2. Remove cl in struct cmdq_pkt
3. Fixup for ovl adaptor
4. Declare Z Position for all planes
5. Drop unnecessary check for property presence
6. Add dsi per-frame lp code for mt8188
7. Fix missing configuration flags in mtk_crtc_ddp_config()
8. Use spin_lock_irqsave() for CRTC event lock
9. Add power domain binding to the mediatek DPI controller

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: Declare Z Position for all planes

Chun-Kuang Hu (2):
      drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
      drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()

Fei Shao (1):
      drm/mediatek: Use spin_lock_irqsave() for CRTC event lock

Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

Jason-JH.Lin (1):
      drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()

Javier Carrasco (3):
      drm/mediatek: ovl_adaptor: Drop unused mtk_crtc.h header
      drm/mediatek: ovl_adaptor: Add missing of_node_put()
      drm/mediatek: ovl_adaptor: Use scoped variant of for_each_child_of_node()

Rob Herring (Arm) (1):
      drm/mediatek: Drop unnecessary check for property presence

Rohit Agarwal (1):
      dt-bindings: display: mediatek: dpi: Add power domains

Shuijing Li (1):
      drm/mediatek: dsi: Add dsi per-frame lp code for mt8188

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  17 ++++
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  82 +++++++---------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  36 +++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  13 +--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 106 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_ethdr.c               |  13 ++-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  29 +++++-
 drivers/gpu/drm/mediatek/mtk_plane.h               |   3 +-
 9 files changed, 221 insertions(+), 83 deletions(-)
