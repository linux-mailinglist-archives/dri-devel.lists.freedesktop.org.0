Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C185818D3F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63910E4D8;
	Tue, 19 Dec 2023 17:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F2210E4D8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d12b56a38so39146205e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005291; x=1703610091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lg73sX3i9a8aQACa3LQIeyAKZ2sxvdHhoE4dFqwZeRk=;
 b=DLwQZifVkjzr2YQ9nSyMRy+rduML+ydxwSVpS8JN4m/BEkFYSretg4s2vHAUf1hbu3
 WCLJYCvQDTh3TahgmTJVZLSzLWmcrncDtEasQtbTyjOYSleaJBxREE2T210ZrMED6Jud
 bFS8eSp8oCFgv/7Bn+RkMByFvu7toSMQhtHre+zh86F3eQOfWuGnX1lXThvPSrmpOSsY
 PDUOKitI0MZ7qC87/lmy1a77kGMKMBhqauujbir331zGXDc/KxPEoP1POVTVysEoi5s8
 ErpHp88iYuNWngChfdgg30b23lswBUEbWz0+WclKLDop/IAOZleKBlWL5G+/b3KLuSDm
 /f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005291; x=1703610091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lg73sX3i9a8aQACa3LQIeyAKZ2sxvdHhoE4dFqwZeRk=;
 b=TB3bH8fKl29N+dkEbtOGRVrR9kZNb8HDmEI1unZI7L1zH4Ic+8R/0adU6tpKX4ukcO
 vTIwAuJSFkK1znOOnXoI6lkYHKoGm0fGOQtjHBBR1CfP7SUBmGTR+4nyz+DfzCNSvfV/
 CHsvegPZ0ITLGb/q6PhNzyAfqo4DiZmGuiFJEVuuk8+zxw9HkdwLVG+WmcVqKpngp97D
 +LyUufBkCa8NqXnOpziNoR1/F2ov1Uxb+V7eyfnO5UhTxQ9ckBwKRSNoDfLPGFM89uYb
 Z5kbYa5pzAduVj+wKFKkYN6tU0ppAtbVHMbbMVBzzgsFBWPYn4ch+hVag/3gdO+miADr
 srOQ==
X-Gm-Message-State: AOJu0YyGicYvdT9YzSqwHvj2aN3izaUFFOmeY83qS/fgADp+IAsrhswF
 inFJSJ2Hr/2GaEssUcwlig==
X-Google-Smtp-Source: AGHT+IHXi6Ragi4oBQ3GZNtFDmz9icVV62tivi8tCjIWJeMUtr3MMODMzP3LpyoP4WMp+2GJb/Pgbw==
X-Received: by 2002:a1c:6a0a:0:b0:40c:386e:6aa2 with SMTP id
 f10-20020a1c6a0a000000b0040c386e6aa2mr5197610wmc.55.1703005290969; 
 Tue, 19 Dec 2023 09:01:30 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:30 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 25/29] drm/rockchip: inno_hdmi: Add basic mode validation
Date: Tue, 19 Dec 2023 18:00:55 +0100
Message-ID: <20231219170100.188800-26-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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

 drivers/gpu/drm/rockchip/inno_hdmi.c | 42 ++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 8a1a2320749a..a2a9e54b76c0 100644
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

