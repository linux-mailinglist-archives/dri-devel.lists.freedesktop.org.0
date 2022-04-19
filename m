Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937950723D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 17:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99BF10EEBF;
	Tue, 19 Apr 2022 15:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C32894DE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 15:53:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t25so30157011lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFUibmeCRNf+XWbZaMYPJ/4OrtnAS/dOcs2jv92zxZU=;
 b=dyd8+VNFrW1I9kq4df1SMkfsXIsinkvj7ScYYcNQMxYNmWAux/uu6eAeH0oa1vV3P+
 gMqDGJluK3NtDOYqjL5KXhvPLFC73UU2ODEnkaawXVOxLXjIhRfXzZebaQU1vaIEZej7
 6it5ojfrNGqis/LzPoXGypt/JPYLgh2cgHd/JaNZJmlX+RfvXJ/MzmJrhLd1ksXLrlnH
 YWid4GZ1EHL+x9Lt2WxUiMt+H+jqVY3kari79c2i5EB6k+PyaImuMwZ0U0u71WOaOhi5
 Q/1fiDvBPX1MQi81277i5OwXbUphz79uB2BChNlKXFjbSCXTRYMUs/+F9X0ftXJsHEoO
 FlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFUibmeCRNf+XWbZaMYPJ/4OrtnAS/dOcs2jv92zxZU=;
 b=3INkIEY8lRKMGOmPzKS1gZtnmJ3Bj7kl1rT98ZdFEheiUbpEcma/oXNVdEeNqMeWJp
 NyJG3KF+m2HUDPmloweC1kXljh5lHY/46ixySrmrUp0IypcDMHKvwjX6h3EqjFIT6PMJ
 2i0KNrgbdmbyLnsercRtQyUhfbDTGDfIMvlJz8jM9I6pX9HdURS9idhMj6CI6J8fs3HZ
 4G9OLvwXK0XvzbS9yGRC3HtegD/xJemGERV7QbM0xxRSCBLyBMuL43qyuyd0CCxZVC4E
 EfY725gBsUGnfGx+vByJnzJYpaVKNy86NTicQfjvlOMKFCHzRMLMSDXsyCyDAspgEkln
 5R+A==
X-Gm-Message-State: AOAM532+2Gb02Kl2uRwXnTvwvCvxmwMWdmhm8dK9jm/Had8WMWJWAbvt
 ZDuUTKgKflz5ndnqFer3QMICcQ==
X-Google-Smtp-Source: ABdhPJweTzzXTkwFgaaz9uBuQE6MXfqVOsT/PCcFJYxnyKQxO5l7voLZe96XYVQM1SNprqN6SyyNhQ==
X-Received: by 2002:a05:6512:c0c:b0:471:adb6:4d6d with SMTP id
 z12-20020a0565120c0c00b00471adb64d6dmr2082244lfu.11.1650383630821; 
 Tue, 19 Apr 2022 08:53:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 r25-20020ac25f99000000b00471a439838esm313911lfe.145.2022.04.19.08.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:53:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 5/6] drm/msm: allow compile time selection of driver
 components
Date: Tue, 19 Apr 2022 18:53:45 +0300
Message-Id: <20220419155346.1272627-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
References: <20220419155346.1272627-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MSM DRM driver already allows one to compile out the DP or DSI support.
Add support for disabling other features like MDP4/MDP5/DPU drivers or
direct HDMI output support.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig                   | 50 +++++++++++++++++--
 drivers/gpu/drm/msm/Makefile                  | 24 ++++++---
 .../gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c  |  3 ++
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  |  3 ++
 drivers/gpu/drm/msm/msm_drv.h                 | 33 ++++++++++++
 drivers/gpu/drm/msm/msm_mdss.c                | 13 ++++-
 6 files changed, 115 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index c79502525963..e99719067cd0 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -47,12 +47,39 @@ config DRM_MSM_GPU_SUDO
 	  Only use this if you are a driver developer.  This should *not*
 	  be enabled for production kernels.  If unsure, say N.
 
-config DRM_MSM_HDMI_HDCP
-	bool "Enable HDMI HDCP support in MSM DRM driver"
+config DRM_MSM_MDSS
+	bool
+	depends on DRM_MSM
+	default n
+
+config DRM_MSM_MDP4
+	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
 	default y
 	help
-	  Choose this option to enable HDCP state machine
+	  Compile in support for the Mobile Display Processor v4 (MDP4) in
+	  the MSM DRM driver. It is the older display controller found in
+	  devices using APQ8064/MSM8960/MSM8x60 platforms.
+
+config DRM_MSM_MDP5
+	bool "Enable MDP5 support in MSM DRM driver"
+	depends on DRM_MSM
+	select DRM_MSM_MDSS
+	default y
+	help
+	  Compile in support for the Mobile Display Processor v5 (MDP5) in
+	  the MSM DRM driver. It is the display controller found in devices
+	  using e.g. APQ8016/MSM8916/APQ8096/MSM8996/MSM8974/SDM6x0 platforms.
+
+config DRM_MSM_DPU
+	bool "Enable DPU support in MSM DRM driver"
+	depends on DRM_MSM
+	select DRM_MSM_MDSS
+	default y
+	help
+	  Compile in support for the Display Processing Unit in
+	  the MSM DRM driver. It is the display controller found in devices
+	  using e.g. SDM845 and newer platforms.
 
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
@@ -117,3 +144,20 @@ config DRM_MSM_DSI_7NM_PHY
 	help
 	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
 	  the platform.
