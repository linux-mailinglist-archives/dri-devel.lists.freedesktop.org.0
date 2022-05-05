Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9251C14A
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4114710E1F9;
	Thu,  5 May 2022 13:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5E510E1F7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:50:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i10so7565188lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48aIM/KpZ2USvZfBjFUkxb9XMnlqoCOw+7fM77NfVAA=;
 b=NMoeNvcLJk+xmbePWh3To9N8YfwCw+vd1k+B9lNsy1gqOT9AMDa45R//CGpom4peg+
 /v1FCPS0nMVyWu22f0C64GjOlFzVNoqdymZCI1IgtvjpD3OHA+mRJTlLe5GqbOQA5ctQ
 MIKGqSOGnNYbss2M26R4BntyKss1T1oKWxvC7cuVOSFofNo95QR4aiXpAtha03xewhy3
 jk5PJyDbp0302H8n24oqony+SD8B1/rtgyh0RH/Ohp3daHD6ixh5raeIJ9ChnylFE8le
 FGIP4OBESn8VgJ43dWCK0TDfFGIVQTxaCR0jmBvFW0wAZGnjBWDctsFWWIqpXVHheo/g
 X/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48aIM/KpZ2USvZfBjFUkxb9XMnlqoCOw+7fM77NfVAA=;
 b=FeUoRu/XjF8Lq0XyAYjCJ3RuOUqd1eO44DzYIo/T/+aZzQ8cyVd7CeAl64EzJlpCgy
 99SpjTHLtsszcmcCdxgL2DV7kXSJNqLYCjveRKHLmSH2Ate/j3Aba3osqKK9DYdc5SHb
 U1goCNhWaub0+Q4jXHXjac1dTosglsZxZoJFp4PviI7NbqUg1tav8GowTORS2jO8FmvD
 hAR7tDffeXy4vEXIKMJmfx0pGJrGP7/wCKVu6bHbrj/qgMDz4pqnBbWY/+GynQg2DFjW
 Ph7Xt17QfJaWrULbxSQUf2UjqtJX9ZkOBulePbqmfSd0+w1KjDOHtHL3uRxpXhLwNdo9
 1YNg==
X-Gm-Message-State: AOAM5338JQvAoAa1CsQRDlhZMx8KtBnMeONrFhlo8S82iay4xaUlNUsO
 GGKtVUKNhkSFU7HT0gQSb+FLsC8MHY68Gw==
X-Google-Smtp-Source: ABdhPJzqtJE/niHNvJTferK/O5UKI9g35GxmefvqtWOB+1+GmgdY0AtN0f9+Srwt/hIbilzloKtYGA==
X-Received: by 2002:a05:6512:128e:b0:473:d371:5a38 with SMTP id
 u14-20020a056512128e00b00473d3715a38mr2576589lfs.502.1651758610065; 
 Thu, 05 May 2022 06:50:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:50:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/mdp4: move iommu_domain_alloc() call close to its
 usage
Date: Thu,  5 May 2022 16:50:07 +0300
Message-Id: <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
References: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
This allows us to drop it from struct mdp4_cfg_platform which
remained from the pre-DT days.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 8 ++++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..1fba6ab06eb1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -388,6 +388,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
+	struct iommu_domain *iommu;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
@@ -495,9 +496,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	if (config->iommu) {
-		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
-			config->iommu);
+	iommu = iommu_domain_alloc(pdev->dev.bus);
+	if (iommu) {
+		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
 
 		aspace  = msm_gem_address_space_create(mmu,
 			"mdp4", 0x1000, 0x100000000 - 0x1000);
@@ -557,7 +558,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	config.max_clk = 266667000;
-	config.iommu = iommu_domain_alloc(&platform_bus_type);
 
 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..7cc549b6a82b 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -44,7 +44,6 @@ struct mdp4_kms {
 
 /* platform config data (ie. from DT, or pdata) */
 struct mdp4_platform_config {
-	struct iommu_domain *iommu;
 	uint32_t max_clk;
 };
 
-- 
2.35.1

