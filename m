Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC24C8D6C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072F410E898;
	Tue,  1 Mar 2022 14:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B50910E898
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b8so14152962pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRt+M+Ob+KcM1LrH93JuvfzptMSFKo5T03WLMF24Y/0=;
 b=Ky85ZWNXOSs3YqHulxjmIxiuTzgvLB/Oa+BYBNeU+kYCmRoKppV42I599EVczpdw55
 KicKe+1i/QSVz0VprzliHHlXT/O4aWjKnN+a/PftLuDXtEgPWNYW+TrO1Khce3EGTcp4
 Lvy/i2UrSSkSBAdhx0H88+guJ6RiXkCzSg+Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRt+M+Ob+KcM1LrH93JuvfzptMSFKo5T03WLMF24Y/0=;
 b=xU+YkKTHkMBwCEwcvp7ZsJfygEGom1Js2VvgR1fZqIGQ7XWGU8aJFFHgdZ8PVYiqKo
 Q6ercENXrHnnXTrjuwUO5FM/wgolOv9D7Dmvxaq24D5weJ5f1C9KHG+tTZWNo2/eA8/q
 V0Xt2lGDlcYz+8ChNsEUAmIojvyEJ0sQ0FZc9ac3pS9ylMp5Ns7PmOnkwV2atrC/Da6G
 BI1qNWl32uHFhUB3vv1XAROqJGl1Jn2U2N8lr2tkDcsim7KqJ5yNbjXNWoLv0VPC0Csy
 hM4l1jBy41hWIQoa5ZYYbbl7pLsNrnJJTPyCS/fVmoHDZkr7s0MVjBd5X9jySCMbgXbL
 6z7A==
X-Gm-Message-State: AOAM530gzEFGU+0jsL2atz4kUMkE4BW5AatqxA/jClI9LHADR3wy3u4h
 A144Ozr9TBJF+b/C1VjErumVHFuVZ43QcA==
X-Google-Smtp-Source: ABdhPJyZXY1sMQD5FAID/tZoUAe4KKkGYpF/FtmxWbedB5px3gFcQjzSXk40AkOi9iFB0JD67zdapA==
X-Received: by 2002:a17:902:740b:b0:151:8479:3633 with SMTP id
 g11-20020a170902740b00b0015184793633mr2760060pll.152.1646144001150; 
 Tue, 01 Mar 2022 06:13:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 6/8] drm: bridge: parade-ps8622: Switch to
 devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:45 +0530
Message-Id: <20220301141247.126911-6-jagan@amarulasolutions.com>
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

 drivers/gpu/drm/bridge/parade-ps8622.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 614b19f0f1b7..37b308850b4e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -452,18 +452,13 @@ static int ps8622_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1

