Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D194C8D6B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D2910E94B;
	Tue,  1 Mar 2022 14:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1BE10E898
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:18 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id ay5so10708700plb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PQVaxp9YYvuXFR5oouUgHJS1okQ3AFQmwBRkeezcmk=;
 b=kNzeZ7i0Vz+vzeoX5GX7PmYIKvg2li1eZowjotqBlJO4TiZSX5SL3m4pUaLv82Abl/
 ZP5uPk2Z6bm+W+RJYSnKlryMBHfLIGdHSmxRlxSi+TOkhLOzbMmU2fPbcEntPV6l3fZl
 Fgr5rBmQvMlKKOYi30O9Gq370YC6P1suqRjBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7PQVaxp9YYvuXFR5oouUgHJS1okQ3AFQmwBRkeezcmk=;
 b=hGSY2AVfOH05ZBetwKfKOOb7tuNUmRC4BombrfhKWVcmFV9ToTcMVZ+/qBVb3Q3vyG
 et+XdLFFKDjBgxKoocRMFvA8Dls1BWzJWlyTDRKhaH0iLjekEyOcN57DF7Y/HKGraGFS
 7tRGMRCv7mgpRI9rroPdOGEWnnf7ksyr2Vbvz18hj0MIdyytXipcQIa2jnATz6spHLFz
 5jHegUEQ9FeHjR3xm/ya9NL+RPMSbT+2zXfZ+oIwojhFHLnOTWV9ZUeUO8+jfyoYe3Xc
 +sjFN/HQmv7NjVlyNtgh6rE7yuO1mTdtVrrSUS95/+ke21H02L4gz6ggXT48pdmeJadP
 LCew==
X-Gm-Message-State: AOAM533NFSo6DeG9qxmFg1Cl3t+AMZb7vBuhgDWhcS5irN+cnzusBxJa
 sWyivUZR2wNY423I9u1gfBnrFw==
X-Google-Smtp-Source: ABdhPJz9zY4ardD4Bhm30BkgRg6UxLBOf2x9bvRBgRTQ9D5lTxoZ9byPKMs25GzVsvbCVhh6ViYN7Q==
X-Received: by 2002:a17:903:244d:b0:150:18f3:8e98 with SMTP id
 l13-20020a170903244d00b0015018f38e98mr25384278pls.28.1646143997833; 
 Tue, 01 Mar 2022 06:13:17 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:17 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 5/8] drm: bridge: nxp-ptn3460: Switch to
 devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:44 +0530
Message-Id: <20220301141247.126911-5-jagan@amarulasolutions.com>
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

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e941c1132598..1ab91f4e057b 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -263,7 +263,6 @@ static int ptn3460_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -271,11 +270,7 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
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

