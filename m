Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC16818D3D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645D410E2E7;
	Tue, 19 Dec 2023 17:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7EB10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so47906265e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005287; x=1703610087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlneokmKF1TajoqU6rsqTKLh9Q2KoTuUiBV9HAc+RDM=;
 b=WT2X7d3ncYdp6HJDUfnkEe/iO94z5FlBfujpfo6q4FMJuLiqKW6jA3jsJsDwOYNCaS
 8Fa7yfojrbuv5LaC1swrFlolhBEpiv4hVd3hBB5nequzu0jBe619/xOXH8w/hayY+rDl
 qdEhY2FpNBMiKlDR46dt9kvV/mjwN8DFFMi2oMuPeBvzrrk5RgB0zoOGovfCCCxJcn3b
 VqjM9Jarb5asfbF0/V1DycMt7VnJ2ybyjxBUqmTClPLZu5CsNgmKvAieru4MRH3Mfes9
 lL5puI+wxvmDouD1vaXMlDB5cFvXzm/AS+BwJkUcHxIFJO/RX3Y73d9Il/fRT7yPTMxB
 R1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005287; x=1703610087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlneokmKF1TajoqU6rsqTKLh9Q2KoTuUiBV9HAc+RDM=;
 b=jTNVBLu7cXLz9JPeAVdYw9ewKfjITYYsqlD3ULGJHhBJ019MXRY1bJNTbEx4PyhsMU
 lRzgPxggW6NVuZIziwm4wmrpxlKuGgqE6S/KXloXTZVIRoen6IUuBUhevnJvxphfdLyX
 IrGwORbnTDfn6yABqlndmrkTe4zmrrEPbTfYJPQyQ3HfFPucqe1j6KqdNG/LmVNruOJj
 q2k+TDqbJJa2f46OfWxADVaR08cMEAeMkoC2A3ElhwWMlE3+b7/FlILiyqEX3s5pPj8I
 Tyz1bj3W+rLp7e71siXWvqF0gPAzXRLc55lwu00TcxZPAjNn13KXLxR4W2WXZGQ3Y2SN
 hMbA==
X-Gm-Message-State: AOJu0Yz/xV5IFbgM9mz2FR35I2aaP2khsNQgeuiI+or05itdpCoAG0KO
 RAY4OsTOKbc2oFegoqdP2j4lX+yD1A==
X-Google-Smtp-Source: AGHT+IFgNag5RzBVfRt1FyfNQwZdIW7ZbFhF5a9fbzOs0v3zV+7ntZcb1IJiL0G1mPdw1hfxZoM6rA==
X-Received: by 2002:a05:600c:3502:b0:40d:18e2:895 with SMTP id
 h2-20020a05600c350200b0040d18e20895mr2209578wmq.98.1703005287566; 
 Tue, 19 Dec 2023 09:01:27 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:27 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 22/29] drm/rockchip: inno_hdmi: Split power mode setting
Date: Tue, 19 Dec 2023 18:00:52 +0100
Message-ID: <20231219170100.188800-23-knaerzche@gmail.com>
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

This splits setting the power mode of the controller / phy in two
functions. It's done in preparation of setting up the phy based on the
pixelclock.

No functional changes intended.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v3:
 - new patch

 drivers/gpu/drm/rockchip/inno_hdmi.c | 54 +++++++++++++---------------
 drivers/gpu/drm/rockchip/inno_hdmi.h |  5 ---
 2 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 9fea464b6234..e21f6d7aeee6 100644
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

