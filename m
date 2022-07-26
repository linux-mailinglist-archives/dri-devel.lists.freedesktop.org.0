Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9F581899
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78695F66;
	Tue, 26 Jul 2022 17:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F4795F56
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:51 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso1325660pjd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJDgGsVp/9ym8bVCX4DEK3+iI9mT2ogd+Xryi1JgPAI=;
 b=Kh87AJklhSGHbjnLYi6JWYNUx2pSx4cl7szgvn8ecj57yYy/kDlcZRplDlDfTYEQeD
 VeOBmELL2x+VZtbXQl1HJsHWW97OevB9j0uYetTvCvznTRNUGnVpz+YsDZxMKMRKUS7b
 Ol1oRoWylsF/kXc/l31Y5qUVh9tgo5947EuPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJDgGsVp/9ym8bVCX4DEK3+iI9mT2ogd+Xryi1JgPAI=;
 b=5jT43dGCKzTAN6YvbiHIsNPsjDOat0YHxMT+t83pFnNap30xIELzL9298bD/FlBrWH
 MUcyc0k3rC/en8hgwdTi5eZQ0VBUkjuFwWiiC2Ovf2pO7ZIlamhN74laGl54AzpKnbqm
 gKvDuRPt1lrdr/eOOo3HPOV7XVMPNoVxZaHb1cz1DvxBOLp9XquVnzEqB00YFSrAcX83
 401C9EwjHqO3F81jUfB9gCvkGLJc3cTv1qWjcUxHgId0mns5XkdcVqSDPfR5W+ExHdOh
 Ao+nSdClwtRoTvYl89GFz22+pWN+OzHDrTregzgXUAncAx7n7WOj7aUm1NP98X6pXPWD
 bIjw==
X-Gm-Message-State: AJIora/d4DefnR/VmloJaAR+/GilFv1E6Yecj6mLNLxJsLyYzDmhvRo2
 oDy8IrPzFdsMxClSN6EzPLL/RQ==
X-Google-Smtp-Source: AGRyM1tK5CVcyHdW+12ue/Q8sK3OVVAYgnuYyRdNJt8CWfhB2C2YLXNxFl4ZmN8vVRUHRpLhGnvE/w==
X-Received: by 2002:a17:902:d581:b0:16b:e6b8:4080 with SMTP id
 k1-20020a170902d58100b0016be6b84080mr17779542plh.146.1658857130908; 
 Tue, 26 Jul 2022 10:38:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 5/7] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
Date: Tue, 26 Jul 2022 10:38:22 -0700
Message-Id: <20220726103631.v2.5.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of the patch ("regulator: core: Allow specifying an initial load w/
the bulk API") we can now specify the initial load in the bulk data
rather than having to manually call regulator_set_load() on each
regulator. Let's use it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Use the new regulator bulk feature to specify the load") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 04265ad2fbef..dec7a94cf819 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -279,8 +279,10 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
 	int i, ret;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		s[i].supply = regs[i].name;
+		s[i].init_load_uA = regs[i].enable_load;
+	}
 
 	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
 	if (ret < 0) {
@@ -289,15 +291,6 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 		return ret;
 	}
 
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-						 regs[i].enable_load);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 330c0c4e7f9d..f42ff57861da 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -515,8 +515,10 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 	int num = phy->cfg->reg_cfg.num;
 	int i, ret;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		s[i].supply = regs[i].name;
+		s[i].init_load_uA = regs[i].enable_load;
+	}
 
 	ret = devm_regulator_bulk_get(dev, num, s);
 	if (ret < 0) {
@@ -529,15 +531,6 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
 		return ret;
 	}
 
-	for (i = 0; i < num; i++) {
-		if (regs[i].enable_load >= 0) {
-			ret = regulator_set_load(s[i].consumer,
-							regs[i].enable_load);
-			if (ret < 0)
-				return ret;
-		}
-	}
-
 	return 0;
 }
 
-- 
2.37.1.359.gd136c6c3e2-goog

