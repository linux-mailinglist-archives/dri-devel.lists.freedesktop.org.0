Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E659A481A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3C10E988;
	Fri, 18 Oct 2024 20:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qSyg19cp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93F10E980
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:39 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e690479cso2899027e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283678; x=1729888478; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ca1rU5SjfCzQNv/FEym5QKCwQ3XnYE+z1oSBkBKPVBg=;
 b=qSyg19cpJVboXfP60Sc+FtoGOLl1EQkn8S9ap6KmpagK8gcGItvpj/EID/Kt4jEghU
 4OBzqYiQp0sEGBpurM0vXDl6p5aSGWF682gZM+NIvnn5wTEfSdVpzCocbc3NunO8yn3Z
 xBzJx9UorbaPzWgAlhFhzVsfWRn5TnkImPz25sU4f28LyQ8J/vn8B4ZDyboSjOJvAoAl
 lc+GRqlV1NGP3LIfufEwN1zV+hSH7MS2i+6Rs3+y/GZur7ak8lTMsFWd8fuYAmmDazAM
 vA8/a1h/zjcbeTLwBkQWsNTLrZ6IUasWz0ocfNBEr6qIVsaNrdNHE2KPIWrmlmDWWO5e
 Qg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283678; x=1729888478;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ca1rU5SjfCzQNv/FEym5QKCwQ3XnYE+z1oSBkBKPVBg=;
 b=Dr+LTND7QXDyqvzLGyHt0yKZ3+btkQDf4/DEG5Elw41RVha8AB7R/dcukrHiBS/AoB
 lJ3IDdw0Q2O4OWs+YEFcBH5L47PrUSQozLWahszIzUXHCH83BMMVxnowZ1bReQnEhP78
 E2Ux+VrPSZ4XerAkRVEMN/xOw8fOMm1Bl/+AV2145ede1YZ+Dpp3mBN1YGxF35pJcj8l
 D/nL+sJ6BuMHx2eU7ZdKfEfhVpEYTxFdhWxUqSAk8aZFsHstXpDU2HS9sWoHFlOSZABU
 8AkTot/y7qmRQ9R6qvow/qbcPIiYPBbavtvu/DNFp6+92GyOeBG0rhWSR9oSZvNtksnM
 8S1A==
X-Gm-Message-State: AOJu0YxMRsYFNZCGlLbY1l9YIWzmTkLQMVkNs3xiVzNGTKqCcgLj1EfT
 YYj1GtugK9Xorj6V0F0kfFExlz/+nyE+u1zrbY7ksDiGdqJ/bNB/v91S81HXR2U=
X-Google-Smtp-Source: AGHT+IFTHfkrFtW/rXOHHbEDQkVHYXvE16LJg5mmb3Z1WRleIxcPDhcnmv9BafU4kuhPvZsMxuWfcA==
X-Received: by 2002:a05:6512:118c:b0:539:958a:8fb1 with SMTP id
 2adb3069b0e04-53a1551168cmr1519828e87.60.1729283677753; 
 Fri, 18 Oct 2024 13:34:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:21 +0300
Subject: [PATCH 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-3-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SLiFFY4mHaK2mj2q8xisga/Q9Y4nw81QpArU89KsdC0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZW5T8Y/qcRfISUNqKDHuO2cK3wsa4ZaEnDU
 L3k4nG0OqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1V3DCACgaS2mX/0MXs81TWTKcZTjZ3KAqTJ3HrXMX6GnlBiCEqicvl7vBA4LM0KdCkTZk29pVaS
 FmoWyRYXnr0PklxZ9FlSqHz1LpsPCgONRG6Iq1szlo/1g4WbnHeracbGaj+Xt5QeFc83wJS1SMP
 PSssSHdZe/VhLGFADVaLuUvCim0834TLcmafqiK43Bx3yjx+XdZNXMc+75uXf3HD434HHhdA/Dz
 i1WWdq7icOPAZsT3xj3cbPCtGWy6ehHrkYS3R8vHwsIPJBVDPweWJxntNcRnQIIjxP2zNrDpo6x
 8G3v4fRMVwQ4wQe48iAB9NxgSl9mMIBEGeqryrzXVBfvHBhK
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

Use new drm_hdmi_connector_mode_valid() helper instead of a
module-specific copy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb36..486e513b898d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
-	unsigned long long rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
 	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
@@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
+	return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
 }
 
 static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {

-- 
2.39.5

