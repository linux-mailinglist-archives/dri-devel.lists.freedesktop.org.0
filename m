Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E83F81CDBE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C616110E845;
	Fri, 22 Dec 2023 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F10F10E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336755f1688so1824656f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266958; x=1703871758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfTDEigy6tmq2Mn9E1wnnsAPUxEbWwuqi0N9nc+qdGo=;
 b=E/b7ZLoE027MhNDvFovApn1jUVpd3pn2CRs4d25YXcXv9KAlEiWu8VziD2p8Iu/qCb
 RiIUkla4lXkgSx6+ppfMyVvQsq+4pztyWFtwx9Szy3iG2vYjGEBTaYLn+w0te8rD0Xdy
 y6VfslMVRFNCNwIR5hcb7Xrt/96kXWnwaCVMN6yhSy1cRr9A7nHJchVyqZ/D+3MRlTVN
 880Nwyt1h5Hv7FoAMFUjzu1/7wYWMBp46Z/WOFFe0Wiw/kE/ZH4Jp+p+evI1XyF5er/c
 820vP7PLoB811ZX4A22LwZyIQvVn1tqWN9jzFss8D8HD9OnMVgYhQ2BdCaAIoqiTRDIU
 v70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266958; x=1703871758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfTDEigy6tmq2Mn9E1wnnsAPUxEbWwuqi0N9nc+qdGo=;
 b=Y3GgK9T6NZoq8tcBrn/2O1dAHjeo2MyDnoB3fzG1AsHG/I3YI+7PDZeDvHzTshOy0w
 CLM6CPYR3uc6Bw0h83pxmTS2CUI0kSvYxYPgrMb9IscathJcRc2SUgsCUcqvrn0s1I6T
 lGd8o9Eh7IPFOOPJlIBVuXJ1YqoFfQ/J5wusGjtvNlxUuzpnEWMJBKOpsxCPqBofHxaF
 jvbRuUYJY81AsuAmwuFqpWeccBSMxCPY4Upk48CkzK1IrScQBVj9/wxfNMBIGUHNcsBQ
 Lm583pOy8WKXMSerTyb+JiOiI2sQycB96s83vg4dHGAVGr1mL0ZZHI6emi4YPen7tb8f
 IYHQ==
X-Gm-Message-State: AOJu0Yzf6E6nNf10rZNABQgyLzkIO00BE8YYI/YPA0kDsbuiO4voyQeV
 f9g6iV1h+3Dqi1PzEFbkRw==
X-Google-Smtp-Source: AGHT+IHD1sMRR0b9UfvVWSWGlPGdgDIwu7H3ElnGmo67e7+XKWlpbK8y3mbb/mtv5CeniedxhpSZ1Q==
X-Received: by 2002:adf:e74b:0:b0:332:e667:4277 with SMTP id
 c11-20020adfe74b000000b00332e6674277mr1205025wrn.40.1703266957871; 
 Fri, 22 Dec 2023 09:42:37 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:37 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 22/29] drm/rockchip: inno_hdmi: Split power mode setting
Date: Fri, 22 Dec 2023 18:42:13 +0100
Message-ID: <20231222174220.55249-23-knaerzche@gmail.com>
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

This splits setting the power mode of the controller / phy in two
functions. It's done in preparation of setting up the phy based on the
pixelclock.

No functional changes intended.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v3:
 - new patch

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 54 +++++++++++++---------------
 drivers/gpu/drm/rockchip/inno_hdmi.h |  5 ---
 2 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 52b49f44a4f4..44c311e7e2d3 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -154,38 +154,31 @@ static void inno_hdmi_sys_power(struct inno_hdmi *hdmi, bool enable)
 		hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF);
 }
 
-static void inno_hdmi_set_pwr_mode(struct inno_hdmi *hdmi, int mode)
+static void inno_hdmi_standby(struct inno_hdmi *hdmi)
 {
-	switch (mode) {
-	case NORMAL:
-		inno_hdmi_sys_power(hdmi, false);
+	inno_hdmi_sys_power(hdmi, false);
 
-		hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x6f);
-		hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0xbb);
-
-		hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
-		hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
-		hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
-		hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
-		hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
-		hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
-
-		inno_hdmi_sys_power(hdmi, true);
-		break;
+	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
+};
 
-	case LOWER_PWR:
-		inno_hdmi_sys_power(hdmi, false);
-		hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0x00);
-		hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x00);
-		hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x00);
-		hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
+static void inno_hdmi_power_up(struct inno_hdmi *hdmi)
+{
+	inno_hdmi_sys_power(hdmi, false);
 
-		break;
+	hdmi_writeb(hdmi, HDMI_PHY_PRE_EMPHASIS, 0x6f);
+	hdmi_writeb(hdmi, HDMI_PHY_DRIVER, 0xbb);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x15);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x14);
+	hdmi_writeb(hdmi, HDMI_PHY_SYS_CTL, 0x10);
+	hdmi_writeb(hdmi, HDMI_PHY_CHG_PWR, 0x0f);
+	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x00);
+	hdmi_writeb(hdmi, HDMI_PHY_SYNC, 0x01);
 
-	default:
-		DRM_DEV_ERROR(hdmi->dev, "Unknown power mode %d\n", mode);
-	}
-}
+	inno_hdmi_sys_power(hdmi, true);
+};
 
 static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 {
@@ -202,7 +195,7 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
-	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
+	inno_hdmi_standby(hdmi);
 }
 
 static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
@@ -441,6 +434,8 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
 		  v_AUDIO_MUTE(0) | v_VIDEO_MUTE(0));
 
+	inno_hdmi_power_up(hdmi);
+
 	return 0;
 }
 
@@ -460,7 +455,6 @@ static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 		return;
 
 	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
-	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
 static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
@@ -468,7 +462,7 @@ static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
 {
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
-	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
+	inno_hdmi_standby(hdmi);
 }
 
 static int
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.h b/drivers/gpu/drm/rockchip/inno_hdmi.h
index 93245b55f967..a7edf3559e60 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.h
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.h
@@ -10,11 +10,6 @@
 
 #define DDC_SEGMENT_ADDR		0x30
 
-enum PWR_MODE {
-	NORMAL,
-	LOWER_PWR,
-};
-
 #define HDMI_SCL_RATE			(100*1000)
 #define DDC_BUS_FREQ_L			0x4b
 #define DDC_BUS_FREQ_H			0x4c
-- 
2.43.0

