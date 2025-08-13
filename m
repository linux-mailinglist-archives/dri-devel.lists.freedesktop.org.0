Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3DB2509A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0EB10E790;
	Wed, 13 Aug 2025 17:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39A2110E794;
 Wed, 13 Aug 2025 17:02:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEBB71CE0;
 Wed, 13 Aug 2025 10:01:57 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95E5A3F738;
 Wed, 13 Aug 2025 10:02:01 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 09/19] perf/qcom: Improve group validation
Date: Wed, 13 Aug 2025 18:01:01 +0100
Message-Id: <ae74987481902e3937a8aa7ceaee4adcc681d7b4.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The L3 driver's group validation is almost right, except for erroneously
counting a software group leader - which is benign other than
artificially limiting the maximum size of such a group to one less than
it could be. Correct that with the now-established pattern of simply
ignoring all events which do not belong to our PMU.

The L2 driver gets a cleanup of some slightly suspicious logic, and both
can have the same overall simplification to not duplicate things that perf
core will already do, and avoid racy access to the sibling list of group
leader events.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/qcom_l2_pmu.c | 81 +++++++++++++++-----------------------
 drivers/perf/qcom_l3_pmu.c | 14 +++----
 2 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index ea8c85729937..9c4e1d89718d 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -468,23 +468,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Don't allow groups with mixed PMUs, except for s/w events */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create mixed PMU group\n");
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-		    !is_software_event(sibling)) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				 "Can't create mixed PMU group\n");
-			return -EINVAL;
-		}
-	}
-
 	cluster = get_cluster_pmu(l2cache_pmu, event->cpu);
 	if (!cluster) {
 		/* CPU has not been initialised */
@@ -493,39 +476,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Ensure all events in a group are on the same cpu */
-	if ((event->group_leader != event) &&
-	    (cluster->on_cpu != event->group_leader->cpu)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create group on CPUs %d and %d",
-			 event->cpu, event->group_leader->cpu);
-		return -EINVAL;
-	}
-
-	if ((event != event->group_leader) &&
-	    !is_software_event(event->group_leader) &&
-	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
-	     L2_EVT_GROUP(event->attr.config))) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Column exclusion: conflicting events %llx %llx\n",
-		       event->group_leader->attr.config,
-		       event->attr.config);
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if ((sibling != event) &&
-		    !is_software_event(sibling) &&
-		    (L2_EVT_GROUP(sibling->attr.config) ==
-		     L2_EVT_GROUP(event->attr.config))) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			     "Column exclusion: conflicting events %llx %llx\n",
-					    sibling->attr.config,
-					    event->attr.config);
-			return -EINVAL;
-		}
-	}
-
 	hwc->idx = -1;
 	hwc->config_base = event->attr.config;
 
@@ -534,6 +484,37 @@ static int l2_cache_event_init(struct perf_event *event)
 	 * same cpu context, to avoid races on pmu_enable etc.
 	 */
 	event->cpu = cluster->on_cpu;
+	if (event->cpu != event->group_leader->cpu) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Can't create group on CPUs %d and %d",
+			 event->cpu, event->group_leader->cpu);
+		return -EINVAL;
+	}
+
+	if (event == event->group_leader)
+		return 0;
+
+	if ((event->group_leader->pmu == event->pmu) &&
+	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
+	     L2_EVT_GROUP(event->attr.config))) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Column exclusion: conflicting events %llx %llx\n",
+		       event->group_leader->attr.config,
+		       event->attr.config);
+		return -EINVAL;
+	}
+
+	for_each_sibling_event(sibling, event->group_leader) {
+		if ((sibling->pmu == event->pmu) &&
+		    (L2_EVT_GROUP(sibling->attr.config) ==
+		     L2_EVT_GROUP(event->attr.config))) {
+			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			     "Column exclusion: conflicting events %llx %llx\n",
+					    sibling->attr.config,
+					    event->attr.config);
+			return -EINVAL;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 66e6cabd6fff..f0cf6c33418d 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -454,18 +454,16 @@ static bool qcom_l3_cache__validate_event_group(struct perf_event *event)
 	struct perf_event *sibling;
 	int counters = 0;
 
-	if (leader->pmu != event->pmu && !is_software_event(leader))
-		return false;
+	if (leader == event)
+		return true;
 
 	counters = event_num_counters(event);
-	counters += event_num_counters(leader);
+	if (leader->pmu == event->pmu)
+		counters += event_num_counters(leader);
 
 	for_each_sibling_event(sibling, leader) {
-		if (is_software_event(sibling))
-			continue;
-		if (sibling->pmu != event->pmu)
-			return false;
-		counters += event_num_counters(sibling);
+		if (sibling->pmu == event->pmu)
+			counters += event_num_counters(sibling);
 	}
 
 	/*
-- 
2.39.2.101.g768bb238c484.dirty

