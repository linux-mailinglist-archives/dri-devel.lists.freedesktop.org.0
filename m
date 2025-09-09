Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DDB4ABC0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671F10E6A6;
	Tue,  9 Sep 2025 11:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUri/ZJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76B10E661;
 Tue,  9 Sep 2025 11:27:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DF4D0601E2;
 Tue,  9 Sep 2025 11:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078C7C4CEF4;
 Tue,  9 Sep 2025 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417270;
 bh=Q7MJ6HuoxZjlAYgfu4R8+11tXMfLB78JEQFVmnR4+ik=;
 h=From:Subject:Date:To:Cc:From;
 b=UUri/ZJqN0tlREK57LEBuZpte2YMcLywloUf9mMFp/XBfZhxBFIEgLWvWkA/nYHoG
 jctP+YuzvBP3Stew5Hg/jalr+ET5txVQ/IVSDT9DHq7aDnv9rdKGQGjqinjvUCqKSh
 t5I4lVgQs7pbv4go67N1QPjDhh+sKOaKFsU/dt0QqQEQ2sGxbDXe4tWiH5F37sqEYU
 CEJAQ5UUjfadRZG4U04S2hmn8S9Wzdd+kh+pq1/Zhj4ndOE9aULqnFGkxhgAaQLhBS
 jbY+ulJE875PN4v3bqL4OGsfA+gjvU+/BXpPN6SfThNGEvtb6ZYW5No3+oOhZZh4pG
 PBSie+cSr8u9w==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/39] drm/atomic: Get rid of existing states (not really)
Date: Tue, 09 Sep 2025 13:27:19 +0200
Message-Id: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABcPwGgC/43NQQ7CIBCF4as0rB1Dh9AUV97DuGhhaIkKBhpS0
 /Tu0m6MG+Pyf5l8s7BE0VFip2phkbJLLvgS4lAxPXZ+IHCmNEOOkrcowcQH+ACPEAlodmlyfoA
 0dROB6gVK1HUnRM8K8Ixk3bzjl2vpsVyH+Np/5Xpb/2JzDRwsb7U2yrZSq/ONoqf7McSBbW7Gj
 6U4/rSwWIZUa7W0jWmaL2td1zcXtIcXEQEAAA==
X-Change-ID: 20250825-drm-no-more-existing-state-9b3252c1a33b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org, 
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, linux-rockchip@lists.infradead.org, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5731; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Q7MJ6HuoxZjlAYgfu4R8+11tXMfLB78JEQFVmnR4+ik=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+GUuXKh5EtKUyyzoVj+da9081x9WWi3PNgkkCzesW
 pBzZRdLx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIuj1jnWI4n8bX5IMaIR59
 rg1225SSX4otdE16oid2/X3OFIs0savVqT9rPkdcflqnPMUrYNMlxloRqYV2c/mLDs9e66AS4a2
 yl/2L9OFTi17/nnT0/AqvJmbG49Oyi8QPpP73kpb/0nRnWysA
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

Here's a series to get rid of the drm_atomic_helper_get_existing_*_state
accessors.

The initial intent was to remove the __drm_*_state->state pointer to
only rely on old and new states, but we still need it now to know which
of the two we need to free: if a state has not been committed (either
dropped or checked only), then we need to free the new one, if it has
been committed we need to free the old state. 

Thus, the state pointer is kept (and documented) only to point to the
state we should free eventually.

All users have been converted to the relevant old or new state
accessors.  

This was tested on tidss.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Added an armada rework patch
- Added an ingenic fix
- Collected tags
- Rebased on latest drm-misc-next tag
- Link to v2: https://lore.kernel.org/r/20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org

Changes in v2:
- Dropped the first and second patches
- Reworked the recipient list to be nicer with SMTPs
- Link to v1: https://lore.kernel.org/r/20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org

