Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1CCA342EC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3E810EACF;
	Thu, 13 Feb 2025 14:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JCT9IpWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5191810EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 167C0A42101;
 Thu, 13 Feb 2025 14:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B372DC4CED1;
 Thu, 13 Feb 2025 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457834;
 bh=RFUjqIK5BTuHTMe+2enHP3knyLi43L1mjEOwAYCvg4c=;
 h=From:Subject:Date:To:Cc:From;
 b=JCT9IpWm8xAFtsxGKyhaxU0933ViL/+cEtxs57J+fpA5FXEoEaM4wHGmzctNz+EFX
 i9Jfj3JJFkb7VHBVINJTkrQwrifJHWJHKosM0FySDEePMRAi5zZTLouhxJeCZ8x/6m
 hZXccifd7cX8yoDsDm7MYmReuwtCSdoCCPMzNCRRLDYDn+TnISTQdwrMKHCsXkk85U
 a+rjkjw07kbl3vfMRauoCoGTI1/BgM3uIZKE6OcLK0gZ/rUHxNkxW2WYSrTgt0zmxd
 FcNwtaFSKsyluhX4jB8icvmC29TAuvJkc70hhcCUoy+yD/bO3JwKsvvXnxVFARJ0tY
 TpaaQG1f0Pr7w==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/37] drm/bridge: Various quality of life improvements
Date: Thu, 13 Feb 2025 15:43:19 +0100
Message-Id: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcFrmcC/33NQQ7CIBAF0KsY1mJgaJG68h7GRYWhJRowYIim6
 d2ddmNMjMv/M//NxArmgIUdNhPLWEMJKVJQ2w2zYx8H5MFRZiCgFVK2/JKDo9amGNE+Uua+U7J
 rEPTee0aze0Yfnit5OlMeQ6Gz1/qhyqX9g1XJBe968GidMbrXxyvmiLddygNbtAofAUTzQwASV
 OuctkY1KMyXMM/zG6XjqwLzAAAA
X-Change-ID: 20250115-bridge-connector-f93194e267ff
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9772; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RFUjqIK5BTuHTMe+2enHP3knyLi43L1mjEOwAYCvg4c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWPn27k+UVzDzXaxz9N7/vDeft1is5dFQ+q5yX54nZ
 r1f4C6ujqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRkpeMdYrcMyyTzHw1jVab
 fb554OMsVoltHicunLKO3/by0WfBeWKHZn5k2zHtmp5p7L/JMcXcvoz1wVuvdS00at101PLGlJz
 Hc5svbjpv+8h0Suoq/5jpc1duMnm280XKC4NZCjMWzku8ef7DBAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

Here's a series of changes after to the KMS helpers and bridge API
following a bunch of reviews I did.

It's mostly centered across providing an easier time to deal with bridge
states, and a somewhat consistent with the other entities API.

It's build tested only, with arm64 allmodconfig.

Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Add tags
- Fix compilation breakages
- Reword some commit messages
- Create drm_bridge_is_atomic() helper
- Retrieve the CRTC state through drm_atomic_get_new_crtc_state()
  instead of crtc->state in bridges
- Fix ti-sn65dsi86
- Link to v2: https://lore.kernel.org/r/20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org

Changes in v2:
- Pass the full atomic state to bridge atomic hooks
- Make attach take the encoder as a parameter
- Mark bridge->encoder as deprecated
- Rework the logic to detect if a bridge uses a state or not at
  atomic_check time
- Add lockdep assertion to drm_bridge_get_current_state()
- Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org

---
Maxime Ripard (37):
      drm/atomic: Document history of drm_atomic_state
      drm/bridge: Pass full state to atomic_pre_enable
      drm/bridge: Pass full state to atomic_enable
      drm/bridge: Pass full state to atomic_disable
      drm/bridge: Pass full state to atomic_post_disable
      drm/atomic-helper: Fix commit_tail state variable name
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
      drm/atomic-helper: Change parameter name of disable_outputs()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
      drm/atomic-helper: Change parameter name of crtc_set_mode()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()
      drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
      drm/bridge: Provide a helper to retrieve current bridge state
      drm/bridge: Introduce drm_bridge_is_atomic() helper
      drm/bridge: Assume that a bridge is atomic if it has atomic_reset
      drm/bridge: Provide pointers to the connector and crtc in bridge state
      drm/bridge: Make encoder pointer deprecated
      drm/bridge: cdns-csi: Switch to atomic helpers
      drm/bridge: tc358775: Switch to atomic commit
      drm/bridge: tc358768: Stop disabling when failing to enable
      drm/bridge: tc358768: Convert to atomic helpers
      drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   7 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   3 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  26 +--
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  11 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |   3 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  32 ++-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  13 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   5 +-
 drivers/gpu/drm/bridge/display-connector.c         |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   8 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   7 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |   2 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   3 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  10 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  10 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  21 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   8 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  13 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  11 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  18 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  10 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   8 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   8 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  21 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |   3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  13 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   5 +-
 drivers/gpu/drm/bridge/panel.c                     |  15 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   1 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |   7 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  11 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   9 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   8 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  11 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  11 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  12 +-
 drivers/gpu/drm/bridge/tc358764.c                  |   3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  22 +-
 drivers/gpu/drm/bridge/tc358768.c                  |  39 ++--
 drivers/gpu/drm/bridge/tc358775.c                  |  44 ++--
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   3 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  10 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  10 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  69 ++++--
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  12 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   5 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 +-
 drivers/gpu/drm/drm_atomic_helper.c                | 242 ++++++++++-----------
 drivers/gpu/drm/drm_atomic_state_helper.c          |   5 +
 drivers/gpu/drm/drm_bridge.c                       | 107 ++++-----
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   1 +
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   9 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   9 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  11 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  12 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   8 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   8 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  28 +--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  19 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   3 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   8 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   8 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   8 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   7 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   8 +-
 drivers/gpu/drm/stm/lvds.c                         |  16 +-
 drivers/gpu/drm/tidss/tidss_encoder.c              |   3 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  12 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  17 +-
 drivers/platform/arm64/acer-aspire1-ec.c           |   3 +-
 include/drm/drm_atomic.h                           |  45 ++++
 include/drm/drm_bridge.h                           |  39 +++-
 91 files changed, 697 insertions(+), 590 deletions(-)
---
base-commit: 50625eab3972e5d37dcf3a250d9e3cdecbd6c13b
change-id: 20250115-bridge-connector-f93194e267ff

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

