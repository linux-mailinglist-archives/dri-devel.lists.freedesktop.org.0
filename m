Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30640185014
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 21:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191AC6EC66;
	Fri, 13 Mar 2020 20:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86E6EC63;
 Fri, 13 Mar 2020 20:18:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 19so11941843ljj.7;
 Fri, 13 Mar 2020 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzxdQZScKh73JQFN73DApaSaYFlbmWSYdaw+lKvzvQQ=;
 b=gepzoqONK0d8lSkQzjdNMBjt6+yqKOyXZxf5J6D14ZZ4xysC9NW7T+J5CVCJFlrfMo
 2IW51Di+so8d13Z5it/plzqPEw0OXRmD1ia6rHXH93sOUXZjpcH3OSJ70aUpjx71Lv/m
 lKkkwXXY611ykmsrQ5ECkna2jQxDQGCvN7suMnZkfbKTEmTxCm2jRnv5ea2iAlnilbDx
 gbHWiVz+iB8WgFevXQjRlnfFeJ4GJIAIqTsdal1abUf3/cDstiXDl2yDTijBYWgm0RF6
 hX9wET4CojajGrQuOZRYjVfUjoUpBFtjn1zWeIt+0nCD4SOt5RInLyromMm8Li0nbbow
 KgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nzxdQZScKh73JQFN73DApaSaYFlbmWSYdaw+lKvzvQQ=;
 b=qMhALa4r3eZCI4KuMAGjYkyWTXHhZH5eG1yomkJf+YjZOfdh+37f0+3dBKzzyWGyaQ
 YM+ltGeiAxlG/x6K/cs4el5oJ4GZFh4G+5opAYPmZ/gLk4+hym/Q6vf/rmQMErmb78mv
 KRopg7M2cR7Ze7GvIj4sPLkq025SQZ8nZ1KvbEhisGxCVb0PSWtKenGhd8787xpnvsbD
 aCmmNb23dd1wtMtNBF01KqjilFUABIK5MruBsNE0XynAbx98rASxbDMk18yxxuFyAZEr
 iUKWCaGUdfANMF3fSG9KAKEh9dKCL2Y1o3jxt2g+GtVKlM4lXr1cdotLAAna4XI0kdc9
 bI3w==
X-Gm-Message-State: ANhLgQ3zm6AD4hWt7myJUECcRJUSS9ZImpS8IMGIkUrjYuj6aPaR/JaQ
 aepAzjbdoiiNNy5gNcVFmjDGHS5FlLA=
X-Google-Smtp-Source: ADFU+vt6O2ZalU9Dh70XAW1IwnoxoQLNiOwdWynfeBEI2cy+jLkbco/827gAAr4unCBL/VnrG56ZhA==
X-Received: by 2002:a2e:730d:: with SMTP id o13mr9383771ljc.177.1584130678657; 
 Fri, 13 Mar 2020 13:17:58 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v10sm30774074lfb.61.2020.03.13.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 13:17:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm: drm_encoder_init() => drm_encoder_init_funcs()
Date: Fri, 13 Mar 2020 21:17:42 +0100
Message-Id: <20200313201744.19773-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Jose Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Emil Velikov <emil.velikov@collabora.com>, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many callers of drm_encoder_init use a drm_encoder_funcs
that contains only a drm_encoder_cleanup() callback.

drm_simple_encoder_init() was introduced to cover the
common case where an encoder with only basic functionality
was needed. But it really do not belong in drm_simple_*

Rename drm_encoder_init() to drm_encoder_funcs(),
so we can then in a subsequent patch rename
drm_simple_encoder_init() to drm_encoder_init().
And then move the functionality to drm_encoder where it bleongs.

