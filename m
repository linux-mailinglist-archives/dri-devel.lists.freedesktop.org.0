Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02862534E4E
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4510B89FAD;
	Thu, 26 May 2022 11:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BD389FAD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:44:13 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id a17so1233033plb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsZm01W7lVAYoixKo6Nk800vk4WIHy3MlJNuyYghC/E=;
 b=Wu/JMipJ6JOhMstgYzE3dXXw6nfzo+Z40qL43mmLs92tnCkqEchuC0GkobCAide8pC
 9dAMVYodIG1r8gvpVHuxSNdfQpIoHGrVGx/GFK/zzgLOiU8yag8npVq/xiFZQdlQy5lv
 3UT1eW4xeo6Igg8MmXPt8iJQw/p6UIFhczgqv67ux8KvehwfVHIQyiCvfBxxDP9IJiie
 GosfMVhgFvoDmzkA7yln56NRSwmneRV6Ur4rGXDVVnE2RZCPFS57Ls2pgOpgItOmuSvh
 XFrxNBsETuUFY8EFBPK1TdYiZRtorTjeHslF1AqfpYTuCWS3mmz7/hEbQ3f+cD8+o+A6
 2P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsZm01W7lVAYoixKo6Nk800vk4WIHy3MlJNuyYghC/E=;
 b=7ZZ0wsvPlplpBHvV9Nr1d13TNyRzx0q0o+Hakis8H64paaBtou1LV4sD75Oh/8gntA
 RNEdCCtxRfh4m0SA+AzQLkdakFuA1jiYQY9TT0929VBcRppV6ZhtBbYNFNtZPM0qTv2O
 Ykdjbbb95cCpHBNgg2XySa4K5A8WbPE8KkOSxsP2+CJ0tx2pvbs7M67U6HDVHSuP5Lwm
 lJho9JdA1H14QK0ccO4F3MRWHejnQ+/KH9VB4gUPq51ZZTkfN5TbIKZ8er9wAJTfvbDA
 063utL685Mz1OJZY9fNZdyFTcay4xlx2fgeYr1TbqItwntRdd0RlVDXVCfOBnzVLXb6O
 d6WQ==
X-Gm-Message-State: AOAM530szH1wgnUE8YZIlG5WzWVNyrTM26SsYsKRI+rX9014FAo2au/z
 8YD8skULhugpdjkm3h/oqzaWjw==
X-Google-Smtp-Source: ABdhPJyfcjHj9Ly12wH9ItwVX3s2KDOb31DEq1TzBbFi6yJUwSS4pqWWAqG68J0QgVbGcfhWH2g6lQ==
X-Received: by 2002:a17:902:f70a:b0:153:88c7:774 with SMTP id
 h10-20020a170902f70a00b0015388c70774mr37348147plo.166.1653565452780; 
 Thu, 26 May 2022 04:44:12 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902eb8c00b0015e8d4eb1d7sm1270604plg.33.2022.05.26.04.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 04:44:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH 15/31] drm/panfrost: Migrate to dev_pm_opp_set_config()
Date: Thu, 26 May 2022 17:12:14 +0530
Message-Id: <2a0970a5cf1fc92e16eb2b782798a6b609594cdc.1653564321.git.viresh.kumar@linaro.org>
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
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 194af7f607a6..7826d9366d35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -91,6 +91,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
+	struct dev_pm_opp_config config = {
+		.regulator_names = pfdev->comp->supply_names,
+		.regulator_count = pfdev->comp->num_supplies,
+	};
 
 	if (pfdev->comp->num_supplies > 1) {
 		/*
@@ -101,13 +105,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return 0;
 	}
 
-	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
-					 pfdev->comp->num_supplies);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
 			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+				DRM_DEV_ERROR(dev, "Couldn't set OPP config\n");
 			return ret;
 		}
 	}
-- 
2.31.1.272.g89b43f80a514

