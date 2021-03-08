Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C484D330F3F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 14:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C916E3D6;
	Mon,  8 Mar 2021 13:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490406E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 13:33:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n22so6059653wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qhmm7MrKdTwC31wHH2vNUCLubMqn0qUwkRrssLNEi9A=;
 b=AsXKRlBzMj0XqlLBUSGMnj9q7R25iT3ReJ1aBIzxK5qMrDGI4AodKxv7xhQnLIYMSr
 IgtD9xTbcZinvX1DTIKbwQMqaMZ5LlwXz/YnLpe0UYWDRf9GCGWwPw8JqwWGqy5AdFVM
 5uBNLkIvIW9+61z4LDbG3yTjPIiUt2rs1ITGRfBbD6+ubiwdjdAfDhZnaIsvqApCxpmi
 +xbIUcpcqbpNycytOe41v80mt4YW8OLqVu5TqwEVyv4SuFShvHiIcbRDMDrjUt5vWpAR
 BKO//asvN27/7ZE+Br7z8wHIn2MRvJQiiq6ApHDgeEWhD1qAYPy5zKTgwA6GIteoOT86
 MQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qhmm7MrKdTwC31wHH2vNUCLubMqn0qUwkRrssLNEi9A=;
 b=QjUJ/ufC1mdNizYccH2YLcNceJN9uLrhGkElJX5TdQ+p1jF8Np1gh/pw+/DkMg08TI
 pYmuWCsN9U4vbkOzxajTjGLUgvamCH96AEviowlxlJ1hSsw5ZJwGi85WxEvHddx4ukvx
 pKBtB+z70ZaBRENEDg4IqIGzp/ZxJ0dKRN24Q/qG8WTDwzjUolFXX79nsYh0RqjqWo9G
 GmLBPGvqdBESYIAoyZMPSVRuq6qxaKu97STpu36u4D1SqpEBArkJypllAg6lOezGeZyx
 AlvlWlFJN30ld+oE4lM/RHC3orHnbrROAAUiD8NFooMN7sG1Idp/Ivr2IKOJuuzQ0aYT
 s15Q==
X-Gm-Message-State: AOAM530rz5Hxdy2anRRhmRX4BwMsyKn4uf19i9XhTI8lcL6VM8RxZpgy
 cpVTIQLqqxjlqqEAu8X4hOIuTQ==
X-Google-Smtp-Source: ABdhPJzc7k7+hcfsVTeHZPjo+8UHo38FjEwTstABQwgjRNLXsQcHQ0cgL60pxCqJfdWeZLfA7x4xGA==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr22581123wmk.82.1615210387861; 
 Mon, 08 Mar 2021 05:33:07 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id m11sm18942665wrz.40.2021.03.08.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:33:07 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v6 3/4] PM / devfreq: panfrost: Use devfreq cooling device
 registration
Date: Mon,  8 Mar 2021 14:30:39 +0100
Message-Id: <20210308133041.10516-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308133041.10516-1-daniel.lezcano@linaro.org>
References: <20210308133041.10516-1-daniel.lezcano@linaro.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 "open list:ARM MALI PANFROST DRM DRIVER" <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devfreq core code is able to register the devfreq device as a
cooling device if the 'is_cooling_device' flag is set in the profile.

Use this flag and remove the cooling device registering code.

Tested on rock960.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 14 +-------------
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ---
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 56b3f5935703..4d96edf1bc54 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -3,7 +3,6 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
@@ -80,6 +79,7 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
 	.polling_ms = 50, /* ~3 frames */
 	.target = panfrost_devfreq_target,
 	.get_dev_status = panfrost_devfreq_get_dev_status,
+	.is_cooling_device = true,
 };
 
 int panfrost_devfreq_init(struct panfrost_device *pfdev)
@@ -90,7 +90,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct device *dev = &pfdev->pdev->dev;
 	struct devfreq *devfreq;
 	struct opp_table *opp_table;
-	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
 	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
@@ -139,12 +138,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	}
 	pfdevfreq->devfreq = devfreq;
 
-	cooling = devfreq_cooling_em_register(devfreq, NULL);
-	if (IS_ERR(cooling))
-		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
-	else
-		pfdevfreq->cooling = cooling;
-
 	return 0;
 
 err_fini:
@@ -156,11 +149,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 {
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
-	if (pfdevfreq->cooling) {
-		devfreq_cooling_unregister(pfdevfreq->cooling);
-		pfdevfreq->cooling = NULL;
-	}
-
 	if (pfdevfreq->opp_of_table_added) {
 		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
 		pfdevfreq->opp_of_table_added = false;
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index db6ea48e21f9..470f5c974703 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -9,14 +9,11 @@
 
 struct devfreq;
 struct opp_table;
-struct thermal_cooling_device;
-
 struct panfrost_device;
 
 struct panfrost_devfreq {
 	struct devfreq *devfreq;
 	struct opp_table *regulators_opp_table;
-	struct thermal_cooling_device *cooling;
 	bool opp_of_table_added;
 
 	ktime_t busy_time;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
