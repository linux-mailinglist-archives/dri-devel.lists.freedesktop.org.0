Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1099427F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CB10E4AB;
	Tue,  8 Oct 2024 08:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2NIG70mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFD210E4AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 08:46:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cd74c0d16so55030325e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728377163; x=1728981963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aprNSwtvFDJOrp2+/fCpMOE6l3rHRi3nj0RVwvBpMIM=;
 b=2NIG70mFo1DXb2KwDGcDQ7M+ph12sKKQUqpj34yDaJexHZGAPwk+LI/vgMngVJN3qj
 nXtOClkADaHYYW0jZn18ehyyB0U02tnaxrrcGjF8RjghczOr+3o8nZwUB70MxpJPzvbg
 jRV6CJGB5p4b302bkKoWLOIY5yx0PrpFW89ilcljRuHWFD+yXbaeQzruZxbC62vmlKgV
 4qF8+sXk2aZjDi566Kq28wDYw4cUBnLcLoQoxEM+a4g8xoNBMgg83gwJz6MAN0XGhQxF
 7hVucl1vndEcGrF//GbwYEoqVIdFDQCDUP8KouPf+YOizJIGde+PWOnIMEsFzF3lC+sG
 7LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728377163; x=1728981963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aprNSwtvFDJOrp2+/fCpMOE6l3rHRi3nj0RVwvBpMIM=;
 b=mw4uj9oTtjiHQqm4UmISbKfhrsiWJR/OVDaTckMBrgnKupHbprlc+nkAvrjue9hIFz
 gSFASWQgFXcZ6QpEumy/vXM4ct/KXEgRwp3May3TenN9CSviGKR7UeocvDUGFOxcX836
 cDTvvqSjclB0WgqnpmfSwrMWTboJpbTjzkU+bTOZysmXuEtfKjXyhz3LFjIuqjE3JEvh
 pMYasOgcT67KeEflLjYztvmn62FB/21Zo0b2EEsDXdJCW+wSuAoH/q++dykC2e6crKbZ
 dvom/EY5nxORKiQP62sP7e1ys9fHOwgVmYv5vrifeYplZ51bDXqAAwbryeaDHIq+seA9
 6RPA==
X-Gm-Message-State: AOJu0YyfBbiUFfFfOVxjaElFFc4oVUEBrh05EWIH2rVZhQO5r1y0TkRH
 7U91I6y6R5LCg0tbloMc1z4PffD7D5TAVkKcBVYSh8gnbS63GPH6/NirIKjS3eo=
X-Google-Smtp-Source: AGHT+IGv1KybAEKCECoXc3ftXlbw9odwh/BOq6fqkQFZStEU0Xo6QOCQQLolo4v8XSKvGx9geg5QpA==
X-Received: by 2002:a05:600c:314d:b0:42c:b905:2c04 with SMTP id
 5b1f17b1804b1-42f85aa7b03mr98341225e9.12.1728377162773; 
 Tue, 08 Oct 2024 01:46:02 -0700 (PDT)
