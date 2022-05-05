Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D629651C14B
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9060110E24C;
	Thu,  5 May 2022 13:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39DC10E219
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:50:12 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t25so7583176lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TMEXMjLJmLbEp82QyGh3Ohj7SMwYayrIWMx4meas6A=;
 b=mq46J0H/IjNAIDz8bE6PrQuyTKG1597bUo+Deucv2qyqHWQbgksoq7fvxfIFGSD4VH
 Yvwuj4IBetARd3HxM7F45rEYRocIgBGSKM7ZUa8EuA6u3Bm24A7NtIKh7VEWeRwfdx1T
 OQTAyrtqFKNcG2RwP9jzeANvrP/kWSfE9uvMzG7heqPMz+ppsyDUXaAJQX0KEkS0oo1u
 ruYl8LKRZv7Ri5T+/L+tUV4/ZF5czKHuZObBBTypUTi3vY7w5QSqcPWmXT2u3ST+xXJF
 ws9ekV5CouCMxIrErUSJfoLMVxRhO+3mLMUQBV721oUJPx4QFrLWyrfwLFNr452ElBiY
 kRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TMEXMjLJmLbEp82QyGh3Ohj7SMwYayrIWMx4meas6A=;
 b=sd8X4soGN2RuA9/OGd8LmpXfYx0Tvv/uQLE+KAe/oBGnnTZpaC/6+cQGZ5Y788vMqR
 H6M55LKfmXEv3WeGVHbEEApS31+tiTo0yYSKUl0ncWdF8O4QQ3SDMnr/8TFq54m7JgPf
 MFPW/YQeLBEUgy7+1yyXfvtLpB1CtPX+xkYa3RzutGkwyZSeSOHfMvzqqZkXjw5srOW8
 Us3HSvLgfIS+skd3sQFdcWF55oTGIE+MJBT+JgTakjl6Fk205iJwFvbOOAAyq7bljUhr
 wPRkdYoQMqqsJbiN8+lr++GOpCYVJhjt5QgVWiSHnyA6z3G/zpmiZs70fF6P2Sx/F1Wz
 Wlmg==
X-Gm-Message-State: AOAM530kzr+HUrYAUSW+8Drq40oqRBzUhZ9o46FeNAiMun6R8BnhpWGh
 o46+IXZ2wWDtGA+5m4UGRKw6Rw==
X-Google-Smtp-Source: ABdhPJy4OvbVt3GEoZrJDhM4UmwcIpYhzXR+SeylsTgUHNK2EM6X9YusgMqR1gXPROkM/kerD31MAA==
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr17647734lfa.210.1651758610739; 
 Thu, 05 May 2022 06:50:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:50:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/mdp4: get rid of struct mdp4_platform_config
Date: Thu,  5 May 2022 16:50:08 +0300
Message-Id: <20220505135008.1351533-3-dmitry.baryshkov@linaro.org>
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

Struct mdp4_platform_config is a relict from the DT-conversion time.
Move the max_clk field to the mdp4_kms_init(), the place where it is
used and drop the struct mdp4_platform_config and the mdp4_get_config()
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 21 ++++++---------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  5 -----
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 1fba6ab06eb1..ccde710c63fa 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -13,8 +13,6 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
-static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev);
-
 static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -384,7 +382,6 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct mdp4_platform_config *config = mdp4_get_config(pdev);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
@@ -392,6 +389,10 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
+	unsigned long max_clk;
+
+	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
+	max_clk = 266667000;
 
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms) {
@@ -459,7 +460,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	clk_set_rate(mdp4_kms->clk, config->max_clk);
+	clk_set_rate(mdp4_kms->clk, max_clk);
 
 	read_mdp_hw_revision(mdp4_kms, &major, &minor);
 
@@ -479,7 +480,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 			ret = PTR_ERR(mdp4_kms->lut_clk);
 			goto fail;
 		}
-		clk_set_rate(mdp4_kms->lut_clk, config->max_clk);
+		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
 
 	pm_runtime_enable(dev->dev);
@@ -552,16 +553,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
-{
-	static struct mdp4_platform_config config = {};
-
-	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
-	config.max_clk = 266667000;
-
-	return &config;
-}
-
 static const struct dev_pm_ops mdp4_pm_ops = {
 	.prepare = msm_pm_prepare,
 	.complete = msm_pm_complete,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 7cc549b6a82b..01179e764a29 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -42,11 +42,6 @@ struct mdp4_kms {
 };
 #define to_mdp4_kms(x) container_of(x, struct mdp4_kms, base)
 
-/* platform config data (ie. from DT, or pdata) */
-struct mdp4_platform_config {
-	uint32_t max_clk;
-};
-
 static inline void mdp4_write(struct mdp4_kms *mdp4_kms, u32 reg, u32 data)
 {
 	msm_writel(data, mdp4_kms->mmio + reg);
-- 
2.35.1

