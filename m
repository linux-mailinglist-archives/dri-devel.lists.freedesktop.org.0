Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0832FFF0
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 10:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550D86E591;
	Sun,  7 Mar 2021 09:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A516E591
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 09:45:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h98so8075457wrh.11
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Mar 2021 01:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=IMCG9brrQt9OXxOqUu9VRJQSaHO249Bi5pskoqucaUgqlSLXajvgNyj8fB5buczLrp
 NVzKgCJwG8EjWaUo5rmBNG9GjT98RRRikYuauNSDXyxBFgM3QAxKN1/BAmCP1yQcKV5y
 HJQbIvC+0sdx6bnuGncA1cURxt62iFmsLIXkdh4WgWW/1u/HpYi8XiZ0Rvjw8fQJMOSi
 OUVmQjNb6FqCNZTMJguKbtukfUWtL7y5ebBdfxq1gZ76G+4qJhEiWGAezl5cY1Us0jPb
 yw/KbYm6ulF7YkGN3s6IFni73fZttTj1qdwcAA0x3zqgCf+2wpvcV6M5ToWnvpEjBFn4
 sUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=tdgaWB0YjGyfbtFSgHv0Z4cluvMD/h4vQ9tGIPKmjPXvNmybxYMtva+/QHfTMTJKV0
 N2aIX6mxKC6elCi87TH5Kj+Dqc36mB6loZmmy5JEj53b0Kry2kHsvjofd4FoTjAQy9M1
 1ZFYqIzXcrK6PQA/0LPFD9poN03ktFSDXYoqSbzErvA7FPtHr4SLr0OuiMbBVUuGhJU1
 OSib4ICwPKtfizbSkPVtZ8gma7rjVQIOTs0tHFwsz9nftwvIdBffneDcq/ZT65jyc+D1
 k2I3S3jHexcZDcwct0pDoc9cCsUBgIIUhFgIoAaeU0ltn/VlnrnnzuvqiIHxfxgcWZJb
 /tdQ==
X-Gm-Message-State: AOAM531R8BBglhJt/bKTkHRAfVEa9XEzKt2q0dY1avr4CDh3qtaZEEj6
 z7kqgiWmELDqRv7Nqo7CrMMVYg==
X-Google-Smtp-Source: ABdhPJyOGcafMeDaZLkMwnxAp2OBU2WWlF+NGAqbnYf+vb2lNG153g6/PTKMSqI0795e+xjNGw42eQ==
X-Received: by 2002:a5d:5492:: with SMTP id h18mr6433869wrv.340.1615110338036; 
 Sun, 07 Mar 2021 01:45:38 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id z7sm12790737wrt.70.2021.03.07.01.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 01:45:37 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v3 3/4] devfreq/drivers/panfrost: Use devfreq cooling device
 registration
Date: Sun,  7 Mar 2021 10:45:17 +0100
Message-Id: <20210307094519.9032-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210307094519.9032-1-daniel.lezcano@linaro.org>
References: <20210307094519.9032-1-daniel.lezcano@linaro.org>
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
