Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA881CDD3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438C810E860;
	Fri, 22 Dec 2023 17:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7710E84F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336755f1688so1824675f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266960; x=1703871760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAPEf6VCNcNpH+vS9Jy42mEPmnbb20QERJ8qe9km2VY=;
 b=nZA4Jqfbr4uk2if1+ukfuFDiSjd7ZxeSm3V7aM+4/Z5LUP3YqZsgmTM0aX5A57P/Dl
 UGh8DaZTV6sWJaUpNS+JuY2rnby2kEPouKZQ6SdmtUutmGGFpKRE+APu80FjWfeZrZLB
 L0gXXgpWdvi9erMNmCcEJwBxd2C+UCOE6ofMZoQBlHQPK7RpkCrbAun2dqDy2amSHXF8
 ZkWYoVDdXeGSMbwczqV8dqtA0s+1NzVEoK9Ifk+J1aQe8ukG/9manBtmQgiCOgaO0C+M
 1f+NqphUcHNl6sBud7RJpSIFOnOb9AXFPUZIwM6kxjysw2hro1mRBcnYyFnJVxLBR/vu
 UEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266960; x=1703871760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAPEf6VCNcNpH+vS9Jy42mEPmnbb20QERJ8qe9km2VY=;
 b=wOsGKjc3utV+7SRycHSHcQ9il4RLzxptMUy2lc+5r7vUxbue3ijhauCDQGBCrGBxd0
 /ky94gSTx4U6whJRRf0v6VV0SR3Fkvn8OpaFwIDv3WaX6MbsXF31TVto0UYKrX/vD8fs
 u5jNGc+JMX7o9+VCuccHHmXJ7eCeknQCQbGQ2SdcXgDIXvV+u1LsRPJJCyvYQUXtQhUi
 ENqx88+KTFMgl1C2S52kVLX9I44IRtCKyPBbs2ZNVW0YhsU50/Rcu69GjEg/EMiT1+Wx
 Nwf3IdUcwCpMRObeDx695QUsGD4qTt9W4Stlty3UptpAaAPbC8hDHbi9a0P5C/CHzS45
 WsuA==
X-Gm-Message-State: AOJu0YynjgqemQlujEsvceaxTCKMygbY+E+1qQFQ/3Cbio6AFFALb3+a
 TwSUDS8rMz/+9ffZmdat2A==
X-Google-Smtp-Source: AGHT+IFGJNcPl+paeHR0rYagd/KoMDxco3f6zFqUGim2MwyHSQksycGDsS4WvE51htk1ZWVRV10PAg==
X-Received: by 2002:a5d:4fcd:0:b0:336:5f15:5533 with SMTP id
 h13-20020a5d4fcd000000b003365f155533mr1181108wrw.54.1703266960101; 
 Fri, 22 Dec 2023 09:42:40 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:39 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 25/29] drm/rockchip: inno_hdmi: Add basic mode validation
Date: Fri, 22 Dec 2023 18:42:16 +0100
Message-ID: <20231222174220.55249-26-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per TRM this controller supports pixelclocks starting from 25 MHz. The
maximum supported pixelclocks are defined by the phy configurations we
have. Also it can't support modes that require doubled clocks. If the
variant has a phy reference clock we can additionally validate against VESA
DMT'srecommendations.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - rename inno_mode_valid -> inno_hdmi_display_mode_valid
 - fixed max_tolerance calculation
 - use abs_diff() instead of abs()
 - call in inno_hdmi_display_mode_valid in atomic_check

changes in v3:
 - collect RB

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 42 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 3b76929deefe..a074451a0c49 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -26,6 +26,8 @@
 
 #include "inno_hdmi.h"
 
+#define INNO_HDMI_MIN_TMDS_CLOCK  25000000U
+
 struct inno_hdmi_phy_config {
 	unsigned long pixelclock;
 	u8 pre_emphasis;
@@ -497,6 +499,38 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }
 
+static enum drm_mode_status inno_hdmi_display_mode_valid(struct inno_hdmi *hdmi,
+							 struct drm_display_mode *mode)
+{
+	unsigned long mpixelclk, max_tolerance;
+	long rounded_refclk;
+
+	/* No support for double-clock modes */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		return MODE_BAD;
+
+	mpixelclk = mode->clock * 1000;
+
+	if (mpixelclk < INNO_HDMI_MIN_TMDS_CLOCK)
+		return MODE_CLOCK_LOW;
+
+	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
+		return MODE_CLOCK_HIGH;
+
+	if (hdmi->refclk) {
+		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
+		if (rounded_refclk < 0)
+			return MODE_BAD;
+
+		/* Vesa DMT standard mentions +/- 0.5% max tolerance */
+		max_tolerance = mpixelclk / 200;
+		if (abs_diff((unsigned long)rounded_refclk, mpixelclk) > max_tolerance)
+			return MODE_NOCLOCK;
+	}
+
+	return MODE_OK;
+}
+
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 				     struct drm_atomic_state *state)
 {
@@ -529,6 +563,7 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_connector_state *conn_state)
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	u8 vic = drm_match_cea_mode(mode);
 	struct inno_hdmi_connector_state *inno_conn_state =
@@ -549,7 +584,8 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	inno_conn_state->rgb_limited_range =
 		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
 
-	return 0;
+	return  inno_hdmi_display_mode_valid(hdmi,
+				&crtc_state->adjusted_mode) == MODE_OK ? 0 : -EINVAL;
 }
 
 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
@@ -590,7 +626,9 @@ static enum drm_mode_status
 inno_hdmi_connector_mode_valid(struct drm_connector *connector,
 			       struct drm_display_mode *mode)
 {
-	return MODE_OK;
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
+
+	return  inno_hdmi_display_mode_valid(hdmi, mode);
 }
 
 static int
-- 
2.43.0

