Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097194C8D6E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDF410E9DB;
	Tue,  1 Mar 2022 14:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5059010E9BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:26 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id m22so14210878pja.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qaTZu9FvVrqWlSDXwnXpKy5XmlDOhQcTJsIWX9eI4CQ=;
 b=hbF/WZKzWdKq+ZnC9WOkHndLyK0fUbhXfedwCxXQrqGTUuwQTjKgaQnUw8uuDiwJSS
 Oc9ZQxRWIltaifjPTz19efVAp0f/jy5kMdkm+q3aQpnJBfgREChGOZeeZWvw119bn1XT
 WwdpQq/jVm3Luelv5h7ImBhAtBrtz7xbgm8Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qaTZu9FvVrqWlSDXwnXpKy5XmlDOhQcTJsIWX9eI4CQ=;
 b=SgYjFDHQKfYZmWtz4Z45wJrigHznjsmIqhFMBGLvgzrTNE3lHh3xgStrzJjHLQWDIh
 ZH5zJ0mSJscLKhaYNGfwavT9NYME48IufM9T9rRwrsgP54oEzXOP/Btd296QZZ4zwIJL
 9YEQ+ZOrCLfDHUuGMLw6tuU/XyVWefqseCiHVTy4MuTiyf92WHYbPYXpVu+q/feCU4lR
 P5HJGL/MJ+zyVxA+EgBLU42WkJwZHSmphVGUdpmF2G2BkmOtK4k5Klvn67Fkq1n8Qsx1
 tMmoeEkh9dI1lx4eu64LW1BZiZodSYgD6aMUztAINOzTWHC0t3M9yTnaDNcfBlV1bqw5
 v7Rg==
X-Gm-Message-State: AOAM530w0HSmGPIAalK1Gl3txGGbHMw58XjlK1Jc2O3zhq4udxWrZyPP
 ETIfZ0/TDWAaYexRplAV/IElDA==
X-Google-Smtp-Source: ABdhPJwyA3F8tg7tVMVR2An++ShNqtXXy1lzNRyFsm9R/8aNR0JGe9D7zMm7sbr42tIj7lUETzTRQg==
X-Received: by 2002:a17:902:ba88:b0:14f:9ef3:f80f with SMTP id
 k8-20020a170902ba8800b0014f9ef3f80fmr25381276pls.170.1646144005914; 
 Tue, 01 Mar 2022 06:13:25 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:25 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 7/8] drm: bridge: anx7625: Switch to devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:46 +0530
Message-Id: <20220301141247.126911-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301141247.126911-1-jagan@amarulasolutions.com>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9aab879a8851..f7c911104464 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1606,8 +1606,6 @@ static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
 	struct device_node *np = dev->of_node, *ep0;
-	struct drm_panel *panel;
-	int ret;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1644,16 +1642,7 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret < 0) {
-		if (ret == -ENODEV)
-			return 0;
-		return ret;
-	}
-	if (!panel)
-		return -ENODEV;
-
-	pdata->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	pdata->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(pdata->panel_bridge))
 		return PTR_ERR(pdata->panel_bridge);
 	DRM_DEV_DEBUG_DRIVER(dev, "get panel node.\n");
-- 
2.25.1

