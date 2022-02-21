Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A85EC4BD6CD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647B910F8F3;
	Mon, 21 Feb 2022 07:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10310F8F2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 07:28:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m27so13609309wrb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 23:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3PLukBtwfovlwrmcqI4UjQoWYEr1ObJtYBgUzUoDAs=;
 b=Bu/jNlb3lvECwKGFKqpGdOKDkX/dwpq3DeeCBPL4qdZRs+20A7yQ1DHVXTHQ3m6LvJ
 AnEGmKipFWYIFviPjHqCywEnmWtZ8AwdteBwMKrBHolRiZPXhCB50x/yhvEbAdH2UODJ
 fCdqIHyTsoNPtNXLRpS1jnWpUTga6MLuq/u/vGN/YkPaZ/27WjEQIDJNuIL2l8LPvGC2
 7b+jwdzaIHoNHPVkbK2YpJ46aFRqlzwZz0VwVzRzFMMCEb4igsiWCW2FeBDm4DQIJxXr
 KEToa5m5bIR6JmObEkr98YCR6TrfHD0voUNSh64nEGdSwCQoLM0AjLH2P7x9h/4FO1No
 bCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3PLukBtwfovlwrmcqI4UjQoWYEr1ObJtYBgUzUoDAs=;
 b=dLQS9ErRM4GBMq6tfFG9SQ4m74ykcvcC4oM1CRyGKPptfvdneiEB8qab7yv32H9GTx
 QoKtX7ziFAZuhbuUefid9wo/mckkMDGVa+S4jdhVkbQDBNdH4RRot9VdICVihYPs/4SZ
 3JH91LZ05U4Wr+4qbctp6koIq8QxOgejIOljVx5m1yteGvzaC7OnOR2ZU3wa05SXgqZA
 o4kNjTz1yYBxn5h4X9iTRazM37436HgNfu6ZLUYRCuv25P5JMkN1epx76v8bqYBtJhfh
 uo/ecffRgom7Lqb+qr+pZl1RMeNsr8PdWRV4NCf7FbKj64Wzs1Qs2RHNhJaOcSuQPeRc
 RtjQ==
X-Gm-Message-State: AOAM5338nEpSgBJL4I6Sm5B40ao1ilc5hRKN5M8Ycclj6+5lOZdXRPAM
 fiQ6jR6kopvmghESXS3qxWY=
X-Google-Smtp-Source: ABdhPJycx/kO9uFt2e1KqYq1bD0y+GYGwvsUObhfNQ/vM2YEzor8nrTr9ioB0mbALGJZknXhs5T8Dg==
X-Received: by 2002:a5d:4e03:0:b0:1e3:3a59:48ae with SMTP id
 p3-20020a5d4e03000000b001e33a5948aemr14430468wrt.634.1645428532396; 
 Sun, 20 Feb 2022 23:28:52 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id a1sm51008492wrf.42.2022.02.20.23.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:28:52 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: anx7625: switch to devm_drm_of_get_bridge
Date: Mon, 21 Feb 2022 08:28:35 +0100
Message-Id: <20220221072835.10032-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 2346dbcc505f..dfeb800751d5 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1333,8 +1333,6 @@ static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
 	struct device_node *np = dev->of_node, *ep0;
-	struct drm_panel *panel;
-	int ret;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1371,18 +1369,14 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret < 0) {
-		if (ret == -ENODEV)
+	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(pdata->panel_bridge)) {
+		if (PTR_ERR(pdata->panel_bridge) == -ENODEV)
 			return 0;
-		return ret;
-	}
-	if (!panel)
-		return -ENODEV;
 
-	pdata->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(pdata->panel_bridge))
 		return PTR_ERR(pdata->panel_bridge);
+	}
+
 	DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
 
 	return 0;
-- 
2.25.1

