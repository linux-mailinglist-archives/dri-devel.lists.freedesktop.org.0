Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25738394993
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B736F445;
	Sat, 29 May 2021 00:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969CD6EADD
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:19 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a4so593133ljq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
 b=B9TL8QOrWRKN4vhlP3UF93T7lvOoIYr2HC78VowLwyYF6HnFloX6TQmzqE7uP7EDyA
 2IyYlbW7/rmmK2EmftH7ZDjAG97B7JFeflumG/GnO+hoUP6O82j8iezhfK8tfsRK8Hyc
 ZwN5CoHERT7YpHy/c4SQHQq1eK3xuD2NUhNT9xHRwsv1RX0x+LPwl/M7eNJuLMyxODm/
 vq8rjeakbRWvR5PzryZ5ghFK9fSYGU7jq6/9zvVihF992ysDu/WkbTWt3PUs5YgD0YXh
 ywwK/0U7bVzSlK77lNaafXjJeFeq/zCzztTef8LCoC2P3xMjQa81863CmpcutNulz5Xj
 z8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCV6uTNosDGcY6f4l30OjMSBFLKwXUprBp7g5LzOdmE=;
 b=kMcOiJ55zXkyK/LKwjyRxmqjNyVHxR6TyR4nJJiR1GWBCkaVUotPVwcHJOszgdSlz5
 ujdTqlFXNbRd5u3YSAvXX64KNveFM+Sgf0RDX3C1Cn0+kyirZ8GyFIgasAM6mAE+Gjm5
 R2NG5jCuK9I57cdNHOeOIvJCjuBxRV1vKO1Qgg7tKhzqTlWDT9M5daH6GtIFQdm5Od6h
 wlKqOUH5jS3Jp6P1KkJt8qWQnLr0GTdV+Vk9Ni0j0HPGhWqmTQ+ZXHPlPlHG5uoMQTcp
 epB5ZQeZPiyytfr325hzPYO0jMuNGmu+iSh1pyf1hy6Gc96AGLWI21Z3y3ROYiCUmvkK
 soiw==
X-Gm-Message-State: AOAM531Pye4HzBhABb0laKHKvJX/or/m0oWFtg70OkBps7/ndVa6gBkk
 lk1uGgCNIN3SdY2MHmqzQojzyQ==
X-Google-Smtp-Source: ABdhPJzDTH3FZAisO38D59+IuUW+xayOopQ58D00IZ0P8NWTksBZ85QlhOsaJ318PhXgbqXop14n8w==
X-Received: by 2002:a2e:5419:: with SMTP id i25mr790907ljb.365.1622247918109; 
 Fri, 28 May 2021 17:25:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 3/8] drm/msm/dsi: drop msm_dsi_phy_pll_save_state from 7nm and
 10nm drivers
Date: Sat, 29 May 2021 03:25:03 +0300
Message-Id: <20210529002508.3839467-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
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

Stop calling msm_dsi_phy_pll_save_state() from dsi_pll_7nm_init() and
dsi_pll_10nm_init(), as this is handled now by the generic code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 34bc93548fcf..229e98a496f7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -706,9 +706,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_10nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e76ce40a12ab..752a78c9dfcc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -734,9 +734,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	phy->vco_hw = &pll_7nm->clk_hw;
 
-	/* TODO: Remove this when we have proper display handover support */
-	msm_dsi_phy_pll_save_state(phy);
-
 	return 0;
 }
 
-- 
2.30.2

