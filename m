Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360381CDCE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED7110E855;
	Fri, 22 Dec 2023 17:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3ED710E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3368fe3466aso983386f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266951; x=1703871751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4073SJzbMTg0LalE15NpNk7khJfelMofNbr9L2QfJw=;
 b=caJhXNrAtj4JICU0XTrVMXmU57x7A/PeKohtsxPax6jKjiVA9YdN4y+eFhCEYe7vrY
 LEHqQaUFxZUHtgs0/Ro9A2vKpjPwhWugg+OndiWMisKFSdI3ZG1c/tgneda9Uc1OQHtM
 nFFVCC7/xDLSlaNgE1IrAYAGzTSKCJPIN1098vh2aduIdI4rva9yju14Ivm8s1Kjg7fn
 aCkf6R7EKZq/OpnmGER0w0DvQUyobhUDS12fxRAA6kXrl4tXqA78eKyV89vHN3oVZGm0
 q0JSlGqNlMSWau4J0PzwmlC+3LBKZboPTLSMJ79u7fYLWUI5bPrrrFV4Szo4uycRPZT2
 N7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266951; x=1703871751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4073SJzbMTg0LalE15NpNk7khJfelMofNbr9L2QfJw=;
 b=grZtplc202AQSHy5dsA/PhHJzoCUdKxS5s3P9bEgNMXF/QmskQp7o+oRALAsS3yEcu
 UTj0JRKjLGUBr6N7uSAefZAZD7TzipicjV1UAgvd3hjazugTECtqRl+KXS/tyn513IVl
 IkNwyax5NGKQgtuz7e1OxGfkKLZMqcDD+gXFp2tLTVKjRf0W+cZgHWDwMRZmdgKuhgWc
 IHOsvEO6RtUoPeIY6tLPNLoxsR8aU2fcuC9gPLRItB1aTcSKYrmmCacsg+usZL73bCDE
 N8B1ptXAonjVZ4itG7UZJEAskmIZBe9Wttg71YFEUiQXKy0BboR5b0ziNT1FTSYMYLz+
 8UUA==
X-Gm-Message-State: AOJu0YyLXSsZg4u2gVFqRMmVue7ABbj+omDFtCdvGGdY3ur3mN+Mm5LO
 yzrrtylt9qsDM2/TalNbAg==
X-Google-Smtp-Source: AGHT+IFKE1CB3AU8VJ2Br9gEAWpX4rtGxNpDqQ9zPsAgY7yUcLcKeEvfj88neb+uEsF/9Yhz0hxezQ==
X-Received: by 2002:adf:e74d:0:b0:336:9067:c656 with SMTP id
 c13-20020adfe74d000000b003369067c656mr575213wrn.262.1703266950919; 
 Fri, 22 Dec 2023 09:42:30 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:30 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 12/29] drm/rockchip: inno_hdmi: Remove tmds rate from
 structure
Date: Fri, 22 Dec 2023 18:42:03 +0100
Message-ID: <20231222174220.55249-13-knaerzche@gmail.com>
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

changes in v4:
 - none

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

