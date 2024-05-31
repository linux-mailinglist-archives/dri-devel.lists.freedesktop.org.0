Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088148D6A64
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE89510E3AA;
	Fri, 31 May 2024 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NZ3lZhXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A908913D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:07:39 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e95a74d51fso37298171fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186057; x=1717790857; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
 b=NZ3lZhXPrJQsWIajR9U40AneaQFrvYbZkvpGQ55fpaHb15bQ8VYkYeuCiKeuC2rPJw
 Fo1ZJlICrktgwRyfOg1KzfYEfmZq3LXHGbqJYEJbWhNnyx6cCVYmhGDMsj6bXTrJA8k5
 Zd4gIkMnugrYcCz4/FbHlfzdBDdj2w6hB3h3/fY89pPisAhDrssbaeecT9fxdrfgJ+Tz
 wVo7oSLjNjGMRNXNzrPNqhukRFvKcjxSB7PM5RAioC/9n72xW58308I+mygSEDLBCIHO
 kR1HjwYMMENbkCO78II1o2jkb8Fl+XlAVMZQfB8B8x66Qo3p5igw6z7HtQxgbp+ya2VL
 8LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186057; x=1717790857;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xk2JZtrRtwrwL4+NkRD4qshhppX0yY2US+tv9P72R1s=;
 b=RdgJwbrx8lxTHzaYhbLJDzqTobHDoyc6f7xKKmRhWNg1HAH1JHar6zcwtUB1AIfHkc
 tKk5tvq9yOin/fE7yDM/XTq1T6gxNCQCzcEIqGE5BCyXwh1O8ve7znm+ARbmb+EZP71O
 s1bPwzfFxNuBZXm1/Hvqc2Bdjgmf945Jbf1Anr4y44m1Nr7SqwgurVLAwGWKhjqYxBre
 deF+lxeCAAFoOYohzk5skRCiemMeTkshMhBqPStsCd+uiWsUU2dPtMRTrTpgp4aaZMOM
 NSgtUQiQEixznZJnrlc/wa+u/bfb7prHytjOpHcyoJBSZjskeKtTKl6coXIdNLPTqrXN
 EcsA==
X-Gm-Message-State: AOJu0Ywh5QZrHgUj6icoQJY0023N3nRatM3EdKPvZHe/Ct4CGAfdAayw
 q5G2XgtJkxwNz20HyJjYmnDo8ohqJlvmYZbUGvixv5DwfZCghjcEMwcpQB/dIU4=
X-Google-Smtp-Source: AGHT+IFRD2RAUhETt5GmKj4NUTgPNO1iLEY35FHrVeaC1n8sq/OEOXGOfyA8SqPqfUwlY1OycDWcuQ==
X-Received: by 2002:a05:651c:1059:b0:2e6:be3c:9d4d with SMTP id
 38308e7fff4ca-2ea9510e113mr26142781fa.12.1717186057247; 
 Fri, 31 May 2024 13:07:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:32 +0300
Subject: [PATCH v4 9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-9-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4619;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OmtXhjZ3Qtpb8oKDdME4LcvLFljKS2x7aDOlRaG8IZU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1qUHmOs3zv3HzrSh5vv6Puem/94qpnJQncHH45k58lcP
 b/5FyzoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEOI3Z/7vpsxyRLTr613x2
 u5rT+gslhbZs9UuMrO8JJieIPHY6ED798pnW2JcXZwk8We4XWX327m5/Fu0fBW9utD5wOuAww7L
 Bx4bX94nQgdOSczSXJPkb2vjfu7smniPkbVJ0V8MiJjdGtx3CxSceXNeOz9HaIKmR/KHH90h02l
 njeAl/1pOFl/r6GBv2nxHdEWHA+zhXQfnY+h8H9+sJTlRIs3zhUZhVktHGHKa7bsdPD58q4YNff
 v7L+XJtkl5QXz5PNfPvfY3KM7pY50/N5+t5/iVcK8aa98uPOvELymrPm42UT/xbWSg285bLitWd
 vu+9potFTylyO1b59dZTr3YHzquf5iuXCqRkv9bW19oBAA==
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

Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.

While the HDMI block has special block to send HVS InfoFrame, use
GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
that requires manual repacking in the driver, while GENERIC0 doesn't
have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
HDR InfoFrame which we do not at this point anyway.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9258d3100042..ad6258a2017a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
 }
 
 #define AVI_IFRAME_LINE_NUMBER 1
+#define SPD_IFRAME_LINE_NUMBER 1
+#define VENSPEC_IFRAME_LINE_NUMBER 3
 
 static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
 					 const u8 *buffer, size_t len)
@@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
 	return 0;
 }
 
+static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
+					 const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure SPD infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
+static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
+					  const u8 *buffer, size_t len)
+{
+	u32 buf[7] = {};
+	u32 val;
+	int i;
+
+	if (len < HDMI_INFOFRAME_HEADER_SIZE + HDMI_VENDOR_INFOFRAME_SIZE ||
+	    len - 3 > sizeof(buf)) {
+		DRM_DEV_ERROR(&hdmi->pdev->dev,
+			"failed to configure HDMI infoframe\n");
+		return -EINVAL;
+	}
+
+	/* checksum gets written together with the body of the frame */
+	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
+		   buffer[0] |
+		   buffer[1] << 8 |
+		   buffer[2] << 16);
+
+	memcpy(buf, &buffer[3], len - 3);
+
+	for (i = 0; i < ARRAY_SIZE(buf); i++)
+		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
+
+	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
+	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+	return 0;
+}
+
 static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 					   enum hdmi_infoframe_type type)
 {
@@ -176,6 +246,25 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 		break;
 
+	case HDMI_INFOFRAME_TYPE_SPD:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
+		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
+			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
+		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
+
+		break;
+
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 	}
@@ -197,6 +286,10 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
 	case HDMI_INFOFRAME_TYPE_AUDIO:
 		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_SPD:
+		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
+	case HDMI_INFOFRAME_TYPE_VENDOR:
+		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
 		return 0;

-- 
2.39.2

