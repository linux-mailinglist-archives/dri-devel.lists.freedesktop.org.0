Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F89C2D16
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B87210E2AC;
	Sat,  9 Nov 2024 12:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZU2OjkUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FB710E2AC
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso3588437e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155727; x=1731760527; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
 b=ZU2OjkULxAGKQSjVB8aUce8DsBqWOoPNhhJjs31OzGkmwEyZeE9xjGAd+urctFEIus
 nFXOrZfS1sJNfy7XGlNd3Dji/z7KCgCZUPkrmdWh1i95IU/RaOtj4EWvrxsnaBvRjRfc
 DnMrZO0PPbOpZ1yb7w9dzMP0CB90ZwMQFalMFcmMJhzR766rIbtacPPLTxX3R+RrCXTq
 rQo8w4ozNrMpHhXwrKBgq74sBKJ5P7zciAdlgpuQ6U54W2oUR7cxDjwVaWdqFo1Dc7r7
 S5P1LGLt1G79XwIwBOXyLDX/scULkvy9Dvoi4a3Fs6UdqDW3wWhjFAuwo19DZcGMiD5W
 SFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155727; x=1731760527;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhftGPVLtDhe2UTpRu1zgEjgWPv2gRVws0y4aDafrjo=;
 b=mVfoTEceMZXMV2vV5vLa0btUlsNDIqtSFjYMop6vWlk/sSplSmxMf3czqmfiTA6gZJ
 sPOwboXee/uiRleg9s4kF0lcLLd7cAO1GM6K29py+007ZCNXVH0qOLVYgdsJ8g9NPDSx
 3CcnBwIEuTpvVEI34PzM0dCXN3ofkwE60viO7eScOUjjtwlpFdJbwIL+JNJFbEuU5Dgg
 rqRMpuH8FBNeR4u+noG1hUCWFoFkLk3VpXPm+XJLNOdi5qp7IEsaOx/+UbmW59EmKV86
 QHZTIGjUx0wxOcsS3Nw4Zqw0BJDP+XNxrUploDjbbsT0651FgHsOe6N/MfCRC8A0XTVU
 5ZEQ==
X-Gm-Message-State: AOJu0YxYKgV24Z9UqFOtEZDg0Ys16Q3w41P6OcPZ0H61CkpTLxV3/4HD
 21K7Elcw3UWSB77h3Zx+lrqugFLocd6Jh6O6ACDS1XbdG8/HSnZrALWfivqUjqc=
X-Google-Smtp-Source: AGHT+IEigUfK1s5B1XhS9sfEmdo+maxC2U8AZO/uY92umN9wYkTsgVSKNmZyXdmp1QCMyrfV4W+TfA==
X-Received: by 2002:a05:6512:31cc:b0:539:e1a7:345d with SMTP id
 2adb3069b0e04-53d866c94cbmr2232719e87.10.1731155727195; 
 Sat, 09 Nov 2024 04:35:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:09 +0200
Subject: [PATCH v3 5/7] drm/bridge: lontium-lt9611: drop TMDS char rate
 check in mode_valid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-5-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bVuetdndH1+H+sM8qub00TaR8PUlbIR46HTQjmQ2vjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/ZfMsGkQ52uI+m656a0A3dgPEqlPCAieD6
 1QAsnoR/kuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1eNxB/wJULjX0l8Lz4aRPnuWR70dfZVJYrQkpc+zPAuribEC0F0j7hQNWkmczAezUyvVpgP+Fgh
 04j4uyP1p4ZjZjgOqT7vq+wr3pCtkA/QWAIopDvYotWFldcsgLXdYCtpZskcTOcaG5rGGFCyTyU
 eNJhP0NRQ+UKJrK/n9t+WRARtDE9xjju194IYz61poLEPBdhGQVMp2rdhYyF6My5hgikZ4N6oq+
 a4ut24LnuuY50GSMoRukcFdytXScvNZQgHpSrxvkTvQvMdx2jsx70hJE59nYLmCcQpNLcXQ3z4x
 JeLtLBiJCB09gw/tvJDQ6ZibiPFWU4BeltZf1zuT3eU5stU+
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

Drop manual check of the TMDS char rate in the mode_valid callback. This
check is now being performed by the core.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b31fdebe164063e6f3972fdf8a5801ef4c35c4e..b8ccffdf515ade6e3bf863edbedc41e6f2030f29 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -757,7 +757,6 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	unsigned long long rate;
 
 	if (mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
@@ -765,8 +764,7 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->hdisplay > 2000 && !lt9611->dsi1_node)
 		return MODE_PANEL;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
-	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+	return MODE_OK;
 }
 
 static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,

-- 
2.39.5

