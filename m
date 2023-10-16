Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B77CB065
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AD710E233;
	Mon, 16 Oct 2023 16:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390C710E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso46721265e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475243; x=1698080043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OLZfAioiQyP2GbHH4z94Kghh0UWm5WmSuFGJ712+5P8=;
 b=dBZ6i25KLV+MNuavLDktfausfix16Yhg1yqgafcQJ41Ys2mwODe6cHif5irxV5wqxi
 y35OxgkQYrsUU6ogafwZSGfbYwKeIBKSzMdHoeP1xx5gXsvyP4Fa038+Et153wItwI4d
 3R60mdfC8S7f056wjCg29owUAaFbVCxFkxOUQcP60tIFCQozc/MWmEN3xAXUBEokACj3
 VALs0EgEy+vC2Dogqk0vM4hQJalncZogCtHlwcJ2IJK4VTtzuJPht0gdONb0AUZfqH9x
 Xgp57sFow/Vu2tfNtoeDlypZ8ECbGWW3Gr4hHQxm9QgpiI3jzx6EaADyqP5nEcri8Eum
 jvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475243; x=1698080043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OLZfAioiQyP2GbHH4z94Kghh0UWm5WmSuFGJ712+5P8=;
 b=voqIZ8VePzeNFp3u3wc6QgRt+24vQFiWPUDJulGbJrsquKm9IhllgpQmGuoxxztNHS
 Hhcy7zpaGQp8NuLs2dHtie5XTTXDGYdu926IDB2s6x40czgqGZeo+Y8cvWPzrgS23kfm
 CuQrGcxTDVW77UXXfruWOpAX2VNYxn878GFZGNWJnfGjY+NCLdw/LHovwNQoGi1Epbl9
 inANl7YlLu2xHgs3hpo2r2T/2kjuuDdFmG0LBvKn9N2CJusqq2Ke4Z36edj8XNdmFmjd
 iGL6/ZdKQiXy4RLJHNc0QvEJmkSVlDL0Y5UanYiLuGNPO4t+0nm+8uVksidR3E6Hu1r0
 lGQw==
X-Gm-Message-State: AOJu0YxG/n6cIfmPwQQrNo4I4/UnB7cF9rJbZqPMCDZcsjCJ38IzfjP9
 LlVHJpUK9Ay2WkOVJBNnIMbyrw==
X-Google-Smtp-Source: AGHT+IEBvJ0AZHZOH5C1QXJLEQY2GElyolulqaAir+SIzHoMEpjQbAyxb+WOdlGZX6IRMJmT8vnGLw==
X-Received: by 2002:a05:600c:2242:b0:401:be70:53b6 with SMTP id
 a2-20020a05600c224200b00401be7053b6mr30210769wmm.15.1697475243658; 
 Mon, 16 Oct 2023 09:54:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:03 -0700 (PDT)
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
Subject: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over the
 DSI link power state
Date: Mon, 16 Oct 2023 19:53:48 +0300
Message-ID: <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
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

The MIPI DSI links do not fully fall into the DRM callbacks model. The
drm_bridge_funcs abstraction. Instead of having just two states (off and
on) the DSI hosts have separate LP-11 state. In this state the host is
on, but the video stream is not yet enabled.

Introduce API that allows DSI bridges / panels to control the DSI host
power up state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 14201f73aab1..c467162cb7d8 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
 
+bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host)
+{
+	const struct mipi_dsi_host_ops *ops = host->ops;
+
+	return ops && ops->power_up;
+}
+EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
+
+int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
+{
+	const struct mipi_dsi_host_ops *ops = host->ops;
+
+	if (!mipi_dsi_host_power_control_available(host))
+		return -EOPNOTSUPP;
+
+	return ops->power_up ? ops->power_up(host) : 0;
+}
+EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
+
+void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
+{
+	const struct mipi_dsi_host_ops *ops = host->ops;
+
+	if (!mipi_dsi_host_power_control_available(host))
+		return;
+
+	if (ops->power_down)
+		ops->power_down(host);
+}
+EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
+
 static ssize_t mipi_dsi_device_transfer(struct mipi_dsi_device *dsi,
 					struct mipi_dsi_msg *msg)
 {
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 167742e579e3..e503c3e4d057 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -68,6 +68,8 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
  * @attach: attach DSI device to DSI host
  * @detach: detach DSI device from DSI host
  * @transfer: transmit a DSI packet
+ * @power_up: enable DSI link and bring it to the LP-11 state
+ * @power_down: fully disable DSI link
  *
  * DSI packets transmitted by .transfer() are passed in as mipi_dsi_msg
  * structures. This structure contains information about the type of packet
@@ -81,10 +83,18 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
  * function will seldomly return anything other than the number of bytes
  * contained in the transmit buffer on success.
  *
- * Also note that those callbacks can be called no matter the state the
- * host is in. Drivers that need the underlying device to be powered to
- * perform these operations will first need to make sure it's been
- * properly enabled.
+ * Note: currently there are two modes of DSI power control. Legacy drivers
+ * will call those callbacks no matter the state the host is in. DSI host
+ * drivers that need the underlying device to be powered to perform these
+ * operations will first need to make sure it's been properly enabled.
+ *
+ * Newer drivers will set the @MIPI_DSI_MANUAL_POWERUP flag to indicate that
+ * they will call @mipi_dsi_power_up() and @mipi_dsi_power_down() to control
+ * the link state of the DSI host or they will set @MIPI_DSI_AUTO_POWERUP to
+ * indicate that the driver is fine with the link being powered up in DSI
+ * host's (atomic_)pre_enable() callback and then being disabled in the
+ * (atomic_)post_disable() callback. The transfer callback must only be called
+ * if the DSI host has been powered up and was not brought down.
  *
  * Note: some hosts (sunxi) can not send LP commands between HS video
  * packets. Thus all DSI transfers sent in LP mode should be limited to the
@@ -97,6 +107,8 @@ struct mipi_dsi_host_ops {
 		      struct mipi_dsi_device *dsi);
 	ssize_t (*transfer)(struct mipi_dsi_host *host,
 			    const struct mipi_dsi_msg *msg);
+	int (*power_up)(struct mipi_dsi_host *host);
+	void (*power_down)(struct mipi_dsi_host *host);
 };
 
 /**
@@ -143,6 +155,10 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 #define MIPI_DSI_MODE_LPM		BIT(11)
 /* transmit data ending at the same time for all lanes within one hsync */
 #define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
+/* DSI peripheral driver manually controls DSI link powerup */
+#define MIPI_DSI_MANUAL_POWERUP		BIT(13)
+/* DSI peripheral driver is fine with automatic DSI link power control */
+#define MIPI_DSI_AUTO_POWERUP		BIT(14)
 
 enum mipi_dsi_pixel_format {
 	MIPI_DSI_FMT_RGB888,
@@ -235,6 +251,11 @@ void mipi_dsi_device_unregister(struct mipi_dsi_device *dsi);
 struct mipi_dsi_device *
 devm_mipi_dsi_device_register_full(struct device *dev, struct mipi_dsi_host *host,
 				   const struct mipi_dsi_device_info *info);
+
+bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host);
+int mipi_dsi_host_power_up(struct mipi_dsi_host *host);
+void mipi_dsi_host_power_down(struct mipi_dsi_host *host);
+
 struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi);
 int mipi_dsi_detach(struct mipi_dsi_device *dsi);
-- 
2.42.0

