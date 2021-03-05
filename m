Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932BA32F092
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 18:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747326EB95;
	Fri,  5 Mar 2021 17:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F26EB95
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 17:03:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d11so2852573wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=swIYYukmXBPaja9sOQciBRpjvLCS+zDwCEO0LYBBETH1USSmuqSzF0c5EQfiCG2Wo2
 GLUPdq8UftrXP9o9q2Eu3qYe6zVzpqQIbQPM3uClUG5+DcyhsuBHBe+fsv5Qrs5K5EfX
 oNfWy6b3fFjbQ6xAo4gIYcM9qYdOUwz3NJk84Bk3TbBXf8p7dSkL0pBOSDclsPQzWJ1z
 XM6+6xA4ghBTSuC6vRQ3m60/51XI68pU/kbjgztoQqNuUg7aWcj0EDDJFfl/Dp6W7Rvo
 2iireZy5lAjM/nLHQ13lB3v80mBbVi2Ka4GHqjgQl87pIk4q0ChWX7Q/P3tHGPNuzOfP
 2l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=jGFH/PsSspCnsQEYQKp5o85ME6QoiWRm51jF3FBXCj+R61I3s/KiniWjOuz+KQQguU
 nb9fwRp0tFEBYJkIg9X/GhTrIHWnN5e1s6pf1Yn7CmoMo2r2WQt08gfYOW6E26n9kAw0
 1psgKNZ/hw9Kyn6IF3U8vMfHN2o06fD350qcgHB5KdcxRrWSSLkmBIfavP8CoZPkM8n7
 v6VhoM7EwMkeY8L420aA7/byLKSp6fmSg6Ic6VpHijL5uTA6/YNPREVgpZ1ArtnWy95Z
 Ex9RdKQm/BX4Ok+Ju8/tasuKMl8NDx3lYzno9M8KL1BK5qmr8aDQYMADwpgg28MxvdB3
 WKHg==
X-Gm-Message-State: AOAM532bfWkQevghyB992MXWwvrEXCz/WLM0+pJA3f6hyjTQu5ijFLP3
 ypJAWP4L0hwoSaMUW79fkbR0i9jS9F61Dw==
X-Google-Smtp-Source: ABdhPJy7Len8gQJ8kSf2MO/PaGZMBla5J7H3YzDlCMYsreVJGMZXypBM7ZvREdzhXmXw5/qQmz+p0A==
X-Received: by 2002:a5d:6b0a:: with SMTP id v10mr10296497wrw.183.1614963835502; 
 Fri, 05 Mar 2021 09:03:55 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id p17sm4760934wmq.47.2021.03.05.09.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:03:55 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v2 4/4] devfreq/drivers/panfrost: Use devfreq cooling device
 registration
Date: Fri,  5 Mar 2021 18:03:37 +0100
Message-Id: <20210305170338.13647-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305170338.13647-1-daniel.lezcano@linaro.org>
References: <20210305170338.13647-1-daniel.lezcano@linaro.org>
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
