Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0728667FB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72310E5C8;
	Mon, 26 Feb 2024 02:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s5RclDCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25D710E5C6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:53 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-512f5484a37so1395975e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913512; x=1709518312; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lr1blVGAcoSGI3DjOlnBnp5duz00dIqA6nxHMeCLWdU=;
 b=s5RclDCVbyMxKaXE0IbGF9XeQU3/QyOifrZVqGD15QyRlPLyUGYy37ZFt4f8pAsJGp
 7KAnY54wo9ekt6NNwdMrpwbDv+2mDx8pTO9216GaOR3yisrIZeylVa4WbTbKFvTkFF49
 Y5LOmice9Zo3D0AAA9NFfDQC4UHME5ZX6ei/z7Wvk8NEAafU23+fOA4RkvQPIFGy9xkc
 7r7VMu1FmUaZbran+Fiotp+xkUwwQPDQKFyFJla8+9ghonn1Lm4NeaOuf20o65mbtxzV
 9GIRQu9phh689FqEa6zdHOjpgc3QX85O4qqiL6hXwodnG9fyCZ+55++6oXJm1LjPPH1j
 UY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913512; x=1709518312;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lr1blVGAcoSGI3DjOlnBnp5duz00dIqA6nxHMeCLWdU=;
 b=dAeBQWBP+R3/unUZUS9e0UU8c47I37McOwSLv94L3SHCt4BV79QRbDyF7gElwe+Eca
 Nt2OqDp6eqJMzi/si3PhUu/fiJROZCkhPDyLuVmkmyyhBAK3t6rf+s3cxMihut1Mk3KD
 wcsskbFQFFG/XA42etCvmyE0IHClkCdd4kg9ScQNvHUNpkO7lHBpLDfgeing8EZ6P6Rp
 +xT/mtbLdLa+jXHT2ok1DQaEBxqAhpG1knu3je97bkMn/SUKzO8Va0pfJivHABCUYKp5
 7FdgXTu/L6lf0gDHKJoDEhGvLJGeAoz9g2/KjhrzwLGsAgWdNF2PJj+whr/ET+zBzjEN
 Nbmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNt7//9ilI479bDdHDyV9t2S5RtBvDodjCN7hFBMKVdct/CasRrup9mJZ1+lG9lzk7ZYAEUcfNCRqFacx8toPs8VuK8HRFw/Xg/m3ySJ6G
X-Gm-Message-State: AOJu0YzYzxVhayj2sjWWEslakDdVTp7+vgxlifqAvdSwXdp/ORik297f
 rYK2s4TWaYlXiJ4EIBghX3g2W1b5RGPg/rqemP+RXDRGKXlDrC6mVb5vEzip+lw=
X-Google-Smtp-Source: AGHT+IGwS1S2UIhR7u1D1bdJLxUjT0Jxa/J70GI1DJuamydDmmp3ucw1HVC+ZEydtEqM5NUTau2YZQ==
X-Received: by 2002:a05:6512:1196:b0:512:e218:db7f with SMTP id
 g22-20020a056512119600b00512e218db7fmr4207381lfr.67.1708913511750; 
 Sun, 25 Feb 2024 18:11:51 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:41 +0200
Subject: [PATCH RFC 05/12] drm/msm: use _shipped suffix for all xml.h files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-5-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8048;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nx7fpXRNpbAX1r5/PwTsdJN6+2r3qO1If+c+S986pBg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhwB+8UhIVNwQgD1ymNg7h8cxIwJG82l3SB
 Qh8ciUg7lqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1QfnB/wO4OAKfkCA0ViZeKqmFzhrpWC+RtB6kbCKREZbqvsxR8ezWqAEofG1IKcWAKnCf0ZQ1jK
 b/DeJwbAIZskh03EEqffohnxySp6RF/WIS/NlBGiYR3wdZ9A1KPhV3XvkyVJ8AozL/FKtq+gLS6
 9XBBJWar2aloyeQfC1D41fStDTi6QyLZYaZU2hfbLRKVRQxFIHckuTvrv9m8H8VoQM0EeBKKQnY
 y6/ipHxkDX82EKk/DpoFvwShjl1QDcnl5vsBVcHRMkacW0bcYgP1NXqrBgtGOPHhOOoF69vd5JA
 HTbvtv79T0lC7J1qogV+FBT3lUCKu4Cm/ESCDGfV3BlLzKZH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move non-GPU xml.h files into the ./registers subdir and add the
_shipped suffix. The GPU files are left intact for now, since they
require processing via a gen_headers.py, while display headers are
regenerated using headergen2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Makefile                       | 53 ++++++++++++++++++----
 .../{dsi/dsi.xml.h => registers/dsi.xml.h_shipped} |  0
 .../dsi_phy_10nm.xml.h_shipped}                    |  0
 .../dsi_phy_14nm.xml.h_shipped}                    |  0
 .../dsi_phy_20nm.xml.h_shipped}                    |  0
 .../dsi_phy_28nm.xml.h_shipped}                    |  0
 .../dsi_phy_28nm_8960.xml.h_shipped}               |  0
 .../dsi_phy_7nm.xml.h_shipped}                     |  0
 .../hdmi.xml.h => registers/hdmi.xml.h_shipped}    |  0
 .../mdp4.xml.h => registers/mdp4.xml.h_shipped}    |  0
 .../mdp5.xml.h => registers/mdp5.xml.h_shipped}    |  0
 .../mdp_common.xml.h_shipped}                      |  0
 .../sfpb.xml.h => registers/sfpb.xml.h_shipped}    |  0
 13 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 543e04fa72e3..89c9f5f93b85 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y := -I $(srctree)/$(src)
