Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1564EDDB0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFB810E29E;
	Thu, 31 Mar 2022 15:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C42C10E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:24 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id b13so5071pfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WMNo4jcJRuN6F5QK69tzr2gZgbW3m/XsCs0EXVccMtM=;
 b=kLrfcWHX9mzfYx2OhQTP31+MVb6kDLMKncRJHjWJ+EHFGC5oIaxPQaS4x9p/+50sqi
 UL18ywB1XCcTPWy4qkYiFn8ggJ0oOSUUAYd/zKSGZam85F7uewGWasvMiKTFlyrISRvt
 fpf35e2hTh+aOdxK7Y/WpED6gVHdKCqBNNBPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMNo4jcJRuN6F5QK69tzr2gZgbW3m/XsCs0EXVccMtM=;
 b=I7d6INNnPDPxq8RS64lC7bJRnyfS4x114n73s4UnYz/9DQ9p2xcZtY5CoH7k29x5D6
 va2rerFU0rMk5/x/VJPIgJcNA5s2rkbo6LedBCvv3aTeKDfoPhiBtLH9jzasdfSM8LEz
 KPajnJmd4c4nBeskrY/LlqA/V8fucSoM1+6MxyUVo8YHMRJyeC/qvNeVOPI57VoVzTXX
 Bq+Ttk1JrTugyNSfJOZpqlbLQHGRa9CvkJAd6826/i+20TVIb1XCuki+voqVIdvsmYiZ
 wSx1ImM3THKmRcXUMS9sYIvqa2iv45AhDjihqoL5rA1VrMwE46EPzOppU4hQrKT9W715
 UhYw==
X-Gm-Message-State: AOAM532rF6ugsn5cBXjECe+7nOfUK2XP4TlFLVM3BaXv/OfKxtzy/v8E
 l0uuXOwuyEUT69AaNoT+PeoxGw==
X-Google-Smtp-Source: ABdhPJwgnwYjLb/3SAzwtBYFjQqD9W338UHdZ99IVuNBFZi9B8BYzKLw6gfSADmbP48Rf7p4jnJbrQ==
X-Received: by 2002:a05:6a00:1903:b0:4fa:fa9e:42e6 with SMTP id
 y3-20020a056a00190300b004fafa9e42e6mr6210035pfi.1.1648741524152; 
 Thu, 31 Mar 2022 08:45:24 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm10205684pjx.42.2022.03.31.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:45:23 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 2/5] drm: bridge: nwl-dsi: Switch to devm_drm_of_get_bridge
Date: Thu, 31 Mar 2022 21:15:00 +0530
Message-Id: <20220331154503.66054-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331154503.66054-1-jagan@amarulasolutions.com>
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- none
Changes for v3:
- drop panel.h
- collect Guido r-b
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/nwl-dsi.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index e34fb09b90b9..a549da5b3f93 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -25,7 +25,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
@@ -912,22 +911,10 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &panel_bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		panel_bridge = drm_panel_bridge_add(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
-	}
 
-	if (!panel_bridge)
-		return -EPROBE_DEFER;
+	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
 	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
-- 
2.25.1

