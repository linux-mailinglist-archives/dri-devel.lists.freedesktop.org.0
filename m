Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1984D122E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E228810ED27;
	Tue,  8 Mar 2022 08:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2B10ED27
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:38 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d187so16702869pfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8mtBMXSGDva1ijP2ZoghJWbGJ+rfSRfbspkHLYkOMU=;
 b=CjTta5AZuLUxV4cZjSf9I/9okho/BogePPKRs/C4Y0V52NlAKOEkZ72FsIpb5Zjc6e
 3iEErN/z+93/QA2ElWcvVeFaifI3s65yQcgQ7w39bYaCqctVDgUnZJbrSJQlH6AMMDbf
 Kp3ak+TjeMfF2+GH4EP9pKcqOZPDZpE3OS5RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8mtBMXSGDva1ijP2ZoghJWbGJ+rfSRfbspkHLYkOMU=;
 b=jeR2hmBOaHUPXrqC4iITJj9cE7ihCwBvDzyvO35fa4HYrxjwn1wAY4w+cM0IjkpEiZ
 VH2sd9/h8yNE5+7fYSsr+pBaDH23QviC/WjnLgKEgz6Tn+bFS8yU2TAaD/MwPaT698x9
 muOK63iKwo8I1rrGJ4LB5JQnFY2x8zKtLjxNhGL25+n2W/NwrWkps7f1uosGUA7gkqms
 n9ij7LOPyNdbzb5YmPpV/kAxPzU62RQRhmw/JFqjK9JgXT3itFgjD7P4NATX6mtEDetU
 pnIdADqmzD8kLAN0OZmEZBjurghqPk/4EKDkC0wt1yOlaJj28XHmNL9M6/7U8vUfVQxo
 6oHA==
X-Gm-Message-State: AOAM530xanbHM+WvcChjGScwwg3ODjaIP9XIlsRCeNtmKkX07WeHkbo0
 m+O4BtnafxaUTcaLEcMu2pbIH38KVFXiJbLw
X-Google-Smtp-Source: ABdhPJwboMskD8ooRmR/LYM8lWfwYSb8rz3O6RcxQS9j6aaOP3aYXBnUBrhW8sXeMANZqTptvZErmA==
X-Received: by 2002:a63:85c3:0:b0:380:3079:c5b3 with SMTP id
 u186-20020a6385c3000000b003803079c5b3mr8916077pgd.274.1646728058059; 
 Tue, 08 Mar 2022 00:27:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:37 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 2/8] drm: bridge: nwl-dsi: Switch to devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:20 +0530
Message-Id: <20220308082726.77482-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- drop panel.h
- collect Guido r-b
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/nwl-dsi.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 30aacd939dc3..88d05a33f658 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -25,7 +25,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
@@ -916,22 +915,10 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
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

