Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8C8CBB30
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 08:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8007E10F008;
	Wed, 22 May 2024 06:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ptGtA0s7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2210EFEA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 06:25:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so6606073e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 23:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716359156; x=1716963956; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QTZe1zFzdkSYzyWKCJT5gwUK2Y3k8Ui8hrHsuYKTseY=;
 b=ptGtA0s7bEaWC1bjDXHY+Zxka2l+2m7BVNOvzDwHVtjQL1pdZb6V+yF90IzQLsoj6S
 2Pg9mQ1sdYazKOpba0BCisVWTJNJA2ayqqCn11cl++vcAIb85NLoAJbK0jqJSWup4PIm
 fbl/aM43VlaDX2tirbvrhJOUY0/L2kxri+SsCowZbik+kwJMLSqa0PKB3/y33hjlsgbo
 UB9v7qPwr27c3SpfelmXDAjzfnus/s7Ft/+FDiqKDr5SeJ4cvxYDwlot/HE9fZt2yS9X
 A1HD7/aSmohkT/JYdSP9GFiK9dlEx3PZzU3MOqbew32f3mYghrCsIRYHyReNBwbcD2fD
 kOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716359156; x=1716963956;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTZe1zFzdkSYzyWKCJT5gwUK2Y3k8Ui8hrHsuYKTseY=;
 b=Oif3Z3ABQ+aacYDhvPh0WrR1b2mAfIInfLjjpz2zHL2dvaQfVg1GkRaXV7+vw05od9
 0jSRj1BHwxlsZayeJyJEQBetpcEHuIpB4jei7IittMywBubz6x0Uqv0VWH561dMK9x5i
 D9uLR+UZEa0bnXdj+Zm0x2W7LC4CkP9ofrQdPSaANE+QEYmjFFjNBcOvWtmp3qJk4r/4
 WpjeXCc6vrxfVGauCZmyWUV0rZ3m0w1fNIZulGzccTP+FWQDrOI1DwGUgMPSFhEkl5Xc
 zAlFo57DYMCT8jFiASwZgzPph2u9r9CfApRNQfQGziM3zE7brAq8M8vdR5ln1RiunUJQ
 gASQ==
X-Gm-Message-State: AOJu0YyyimVLAzYAdPJybt5z9rY8skP7Xvn/jJaxlMWtN+j9AhvG7IQM
 8prUCTZO8HM3+I45G2Utk+qNjcUYXVUc2yF4NUymbVSIhyP8KLtTJfX3XMQsee8=
X-Google-Smtp-Source: AGHT+IEZVRrZq3oUNpZjU4i32YjLGKPNJhpf5AHOlxwiYYT4wZFdXFFUQnh0fUb6PaX1Toq7HkSnFg==
X-Received: by 2002:a05:6512:1cb:b0:51e:f2bb:158a with SMTP id
 2adb3069b0e04-526bfc02c09mr459245e87.64.1716359156371; 
 Tue, 21 May 2024 23:25:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 23:25:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 09:25:53 +0300
Subject: [PATCH v3 1/3] drm/display: split DSC helpers from DP helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-panel-sw43408-fix-v3-1-6902285adcc0@linaro.org>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
In-Reply-To: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fH+OSt9OM8UNGfwVeAJVCDuCmITk5njhlKqnGjulroc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/xRFUSLJsGA2LrooHaFUmFf6vDxUFO1mrq0
 vHNzs2ntYeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8QAKCRCLPIo+Aiko
 1cRVB/41qAd9/BJy4mTQfxR1VHMssNg03EIjqlJi4ZoifXTNOaJ87ZjhtvO6fPhmqozbkGBdXzA
 WBAsNnLMXnytQg5E9GBa7zA+nAOpO4L4s2Ux5PjB5GWlKF3D1hsfrwbjRJeAnfpvvELjaxqhPvZ
 7Fe73Ovu0fDwIV2mhOQJmx2RAUi0q2C13z+fKgZ6QAfKK8IPstuoSH9/NwifZBKQdbGGMPqXIes
 w8JePzXY3EkOY3fbAQiYgiXNgFQ7ATcBQW6dkJNpUUYeqD74T+dKNjgJq4tK5un2zi68dX9X+2J
 0qkcRw7g74nfGjN1F14uHrkALsZqPa0MqlcusfZVfIXzh2DQ
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

Currently the DRM DSC functions are selected by the
DRM_DISPLAY_DP_HELPER Kconfig symbol. This is not optimal, since the DSI
code (both panel and host drivers) end up selecting the seemingly
irrelevant DP helpers. Split the DSC code to be guarded by the separate
DRM_DISPLAY_DSC_HELPER Kconfig symbol.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 drivers/gpu/drm/display/Kconfig    | 6 ++++++
 drivers/gpu/drm/display/Makefile   | 3 ++-
 drivers/gpu/drm/i915/Kconfig       | 1 +
 drivers/gpu/drm/msm/Kconfig        | 1 +
 drivers/gpu/drm/panel/Kconfig      | 4 ++--
 6 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef527..b69d5c4a5367 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -6,6 +6,7 @@ config DRM_AMDGPU
 	depends on !UML
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 864a6488bfdf..f524cf95dec3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -59,6 +59,12 @@ config DRM_DISPLAY_DP_TUNNEL_STATE_DEBUG
 
 	  If in doubt, say "N".
 
+config DRM_DISPLAY_DSC_HELPER
+	bool
+	depends on DRM_DISPLAY_HELPER
+	help
+	  DRM display helpers for VESA DSC (used by DSI and DisplayPort).
+
 config DRM_DISPLAY_HDCP_HELPER
 	bool
 	depends on DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17d2cc73ff56..2ec71e15c3cb 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -6,7 +6,8 @@ drm_display_helper-y := drm_display_helper_mod.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += \
 	drm_dp_dual_mode_helper.o \
 	drm_dp_helper.o \
-	drm_dp_mst_topology.o \
+	drm_dp_mst_topology.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 	drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_TUNNEL) += \
 	drm_dp_tunnel.o
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 5932024f8f95..117b84260b1c 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -11,6 +11,7 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1931ecf73e32..6dcd26180611 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -111,6 +111,7 @@ config DRM_MSM_DSI
 	depends on DRM_MSM
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
 	  Choose this option if you have a need for MIPI DSI connector
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 982324ef5a41..4a2f621433ef 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -547,7 +547,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
@@ -905,7 +905,7 @@ config DRM_PANEL_VISIONOX_R66451
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Visionox

-- 
2.39.2

