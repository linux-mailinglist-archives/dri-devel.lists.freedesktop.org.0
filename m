Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66A493A84
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4110F1B4;
	Wed, 19 Jan 2022 12:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC0610F1AD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:37:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so5676432wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtbatZGWzmTr6DnUVWu1NqWNgW9rriYHmmB6wzthA20=;
 b=JWxcBFQmrMmIDILvkvK/SS+Im4XPo9L8Pl9DcWHi+Ri46hejUeOEpiLOVw05+gb7qk
 dHg2xvMjH0rRfpwkkEegTwwO6uZfcwrnLaM4ZAe/YoI77sWKGk6KrWehxJVSj66e37V9
 WCjrol0IzevLXB/WO3ynOjoIc5dynwkqs9Vu0k+5SyLJMMznOGJY5VHcqGR036cMGgSr
 Sm8mLoB00qBO6YXXawH7vCdi5AEYtTrIEE3Y9m3+FMSSvcIgeh/lA27bFy8M07LcBeyN
 sLvnHrTNXpf7mcWFczWIou7JbnHEKJyYlfp2Bc21zNoieIcHpKqu+bBE1592XrxWLerz
 8fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtbatZGWzmTr6DnUVWu1NqWNgW9rriYHmmB6wzthA20=;
 b=ThnpqLX2IwmbgUURD2DyasfsemvMSJPUaDKB2D33mSZxVLbjDNxrpYYT0C7phRsOZp
 JrlUjmXFETTDbPd2IISqXgzwXz+y/x3Q/6MBpT1avoPFfoHtRDsJb6pas7iB28PKHnQq
 JBhv9Ouey/6cSTqp2w9jFVk3+h3bQPuvukh9FMwd/wj9m8n8UVfnbpNNXCSeky3c+Rwa
 rAyIEixFOVX8fcCWCsSUokAd12Eslv+/u5957HpJhOUCEhzKCc2BMnm3MFzu1nytBdqN
 noyfLVBOUQQkSz2gfvNRAWtxo9qyG5GpaiqMY9wIhGFaZNU/3Ivps+1MMrcfwfSTNCO9
 w3cA==
X-Gm-Message-State: AOAM531Tm5ETTOgtjGEk08+sznSZ0jHnm+9ML4eLp5jQpkRcxJU1xE/F
 P+DTAogrTJENaTdWlIlpBik2oQ==
X-Google-Smtp-Source: ABdhPJxGHOe4mirdaI0EnQU54OW7tOqwZqmf5efIF3TQMf5fjYwGXAICSWDLcUt1DvJKIdU68iVj5g==
X-Received: by 2002:a05:6000:10c1:: with SMTP id
 b1mr28467840wrx.226.1642595821323; 
 Wed, 19 Jan 2022 04:37:01 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id bh13sm2610327wmb.33.2022.01.19.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:37:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org
Subject: [PATCH 2/2] drm/bridge: dw-hdmi: filter out YUV output formats when
 DVI
Date: Wed, 19 Jan 2022 13:36:56 +0100
Message-Id: <20220119123656.1456355-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119123656.1456355-1-narmstrong@baylibre.com>
References: <20220119123656.1456355-1-narmstrong@baylibre.com>
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
Cc: jernej.skrabec@gmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the display is not an HDMI sink, only the RGB output format is
valid. Thus stop returning YUV output formats when sink is not HDMI.

Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 56021f20d396..03057d335158 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2538,6 +2538,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
 	struct drm_display_mode *mode = &crtc_state->mode;
+	struct dw_hdmi *hdmi = bridge->driver_private;
 	u8 max_bpc = conn_state->max_requested_bpc;
 	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
 			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
@@ -2564,7 +2565,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 * If the current mode enforces 4:2:0, force the output but format
 	 * to 4:2:0 and do not add the YUV422/444/RGB formats
 	 */
-	if (conn->ycbcr_420_allowed &&
+	if (hdmi->sink_is_hdmi && conn->ycbcr_420_allowed &&
 	    (drm_mode_is_420_only(info, mode) ||
 	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
 
@@ -2595,36 +2596,36 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 */
 
 	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}
 
 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 	}
 
 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+		if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
+	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
+	if (hdmi->sink_is_hdmi && info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	/* Default 8bit RGB fallback */
-- 
2.25.1

