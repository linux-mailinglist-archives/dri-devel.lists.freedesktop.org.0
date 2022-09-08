Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4B5B1698
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073E10E99D;
	Thu,  8 Sep 2022 08:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CB910E99D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:13:17 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s206so16013744pgs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 01:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jD1WgCeSA8uWA865ybZkInzC4AA4C89F3a1ntZPiE8k=;
 b=gRx+CxMIiN6H9pj7fPVTKTaBOZuCbadXfe/izl78J7zwh9G/F/ZZfhDRPAR4KUqpIT
 tzTV7y+tG4VbrnkuhCTSDnVuChYd1LK08RhOcWwdzZIjw2AGCjLp9xz3DJj7dl2RNmhS
 laBZg/+nT7AZB8IzBfjPX3AwryZn3ulbsNQ5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jD1WgCeSA8uWA865ybZkInzC4AA4C89F3a1ntZPiE8k=;
 b=gHpgkUZ5ZwpcTfZGExIuJ6+ofj+a7v/JMa+tPW7Qc+I9jQcgn2jeFdQ5Fz3YKxw6mw
 5R5iidEHWLCyXAXmk4x9viNfuQXBdIc7wqKxCebIpyvL4dUluB59wYIGILp3aaYWdt0f
 gJKd3zV2Zvu6d5AeuUH7chmzSvzH17Q0Jz8g2T4FRCSQtyNF2Yx9fx4kZNLKIqEbeyXb
 Fo9F5LapTEZ4ZXMCtXCX874gpB+ENDF/QMeR8E248rqGsMC4OJiTnmmTfrDi6TkHQk6m
 p2QHfcsbO8ULTYjD2F3RMDCYVWl4FoFYPGmr90gBkrg3Mp6C/CYUPh2XrUAywxqAtM2c
 E99A==
X-Gm-Message-State: ACgBeo0zojFWqNXqMEmW7IgNqBmf1yZ82PPxRQJPyp0/ATZTrrTkNz6G
 Vqjx7R0EmtEnIKPnwy6cdXd9BA==
X-Google-Smtp-Source: AA6agR5pAxhOg42yEVQWiNBTst6BWefRDET/Dw+fjQjsfFbYbib4gMXfhh2kApJRsESI7zxngjveLQ==
X-Received: by 2002:a63:6683:0:b0:42b:1d69:a0ff with SMTP id
 a125-20020a636683000000b0042b1d69a0ffmr6965140pgc.475.1662624796587; 
 Thu, 08 Sep 2022 01:13:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5237:c185:9b01:8955])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa79496000000b0052d4cb47339sm14159702pfk.151.2022.09.08.01.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:13:16 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/bridge: it6505: Add pre_enable/post_disable callback
Date: Thu,  8 Sep 2022 16:12:58 +0800
Message-Id: <20220908081259.503236-3-treapking@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220908081259.503236-1-treapking@chromium.org>
References: <20220908081259.503236-1-treapking@chromium.org>
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
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add atomic_pre_enable and atomic_post_disable callback to make sure the
bridge is not powered off until atomic_post_disable is called. This
prevents a power leakage when it6505 is powered off, but the upstream
DRM bridge is still sending display signals.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/bridge/ite-it6505.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9d37660545fb..f5eea138ace4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2984,6 +2984,28 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 }
 
+static void it6505_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = &it6505->client->dev;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "start");
+
+	pm_runtime_get_sync(dev);
+}
+
+static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = &it6505->client->dev;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "start");
+
+	pm_runtime_put_sync(dev);
+}
+
 static enum drm_connector_status
 it6505_bridge_detect(struct drm_bridge *bridge)
 {
@@ -3018,6 +3040,8 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.mode_valid = it6505_bridge_mode_valid,
 	.atomic_enable = it6505_bridge_atomic_enable,
 	.atomic_disable = it6505_bridge_atomic_disable,
+	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
+	.atomic_post_disable = it6505_bridge_atomic_post_disable,
 	.detect = it6505_bridge_detect,
 	.get_edid = it6505_bridge_get_edid,
 };
-- 
2.37.2.789.g6183377224-goog