+
+config DRM_MSM_HDMI
+	bool "Enable HDMI support in MSM DRM driver"
+	depends on DRM_MSM
+	default y
+	help
+	  Compile in support for the HDMI output MSM DRM driver. It can
+	  be a primary or a secondary display on device. Note that this is used
+	  only for the direct HDMI output. If the device outputs HDMI data
+	  throught some kind of DSI-to-HDMI bridge, this option can be disabled.
+
+config DRM_MSM_HDMI_HDCP
+	bool "Enable HDMI HDCP support in MSM DRM driver"
+	depends on DRM_MSM && DRM_MSM_HDMI
+	default y
+	help
+	  Choose this option to enable HDCP state machine
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index e76927b42033..3dc576309255 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -16,6 +16,8 @@ msm-y := \
 	adreno/a6xx_gpu.o \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
+
+msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -27,9 +29,10 @@ msm-y := \
 	hdmi/hdmi_phy_8x60.o \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
-	disp/mdp_format.o \
-	disp/mdp_kms.o \
+
+msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_crtc.o \
+	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
 	disp/mdp4/mdp4_lcdc_encoder.o \
 	disp/mdp4/mdp4_lvds_connector.o \
@@ -37,7 +40,10 @@ msm-y := \
 	disp/mdp4/mdp4_irq.o \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
+
+msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_cfg.o \
+	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
 	disp/mdp5/mdp5_crtc.o \
 	disp/mdp5/mdp5_encoder.o \
@@ -47,6 +53,8 @@ msm-y := \
 	disp/mdp5/mdp5_mixer.o \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
+
+msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
 	disp/dpu1/dpu_encoder.o \
@@ -69,6 +77,13 @@ msm-y := \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
+
+msm-$(CONFIG_DRM_MSM_MDSS) += \
+	msm_mdss.o \
+
+msm-y += \
+	disp/mdp_format.o \
+	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 	msm_atomic.o \
@@ -86,7 +101,6 @@ msm-y := \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_mdss.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
@@ -117,12 +131,10 @@ msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
 msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
-			disp/mdp4/mdp4_dsi_encoder.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
-			dsi/phy/dsi_phy.o \
-			disp/mdp5/mdp5_cmd_encoder.o
+			dsi/phy/dsi_phy.o
 
 msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
 msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index aaf2f26f8505..39b8fe53c29d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -11,6 +11,8 @@
 
 #include "mdp4_kms.h"
 
+#ifdef CONFIG_DRM_MSM_DSI
+
 struct mdp4_dsi_encoder {
 	struct drm_encoder base;
 	struct drm_panel *panel;
@@ -170,3 +172,4 @@ struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+#endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index ec6c7b09865e..a640af22eafc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -8,6 +8,8 @@
 
 #include "mdp5_kms.h"
 
+#ifdef CONFIG_DRM_MSM_DSI
+
 static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 {
 	struct msm_drm_private *priv = encoder->dev->dev_private;
@@ -198,3 +200,4 @@ int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
 
 	return 0;
 }
+#endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 19d2767c5363..bb821705399a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -314,10 +314,20 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev);
 void msm_fbdev_free(struct drm_device *dev);
 
 struct hdmi;
+#ifdef CONFIG_DRM_MSM_HDMI
 int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
 		struct drm_encoder *encoder);
 void __init msm_hdmi_register(void);
 void __exit msm_hdmi_unregister(void);
+#else
+static inline int msm_hdmi_modeset_init(struct hdmi *hdmi, struct drm_device *dev,
+		struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+static inline void __init msm_hdmi_register(void) {}
+static inline void __exit msm_hdmi_unregister(void) {}
+#endif
 
 struct msm_dsi;
 #ifdef CONFIG_DRM_MSM_DSI
@@ -432,14 +442,37 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 
 #endif
 
+#ifdef CONFIG_DRM_MSM_MDP4
 void msm_mdp4_register(void);
 void msm_mdp4_unregister(void);
+#else
+static inline void msm_mdp4_register(void) {}
+static inline void msm_mdp4_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDP5
 void msm_mdp_register(void);
 void msm_mdp_unregister(void);
+#else
+static inline void msm_mdp_register(void) {}
+static inline void msm_mdp_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_DPU
 void msm_dpu_register(void);
 void msm_dpu_unregister(void);
+#else
+static inline void msm_dpu_register(void) {}
+static inline void msm_dpu_unregister(void) {}
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);
+#else
+static inline void msm_mdss_register(void) {}
+static inline void msm_mdss_unregister(void) {}
+#endif
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index c94b78431687..0af86fc1a130 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -312,8 +312,17 @@ static const struct dev_pm_ops mdss_pm_ops = {
 
 static int find_mdp_node(struct device *dev, void *data)
 {
-	return of_match_node(dpu_dt_match, dev->of_node) ||
-		of_match_node(mdp5_dt_match, dev->of_node);
+#ifdef CONFIG_DRM_MSM_DPU
+	if (of_match_node(dpu_dt_match, dev->of_node))
+		return true;
+#endif
+
+#ifdef CONFIG_DRM_MSM_MDP5
+	if (of_match_node(mdp5_dt_match, dev->of_node))
+		return true;
+#endif
+
+	return false;
 }
 
 static int mdss_probe(struct platform_device *pdev)
-- 
2.35.1

