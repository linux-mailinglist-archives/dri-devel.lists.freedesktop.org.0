Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA78306447
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 20:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE256E873;
	Wed, 27 Jan 2021 19:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DB289BD5;
 Wed, 27 Jan 2021 19:40:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l12so3156582wry.2;
 Wed, 27 Jan 2021 11:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PcWmJK7Dze/r/wUv0FSXsJbwz5Mept/IbtYNxoDr6rI=;
 b=my18lCcUw72G/3GMBnhG1Ahqiri1aO4swmUZWZMmfGN90SyV3mv2DQtwTQvV8EPtHt
 BYdbTkPv/vT5qUkh9KpiafH//Eyz5MWzquukfI3lDORqkamSyXUn9aqzDyEL9iixL3Gq
 0JcXXs1uUTlKjWZ5lOS7dCtN7WNVvdT1fA1zDP4k5Y/3UN2E8a5LALOK+z28tIb0CtWR
 I8tl6KJHvgviHQOiIzAIJX2vE05Gw13Bw5ed4bdG/vW/N0zRgNEpHA39/g3Ihf9BaBSv
 WDnjIgjt7Siwo/J3hShCdOP2dzAPVp2nhcv6tWJ2zdBuyxYHChRvjdwUrA99HzUMClSv
 tIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PcWmJK7Dze/r/wUv0FSXsJbwz5Mept/IbtYNxoDr6rI=;
 b=JtONGbGe0XqQFfv/6n9ZIBYo0gLoBIETN0YFn+HreXxQC6K5IMCxdsuIud8Ral2DKK
 FR8rLtYQmJQZVxJkBn+nuarcGbj2pO7DKt1BeLiHs9NjTGQteajLSczNGbjOkcxEv61j
 ERG9o0gRPZlYqm5rxac3AwvUxEFTUYeeAgW3rX2Eaiel8uu/XJ0crknTeTy9DcrBX0Lu
 14bQtofXkOuRL6B5DSTW3xpheDwWRyfSbQwM6C285Zh2Ix+1hZTcd13yFTnkPRmJey/0
 LsrAbQP2Pxc/yoWHxqqSxP/2ha8hgCPNRUOaLg8Ga5cKfcU80b6XFCWRu/jSw5DNVQqt
 vAYw==
X-Gm-Message-State: AOAM53050KdwghPNa/OIB3wny6pYRtJY/Mz45CwB/iVdArRdrrBnCBpF
 /bVD93bq1dsriMqmhEl4PSY=
X-Google-Smtp-Source: ABdhPJy3RfbeYRIMLYndPZDVwVhj97D1QkysNjbT5Mk8RnXZ+/O73ETbponAJJ19eqje28t1N1XkWQ==
X-Received: by 2002:adf:fe04:: with SMTP id n4mr13215849wrr.115.1611776452142; 
 Wed, 27 Jan 2021 11:40:52 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e11sm4075305wrx.14.2021.01.27.11.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 11:40:51 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/lima: add governor data with pre-defined thresholds
Date: Wed, 27 Jan 2021 19:40:47 +0000
Message-Id: <20210127194047.21462-1-christianshewitt@gmail.com>
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
Change since v1: increased upthreshold from 20 to 30, with a soft
dependency on Lukasz delayed timer patch [0]

[0] https://lore.kernel.org/lkml/20210127105121.20345-1-lukasz.luba@arm.com/

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
+	ldevfreq->gov_data.upthreshold = 30;
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
