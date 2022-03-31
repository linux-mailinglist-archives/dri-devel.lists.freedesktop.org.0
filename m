Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C126C4EDDB1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA3E10F3EE;
	Thu, 31 Mar 2022 15:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFED310E29E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z16so22438029pfh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LV2sNThwuYoQaoZh1ko9r4mFVB8GTIqFM4DuqiJ9lj0=;
 b=pQu671AKJIEck0bgN5zMJ3lCKtHNjgprj4ZBOhmJEgpohC2m9ZE3FRsqe4vgrcXsY9
 NiGwNvQTY45k+fQEnccUZ3o6klskGYeWe89tUhga8DXEsvKGjOLny9z0fLnXiABv50Qe
 a6OndR21LweIt0hxP3rSfKc+8h/8mrv6JEMm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LV2sNThwuYoQaoZh1ko9r4mFVB8GTIqFM4DuqiJ9lj0=;
 b=r1N+W1DqdKc79eNp9rQ8O12X4GlJNle6HQ/6LyCgJ8cWywdOy0fLbzIeoAJ401LMBK
 Gk4VfjV8mu8lLLvel9hngx5dtlDx8QTLoINpIF2IBZKEyLm2//pW5Ac3dRAMIlfNYD96
 /z4BCvOqsp8lCP1e8uGuJ/16RAqhw03zTD92U51zqVMhqRCFbEPAzoXzLIhP2rnTrfwH
 du+slRgFbv6mJLuMFHYtyfdtT0ADdssooOUv++skX7yMDMXLn0h2jHyZI+veK3f5kaWX
 T5rN2as3Zfn5y3ZntkiY5vefr8auAjNCSIxpxDauceQsAcT0e11p2n45lIhkSAnRofgg
 PsNw==
X-Gm-Message-State: AOAM533M5cJNPVH3c7YbisEmnINXFbiOeNO0qhmm5eMD8j7Qz+Rm8w6S
 ynmfgcJ/CCT8Xpl1xbVw/M3MMQqi2glWmg==
X-Google-Smtp-Source: ABdhPJxCi4j778KuhjE2/mBgbA0LTXQd7ujV5gsCoQHIt11nDv0wW7iag8WjgT79eK5roQ3I4aMLqQ==
X-Received: by 2002:a62:cd83:0:b0:4fa:7410:6d86 with SMTP id
 o125-20020a62cd83000000b004fa74106d86mr40405669pfg.52.1648741528412; 
 Thu, 31 Mar 2022 08:45:28 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm10205684pjx.42.2022.03.31.08.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:45:27 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 3/5] drm: bridge: mtk_dsi: Switch to devm_drm_of_get_bridge
Date: Thu, 31 Mar 2022 21:15:01 +0530
Message-Id: <20220331154503.66054-3-jagan@amarulasolutions.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4, v3:
- none 
Changes for v2:
- split the patch

 drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e91b3fff4342..1487cc308c5d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1016,7 +1016,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1033,17 +1032,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
-	if (ret)
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->next_bridge)) {
+		ret = PTR_ERR(dsi->next_bridge);
 		goto err_unregister_host;
-
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			ret = PTR_ERR(dsi->next_bridge);
-			goto err_unregister_host;
-		}
 	}
 
 	dsi->driver_data = of_device_get_match_data(dev);
-- 
2.25.1

