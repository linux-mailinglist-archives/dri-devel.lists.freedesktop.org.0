Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894E7B5DE6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 01:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AFC10E091;
	Mon,  2 Oct 2023 23:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8410E13F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 23:54:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c61acd1285so2616315ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696290850; x=1696895650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ri2H++HoCXFAmUL0q2wpktG5mORN8GB1kk/7QHCMaos=;
 b=ONT0wVBIJ0wXrXJVQzHmJ46L8KstR2NQkef1JeEuQ3mX1xtrgEUrvdwZbyRO8+Q398
 5/Y+TMkz9BdALzkRjQfjplvg/HFMwg1IUgZ6LEddW5Xd+wRtVMma71hIPv5+osBFM4Ji
 aD0Rxhi60NiXNYALj4sOHEF0LQyLYlfh9DlZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696290850; x=1696895650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ri2H++HoCXFAmUL0q2wpktG5mORN8GB1kk/7QHCMaos=;
 b=b8WNDDbPXfZQiV8d7Ld5/kc18Zx+VTkyt9GEquZgseVUnShg0bv15l1Bb1UFv61I5S
 c2ZQwQRg1eSl4j3DOd7HEFwL8xSUjat5+pCVeHO/Y8fr8LgTws6Eepk91BuDsAYowEHl
 aY5RgG4etAdk0GeHeDob2H5ViDJF2XfjQPN0Co8DoeLXiaHBWDUKu+aRZT31EzVpM69l
 fn3DZf1hyMdTlWAyzqMQYvTlxwaa8l580HKDeBGoxmCh5/xhACEe8bDEdAxXf9pgnuOE
 PYPFULLFDRfG+tdTmTTM6J+xxB+9Z61Z8lja9WZKonn7A2788vmX2uIUIzHT7ojIvXH5
 paxA==
X-Gm-Message-State: AOJu0YzWiwAnuunVciIk3W2oWa2vBMp5KqohxtjBT73r593tsf8UjCyE
 dpAgruNgggJr8RU9auCu49FTgw==
X-Google-Smtp-Source: AGHT+IGOU6FXeF+Mqr7pHXMQjIlmKusQnIePSZpUSkDMPro+oP9wmgspqehR3tapjacP7Wamne+/hg==
X-Received: by 2002:a17:903:48c:b0:1c5:dfe9:b1f3 with SMTP id
 jj12-20020a170903048c00b001c5dfe9b1f3mr10596391plb.16.1696290850436; 
 Mon, 02 Oct 2023 16:54:10 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:f676:8db:8677:aefe])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902ee4c00b001c3ea6073e0sm32167plo.37.2023.10.02.16.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 16:54:09 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Associate DSI device lifetime with
 auxiliary device
Date: Mon,  2 Oct 2023 16:54:06 -0700
Message-ID: <20231002235407.769399-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
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
Cc: Maxime Ripard <maxime@cerno.tech>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel produces a warning splat and the DSI device fails to register
in this driver if the i2c driver probes, populates child auxiliary
devices, and then somewhere in ti_sn_bridge_probe() a function call
returns -EPROBE_DEFER. When the auxiliary driver probe defers, the dsi
device created by devm_mipi_dsi_device_register_full() is left
registered because the devm managed device used to manage the lifetime
of the DSI device is the parent i2c device, not the auxiliary device
that is being probed.

Associate the DSI device created and managed by this driver to the
lifetime of the auxiliary device, not the i2c device, so that the DSI
device is removed when the auxiliary driver unbinds. Similarly change
the device pointer used for dev_err_probe() so the deferred probe errors
are associated with the auxiliary device instead of the parent i2c
device so we can narrow down future problems faster.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f448b903e190..84148a79414b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -692,7 +692,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 	return container_of(bridge, struct ti_sn65dsi86, bridge);
 }
 
-static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
+static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
 {
 	int val;
 	struct mipi_dsi_host *host;
@@ -707,7 +707,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 	if (!host)
 		return -EPROBE_DEFER;
 
-	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
+	dsi = devm_mipi_dsi_device_register_full(&adev->dev, host, &info);
 	if (IS_ERR(dsi))
 		return PTR_ERR(dsi);
 
@@ -725,7 +725,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 
 	pdata->dsi = dsi;
 
-	return devm_mipi_dsi_attach(dev, dsi);
+	return devm_mipi_dsi_attach(&adev->dev, dsi);
 }
 
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
@@ -1298,9 +1298,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	struct device_node *np = pdata->dev->of_node;
 	int ret;
 
-	pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
+	pdata->next_bridge = devm_drm_of_get_bridge(&adev->dev, np, 1, 0);
 	if (IS_ERR(pdata->next_bridge))
-		return dev_err_probe(pdata->dev, PTR_ERR(pdata->next_bridge),
+		return dev_err_probe(&adev->dev, PTR_ERR(pdata->next_bridge),
 				     "failed to create panel bridge\n");
 
 	ti_sn_bridge_parse_lanes(pdata, np);
@@ -1319,9 +1319,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ret = ti_sn_attach_host(pdata);
+	ret = ti_sn_attach_host(adev, pdata);
 	if (ret) {
-		dev_err_probe(pdata->dev, ret, "failed to attach dsi host\n");
+		dev_err_probe(&adev->dev, ret, "failed to attach dsi host\n");
 		goto err_remove_bridge;
 	}
 

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
https://chromeos.dev

