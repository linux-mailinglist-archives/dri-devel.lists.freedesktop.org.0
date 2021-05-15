Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD638190B
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 15:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8936E3D0;
	Sat, 15 May 2021 13:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEF56E303
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 13:12:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h10so2248713lfm.7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
 b=cF2KeGsyYzGUA7pon9uebG1hW4coCHuUINWddBAL3uKXnxo9/dcRJ4EUsfq60Ldwyk
 3NkOzv1LPLiBKyaQMtudvpy/E6IkGeYn2mNAUKcA/graDG9g+8kcirZcWBNavci2TfCU
 DGUQ6C5PirDbBGRTiOSx4Rnqxgh/E0Q86Ymk4gamA2za9zTTmQlWUKixopNwQ7tQqqNn
 axtpePZ5ZtljSWbC3xTs+neG1bBnMCJbyEFcD1b/N6xXjq2lSKaCWirYKRKPYzk7i3XE
 KEL3oJp7BDoqwBGqB5AMJQjbvYeq6oPgaGyqVViSt2N23GGwiU+BdkqIZ9KNtzwpMjoU
 P3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nnwUqlWXgsNRotSrmVCnKmYprCSJWQpeL8q8KpmUgc=;
 b=lAzXPXEGn/X2YcT9LfMx2a/ebVJTioiL2wzSApNsfejR7U7hKfLkjSq2mjTwAtD/Rf
 fBJwARoB7c9IIRkR/kkR3s3TFt6NQvZYDRiohSMOQU8VLknel6+xxo99Li9nie/PTnXf
 xzMklttmx0KHkSMOOTqfkXPyRstd0P8W6usG9/5hvev2Nzl2r6yfRjK2w4yIMFSltVsl
 DNy9bjT+AQHEXtmVV/4MlzPbid7SdD5kX0+NYfsGP+qWf2woMfeA2y3hOYJ1r1T8sgKG
 0PDrmJaKdtJ0wAvP3y1Un2BTt5t3NZZvSqAmHrWDHAEzIxVinrkOM5O4LFqRxgpNO78H
 DSoQ==
X-Gm-Message-State: AOAM530L/egRmGBk29asuV/iTJfxcSJoVtDNQVIKM8PZcymzpOjqb23Z
 4P2DzdnqdXgQ87LFZ/0zuFwBqg==
X-Google-Smtp-Source: ABdhPJzPOhQuWXDvoHnt0lj+USoizwoV+M2VpSIDnhnvmPHKD6uzEqdeNoJcuvcQjO9pPfLvbyCN+A==
X-Received: by 2002:ac2:410e:: with SMTP id b14mr5408000lfi.56.1621084344791; 
 Sat, 15 May 2021 06:12:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 6/8] drm/msm/dsi: phy: use of_device_get_match_data
Date: Sat, 15 May 2021 16:12:15 +0300
Message-Id: <20210515131217.1540412-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f2b5e0f63a16..feaeb34b7071 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -625,17 +625,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 {
 	struct msm_dsi_phy *phy;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	int ret;
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
-	match = of_match_node(dsi_phy_dt_match, dev->of_node);
-	if (!match)
-		return -ENODEV;
-
 	phy->provided_clocks = devm_kzalloc(dev,
 			struct_size(phy->provided_clocks, hws, NUM_PROVIDED_CLKS),
 			GFP_KERNEL);
@@ -644,7 +639,10 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 
 	phy->provided_clocks->num = NUM_PROVIDED_CLKS;
 
-	phy->cfg = match->data;
+	phy->cfg = of_device_get_match_data(&pdev->dev);
+	if (!phy->cfg)
+		return -ENODEV;
+
 	phy->pdev = pdev;
 
 	phy->id = dsi_phy_get_id(phy);
-- 
2.30.2

