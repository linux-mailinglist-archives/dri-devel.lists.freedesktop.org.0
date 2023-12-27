Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7E81EE47
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 11:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A410E032;
	Wed, 27 Dec 2023 10:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4596910E032
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 10:43:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6d0a679fca7so1832045b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 02:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703673810; x=1704278610;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yQyauLZpBuVyKcsRSZOIv2oS+kk+ZdFH+9BKEUlZjBY=;
 b=ZBKo8sByKjzTm7n0kMbFEJwWvBPBCo7itao61lISI7DqqTafOB2rcDs4VT8BtiGoVd
 1Cqpn7U4KAFfB4QT3gOanizZpSK6mTlqeAzAo9QmiUzq0e+Y5dGDUFK0MjvInpY0E+ad
 VZQXZOzCX5Mxr1msSiBEZkhHkfu2p40S+O6Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703673810; x=1704278610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQyauLZpBuVyKcsRSZOIv2oS+kk+ZdFH+9BKEUlZjBY=;
 b=r1r77Rrp6mMRfLut/nwA8nSuRd2u8i2XI7k44i5cd1JTguEiys6VKXDV1ntwsX0kZ+
 nE0LdZzjfKMPc9ZlUvmf/GZq72VcMG4tej56EB+HHx6iU8e1oB/I8jGDvuaHSIaZPA1B
 wL1WS1fiv7fFUmeuTofiP+gwbLfSmzasWMhgOZ8403YHbzHDTw35EPxevuGYHJDBtA8s
 BSx3+geNXAHaONpiUWiqIJLhqsDcuPZygoqt1m6jn4baX5UitCd1seei/xAXZSKwsa+E
 8pQPRxoFhC3eL5Z9kJ/jKRuICWjhmBJ8WKkXhP/u7L8bxb5BvTx1i3mx89JZsJ3dVfuK
 CftA==
X-Gm-Message-State: AOJu0YygZcxaJ6dexcPQHVAt28we1Hvu6iGBfwccAebmlH73ewhB0wm7
 rzYLAAiSY267AS/KaPlFVFqIufi+/yGo
X-Google-Smtp-Source: AGHT+IGL05LvH/t32LDNIF/kC/4NeTQ036oBgMVdj8N46a0EgWRcxP6whWsvaqZNRtuVyS/anTFn0g==
X-Received: by 2002:a05:6a00:d6d:b0:6d9:a87c:4a3a with SMTP id
 n45-20020a056a000d6d00b006d9a87c4a3amr1559084pfv.68.1703673809766; 
 Wed, 27 Dec 2023 02:43:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:18d2:7869:e8b9:f4e4])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056a0002a700b006cb6119f516sm6128004pfs.163.2023.12.27.02.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Dec 2023 02:43:29 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: parade-ps8640: Ensure bridge is suspended in
 .post_disable()
Date: Wed, 27 Dec 2023 18:42:53 +0800
Message-ID: <20231227104324.2457378-1-treapking@chromium.org>
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

Disable the autosuspend of runtime PM and use completion to make sure
ps8640_suspend() is called in ps8640_atomic_post_disable().

The ps8640 bridge seems to expect everything to be power cycled at the
disable process, but sometimes ps8640_aux_transfer() holds the runtime
PM reference and prevents the bridge from suspend.

Instead of force powering off the bridge and taking the risk of breaking
the AUX communication, disable the autosuspend and wait for
ps8640_suspend() being called here, and re-enable the autosuspend
afterwards.  With this approach, the bridge should be suspended after
the current ps8640_aux_transfer() completes.

Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power management")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..f8ea486a76fd 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -107,6 +107,7 @@ struct ps8640 {
 	struct device_link *link;
 	bool pre_enabled;
 	bool need_post_hpd_delay;
+	struct completion suspend_completion;
 };
 
 static const struct regmap_config ps8640_regmap_config[] = {
@@ -417,6 +418,8 @@ static int __maybe_unused ps8640_suspend(struct device *dev)
 	if (ret < 0)
 		dev_err(dev, "cannot disable regulators %d\n", ret);
 
+	complete_all(&ps_bridge->suspend_completion);
+
 	return ret;
 }
 
@@ -465,11 +468,37 @@ static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
 				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
+	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
 
 	ps_bridge->pre_enabled = false;
 
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
+
+	/*
+	 * The ps8640 bridge seems to expect everything to be power cycled at
+	 * the disable process, but sometimes ps8640_aux_transfer() holds the
+	 * runtime PM reference and prevents the bridge from suspend.
+	 * Instead of force powering off the bridge and taking the risk of
+	 * breaking the AUX communication, disable the autosuspend and wait for
+	 * ps8640_suspend() being called here, and re-enable the autosuspend
+	 * afterwards.  With this approach, the bridge should be suspended after
+	 * the current ps8640_aux_transfer() completes.
+	 */
+	reinit_completion(&ps_bridge->suspend_completion);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_sync_suspend(dev);
+
+	/*
+	 * Mostly the suspend completes under 10 ms, but sometimes it could
+	 * take 708 ms to complete.  Set the timeout to 2000 ms here to be
+	 * extra safe.
+	 */
+	if (!wait_for_completion_timeout(&ps_bridge->suspend_completion,
+					 msecs_to_jiffies(2000))) {
+		dev_warn(dev, "Failed to wait for the suspend completion\n");
+	}
+
+	pm_runtime_use_autosuspend(dev);
 }
 
 static int ps8640_bridge_attach(struct drm_bridge *bridge,
@@ -693,6 +722,8 @@ static int ps8640_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	init_completion(&ps_bridge->suspend_completion);
+
 	ret = devm_of_dp_aux_populate_bus(&ps_bridge->aux, ps8640_bridge_link_panel);
 
 	/*
-- 
2.43.0.472.g3155946c3a-goog

