Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11276330403
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 19:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C646E7D7;
	Sun,  7 Mar 2021 18:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347516E7D3
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:51:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so2430704wmi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Mar 2021 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lZkNk3yYW/8ijhrD082tSx7qBCi8O3cbnVc/FrlwdlU=;
 b=dUczLlRtPi6GFZOr508UaxiYaO0yZ4r9MUeEXfzW3hreTYSlxeo1+b7ngfUiVx42v6
 GFKFds08mpubQmKkfNrIFhnwnMU+/xogJRhp1B19uV1P6LOqUAAOfWkvoGv8Wz/q+OLP
 JwMxtmbLyohe859codg0DWPyCOr/gRSNB64qgc+aTVO05qc9rou/DQ/b6ARY5KUWrcnr
 WGCnm4ytZmzKra0Al/uAh6vPzKqYdEBU8Zj8WuYLmRxkqax60a9mk1Hs4synIWVlGwoI
 9QJZtwtk9OEssbJgPS9X4vg3dqHFn0xOtyqFa3UnVvaupKU0XBBjEswFDIzNLq2k1Kf7
 Wtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lZkNk3yYW/8ijhrD082tSx7qBCi8O3cbnVc/FrlwdlU=;
 b=gxFSoA1Ho88XKCkBN5MaCYPERiCbp7ScTryGyjfkImjrM9UiUPNsdZKw2d4Zic4WX/
 sdW2z+vgw9tvCAsxjuelOrrd++NkOQPfmhqc3qkQYW5zem61xCh56fbJcfXMbNDyZb7y
 RoWE4tqQfA8OgZBGOO/d1uvToBa+NunNL8ijsDr7O9X3SOX9xeO+bJCiJx6hSkdSww7a
 6e8Z1v2QTeR5hsZUH0ekp57CFTpta3qMo4VaKLTiMFnQB6/H6EU2Vj/ruz638E6J6DL5
 5iPt+yqkCDCVx0oPOLNf+7RhOV0Qf0qYU1jn0WrZEg1fzdSOejI021v+y6mg2sj1YPyl
 Buew==
X-Gm-Message-State: AOAM533SQj8AdQ7/KMKlJEH0WUCjZKRBaSll4c0prs2QnHwfSLYLJzjZ
 aV9p/rdDJ6BTFIXV/zyC1Nb++Q==
X-Google-Smtp-Source: ABdhPJw7zRqDTtln8kCNCqMqvZNX1pG3+4zNqJfXoAASdGT4ByKjiUbvEBcid+QAZi1YYWqtYSP3OA==
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr19090730wmm.131.1615143105859; 
 Sun, 07 Mar 2021 10:51:45 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id v5sm14842965wmh.2.2021.03.07.10.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 10:51:45 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v4 4/4] devfreq/drivers/lima: Use devfreq cooling device
 registration
Date: Sun,  7 Mar 2021 19:51:37 +0100
Message-Id: <20210307185137.24925-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210307185137.24925-1-daniel.lezcano@linaro.org>
References: <20210307185137.24925-1-daniel.lezcano@linaro.org>
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
Cc: "moderated list:DRM DRIVERS FOR LIMA" <lima@lists.freedesktop.org>,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS FOR LIMA" <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com, Qiang Yu <yuq825@gmail.com>, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devfreq core code is able to register the devfreq device as a
cooling device if the 'is_cooling_device' flag is set in the profile.

Use this flag and remove the cooling device registering code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 14 +-------------
 drivers/gpu/drm/lima/lima_devfreq.h |  2 --
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..86aea1bdc4f4 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -7,7 +7,6 @@
  */
 #include <linux/clk.h>
 #include <linux/devfreq.h>
-#include <linux/devfreq_cooling.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
@@ -84,17 +83,13 @@ static struct devfreq_dev_profile lima_devfreq_profile = {
 	.polling_ms = 50, /* ~3 frames */
 	.target = lima_devfreq_target,
 	.get_dev_status = lima_devfreq_get_dev_status,
+	.is_cooling_device = true,
 };
 
 void lima_devfreq_fini(struct lima_device *ldev)
 {
 	struct lima_devfreq *devfreq = &ldev->devfreq;
 
-	if (devfreq->cooling) {
-		devfreq_cooling_unregister(devfreq->cooling);
-		devfreq->cooling = NULL;
-	}
-
 	if (devfreq->devfreq) {
 		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
 		devfreq->devfreq = NULL;
@@ -110,7 +105,6 @@ void lima_devfreq_fini(struct lima_device *ldev)
 
 int lima_devfreq_init(struct lima_device *ldev)
 {
-	struct thermal_cooling_device *cooling;
 	struct device *dev = ldev->dev;
 	struct opp_table *opp_table;
 	struct devfreq *devfreq;
@@ -173,12 +167,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	ldevfreq->devfreq = devfreq;
 
-	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
-	if (IS_ERR(cooling))
-		dev_info(dev, "Failed to register cooling device\n");
-	else
-		ldevfreq->cooling = cooling;
-
 	return 0;
 
 err_fini:
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 2d9b3008ce77..c43a2069e5d3 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -9,7 +9,6 @@
 
 struct devfreq;
 struct opp_table;
-struct thermal_cooling_device;
 
 struct lima_device;
 
@@ -17,7 +16,6 @@ struct lima_devfreq {
 	struct devfreq *devfreq;
 	struct opp_table *clkname_opp_table;
 	struct opp_table *regulators_opp_table;
-	struct thermal_cooling_device *cooling;
 
 	ktime_t busy_time;
 	ktime_t idle_time;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
