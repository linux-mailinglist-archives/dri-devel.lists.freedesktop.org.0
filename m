Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF5588472
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8616997FF5;
	Tue,  2 Aug 2022 22:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747811AC7A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:56 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso163866pjr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=m27JGOowCd4CHMBuXr6we9nLLOaaXmb6CU0SMlJjk1E=;
 b=nr4YVt6smhF5lM8TlW5lwPq7KyfS/C26YPxmmu2Zc6EZoZdUzZvl91INVJSUWdzxrJ
 8E92ORrByaq4PXG+1DZ/rK9hKKiA5dibBEeXVcKQUApeyKTltdEp/DQRHmXi2PhNDScy
 zh/7ZisrWQ+I0wLK62Y8uWWFBrR7gqkwXgraU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=m27JGOowCd4CHMBuXr6we9nLLOaaXmb6CU0SMlJjk1E=;
 b=DoflNKG4IS7WRQ10cIRAfulbzgdnq5qZdHq6K7Errmq4VWiAETOqLqvxsRtsk7PLTx
 ZTM9yEXERVgACgQnATggiUKMQbp9Agrtb+HD377j17mPJGzWnLhQc5VpGyblyCP+GU3P
 2oS9SoTtEMowLfk5xDV2thZCMr/UtnjDnHtHtZnmCJKJespPWIk34+f3JtG3ya2ZqHeo
 jFSMjSsl+TQZFDiOohUcdngfS5q0nmQ/2xOdZYQqhD36LJ7bXb9TlrLlGjLweugUtFN2
 urOr5F18+1qRzRuXRCgqjhRCZhOmof8DR6FdI3GgqKMAKBDZDu+GVlpZzqe69K7PAxB7
 tlqw==
X-Gm-Message-State: ACgBeo3zO1v4vc6SCpXbnKsb8lWMkPAEa6dQo+xn3L686NVz8Lmr3a7M
 edNH8lRL5SzOMUwg2/jLIe3CAA==
X-Google-Smtp-Source: AA6agR5D9D9Bbr2PRxppp0iSLjlvHwVkEEUtnwO1UdHI0WhJ+VGHyudMevUSLb4M649mJJwVSTDlTA==
X-Received: by 2002:a17:90b:240e:b0:1e0:775b:f8fc with SMTP id
 nr14-20020a17090b240e00b001e0775bf8fcmr1756001pjb.132.1659479875832; 
 Tue, 02 Aug 2022 15:37:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 4/6] drm/msm/dsi: Use the new regulator bulk feature to
 specify the load
Date: Tue,  2 Aug 2022 15:37:36 -0700
Message-Id: <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
initial load w/ the bulk API") we can now specify the initial load in
the bulk data rather than having to manually call regulator_set_load()
on each regulator. Let's use it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Update commit message to point at the git hash of the regulator change.

Changes in v2:
- ("Use the new regulator bulk feature to specify the load") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9df278d39559..a0a1b6d61d05 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -260,8 +260,10 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
 	int num = msm_host->cfg_hnd->cfg->reg_cfg.num;
 	int i, ret;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		s[i].supply = regs[i].name;
+		s[i].init_load_uA = regs[i].enable_load;
+	}
 
 	ret = devm_regulator_bulk_get(&msm_host->pdev->dev, num, s);
 	if (ret < 0) {
@@ -270,15 +272,6 @@ static int dsi_regulator_init(struct msm_dsi_host *msm_host)
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
index 7c105120d73e..efb6b1726cdb 100644
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
2.37.1.455.g008518b4e5-goog

