Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F46381D8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 01:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC2610E063;
	Fri, 25 Nov 2022 00:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42C910E104
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 00:02:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a7so3453980ljq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kgbhuavqT9sjFGfJG8BukwmDaC1jAhXZDZa+W9QfoOs=;
 b=AttiVNDUP6q1hbgT3P7MqNSQtLZrHqsVnDdbXCUpoH/DRw81lKJ9U9TjW4yGE9iUhG
 91wZbIoMaKmXxQ1Ql9laxvr6gaMT8+86Zooaje0tdZ4QTgEHVNCet6CTPd8VlhIOfufQ
 vatIj4lhmP7EfhkJnNVrzul4WxkWFZbYOtLuSEklG29QMTvFEW3zhjPXr6ij7GEqlclx
 EFnoXc6WgZgv4NAyc0qKOxeLKrGsUxmEK7xJ9cMxVo5jVyGqtVuOXgSCfjBapJc8p+JL
 OavrXMfI0gjhgGBJsRiij7X9VywYLZNGueOJeLy22DV5GCHqv1dtiqBgHKAZBKu4ixsP
 tMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kgbhuavqT9sjFGfJG8BukwmDaC1jAhXZDZa+W9QfoOs=;
 b=oY33HWnCpHvM5SA0vuHQ57+1n8Q5z5dkz9+mAaobikHaUoMlmZz6kDWSTNfSVnWmMo
 gVWaVueCjdJL8MPfZF5dkaFcBxFcGPg72I8xAXDnmvIidzTgIEDRB6R18xf7hO8WSvQ1
 KPmFkyEc7YFf15XuVeeFN6kFKD2q9UMOaW/l2jhuMQjY9lm2MZ82MC0Kh75qfam9nUG8
 fCg8hHoJtAqopO3m+HsH4jxU/lOktBGAHUAuQz76PYWNoad4WPCsu2EkuU1Ws43vU9qX
 eA3M36ORHMMrA3uC3mCYkZXo8/U9eOA7Mh6q8/rmT+FBuTDbxgbbSIlFWoSz4ZK9Jeul
 jtGQ==
X-Gm-Message-State: ANoB5pkaTvl9feVCngmZulbS2LCaWuUeyf/89a5NkpYRH+gq+PT98cO7
 wtmCGPzN7K62LK3RC2C4C11RCA==
X-Google-Smtp-Source: AA0mqf6OFOdHi5pJvaT0uHSnNXd+1KRmGHNzFVp7W64gh0yMz+Di3gBC2VTSNSsqns9Xj8BY9iMqHg==
X-Received: by 2002:a2e:9615:0:b0:278:e939:4eca with SMTP id
 v21-20020a2e9615000000b00278e9394ecamr10519315ljh.95.1669334535428; 
 Thu, 24 Nov 2022 16:02:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpy175yyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a301:5de4::1])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac247f7000000b004aa95889063sm293806lfp.43.2022.11.24.16.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 16:02:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/mdp5: fix reading hw revision on db410c platform
Date: Fri, 25 Nov 2022 02:02:13 +0200
Message-Id: <20221125000213.252115-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the commit commit c6122688f265 ("drm/msm/mdp5: stop overriding
drvdata") reading the MDP5 hw revision on db410c will crash the board
as the MDSS_GDSC is not enabled. Revert a part of the offending commit
(moving rpm enablement) and set priv->kms earlier. This make it possible
to use pm_runtime_get_sync() during read_mdp_hw_revision(), which will
power up both the MDP5 and MDSS devices.

Fixes: c6122688f265 ("drm/msm/mdp5: stop overriding drvdata")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b46f983f2b46..29ae5c9613f3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -519,10 +519,9 @@ static void read_mdp_hw_revision(struct mdp5_kms *mdp5_kms,
 	struct device *dev = &mdp5_kms->pdev->dev;
 	u32 version;
 
-	/* Manually enable the MDP5, as pm runtime isn't usable yet. */
-	mdp5_enable(mdp5_kms);
+	pm_runtime_get_sync(dev);
 	version = mdp5_read(mdp5_kms, REG_MDP5_HW_VERSION);
-	mdp5_disable(mdp5_kms);
+	pm_runtime_put_sync(dev);
 
 	*major = FIELD(version, MDP5_HW_VERSION_MAJOR);
 	*minor = FIELD(version, MDP5_HW_VERSION_MINOR);
@@ -839,6 +838,12 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	 */
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
+	/* set uninit-ed kms */
+	priv->kms = &mdp5_kms->base.base;
+
+	pm_runtime_enable(&pdev->dev);
+	mdp5_kms->rpm_enabled = true;
+
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
 	mdp5_kms->cfg = mdp5_cfg_init(mdp5_kms, major, minor);
@@ -887,12 +892,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	if (ret)
 		goto fail;
 
-	/* set uninit-ed kms */
-	priv->kms = &mdp5_kms->base.base;
-
-	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
-
 	return 0;
 fail:
 	if (mdp5_kms)
-- 
2.35.1

