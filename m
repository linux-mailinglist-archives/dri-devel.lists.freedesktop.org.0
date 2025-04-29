Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D20AA1CC2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 23:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2D010E0E5;
	Tue, 29 Apr 2025 21:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wv08k8WT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B72310E06E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 19:07:34 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b03bc416962so4637102a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745953654; x=1746558454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
 b=Wv08k8WTNd1eRG6TeeSGFwyaOYX5A0qcZPnbU92r7FA7o2o5PzDrmkLm4PR/lQOfqx
 a8rY9MwPeoOLQsauEDCt2mn1fsbHF2u8YJDQYf1KFFYYM6s7jeAtq0C//2GQmzLlW9FV
 gMwNr2PTBY4dwv77DLFPVkuFHcp+FAMAp+a6VOSwmBigbUoYrO74YwkucCDJC5aEUR9s
 dx4liu/mXzuZIU5egglktwy2+ZiZmeTWgvwtwtL54cgdFD5s+n2dH8sgvqHFtChgVtOJ
 yR8aj1RT0gYUXPQZbkT1WRvv8PNlEHMrFgON6Zr8dATkZWiT+/k/xeqPc2AqnjAbk2m/
 Ru4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745953654; x=1746558454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FgKUcja9BPz39tql1rKCDciihi1+kZS80pJsQPdYXJw=;
 b=DSQTu0rPEW7cgdO86Lb67IekS/6iW9obKAryYtr53NRKvO/RuJab/5zjKd36OP+JCU
 aBO8hZy+Vs42W4MT7f1OxHd+b91jOSAZd/R3oGvEPp8UQJ/gsnId9VW+FwnPpwdQHMT2
 cVwBb0d+ru6E3sDrE6LU3tgDGONDzWK0FfRn0yyXkRejYXiTxqLhNYyTdWA/MzoXW+Di
 yIZh96OvPa2VSMOrV90EDJ1Silw8n8zJBlZxl4zA8qQfStcVGZBKv5ClDQKg2ISuQj6F
 G+SR3O8QAJJeG141SAPd2UFrXS8pZhkVZly7P/AI+KQ+xmfzbIA3/k1ZmU2XwfUwwRNN
 oVnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDuQFohkn1D2zC73n6ybBg+XX6QKozj4KZsA2rcJsvb0a70HOOK9wKd96yKjgbpBd1ou075YriBNI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjtlbEmene6I56twJJo9SOBGV6+ZCsNgzDwqmhHyoE6neFwq1v
 bOSiaZFxVsYaRW64zdoEKHWURcLn9e3i4fCzWMtvm/AbwQNBFSn9
X-Gm-Gg: ASbGncv79A6+BKKoAqL8oJgxEil+hTemKIMIW4y5Xh+qPMuMIDbdrECgmS0YEn9J/92
 4UbgizhlqsM96UGrqV8+FlUegHxqp3cwNCl+UxYmDMModGxT4+KpsbkXO2N704kYRvfXvlifcjv
 BeTeS1CYZ4b7MVfnVkNiYnkzIDU05NpAE6CLy1LJkbyk9lpixyUQzO0gVPsiv/2WjCM+z2Uw9eF
 8oCzm0hvN1VEMwq4mkH9YDrEZRRqYu+Gu52Dn9ehsIZoX7xA/G7z/CNWOcCQTzwBhT/UdhwvPCx
 hepgTkETZ8KpOOriQx5jwz/5kkzWyzfjuOSYKkJ7VkGZvjXKso6dqiFT4m7wPkj9zUaOC0PXuk6
 oyuby
X-Google-Smtp-Source: AGHT+IF2ts+XG616nJO7RIcanOzyRNljW8qvmYtbI5nighVo0d3L81pz0OXCcq1V+31tmdYRgsHXjw==
X-Received: by 2002:a05:6a20:3956:b0:1f5:97c3:41b9 with SMTP id
 adf61e73a8af0-20a8754d547mr149066637.5.1745953653871; 
 Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB..
 ([2001:288:7001:2703:bc46:d693:1404:6ff])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74039a5ea3bsm15101b3a.135.2025.04.29.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 12:07:33 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] drm/meson: Cast mode->clock to unsigned long long
Date: Wed, 30 Apr 2025 03:07:24 +0800
Message-ID: <20250429190724.330883-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Apr 2025 21:18:39 +0000
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

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Cast the type of "mode->clock" to "unsigned long long"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..fe3d3ff7c432 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = (unsigned long long) mode->clock * 1000;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = (unsigned long long) mode->clock * 1000;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0

