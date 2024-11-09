Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D79C2D17
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 13:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345D110E2B2;
	Sat,  9 Nov 2024 12:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mLTRo3tQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F810E2B2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 12:35:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539ebb5a20aso3461406e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 04:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731155730; x=1731760530; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=mLTRo3tQqWYGouukm2p38YgXyarXP9XkYewLo4zWjkp+Gjajm57Lc6sRCo8tBNL946
 rxUkD4oZxlZWMjCQKAM2yD05Wh9pLjt7Tmr6tyI04VoGNtDgxA9JZTxL5Sz/8yvUaxgf
 Wnnkqrsmscy6qyTFqSIylrQTElTDDLlX0F4HIIP6chRU8TZWlIRl8wIgF9Wvpw9pkNQ/
 m6bVatcv9BtOQhpDGjC8IzO9z0irfj81JIUd+fqFDTa40fx72DzeIwhdXJPrnu3x91TK
 dsPcJuN/kHO8CxxD228G0ORF9+q82lQvSQ/H5BQq8aWV2/qS/DqphZAwEuXEVlVp84ah
 IBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731155730; x=1731760530;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9wxCYXwjuFpbEm8J6hnlc7LqgHEUz/bPD6SI90IVR0=;
 b=JiUAPO+vsIEE47WNgbqdTBZbLKCnnUnqad8mZ9u6RKfRZ9fhts98IgT5AE/jAf/CXu
 faA95yye5zmYrpYnqzPY70GQwr9OdDH0uGQ/GZS8JOqWpsS00Fc7RDQpYpV41dStdvfx
 WBcPZEH8CwASv6GyRfSHfb65+Tz6CNXYhTFHvuCI4Ns7px9iRLnmLp02CjvlpNvcg7MC
 /TwIbmfWGN2eywoa92k/8oDgBSME9/dKm34oAVYjMd+zLCU4CfJLx2xl8mBbV3/F9FM6
 WwJElGro0F0viiFkRJqx7L2g+fUKj2Cg9ss+HgzDv5RyzG8Pa1TSjftCzkuUq+jm++Vh
 Jb7g==
X-Gm-Message-State: AOJu0YxlPb/bmMuY7E6j1w0mqbshpxe/iH3N9QcizagVvNogES59CVRA
 VEiRBp4P8WZt6S1M7MTdwDb6e0rBeVETH0HskkX4HRnazoMbuLHD7rU5Iywplwo=
X-Google-Smtp-Source: AGHT+IExWCGWwweJ3/2iRfeNRk4AonxFSRBohmS9iN1pZjqL1Hm83HHjYVjbPTXo/ZRFzwelKC8tdQ==
X-Received: by 2002:ac2:4c4f:0:b0:539:8a9a:4e63 with SMTP id
 2adb3069b0e04-53d862fded1mr3117421e87.42.1731155729899; 
 Sat, 09 Nov 2024 04:35:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826784dbsm922899e87.15.2024.11.09.04.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 04:35:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:35:10 +0200
Subject: [PATCH v3 6/7] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-hdmi-mode-valid-v3-6-5348c2368076@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=UjNMLqX51SwfyB+kbUbjnJt95fAbmRoKvLYOPQ8ek9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1b/mNQQcFqCkzuMTFi21MgL+ClfX6zdxYmOE
 WDmYH96sASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9W/wAKCRCLPIo+Aiko
 1b1cB/4saVmbA16c6Z2bnXMNH/2b3oJllF/7OUdQvKCnntWfx23Ah8wjwzFSaoqoFc+jrad4IuM
 GUO4DHOvHv2lRiN/dW3NjaYzf/4Fs6FTemzc2Tetv9JJ6dc6DKLv0dHR+kawu93qS4TSwCbpduz
 bQJDOP0pZK/UbBjbJl2jUUGcMHS8CWn2EgZc0Y+aej2d1R87ogJebwR3Yik2NciCNDbX4INzayI
 AjmNHAq/LOOrLHcgLBbd15aEsGcw8q47AiX1jSh39Q7NHyX78ZfMpSIOQ68OnoI84bRbaz8Mx2S
 zjDUhci0ay3ohdizDU96iTYRPo+tGSq9Sxzlpty6qOenFpKs
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

