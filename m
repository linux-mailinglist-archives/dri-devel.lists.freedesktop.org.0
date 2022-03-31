Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 826184EDDB2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F1110F3F1;
	Thu, 31 Mar 2022 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD96910F3F1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:32 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id z16so22438241pfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2mzvnygYESinmJ04gWOHbIrTmnMi9ZDExacYAJdSLbE=;
 b=j5B6gbrHiZqQKYvLnxf9tTGmt/UluiftsBMadypD45hdgzhf6GjB+t3l8b8ZBstYWN
 EsjMJYAToPMvNbfdRUPBU92FrjmjyYqYqRxYQCxPtsFu62EX2afZpOJ9u4PYw4Q8jgBC
 M6O1A99TRsz5myl7T8TtGnY/dMzd4xrl2Rvjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2mzvnygYESinmJ04gWOHbIrTmnMi9ZDExacYAJdSLbE=;
 b=UdKGhIZto1DdyjQpcfvpc7LMU3oYxc8O04K2lx/GSjNVqV8W69WmDeNcFTeUcTF0QN
 RGjbDoZHICglJUllX5RR5jB2zBuLZ0BEEdUOXsifppdh/ZsuGUemniFWWIunqiGxmwCn
 KKOkjL9/XZBDH3IzmTiQw5J1ksrvS2VKNMdA96bJVEl/9BgMKlsQbL2Zzh6Sv/BLsNYo
 xBOkFGA2Zb0Amwc6n56lNhpzPR3Rlaj8raD1B2RPyr6uZDYFk9fRTP6VYMeaoEScjYMy
 6tHwldw5E7YLQ29LvTRDOnsbl9xC683sPeqs9bsQcm90CoFjRCpAW8ZKam7IvS4SWKjq
 dQHw==
X-Gm-Message-State: AOAM531wewOuOmQwissBOUE/2QzqIJaheOKN2tr5Sj8ufA7fq0IRiTTx
 eQHFIdzKFmmYfM7zr8BNgAydcA==
X-Google-Smtp-Source: ABdhPJya2H/nz2WsKdsMwL9t871tCeCIP5sdIa+u2gFJYQA9t/QcygQU+SqjewlBEgjtdQSDGt0cnA==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id
 b5-20020a056a00114500b004f63ebca79bmr6043226pfm.41.1648741532234; 
 Thu, 31 Mar 2022 08:45:32 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm10205684pjx.42.2022.03.31.08.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:45:31 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 4/5] drm: bridge: dw-mipi-dsi: Switch to
 devm_drm_of_get_bridge
Date: Thu, 31 Mar 2022 21:15:02 +0530
Message-Id: <20220331154503.66054-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331154503.66054-1-jagan@amarulasolutions.com>
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none 
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 1cc912b6e1f8..b2efecf7d160 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -315,7 +315,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -329,17 +328,9 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	dsi->panel_bridge = bridge;
 
-- 
2.25.1

