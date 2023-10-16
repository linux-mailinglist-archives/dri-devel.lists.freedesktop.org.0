Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC507CB070
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2713A10E23D;
	Mon, 16 Oct 2023 16:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6D010E237
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-406402933edso48858035e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475250; x=1698080050; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDlsbj0O4m938XJJJjIOKHw+A0HfBTEQDaR3qGbI7EM=;
 b=H7qph/Z7Y5Id/FMLMrCCvE501tMaKVCe3WFrLmZsO1kcsv50ywcdfpQovCYAtaQEbw
 +UvjGUcW3rah8f3TqwegxWk/Crdczzp7B1EEjkLRtOyf3ge5+0ZmLJUuGFgrXQDZbLhI
 Ha4DjswIPwAl0rMw8ZdHvhjOYsbHfZfkrXGY5WWfBL92QUfPZwT59kpuCf4H/URw7o/4
 B+K3Q5nNeW43oOoQDIJy2ag2HgYPgAWyY/gJq0n5j4hmDwz5NhitZ1tHqTIQnxUpqSMI
 077B5u5rVNnD2ChInsdBg+z0j6+WmXTIBTntQ9QzwqMPSRq8Whssn4jb3Uf9nqjNpuB0
 SapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475250; x=1698080050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tDlsbj0O4m938XJJJjIOKHw+A0HfBTEQDaR3qGbI7EM=;
 b=nChSWTKRj/ZOK8L+SpPpM0Vlk1PC6c8B6c0ByubatfPjdN+CZKwlA3LsH9hgdXVtCm
 HJqT7rgLVjbLqMZQygGM6RUeYiU1RZlcDDMDmHqRJ+oRmUIh5e1qHzgvZtxJ30ffZkys
 XXbWZ/7h3gqS3OatdVrQhF5+mqSQe41uQdc+lRXLjNX2trQ07r7+UwOA/veCDxCFMe5q
 P+2tg07OVFZwq7VyeV4N7CW8f8XSjAd7eUA0ZeFh9eFqRvuQgkkDFSAYcEUflFv0eaca
 LAvYRd9ArSS1h1hsqseJB6A7Um56fVItNfvrRMIDIIZh7idBKZouTcKQGj/9kgKeQytV
 4s0g==
X-Gm-Message-State: AOJu0Yz/0sepT1tF97tBIFXvVnKIJug0UX/qeyikauMLPJUI3ojzVFkl
 Os16/TztJyh1jI8jpiVMEXx0fg==
X-Google-Smtp-Source: AGHT+IHo4VTLj6QFSkMq4vzDZuAnsr0A18LuIJLePvTKSU99Hb1c9SVuY4KiSXHIr1fuYLLcUJPY5Q==
X-Received: by 2002:a7b:c7d7:0:b0:3fd:2e89:31bd with SMTP id
 z23-20020a7bc7d7000000b003fd2e8931bdmr30618680wmk.14.1697475250508; 
 Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [RFC PATCH 07/10] drm/bridge: ps8640: require manual DSI power control
Date: Mon, 16 Oct 2023 19:53:52 +0300
Message-ID: <20231016165355.1327217-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Parade PS8640 bridge will fail to start if the DSI link is enabled
when the bridge is being reset / powered up (even to the LP-11 state).
To ensure that the DSI link is powered down, require manual control over
the DSI link state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..6c5daaa70cb7 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -458,6 +458,10 @@ static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
 
 	ps8640_bridge_vdo_control(ps_bridge, ENABLE);
 
+	ret = mipi_dsi_host_power_up(ps_bridge->dsi->host);
+	if (ret < 0)
+		dev_warn(dev, "failed to power up DSI host: %d\n", ret);
+
 	ps_bridge->pre_enabled = true;
 }
 
@@ -468,6 +472,8 @@ static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
 
 	ps_bridge->pre_enabled = false;
 
+	mipi_dsi_host_power_down(ps_bridge->dsi->host);
+
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
 	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
 }
@@ -562,6 +568,11 @@ static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps
 	if (!host)
 		return -EPROBE_DEFER;
 
+	if (!mipi_dsi_host_power_control_available(host)) {
+		dev_err(dev, "MIPI DSI host doesn't provide tight power control\n");
+		return -ENODEV;
+	}
+
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi)) {
 		dev_err(dev, "failed to create dsi device\n");
@@ -572,7 +583,8 @@ static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps
 
 	dsi->host = host;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+			  MIPI_DSI_MANUAL_POWERUP;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 
-- 
2.42.0

