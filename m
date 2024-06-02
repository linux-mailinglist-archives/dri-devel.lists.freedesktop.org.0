Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB8F8D7535
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3252A10E0F7;
	Sun,  2 Jun 2024 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ipkXjMJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB0510E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:51 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b919d1fc0so721455e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329889; x=1717934689; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nxc4vHH87Y1eSO87AR835I7/5WLCpgJXyFLj/BGpZY0=;
 b=ipkXjMJyTNH6KalO4lD5gpnaCGf7XelhICO0Bre8VgZtBKZL/MyNPoZtkCywgM3UTv
 RViLYe3oUzfbN5TZ6IkOaC78041ad6rdx03oy/nsLcjEK0If+Q0IKMJTSlN40F1JuGjJ
 Ogw2QOiK1aQw4kGvDWU1tCOf60Kd1JPPoQw/9ZfWMgDQu47s/IK9RJO9bLrMT2RtwVp6
 CR5RRVJ3+cVh1CHExItD8NhYqTJe+r3PjD1Mf9rJiaLFw32qZN55BEScHhMhNoWhZ7cI
 lDleIew/wTJaYRCHGE+e1sIB9pY22l5d3B4DTEdKwax3jBMSms2xZuCTX4P684O+s+Cb
 rYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329889; x=1717934689;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxc4vHH87Y1eSO87AR835I7/5WLCpgJXyFLj/BGpZY0=;
 b=vNHW3X1Qj9LF/HvLT2cUDNZLnJYy57YdGXQ6Rqad9dYt5thX3sDeHA7ccQFvW9P1/u
 rWZPnOwEJpilk43oF34ccZ2EWrA7ajpGvEpAVY8i9JCKZNnNtLFdt62Qq95PaE+83r7z
 oy5HtvCrQPkY9clPhmKG7yv9LySdjD3JQmQBtelJHPN2o1iO/frzg1XzNN4V9pyRTMHi
 f8uzSCpkEYzGJzlUdhSPqpcfo9HbFBi3iVl4gIoHwg4a77cpTn4MXr4felFNSMxjU3Ye
 c8zfAQO0cNomPLhB/gM36/qCg2Pf+RMF4cHcRRFKomxdt5586rIwgSUuRvSM38sxCmWQ
 nrOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZky1SRuLkNkCfU2T3GETJLh4BsXifaNGGIiKckvJP3ia4ntVQH8G50dfokXE/MU4A6eZvX08/1tGru+ha6UUmCafGbDZIpx0hghpFgDMm
X-Gm-Message-State: AOJu0Yy3C69K14586BL0TUxVcZfBAFm3wGzitX1P1nVWQLcm/569ZDnr
 0K4IK2fntPdm89AOYkY7YDI0Yp20booCCDmgJBFFR3vuJBeE1E+K2brt8iRW2ok=
X-Google-Smtp-Source: AGHT+IFPOiv0yb9NenXs61eeyl+FTzUia9VO7YGHEV3B4cyF+m7yIyCA+pulo20IEMCgPXGBKi/V/A==
X-Received: by 2002:a05:6512:3d20:b0:52b:963d:277c with SMTP id
 2adb3069b0e04-52b963d2864mr477027e87.33.1717329889449; 
 Sun, 02 Jun 2024 05:04:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:43 +0300
Subject: [PATCH v3 03/12] drm/imx: cleanup the imx-drm header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-3-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZDw9je94QoyosO0168STtseYxQQ179pVpV6GiETvE+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/c9m9P02PzAYv+Hvngg0pK/UDBTwhhmG1zr
 6YIzCrb9vGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3AAKCRCLPIo+Aiko
 1fjzCACVJAOnM38OBMjesvSYWvhCttUEqRnqa1cwq4nlLesJDTMZ2OUTNhRtlYVXOyjfQdPCZoY
 sFg6k3yFt2WWYJBGVbYAc3fuchDTgb0HEb98vxj41NM9rI7BNJSWHJlLr6XS7RGIK7LtSQ9vpcj
 ESAFP3iCtlpbs+a0als6qX4eWKJZOLwj8uq1Lt4aQSHCSo9e4RyTzhFKMcp9PsbQWyhhWQLek1u
 ABZyZLlg4UbyRcy0FlQAFgPnpEw6Y5h4FovYheyJU3SjH1hxE5Ve5sHgaXMJ8/nqFD0scxw+dML
 s3IqxYlKtclaMDhG8+vC5UlutqEjdAQVKc/YRM0Y6WMrzg/l
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

Drop unused defines and obsolete prototypes from the imx-drm.h header.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e721bebda2bd..e01f026047de 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -3,14 +3,9 @@
 #define _IMX_DRM_H_
 
 struct device_node;
-struct drm_crtc;
 struct drm_connector;
 struct drm_device;
-struct drm_display_mode;
 struct drm_encoder;
-struct drm_framebuffer;
-struct drm_plane;
-struct platform_device;
 
 struct imx_crtc_state {
 	struct drm_crtc_state			base;
@@ -24,16 +19,9 @@ static inline struct imx_crtc_state *to_imx_crtc_state(struct drm_crtc_state *s)
 {
 	return container_of(s, struct imx_crtc_state, base);
 }
-int imx_drm_init_drm(struct platform_device *pdev,
-		int preferred_bpp);
-int imx_drm_exit_drm(void);
 
 extern struct platform_driver ipu_drm_driver;
 
-void imx_drm_mode_config_init(struct drm_device *drm);
-
-struct drm_gem_dma_object *imx_drm_fb_get_obj(struct drm_framebuffer *fb);
-
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 

-- 
2.39.2

