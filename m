Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1F330402
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 19:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4F46E5CF;
	Sun,  7 Mar 2021 18:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD4C6E252
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 18:51:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l11so5699239wrp.7
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Mar 2021 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=pPFLIwCS9uAhBMaquy3ITzoD8Pe5Iah3HEBjZn7mIChQz+rYauMKqtQuAakhMt9o6V
 Y2DK9wBwKAIdPBo6B3xncMA2iAbsDW0LOoAmYzvD7rXXdmZtJyvLMjrlP1rfknHJQ6Hd
 JCBq4rxHLeyUhnElxm/bFoJcz/QfRHRSkG0f83d2QZs1tDJ87nqrMcJxk4Duy7GepGcO
 b15SlE1Rr7/KRQLs/CVIF342WFMsqPaOkf+qg4+YRacaAy59+h6/gk/Ln9uAUckCclAk
 kkHe7cFb1vGFZxsb6sSTuU7DbPCUrrIS29+ybxsaUgUyYid1pxakPwIiRvflLanZndaf
 loPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ahYwzRQmSJrX4v8ks57+n/tweaGVoFJT9QTc8vhlUHg=;
 b=EOVerNIm+GZ14RUR2eDGGoOL6j0Srr61Z0tH0y2AA2S9eRTCG54kfG/v8BbOqhH3GL
 PjIyAwTNoh8r+UE2NppcumT3G87mmIIO3k8Ib3vTdsvnWFsM8IAl/S5j9H03Q5AS/d9E
 L8zfj2I7d5HLUiG/TJn7SfIeUfMcL+JXZBsjEK7obfY8FNf7ORVmggpGknupwUA3sIqH
 Zua0xIoaYcJKJ3BPX0A2s5yFK67w9ZGCJRFAc2iRBXYCw02v767O2vCXxcrlBkxjG3tD
 J60nuXgHNrKk71X5KQ8RTtS0bDCHvCVMVbVzj3ioL6g0FagzuqU1rs6QnctqbzVE8fci
 5Z0A==
X-Gm-Message-State: AOAM5326tN4xYMKtj44qeZn3J1iP3lrQ1iGtrWp+vTTFtStkbWW6Jxli
 8zf2S6YCaDxWE9SDjbtnyUgGcQ==
X-Google-Smtp-Source: ABdhPJzJpkg8wtBhTMaUdn66zPEDMpQBLMZaZmKjxKN30X+1gT8di8t7bZe4+vqIGaLQaXjk1QYEfQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr19962295wru.266.1615143104380; 
 Sun, 07 Mar 2021 10:51:44 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-141-80.adsl.proxad.net. [82.252.141.80])
 by smtp.gmail.com with ESMTPSA id v5sm14842965wmh.2.2021.03.07.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 10:51:44 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: cwchoi00@gmail.com
Subject: [PATCH v4 3/4] devfreq/drivers/panfrost: Use devfreq cooling device
 registration
Date: Sun,  7 Mar 2021 19:51:36 +0100
Message-Id: <20210307185137.24925-3-daniel.lezcano@linaro.org>
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