Received: from localhost
 (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de.
 [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f89eda21esm102500865e9.46.2024.10.08.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 01:46:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Switch back to struct platform_driver::remove()
Date: Tue,  8 Oct 2024 10:45:53 +0200
Message-ID: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=107991;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=XLI1ICa9a/HN30Y6WwA7j9mkM33wHmd2u8FBSoHAhpg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnBPFAgsQkGWMqsdYG4tihbfJbAXiFGefGWAfCE
 Qmf6SohylWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwTxQAAKCRCPgPtYfRL+
 Tkx1B/wLguUaGtp9LjZVAKPtryuc30X7Vz6Cd91UlXCrct54dzmnfNGTyjCVy/OtckNq0L8QCfD
 vghp23soYqdeajoO8EHyCF2MdQwp1dQLE9KMOJU3lsw7EgNMlBlQS+cx4JuI652osYuPkStPuyT
 LX1OlufyU6S88KfkZJKnJlj5572P2cyv/s96Y4hFqmcBnH9sw0WKlMHubBy9VK/ja1KqepW62t5
 tpZtMrH+bms+XB6PDQXao1hYCyMufAdfQ8UJTF8hglfZkftVR05gK6xFrXAqG8J5I9/yURDgI6+
 8ivOo9JHwNSNqEd497nLD+64oMxm9xGzhnXbog0MJ9mZXS89
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/gpu/drm/ to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on Friday's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c     | 2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c                     | 2 +-
 drivers/gpu/drm/arm/malidp_drv.c                    | 2 +-
 drivers/gpu/drm/armada/armada_crtc.c                | 2 +-
 drivers/gpu/drm/armada/armada_drv.c                 | 2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c             | 2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c        | 2 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c      | 2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
 drivers/gpu/drm/bridge/display-connector.c          | 2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                    | 2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c         | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 2 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c         | 2 +-
 drivers/gpu/drm/bridge/lvds-codec.c                 | 2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                    | 2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c               | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c       | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c  | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c               | 2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                  | 2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c               | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c               | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c               | 2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c       | 2 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c          | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                  | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c             | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c             | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c            | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c            | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c             | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c             | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c             | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c         | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c          | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c            | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c                | 2 +-
 drivers/gpu/drm/exynos/exynos_mixer.c               | 2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c           | 2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c        | 2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c     | 2 +-
 drivers/gpu/drm/imagination/pvr_drv.c               | 2 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c                 | 2 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c             | 2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c            | 2 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                 | 2 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                 | 2 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c              | 2 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c        | 2 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                 | 2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c           | 2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c               | 2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                       | 2 +-
 drivers/gpu/drm/lima/lima_drv.c                     | 2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c               | 2 +-
 drivers/gpu/drm/mcde/mcde_drv.c                     | 2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                     | 2 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c           | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c     | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c            | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c              | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c              | 2 +-
 drivers/gpu/drm/meson/meson_drv.c                   | 2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c               | 2 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c           | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c          | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c            | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c            | 2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                 | 2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                       | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                     | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                 | 2 +-
 drivers/gpu/drm/msm/msm_drv.c                       | 2 +-
 drivers/gpu/drm/msm/msm_mdss.c                      | 2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                   | 2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c          | 2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                 | 2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                   | 2 +-
 drivers/gpu/drm/omapdrm/dss/dss.c                   | 2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                 | 2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                 | 2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                  | 2 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c            | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                  | 2 +-
 drivers/gpu/drm/panel/panel-edp.c                   | 2 +-
 drivers/gpu/drm/panel/panel-lvds.c                  | 2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c         | 2 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c     | 2 +-
 drivers/gpu/drm/panel/panel-simple.c                | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c             | 2 +-
 drivers/gpu/drm/panthor/panthor_drv.c               | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c          | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c       | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c      | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     | 2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c        | 2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 2 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c    | 2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c     | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c              | 2 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c     | 2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c         | 2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c                | 2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c         | 2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c            | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c        | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c         | 2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                     | 2 +-
 drivers/gpu/drm/sprd/sprd_drm.c                     | 2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c                     | 2 +-
 drivers/gpu/drm/sti/sti_compositor.c                | 2 +-
 drivers/gpu/drm/sti/sti_drv.c                       | 2 +-
 drivers/gpu/drm/sti/sti_dvo.c                       | 2 +-
 drivers/gpu/drm/sti/sti_hda.c                       | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                      | 2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                     | 2 +-
 drivers/gpu/drm/sti/sti_tvout.c                     | 2 +-
 drivers/gpu/drm/stm/drv.c                           | 2 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c               | 2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c               | 2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c                   | 2 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c              | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c              | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                  | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                    | 2 +-
 drivers/gpu/drm/sun4i/sun6i_drc.c                   | 2 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c              | 2 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c               | 2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                 | 2 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c              | 2 +-
 drivers/gpu/drm/tegra/dc.c                          | 2 +-
 drivers/gpu/drm/tegra/dpaux.c                       | 2 +-
 drivers/gpu/drm/tegra/dsi.c                         | 2 +-
 drivers/gpu/drm/tegra/gr2d.c                        | 2 +-
 drivers/gpu/drm/tegra/gr3d.c                        | 2 +-
 drivers/gpu/drm/tegra/hdmi.c                        | 2 +-
 drivers/gpu/drm/tegra/hub.c                         | 2 +-
 drivers/gpu/drm/tegra/nvdec.c                       | 2 +-
 drivers/gpu/drm/tegra/sor.c                         | 2 +-
 drivers/gpu/drm/tegra/vic.c                         | 2 +-
 drivers/gpu/drm/tidss/tidss_drv.c                   | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                 | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c               | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                       | 2 +-
 drivers/gpu/drm/tiny/ofdrm.c                        | 2 +-
 drivers/gpu/drm/tiny/simpledrm.c                    | 2 +-
 drivers/gpu/drm/tve200/tve200_drv.c                 | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                      | 2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                      | 2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                       | 2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                       | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                 | 2 +-
 183 files changed, 183 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 6d475bb34002..d981d721e796 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -153,7 +153,7 @@ static const struct dev_pm_ops komeda_pm_ops = {
 
 static struct platform_driver komeda_platform_driver = {
 	.probe	= komeda_platform_probe,
-	.remove_new = komeda_platform_remove,
+	.remove = komeda_platform_remove,
 	.shutdown = komeda_platform_shutdown,
 	.driver	= {
 		.name = "komeda",
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index f5d358f3893b..64ac6653ee0b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -405,7 +405,7 @@ static SIMPLE_DEV_PM_OPS(hdlcd_pm_ops, hdlcd_pm_suspend, hdlcd_pm_resume);
 
 static struct platform_driver hdlcd_platform_driver = {
 	.probe		= hdlcd_probe,
-	.remove_new	= hdlcd_remove,
+	.remove		= hdlcd_remove,
 	.shutdown	= hdlcd_shutdown,
 	.driver	= {
 		.name = "hdlcd",
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 4cb25004b84f..fd2be80f3bf5 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -988,7 +988,7 @@ static const struct dev_pm_ops malidp_pm_ops = {
 
 static struct platform_driver malidp_platform_driver = {
 	.probe		= malidp_platform_probe,
-	.remove_new	= malidp_platform_remove,
+	.remove		= malidp_platform_remove,
 	.shutdown	= malidp_platform_shutdown,
 	.driver	= {
 		.name = "mali-dp",
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index c78687c755a8..0900e4466ffb 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -1084,7 +1084,7 @@ MODULE_DEVICE_TABLE(platform, armada_lcd_platform_ids);
 
 struct platform_driver armada_lcd_platform_driver = {
 	.probe	= armada_lcd_probe,
-	.remove_new = armada_lcd_remove,
+	.remove = armada_lcd_remove,
 	.driver = {
 		.name	= "armada-lcd",
 		.owner	=  THIS_MODULE,
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 3dc5f0499e4c..51f94b4859d8 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -250,7 +250,7 @@ MODULE_DEVICE_TABLE(platform, armada_drm_platform_ids);
 
 static struct platform_driver armada_drm_platform_driver = {
 	.probe	= armada_drm_probe,
-	.remove_new = armada_drm_remove,
+	.remove = armada_drm_remove,
 	.shutdown = armada_drm_shutdown,
 	.driver	= {
 		.name	= "armada-drm",
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 109023815fa2..b7e608ba6194 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -368,7 +368,7 @@ static void aspeed_gfx_shutdown(struct platform_device *pdev)
 
 static struct platform_driver aspeed_gfx_platform_driver = {
 	.probe		= aspeed_gfx_probe,
-	.remove_new	= aspeed_gfx_remove,
+	.remove		= aspeed_gfx_remove,
 	.shutdown	= aspeed_gfx_shutdown,
 	.driver = {
 		.name = "aspeed_gfx",
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 792dcc19e8e7..7b209af7cf45 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -937,7 +937,7 @@ static const struct of_device_id atmel_hlcdc_dc_of_match[] = {
 
 static struct platform_driver atmel_hlcdc_dc_platform_driver = {
 	.probe	= atmel_hlcdc_dc_drm_probe,
-	.remove_new = atmel_hlcdc_dc_drm_remove,
+	.remove = atmel_hlcdc_dc_drm_remove,
 	.shutdown = atmel_hlcdc_dc_drm_shutdown,
 	.driver	= {
 		.name	= "atmel-hlcdc-display-controller",
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..c7a0247e06ad 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1300,7 +1300,7 @@ MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
 
 static struct platform_driver cdns_dsi_platform_driver = {
 	.probe  = cdns_dsi_drm_probe,
-	.remove_new = cdns_dsi_drm_remove,
+	.remove = cdns_dsi_drm_remove,
 	.driver = {
 		.name   = "cdns-dsi",
 		.of_match_table = cdns_dsi_of_match,
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 41f72d458487..d081850e3c03 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2656,7 +2656,7 @@ static struct platform_driver mhdp_driver = {
 		.of_match_table	= mhdp_ids,
 	},
 	.probe	= cdns_mhdp_probe,
-	.remove_new = cdns_mhdp_remove,
+	.remove = cdns_mhdp_remove,
 };
 module_platform_driver(mhdp_driver);
 
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index ab8e00baf3f1..b8f6491b2b4d 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -423,7 +423,7 @@ MODULE_DEVICE_TABLE(of, display_connector_match);
 
 static struct platform_driver display_connector_driver = {
 	.probe	= display_connector_probe,
-	.remove_new = display_connector_remove,
+	.remove = display_connector_remove,
 	.driver		= {
 		.name		= "display-connector",
 		.of_match_table	= display_connector_match,
diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 0e4bac7dd04f..0fc8a14fd800 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -393,7 +393,7 @@ MODULE_DEVICE_TABLE(of, fsl_ldb_match);
 
 static struct platform_driver fsl_ldb_driver = {
 	.probe	= fsl_ldb_probe,
-	.remove_new = fsl_ldb_remove,
+	.remove = fsl_ldb_remove,
 	.driver		= {
 		.name		= "fsl-ldb",
 		.of_match_table	= fsl_ldb_match,
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 073e64dc200c..0d1ac3edcab4 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -193,7 +193,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pvi_match);
 
 static struct platform_driver imx8mp_hdmi_pvi_driver = {
 	.probe	= imx8mp_hdmi_pvi_probe,
-	.remove_new = imx8mp_hdmi_pvi_remove,
+	.remove = imx8mp_hdmi_pvi_remove,
 	.driver		= {
 		.name = "imx-hdmi-pvi",
 		.of_match_table	= imx8mp_hdmi_pvi_match,
diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8fcc6d18f4ab..1e7a789ec289 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -144,7 +144,7 @@ MODULE_DEVICE_TABLE(of, imx8mp_dw_hdmi_of_table);
 
 static struct platform_driver imx8mp_dw_hdmi_platform_driver = {
 	.probe		= imx8mp_dw_hdmi_probe,
-	.remove_new	= imx8mp_dw_hdmi_remove,
+	.remove		= imx8mp_dw_hdmi_remove,
 	.driver		= {
 		.name	= "imx8mp-dw-hdmi-tx",
 		.of_match_table = imx8mp_dw_hdmi_of_table,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index c879e37f5811..dd5823f04c70 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -570,7 +570,7 @@ MODULE_DEVICE_TABLE(of, imx8qm_ldb_dt_ids);
 
 static struct platform_driver imx8qm_ldb_driver = {
 	.probe	= imx8qm_ldb_probe,
-	.remove_new = imx8qm_ldb_remove,
+	.remove = imx8qm_ldb_remove,
 	.driver	= {
 		.pm = pm_ptr(&imx8qm_ldb_pm_ops),
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index b33011f397f0..7bce2305d676 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -706,7 +706,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_ldb_dt_ids);
 
 static struct platform_driver imx8qxp_ldb_driver = {
 	.probe	= imx8qxp_ldb_probe,
-	.remove_new = imx8qxp_ldb_remove,
+	.remove = imx8qxp_ldb_remove,
 	.driver	= {
 		.pm = pm_ptr(&imx8qxp_ldb_pm_ops),
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index ce43e4069e21..1812bd106261 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -427,7 +427,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pc_dt_ids);
 
 static struct platform_driver imx8qxp_pc_bridge_driver = {
 	.probe	= imx8qxp_pc_bridge_probe,
-	.remove_new = imx8qxp_pc_bridge_remove,
+	.remove = imx8qxp_pc_bridge_remove,
 	.driver	= {
 		.pm = pm_ptr(&imx8qxp_pc_pm_ops),
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 1d11cc1df43c..4b0715ed6f38 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -409,7 +409,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pixel_link_dt_ids);
 
 static struct platform_driver imx8qxp_pixel_link_bridge_driver = {
 	.probe	= imx8qxp_pixel_link_bridge_probe,
-	.remove_new = imx8qxp_pixel_link_bridge_remove,
+	.remove = imx8qxp_pixel_link_bridge_remove,
 	.driver	= {
 		.of_match_table = imx8qxp_pixel_link_dt_ids,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index fb7cf4369bb8..65cf3a6c8ec6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -467,7 +467,7 @@ MODULE_DEVICE_TABLE(of, imx8qxp_pxl2dpi_dt_ids);
 
 static struct platform_driver imx8qxp_pxl2dpi_bridge_driver = {
 	.probe	= imx8qxp_pxl2dpi_bridge_probe,
-	.remove_new = imx8qxp_pxl2dpi_bridge_remove,
+	.remove = imx8qxp_pxl2dpi_bridge_remove,
 	.driver	= {
 		.of_match_table = imx8qxp_pxl2dpi_dt_ids,
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 2347f8dd632f..bea8346515b8 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -904,7 +904,7 @@ MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
 
 static struct platform_driver imx93_dsi_driver = {
 	.probe	= imx93_dsi_probe,
-	.remove_new = imx93_dsi_remove,
+	.remove = imx93_dsi_remove,
 	.driver	= {
 		.of_match_table = imx93_dsi_dt_ids,
 		.name = "imx93_mipi_dsi",
diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 991732c4b629..389af0233fcd 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -236,7 +236,7 @@ MODULE_DEVICE_TABLE(of, lvds_codec_match);
 
 static struct platform_driver lvds_codec_driver = {
 	.probe	= lvds_codec_probe,
-	.remove_new = lvds_codec_remove,
+	.remove = lvds_codec_remove,
 	.driver		= {
 		.name		= "lvds-codec",
 		.of_match_table	= lvds_codec_match,
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 5f05647a3bea..1e5b2a37cb8c 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1211,7 +1211,7 @@ static void nwl_dsi_remove(struct platform_device *pdev)
 
 static struct platform_driver nwl_dsi_driver = {
 	.probe		= nwl_dsi_probe,
-	.remove_new	= nwl_dsi_remove,
+	.remove		= nwl_dsi_remove,
 	.driver		= {
 		.of_match_table = nwl_dsi_dt_ids,
 		.name	= DRV_NAME,
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4416d0be7272..f8b4fb835765 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -2139,7 +2139,7 @@ MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
 
 static struct platform_driver samsung_dsim_driver = {
 	.probe = samsung_dsim_probe,
-	.remove_new = samsung_dsim_remove,
+	.remove = samsung_dsim_remove,
 	.driver = {
 		   .name = "samsung-dsim",
 		   .pm = pm_ptr(&samsung_dsim_pm_ops),
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 221e9a4edb40..cf1f66b7b192 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -645,7 +645,7 @@ static SIMPLE_DEV_PM_OPS(snd_dw_hdmi_pm, snd_dw_hdmi_suspend,
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
-	.remove_new = snd_dw_hdmi_remove,
+	.remove = snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 		.pm = PM_OPS,
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index d4614de1ae1e..9549dabde941 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -346,7 +346,7 @@ static const struct dev_pm_ops dw_hdmi_cec_pm = {
 
 static struct platform_driver dw_hdmi_cec_driver = {
 	.probe	= dw_hdmi_cec_probe,
-	.remove_new = dw_hdmi_cec_remove,
+	.remove = dw_hdmi_cec_remove,
 	.driver = {
 		.name = "dw-hdmi-cec",
 		.pm = pm_ptr(&dw_hdmi_cec_pm),
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
index 423762da2ab4..ab18f9a3bf23 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
@@ -181,7 +181,7 @@ static void snd_dw_hdmi_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
-	.remove_new = snd_dw_hdmi_remove,
+	.remove = snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 	},
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 26c187d20d97..f1c5a8d0fa90 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -225,7 +225,7 @@ static void snd_dw_hdmi_remove(struct platform_device *pdev)
 
 static struct platform_driver snd_dw_hdmi_driver = {
 	.probe	= snd_dw_hdmi_probe,
-	.remove_new = snd_dw_hdmi_remove,
+	.remove = snd_dw_hdmi_remove,
 	.driver	= {
 		.name = DRIVER_NAME,
 	},
diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 674efc489e3a..bba10cf9b4f9 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -230,7 +230,7 @@ MODULE_DEVICE_TABLE(of, thc63_match);
 
 static struct platform_driver thc63_driver = {
 	.probe	= thc63_probe,
-	.remove_new = thc63_remove,
+	.remove = thc63_remove,
 	.driver	= {
 		.name		= "thc63lvd1024",
 		.of_match_table	= thc63_match,
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b1b1e4d5a24a..107a2c0b96c9 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -406,7 +406,7 @@ MODULE_DEVICE_TABLE(of, tfp410_match);
 
 static struct platform_driver tfp410_platform_driver = {
 	.probe	= tfp410_probe,
-	.remove_new = tfp410_remove,
+	.remove = tfp410_remove,
 	.driver	= {
 		.name		= "tfp410-bridge",
 		.of_match_table	= tfp410_match,
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index f9fb35683a27..47b74cb25b14 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -195,7 +195,7 @@ MODULE_DEVICE_TABLE(of, tpd12s015_of_match);
 
 static struct platform_driver tpd12s015_driver = {
 	.probe	= tpd12s015_probe,
-	.remove_new = tpd12s015_remove,
+	.remove = tpd12s015_remove,
 	.driver	= {
 		.name	= "tpd12s015",
 		.of_match_table = tpd12s015_of_match,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..f646cdcec12f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -658,7 +658,7 @@ static void etnaviv_pdev_remove(struct platform_device *pdev)
 
 static struct platform_driver etnaviv_platform_driver = {
 	.probe      = etnaviv_pdev_probe,
-	.remove_new = etnaviv_pdev_remove,
+	.remove     = etnaviv_pdev_remove,
 	.driver     = {
 		.name   = "etnaviv",
 	},
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..97fc4b24cbe8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1991,6 +1991,6 @@ struct platform_driver etnaviv_gpu_driver = {
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-	.remove_new = etnaviv_gpu_platform_remove,
+	.remove = etnaviv_gpu_platform_remove,
 	.id_table = gpu_ids,
 };
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 0ef7bc8848b0..b9e206303b48 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -871,7 +871,7 @@ static void exynos5433_decon_remove(struct platform_device *pdev)
 
 struct platform_driver exynos5433_decon_driver = {
 	.probe		= exynos5433_decon_probe,
-	.remove_new	= exynos5433_decon_remove,
+	.remove		= exynos5433_decon_remove,
 	.driver		= {
 		.name	= "exynos5433-decon",
 		.pm	= pm_ptr(&exynos5433_decon_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 0d185c0564b9..671ea2de28b7 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -838,7 +838,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos7_decon_pm_ops, exynos7_decon_suspend,
 
 struct platform_driver decon_driver = {
 	.probe		= decon_probe,
-	.remove_new	= decon_remove,
+	.remove		= decon_remove,
 	.driver		= {
 		.name	= "exynos-decon",
 		.pm	= pm_ptr(&exynos7_decon_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 22142b293279..5bcf41e0bd04 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -279,7 +279,7 @@ MODULE_DEVICE_TABLE(of, exynos_dp_match);
 
 struct platform_driver dp_driver = {
 	.probe		= exynos_dp_probe,
-	.remove_new	= exynos_dp_remove,
+	.remove		= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
 		.pm	= pm_ptr(&exynos_dp_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 2a466d8179f4..1c44f85c5f54 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -363,7 +363,7 @@ static void exynos_drm_platform_shutdown(struct platform_device *pdev)
 
 static struct platform_driver exynos_drm_platform_driver = {
 	.probe	= exynos_drm_platform_probe,
-	.remove_new	= exynos_drm_platform_remove,
+	.remove		= exynos_drm_platform_remove,
 	.shutdown = exynos_drm_platform_shutdown,
 	.driver	= {
 		.name	= "exynos-drm",
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index bf16deaae68b..896a03639e2d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -181,7 +181,7 @@ MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 struct platform_driver dsi_driver = {
 	.probe = samsung_dsim_probe,
-	.remove_new = samsung_dsim_remove,
+	.remove = samsung_dsim_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .pm = &samsung_dsim_pm_ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 4d7ea65b7dd8..b150cfd92f6e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1408,7 +1408,7 @@ MODULE_DEVICE_TABLE(of, fimc_of_match);
 
 struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
-	.remove_new	= fimc_remove,
+	.remove		= fimc_remove,
 	.driver		= {
 		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f57df8c48139..1ad87584b1c2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1323,7 +1323,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(exynos_fimd_pm_ops, exynos_fimd_suspend,
 
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
-	.remove_new	= fimd_remove,
+	.remove		= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
 		.pm	= pm_ptr(&exynos_fimd_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 3a3b2c00e400..d32f2474cbaa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1607,7 +1607,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
 
 struct platform_driver g2d_driver = {
 	.probe		= g2d_probe,
-	.remove_new	= g2d_remove,
+	.remove		= g2d_remove,
 	.driver		= {
 		.name	= "exynos-drm-g2d",
 		.pm	= pm_ptr(&g2d_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 59fa22050717..6615fa929c52 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1420,7 +1420,7 @@ MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);
 
 struct platform_driver gsc_driver = {
 	.probe		= gsc_probe,
-	.remove_new	= gsc_remove,
+	.remove		= gsc_remove,
 	.driver		= {
 		.name	= "exynos-drm-gsc",
 		.pm	= &gsc_pm_ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index d61ec451807c..b34ec6728337 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -460,7 +460,7 @@ MODULE_DEVICE_TABLE(of, exynos_mic_of_match);
 
 struct platform_driver mic_driver = {
 	.probe		= exynos_mic_probe,
-	.remove_new	= exynos_mic_remove,
+	.remove		= exynos_mic_remove,
 	.driver		= {
 		.name	= "exynos-mic",
 		.pm	= pm_ptr(&exynos_mic_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 2eb0b701672f..7b0f4a98a70a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -451,7 +451,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(rotator_pm_ops, rotator_runtime_suspend,
 
 struct platform_driver rotator_driver = {
 	.probe		= rotator_probe,
-	.remove_new	= rotator_remove,
+	.remove		= rotator_remove,
 	.driver		= {
 		.name	= "exynos-rotator",
 		.pm	= pm_ptr(&rotator_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 2788105ac780..c8a1b6b0a29c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -719,7 +719,7 @@ MODULE_DEVICE_TABLE(of, exynos_scaler_match);
 
 struct platform_driver scaler_driver = {
 	.probe		= scaler_probe,
-	.remove_new	= scaler_remove,
+	.remove		= scaler_remove,
 	.driver		= {
 		.name	= "exynos-scaler",
 		.pm	= pm_ptr(&scaler_pm_ops),
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 6de0cced6c9d..fd388b1dbe68 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -467,7 +467,7 @@ static void vidi_remove(struct platform_device *pdev)
 
 struct platform_driver vidi_driver = {
 	.probe		= vidi_probe,
-	.remove_new	= vidi_remove,
+	.remove		= vidi_remove,
 	.driver		= {
 		.name	= "exynos-drm-vidi",
 		.dev_groups = vidi_groups,
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df9..466a9e514aa1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2126,7 +2126,7 @@ static const struct dev_pm_ops exynos_hdmi_pm_ops = {
 
 struct platform_driver hdmi_driver = {
 	.probe		= hdmi_probe,
-	.remove_new	= hdmi_remove,
+	.remove		= hdmi_remove,
 	.driver		= {
 		.name	= "exynos-hdmi",
 		.pm	= &exynos_hdmi_pm_ops,
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 1db955f00044..a3670d2eaab2 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1335,5 +1335,5 @@ struct platform_driver mixer_driver = {
 		.of_match_table = mixer_match_types,
 	},
 	.probe = mixer_probe,
-	.remove_new = mixer_remove,
+	.remove = mixer_remove,
 };
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 2b3f15f0dc56..cd25d0586114 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -367,7 +367,7 @@ static void fsl_dcu_drm_shutdown(struct platform_device *pdev)
 
 static struct platform_driver fsl_dcu_drm_platform_driver = {
 	.probe		= fsl_dcu_drm_probe,
-	.remove_new	= fsl_dcu_drm_remove,
+	.remove		= fsl_dcu_drm_remove,
 	.shutdown	= fsl_dcu_drm_shutdown,
 	.driver		= {
 		.name	= "fsl-dcu",
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index a39cc549c20b..2eea9fb0e76b 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -889,7 +889,7 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 
 static struct platform_driver dsi_driver = {
 	.probe = dsi_probe,
-	.remove_new = dsi_remove,
+	.remove = dsi_remove,
 	.driver = {
 		.name = "dw-dsi",
 		.of_match_table = dsi_of_match,
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 86a3a1faff49..b3ab944652a6 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -302,7 +302,7 @@ MODULE_DEVICE_TABLE(of, kirin_drm_dt_ids);
 
 static struct platform_driver kirin_drm_platform_driver = {
 	.probe = kirin_drm_platform_probe,
-	.remove_new = kirin_drm_platform_remove,
+	.remove = kirin_drm_platform_remove,
 	.shutdown = kirin_drm_platform_shutdown,
 	.driver = {
 		.name = "kirin-drm",
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 684a9b9a2247..6a27318ecb82 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1482,7 +1482,7 @@ static const struct dev_pm_ops pvr_pm_ops = {
 
 static struct platform_driver pvr_driver = {
 	.probe = pvr_probe,
-	.remove_new = pvr_remove,
+	.remove = pvr_remove,
 	.driver = {
 		.name = PVR_DRIVER_NAME,
 		.pm = &pvr_pm_ops,
diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index d881f5a34760..19b027cc1dc4 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -112,7 +112,7 @@ MODULE_DEVICE_TABLE(of, dcss_of_match);
 
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
-	.remove_new = dcss_drv_platform_remove,
+	.remove = dcss_drv_platform_remove,
 	.shutdown = dcss_drv_platform_shutdown,
 	.driver	= {
 		.name = "imx-dcss",
diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index 0006ea52b83c..8333c4bf7369 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -265,7 +265,7 @@ static void dw_hdmi_imx_remove(struct platform_device *pdev)
 
 static struct platform_driver dw_hdmi_imx_platform_driver = {
 	.probe  = dw_hdmi_imx_probe,
-	.remove_new = dw_hdmi_imx_remove,
+	.remove = dw_hdmi_imx_remove,
 	.driver = {
 		.name = "dwhdmi-imx",
 		.of_match_table = dw_hdmi_imx_dt_ids,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ced06bd8eae8..5f2c93c3c288 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -325,7 +325,7 @@ MODULE_DEVICE_TABLE(of, imx_drm_dt_ids);
 
 static struct platform_driver imx_drm_pdrv = {
 	.probe		= imx_drm_platform_probe,
-	.remove_new	= imx_drm_platform_remove,
+	.remove		= imx_drm_platform_remove,
 	.shutdown	= imx_drm_platform_shutdown,
 	.driver		= {
 		.name	= "imx-drm",
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index ff74018ac5cd..6be7a57ad03d 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -632,7 +632,7 @@ static void imx_ldb_remove(struct platform_device *pdev)
 
 static struct platform_driver imx_ldb_driver = {
 	.probe		= imx_ldb_probe,
-	.remove_new	= imx_ldb_remove,
+	.remove		= imx_ldb_remove,
 	.driver		= {
 		.of_match_table = imx_ldb_dt_ids,
 		.name	= DRIVER_NAME,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index d46d07d25f51..3a3c8a195119 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -662,7 +662,7 @@ MODULE_DEVICE_TABLE(of, imx_tve_dt_ids);
 
 static struct platform_driver imx_tve_driver = {
 	.probe		= imx_tve_probe,
-	.remove_new	= imx_tve_remove,
+	.remove		= imx_tve_remove,
 	.driver		= {
 		.of_match_table = imx_tve_dt_ids,
 		.name	= "imx-tve",
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 99db53e167bd..cf7b02b2d52c 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -449,5 +449,5 @@ struct platform_driver ipu_drm_driver = {
 		.name = "imx-ipuv3-crtc",
 	},
 	.probe = ipu_drm_probe,
-	.remove_new = ipu_drm_remove,
+	.remove = ipu_drm_remove,
 };
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 70f62e89622e..9e66eb77b1eb 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -273,7 +273,7 @@ MODULE_DEVICE_TABLE(of, imx_pd_dt_ids);
 
 static struct platform_driver imx_pd_driver = {
 	.probe		= imx_pd_probe,
-	.remove_new	= imx_pd_remove,
+	.remove		= imx_pd_remove,
 	.driver		= {
 		.of_match_table = imx_pd_dt_ids,
 		.name	= "imx-parallel-display",
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 3215c4acd675..fa7d44623c52 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -527,7 +527,7 @@ static struct platform_driver imx_lcdc_driver = {
 		.of_match_table = imx_lcdc_of_dev_id,
 	},
 	.probe = imx_lcdc_probe,
-	.remove_new = imx_lcdc_remove,
+	.remove = imx_lcdc_remove,
 	.shutdown = imx_lcdc_shutdown,
 };
 module_platform_driver(imx_lcdc_driver);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 056b70b63554..8469e1e5e582 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1632,7 +1632,7 @@ static struct platform_driver ingenic_drm_driver = {
 		.of_match_table = of_match_ptr(ingenic_drm_of_match),
 	},
 	.probe = ingenic_drm_probe,
-	.remove_new = ingenic_drm_remove,
+	.remove = ingenic_drm_remove,
 	.shutdown = ingenic_drm_shutdown,
 };
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 5bd9072352b5..26ebf424d63e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -991,7 +991,7 @@ static struct platform_driver ingenic_ipu_driver = {
 		.of_match_table = ingenic_ipu_of_match,
 	},
 	.probe = ingenic_ipu_probe,
-	.remove_new = ingenic_ipu_remove,
+	.remove = ingenic_ipu_remove,
 };
 
 struct platform_driver *ingenic_ipu_driver_ptr = &ingenic_ipu_driver;
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 0274ab9caa85..a3d31de761cb 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -622,7 +622,7 @@ static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 
 static struct platform_driver kmb_platform_driver = {
 	.probe = kmb_probe,
-	.remove_new = kmb_remove,
+	.remove = kmb_remove,
 	.driver = {
 		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 10bce18b7c31..fb3062c872b3 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -488,7 +488,7 @@ static const struct dev_pm_ops lima_pm_ops = {
 
 static struct platform_driver lima_platform_driver = {
 	.probe      = lima_pdev_probe,
-	.remove_new = lima_pdev_remove,
+	.remove     = lima_pdev_remove,
 	.driver     = {
 		.name   = "lima",
 		.pm	= &lima_pm_ops,
diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index e4d90701b29d..fb9de5e0bc0e 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -491,7 +491,7 @@ MODULE_DEVICE_TABLE(of, logicvc_drm_of_table);
 
 static struct platform_driver logicvc_drm_platform_driver = {
 	.probe		= logicvc_drm_probe,
-	.remove_new	= logicvc_drm_remove,
+	.remove		= logicvc_drm_remove,
 	.shutdown	= logicvc_drm_shutdown,
 	.driver		= {
 		.name		= "logicvc-drm",
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index f60bdd7b6c13..c4d51f5f038d 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -483,7 +483,7 @@ static struct platform_driver mcde_driver = {
 		.of_match_table = mcde_of_match,
 	},
 	.probe = mcde_probe,
-	.remove_new = mcde_remove,
+	.remove = mcde_remove,
 	.shutdown = mcde_shutdown,
 };
 
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index e2fad1a048b5..395449a72f0a 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1229,5 +1229,5 @@ struct platform_driver mcde_dsi_driver = {
 		.of_match_table = mcde_dsi_of_match,
 	},
 	.probe = mcde_dsi_probe,
-	.remove_new = mcde_dsi_remove,
+	.remove = mcde_dsi_remove,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index 2de248443147..b42c0d87eba3 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -241,7 +241,7 @@ MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
 
 struct platform_driver mtk_cec_driver = {
 	.probe = mtk_cec_probe,
-	.remove_new = mtk_cec_remove,
+	.remove = mtk_cec_remove,
 	.driver = {
 		.name = "mediatek-cec",
 		.of_match_table = mtk_cec_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 59fb9a08d54b..abc9e5525d03 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -218,7 +218,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
 
 struct platform_driver mtk_disp_aal_driver = {
 	.probe		= mtk_disp_aal_probe,
-	.remove_new	= mtk_disp_aal_remove,
+	.remove		= mtk_disp_aal_remove,
 	.driver		= {
 		.name	= "mediatek-disp-aal",
 		.of_match_table = mtk_disp_aal_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 9b75727e0861..10d60d2c2a56 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -209,7 +209,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
 
 struct platform_driver mtk_disp_ccorr_driver = {
 	.probe		= mtk_disp_ccorr_probe,
-	.remove_new	= mtk_disp_ccorr_remove,
+	.remove		= mtk_disp_ccorr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ccorr",
 		.of_match_table = mtk_disp_ccorr_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 2fd5e7dc9e24..dd8433a38282 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -159,7 +159,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
 
 struct platform_driver mtk_disp_color_driver = {
 	.probe		= mtk_disp_color_probe,
-	.remove_new	= mtk_disp_color_remove,
+	.remove		= mtk_disp_color_remove,
 	.driver		= {
 		.name	= "mediatek-disp-color",
 		.of_match_table = mtk_disp_color_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index f0b38817ba6c..b17b11d93846 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -329,7 +329,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
 
 struct platform_driver mtk_disp_gamma_driver = {
 	.probe		= mtk_disp_gamma_probe,
-	.remove_new	= mtk_disp_gamma_remove,
+	.remove		= mtk_disp_gamma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-gamma",
 		.of_match_table = mtk_disp_gamma_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 435e5d9c8520..563b1b248fbb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -370,7 +370,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
 
 struct platform_driver mtk_disp_merge_driver = {
 	.probe = mtk_disp_merge_probe,
-	.remove_new = mtk_disp_merge_remove,
+	.remove = mtk_disp_merge_remove,
 	.driver = {
 		.name = "mediatek-disp-merge",
 		.of_match_table = mtk_disp_merge_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..5ca041ccb1d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -710,7 +710,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
 
 struct platform_driver mtk_disp_ovl_driver = {
 	.probe		= mtk_disp_ovl_probe,
-	.remove_new	= mtk_disp_ovl_remove,
+	.remove		= mtk_disp_ovl_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl",
 		.of_match_table = mtk_disp_ovl_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c6768210b08b..a11d4c7b60ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -625,7 +625,7 @@ static void mtk_disp_ovl_adaptor_remove(struct platform_device *pdev)
 
 struct platform_driver mtk_disp_ovl_adaptor_driver = {
 	.probe		= mtk_disp_ovl_adaptor_probe,
-	.remove_new	= mtk_disp_ovl_adaptor_remove,
+	.remove		= mtk_disp_ovl_adaptor_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl-adaptor",
 	},
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 07243f372260..bf47790e4d6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -417,7 +417,7 @@ MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
 
 struct platform_driver mtk_disp_rdma_driver = {
 	.probe		= mtk_disp_rdma_probe,
-	.remove_new	= mtk_disp_rdma_remove,
+	.remove		= mtk_disp_rdma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-rdma",
 		.of_match_table = mtk_disp_rdma_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d8796a904eca..eb256b5519dd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2816,7 +2816,7 @@ MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
 
 static struct platform_driver mtk_dp_driver = {
 	.probe = mtk_dp_probe,
-	.remove_new = mtk_dp_remove,
+	.remove = mtk_dp_remove,
 	.driver = {
 		.name = "mediatek-drm-dp",
 		.of_match_table = mtk_dp_of_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index a08d20654954..14d04ea2daa1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1101,7 +1101,7 @@ MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
 
 struct platform_driver mtk_dpi_driver = {
 	.probe = mtk_dpi_probe,
-	.remove_new = mtk_dpi_remove,
+	.remove = mtk_dpi_remove,
 	.driver = {
 		.name = "mediatek-dpi",
 		.of_match_table = mtk_dpi_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a4594f8873d5..f97ca3f053c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1011,7 +1011,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops = {
 
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
-	.remove_new = mtk_drm_remove,
+	.remove = mtk_drm_remove,
 	.shutdown = mtk_drm_shutdown,
 	.driver	= {
 		.name	= "mediatek-drm",
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index eeec641cab60..47bb5b7a266a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1293,7 +1293,7 @@ MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
 
 struct platform_driver mtk_dsi_driver = {
 	.probe = mtk_dsi_probe,
-	.remove_new = mtk_dsi_remove,
+	.remove = mtk_dsi_remove,
 	.driver = {
 		.name = "mtk-dsi",
 		.of_match_table = mtk_dsi_of_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index d1d9cf8b10e1..13e70851f486 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -381,7 +381,7 @@ MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
 
 struct platform_driver mtk_ethdr_driver = {
 	.probe		= mtk_ethdr_probe,
-	.remove_new	= mtk_ethdr_remove,
+	.remove		= mtk_ethdr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ethdr",
 		.of_match_table = mtk_ethdr_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7687f673964e..70dc1d4460ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1795,7 +1795,7 @@ MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
 
 static struct platform_driver mtk_hdmi_driver = {
 	.probe = mtk_hdmi_probe,
-	.remove_new = mtk_hdmi_remove,
+	.remove = mtk_hdmi_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi",
 		.of_match_table = mtk_hdmi_of_ids,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 8e60631d4cd2..07db68067844 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -331,7 +331,7 @@ MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
 
 struct platform_driver mtk_hdmi_ddc_driver = {
 	.probe = mtk_hdmi_ddc_probe,
-	.remove_new = mtk_hdmi_ddc_remove,
+	.remove = mtk_hdmi_ddc_remove,
 	.driver = {
 		.name = "mediatek-hdmi-ddc",
 		.of_match_table = mtk_hdmi_ddc_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 7c1a8c796833..fc69ee38ce7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -341,7 +341,7 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_rdma_driver_dt_match);
 
 struct platform_driver mtk_mdp_rdma_driver = {
 	.probe = mtk_mdp_rdma_probe,
-	.remove_new = mtk_mdp_rdma_remove,
+	.remove = mtk_mdp_rdma_remove,
 	.driver = {
 		.name = "mediatek-mdp-rdma",
 		.of_match_table = mtk_mdp_rdma_driver_dt_match,
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 4bebd13a07bd..b4e3e5a3428b 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -146,7 +146,7 @@ MODULE_DEVICE_TABLE(of, mtk_padding_driver_dt_match);
 
 struct platform_driver mtk_padding_driver = {
 	.probe		= mtk_padding_probe,
-	.remove_new	= mtk_padding_remove,
+	.remove		= mtk_padding_remove,
 	.driver		= {
 		.name	= "mediatek-disp-padding",
 		.of_match_table = mtk_padding_driver_dt_match,
diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 2f76f48da38d..34e1a1a49f5f 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -559,7 +559,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
 
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
-	.remove_new = meson_drv_remove,
+	.remove     = meson_drv_remove,
 	.shutdown   = meson_drv_shutdown,
 	.driver     = {
 		.name	= "meson-drm",
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..1f0734b6687d 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -870,7 +870,7 @@ MODULE_DEVICE_TABLE(of, meson_dw_hdmi_of_table);
 
 static struct platform_driver meson_dw_hdmi_platform_driver = {
 	.probe		= meson_dw_hdmi_probe,
-	.remove_new	= meson_dw_hdmi_remove,
+	.remove		= meson_dw_hdmi_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_dw_hdmi_of_table,
diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index a10cff3ca1fe..66c73c512b0e 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -345,7 +345,7 @@ MODULE_DEVICE_TABLE(of, meson_dw_mipi_dsi_of_table);
 
 static struct platform_driver meson_dw_mipi_dsi_platform_driver = {
 	.probe		= meson_dw_mipi_dsi_probe,
-	.remove_new	= meson_dw_mipi_dsi_remove,
+	.remove		= meson_dw_mipi_dsi_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_dw_mipi_dsi_of_table,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cfc74a9e2646..e031241c8032 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -389,7 +389,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
-	.remove_new = adreno_remove,
+	.remove = adreno_remove,
 	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9bcae53c4f45..26f7602fc451 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1473,7 +1473,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
 
 static struct platform_driver dpu_driver = {
 	.probe = dpu_dev_probe,
-	.remove_new = dpu_dev_remove,
+	.remove = dpu_dev_remove,
 	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_dpu",
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 6e4e74f9d63d..c469e66cfc11 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -568,7 +568,7 @@ MODULE_DEVICE_TABLE(of, mdp4_dt_match);
 
 static struct platform_driver mdp4_platform_driver = {
 	.probe      = mdp4_probe,
-	.remove_new = mdp4_remove,
+	.remove     = mdp4_remove,
 	.shutdown   = msm_kms_shutdown,
 	.driver     = {
 		.name   = "mdp4",
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 374704cce656..3fcca7a3d82e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -908,7 +908,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
 
 static struct platform_driver mdp5_driver = {
 	.probe = mdp5_dev_probe,
-	.remove_new = mdp5_dev_remove,
+	.remove = mdp5_dev_remove,
 	.shutdown = msm_kms_shutdown,
 	.driver = {
 		.name = "msm_mdp",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1228fb093ee..d0f9e54039fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1388,7 +1388,7 @@ static const struct dev_pm_ops dp_pm_ops = {
 
 static struct platform_driver dp_display_driver = {
 	.probe  = dp_display_probe,
-	.remove_new = dp_display_remove,
+	.remove = dp_display_remove,
 	.driver = {
 		.name = "msm-dp-display",
 		.of_match_table = dp_dt_match,
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index efd7c23b662f..296215877613 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -207,7 +207,7 @@ static const struct dev_pm_ops dsi_pm_ops = {
 
 static struct platform_driver dsi_driver = {
 	.probe = dsi_dev_probe,
-	.remove_new = dsi_dev_remove,
+	.remove = dsi_dev_remove,
 	.driver = {
 		.name = "msm_dsi",
 		.of_match_table = dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 0bfee41c2e71..37b3809c6bdd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -561,7 +561,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
-	.remove_new = msm_hdmi_dev_remove,
+	.remove = msm_hdmi_dev_remove,
 	.driver = {
 		.name = "hdmi_msm",
 		.of_match_table = msm_hdmi_dt_match,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 95b3f7535d84..03120c54ced6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -203,7 +203,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,
-	.remove_new = msm_hdmi_phy_remove,
+	.remove     = msm_hdmi_phy_remove,
 	.driver     = {
 		.name   = "msm_hdmi_phy",
 		.of_match_table = msm_hdmi_phy_dt_match,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index edbc1ab0fbc8..ad75bf383970 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1107,7 +1107,7 @@ static void msm_pdev_remove(struct platform_device *pdev)
 
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
-	.remove_new = msm_pdev_remove,
+	.remove     = msm_pdev_remove,
 	.driver     = {
 		.name   = "msm",
 	},
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d..2296fd02346a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -734,7 +734,7 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
 
 static struct platform_driver mdss_platform_driver = {
 	.probe      = mdss_probe,
-	.remove_new = mdss_remove,
+	.remove     = mdss_remove,
 	.driver     = {
 		.name   = "msm-mdss",
 		.of_match_table = mdss_dt_match,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 58ccad9c425d..51ae0b51b1e8 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -368,7 +368,7 @@ static const struct dev_pm_ops lcdif_pm_ops = {
 
 static struct platform_driver lcdif_platform_driver = {
 	.probe		= lcdif_probe,
-	.remove_new	= lcdif_remove,
+	.remove		= lcdif_remove,
 	.shutdown	= lcdif_shutdown,
 	.driver	= {
 		.name		= "imx-lcdif",
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 34a98717b72c..6b95e4eb3e4e 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -417,7 +417,7 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
 
 static struct platform_driver mxsfb_platform_driver = {
 	.probe		= mxsfb_probe,
-	.remove_new	= mxsfb_remove,
+	.remove		= mxsfb_remove,
 	.shutdown	= mxsfb_shutdown,
 	.driver	= {
 		.name		= "mxsfb",
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 829fdc6e4031..a5ce8eb4a3be 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -86,5 +86,5 @@ struct platform_driver nouveau_platform_driver = {
 		.of_match_table = of_match_ptr(nouveau_platform_match),
 	},
 	.probe = nouveau_platform_probe,
-	.remove_new = nouveau_platform_remove,
+	.remove = nouveau_platform_remove,
 };
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 993691b3cc7e..c4ea8fde5891 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4912,7 +4912,7 @@ static const struct dev_pm_ops dispc_pm_ops = {
 
 struct platform_driver omap_dispchw_driver = {
 	.probe		= dispc_probe,
-	.remove_new     = dispc_remove,
+	.remove         = dispc_remove,
 	.driver         = {
 		.name   = "omapdss_dispc",
 		.pm	= &dispc_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ea63c64d3a1a..59d20eb8a7e0 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5093,7 +5093,7 @@ static const struct dev_pm_ops dsi_pm_ops = {
 
 struct platform_driver omap_dsihw_driver = {
 	.probe		= dsi_probe,
-	.remove_new	= dsi_remove,
+	.remove		= dsi_remove,
 	.driver         = {
 		.name   = "omapdss_dsi",
 		.pm	= &dsi_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 988888e164d7..7b2df3185de4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1606,7 +1606,7 @@ static const struct dev_pm_ops dss_pm_ops = {
 
 struct platform_driver omap_dsshw_driver = {
 	.probe		= dss_probe,
-	.remove_new	= dss_remove,
+	.remove		= dss_remove,
 	.shutdown	= dss_shutdown,
 	.driver         = {
 		.name   = "omapdss_dss",
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 9b8747d83ee8..4435f0027c78 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -852,7 +852,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 struct platform_driver omapdss_hdmi4hw_driver = {
 	.probe		= hdmi4_probe,
-	.remove_new	= hdmi4_remove,
+	.remove		= hdmi4_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi",
 		.of_match_table = hdmi_of_match,
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index c7ae2235ae99..a8c740df3146 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -819,7 +819,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 struct platform_driver omapdss_hdmi5hw_driver = {
 	.probe		= hdmi5_probe,
-	.remove_new	= hdmi5_remove,
+	.remove		= hdmi5_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi5",
 		.of_match_table = hdmi_of_match,
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index f163d52a7c7d..aaeef603682c 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -912,7 +912,7 @@ static const struct of_device_id venc_of_match[] = {
 
 struct platform_driver omap_venchw_driver = {
 	.probe		= venc_probe,
-	.remove_new	= venc_remove,
+	.remove		= venc_remove,
 	.driver         = {
 		.name   = "omapdss_venc",
 		.pm	= &venc_pm_ops,
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index fcd600024136..3fff32c000a6 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -1210,7 +1210,7 @@ static const struct of_device_id dmm_of_match[] = {
 
 struct platform_driver omap_dmm_driver = {
 	.probe = omap_dmm_probe,
-	.remove_new = omap_dmm_remove,
+	.remove = omap_dmm_remove,
 	.driver = {
 		.name = DMM_DRIVER_NAME,
 		.of_match_table = of_match_ptr(dmm_of_match),
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 1796cd20a877..e27376121606 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -857,7 +857,7 @@ static struct platform_driver pdev = {
 		.pm = &omapdrm_pm_ops,
 	},
 	.probe = pdev_probe,
-	.remove_new = pdev_remove,
+	.remove = pdev_remove,
 	.shutdown = pdev_shutdown,
 };
 
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 767e47a2b0c1..fdcc022198c7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2047,7 +2047,7 @@ static struct platform_driver panel_edp_platform_driver = {
 		.pm = &panel_edp_pm_ops,
 	},
 	.probe = panel_edp_platform_probe,
-	.remove_new = panel_edp_platform_remove,
+	.remove = panel_edp_platform_remove,
 	.shutdown = panel_edp_platform_shutdown,
 };
 
diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 1b8e3156914c..ba6c015aabba 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -246,7 +246,7 @@ MODULE_DEVICE_TABLE(of, panel_lvds_of_table);
 
 static struct platform_driver panel_lvds_driver = {
 	.probe		= panel_lvds_probe,
-	.remove_new	= panel_lvds_remove,
+	.remove		= panel_lvds_remove,
 	.driver		= {
 		.name	= "panel-lvds",
 		.of_match_table = panel_lvds_of_table,
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 8a3fe531c641..7d1b421ea9dd 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -297,7 +297,7 @@ static struct platform_driver seiko_panel_platform_driver = {
 		.of_match_table = platform_of_match,
 	},
 	.probe = seiko_panel_platform_probe,
-	.remove_new = seiko_panel_remove,
+	.remove = seiko_panel_remove,
 };
 module_platform_driver(seiko_panel_platform_driver);
 
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
index 76bd9e810827..a9673a52b861 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
@@ -207,7 +207,7 @@ MODULE_DEVICE_TABLE(of, ls037v7dw01_of_match);
 
 static struct platform_driver ls037v7dw01_driver = {
 	.probe		= ls037v7dw01_probe,
-	.remove_new	= ls037v7dw01_remove,
+	.remove		= ls037v7dw01_remove,
 	.driver		= {
 		.name = "panel-sharp-ls037v7dw01",
 		.of_match_table = ls037v7dw01_of_match,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 86735430462f..b49e3610345c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -5092,7 +5092,7 @@ static struct platform_driver panel_simple_platform_driver = {
 		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_platform_probe,
-	.remove_new = panel_simple_platform_remove,
+	.remove = panel_simple_platform_remove,
 	.shutdown = panel_simple_platform_shutdown,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 04d615df5259..ee3864476eb9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -866,7 +866,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 
 static struct platform_driver panfrost_driver = {
 	.probe		= panfrost_probe,
-	.remove_new	= panfrost_remove,
+	.remove		= panfrost_remove,
 	.driver		= {
 		.name	= "panfrost",
 		.pm	= pm_ptr(&panfrost_pm_ops),
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 52d44cf1105b..b5971f2e215e 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1589,7 +1589,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
 
 static struct platform_driver panthor_driver = {
 	.probe = panthor_probe,
-	.remove_new = panthor_remove,
+	.remove = panthor_remove,
 	.driver = {
 		.name = "panthor",
 		.pm = pm_ptr(&panthor_pm_ops),
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 26a2f5ad8ee5..79b67c406bd6 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -201,7 +201,7 @@ MODULE_DEVICE_TABLE(of, rcar_cmm_of_table);
 
 static struct platform_driver rcar_cmm_platform_driver = {
 	.probe		= rcar_cmm_probe,
-	.remove_new	= rcar_cmm_remove,
+	.remove		= rcar_cmm_remove,
 	.driver		= {
 		.name	= "rcar-cmm",
 		.of_match_table = rcar_cmm_of_table,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 4e0bafc86f50..f9ecc334c024 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -729,7 +729,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 static struct platform_driver rcar_du_platform_driver = {
 	.probe		= rcar_du_probe,
-	.remove_new	= rcar_du_remove,
+	.remove		= rcar_du_remove,
 	.shutdown	= rcar_du_shutdown,
 	.driver		= {
 		.name	= "rcar-du",
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c
index 119d69d20b23..c0176e5de9a8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c
@@ -108,7 +108,7 @@ MODULE_DEVICE_TABLE(of, rcar_dw_hdmi_of_table);
 
 static struct platform_driver rcar_dw_hdmi_platform_driver = {
 	.probe		= rcar_dw_hdmi_probe,
-	.remove_new	= rcar_dw_hdmi_remove,
+	.remove		= rcar_dw_hdmi_remove,
 	.driver		= {
 		.name	= "rcar-dw-hdmi",
 		.of_match_table = rcar_dw_hdmi_of_table,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 92ba43a6fe38..e8d64583e3bd 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -1018,7 +1018,7 @@ static const struct dev_pm_ops rcar_lvds_pm_ops = {
 
 static struct platform_driver rcar_lvds_platform_driver = {
 	.probe		= rcar_lvds_probe,
-	.remove_new	= rcar_lvds_remove,
+	.remove		= rcar_lvds_remove,
 	.driver		= {
 		.name	= "rcar-lvds",
 		.pm	= &rcar_lvds_pm_ops,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2dba7c5ffd2c..8180625d5866 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1088,7 +1088,7 @@ MODULE_DEVICE_TABLE(of, rcar_mipi_dsi_of_table);
 
 static struct platform_driver rcar_mipi_dsi_platform_driver = {
 	.probe          = rcar_mipi_dsi_probe,
-	.remove_new     = rcar_mipi_dsi_remove,
+	.remove         = rcar_mipi_dsi_remove,
 	.driver         = {
 		.name   = "rcar-mipi-dsi",
 		.of_match_table = rcar_mipi_dsi_of_table,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index bbd7003335da..b069efd8ffc3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -173,7 +173,7 @@ static int rzg2l_du_probe(struct platform_device *pdev)
 
 static struct platform_driver rzg2l_du_platform_driver = {
 	.probe		= rzg2l_du_probe,
-	.remove_new	= rzg2l_du_remove,
+	.remove		= rzg2l_du_remove,
 	.shutdown	= rzg2l_du_shutdown,
 	.driver		= {
 		.name	= "rzg2l-du",
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 10febea473cd..fa7a1ae22aa3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -798,7 +798,7 @@ MODULE_DEVICE_TABLE(of, rzg2l_mipi_dsi_of_table);
 
 static struct platform_driver rzg2l_mipi_dsi_platform_driver = {
 	.probe	= rzg2l_mipi_dsi_probe,
-	.remove_new = rzg2l_mipi_dsi_remove,
+	.remove = rzg2l_mipi_dsi_remove,
 	.driver	= {
 		.name = "rzg2l-mipi-dsi",
 		.pm = &rzg2l_mipi_pm_ops,
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 8d3effe3f598..76ee3e16077c 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -282,7 +282,7 @@ static const struct of_device_id shmob_drm_of_table[] __maybe_unused = {
 
 static struct platform_driver shmob_drm_platform_driver = {
 	.probe		= shmob_drm_probe,
-	.remove_new	= shmob_drm_remove,
+	.remove		= shmob_drm_remove,
 	.shutdown	= shmob_drm_shutdown,
 	.driver		= {
 		.name	= "shmob-drm",
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index d3341edfe4f4..546d13f19f9b 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -470,7 +470,7 @@ MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
 
 struct platform_driver rockchip_dp_driver = {
 	.probe = rockchip_dp_probe,
-	.remove_new = rockchip_dp_remove,
+	.remove = rockchip_dp_remove,
 	.driver = {
 		   .name = "rockchip-dp",
 		   .pm = pm_ptr(&rockchip_dp_pm_ops),
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b04538907f95..ff9d95e2c4d4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1254,7 +1254,7 @@ static const struct dev_pm_ops cdn_dp_pm_ops = {
 
 struct platform_driver cdn_dp_driver = {
 	.probe = cdn_dp_probe,
-	.remove_new = cdn_dp_remove,
+	.remove = cdn_dp_remove,
 	.shutdown = cdn_dp_shutdown,
 	.driver = {
 		   .name = "cdn-dp",
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 58a44af0e9ad..1b64b6e39cc8 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1709,7 +1709,7 @@ MODULE_DEVICE_TABLE(of, dw_mipi_dsi_rockchip_dt_ids);
 
 struct platform_driver dw_mipi_dsi_rockchip_driver = {
 	.probe		= dw_mipi_dsi_rockchip_probe,
-	.remove_new	= dw_mipi_dsi_rockchip_remove,
+	.remove		= dw_mipi_dsi_rockchip_remove,
 	.driver		= {
 		.of_match_table = dw_mipi_dsi_rockchip_dt_ids,
 		.pm	= &dw_mipi_dsi_rockchip_pm_ops,
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 96e1097f993d..42bda4ffbbbd 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -666,7 +666,7 @@ static const struct dev_pm_ops dw_hdmi_rockchip_pm = {
 
 struct platform_driver dw_hdmi_rockchip_pltfm_driver = {
 	.probe  = dw_hdmi_rockchip_probe,
-	.remove_new = dw_hdmi_rockchip_remove,
+	.remove = dw_hdmi_rockchip_remove,
 	.driver = {
 		.name = "dwhdmi-rockchip",
 		.pm = &dw_hdmi_rockchip_pm,
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 42ef62aa0a1e..b58e2a29294b 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -1017,7 +1017,7 @@ MODULE_DEVICE_TABLE(of, inno_hdmi_dt_ids);
 
 struct platform_driver inno_hdmi_driver = {
 	.probe  = inno_hdmi_probe,
-	.remove_new = inno_hdmi_remove,
+	.remove = inno_hdmi_remove,
 	.driver = {
 		.name = "innohdmi-rockchip",
 		.of_match_table = inno_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 784de990da1b..b0fc8ace2e41 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -858,7 +858,7 @@ MODULE_DEVICE_TABLE(of, rk3066_hdmi_dt_ids);
 
 struct platform_driver rk3066_hdmi_driver = {
 	.probe  = rk3066_hdmi_probe,
-	.remove_new = rk3066_hdmi_remove,
+	.remove = rk3066_hdmi_remove,
 	.driver = {
 		.name = "rockchip-rk3066-hdmi",
 		.of_match_table = rk3066_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 4e080040ba01..2429722997f5 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -500,7 +500,7 @@ MODULE_DEVICE_TABLE(of, rockchip_drm_dt_ids);
 
 static struct platform_driver rockchip_drm_platform_driver = {
 	.probe = rockchip_drm_platform_probe,
-	.remove_new = rockchip_drm_platform_remove,
+	.remove = rockchip_drm_platform_remove,
 	.shutdown = rockchip_drm_platform_shutdown,
 	.driver = {
 		.name = "rockchip-drm",
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 9a01aa450741..aba733736ff7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -746,7 +746,7 @@ static void rockchip_lvds_remove(struct platform_device *pdev)
 
 struct platform_driver rockchip_lvds_driver = {
 	.probe = rockchip_lvds_probe,
-	.remove_new = rockchip_lvds_remove,
+	.remove = rockchip_lvds_remove,
 	.driver = {
 		   .name = "rockchip-lvds",
 		   .of_match_table = rockchip_lvds_dt_ids,
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 18efb3fe1c00..f9d87a0abc8b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -501,7 +501,7 @@ static void vop2_remove(struct platform_device *pdev)
 
 struct platform_driver vop2_platform_driver = {
 	.probe = vop2_probe,
-	.remove_new = vop2_remove,
+	.remove = vop2_remove,
 	.driver = {
 		.name = "rockchip-vop2",
 		.of_match_table = vop2_dt_match,
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index e2c6ba26f437..8998967f0c00 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -1284,7 +1284,7 @@ static void vop_remove(struct platform_device *pdev)
 
 struct platform_driver vop_platform_driver = {
 	.probe = vop_probe,
-	.remove_new = vop_remove,
+	.remove = vop_remove,
 	.driver = {
 		.name = "rockchip-vop",
 		.of_match_table = vop_driver_dt_match,
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index deb3bb96e2a8..cb2816985305 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -866,7 +866,7 @@ static void sprd_dpu_remove(struct platform_device *pdev)
 
 struct platform_driver sprd_dpu_driver = {
 	.probe = sprd_dpu_probe,
-	.remove_new = sprd_dpu_remove,
+	.remove = sprd_dpu_remove,
 	.driver = {
 		.name = "sprd-dpu-drv",
 		.of_match_table = dpu_match_table,
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a74cd0caf645..bc1c747d3ea4 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -163,7 +163,7 @@ MODULE_DEVICE_TABLE(of, drm_match_table);
 
 static struct platform_driver sprd_drm_driver = {
 	.probe = sprd_drm_probe,
-	.remove_new = sprd_drm_remove,
+	.remove = sprd_drm_remove,
 	.shutdown = sprd_drm_shutdown,
 	.driver = {
 		.name = "sprd-drm-drv",
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 0b69c140eab3..29861ae2daa2 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -1060,7 +1060,7 @@ static void sprd_dsi_remove(struct platform_device *pdev)
 
 struct platform_driver sprd_dsi_driver = {
 	.probe = sprd_dsi_probe,
-	.remove_new = sprd_dsi_remove,
+	.remove = sprd_dsi_remove,
 	.driver = {
 		.name = "sprd-dsi-drv",
 		.of_match_table = dsi_match_table,
diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 33487a1fed8f..063f82d23d80 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -269,7 +269,7 @@ struct platform_driver sti_compositor_driver = {
 		.of_match_table = compositor_of_match,
 	},
 	.probe = sti_compositor_probe,
-	.remove_new = sti_compositor_remove,
+	.remove = sti_compositor_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 65f180c8e8e2..61ceff9aee7e 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -270,7 +270,7 @@ MODULE_DEVICE_TABLE(of, sti_dt_ids);
 
 static struct platform_driver sti_platform_driver = {
 	.probe = sti_platform_probe,
-	.remove_new = sti_platform_remove,
+	.remove = sti_platform_remove,
 	.shutdown = sti_platform_shutdown,
 	.driver = {
 		.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 68b8197b3dd1..c6c2abaa1891 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -585,7 +585,7 @@ struct platform_driver sti_dvo_driver = {
 		.of_match_table = dvo_of_match,
 	},
 	.probe = sti_dvo_probe,
-	.remove_new = sti_dvo_remove,
+	.remove = sti_dvo_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index f18faad974aa..b12863bea955 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -810,7 +810,7 @@ struct platform_driver sti_hda_driver = {
 		.of_match_table = hda_of_match,
 	},
 	.probe = sti_hda_probe,
-	.remove_new = sti_hda_remove,
+	.remove = sti_hda_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 847470f747c0..21b46a6465f0 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1492,7 +1492,7 @@ struct platform_driver sti_hdmi_driver = {
 		.of_match_table = hdmi_of_match,
 	},
 	.probe = sti_hdmi_probe,
-	.remove_new = sti_hdmi_remove,
+	.remove = sti_hdmi_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 5793cf2cb897..0f658709c9d0 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1420,7 +1420,7 @@ struct platform_driver sti_hqvdp_driver = {
 		.of_match_table = hqvdp_of_match,
 	},
 	.probe = sti_hqvdp_probe,
-	.remove_new = sti_hqvdp_remove,
+	.remove = sti_hqvdp_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index e714c232026c..af6c06f448c4 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -889,7 +889,7 @@ struct platform_driver sti_tvout_driver = {
 		.of_match_table = tvout_of_match,
 	},
 	.probe = sti_tvout_probe,
-	.remove_new = sti_tvout_remove,
+	.remove = sti_tvout_remove,
 };
 
 MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index fee274a60623..240f28aa8497 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -245,7 +245,7 @@ MODULE_DEVICE_TABLE(of, drv_dt_ids);
 
 static struct platform_driver stm_drm_platform_driver = {
 	.probe = stm_drm_platform_probe,
-	.remove_new = stm_drm_platform_remove,
+	.remove = stm_drm_platform_remove,
 	.shutdown = stm_drm_platform_shutdown,
 	.driver = {
 		.name = "stm32-display",
diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index b20123854c4a..2c7bc064bc66 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -783,7 +783,7 @@ static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
 	.probe		= dw_mipi_dsi_stm_probe,
-	.remove_new	= dw_mipi_dsi_stm_remove,
+	.remove		= dw_mipi_dsi_stm_remove,
 	.driver		= {
 		.of_match_table = dw_mipi_dsi_stm_dt_ids,
 		.name	= "stm32-display-dsi",
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index e89eb96d3131..2dded3b828df 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -1028,7 +1028,7 @@ MODULE_DEVICE_TABLE(of, sun4i_backend_of_table);
 
 static struct platform_driver sun4i_backend_platform_driver = {
 	.probe		= sun4i_backend_probe,
-	.remove_new	= sun4i_backend_remove,
+	.remove		= sun4i_backend_remove,
 	.driver		= {
 		.name		= "sun4i-backend",
 		.of_match_table	= sun4i_backend_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index c3342789e3b0..dfd94c7b3dbf 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -443,7 +443,7 @@ MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
 
 static struct platform_driver sun4i_drv_platform_driver = {
 	.probe		= sun4i_drv_probe,
-	.remove_new	= sun4i_drv_remove,
+	.remove		= sun4i_drv_remove,
 	.shutdown	= sun4i_drv_shutdown,
 	.driver		= {
 		.name		= "sun4i-drm",
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 280d444dbb66..5ab1604f12dd 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -717,7 +717,7 @@ MODULE_DEVICE_TABLE(of, sun4i_frontend_of_table);
 
 static struct platform_driver sun4i_frontend_driver = {
 	.probe		= sun4i_frontend_probe,
-	.remove_new	= sun4i_frontend_remove,
+	.remove		= sun4i_frontend_remove,
 	.driver		= {
 		.name		= "sun4i-frontend",
 		.of_match_table	= sun4i_frontend_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de30..453f19f16ab7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -741,7 +741,7 @@ MODULE_DEVICE_TABLE(of, sun4i_hdmi_of_table);
 
 static struct platform_driver sun4i_hdmi_driver = {
 	.probe		= sun4i_hdmi_probe,
-	.remove_new	= sun4i_hdmi_remove,
+	.remove		= sun4i_hdmi_remove,
 	.driver		= {
 		.name		= "sun4i-hdmi",
 		.of_match_table	= sun4i_hdmi_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index a1a2c845ade0..960e83c8291d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1568,7 +1568,7 @@ EXPORT_SYMBOL(sun4i_tcon_of_table);
 
 static struct platform_driver sun4i_tcon_platform_driver = {
 	.probe		= sun4i_tcon_probe,
-	.remove_new	= sun4i_tcon_remove,
+	.remove		= sun4i_tcon_remove,
 	.driver		= {
 		.name		= "sun4i-tcon",
 		.of_match_table	= sun4i_tcon_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index ec65d9d59de7..cce4e38789b9 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -559,7 +559,7 @@ MODULE_DEVICE_TABLE(of, sun4i_tv_of_table);
 
 static struct platform_driver sun4i_tv_platform_driver = {
 	.probe		= sun4i_tv_probe,
-	.remove_new	= sun4i_tv_remove,
+	.remove		= sun4i_tv_remove,
 	.driver		= {
 		.name		= "sun4i-tve",
 		.of_match_table	= sun4i_tv_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
index 0d342f43fa93..310c7e0daede 100644
--- a/drivers/gpu/drm/sun4i/sun6i_drc.c
+++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
@@ -112,7 +112,7 @@ MODULE_DEVICE_TABLE(of, sun6i_drc_of_table);
 
 static struct platform_driver sun6i_drc_platform_driver = {
 	.probe		= sun6i_drc_probe,
-	.remove_new	= sun6i_drc_remove,
+	.remove		= sun6i_drc_remove,
 	.driver		= {
 		.name		= "sun6i-drc",
 		.of_match_table	= sun6i_drc_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 4abf4f102007..c35b70d83e53 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1244,7 +1244,7 @@ MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
 
 static struct platform_driver sun6i_dsi_platform_driver = {
 	.probe		= sun6i_dsi_probe,
-	.remove_new	= sun6i_dsi_remove,
+	.remove		= sun6i_dsi_remove,
 	.driver		= {
 		.name		= "sun6i-mipi-dsi",
 		.of_match_table	= sun6i_dsi_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 4727dfaa8fb9..96532709c2a7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -264,7 +264,7 @@ MODULE_DEVICE_TABLE(of, sun8i_dw_hdmi_dt_ids);
 
 static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
 	.probe  = sun8i_dw_hdmi_probe,
-	.remove_new = sun8i_dw_hdmi_remove,
+	.remove = sun8i_dw_hdmi_remove,
 	.driver = {
 		.name = "sun8i-dw-hdmi",
 		.of_match_table = sun8i_dw_hdmi_dt_ids,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bd0fe2c6624e..8b41d33baa30 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -775,7 +775,7 @@ MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
 
 static struct platform_driver sun8i_mixer_platform_driver = {
 	.probe		= sun8i_mixer_probe,
-	.remove_new	= sun8i_mixer_remove,
+	.remove		= sun8i_mixer_remove,
 	.driver		= {
 		.name		= "sun8i-mixer",
 		.of_match_table	= sun8i_mixer_of_table,
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index a1ca3916f42b..8adda578c51b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -299,7 +299,7 @@ EXPORT_SYMBOL(sun8i_tcon_top_of_table);
 
 static struct platform_driver sun8i_tcon_top_platform_driver = {
 	.probe		= sun8i_tcon_top_probe,
-	.remove_new	= sun8i_tcon_top_remove,
+	.remove		= sun8i_tcon_top_remove,
 	.driver		= {
 		.name		= "sun8i-tcon-top",
 		.of_match_table	= sun8i_tcon_top_of_table,
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index be61c9d1a4f0..430b2eededb2 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3286,5 +3286,5 @@ struct platform_driver tegra_dc_driver = {
 		.of_match_table = tegra_dc_of_match,
 	},
 	.probe = tegra_dc_probe,
-	.remove_new = tegra_dc_remove,
+	.remove = tegra_dc_remove,
 };
diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index ae12d001a04b..2cd8dcb959c0 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -697,7 +697,7 @@ struct platform_driver tegra_dpaux_driver = {
 		.pm = pm_ptr(&tegra_dpaux_pm_ops),
 	},
 	.probe = tegra_dpaux_probe,
-	.remove_new = tegra_dpaux_remove,
+	.remove = tegra_dpaux_remove,
 };
 
 struct drm_dp_aux *drm_dp_aux_find_by_of_node(struct device_node *np)
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index db606e151afc..4a8cd9ed0a94 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1713,5 +1713,5 @@ struct platform_driver tegra_dsi_driver = {
 		.of_match_table = tegra_dsi_of_match,
 	},
 	.probe = tegra_dsi_probe,
-	.remove_new = tegra_dsi_remove,
+	.remove = tegra_dsi_remove,
 };
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index a160d01f26e1..21f4dd0fa6af 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -394,5 +394,5 @@ struct platform_driver tegra_gr2d_driver = {
 		.pm = &tegra_gr2d_pm,
 	},
 	.probe = gr2d_probe,
-	.remove_new = gr2d_remove,
+	.remove = gr2d_remove,
 };
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 00c8564520e7..55267e3d2c97 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -628,5 +628,5 @@ struct platform_driver tegra_gr3d_driver = {
 		.pm = &tegra_gr3d_pm,
 	},
 	.probe = gr3d_probe,
-	.remove_new = gr3d_remove,
+	.remove = gr3d_remove,
 };
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6bf2dae82ca0..e705f8590c13 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1919,5 +1919,5 @@ struct platform_driver tegra_hdmi_driver = {
 		.of_match_table = tegra_hdmi_of_match,
 	},
 	.probe = tegra_hdmi_probe,
-	.remove_new = tegra_hdmi_remove,
+	.remove = tegra_hdmi_remove,
 };
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index e0c2019a591b..fa6140fc37fb 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -1218,5 +1218,5 @@ struct platform_driver tegra_display_hub_driver = {
 		.of_match_table = tegra_display_hub_of_match,
 	},
 	.probe = tegra_display_hub_probe,
-	.remove_new = tegra_display_hub_remove,
+	.remove = tegra_display_hub_remove,
 };
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 4860790666af..2d9a0a3f6c38 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -566,7 +566,7 @@ struct platform_driver tegra_nvdec_driver = {
 		.pm = &nvdec_pm_ops
 	},
 	.probe = nvdec_probe,
-	.remove_new = nvdec_remove,
+	.remove = nvdec_remove,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index bad3b8fcc726..802d2db7007a 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -4040,5 +4040,5 @@ struct platform_driver tegra_sor_driver = {
 		.pm = &tegra_sor_pm_ops,
 	},
 	.probe = tegra_sor_probe,
-	.remove_new = tegra_sor_remove,
+	.remove = tegra_sor_remove,
 };
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 73c356f1c901..332c9b563d3f 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -553,7 +553,7 @@ struct platform_driver tegra_vic_driver = {
 		.pm = &vic_pm_ops
 	},
 	.probe = vic_probe,
-	.remove_new = vic_remove,
+	.remove = vic_remove,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC)
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 2428b9aaa003..7c8fd6407d82 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -252,7 +252,7 @@ MODULE_DEVICE_TABLE(of, tidss_of_table);
 
 static struct platform_driver tidss_platform_driver = {
 	.probe		= tidss_probe,
-	.remove_new	= tidss_remove,
+	.remove		= tidss_remove,
 	.shutdown	= tidss_shutdown,
 	.driver		= {
 		.name	= "tidss",
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 8c9f3705aa6c..6f0df8d6b90c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -590,7 +590,7 @@ MODULE_DEVICE_TABLE(of, tilcdc_of_match);
 
 static struct platform_driver tilcdc_platform_driver = {
 	.probe      = tilcdc_pdev_probe,
-	.remove_new = tilcdc_pdev_remove,
+	.remove     = tilcdc_pdev_remove,
 	.shutdown   = tilcdc_pdev_shutdown,
 	.driver     = {
 		.name   = "tilcdc",
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 5f2d1b6f9ee9..262f290d85d9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -390,7 +390,7 @@ static const struct of_device_id panel_of_match[] = {
 
 static struct platform_driver panel_driver = {
 	.probe = panel_probe,
-	.remove_new = panel_remove,
+	.remove = panel_remove,
 	.driver = {
 		.name = "tilcdc-panel",
 		.of_match_table = panel_of_match,
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 81abedec435d..0cc68042a6d6 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -423,7 +423,7 @@ MODULE_DEVICE_TABLE(of, arcpgu_of_table);
 
 static struct platform_driver arcpgu_platform_driver = {
 	.probe = arcpgu_probe,
-	.remove_new = arcpgu_remove,
+	.remove = arcpgu_remove,
 	.driver = {
 		   .name = "arcpgu",
 		   .of_match_table = arcpgu_of_table,
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 04ffa93de44a..74615eee2fec 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1398,7 +1398,7 @@ static struct platform_driver ofdrm_platform_driver = {
 		.of_match_table = ofdrm_of_match_display,
 	},
 	.probe = ofdrm_probe,
-	.remove_new = ofdrm_remove,
+	.remove = ofdrm_remove,
 };
 
 module_platform_driver(ofdrm_platform_driver);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 484901e5e2f4..24fd9244f865 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -1064,7 +1064,7 @@ static struct platform_driver simpledrm_platform_driver = {
 		.of_match_table = simpledrm_of_match_table,
 	},
 	.probe = simpledrm_probe,
-	.remove_new = simpledrm_remove,
+	.remove = simpledrm_remove,
 };
 
 module_platform_driver(simpledrm_platform_driver);
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index b30340a2141d..c341aee37dd9 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -267,7 +267,7 @@ static struct platform_driver tve200_driver = {
 		.of_match_table = tve200_of_match,
 	},
 	.probe = tve200_probe,
-	.remove_new = tve200_remove,
+	.remove = tve200_remove,
 	.shutdown = tve200_shutdown,
 };
 drm_module_platform_driver(tve200_driver);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index fb35c5c3f1a7..bee51c942a56 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -391,7 +391,7 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 
 static struct platform_driver v3d_platform_driver = {
 	.probe		= v3d_platform_drm_probe,
-	.remove_new	= v3d_platform_drm_remove,
+	.remove		= v3d_platform_drm_remove,
 	.driver		= {
 		.name	= "v3d",
 		.of_match_table = v3d_of_match,
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 575900ee67a5..ee82a959d279 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1465,7 +1465,7 @@ static void vc4_crtc_dev_remove(struct platform_device *pdev)
 
 struct platform_driver vc4_crtc_driver = {
 	.probe = vc4_crtc_dev_probe,
-	.remove_new = vc4_crtc_dev_remove,
+	.remove = vc4_crtc_dev_remove,
 	.driver = {
 		.name = "vc4_crtc",
 		.of_match_table = vc4_crtc_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index a382dc4654bd..960550c166d9 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -395,7 +395,7 @@ static void vc4_dpi_dev_remove(struct platform_device *pdev)
 
 struct platform_driver vc4_dpi_driver = {
 	.probe = vc4_dpi_dev_probe,
-	.remove_new = vc4_dpi_dev_remove,
+	.remove = vc4_dpi_dev_remove,
 	.driver = {
 		.name = "vc4_dpi",
 		.of_match_table = vc4_dpi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 13a1ecddbca3..bd7d87f94098 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -470,7 +470,7 @@ MODULE_DEVICE_TABLE(of, vc4_of_match);
 
 static struct platform_driver vc4_platform_driver = {
 	.probe		= vc4_platform_drm_probe,
-	.remove_new	= vc4_platform_drm_remove,
+	.remove		= vc4_platform_drm_remove,
 	.shutdown	= vc4_platform_drm_shutdown,
 	.driver		= {
 		.name	= "vc4-drm",
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index f5ccc1bf7a63..5eb293bdb363 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1841,7 +1841,7 @@ static void vc4_dsi_dev_remove(struct platform_device *pdev)
 
 struct platform_driver vc4_dsi_driver = {
 	.probe = vc4_dsi_dev_probe,
-	.remove_new = vc4_dsi_dev_remove,
+	.remove = vc4_dsi_dev_remove,
 	.driver = {
 		.name = "vc4_dsi",
 		.of_match_table = vc4_dsi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb36..e3818c48c9b8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3422,7 +3422,7 @@ static const struct dev_pm_ops vc4_hdmi_pm_ops = {
 
 struct platform_driver vc4_hdmi_driver = {
 	.probe = vc4_hdmi_dev_probe,
-	.remove_new = vc4_hdmi_dev_remove,
+	.remove = vc4_hdmi_dev_remove,
 	.driver = {
 		.name = "vc4_hdmi",
 		.of_match_table = vc4_hdmi_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2a366a607fcc..a3b100a6aad5 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1151,7 +1151,7 @@ static const struct of_device_id vc4_hvs_dt_match[] = {
 
 struct platform_driver vc4_hvs_driver = {
 	.probe = vc4_hvs_dev_probe,
-	.remove_new = vc4_hvs_dev_remove,
+	.remove = vc4_hvs_dev_remove,
 	.driver = {
 		.name = "vc4_hvs",
 		.of_match_table = vc4_hvs_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ffe1f7d1b911..3e38a1d2d55e 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -585,7 +585,7 @@ static const struct of_device_id vc4_txp_dt_match[] = {
 
 struct platform_driver vc4_txp_driver = {
 	.probe = vc4_txp_probe,
-	.remove_new = vc4_txp_remove,
+	.remove = vc4_txp_remove,
 	.driver = {
 		.name = "vc4_txp",
 		.of_match_table = vc4_txp_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 2423826c89eb..bb09df5000bd 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -534,7 +534,7 @@ const struct of_device_id vc4_v3d_dt_match[] = {
 
 struct platform_driver vc4_v3d_driver = {
 	.probe = vc4_v3d_dev_probe,
-	.remove_new = vc4_v3d_dev_remove,
+	.remove = vc4_v3d_dev_remove,
 	.driver = {
 		.name = "vc4_v3d",
 		.of_match_table = vc4_v3d_dt_match,
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index eb64e881051e..06d702e879b0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -848,7 +848,7 @@ static void vc4_vec_dev_remove(struct platform_device *pdev)
 
 struct platform_driver vc4_vec_driver = {
 	.probe = vc4_vec_dev_probe,
-	.remove_new = vc4_vec_dev_remove,
+	.remove = vc4_vec_dev_remove,
 	.driver = {
 		.name = "vc4_vec",
 		.of_match_table = vc4_vec_dt_match,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index f5781939de9c..07c4d184e7a1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -320,7 +320,7 @@ MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
 
 static struct platform_driver zynqmp_dpsub_driver = {
 	.probe			= zynqmp_dpsub_probe,
-	.remove_new		= zynqmp_dpsub_remove,
+	.remove			= zynqmp_dpsub_remove,
 	.shutdown		= zynqmp_dpsub_shutdown,
 	.driver			= {
 		.name		= "zynqmp-dpsub",

base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
-- 
2.45.2

