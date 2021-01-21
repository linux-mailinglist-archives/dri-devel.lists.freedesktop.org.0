Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDAC2FFE98
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BAA6E9E8;
	Fri, 22 Jan 2021 08:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B79D389D53
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 17:05:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8098911B3;
 Thu, 21 Jan 2021 09:05:15 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.7.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDA7E3F66E;
 Thu, 21 Jan 2021 09:05:12 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, steven.price@arm.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/panfrost: Add governor data with pre-defined thresholds
Date: Thu, 21 Jan 2021 17:04:45 +0000
Message-Id: <20210121170445.19761-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: tomeu.vizoso@collabora.com, daniel.lezcano@linaro.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simple_ondemand devfreq governor uses two thresholds to decide about
the frequency change: upthreshold, downdifferential. These two tunable
change the behavior of the governor decision, e.g. how fast to increase
the frequency or how rapidly limit the frequency. This patch adds needed
governor data with thresholds values gathered experimentally in different
workloads.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
Hi all,

This patch aims to improve the panfrost performance in various workloads,
(benchmarks, games). The simple_ondemand devfreq governor supports
tunables to tweak the behaviour of the internal algorithm. The default
values for these two thresholds (90 and 5) do not work well with panfrost.
These new settings should provide good performance, short latency for
rising the frequency due to rapid workload change and decent freq slow
down when the load is decaying. Based on frequency change statistics,
gathered during experiments, all frequencies are used, depending on
the load. This provides some power savings (statistically). The highest
frequency is also used when needed.

Example glmark2 results:
1. freq fixed to max: 153
2. these new thresholds values (w/ patch): 151
3. default governor values (w/o patch): 114

In future the devfreq framework would expose via sysfs these two
tunables, so they can be adjusted by the middleware based on currently
running workload (game, desktop, web browser, etc). These new values
should be good enough, though.

Regards,
Lukasz Luba

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 10 +++++++++-
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 56b3f5935703..7c5ffc81dce1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -130,8 +130,16 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
 
+	/*
+	 * Setup default thresholds for the simple_ondemand governor.
+	 * The values are chosen based on experiments.
+	 */
+	pfdevfreq->gov_data.upthreshold = 45;
+	pfdevfreq->gov_data.downdifferential = 5;
+
 	devfreq = devm_devfreq_add_device(dev, &panfrost_devfreq_profile,
-					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
+					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
+					  &pfdevfreq->gov_data);
 	if (IS_ERR(devfreq)) {
 		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
 		ret = PTR_ERR(devfreq);
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index db6ea48e21f9..1e2a4de941aa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -4,6 +4,7 @@
 #ifndef __PANFROST_DEVFREQ_H__
 #define __PANFROST_DEVFREQ_H__
 
+#include <linux/devfreq.h>
 #include <linux/spinlock.h>
 #include <linux/ktime.h>
 
@@ -17,6 +18,7 @@ struct panfrost_devfreq {
 	struct devfreq *devfreq;
 	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
+	struct devfreq_simple_ondemand_data gov_data;
 	bool opp_of_table_added;
 
 	ktime_t busy_time;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
