Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F8661702
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B54A10E1F7;
	Sun,  8 Jan 2023 16:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910910E07D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:03 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j17so9544373lfr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RXCRRwOkomayUTWW5R7rnIxD/KiJ4qyyd4b3Mx951U=;
 b=C45fAdSLNqwsYZX8EmjgYSLGuSOlQg6vODXHr1AQ1Wd0fX6TfFHx8xmHAcIea2qCua
 tahdwLT+krEqsuyzBgbekojBswZnNCVUkpXq80XHbp7uhty6pSvXkcwUjbykh4hWlfud
 +tauv9n6EUP794Siby1s6tpVOb0UYZGMz1OMqWnngVZeqEJWSArFYVf1LmorsBTlP41+
 vv/1HBpGpFO0TxE6PMgYrP/rxkqtHK4Ikl+Z3QP8usNK9GLzYv9azp42PHxP4LFl0WA8
 a9oMu08+1Id7IuqAVwgZht4PVG63T1nhqPodvG+ruSk6m4NWvaxl7x7lNJa5Zsa04abs
 TFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RXCRRwOkomayUTWW5R7rnIxD/KiJ4qyyd4b3Mx951U=;
 b=UBT/DqaXSv6zJwpTBeQh16aO2Ekgi3a5a+3gbOD8CW90pvSvECF8MtsYOM62iXgqkQ
 ZaV8yEf2+umGZ4WX7OwugYtQ/lJotCrcF7AfEz/t+0ephFgZqVVcS0fNq4mHwhlrmXRz
 gIAd1Y9lGvvWQ+s+maEF82ISRFHu3nJqSe6D2Q1M7pRk5GvfP812INSaCFHA0hBBPJFZ
 WtnQTeffVaMwDflnQ5HvbckIIgdPr+kg3u29mUDWDDN5LEeuz0DEvBpCS7hpPVJeIeMo
 Ogb3teOFxZOQTP0oOTHiI2B6/P35OfXzW/SA+ahWLuXYZa4eUvyGQpBCoW+kuDUuIkYQ
 KLGw==
X-Gm-Message-State: AFqh2koZU2llpWkNvIGWobKI+Y3yIbifCZboeOsnM/meYingMvZFb2K4
 RuaFk5einwP2Ud298qBgTwOz1w==
X-Google-Smtp-Source: AMrXdXsGHzRbOgFPAjG/634TVSTUGtwJ1klc+iShLchKzs1uQszP0/7sA2z4KzYUimY5S/tiWw+A9A==
X-Received: by 2002:a19:7008:0:b0:4b5:7d49:4a05 with SMTP id
 h8-20020a197008000000b004b57d494a05mr15720943lfc.0.1673197023014; 
 Sun, 08 Jan 2023 08:57:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 07/13] drm/bridge: lt9611: rework the mode_set function
Date: Sun,  8 Jan 2023 18:56:50 +0200
Message-Id: <20230108165656.136871-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mode_set callback is deprectated for drm_bridges in favour of using
atomic_enable callback. Move corresponding code into the function
lt9611_bridge_atomic_enable() and turn lt9611_bridge_pre_enable() into
the proper atomic_pre_enable callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 61 +++++++++++++++----------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 3b77238ca4af..1b65a573be27 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -713,6 +713,39 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 			    struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct drm_display_mode *mode;
+	struct hdmi_avi_infoframe avi_frame;
+	unsigned int postdiv;
+	int ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	lt9611_mipi_input_digital(lt9611, mode);
+	lt9611_pll_setup(lt9611, mode, &postdiv);
+	lt9611_mipi_video_setup(lt9611, mode);
+	lt9611_pcr_setup(lt9611, mode, postdiv);
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
+						       connector,
+						       mode);
+	if (!ret)
+		lt9611->vic = avi_frame.video_code;
 
 	if (lt9611_power_on(lt9611)) {
 		dev_err(lt9611->dev, "power on failed\n");
@@ -856,7 +889,8 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_OK;
 }
 
-static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
+static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	static const struct reg_sequence reg_cfg[] = {
@@ -884,29 +918,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	lt9611_sleep_setup(lt9611);
 }
 
-static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   const struct drm_display_mode *adj_mode)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	struct hdmi_avi_infoframe avi_frame;
-	unsigned int postdiv;
-	int ret;
-
-	lt9611_bridge_pre_enable(bridge);
-
-	lt9611_mipi_input_digital(lt9611, mode);
-	lt9611_pll_setup(lt9611, mode, &postdiv);
-	lt9611_mipi_video_setup(lt9611, mode);
-	lt9611_pcr_setup(lt9611, mode, postdiv);
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
-						       &lt9611->connector,
-						       mode);
-	if (!ret)
-		lt9611->vic = avi_frame.video_code;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	return __lt9611_detect(bridge_to_lt9611(bridge));
@@ -957,11 +968,11 @@ lt9611_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
-	.mode_set = lt9611_bridge_mode_set,
 	.detect = lt9611_bridge_detect,
 	.get_edid = lt9611_bridge_get_edid,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,
 	.atomic_post_disable = lt9611_bridge_atomic_post_disable,
-- 
2.39.0

