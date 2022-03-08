Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF244D1236
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A828610ED49;
	Tue,  8 Mar 2022 08:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE5210ED49
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:54 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id n15so6417025plh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzuL90H2SXaIr6WoFWlHW5oD691TseVSnN53BQHlmIY=;
 b=ORwZdfSwAXE/HE392graNvVZobtYmHvVAyBUT+5gNaYrMbeMpd84+iyO+f+3oRvEqv
 7FF2BwW+N2xytZPCxS97M1ZX1Ym9VgjWBYIQ20hCn3gUfAaWESPESPHLJf+LDZ3MCt4A
 GWKhe+rzDNHdAFV9tVvrskcmyyZekSg+egBFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzuL90H2SXaIr6WoFWlHW5oD691TseVSnN53BQHlmIY=;
 b=CF8Cf46Urhm7Ow0OzLGDXjID04kVJDPBIZQswx+R4nM9+v53TO8hDlEcpjbmKmoos7
 ELEyJJFa4VU++PLvsU/sirCNbcRJEnFRKhimp4KnNSUMPvGkPgRS7LM1AAOFIcOseqKP
 o9/J+QBOMg96anzqg6oTSba4ItQwIcDFNE+sHh2USb0zoQ5iNrREboh9Lreq7yHvvP6Y
 FtDRZawIhWTrQ70fdnSdFEPA7JM7htKkRKSKgHU6TY/GW9BREZrlZrhul5flReY1bTGS
 iVUl426iUQDtIpazzX0IRw9wBRgs7cFpZ3YFc8MRrkz8lSy6U1jJF+HKCKP+MpncIWBU
 DL3g==
X-Gm-Message-State: AOAM533OgOG+bLuZHjwqf1yO/BNrXYwpo+jCup19ZUvPG0PfHB41P/we
 778NhcQC4gvlLkKPbjfjj7sFRQ==
X-Google-Smtp-Source: ABdhPJyGxl+aeYf1iPyESRiBGHJ9wdWWzh2xdbr2ULb2U+0h2eNrcJzJ67b382H3OSrc4/yJi3RcLw==
X-Received: by 2002:a17:90a:1f08:b0:1bc:1b9f:9368 with SMTP id
 u8-20020a17090a1f0800b001bc1b9f9368mr3452219pja.63.1646728074320; 
 Tue, 08 Mar 2022 00:27:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:53 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 7/8] drm: bridge: anx7625: Switch to devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:25 +0530
Message-Id: <20220308082726.77482-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Changes for v3:
- drop panel.h
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/analogix/anx7625.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 9aab879a8851..9e686d960e3b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -30,7 +30,6 @@
 #include <drm/drm_hdcp.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1606,8 +1605,6 @@ static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
 	struct device_node *np = dev->of_node, *ep0;
-	struct drm_panel *panel;
-	int ret;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1644,16 +1641,7 @@ static int anx7625_parse_dt(struct device *dev,
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

