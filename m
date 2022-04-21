Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9838050A693
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1C210E65B;
	Thu, 21 Apr 2022 17:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B5A10E65B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:07:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so3845805wmq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Fvcbf2Jm5l/vRCSGsuIt2faeX/qaz6+Vl1oafOAcKQ=;
 b=NMfSYNOPYP5wVJpdUDLQMLA9kSTWWoJS6DdQqc6sbuqGuz75ibsvUdGuuvwEplCgPM
 iFS7sQm+KrsRrQ38IV7thWl9D7GoM/s45vg7Zs8NMR9NQuZrj5peb1saZeX5NghZ2mJH
 /WU5rs+mq9WiOHP5cA8jNkFqzKfub6miD+dB9JoFLMW8yHVc/ISmwCJH6wJXAIvYYaTm
 Q+amkXrv5Xr7c4mq4s/2BELAdO73Dc5Wovph1WiFw7x/92IPLZfRmPh0U44iJLQr4YZZ
 JSJs+Urv3gKaQY6SgTcepc4t9aUZ430cSQwlRjfBW1dx6rHKeJ8DjUvRgZfbT6cGEx1F
 yWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Fvcbf2Jm5l/vRCSGsuIt2faeX/qaz6+Vl1oafOAcKQ=;
 b=0oyACrmbRZrKKUWI8yUPRPs6nD0M7OM2HavuXq7qkkPBbSZDrP7w1fR+PGYeTEBxzC
 tR4C6kmovNbNA7w0pn8QAOBxd278pTGw29W7xWVHACM9lKuBCjAZiZ8CA8555p35sFYY
 gUu6Ua3gJu1fIz7fCk4zYMBnFX5Gh2YKL047Qx8JfviCN6XlPHfN4TcpNu/zHR88YMKJ
 0yrhW5CBz+ApUWFs3PBTceWpygw4iMiwEWx3QCYh0pzm2J94HPIWdSXL/M46kDQogaQG
 zuFKjHQ5jYq9fXJC6/CFz49IG4Lb1r6PHQ3agWOcH7XFnbqCwVr76UTWS0HY4iaO81/q
 Rgig==
X-Gm-Message-State: AOAM533IXJTR/eS87J3CDmNN84hEZzFpoii4p+UwwR2CfSTS7XkepIyE
 WAKkD5q7ZFCLUl2uIlVVP0E=
X-Google-Smtp-Source: ABdhPJwR0kknMZpvf1LjdEueL/t7nBEI/Q5b0+MyD3XtVoquZJFTZctKAaW4elf7wJkbs+MyuxguFQ==
X-Received: by 2002:a1c:35c1:0:b0:38e:c4f6:1931 with SMTP id
 c184-20020a1c35c1000000b0038ec4f61931mr280617wma.161.1650560859146; 
 Thu, 21 Apr 2022 10:07:39 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:07:38 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Subject: [PATCH 1/5] drm/exynos: hdmi: Replace drm_detect_hdmi_monitor() with
 is_hdmi
Date: Thu, 21 Apr 2022 19:07:21 +0200
Message-Id: <20220421170725.903361-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421170725.903361-1-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 samuel@sholland.org, krzk@kernel.org, linux-rockchip@lists.infradead.org,
 wens@csie.org, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi.

This driver calls drm_detect_hdmi_monitor() to receive the same
information and stores its own cached value, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead and also remove hdmi_context.dvi_mode as it is no longer
necessary.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..a6743ae87728 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -119,7 +119,6 @@ struct hdmi_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
-	bool				dvi_mode;
 	struct delayed_work		hotplug_work;
 	struct cec_notifier		*notifier;
 	const struct hdmi_driver_data	*drv_data;
@@ -811,11 +810,12 @@ static int hdmi_audio_infoframe_apply(struct hdmi_context *hdata)
 static void hdmi_reg_infoframes(struct hdmi_context *hdata)
 {
 	struct drm_display_mode *m = &hdata->encoder.crtc->state->mode;
+	struct drm_display_info *display = &hdata->connector.display_info;
 	union hdmi_infoframe frm;
 	u8 buf[25];
 	int ret;
 
-	if (hdata->dvi_mode) {
+	if (!display->is_hdmi) {
 		hdmi_reg_writeb(hdata, HDMI_AVI_CON,
 				HDMI_AVI_CON_DO_NOT_TRANSMIT);
 		hdmi_reg_writeb(hdata, HDMI_VSI_CON,
@@ -893,9 +893,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
-			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
+			  (connector->display_info.is_hdmi ? "hdmi monitor" :
+							     "dvi monitor"),
 			  edid->width_cm, edid->height_cm);
 
 	drm_connector_update_edid_property(connector, edid);
@@ -1118,9 +1118,10 @@ static void hdmi_audio_config(struct hdmi_context *hdata)
 
 static void hdmi_audio_control(struct hdmi_context *hdata)
 {
+	struct drm_display_info *display = &hdata->connector.display_info;
 	bool enable = !hdata->audio.mute;
 
-	if (hdata->dvi_mode)
+	if (!display->is_hdmi)
 		return;
 
 	hdmi_reg_writeb(hdata, HDMI_AUI_CON, enable ?
@@ -1143,6 +1144,8 @@ static void hdmi_start(struct hdmi_context *hdata, bool start)
 
 static void hdmi_conf_init(struct hdmi_context *hdata)
 {
+	struct drm_display_info *display = &hdata->connector.display_info;
+
 	/* disable HPD interrupts from HDMI IP block, use GPIO instead */
 	hdmi_reg_writemask(hdata, HDMI_INTC_CON, 0, HDMI_INTC_EN_GLOBAL |
 		HDMI_INTC_EN_HPD_PLUG | HDMI_INTC_EN_HPD_UNPLUG);
@@ -1155,7 +1158,7 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 	/* disable bluescreen */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_BLUE_SCR_EN);
 
-	if (hdata->dvi_mode) {
+	if (!display->is_hdmi) {
 		hdmi_reg_writemask(hdata, HDMI_MODE_SEL,
 				HDMI_MODE_DVI_EN, HDMI_MODE_MASK);
 		hdmi_reg_writeb(hdata, HDMI_CON_2,
-- 
2.25.1

