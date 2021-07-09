Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA83C2ABB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 23:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E636EA9D;
	Fri,  9 Jul 2021 21:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F054E6EA9C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:39 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id r20so10092132ljd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
 b=zo8nKP9LqCEewAlV/Hpu705xkphyemres9xFnaNIhUAeh5mFF+U0np4R+XJnnoxHCQ
 nfLpLUlEwcCDnPG4JheD5q7zX5smYjcU/iCf/209AbhbXsrNlVqfHEqvR/vajcEp6oKD
 WYJXijKB69beBXlThUmduFE8T/qf7LjLlS85ShhqYwJZn0cGjroWaxrrTkUlHrdkCSlN
 F0hzw7/KZgkyr0DOwglSb2K5Kdnm7jTsAVipJZJZjfLHFM6291qnng+V5NCAtZJAKdZl
 j5u/CNTmsoTEkg1kZuODwOAifNj/RP2nEMglu41qEwgxP0qy7Q3u0SWpflP+87EVQVIY
 aGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XL+YXT/rgnuTxArH7cCESmmrm7QQBuc6KIaqBz76zOw=;
 b=LZK+NTO53hF58lr6pyxaxMEUXIZ2NeN961mgHlN2JglzCU9RkVPr/MXlWsI+pSj3ZG
 Y89w4z3dQi6QN/fixFws0QyktbtNy5RZCGEg6qRR7IncEMlz0cBOtSGeibwhU/gmwtjK
 V5dR6jhwzC/MghfuPPqz4DKD46hTXBnwtaZFwExbcfpo70iRbsFM5MeUZixdFmOy4kdQ
 SGKhRaIcxCppyc/7ogVMnTW28q1xarK28/rqFlOEuyx6n3pEYGuLO1WkmSvEG1x2TAiX
 YOEuLqNugT/VLaCrgCWacewlGT0rjFpuuSdE9PSVemBoWExBgSiVlOWxstZlFlIRutjp
 ot8A==
X-Gm-Message-State: AOAM530gRs31lJ4nfXGSXpqnXqqPBtLUXZo5jF9AT5DtkFJ2x8TDyzqh
 U6fhjU5NJGdMYUfmQOf+DzuHEg==
X-Google-Smtp-Source: ABdhPJy+sbW7gwPQC1YnwBSkUQOG4O/Nqf3Ey1YaJh8/bnri/JcwqssCv9mfIPGZX+HJ8dcjCP1OsQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr32140951ljk.58.1625864858423; 
 Fri, 09 Jul 2021 14:07:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/8] drm/msm/dsi: phy: use of_device_get_match_data
Date: Sat, 10 Jul 2021 00:07:28 +0300
Message-Id: <20210709210729.953114-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use of_device_get_match-data() instead of of_match_node().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 952fd0b95865..c76a6438ffb9 100644
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

