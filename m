Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8308D24D2
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BA410F254;
	Tue, 28 May 2024 19:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fneL0q85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79F910EAE1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 19:39:24 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e73441edf7so12471491fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716925163; x=1717529963; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dQZO5S8pgY4BnNrxpgnMhoHNDTox+OXu9IzRX/Zms64=;
 b=fneL0q8595e2cUFa43Lh4Lt4vdKeeRRZovlsf5Ekqskar6Sc/UtI+mVZj71pqYkrGN
 lTjxDvESyH0Z9bYpOyO1VERyoMANxHq24cid7Q31H5WAzSKGcsyOSvMQySyU6YU2eTgQ
 cPcAb04W812UvBUmh3mKcRMHPCJMTbkm9WVY+iyMyn6eKLAbNhRMoRM7SlGnp06riGcG
 5o+7lXpCY92N0D9V/GNPIVsF0znfQfg49O2fyAYeZx0p0ZQzWlcD3Q+qqJY620LpPoif
 OB6HICBPOgjzmS/aEZQuPlrNkQ0N9cCk67nAvSzjrYjwkpJtFUTSAZixZZuMyko3frJm
 kc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716925163; x=1717529963;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQZO5S8pgY4BnNrxpgnMhoHNDTox+OXu9IzRX/Zms64=;
 b=w0y/3ZcQ3n/ZdiViYsT/q0p8QrRqEf6ajvxLMrH6zxXZElg8NesSAwdRseIVFr8Mzu
 w9CoB4/FlKlpcU5U4nkVK0Uw6yRnHE9yWweTzqBAwR/WQ5SwMXC5/nhrP1tMePLuVljV
 N/q9zArHph0Wh090xUxKUEnsFTUlDwGaOmzBdzeDxjynltdEMTdhRkw0KVs+q7LsaSKW
 J5QRbX7ysCyzl+yCCWDriEU+Y+YNrzPtL8CZjUCDOi3HyIbS2bwgNpStrifIAw1hHXP1
 pGRA46TBAVRmPJszu7HWtFV2DK/anpQ/MazUAv5qZlfpKeNXr9D2VIBm5TVAvzIc/OyG
 6UrA==
X-Gm-Message-State: AOJu0YyH6K3XConS4sbkQr9SZXu283j3QeIXLL4dUjSMe62xY3ov4b6D
 llMcmEjw/8aFx9ozOH+Uq9sghu7Vyep3Sr3WjN3YOz/QDK0S2EFWQoMj13iId3U=
X-Google-Smtp-Source: AGHT+IFzVkivM0pRCEKZghv4XGnWwGA0mQiuvUyi6E1/QDpYYlIClbXtlMaW/XW9dA6Jnk5pUgBkZQ==
X-Received: by 2002:a05:6512:388b:b0:523:aac1:b559 with SMTP id
 2adb3069b0e04-529663e6304mr8034729e87.44.1716925162743; 
 Tue, 28 May 2024 12:39:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529711f96c9sm1045234e87.245.2024.05.28.12.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 12:39:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 22:39:20 +0300
Subject: [PATCH v4 3/3] drm/display: split DSC helpers from DP helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-panel-sw43408-fix-v4-3-330b42445bcc@linaro.org>
References: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
In-Reply-To: <20240528-panel-sw43408-fix-v4-0-330b42445bcc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4246;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=++B7C+LJPjhNPbyQwixveMzfLgpLwRSPYkfF+FF6az0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qY0fPHnO5xiWeEW+I+fDaU8Na0PvviwqHK8n3TTG7K+
 VmWdYp1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiyoIcDHNiYj7J+75/vG5v
 yAX1ddUtC3avmR0c/0zV/vPzSr+r+VxSi9k6v3dXzX2WaXYlw67ZzmZpd5Ok2xuNUo8XJkGG+sF
 6/qZv/luu2m0eX5bR1DFhcgHDe+OT+4rrp2TwTexMs6oTOFjo7cFbrXqC5ZzN2kM+iyQ3Tl25Pf
 r5GymFiea9b52273zBsnhj1EquOrlzLF0a74RuS5smXUnpDShefPJ6zfkHbzMmRTNc3r7IVccmg
 TP7IrdrX0rg1+rVp0v8Lvkqc7imMz19Hc7uwsrvvXDnYbulvJeC2Lc6tO/+FfD0tn+euf0EcUmN
 c/O+cJ97M1FMqy735ImQFslQ47otxb/Xii28zW1lNZcDAA==
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

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
 drivers/gpu/drm/display/Kconfig    | 6 ++++++
 drivers/gpu/drm/display/Makefile   | 3 ++-
 drivers/gpu/drm/i915/Kconfig       | 1 +
 drivers/gpu/drm/msm/Kconfig        | 1 +
 drivers/gpu/drm/panel/Kconfig      | 6 +++---
 6 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 4232ab27f990..5933ca8c6b96 100644
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
index 2ae0eb0638f3..3e3f63479544 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,7 +340,7 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
@@ -549,7 +549,7 @@ config DRM_PANEL_RAYDIUM_RM692E5
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_DSC_HELPER
 	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for Raydium RM692E5-based
@@ -907,7 +907,7 @@ config DRM_PANEL_VISIONOX_R66451
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

