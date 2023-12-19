Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A9818D31
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407E10E1D0;
	Tue, 19 Dec 2023 17:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ADE10E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:19 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c580ba223so60186985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005278; x=1703610078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIuIHzK0qm/T7D2HzJVN2+t1kaAcSj5o4LHFrFwAH3M=;
 b=WSdik/sNnTNWznt9wSqp9MF76pN8GW7kEJ9RD7IO7JTjyogjEP346Z0MkYCLDDDoeM
 lhbWYHm8eYXFrv73BjkhWTX75y/qvm6WcpXGJyN0qLCBqqwxeAPxiI9bRHXudhu9S50I
 l8jiU3XvoH/bipr4sPkszitCDuBLOiGXJILSFl+Gs135kUwdE6pLYPjnTfJwrfgOHo6q
 9F+NeJ4Hg/yg8Y9+xJ0Azi672AUlkEZ6ZWgmldu8nKEu3UisDax6DReMQOrDzSjfYALj
 Eq44SFc+LPfW5nndIHjW9quKSEjLMfke9NmKa/Vbto3XvVsi47Zxsx7ZzRtyrPeCwxRK
 BBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005278; x=1703610078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIuIHzK0qm/T7D2HzJVN2+t1kaAcSj5o4LHFrFwAH3M=;
 b=lKY/rMPQWKH8BQu0ac8xgN8xfgxIJVmeKwioJY/5YImJgzcMOLp5FcmnHYEZr16aOY
 LBuM/DpMSjt1iId+S2rySS1OYVSxvCawPS18m+6GyOkT2SRLb9ojYdxxDYNCav9hTzuK
 TjVdVqgdlzQL16fnechbpJ1QZeqsA2U5DjRnNH6wOI846CW4ZiyR+gKZF6Kel6oulkj8
 +Rbo9BwopNpGGiLeIxwI4EkGyRdQEJKz49bupLxhT3jxh7S9hfUZb5D5HgqKbBKzfK38
 0xGOZg2kcuKnFGK935EqNP6Lthm37by5ieaORjp4pPCmEDkQ771IyjsAcMzworf3nU3a
 RSkA==
X-Gm-Message-State: AOJu0YyXBI4AWcAkAfntIybM4OQ4N+hwIN37GSI7ZyG9Hoe4SQvuuOwZ
 EkiBUOOoeW0i+zvnkjg4Cg==
X-Google-Smtp-Source: AGHT+IG+MKZvHdr0LdojEJTOnBVthAxDJ27zyg41YEqLHjuX3KtlEV2RPBM3XFk88GAaBr0tl3d3Kg==
X-Received: by 2002:a05:600c:a01c:b0:40d:2df0:ba12 with SMTP id
 jg28-20020a05600ca01c00b0040d2df0ba12mr458869wmb.83.1703005277928; 
 Tue, 19 Dec 2023 09:01:17 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:17 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 12/29] drm/rockchip: inno_hdmi: Remove tmds rate from
 structure
Date: Tue, 19 Dec 2023 18:00:42 +0100
Message-ID: <20231219170100.188800-13-knaerzche@gmail.com>
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

From: Maxime Ripard <mripard@kernel.org>

The tmds_rate field in the inno_hdmi structure is used mostly to
configure the internal i2c controller divider through a call to the
inno_hdmi_i2c_init() function.

We can simply make that rate an argument to that function, which also
removes a workaround to initialize the divider at probe time when we
don't have a mode yet.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v3:
 - imported patch

 drivers/gpu/drm/rockchip/inno_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 04344ee1265d..102195837206 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -56,8 +56,6 @@ struct inno_hdmi {
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
 
-	unsigned int tmds_rate;
-
 	struct hdmi_data_info	hdmi_data;
 };
 
@@ -134,11 +132,11 @@ static inline void hdmi_modb(struct inno_hdmi *hdmi, u16 offset,
 	hdmi_writeb(hdmi, offset, temp);
 }
 
-static void inno_hdmi_i2c_init(struct inno_hdmi *hdmi)
+static void inno_hdmi_i2c_init(struct inno_hdmi *hdmi, unsigned long long rate)
 {
-	int ddc_bus_freq;
+	unsigned long long ddc_bus_freq = rate >> 2;
 
-	ddc_bus_freq = (hdmi->tmds_rate >> 2) / HDMI_SCL_RATE;
+	do_div(ddc_bus_freq, HDMI_SCL_RATE);
 
 	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
 	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
@@ -421,8 +419,7 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	 * DCLK_LCDC, so we need to init the TMDS rate to mode pixel
 	 * clock rate, and reconfigure the DDC clock.
 	 */
-	hdmi->tmds_rate = mode->clock * 1000;
-	inno_hdmi_i2c_init(hdmi);
+	inno_hdmi_i2c_init(hdmi, mode->clock * 1000);
 
 	/* Unmute video and audio output */
 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
@@ -800,8 +797,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	 * PCLK_HDMI, so we need to init the TMDS rate to PCLK rate,
 	 * and reconfigure the DDC clock.
 	 */
-	hdmi->tmds_rate = clk_get_rate(hdmi->pclk);
-	inno_hdmi_i2c_init(hdmi);
+	inno_hdmi_i2c_init(hdmi, clk_get_rate(hdmi->pclk));
 
 	ret = inno_hdmi_register(drm, hdmi);
 	if (ret)
-- 
2.43.0

