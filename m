Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E510487706F
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9395810FE84;
	Sat,  9 Mar 2024 10:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fa5+Nlvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D5310FE8E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:41 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d40fe2181dso19384251fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980300; x=1710585100; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hVak1J+o3ONy3vnRUIeVq/ARZN3J0EKCCHw4ehmpquA=;
 b=Fa5+Nlvps/wqsCbuzbUtLS8HnTSDuN+OztykFSUsog4lnCSx+Dqh5UGDWa7y6k/MTh
 1nGKNPlOuYmBxxBR/egbAdAsA3ooIzqE5Bqi382sPzwL3fm2yv8vqwFXmAeAV0paesHZ
 WE/QdlSSHOz4I+fYQ/7CP5xOMMb9jX/oMIOERfUtu1w8ZSOv0jhoL/QTMfBASWD0Xy38
 rtIgj8KLTWDYeh8/irEACACf88TM873r9Pnnb4DBI5e34cEq0nRQJd1bjJBfCfKn/Hsz
 KWZHQmC+y9oBCEqwMiCMy5p+IhCWyjurd83tW3LXCs9qtL93XUnBpo/id1smKTLNgqJe
 FS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980300; x=1710585100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVak1J+o3ONy3vnRUIeVq/ARZN3J0EKCCHw4ehmpquA=;
 b=UACG1y7DVUtcJS9HoXoJ4p0XHAQUVsegFZJr78Bm0NDsjd5r0ifTb6Q9UsTpIMUIRt
 3Aa1jaA4MgwvS+slb/RuJp5AErtF2avMx5UBUKPKBYV9HCSTpTod9MTIxszrCkK/DgC3
 6TbToJtrEMBdicdhp8VgoqyIyG/2PAOjwFR596WfgWJ3gKrG6+wXvlI1ebb69vu0/XyO
 dk3KBYW3bOtYS6XeQih9s9mwUDX2m4BnHIjKzwnvDmVywN+H8xau0wT6JZASr9EDK9CR
 OFXZjiI1gzPlu2sDmPPUnLqm5s5sOOivcH+ZOe73g4MGr+WERtwuSrId8xzna9I9SXUU
 A0PA==
X-Gm-Message-State: AOJu0Yzi0RzNFvQmnmDFWg7INLMO/1VgvDCm1IkpPfDGnIvCPaPj+WoD
 Eo/aiorhrUhYhdDQ+q8xvKN1Id28k/7W7oL2Pe1Lk3pBiwBUwBEoUBacOHJeplQ=
X-Google-Smtp-Source: AGHT+IHnYzJfbpL84RxZcdOa/oxj01C/8c/YNEBwKCgUivP4PqO5a9ifcxqYB4JLN1UpUrB8URx7HA==
X-Received: by 2002:a2e:9644:0:b0:2d2:2cff:fc49 with SMTP id
 z4-20020a2e9644000000b002d22cfffc49mr1116763ljh.18.1709980299872; 
 Sat, 09 Mar 2024 02:31:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:32 +0200
Subject: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7zA/N8KAt1DsVzqE/w0UCroDP54Ugww4O7l/KrsTO+o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqGKpmWQ7UnQyki0wyQsaptJlMWh9rU2kk5L
 aZGOtVRGdSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hgAKCRCLPIo+Aiko
 1eIiCACmOhghs05XCA5tDfxfgOdmf3vaQaIYVk6LHpSFsRPOh1brfx5fXfxruxfRS7/nqN/sdC4
 +mSDPvMUiRS6fn5GPl35BHtxA3MF4lMr2PoSfLDNv5zLPFXURvbZCjAT9Tv4nMUjvud62sP1P3n
 Ur2l6mXBmA6ktMBbsIp+1d2EvVVtj8avJEFK73UsgU4sO9vUnfjdhTcXjGJYZnADtTtu2DREHoy
 q2PfWlC9ZbpwvKx3E4FsMmURpf9Squ9UWXPKnzwfRBq4tOmEvkO5XrIHFiFHM8q9FNqsQUV8BBo
 LMqh7Kcck2nGQIXhzi0yr3/WPryuflywGqtWrF36c6vYrpG/
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

Setup the HDMI connector on the MSM HDMI outputs. Make use of
atomic_check hook and of the provided Infoframe infrastructure.

Note: for now only AVI Infoframes are enabled. Audio Infoframes are
currenly handled separately. This will be fixed for the final version.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 83 +++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d839c71091dc..26c847f42522 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -68,23 +68,15 @@ static void power_off(struct drm_bridge *bridge)
 
 #define AVI_IFRAME_LINE_NUMBER 1
 
-static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
+static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
 {
-	struct drm_crtc *crtc = hdmi->encoder->crtc;
-	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];
 	u32 val;
-	int len;
 
-	drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
-						 hdmi->connector, mode);
-
-	len = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (len < 0) {
+	if (len != HDMI_INFOFRAME_SIZE(AVI)) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev,
 			"failed to configure avi infoframe\n");
-		return;
+		return -EINVAL;
 	}
 
 	/*
@@ -124,6 +116,55 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	val &= ~HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE__MASK;
 	val |= HDMI_INFOFRAME_CTRL1_AVI_INFO_LINE(AVI_IFRAME_LINE_NUMBER);
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+	u32 val;
+
+	val = hdmi_read(hdmi, REG_HDMI_INFOFRAME_CTRL0);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AVI_SEND |
+			 HDMI_INFOFRAME_CTRL0_AVI_CONT);
+		break;
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		val &= ~(HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SEND |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_CONT |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_SOURCE |
+			 HDMI_INFOFRAME_CTRL0_AUDIO_INFO_UPDATE);
+		break;
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+	}
+
+	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL0, val);
+
+	return 0;
+}
+
+static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
+					   enum hdmi_infoframe_type type,
+					   const u8 *buffer, size_t len)
+{
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
+
+	msm_hdmi_bridge_clear_infoframe(bridge, type);
+
+	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AVI:
+		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
+	default:
+		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return 0;
+	}
 }
 
 static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
@@ -132,6 +173,10 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct hdmi_phy *phy = hdmi->phy;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, encoder);
 
 	DBG("power up");
 
@@ -139,12 +184,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
 	}
 
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	if (hdmi->hdmi_mode)
+		msm_hdmi_audio_update(hdmi);
+
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
 
 	msm_hdmi_set_mode(hdmi, true);
@@ -310,6 +356,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.clear_infoframe = msm_hdmi_bridge_clear_infoframe,
+	.write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
 
 static void
@@ -341,8 +389,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 	bridge->ddc = hdmi->i2c;
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->vendor = "Qualcomm";
+	bridge->product = "Snapdragon";
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_HDMI |
 		DRM_BRIDGE_OP_EDID;
 
 	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);

-- 
2.39.2

