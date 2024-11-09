Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEED9C2D12
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC08D10E067;
	Sat,  9 Nov 2024 12:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kZfbAM6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EE810E067
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53a007743e7so3821779e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155719; x=1731760519; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=kZfbAM6GoXonOG/9iz4JAfb2SAFXrspEQp3A3ra7CBlNXS9QlsV8/mYIwUASb22KBl
 4ORWQJQR7nlC8phlSiwxhYSTCIS5wgqKmUSdblidr+ZlOJSBpIEmxpJ2sSnXYOSS2IfZ
 Sbah3n0YygrnUdgl0jFSiMOrm66r3Jb/cwVtju5etNZhbo0uMz8aJQdjAYWsICQqbZJu
 w4WF9Uv1tqunHI9nDoYLLB9G/LVzQF6bekErmdi3hakqyWYxQcxvHtzn1uss1aEZ1DG6
 5DFoqqBeCIVewczgQbBz3IaNx2EjzJb7ePbuwc3Cda0mp/ESmEamKWFh8XUn3zyGdIXZ
 Vxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155719; x=1731760519;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YdWiUnW6vTgN40+31xk3R74ZtFvE1HPhsssihDLePE8=;
 b=kD65YkJahBS5B4Gm1gsWq/XmcHl9uutxtyGvP8jEXG4joWZ5s7Fq4PT3IpFzE3iNiw
 Lh4eGKChY7sTG2lvA+71xGhFj9I2WcnB6rvxGxUdSyaGzRv7ymcWmNY1GPJbbdPsTCal
 9mA7aOmoaRHGUG0LdtBAaf6Kr7l574sNn0ky4a0aJh8AmM5f0OQ/aZeXoYS4rOHUEBGW
 2+WFhNhc8ZDtG/w5Z+EfOJtt/nXWEpuG9aU34MgMu+Xq2y8bLAowAA21wXAQ03fWFDGP
 JHrIIG/a2atXuwd4l0DBuf1iHihIysS7atpZXY2LDFaW5EPnh80u/3z238tWGh12HSb9
 T4bQ==
X-Gm-Message-State: AOJu0Yzld2hbw3ugTOdiIOyPXimAgG//uvqorpgvkRBzmESV+DJaDGsx
 t3cCrIReOsVAE5pO9Vp2lw5/xIgL5Ug5f44cgCnJMmSmlVAIea2hmZeRUfsXiFs=
X-Google-Smtp-Source: AGHT+IHHe97HVWISV0xTKEguhhmngXwM9bLbhKLyVT/NAPLE3XO/6gkuiT5st4Y4ibTD6FfB3h0HDw==
X-Received: by 2002:a05:6512:3e1b:b0:539:f7ab:e161 with SMTP id
 2adb3069b0e04-53d8626c957mr3117386e87.45.1731155719467; 
 Sat, 09 Nov 2024 04:35:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:06 +0200
Subject: [PATCH v3 2/7] drm/sun4i: use drm_hdmi_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-2-5348c2368076@linaro.org>
References: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
In-Reply-To: <20241109-hdmi-mode-valid-v3-0-5348c2368076@linaro.org>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7WdeDK9PVMnPHS0xN6wrfKPJv4ESCzGwmvZnGPcMZ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b+FmOS76qswUke0aQoU7K0ppHTbndFvzZI6
 MVoqTsyvKOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/gAKCRCLPIo+Aiko
 1aR2B/4roqe2QGJN9o0utoGfn7qwXfuYWUFrCpESIf0EXmVpBVMUfNKMEQ901DyyYMa07vGh9sn
 +syhOWO4HrB8RfdT01cQmwKSSSN/AO7aYYYR4wflgexekMnpd5MYCONI8J8OubpJFAs5BK0Qhic
 rzUP3emr5T3rHYkxTNjg3uIE5RV0OGNR/H4BtdIlMfVvPPEeQQtRRSjV2bl1y4C8SFCTQVUcqg7
 OkAARZXrgEfv4AtOtHjIBY0tsHxg98BaVOY0T74qxX313GFfUSTD8IyJiF0vxudbOq14KYEtHng
 lq+8K2cePPLztOfA876jNFsQpFGyIDb/AVfVxOCSHr6+qdVY
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

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
-static enum drm_mode_status
-sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
-							      HDMI_COLORSPACE_RGB);
-
-	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
-}
-
 static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
@@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
 	.atomic_check	= sun4i_hdmi_connector_atomic_check,
-	.mode_valid	= sun4i_hdmi_connector_mode_valid,
+	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };
 

-- 
2.39.5

