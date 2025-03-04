Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB104A4DBF9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9190E10E248;
	Tue,  4 Mar 2025 11:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I82bNMmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658F110E248
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:11:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F6C85C58A0;
 Tue,  4 Mar 2025 11:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13486C4CEE5;
 Tue,  4 Mar 2025 11:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741086662;
 bh=wRy7+/kGOlNmUCl9zvvO+fK0rxu1pqEp//l3w03Dq58=;
 h=From:Subject:Date:To:Cc:From;
 b=I82bNMmgxseyRFDK4+kuxiM3kg6QgOK2w0mcxBbjaCGk3Ej7MDe7WQ2ju+4VfHQ4K
 2uryL2+uzx9NCMKCM4XEAXE9Cgbu3cORTvHXaO7Y5N5p3eIEi7pxVuWa3sXD4RNvN8
 q4BddJi890lPhfdYgvynFBD/Ll9lZftTiNmXs1fRqxWDKJzMHkJ1VbBdgRp675pKT0
 GSGF38Ke+Ja1/kmT1A0cHsEwCgs2MFlIeq04rfw12s/R7KC7g1MEi3hDd+1pEAx829
 kFN9/zsHF193E8Bao8vai6Dj0C59y+3NH9JLZEiZ/ysWF0+dVoFwjPVg8D89UX3tZf
 eVPKnL8y0X5kw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 00/16] drm/bridge: Various quality of life improvements
Date: Tue, 04 Mar 2025 12:10:43 +0100
Message-Id: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPfxmcC/33PTQ6CMBAF4KuYrq3pL7SuvIdxAe0UG00xxRAN4
 e4ObMRAXL6XmW8yA+kgR+jIcTeQDH3sYpsw6P2OuGuVGqDRYyaCCc0417TO0WPr2pTAPdtMg5X
 cKhBFGQLBtUeGEF8zeb5gvsYOx97zhZ5P7R+s55RRW4kAzhtTVMXpBjnB/dDmhkxaL76CYGpDE
 ChI7X3hjFTAzEqQC4HLDUGiACXX1gRlnQkrQS0EsfWFQqEEV7OyZtZV/kcYx/EDy40mbncBAAA
 =
X-Change-ID: 20250115-bridge-connector-f93194e267ff
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9086; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wRy7+/kGOlNmUCl9zvvO+fK0rxu1pqEp//l3w03Dq58=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnH7u/h65682r9FtvaA/bdFYqLfUotfSC3QzyxRPn852
 CG+Rou5YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyky4GxYZGqIK8Kj+DsfwGZ
 v6+a8z1IT//c0NkT9H3iwbkPm1dPd5ZN9pjwWNx94VpVlukxdd/7GGv43fh4o6QrX7UsXfSlrmj
 HxnOyYYqSZ6uznpwPXccf0TDnpOCFD4d1C7MfTm1JOCl91gAA
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
Changes in v5:
- Rebased on top of current drm-misc-next
- Split the new crtc / connector enabling helper into two patches
- Fix a depmod breakage with drm_bridge_reset_crtc()
- Renamed drm_bridge_reset_crtc() to drm_bridge_helper_reset_crtc()
- Add new test case for drm_bridge_helper_reset_crtc() when the bridge
  is disabled.
- Fix a few commit logs
- Link to v4: https://lore.kernel.org/r/20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org

Changes in v4:
- Rebased on top of drm-misc-next-2025-02-20
- Changed the approach to helpers suggested by Sima, dropped the tags
  affected by the rework
- Drop drm_bridge_state->crtc and connector fields
- Drop drm_bridge->encoder deprecation
- Introduced kunit tests
- Link to v3: https://lore.kernel.org/r/20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org

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
Maxime Ripard (16):
      drm/bridge: Add encoder parameter to drm_bridge_funcs.attach
      drm/bridge: Provide a helper to retrieve current bridge state
      drm/tests: Add kunit tests for bridges
      drm/atomic: Introduce helper to lookup connector by encoder
      drm/tests: helpers: Create new helper to enable output
      drm/tests: hdmi_state_helpers: Switch to new helper
      drm/tests: Create tests for drm_atomic
      drm/bridge: Add helper to reset bridge pipeline
      drm/tests: bridge: Provide tests for drm_bridge_helper_reset_crtc
      drm/bridge: ti-sn65dsi83: Switch to drm_bridge_helper_reset_crtc
      drm/bridge: Introduce drm_bridge_is_atomic() helper
      drm/bridge: cdns-csi: Switch to atomic helpers
      drm/bridge: tc358775: Switch to atomic commit
      drm/bridge: tc358768: Stop disabling when failing to enable
      drm/bridge: tc358768: Convert to atomic helpers
      drm/bridge: ti-sn65dsi86: Remove drm_encoder->crtc use

 drivers/gpu/drm/Kconfig                            |   1 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/adp-mipi.c                     |   3 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   3 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   3 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |   3 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   1 +
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  34 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   6 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c           |   5 +-
 drivers/gpu/drm/bridge/display-connector.c         |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   3 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |   7 +-
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h        |   2 +-
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   3 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   3 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   3 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   3 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   7 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c               |   3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   3 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   3 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   3 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |   3 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |   1 +
 drivers/gpu/drm/bridge/microchip-lvds.c            |   3 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   3 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   5 +-
 drivers/gpu/drm/bridge/panel.c                     |   3 +-
 drivers/gpu/drm/bridge/parade-ps8622.c             |   1 +
 drivers/gpu/drm/bridge/parade-ps8640.c             |   3 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 drivers/gpu/drm/bridge/sil-sii8620.c               |   1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   3 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |   5 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   3 +-
 drivers/gpu/drm/bridge/tc358764.c                  |   3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   2 +
 drivers/gpu/drm/bridge/tc358768.c                  |  41 +-
 drivers/gpu/drm/bridge/tc358775.c                  |  45 ++-
 drivers/gpu/drm/bridge/tda998x_drv.c               |   1 +
 drivers/gpu/drm/bridge/thc63lvd1024.c              |   3 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  31 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  58 ++-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |   6 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |   5 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c              |   3 +-
 drivers/gpu/drm/drm_atomic.c                       |  45 +++
 drivers/gpu/drm/drm_bridge.c                       |  11 +-
 drivers/gpu/drm/drm_bridge_helper.c                |  55 +++
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   5 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   3 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   3 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   3 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   3 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   3 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |   3 +-
 drivers/gpu/drm/omapdrm/dss/dpi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   3 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c                  |   3 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   3 +-
 drivers/gpu/drm/stm/lvds.c                         |  11 +-
 drivers/gpu/drm/tests/Makefile                     |   2 +
 drivers/gpu/drm/tests/drm_atomic_test.c            | 153 ++++++++
 drivers/gpu/drm/tests/drm_bridge_test.c            | 417 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 158 ++++----
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  61 +++
 drivers/gpu/drm/tidss/tidss_encoder.c              |   3 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   3 +-
 drivers/platform/arm64/acer-aspire1-ec.c           |   3 +-
 include/drm/drm_atomic.h                           |   3 +
 include/drm/drm_bridge.h                           |  34 +-
 include/drm/drm_bridge_helper.h                    |  12 +
 include/drm/drm_kunit_helpers.h                    |   8 +
 95 files changed, 1172 insertions(+), 246 deletions(-)
---
base-commit: 95a5c9d197bb22a506913acb330a926d4e51aa95
change-id: 20250115-bridge-connector-f93194e267ff

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