checkpatch complains about long lines in amd and radeon.
Surrounding lines are too long too, so warnings were ignored.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 10 ++---
 drivers/gpu/drm/arc/arcpgu_hdmi.c             |  4 +-
 drivers/gpu/drm/arc/arcpgu_sim.c              |  4 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  6 +--
 drivers/gpu/drm/drm_encoder.c                 | 14 +++----
 drivers/gpu/drm/drm_encoder_slave.c           |  2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c       |  6 +--
 drivers/gpu/drm/drm_writeback.c               |  6 +--
 drivers/gpu/drm/exynos/exynos_dp.c            |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c     |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c        |  5 ++-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c       |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  6 +--
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c        |  7 ++--
 drivers/gpu/drm/gma500/oaktrail_hdmi.c        |  6 +--
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |  4 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  6 +--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  4 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c             |  5 ++-
 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  5 ++-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  6 ++-
 drivers/gpu/drm/i915/display/intel_dp.c       |  6 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 ++-
 drivers/gpu/drm/i915/display/intel_dvo.c      |  6 +--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     |  4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_tv.c       |  4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  5 ++-
 drivers/gpu/drm/imx/dw_hdmi-imx.c             |  4 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |  4 +-
 drivers/gpu/drm/imx/imx-tve.c                 |  4 +-
 drivers/gpu/drm/imx/parallel-display.c        |  4 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  4 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         |  5 ++-
 drivers/gpu/drm/meson/meson_venc_cvbs.c       |  5 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  4 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  4 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  |  4 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |  3 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  3 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 16 ++++----
 drivers/gpu/drm/omapdrm/omap_encoder.c        |  4 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    | 40 +++++++++----------
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +-
 .../gpu/drm/radeon/radeon_legacy_encoders.c   | 20 +++++-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  4 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  5 ++-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  4 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  5 ++-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  4 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |  4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |  5 ++-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |  5 ++-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  4 +-
 drivers/gpu/drm/sti/sti_tvout.c               | 16 ++++----
 drivers/gpu/drm/stm/ltdc.c                    |  4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_lvds.c            | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_rgb.c             | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_tv.c              | 10 ++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 10 ++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  4 +-
 drivers/gpu/drm/tegra/dsi.c                   |  6 +--
 drivers/gpu/drm/tegra/hdmi.c                  |  5 ++-
 drivers/gpu/drm/tegra/rgb.c                   |  4 +-
 drivers/gpu/drm/tegra/sor.c                   |  4 +-
 drivers/gpu/drm/tidss/tidss_encoder.c         |  4 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      |  8 ++--
 drivers/gpu/drm/tilcdc/tilcdc_panel.c         |  4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  4 +-
 drivers/gpu/drm/vc4/vc4_vec.c                 |  4 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  4 +-
 drivers/gpu/drm/vkms/vkms_output.c            |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  5 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  4 +-
 drivers/gpu/drm/zte/zx_hdmi.c                 |  4 +-
 drivers/gpu/drm/zte/zx_tvenc.c                |  4 +-
 drivers/gpu/drm/zte/zx_vga.c                  |  4 +-
 include/drm/drm_encoder.h                     |  8 ++--
 105 files changed, 355 insertions(+), 336 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 2512e7ebfedf..11454977c92b 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -3534,8 +3534,8 @@ static void dce_v10_0_encoder_add(struct amdgpu_device *adev,
 	switch (amdgpu_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC1:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC2:
-		drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		drm_encoder_helper_add(encoder, &dce_v10_0_dac_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DVO1:
@@ -3545,16 +3545,16 @@ static void dce_v10_0_encoder_add(struct amdgpu_device *adev,
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			amdgpu_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_lcd_info(amdgpu_encoder);
 		} else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT)) {
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		}
 		drm_encoder_helper_add(encoder, &dce_v10_0_dig_helper_funcs);
@@ -3571,14 +3571,14 @@ static void dce_v10_0_encoder_add(struct amdgpu_device *adev,
 		/* these are handled by the primary encoders */
 		amdgpu_encoder->is_ext_encoder = true;
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 		else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 		else
-			drm_encoder_init(dev, encoder, &dce_v10_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v10_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &dce_v10_0_ext_helper_funcs);
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 0dde22db9848..b71b601d1b85 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3666,8 +3666,8 @@ static void dce_v11_0_encoder_add(struct amdgpu_device *adev,
 	switch (amdgpu_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC1:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC2:
-		drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		drm_encoder_helper_add(encoder, &dce_v11_0_dac_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DVO1:
@@ -3677,16 +3677,16 @@ static void dce_v11_0_encoder_add(struct amdgpu_device *adev,
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			amdgpu_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_lcd_info(amdgpu_encoder);
 		} else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT)) {
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		}
 		drm_encoder_helper_add(encoder, &dce_v11_0_dig_helper_funcs);
@@ -3703,14 +3703,14 @@ static void dce_v11_0_encoder_add(struct amdgpu_device *adev,
 		/* these are handled by the primary encoders */
 		amdgpu_encoder->is_ext_encoder = true;
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 		else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 		else
-			drm_encoder_init(dev, encoder, &dce_v11_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v11_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &dce_v11_0_ext_helper_funcs);
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 84219534bd38..13926daff2ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -3345,8 +3345,8 @@ static void dce_v6_0_encoder_add(struct amdgpu_device *adev,
 	switch (amdgpu_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC1:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC2:
-		drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		drm_encoder_helper_add(encoder, &dce_v6_0_dac_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DVO1:
@@ -3356,16 +3356,16 @@ static void dce_v6_0_encoder_add(struct amdgpu_device *adev,
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			amdgpu_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_lcd_info(amdgpu_encoder);
 		} else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT)) {
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		}
 		drm_encoder_helper_add(encoder, &dce_v6_0_dig_helper_funcs);
@@ -3382,14 +3382,14 @@ static void dce_v6_0_encoder_add(struct amdgpu_device *adev,
 		/* these are handled by the primary encoders */
 		amdgpu_encoder->is_ext_encoder = true;
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 		else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 		else
-			drm_encoder_init(dev, encoder, &dce_v6_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v6_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &dce_v6_0_ext_helper_funcs);
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 3a640702d7d1..b9162b07c2b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3422,8 +3422,8 @@ static void dce_v8_0_encoder_add(struct amdgpu_device *adev,
 	switch (amdgpu_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC1:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC2:
-		drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		drm_encoder_helper_add(encoder, &dce_v8_0_dac_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DVO1:
@@ -3433,16 +3433,16 @@ static void dce_v8_0_encoder_add(struct amdgpu_device *adev,
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			amdgpu_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_lcd_info(amdgpu_encoder);
 		} else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT)) {
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			amdgpu_encoder->enc_priv = amdgpu_atombios_encoder_get_dig_info(amdgpu_encoder);
 		}
 		drm_encoder_helper_add(encoder, &dce_v8_0_dig_helper_funcs);
@@ -3459,14 +3459,14 @@ static void dce_v8_0_encoder_add(struct amdgpu_device *adev,
 		/* these are handled by the primary encoders */
 		amdgpu_encoder->is_ext_encoder = true;
 		if (amdgpu_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 		else if (amdgpu_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT))
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 		else
-			drm_encoder_init(dev, encoder, &dce_v8_0_encoder_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &dce_v8_0_encoder_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &dce_v8_0_ext_helper_funcs);
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 13e12be667fc..dcb3c96a521a 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -597,8 +597,8 @@ static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
 	if (!encoder)
 		return -ENOMEM;
 	encoder->possible_crtcs = 1 << index;
-	drm_encoder_init(adev->ddev, encoder, &dce_virtual_encoder_funcs,
-			 DRM_MODE_ENCODER_VIRTUAL, NULL);
+	drm_encoder_init_funcs(adev->ddev, encoder, &dce_virtual_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	drm_encoder_helper_add(encoder, &dce_virtual_encoder_helper_funcs);
 
 	connector = kzalloc(sizeof(struct drm_connector), GFP_KERNEL);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1c0449adcef6..c9e5886bafee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6021,11 +6021,11 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
 {
 	struct amdgpu_device *adev = dev->dev_private;
 
-	int res = drm_encoder_init(dev,
-				   &aencoder->base,
-				   &amdgpu_dm_encoder_funcs,
-				   DRM_MODE_ENCODER_TMDS,
-				   NULL);
+	int res = drm_encoder_init_funcs(dev,
+					 &aencoder->base,
+					 &amdgpu_dm_encoder_funcs,
+					 DRM_MODE_ENCODER_TMDS,
+					 NULL);
 
 	aencoder->base.possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(adev);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 4c5755633bfd..7622d5e73b21 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -358,12 +358,10 @@ dm_dp_create_fake_mst_encoder(struct amdgpu_dm_connector *connector)
 	encoder = &amdgpu_encoder->base;
 	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(adev);
 
-	drm_encoder_init(
-		dev,
-		&amdgpu_encoder->base,
-		&amdgpu_dm_encoder_funcs,
-		DRM_MODE_ENCODER_DPMST,
-		NULL);
+	drm_encoder_init_funcs(dev, &amdgpu_encoder->base,
+			       &amdgpu_dm_encoder_funcs,
+			       DRM_MODE_ENCODER_DPMST,
+			       NULL);
 
 	drm_encoder_helper_add(encoder, &amdgpu_dm_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index 52839934f2fb..d2456254e1f1 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -34,8 +34,8 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
-	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init_funcs(drm, encoder, &arcpgu_drm_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index 37d961668dfe..1679d2bc3b9c 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -68,8 +68,8 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_encoder_init(drm, encoder, &arcpgu_drm_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(drm, encoder, &arcpgu_drm_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index e2019fe97fff..a845d587c315 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -98,9 +98,9 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev, int endpoint)
 		return -EINVAL;
 	}
 
-	ret = drm_encoder_init(dev, &output->encoder,
-			       &atmel_hlcdc_panel_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init_funcs(dev, &output->encoder,
+				     &atmel_hlcdc_panel_encoder_funcs,
+				     DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index e555281f43d4..a76a5f04ab39 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -51,7 +51,7 @@
  * encoders, bridges also have the benefit of being purely an internal
  * abstraction since they are not exposed to userspace at all.
  *
- * Encoders are initialized with drm_encoder_init() and cleaned up using
+ * Encoders are initialized with drm_encoder_init_funcs() and cleaned up using
  * drm_encoder_cleanup().
  */
 static const struct drm_prop_enum_list drm_encoder_enum_list[] = {
@@ -92,7 +92,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
 }
 
 /**
- * drm_encoder_init - Init a preallocated encoder
+ * drm_encoder_init_funcs - Init a preallocated encoder
  * @dev: drm device
  * @encoder: the encoder to init
  * @funcs: callbacks for this encoder
@@ -106,10 +106,10 @@ void drm_encoder_unregister_all(struct drm_device *dev)
  * Returns:
  * Zero on success, error code on failure.
  */
-int drm_encoder_init(struct drm_device *dev,
-		     struct drm_encoder *encoder,
-		     const struct drm_encoder_funcs *funcs,
-		     int encoder_type, const char *name, ...)
+int drm_encoder_init_funcs(struct drm_device *dev,
+			   struct drm_encoder *encoder,
+			   const struct drm_encoder_funcs *funcs,
+			   int encoder_type, const char *name, ...)
 {
 	int ret;
 
@@ -150,7 +150,7 @@ int drm_encoder_init(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_encoder_init);
+EXPORT_SYMBOL(drm_encoder_init_funcs);
 
 /**
  * drm_encoder_cleanup - cleans up an initialised encoder
diff --git a/drivers/gpu/drm/drm_encoder_slave.c b/drivers/gpu/drm/drm_encoder_slave.c
index cf804389f5ec..3acc0b843d44 100644
--- a/drivers/gpu/drm/drm_encoder_slave.c
+++ b/drivers/gpu/drm/drm_encoder_slave.c
@@ -32,7 +32,7 @@
  * drm_i2c_encoder_init - Initialize an I2C slave encoder
  * @dev:	DRM device.
  * @encoder:    Encoder to be attached to the I2C device. You aren't
- *		required to have called drm_encoder_init() before.
+ *		required to have called drm_encoder_init_funcs() before.
  * @adap:	I2C adapter that will be used to communicate with
  *		the device.
  * @info:	Information that will be used to create the I2C device.
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 74946690aba4..24d4433c347b 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -65,9 +65,9 @@ int drm_simple_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    int encoder_type)
 {
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
+	return drm_encoder_init_funcs(dev, encoder,
+				      &drm_simple_encoder_funcs_cleanup,
+				      encoder_type, NULL);
 }
 EXPORT_SYMBOL(drm_simple_encoder_init);
 
diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 43d9e3bb3a94..61287c34f21d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -191,9 +191,9 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		return PTR_ERR(blob);
 
 	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(dev, &wb_connector->encoder,
+				     &drm_writeback_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index d23d3502ca91..4128cd483bbc 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -174,8 +174,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 			return ret;
 	}
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 43fa0f26c052..088378b49c85 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -201,8 +201,8 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &exynos_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 38e43d957ae0..01ff00007fd3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1704,8 +1704,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_bridge *in_bridge;
 	int ret;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm_dev, encoder, &exynos_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index b320b3a21ad4..e542637813eb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -406,8 +406,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 3e5f1a77286d..fed7d04532bb 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1851,8 +1851,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index cff344367f81..5ac65ad95598 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -38,8 +38,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_encoder_init(fsl_dev->drm, encoder, &encoder_funcs,
-			       DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_encoder_init_funcs(fsl_dev->drm, encoder, &encoder_funcs,
+				     DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 29c36d63b20e..f516aa3a45bf 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -271,8 +271,9 @@ void cdv_intel_crt_init(struct drm_device *dev,
 		&cdv_intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
 
 	encoder = &gma_encoder->base;
-	drm_encoder_init(dev, encoder,
-		&cdv_intel_crt_enc_funcs, DRM_MODE_ENCODER_DAC, NULL);
+	drm_encoder_init_funcs(dev, encoder,
+			       &cdv_intel_crt_enc_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 5772b2dce0d6..5ec908292cb5 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -2016,8 +2016,8 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
 	encoder = &gma_encoder->base;
 
 	drm_connector_init(dev, connector, &cdv_intel_dp_connector_funcs, type);
-	drm_encoder_init(dev, encoder, &cdv_intel_dp_enc_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &cdv_intel_dp_enc_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 1711a41acc16..c8d2f2cf54a9 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -311,8 +311,8 @@ void cdv_hdmi_init(struct drm_device *dev,
 			   &cdv_hdmi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DVID);
 
-	drm_encoder_init(dev, encoder, &psb_intel_lvds_enc_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &psb_intel_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_HDMI;
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index ea0a5d9a0acc..6a40be5e77a3 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -616,9 +616,9 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 			   &cdv_intel_lvds_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 
-	drm_encoder_init(dev, encoder,
-			 &cdv_intel_lvds_enc_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(dev, encoder,
+			       &cdv_intel_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
index d4c65f268922..ddc042398ede 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
@@ -993,10 +993,9 @@ struct mdfld_dsi_encoder *mdfld_dsi_dpi_init(struct drm_device *dev,
 	/*create drm encoder object*/
 	connector = &dsi_connector->base.base;
 	encoder = &dpi_output->base.base.base;
-	drm_encoder_init(dev,
-			encoder,
-			p_funcs->encoder_funcs,
-			DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(dev, encoder,
+			       p_funcs->encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	drm_encoder_helper_add(encoder,
 				p_funcs->encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index f4370232767d..a25e40e8c46e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -651,9 +651,9 @@ void oaktrail_hdmi_init(struct drm_device *dev,
 			   &oaktrail_hdmi_connector_funcs,
 			   DRM_MODE_CONNECTOR_DVID);
 
-	drm_encoder_init(dev, encoder,
-			 &oaktrail_hdmi_enc_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder,
+			       &oaktrail_hdmi_enc_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 582e09597500..955f608f199c 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -311,8 +311,8 @@ void oaktrail_lvds_init(struct drm_device *dev,
 			   &psb_intel_lvds_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 
-	drm_encoder_init(dev, encoder, &psb_intel_lvds_enc_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &psb_intel_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index afaebab7bc17..a06323802517 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -683,9 +683,9 @@ void psb_intel_lvds_init(struct drm_device *dev,
 			   &psb_intel_lvds_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 
-	drm_encoder_init(dev, encoder,
-			 &psb_intel_lvds_enc_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(dev, encoder,
+			       &psb_intel_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 264d7ad004b4..5e1913e6a49f 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -2533,8 +2533,8 @@ bool psb_intel_sdvo_init(struct drm_device *dev, int sdvo_reg)
 	/* encoder type will be decided later */
 	gma_encoder = &psb_intel_sdvo->base;
 	gma_encoder->type = INTEL_OUTPUT_SDVO;
-	drm_encoder_init(dev, &gma_encoder->base, &psb_intel_sdvo_enc_funcs,
-			 0, NULL);
+	drm_encoder_init_funcs(dev, &gma_encoder->base,
+			       &psb_intel_sdvo_enc_funcs, 0, NULL);
 
 	/* Read the regs to test if we can talk to the device */
 	for (i = 0; i < 0x40; i++) {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 678ac2ef2a93..fff3f87dd8de 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -123,8 +123,8 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	}
 
 	encoder->possible_crtcs = 0x1;
-	ret = drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder, &hibmc_encoder_funcs,
+				     DRM_MODE_ENCODER_DAC, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init encoder: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index f31068d74b18..2613229c9213 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -713,8 +713,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder, &dw_encoder_funcs,
+				     DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index c3332209f27a..236764960a88 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -2023,8 +2023,9 @@ static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
 
 	priv->encoder.possible_crtcs = crtcs;
 
-	ret = drm_encoder_init(drm, &priv->encoder, &tda998x_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init_funcs(drm, &priv->encoder,
+				     &tda998x_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		goto err_encoder;
 
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index d842e280699d..ba2468331447 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1752,8 +1752,8 @@ void icl_dsi_init(struct drm_i915_private *dev_priv)
 	connector = &intel_connector->base;
 
 	/* register DSI encoder with DRM subsystem */
-	drm_encoder_init(dev, &encoder->base, &gen11_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, "DSI %c", port_name(port));
+	drm_encoder_init_funcs(dev, &encoder->base, &gen11_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, "DSI %c", port_name(port));
 
 	encoder->pre_pll_enable = gen11_dsi_pre_pll_enable;
 	encoder->pre_enable = gen11_dsi_pre_enable;
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index f49c98f6cb7e..162c36190b97 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -1020,8 +1020,9 @@ void intel_crt_init(struct drm_i915_private *dev_priv)
 	drm_connector_init(&dev_priv->drm, &intel_connector->base,
 			   &intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
 
-	drm_encoder_init(&dev_priv->drm, &crt->base.base, &intel_crt_enc_funcs,
-			 DRM_MODE_ENCODER_DAC, "CRT");
+	drm_encoder_init_funcs(&dev_priv->drm, &crt->base.base,
+			       &intel_crt_enc_funcs,
+			       DRM_MODE_ENCODER_DAC, "CRT");
 
 	intel_connector_attach_encoder(intel_connector, &crt->base);
 
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9f7d1d7189ae..6c296678cb1f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4875,8 +4875,10 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 
 	encoder = &intel_dig_port->base;
 
-	drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
-			 DRM_MODE_ENCODER_TMDS, "DDI %c", port_name(port));
+	drm_encoder_init_funcs(&dev_priv->drm, &encoder->base,
+			       &intel_ddi_funcs,
+			       DRM_MODE_ENCODER_TMDS, "DDI %c",
+			       port_name(port));
 
 	encoder->hotplug = intel_ddi_hotplug;
 	encoder->compute_output_type = intel_ddi_compute_output_type;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a5a9197f8f5..aebb9a7c2ea3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7798,9 +7798,9 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
 	intel_encoder = &intel_dig_port->base;
 	encoder = &intel_encoder->base;
 
-	if (drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
-			     &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
-			     "DP %c", port_name(port)))
+	if (drm_encoder_init_funcs(&dev_priv->drm, &intel_encoder->base,
+				   &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
+				   "DP %c", port_name(port)))
 		goto err_encoder_init;
 
 	intel_encoder->hotplug = intel_dp_hotplug;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 306c1549a680..d1f50f8c3b24 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -739,8 +739,10 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *intel_dig_port, enum
 	intel_encoder = &intel_mst->base;
 	intel_mst->primary = intel_dig_port;
 
-	drm_encoder_init(dev, &intel_encoder->base, &intel_dp_mst_enc_funcs,
-			 DRM_MODE_ENCODER_DPMST, "DP-MST %c", pipe_name(pipe));
+	drm_encoder_init_funcs(dev, &intel_encoder->base,
+			       &intel_dp_mst_enc_funcs,
+			       DRM_MODE_ENCODER_DPMST, "DP-MST %c",
+			       pipe_name(pipe));
 
 	intel_encoder->type = INTEL_OUTPUT_DP_MST;
 	intel_encoder->power_domain = intel_dig_port->base.power_domain;
diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
index 77f3d083b7a1..5c6b00e4a2d6 100644
--- a/drivers/gpu/drm/i915/display/intel_dvo.c
+++ b/drivers/gpu/drm/i915/display/intel_dvo.c
@@ -499,9 +499,9 @@ void intel_dvo_init(struct drm_i915_private *dev_priv)
 			continue;
 
 		port = intel_dvo_port(dvo->dvo_reg);
-		drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
-				 &intel_dvo_enc_funcs, encoder_type,
-				 "DVO %c", port_name(port));
+		drm_encoder_init_funcs(&dev_priv->drm, &intel_encoder->base,
+				       &intel_dvo_enc_funcs, encoder_type,
+				       "DVO %c", port_name(port));
 
 		intel_encoder->type = INTEL_OUTPUT_DVO;
 		intel_encoder->power_domain = POWER_DOMAIN_PORT_OTHER;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index bdbb5ce3fa81..c28b8161801a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3259,9 +3259,9 @@ void intel_hdmi_init(struct drm_i915_private *dev_priv,
 
 	intel_encoder = &intel_dig_port->base;
 
-	drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
-			 &intel_hdmi_enc_funcs, DRM_MODE_ENCODER_TMDS,
-			 "HDMI %c", port_name(port));
+	drm_encoder_init_funcs(&dev_priv->drm, &intel_encoder->base,
+			       &intel_hdmi_enc_funcs, DRM_MODE_ENCODER_TMDS,
+			       "HDMI %c", port_name(port));
 
 	intel_encoder->hotplug = intel_hdmi_hotplug;
 	intel_encoder->compute_config = intel_hdmi_compute_config;
diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index b7ad0b534790..aeebfb303cb6 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -876,8 +876,8 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
 	drm_connector_init(dev, &intel_connector->base, &intel_lvds_connector_funcs,
 			   DRM_MODE_CONNECTOR_LVDS);
 
-	drm_encoder_init(dev, &intel_encoder->base, &intel_lvds_enc_funcs,
-			 DRM_MODE_ENCODER_LVDS, "LVDS");
+	drm_encoder_init_funcs(dev, &intel_encoder->base, &intel_lvds_enc_funcs,
+			       DRM_MODE_ENCODER_LVDS, "LVDS");
 
 	intel_encoder->enable = intel_enable_lvds;
 	intel_encoder->pre_enable = intel_pre_enable_lvds;
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index b0588150752c..c76b8f989860 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -3273,9 +3273,9 @@ bool intel_sdvo_init(struct drm_i915_private *dev_priv,
 	intel_encoder->type = INTEL_OUTPUT_SDVO;
 	intel_encoder->power_domain = POWER_DOMAIN_PORT_OTHER;
 	intel_encoder->port = port;
-	drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
-			 &intel_sdvo_enc_funcs, 0,
-			 "SDVO %c", port_name(port));
+	drm_encoder_init_funcs(&dev_priv->drm, &intel_encoder->base,
+			       &intel_sdvo_enc_funcs, 0,
+			       "SDVO %c", port_name(port));
 
 	/* Read the regs to test if we can talk to the device */
 	for (i = 0; i < 0x40; i++) {
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index 4f81ee26b7ab..6724181d9750 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1941,8 +1941,8 @@ intel_tv_init(struct drm_i915_private *dev_priv)
 	drm_connector_init(dev, connector, &intel_tv_connector_funcs,
 			   DRM_MODE_CONNECTOR_SVIDEO);
 
-	drm_encoder_init(dev, &intel_encoder->base, &intel_tv_enc_funcs,
-			 DRM_MODE_ENCODER_TVDAC, "TV");
+	drm_encoder_init_funcs(dev, &intel_encoder->base, &intel_tv_enc_funcs,
+			       DRM_MODE_ENCODER_TVDAC, "TV");
 
 	intel_encoder->compute_config = intel_tv_compute_config;
 	intel_encoder->get_config = intel_tv_get_config;
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index d07cfad8ce6f..eae2c84aec41 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -1879,8 +1879,9 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
 
 	connector = &intel_connector->base;
 
-	drm_encoder_init(dev, encoder, &intel_dsi_funcs, DRM_MODE_ENCODER_DSI,
-			 "DSI %c", port_name(port));
+	drm_encoder_init_funcs(dev, encoder, &intel_dsi_funcs,
+			       DRM_MODE_ENCODER_DSI,
+			       "DSI %c", port_name(port));
 
 	intel_encoder->compute_config = intel_dsi_compute_config;
 	intel_encoder->pre_enable = intel_dsi_pre_enable;
diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index f22cfbf9353e..3b044be5f7ea 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -236,8 +236,8 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &dw_hdmi_imx_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &dw_hdmi_imx_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 4da22a94790c..c97193413ab1 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -441,8 +441,8 @@ static int imx_ldb_register(struct drm_device *drm,
 	}
 
 	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &imx_ldb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &imx_ldb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 5bbfaa2cd0f4..19c16e82a77a 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -479,8 +479,8 @@ static int imx_tve_register(struct drm_device *drm, struct imx_tve *tve)
 		return ret;
 
 	drm_encoder_helper_add(&tve->encoder, &imx_tve_encoder_helper_funcs);
-	drm_encoder_init(drm, &tve->encoder, &imx_tve_encoder_funcs,
-			 encoder_type, NULL);
+	drm_encoder_init_funcs(drm, &tve->encoder, &imx_tve_encoder_funcs,
+			       encoder_type, NULL);
 
 	drm_connector_helper_add(&tve->connector,
 			&imx_tve_connector_helper_funcs);
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 08fafa4bf8c2..2653bd895a45 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -288,8 +288,8 @@ static int imx_pd_register(struct drm_device *drm,
 	 */
 	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, encoder, &imx_pd_encoder_funcs,
-			 DRM_MODE_ENCODER_NONE, NULL);
+	drm_encoder_init_funcs(drm, encoder, &imx_pd_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 
 	imxpd->bridge.funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, &imxpd->bridge, NULL, 0);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9dfe7cb530e1..87f9b909b610 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -730,8 +730,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_encoder_helper_add(&priv->encoder,
 			       &ingenic_drm_encoder_helper_funcs);
 
-	ret = drm_encoder_init(drm, &priv->encoder, &ingenic_drm_encoder_funcs,
-			       DRM_MODE_ENCODER_DPI, NULL);
+	ret = drm_encoder_init_funcs(drm, &priv->encoder,
+				     &ingenic_drm_encoder_funcs,
+				     DRM_MODE_ENCODER_DPI, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to init encoder: %i", ret);
 		return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 14fbe1c09ce9..33463e8c5861 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -596,8 +596,9 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, &dpi->encoder,
+				     &mtk_dpi_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
 		goto err_unregister;
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 0ede69830a9d..a0a0f2b76194 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -888,8 +888,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
 
-	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
+	ret = drm_encoder_init_funcs(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
+				     DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to encoder init to drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index e8c94915a4fc..17f5548c5705 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1049,8 +1049,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	/* Encoder */
 
-	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
+	ret = drm_encoder_init_funcs(drm, encoder,
+				     &meson_venc_hdmi_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, "meson_hdmi");
 	if (ret) {
 		dev_err(priv->dev, "Failed to init HDMI encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
index 541f9eb2a135..171c7be45432 100644
--- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
@@ -280,8 +280,9 @@ int meson_venc_cvbs_create(struct meson_drm *priv)
 
 	drm_encoder_helper_add(encoder, &meson_venc_cvbs_encoder_helper_funcs);
 
-	ret = drm_encoder_init(drm, encoder, &meson_venc_cvbs_encoder_funcs,
-			       DRM_MODE_ENCODER_TVDAC, "meson_venc_cvbs");
+	ret = drm_encoder_init_funcs(drm, encoder,
+				     &meson_venc_cvbs_encoder_funcs,
+				     DRM_MODE_ENCODER_TVDAC, "meson_venc_cvbs");
 	if (ret) {
 		dev_err(priv->dev, "Failed to init CVBS encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 58d3400668f5..0cc1fb56dc85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2193,8 +2193,8 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (!dpu_enc)
 		return ERR_PTR(ENOMEM);
 
-	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
-			drm_enc_mode, NULL);
+	rc = drm_encoder_init_funcs(dev, &dpu_enc->base, &dpu_encoder_funcs,
+				    drm_enc_mode, NULL);
 	if (rc) {
 		devm_kfree(dev->dev, dpu_enc);
 		return ERR_PTR(rc);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index aaf2f26f8505..42a7d9c50c71 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -158,8 +158,8 @@ struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 
 	encoder = &mdp4_dsi_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, NULL);
+	drm_encoder_init_funcs(dev, encoder, &mdp4_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dsi_encoder_helper_funcs);
 
 	return encoder;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
index 5d8956055286..e5ba704eb4db 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
@@ -234,8 +234,8 @@ struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev)
 
 	encoder = &mdp4_dtv_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dtv_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &mdp4_dtv_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dtv_encoder_helper_funcs);
 
 	mdp4_dtv_encoder->hdmi_clk = devm_clk_get(dev->dev, "hdmi_clk");
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 871f3514ef69..982df491e71b 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -443,8 +443,8 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 
 	encoder = &mdp4_lcdc_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_lcdc_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &mdp4_lcdc_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
 	/* TODO: do we need different pll in other cases? */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index f48827283c2b..dcf43af98fa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -422,7 +422,8 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 
 	spin_lock_init(&mdp5_encoder->intf_lock);
 
-	drm_encoder_init(dev, encoder, &mdp5_encoder_funcs, enc_type, NULL);
+	drm_encoder_init_funcs(dev, encoder, &mdp5_encoder_funcs, enc_type,
+			       NULL);
 
 	drm_encoder_helper_add(encoder, &mdp5_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index e8eef88a8382..dbb40c925282 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -548,8 +548,8 @@ nv04_dac_create(struct drm_connector *connector, struct dcb_output *entry)
 	else
 		helper = &nv04_dac_helper_funcs;
 
-	drm_encoder_init(dev, encoder, &nv04_dac_funcs, DRM_MODE_ENCODER_DAC,
-			 NULL);
+	drm_encoder_init_funcs(dev, encoder, &nv04_dac_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
 	drm_encoder_helper_add(encoder, helper);
 
 	encoder->possible_crtcs = entry->heads;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index f9f4482c79b5..ebfb4aec39aa 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -706,7 +706,8 @@ nv04_dfp_create(struct drm_connector *connector, struct dcb_output *entry)
 	nv_encoder->dcb = entry;
 	nv_encoder->or = ffs(entry->or) - 1;
 
-	drm_encoder_init(connector->dev, encoder, &nv04_dfp_funcs, type, NULL);
+	drm_encoder_init_funcs(connector->dev, encoder, &nv04_dfp_funcs, type,
+			       NULL);
 	drm_encoder_helper_add(encoder, helper);
 
 	encoder->possible_crtcs = entry->heads;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index b701a4d8fe76..f31bf5352884 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -222,8 +222,8 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 	/* Initialize the common members */
 	encoder = to_drm_encoder(nv_encoder);
 
-	drm_encoder_init(dev, encoder, &nv04_tv_funcs, DRM_MODE_ENCODER_TVDAC,
-			 NULL);
+	drm_encoder_init_funcs(dev, encoder, &nv04_tv_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	drm_encoder_helper_add(encoder, &nv04_tv_helper_funcs);
 
 	nv_encoder->enc_save = drm_i2c_encoder_save;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 3a9489ed6544..984dd3b8bbee 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -808,8 +808,8 @@ nv17_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 	tv_enc->base.dcb = entry;
 	tv_enc->base.or = ffs(entry->or) - 1;
 
-	drm_encoder_init(dev, encoder, &nv17_tv_funcs, DRM_MODE_ENCODER_TVDAC,
-			 NULL);
+	drm_encoder_init_funcs(dev, encoder, &nv17_tv_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	drm_encoder_helper_add(encoder, &nv17_tv_helper_funcs);
 	to_encoder_slave(encoder)->slave_funcs = &nv17_tv_slave_funcs;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4d1c58468dbc..7b8cef0b2163 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -469,8 +469,8 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_dac_func, type,
-			 "dac-%04x-%04x", dcbe->hasht, dcbe->hashm);
+	drm_encoder_init_funcs(connector->dev, encoder, &nv50_dac_func, type,
+			       "dac-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_dac_help);
 
 	drm_connector_attach_encoder(connector, encoder);
@@ -1027,8 +1027,8 @@ nv50_msto_new(struct drm_device *dev, struct nv50_head *head, int id)
 	if (!msto)
 		return ERR_PTR(-ENOMEM);
 
-	ret = drm_encoder_init(dev, &msto->encoder, &nv50_msto,
-			       DRM_MODE_ENCODER_DPMST, "mst-%d", id);
+	ret = drm_encoder_init_funcs(dev, &msto->encoder, &nv50_msto,
+				     DRM_MODE_ENCODER_DPMST, "mst-%d", id);
 	if (ret) {
 		kfree(msto);
 		return ERR_PTR(ret);
@@ -1678,8 +1678,8 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_sor_func, type,
-			 "sor-%04x-%04x", dcbe->hasht, dcbe->hashm);
+	drm_encoder_init_funcs(connector->dev, encoder, &nv50_sor_func, type,
+			       "sor-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_sor_help);
 
 	drm_connector_attach_encoder(connector, encoder);
@@ -1834,8 +1834,8 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	encoder = to_drm_encoder(nv_encoder);
 	encoder->possible_crtcs = dcbe->heads;
 	encoder->possible_clones = 0;
-	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type,
-			 "pior-%04x-%04x", dcbe->hasht, dcbe->hashm);
+	drm_encoder_init_funcs(connector->dev, encoder, &nv50_pior_func, type,
+			       "pior-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_pior_help);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index ae4b867a67a3..39f586170b02 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -189,8 +189,8 @@ struct drm_encoder *omap_encoder_init(struct drm_device *dev,
 
 	encoder = &omap_encoder->base;
 
-	drm_encoder_init(dev, encoder, &omap_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, encoder, &omap_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &omap_encoder_helper_funcs);
 
 	return encoder;
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index cc5ee1b3af84..d554b4bb2b21 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -2779,27 +2779,27 @@ radeon_add_atom_encoder(struct drm_device *dev,
 	case ENCODER_OBJECT_ID_INTERNAL_LVTM1:
 		if (radeon_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			radeon_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			radeon_encoder->enc_priv = radeon_atombios_get_lvds_info(radeon_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			radeon_encoder->enc_priv = radeon_atombios_set_dig_info(radeon_encoder);
 		}
 		drm_encoder_helper_add(encoder, &radeon_atom_dig_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_DAC1:
-		drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		radeon_encoder->enc_priv = radeon_atombios_set_dac_info(radeon_encoder);
 		drm_encoder_helper_add(encoder, &radeon_atom_dac_helper_funcs);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_DAC2:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC1:
 	case ENCODER_OBJECT_ID_INTERNAL_KLDSCP_DAC2:
-		drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-				 DRM_MODE_ENCODER_TVDAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+				       DRM_MODE_ENCODER_TVDAC, NULL);
 		radeon_encoder->enc_priv = radeon_atombios_set_dac_info(radeon_encoder);
 		drm_encoder_helper_add(encoder, &radeon_atom_dac_helper_funcs);
 		break;
@@ -2813,16 +2813,16 @@ radeon_add_atom_encoder(struct drm_device *dev,
 	case ENCODER_OBJECT_ID_INTERNAL_UNIPHY3:
 		if (radeon_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 			radeon_encoder->rmx_type = RMX_FULL;
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 			radeon_encoder->enc_priv = radeon_atombios_get_lvds_info(radeon_encoder);
 		} else if (radeon_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT)) {
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 			radeon_encoder->enc_priv = radeon_atombios_set_dig_info(radeon_encoder);
 		} else {
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 			radeon_encoder->enc_priv = radeon_atombios_set_dig_info(radeon_encoder);
 		}
 		drm_encoder_helper_add(encoder, &radeon_atom_dig_helper_funcs);
@@ -2839,14 +2839,14 @@ radeon_add_atom_encoder(struct drm_device *dev,
 		/* these are handled by the primary encoders */
 		radeon_encoder->is_ext_encoder = true;
 		if (radeon_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT))
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_LVDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_LVDS, NULL);
 		else if (radeon_encoder->devices & (ATOM_DEVICE_CRT_SUPPORT))
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_DAC, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_DAC, NULL);
 		else
-			drm_encoder_init(dev, encoder, &radeon_atom_enc_funcs,
-					 DRM_MODE_ENCODER_TMDS, NULL);
+			drm_encoder_init_funcs(dev, encoder, &radeon_atom_enc_funcs,
+					       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &radeon_atom_ext_helper_funcs);
 		break;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 008308780443..ae68a2d11ea9 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -612,8 +612,8 @@ radeon_dp_create_fake_mst_encoder(struct radeon_connector *connector)
 		break;
 	}
 
-	drm_encoder_init(dev, &radeon_encoder->base, &radeon_dp_mst_enc_funcs,
-			 DRM_MODE_ENCODER_DPMST, NULL);
+	drm_encoder_init_funcs(dev, &radeon_encoder->base, &radeon_dp_mst_enc_funcs,
+			       DRM_MODE_ENCODER_DPMST, NULL);
 	drm_encoder_helper_add(encoder, &radeon_mst_helper_funcs);
 
 	mst_enc = radeon_encoder->enc_priv;
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index 44d060f75318..b26e9cd67963 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -1779,8 +1779,8 @@ radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_
 	switch (radeon_encoder->encoder_id) {
 	case ENCODER_OBJECT_ID_INTERNAL_LVDS:
 		encoder->possible_crtcs = 0x1;
-		drm_encoder_init(dev, encoder, &radeon_legacy_lvds_enc_funcs,
-				 DRM_MODE_ENCODER_LVDS, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_legacy_lvds_enc_funcs,
+				       DRM_MODE_ENCODER_LVDS, NULL);
 		drm_encoder_helper_add(encoder, &radeon_legacy_lvds_helper_funcs);
 		if (rdev->is_atom_bios)
 			radeon_encoder->enc_priv = radeon_atombios_get_lvds_info(radeon_encoder);
@@ -1789,14 +1789,14 @@ radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_
 		radeon_encoder->rmx_type = RMX_FULL;
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_TMDS1:
-		drm_encoder_init(dev, encoder, &radeon_legacy_tmds_int_enc_funcs,
-				 DRM_MODE_ENCODER_TMDS, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_legacy_tmds_int_enc_funcs,
+				       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &radeon_legacy_tmds_int_helper_funcs);
 		radeon_encoder->enc_priv = radeon_legacy_get_tmds_info(radeon_encoder);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_DAC1:
-		drm_encoder_init(dev, encoder, &radeon_legacy_primary_dac_enc_funcs,
-				 DRM_MODE_ENCODER_DAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_legacy_primary_dac_enc_funcs,
+				       DRM_MODE_ENCODER_DAC, NULL);
 		drm_encoder_helper_add(encoder, &radeon_legacy_primary_dac_helper_funcs);
 		if (rdev->is_atom_bios)
 			radeon_encoder->enc_priv = radeon_atombios_get_primary_dac_info(radeon_encoder);
@@ -1804,8 +1804,8 @@ radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_
 			radeon_encoder->enc_priv = radeon_combios_get_primary_dac_info(radeon_encoder);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_DAC2:
-		drm_encoder_init(dev, encoder, &radeon_legacy_tv_dac_enc_funcs,
-				 DRM_MODE_ENCODER_TVDAC, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_legacy_tv_dac_enc_funcs,
+				       DRM_MODE_ENCODER_TVDAC, NULL);
 		drm_encoder_helper_add(encoder, &radeon_legacy_tv_dac_helper_funcs);
 		if (rdev->is_atom_bios)
 			radeon_encoder->enc_priv = radeon_atombios_get_tv_dac_info(radeon_encoder);
@@ -1813,8 +1813,8 @@ radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_
 			radeon_encoder->enc_priv = radeon_combios_get_tv_dac_info(radeon_encoder);
 		break;
 	case ENCODER_OBJECT_ID_INTERNAL_DVO1:
-		drm_encoder_init(dev, encoder, &radeon_legacy_tmds_ext_enc_funcs,
-				 DRM_MODE_ENCODER_TMDS, NULL);
+		drm_encoder_init_funcs(dev, encoder, &radeon_legacy_tmds_ext_enc_funcs,
+				       DRM_MODE_ENCODER_TMDS, NULL);
 		drm_encoder_helper_add(encoder, &radeon_legacy_tmds_ext_helper_funcs);
 		if (!rdev->is_atom_bios)
 			radeon_encoder->enc_priv = radeon_legacy_get_ext_tmds_info(radeon_encoder);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index c07c6a88aff0..9e8e7771e109 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -110,8 +110,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		}
 	}
 
-	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init_funcs(rcdu->ddev, encoder, &encoder_funcs,
+				     DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0)
 		goto done;
 
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index f38f5e113c6b..da4a11444832 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -309,8 +309,9 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_dp_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder,
+				     &rockchip_dp_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index eed594bd38d3..7860704d54f4 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1030,8 +1030,8 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_encoder_init(drm_dev, encoder, &cdn_dp_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder, &cdn_dp_encoder_funcs,
+				     DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 6e1270e45f97..817c9844db5b 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -802,8 +802,9 @@ static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dsi->dev->of_node);
 
-	ret = drm_encoder_init(drm_dev, encoder, &dw_mipi_dsi_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder,
+				     &dw_mipi_dsi_encoder_funcs,
+				     DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7f56d8c3491d..05c9f2f8109d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -546,8 +546,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e5864e823020..e39a56fefbcb 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -617,8 +617,8 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 		return -EPROBE_DEFER;
 
 	drm_encoder_helper_add(encoder, &inno_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &inno_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &inno_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fe203d38664e..549dca57505a 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -557,8 +557,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 		return -EPROBE_DEFER;
 
 	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &rk3066_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 449a62908d21..b58322165b0f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -607,8 +607,9 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_lvds_encoder_funcs,
-			       DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder,
+				     &rockchip_lvds_encoder_funcs,
+				     DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 90784781e515..6b1d730dd901 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -126,8 +126,9 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	encoder = &rgb->encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_rgb_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init_funcs(drm_dev, encoder,
+				     &rockchip_rgb_encoder_funcs,
+				     DRM_MODE_ENCODER_NONE, NULL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 75a752d59ef1..c076e62babc2 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -576,8 +576,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_encoder_init(sdev->ddev, encoder, &encoder_funcs,
-			       DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_encoder_init_funcs(sdev->ddev, encoder, &encoder_funcs,
+				     DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index c36a8da373cb..2d4edf983e5a 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -673,9 +673,9 @@ sti_tvout_create_dvo_encoder(struct drm_device *dev,
 
 	drm_encoder->possible_crtcs = ENCODER_CRTC_MASK;
 
-	drm_encoder_init(dev, drm_encoder,
-			 &sti_tvout_encoder_funcs, DRM_MODE_ENCODER_LVDS,
-			 NULL);
+	drm_encoder_init_funcs(dev, drm_encoder,
+			       &sti_tvout_encoder_funcs, DRM_MODE_ENCODER_LVDS,
+			       NULL);
 
 	drm_encoder_helper_add(drm_encoder, &sti_dvo_encoder_helper_funcs);
 
@@ -725,8 +725,9 @@ static struct drm_encoder *sti_tvout_create_hda_encoder(struct drm_device *dev,
 
 	drm_encoder->possible_crtcs = ENCODER_CRTC_MASK;
 
-	drm_encoder_init(dev, drm_encoder,
-			&sti_tvout_encoder_funcs, DRM_MODE_ENCODER_DAC, NULL);
+	drm_encoder_init_funcs(dev, drm_encoder,
+			       &sti_tvout_encoder_funcs, DRM_MODE_ENCODER_DAC,
+			       NULL);
 
 	drm_encoder_helper_add(drm_encoder, &sti_hda_encoder_helper_funcs);
 
@@ -773,8 +774,9 @@ static struct drm_encoder *sti_tvout_create_hdmi_encoder(struct drm_device *dev,
 
 	drm_encoder->possible_crtcs = ENCODER_CRTC_MASK;
 
-	drm_encoder_init(dev, drm_encoder,
-			&sti_tvout_encoder_funcs, DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(dev, drm_encoder,
+			       &sti_tvout_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(drm_encoder, &sti_hdmi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index df585fe64f61..28b451a50307 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1104,8 +1104,8 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 	encoder->possible_crtcs = CRTC_MASK;
 	encoder->possible_clones = 0;	/* No cloning support */
 
-	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
-			 DRM_MODE_ENCODER_DPI, NULL);
+	drm_encoder_init_funcs(ddev, encoder, &ltdc_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 
 	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 68d4644ac2dc..f08e4e4c79d0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -611,11 +611,11 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&hdmi->encoder,
 			       &sun4i_hdmi_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &hdmi->encoder,
-			       &sun4i_hdmi_funcs,
-			       DRM_MODE_ENCODER_TMDS,
-			       NULL);
+	ret = drm_encoder_init_funcs(drm,
+				     &hdmi->encoder,
+				     &sun4i_hdmi_funcs,
+				     DRM_MODE_ENCODER_TMDS,
+				     NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the HDMI encoder\n");
 		goto err_put_ddc_i2c;
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 26e5c7ceb8ff..b25bfb6e0c5f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -121,11 +121,11 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &lvds->encoder,
-			       &sun4i_lvds_enc_funcs,
-			       DRM_MODE_ENCODER_LVDS,
-			       NULL);
+	ret = drm_encoder_init_funcs(drm,
+				     &lvds->encoder,
+				     &sun4i_lvds_enc_funcs,
+				     DRM_MODE_ENCODER_LVDS,
+				     NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the lvds encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 3b23d5be3cf3..1601337e96f3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -218,11 +218,11 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &rgb->encoder,
-			       &sun4i_rgb_enc_funcs,
-			       DRM_MODE_ENCODER_NONE,
-			       NULL);
+	ret = drm_encoder_init_funcs(drm,
+				     &rgb->encoder,
+				     &sun4i_rgb_enc_funcs,
+				     DRM_MODE_ENCODER_NONE,
+				     NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialise the rgb encoder\n");
 		goto err_out;
diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
index 39c15282e448..84a7ce72058f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
@@ -592,11 +592,11 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&tv->encoder,
 			       &sun4i_tv_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &tv->encoder,
-			       &sun4i_tv_funcs,
-			       DRM_MODE_ENCODER_TVDAC,
-			       NULL);
+	ret = drm_encoder_init_funcs(drm,
+				     &tv->encoder,
+				     &sun4i_tv_funcs,
+				     DRM_MODE_ENCODER_TVDAC,
+				     NULL);
 	if (ret) {
 		dev_err(dev, "Couldn't initialise the TV encoder\n");
 		goto err_disable_clk;
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 059939789730..50954c2adc4e 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1062,11 +1062,11 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_encoder_helper_add(&dsi->encoder,
 			       &sun6i_dsi_enc_helper_funcs);
-	ret = drm_encoder_init(drm,
-			       &dsi->encoder,
-			       &sun6i_dsi_enc_funcs,
-			       DRM_MODE_ENCODER_DSI,
-			       NULL);
+	ret = drm_encoder_init_funcs(drm,
+				     &dsi->encoder,
+				     &sun6i_dsi_enc_funcs,
+				     DRM_MODE_ENCODER_DSI,
+				     NULL);
 	if (ret) {
 		dev_err(dsi->dev, "Couldn't initialise the DSI encoder\n");
 		return ret;
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index e8a317d5ba19..27d086674963 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -220,8 +220,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 
 	sun8i_hdmi_phy_init(hdmi->phy);
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 88b9d64c77bf..08005e3859d4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1058,9 +1058,9 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_encoder_init(drm, &dsi->output.encoder,
-				 &tegra_dsi_encoder_funcs,
-				 DRM_MODE_ENCODER_DSI, NULL);
+		drm_encoder_init_funcs(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..a1b4f9903f35 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1445,8 +1445,9 @@ static int tegra_hdmi_init(struct host1x_client *client)
 				 &tegra_hdmi_connector_helper_funcs);
 	hdmi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &hdmi->output.encoder, &tegra_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, &hdmi->output.encoder,
+			       &tegra_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(&hdmi->output.encoder,
 			       &tegra_hdmi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 4be4dfd4a68a..f0da4668feb5 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -281,8 +281,8 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 				 &tegra_rgb_connector_helper_funcs);
 	output->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
+	drm_encoder_init_funcs(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 81226a4953c1..bf36eda2b878 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3102,8 +3102,8 @@ static int tegra_sor_init(struct host1x_client *client)
 				 &tegra_sor_connector_helper_funcs);
 	sor->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_encoder_init(drm, &sor->output.encoder, &tegra_sor_encoder_funcs,
-			 encoder, NULL);
+	drm_encoder_init_funcs(drm, &sor->output.encoder,
+			       &tegra_sor_encoder_funcs, encoder, NULL);
 	drm_encoder_helper_add(&sor->output.encoder, helpers);
 
 	drm_connector_attach_encoder(&sor->output.connector,
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 83785b0a66a9..909d48b21c04 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -75,8 +75,8 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 
 	enc->possible_crtcs = possible_crtcs;
 
-	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
-			       encoder_type, NULL);
+	ret = drm_encoder_init_funcs(&tidss->ddev, enc, &encoder_funcs,
+				     encoder_type, NULL);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 28b7f703236e..ed5863d09572 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -131,11 +131,11 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	if (!priv->external_encoder)
 		return -ENOMEM;
 
-	ret = drm_encoder_init(ddev, priv->external_encoder,
-			       &tilcdc_external_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init_funcs(ddev, priv->external_encoder,
+				     &tilcdc_external_encoder_funcs,
+				     DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
-		dev_err(ddev->dev, "drm_encoder_init() failed %d\n", ret);
+		dev_err(ddev->dev, "drm_encoder_init_funcs() failed %d\n", ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 5584e656b857..ac82d3fd4719 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -102,8 +102,8 @@ static struct drm_encoder *panel_encoder_create(struct drm_device *dev,
 	encoder = &panel_encoder->base;
 	encoder->possible_crtcs = 1;
 
-	ret = drm_encoder_init(dev, encoder, &panel_encoder_funcs,
-			DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder, &panel_encoder_funcs,
+				     DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		goto fail;
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 0883a435e62b..65af050c5533 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -617,8 +617,8 @@ static struct drm_encoder *vbox_encoder_init(struct drm_device *dev,
 	if (!vbox_encoder)
 		return NULL;
 
-	drm_encoder_init(dev, &vbox_encoder->base, &vbox_enc_funcs,
-			 DRM_MODE_ENCODER_DAC, NULL);
+	drm_encoder_init_funcs(dev, &vbox_encoder->base, &vbox_enc_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
 
 	vbox_encoder->base.possible_crtcs = 1 << i;
 	return &vbox_encoder->base;
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 6dfede03396e..a34bd0f9550d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -309,8 +309,8 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_encoder_init(drm, dpi->encoder, &vc4_dpi_encoder_funcs,
-			 DRM_MODE_ENCODER_DPI, NULL);
+	drm_encoder_init_funcs(drm, dpi->encoder, &vc4_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index d99b1d526651..76bfc4613b61 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1615,8 +1615,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (dsi->port == 1)
 		vc4->dsi1 = dsi;
 
-	drm_encoder_init(drm, dsi->encoder, &vc4_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_DSI, NULL);
+	drm_encoder_init_funcs(drm, dsi->encoder, &vc4_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cea18dc15f77..16ed75c4b7ce 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1394,8 +1394,8 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	}
 	pm_runtime_enable(dev);
 
-	drm_encoder_init(drm, hdmi->encoder, &vc4_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, hdmi->encoder, &vc4_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(hdmi->encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	hdmi->connector =
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 7402bc768664..a4c10d893ab4 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -566,8 +566,8 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_encoder_init(drm, vec->encoder, &vc4_vec_encoder_funcs,
-			 DRM_MODE_ENCODER_TVDAC, NULL);
+	drm_encoder_init_funcs(drm, vec->encoder, &vc4_vec_encoder_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	drm_encoder_helper_add(vec->encoder, &vc4_vec_encoder_helper_funcs);
 
 	vec->connector = vc4_vec_connector_init(drm, vec);
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 2b7e6ae65546..f9603e7660fb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -276,8 +276,8 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
-			 DRM_MODE_ENCODER_VIRTUAL, NULL);
+	drm_encoder_init_funcs(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index fb1941a6522c..a1b0fe80e573 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -70,8 +70,8 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder, &vkms_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 16dafff5cab1..ec0be6100a66 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -429,8 +429,8 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_connector_helper_add(connector, &vmw_ldu_connector_helper_funcs);
 	connector->status = vmw_du_connector_detect(connector, true);
 
-	ret = drm_encoder_init(dev, encoder, &vmw_legacy_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder, &vmw_legacy_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder\n");
 		goto err_free_connector;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 32a22e4eddb1..29793f7e4bb6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -901,8 +901,9 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_connector_helper_add(connector, &vmw_sou_connector_helper_funcs);
 	connector->status = vmw_du_connector_detect(connector, true);
 
-	ret = drm_encoder_init(dev, encoder, &vmw_screen_object_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder,
+				     &vmw_screen_object_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder\n");
 		goto err_free_connector;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 570687a1a327..91314e833593 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1796,8 +1796,8 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_connector_helper_add(connector, &vmw_stdu_connector_helper_funcs);
 	connector->status = vmw_du_connector_detect(connector, false);
 
-	ret = drm_encoder_init(dev, encoder, &vmw_stdu_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_encoder_init_funcs(dev, encoder, &vmw_stdu_encoder_funcs,
+				     DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder\n");
 		goto err_free_connector;
diff --git a/drivers/gpu/drm/zte/zx_hdmi.c b/drivers/gpu/drm/zte/zx_hdmi.c
index b98a1420dcd3..13bf9af4058b 100644
--- a/drivers/gpu/drm/zte/zx_hdmi.c
+++ b/drivers/gpu/drm/zte/zx_hdmi.c
@@ -313,8 +313,8 @@ static int zx_hdmi_register(struct drm_device *drm, struct zx_hdmi *hdmi)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	drm_encoder_init(drm, encoder, &zx_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_init_funcs(drm, encoder, &zx_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &zx_hdmi_encoder_helper_funcs);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
diff --git a/drivers/gpu/drm/zte/zx_tvenc.c b/drivers/gpu/drm/zte/zx_tvenc.c
index c598b7daf1f1..075e3a5243c9 100644
--- a/drivers/gpu/drm/zte/zx_tvenc.c
+++ b/drivers/gpu/drm/zte/zx_tvenc.c
@@ -285,8 +285,8 @@ static int zx_tvenc_register(struct drm_device *drm, struct zx_tvenc *tvenc)
 	 */
 	encoder->possible_crtcs = BIT(1);
 
-	drm_encoder_init(drm, encoder, &zx_tvenc_encoder_funcs,
-			 DRM_MODE_ENCODER_TVDAC, NULL);
+	drm_encoder_init_funcs(drm, encoder, &zx_tvenc_encoder_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	drm_encoder_helper_add(encoder, &zx_tvenc_encoder_helper_funcs);
 
 	connector->interlace_allowed = true;
diff --git a/drivers/gpu/drm/zte/zx_vga.c b/drivers/gpu/drm/zte/zx_vga.c
index c4fa3bbaba78..2fa0647389d1 100644
--- a/drivers/gpu/drm/zte/zx_vga.c
+++ b/drivers/gpu/drm/zte/zx_vga.c
@@ -154,8 +154,8 @@ static int zx_vga_register(struct drm_device *drm, struct zx_vga *vga)
 
 	encoder->possible_crtcs = VOU_CRTC_MASK;
 
-	ret = drm_encoder_init(drm, encoder, &zx_vga_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
+	ret = drm_encoder_init_funcs(drm, encoder, &zx_vga_encoder_funcs,
+				     DRM_MODE_ENCODER_DAC, NULL);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to init encoder: %d\n", ret);
 		return ret;
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 4370e039c015..378ab1778be3 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -186,10 +186,10 @@ struct drm_encoder {
 #define obj_to_encoder(x) container_of(x, struct drm_encoder, base)
 
 __printf(5, 6)
-int drm_encoder_init(struct drm_device *dev,
-		     struct drm_encoder *encoder,
-		     const struct drm_encoder_funcs *funcs,
-		     int encoder_type, const char *name, ...);
+int drm_encoder_init_funcs(struct drm_device *dev,
+			   struct drm_encoder *encoder,
+			   const struct drm_encoder_funcs *funcs,
+			   int encoder_type, const char *name, ...);
 
 /**
  * drm_encoder_index - find the index of a registered encoder
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
