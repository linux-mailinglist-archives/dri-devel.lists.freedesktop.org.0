Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87206534E49
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9903410E035;
	Thu, 26 May 2022 11:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE5D10E078
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:44:05 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id h186so1136230pgc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XNML7XiFhEmWhS7Wmn0QQk81yeWXZBxdfXtoqtiuEE=;
 b=F0RZwf+QVtfdPntABkUWCqnKWd9ZvaRtPa4RLbnjoS3Mv9huYArM/2p97ntmluKcx5
 sbuzSjy+OWEN6dzN7C6RYQgoNFlHohr4VKNTUfutPa7zwq1JV6AtX9/fNvPMAlVNPSPb
 KXM9WqnEd/bX9iVNhvKaU4SeqlFiBrGMgDvhqFvZDYJz3W6jnOESDByw3Ffm0L/ubDbR
 Bsb4ZMDq0fueO+vqGE5Nen8Ix6yV//gu8uLXJcIAIAtx1hxrVAeCjxHqFjCo+/yp4cL8
 YAFRMkagm/VLnmb1a+Jz/JKzq00ysjOHsH0DS9QGm64iB/sk/GCEc4J+kb224nRIYVL/
 uK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XNML7XiFhEmWhS7Wmn0QQk81yeWXZBxdfXtoqtiuEE=;
 b=2oMnDbiq/LiNBcGyNnUb0thiAwKrWFQmLWBFwp40r9lVGL4VgKSUyQwX8/JgpdVx19
 laK3hpXS0QggCkNzxPcP7VplOA/yYPNY1a8ei6XzRg2BbIqqmPKz+XAN2ddPEjKeSBbg
 uiWWstU+xP45KLiPE7ELvDSrV3fxu9CoW/l7NBSDKYt6hthJu3cS0n8dyqsoaY+0Bn9r
 8p3siL100VRonL4pB+QqH2fJrz/nRBrVp/LEmgwakEUaK2VrfiJJYk2aq4ipaNBzVNBL
 mAxXAcnQzjKeAemNkia6UhobUaig38NvBHSZwoD1XWgEnxQmcopzMvbi2N6e8G44hn8W
 oQdA==
X-Gm-Message-State: AOAM531wTY50b72Hp90SIopIde6KXOd7im3EreY1QonmuHey1pxYy/Ud
 r+81PL0Qf8FSgizfIGO8TgjNVw==
X-Google-Smtp-Source: ABdhPJz4oCK0FlHgCt3OpAXEyjzMx8MM0BIoifZPvN2PfUIfJKR2EWbMtcAxZKXzchUrRLOzNjahKA==
X-Received: by 2002:a05:6a00:1487:b0:518:b952:889b with SMTP id
 v7-20020a056a00148700b00518b952889bmr16382659pfu.43.1653565445537; 
 Thu, 26 May 2022 04:44:05 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 o13-20020a170903210d00b0015e8d4eb213sm1283995ple.93.2022.05.26.04.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 04:44:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qiang Yu <yuq825@gmail.com>
Subject: [PATCH 13/31] drm/lima: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:12 +0530
Message-Id: <22268a714109e8f18ee0612d2e0f746a357af9c3.1653564321.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1653564321.git.viresh.kumar@linaro.org>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 8989e215dfc9..e792ab5cd76a 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -111,6 +111,11 @@ int lima_devfreq_init(struct lima_device *ldev)
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.regulator_names = (const char *[]){ "mali" },
+		.regulator_count = 1,
+		.clk_name = "core",
+	};
 
 	if (!device_property_present(dev, "operating-points-v2"))
 		/* Optional, continue without devfreq */
@@ -118,11 +123,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_regulators(dev, (const char *[]){ "mali" }, 1);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-- 
2.31.1.272.g89b43f80a514

