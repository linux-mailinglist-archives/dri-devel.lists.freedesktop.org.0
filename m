Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B3B3022B8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269889F61;
	Mon, 25 Jan 2021 08:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957F689F55;
 Mon, 25 Jan 2021 08:18:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id 6so11273277wri.3;
 Mon, 25 Jan 2021 00:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y7QSAI4exnMwTSIl2D/guBzjw3QSq7D2XfoHWDkim0M=;
 b=kz5X1h6DqSqeV6eliWhiDPYDhC/5Vb+VoxkBn2I420H7P49skPLRYqgfpy4f78qbr/
 c5yj6Fk29J7lf+Fjnowbz8gNGIkVBkt8/Wuery3OFtJI2sfmIr94lMufUrC1aCG999U7
 UOgZNCFrpeMAFMOF6GY93vEi8n7J0GPb+MQ8ADVe6SKgJzhydqAA1WaTIq5UXXR1v0pq
 EZmu2x/+3cCej4t0CYQoyblwOT1n76QH2ggxx8SM6LphJ3e6hObPgfl2pkVo/zBGynon
 kovYuruRtDQ5tEugsYLd1Bo1gxPQId/F2EuJMOCc0m4kt5ZtWPhpjRmbkdfS6JvVvMfq
 9yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y7QSAI4exnMwTSIl2D/guBzjw3QSq7D2XfoHWDkim0M=;
 b=dNAbhwtV/IOMZUrA2hb4rvD5SDu6ZiCDSe3Cq/3mKHlnbw76yZZVi3dq4mSeZ94xcJ
 2y8wZ2mdeiLN0L8fKFnxhDtgPku1/H8MdHJsGiXhaEOVjyfqPL1BYD/MQ2jla7cXVFaC
 6jwoehOHJI1BaIEA+C+sqjeTU0ikKzi9QjvcB7slcNBjbK6aO6VpOkrVXnaMu3zJ0M32
 LFCr8E6MRnrm4yadjI8DZBg/WwNusJXgFqXcPDLdxSUwPdUN/EVJgX4PsI4XWSUY16NT
 FBmTsMj54VEBmy2mC8oboRZBA2wG5Ig3MvKoYWLBNiQz9X7vZ2oNgyQPtqC7bbeF+uUq
 JfPg==
X-Gm-Message-State: AOAM530knfjNQyyFRVy4sIV7ovsj/ZktTv+8wC0w1zePgIDI3qtLWMa9
 auTOFovAvXP5ZEFe3KfMj5k=
X-Google-Smtp-Source: ABdhPJw+CnX1ojnwI5+Km+6OVd8qHBN/eVrDsmFJRtBQmrYurXcm6CNStkvdgbes0Df3GJB6yjz5zg==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr10731wrd.207.1611562689269;
 Mon, 25 Jan 2021 00:18:09 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m12sm20286798wmc.10.2021.01.25.00.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 00:18:08 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/lima: add governor data with pre-defined thresholds
Date: Mon, 25 Jan 2021 08:18:04 +0000
Message-Id: <20210125081804.13016-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Steven Price <steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adapts the panfrost pre-defined thresholds change [0] to the
lima driver to improve real-world performance. The upthreshold value has
been set to ramp GPU frequency to max freq faster (compared to panfrost)
to compensate for the lower overall performance of utgard devices.

[0] https://patchwork.kernel.org/project/dri-devel/patch/20210121170445.19761-1-lukasz.luba@arm.com/

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
I have been using Kodi as my test application. If you scroll in library
views with hundreds of list items and the panfrost values the slow GPU
ramp up is quite noticeable and the GUI feels sluggish. As everything
lima runs on is inherently slower than panfrost using devices I believe
it's better to ramp up to max freq quicker.

 drivers/gpu/drm/lima/lima_devfreq.c | 10 +++++++++-
 drivers/gpu/drm/lima/lima_devfreq.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..c9854315a0b5 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -163,8 +163,16 @@ int lima_devfreq_init(struct lima_device *ldev)
 	lima_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
 
+	/*
+	 * Setup default thresholds for the simple_ondemand governor.
+	 * The values are chosen based on experiments.
+	 */
+	ldevfreq->gov_data.upthreshold = 20;
+	ldevfreq->gov_data.downdifferential = 5;
+
 	devfreq = devm_devfreq_add_device(dev, &lima_devfreq_profile,
-					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
+					  &ldevfreq->gov_data);
 	if (IS_ERR(devfreq)) {
 		dev_err(dev, "Couldn't initialize GPU devfreq\n");
 		ret = PTR_ERR(devfreq);
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 2d9b3008ce77..b0c7c736e81a 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -4,6 +4,7 @@
 #ifndef __LIMA_DEVFREQ_H__
 #define __LIMA_DEVFREQ_H__
 
+#include <linux/devfreq.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
 
@@ -18,6 +19,7 @@ struct lima_devfreq {
 	struct opp_table *clkname_opp_table;
 	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
+	struct devfreq_simple_ondemand_data gov_data;
 
 	ktime_t busy_time;
 	ktime_t idle_time;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
