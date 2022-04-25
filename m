Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640E50E22C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 15:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD33C10E262;
	Mon, 25 Apr 2022 13:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F86610E511
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:44:45 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id s14so27118885plk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UN6SFQNZbE9zaNM51H9eT4YuwXVUcUf6icJwAeiY++c=;
 b=EDnvYWJ8aO9xAWueVAjZLcFurdQarTkkurKI/rSQ5/t3kYJ7vNdUsQDZz6IbJtOFV7
 WjLQi3PmJjFuQrCixw0eSB+A27NWoO9yghSzy1xEzh6Agw1QOt9j2o4cPQWv8M23rGFC
 mlm6dnL9IwtH5p9XIQGBaPb4378IcV74+xADQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UN6SFQNZbE9zaNM51H9eT4YuwXVUcUf6icJwAeiY++c=;
 b=qrTbIe7YAaEuvU2nwEUdScz1CnMPLRz+rJi8BxHW5iFpAknhkSNVF6Z92Yj7gCEhvm
 UXa7jPnnqg8dGmyopXK3/rg/C3qczt10FLChLMehaLw0DoNhYEA+Yb7bPrk2UMn7VNVx
 dZlXpPYJFeYELzUBC88r35xMm3JRY6FSd1uTTYW1PAzjq3O2AMnomgkis3KcELN6O12H
 X4Lu1WG6sQxIUmSxAEl61bcUoGQQ3KjIpef6NVTvZcaupf5Us6PdwI7cihN1ftm15p4C
 wW6XZjdiD2raf1/XWQKlUxM6fZeZ2R/B07itJI6xpckyUGpuZ7Ug/YDh2JfJrW04G/qA
 V9zg==
X-Gm-Message-State: AOAM530HDUDsSHFEfWHrLSRJrOOqcQ6Vxro/WwviYh/ZqItvLIg9LRaN
 UmtP9FSmk4fok2tfosZy3uWHDw==
X-Google-Smtp-Source: ABdhPJx6oX46TdH0UmlZjnyTy5MXIDKC9R6daXR5PCWrfEZ9S6xe3ZFDu530HCjFpXUA8kzB12tmlw==
X-Received: by 2002:a17:90a:bb8f:b0:1d9:650e:10f5 with SMTP id
 v15-20020a17090abb8f00b001d9650e10f5mr7203096pjr.148.1650894285129; 
 Mon, 25 Apr 2022 06:44:45 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7496:6d31:4b51:6d37])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b00508379f2121sm11736582pfl.52.2022.04.25.06.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 06:44:44 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: it6505: Send DPCD SET_POWER to downstream
Date: Mon, 25 Apr 2022 21:44:24 +0800
Message-Id: <20220425134424.1150965-1-treapking@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-Yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Send DPCD SET_POWER command to downstream in .atomic_disable to make the
downstream monitor enter the power down mode, so the device suspend won't
be affected.

Fixes: b5c84a9edcd418 ("drm/bridge: add it6505 driver")
Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8fed30df08b0..4b673c4792d7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -737,8 +737,9 @@ static int it6505_drm_dp_link_probe(struct drm_dp_aux *aux,
 	return 0;
 }
 
-static int it6505_drm_dp_link_power_up(struct drm_dp_aux *aux,
-				       struct it6505_drm_dp_link *link)
+static int it6505_drm_dp_link_set_power(struct drm_dp_aux *aux,
+					struct it6505_drm_dp_link *link,
+					u8 mode)
 {
 	u8 value;
 	int err;
@@ -752,18 +753,20 @@ static int it6505_drm_dp_link_power_up(struct drm_dp_aux *aux,
 		return err;
 
 	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D0;
+	value |= mode;
 
 	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
 	if (err < 0)
 		return err;
 
-	/*
-	 * According to the DP 1.1 specification, a "Sink Device must exit the
-	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
-	 * Control Field" (register 0x600).
-	 */
-	usleep_range(1000, 2000);
+	if (mode == DP_SET_POWER_D0) {
+		/*
+		 * According to the DP 1.1 specification, a "Sink Device must
+		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
+		 * Table 5-52, "Sink Control Field" (register 0x600).
+		 */
+		usleep_range(1000, 2000);
+	}
 
 	return 0;
 }
@@ -2624,7 +2627,8 @@ static enum drm_connector_status it6505_detect(struct it6505 *it6505)
 	if (it6505_get_sink_hpd_status(it6505)) {
 		it6505_aux_on(it6505);
 		it6505_drm_dp_link_probe(&it6505->aux, &it6505->link);
-		it6505_drm_dp_link_power_up(&it6505->aux, &it6505->link);
+		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+					     DP_SET_POWER_D0);
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 
 		if (it6505->dpcd[0] == 0) {
@@ -2960,8 +2964,11 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
-	if (it6505->powered)
+	if (it6505->powered) {
 		it6505_video_disable(it6505);
+		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+					     DP_SET_POWER_D3);
+	}
 }
 
 static enum drm_connector_status
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

