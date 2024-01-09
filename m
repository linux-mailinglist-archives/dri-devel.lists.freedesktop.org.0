Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA48285B5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2D10E3CC;
	Tue,  9 Jan 2024 12:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E2310E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:05:34 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5ce0efd60ddso1194093a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704801934; x=1705406734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0SAVymi5HmCwUg9UqsOLYPHTs9Rt+kpxHENMqJZJIrQ=;
 b=aAWgeYFd/wFXlQ/sE2jepNHuRKhObWJpsXRavYv7AmeV2awEHy/jg10TWLXWdevTjc
 8yHjlMoGaHxmeCniYHPXeLfkcz2J4vziNTbg0FCcs5Y0VlKQbSR2TnCnXDeduR175YPc
 7Z0OkJws6e/1pFRDAt27c5WIhk34KnCDog2SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704801934; x=1705406734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0SAVymi5HmCwUg9UqsOLYPHTs9Rt+kpxHENMqJZJIrQ=;
 b=lMZrJD6QUfsdqqwrgqKxgojp+HUOiSMIC5M03YaHlkGsUXco5pm5nW3KBXz+TOCgAQ
 T5IwMkKpDq28+Wt2/7TOCw7+iqLcizOHZ6jtkLuQHbCxF/H/Jn1DmJ+ZHCbuk8p8qfxO
 NJQjUslp1YxdaRYhFEJkQwRLJryB6cizInXto/LKr2gQtQxEE5UexR/OPBfmnbdjTmk1
 0MzgzPuSCsj0S3UsURv39otmsr4kxtrNDIULFegEcTQS8Y4rLa+C4j3WCUWcy6ibWWLf
 44SXwgANqOOPcaDdRPz0nPCjwysGOlLO93/u6pY78vLbxXN6b6C93+5ptkidkbeRXocY
 vaug==
X-Gm-Message-State: AOJu0Yxu4NdCzkuRPIIDMXmQN2BMOsIhDCTzh6Mk8gLsKBgNtjH6amhc
 Kz6XmRs3fjrEosAoODpJ3lReoYpBXNOS
X-Google-Smtp-Source: AGHT+IGeIKw+NVQF8nxXIKc3J2iYRmJkKhs/dP1TPBvnnpLOXB7Mx5ephj6FfLKbn60L490sa8BQKg==
X-Received: by 2002:a17:903:22d2:b0:1d4:cf2b:6bfe with SMTP id
 y18-20020a17090322d200b001d4cf2b6bfemr3057932plg.0.1704801934037; 
 Tue, 09 Jan 2024 04:05:34 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:3368:3e0c:8daf:b528])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a170902729700b001d54b86774dsm1638321pll.67.2024.01.09.04.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:05:33 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] drm/bridge: parade-ps8640: Ensure bridge is suspended in
 .post_disable()
Date: Tue,  9 Jan 2024 20:04:57 +0800
Message-ID: <20240109120528.1292601-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Pin-yen Lin <treapking@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ps8640 bridge seems to expect everything to be power cycled at the
disable process, but sometimes ps8640_aux_transfer() holds the runtime
PM reference and prevents the bridge from suspend.

Prevent that by introducing a mutex lock between ps8640_aux_transfer()
and .post_disable() to make sure the bridge is really powered off.

Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power management")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- Use mutex instead of the completion and autosuspend hack

 drivers/gpu/drm/bridge/parade-ps8640.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..46c84ce66041 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -107,6 +107,7 @@ struct ps8640 {
 	struct device_link *link;
 	bool pre_enabled;
 	bool need_post_hpd_delay;
+	struct mutex aux_lock;
 };
 
 static const struct regmap_config ps8640_regmap_config[] = {
@@ -344,10 +345,12 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
 	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
 	int ret;
 
+	mutex_lock(&ps_bridge->aux_lock);
 	pm_runtime_get_sync(dev);
 	ret = ps8640_aux_transfer_msg(aux, msg);
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
+	mutex_unlock(&ps_bridge->aux_lock);
 
 	return ret;
 }
@@ -469,7 +472,18 @@ static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
 	ps_bridge->pre_enabled = false;
 
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
+
+	/*
+	 * The bridge seems to expect everything to be power cycled at the
+	 * disable process, so grab a lock here to make sure
+	 * ps8640_aux_transfer() is not holding a runtime PM reference and
+	 * preventing the bridge from suspend.
+	 */
+	mutex_lock(&ps_bridge->aux_lock);
+
 	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
+
+	mutex_unlock(&ps_bridge->aux_lock);
 }
 
 static int ps8640_bridge_attach(struct drm_bridge *bridge,
@@ -618,6 +632,8 @@ static int ps8640_probe(struct i2c_client *client)
 	if (!ps_bridge)
 		return -ENOMEM;
 
+	mutex_init(&ps_bridge->aux_lock);
+
 	ps_bridge->supplies[0].supply = "vdd12";
 	ps_bridge->supplies[1].supply = "vdd33";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
-- 
2.43.0.472.g3155946c3a-goog