---
Maxime Ripard (39):
      drm/atomic: Convert drm_atomic_get_connector_state() to use new connector state
      drm/atomic: Remove unused drm_atomic_get_existing_connector_state()
      drm/atomic: Document __drm_connectors_state state pointer
      drm/atomic: Convert __drm_atomic_get_current_plane_state() to modern accessor
      drm/atomic: Convert drm_atomic_get_plane_state() to use new plane state
      drm/vkms: Convert vkms_crtc_atomic_check() to use new plane state
      drm/tilcdc: crtc: Use drm_atomic_helper_check_crtc_primary_plane()
      drm/atomic: Remove unused drm_atomic_get_existing_plane_state()
      drm/atomic: Document __drm_planes_state state pointer
      drm/atomic: Convert drm_atomic_get_crtc_state() to use new connector state
      drm/ingenic: ipu: Switch to drm_atomic_get_new_crtc_state()
      drm/arm/malidp: Switch to drm_atomic_get_new_crtc_state()
      drm/armada: Drop always true condition in atomic_check
      drm/armada: Switch to drm_atomic_get_new_crtc_state()
      drm/atmel-hlcdc: Switch to drm_atomic_get_new_crtc_state()
      drm/exynos: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-dc: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-dcss: Switch to drm_atomic_get_new_crtc_state()
      drm/imx-ipuv3: Switch to drm_atomic_get_new_crtc_state()
      drm/ingenic: Switch to drm_atomic_get_new_crtc_state()
      drm/kmb: Switch to drm_atomic_get_new_crtc_state()
      drm/logicvc: Switch to drm_atomic_get_new_crtc_state()
      drm/loongson: Switch to drm_atomic_get_new_crtc_state()
      drm/mediatek: Switch to drm_atomic_get_new_crtc_state()
      drm/msm/mdp5: Switch to drm_atomic_get_new_crtc_state()
      drm/omap: Switch to drm_atomic_get_new_crtc_state()
      drm/rockchip: Switch to drm_atomic_get_new_crtc_state()
      drm/sun4i: Switch to drm_atomic_get_new_crtc_state()
      drm/tegra: Switch to drm_atomic_get_new_crtc_state()
      drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
      drm/vboxvideo: Switch to drm_atomic_get_new_crtc_state()
      drm/vc4: Switch to drm_atomic_get_new_crtc_state()
      drm/atomic: Switch to drm_atomic_get_new_crtc_state()
      drm/framebuffer: Switch to drm_atomic_get_new_crtc_state()
      drm/atomic: Remove unused drm_atomic_get_existing_crtc_state()
      drm/atomic: Document __drm_crtcs_state state pointer
      drm/ingenic: crtc: Switch to ingenic_drm_get_new_priv_state()
      drm/atomic: Convert drm_atomic_get_private_obj_state() to use new plane state
      drm/atomic: Document __drm_private_objs_state state pointer

 drivers/gpu/drm/arm/malidp_planes.c             |   2 +-
 drivers/gpu/drm/armada/armada_plane.c           |   9 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |   2 +-
 drivers/gpu/drm/drm_atomic.c                    |  21 ++--
 drivers/gpu/drm/drm_framebuffer.c               |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c       |   2 +-
 drivers/gpu/drm/imx/dc/dc-plane.c               |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c         |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c       |   5 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c           |   4 +-
 drivers/gpu/drm/kmb/kmb_plane.c                 |   3 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c         |   4 +-
 drivers/gpu/drm/loongson/lsdc_plane.c           |   2 +-
 drivers/gpu/drm/mediatek/mtk_plane.c            |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      |   7 +-
 drivers/gpu/drm/omapdrm/omap_plane.c            |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |   6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c          |   3 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c          |   3 +-
 drivers/gpu/drm/tegra/dc.c                      |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c            |   9 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c           |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c           |   8 +-
 drivers/gpu/drm/vc4/vc4_plane.c                 |   6 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                |   4 +-
 include/drm/drm_atomic.h                        | 144 ++++++++++++------------
 28 files changed, 126 insertions(+), 141 deletions(-)
---
base-commit: 2a1eea8fd601db4c52f0d14f8871663b7b052c91
change-id: 20250825-drm-no-more-existing-state-9b3252c1a33b

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

