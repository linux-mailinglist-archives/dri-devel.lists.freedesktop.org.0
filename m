Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1DB802D5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A8810E859;
	Wed, 17 Sep 2025 14:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MIwa8x9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD14F10E858;
 Wed, 17 Sep 2025 14:46:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B860560227;
 Wed, 17 Sep 2025 14:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC381C4CEF0;
 Wed, 17 Sep 2025 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120371;
 bh=QiXOszuUJaheRV8S9Arrs3CKQDXneHf83M7ZXth8QR4=;
 h=From:Subject:Date:To:Cc:From;
 b=MIwa8x9gHctSBJzz9zwPFWbclfLYWnLFUCKoJnI+49+anpgrnykmOdyUjTTvAbLkZ
 82mnCK4D4uDWlw4RIpC+5ERBSM1P5SR4ciJanNbxduEky/QciqERoB1qq1NED9XiSn
 66gB6tkJyjfAZDQrfQPzBle3VfJkdjxsSS4F24ej1n2WfyFEDXrDtnYMz1BhYgvAdE
 6O7kyVki6zaIYpXNAPRNVkX6gb9dEBPhchv6lIWzdkQjoqjXmsB015AvkbAdSVuJ0y
 aCJsawhoW8KjCtbxUdJx5ZTtm6WpZb6XyJBaNjU+g23ptMjyxWCIj1Z9Ci9qorSl8d
 Fy0HzdBvAOIKA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 00/39] drm/atomic: Get rid of existing states (not really)
Date: Wed, 17 Sep 2025 16:45:41 +0200
Message-Id: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXJymgC/43NQQ6CMBCF4auQrh1TWgvUlfcwLqCdQqO2piUEQ
 7i7hY0aE+Lyf5l8M5GIwWIkx2wiAQcbrXcpDruMqK52LYLVqQmjTNCKCdDhDs7D3QcEHG3srWs
 h9nWPIBvOBFN5zXlDEvAIaOy44udL6i5d+/Bcfw35sv7FDjlQMLRSSktTCSVPVwwOb3sfWrK4A
 3tbkrJNiyVLo6yMEqbQRfFj8U9Lblo8Wbkq61LLgirOv6x5nl/BcxAsXQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5910; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QiXOszuUJaheRV8S9Arrs3CKQDXneHf83M7ZXth8QR4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTs7nOfS799mbr9bv3QWVn5ovvPrUukglLeninLOyA
 R/m/WFW65jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATMeJlbHgVHJux/5lLmPAb
 rsdT1NM0Dn/JDXOK3CIpESl7v+b+5x1ai+viVEpeF7X81Wy2KQtqZWyYybN97q7MiwaiXzYWJTp
 ZHKzc3xN17e/JKRb7Pqd0/KjmNtjwSJFdl1GqyGg2q73RpDcA
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
Changes in v4:
- Fix ingenic
- Rebased on latest drm-misc-next tag
- Link to v3: https://lore.kernel.org/r/20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org

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
 drivers/gpu/drm/armada/armada_plane.c           |   7 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |   2 +-
 drivers/gpu/drm/drm_atomic.c                    |  21 ++--
 drivers/gpu/drm/drm_framebuffer.c               |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c       |   2 +-
 drivers/gpu/drm/imx/dc/dc-plane.c               |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c         |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c       |  13 ++-
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
 28 files changed, 132 insertions(+), 141 deletions(-)
---
base-commit: 91494dee1091a14d91da6bcb39e12a907765c793
change-id: 20250825-drm-no-more-existing-state-9b3252c1a33b

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