+ccflags-y := -I $(obj)/registers
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
 ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
@@ -17,7 +18,7 @@ msm-y := \
 	adreno/a6xx_gmu.o \
 	adreno/a6xx_hfi.o \
 
-msm-$(CONFIG_DRM_MSM_HDMI) += \
+msm-hdmi += \
 	hdmi/hdmi.o \
 	hdmi/hdmi_audio.o \
 	hdmi/hdmi_bridge.o \
@@ -30,7 +31,11 @@ msm-$(CONFIG_DRM_MSM_HDMI) += \
 	hdmi/hdmi_phy_8x74.o \
 	hdmi/hdmi_pll_8960.o \
 
-msm-$(CONFIG_DRM_MSM_MDP4) += \
+msm-$(CONFIG_DRM_MSM_HDMI) += $(msm-hdmi)
+
+$(addprefix $(obj)/,$(msm-hdmi)): $(obj)/registers/hdmi.xml.h
+
+msm-mdp4 += \
 	disp/mdp4/mdp4_crtc.o \
 	disp/mdp4/mdp4_dsi_encoder.o \
 	disp/mdp4/mdp4_dtv_encoder.o \
@@ -41,7 +46,12 @@ msm-$(CONFIG_DRM_MSM_MDP4) += \
 	disp/mdp4/mdp4_kms.o \
 	disp/mdp4/mdp4_plane.o \
 
-msm-$(CONFIG_DRM_MSM_MDP5) += \
+msm-$(CONFIG_DRM_MSM_MDP4) += $(msm-mdp4)
+
+$(addprefix $(obj)/,$(msm-mdp4)): $(obj)/registers/mdp4.xml.h
+$(addprefix $(obj)/,$(msm-mdp4)): $(obj)/registers/mdp_common.xml.h
+
+msm-mdp5 += \
 	disp/mdp5/mdp5_cfg.o \
 	disp/mdp5/mdp5_cmd_encoder.o \
 	disp/mdp5/mdp5_ctl.o \
@@ -54,6 +64,10 @@ msm-$(CONFIG_DRM_MSM_MDP5) += \
 	disp/mdp5/mdp5_plane.o \
 	disp/mdp5/mdp5_smp.o \
 
+msm-$(CONFIG_DRM_MSM_MDP5) += $(msm-mdp5)
+$(addprefix $(obj)/,$(msm-mdp5)): $(obj)/registers/mdp5.xml.h
+$(addprefix $(obj)/,$(msm-mdp5)): $(obj)/registers/mdp_common.xml.h
+
 msm-$(CONFIG_DRM_MSM_DPU) += \
 	disp/dpu1/dpu_core_perf.o \
 	disp/dpu1/dpu_crtc.o \
@@ -115,6 +129,9 @@ msm-y += \
 	msm_gpu_tracepoints.o \
 	msm_gpummu.o
 
+$(obj)/disp/mdp_format.o: $(obj)/registers/mdp_common.xml.h
+$(obj)/disp/mdp_kms.o: $(obj)/registers/mdp_common.xml.h
+
 msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
 	dp/dp_debug.o
 
@@ -133,17 +150,33 @@ msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
 msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
 
-msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
+msm-dsi += dsi/dsi.o \
 			dsi/dsi_cfg.o \
 			dsi/dsi_host.o \
 			dsi/dsi_manager.o \
 			dsi/phy/dsi_phy.o
 
-msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
-msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
-msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
-msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
-msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
-msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+$(obj)/dsi/dsi_host.o: $(obj)/registers/sfpb.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_28NM_PHY) += dsi/phy/dsi_phy_28nm.o
+$(obj)/dsi/phy/dsi_phy_28nm.o: $(obj)/registers/dsi_phy_28nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_20NM_PHY) += dsi/phy/dsi_phy_20nm.o
+$(obj)/dsi/phy/dsi_phy_20nm.o: $(obj)/registers/dsi_phy_20nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) += dsi/phy/dsi_phy_28nm_8960.o
+$(obj)/dsi/phy/dsi_phy_28nm_8960.o: $(obj)/registers/dsi_phy_28nm_8960.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
+$(obj)/dsi/phy/dsi_phy_14nm.o: $(obj)/registers/dsi_phy_14nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
+$(obj)/dsi/phy/dsi_phy_10nm.o: $(obj)/registers/dsi_phy_10nm.xml.h
+
+msm-dsi-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
+$(obj)/dsi/phy/dsi_phy_7nm.o: $(obj)/registers/dsi_phy_7nm.xml.h
+
+msm-$(CONFIG_DRM_MSM_DSI) += $(msm-dsi) $(msm-dsi-y)
+$(addprefix $(obj)/,$(msm-dsi) $(msm-dsi-y)): $(obj)/registers/dsi.xml.h
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi.xml.h
rename to drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h b/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h
rename to drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/hdmi/hdmi.xml.h
rename to drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h b/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h
rename to drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h b/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h
rename to drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/disp/mdp_common.xml.h b/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/disp/mdp_common.xml.h
rename to drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
diff --git a/drivers/gpu/drm/msm/dsi/sfpb.xml.h b/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
similarity index 100%
rename from drivers/gpu/drm/msm/dsi/sfpb.xml.h
rename to drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped

-- 
2.39.2

