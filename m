Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE04C8D65
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6F10E840;
	Tue,  1 Mar 2022 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AB310E840
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id m22so14210080pja.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jr8OFiwMRBvf5MutYyJeoPCBK98kvnIvJiMdmm2+r/o=;
 b=NMigUEfNPoZZ1EFVJZSBi5Hi/w11+EEH0ZKQ+S+oIRsrea3fLtPjECuDkrnktg11XN
 YekUI7JLO/n00oWAgSqELeubnGNupN8Jbmb1rQ4vNnZRP/cqoD4374yJjPe9Px0qYafV
 JeuC0rsrswzf8IS+gaWS+XinUbBXKk9jGU054=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jr8OFiwMRBvf5MutYyJeoPCBK98kvnIvJiMdmm2+r/o=;
 b=KStxehN8wdwPwCBhqvJUdzYVm+vosdCnZVkWs9q6GfW04fVlFNFHY10DMfRBXXh+A4
 KamOYjWYfkO+s662CRzjUNOFyRi7jjnR54NNQDX3Nq//yyeE8WIH9NMP+oPtEGWFBkHg
 HAfyybe/JdRmZQoXrcl0d2YKPGZKjXxJ2UPsKqpHg3bpjYBKh1YFZtLX/UJtCbgm2FgY
 9vHENXHvZFCp45d0WUKhygzJdrg2qpsxysWqdKADfzPKXZ3yj2C7Cx5bIIPscrfmS+aC
 YaNVLYnSxbttnR7onzU5AORPzbL7oVWVHALzX/FxXDdA3qz4FM/lQ29bGpcnds9bLXUM
 SOew==
X-Gm-Message-State: AOAM533aq7BjGvMs1qQpBWjr7JwdOks0jc403Tda6VBJDkprSwcrHAYx
 ImENB9bFTvuwj3O+ESrVpSgRPA==
X-Google-Smtp-Source: ABdhPJxeuAcpWmoqIE6aPNyGN3R7B9jRftli5nr6iw2wq9H/hJujxFPNOMon9nIQ7nGVhcU0hSLU5Q==
X-Received: by 2002:a17:902:ba88:b0:14f:9ef3:f80f with SMTP id
 k8-20020a170902ba8800b0014f9ef3f80fmr25379972pls.170.1646143987730; 
 Tue, 01 Mar 2022 06:13:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:07 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 2/8] drm: bridge: nwl-dsi: Switch to devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:41 +0530
Message-Id: <20220301141247.126911-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301141247.126911-1-jagan@amarulasolutions.com>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/nwl-dsi.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 30aacd939dc3..c9e108a7eca2 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -916,22 +916,10 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
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

