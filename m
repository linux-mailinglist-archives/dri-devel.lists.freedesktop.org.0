Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D5B250AB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7B10E7A4;
	Wed, 13 Aug 2025 17:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA70F10E79A;
 Wed, 13 Aug 2025 17:02:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A3B1E2F;
 Wed, 13 Aug 2025 10:02:20 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A6983F738;
 Wed, 13 Aug 2025 10:02:24 -0700 (PDT)
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
Subject: [PATCH 14/19] perf: Clean up redundant group validation
Date: Wed, 13 Aug 2025 18:01:06 +0100
Message-Id: <778547b3a1c6eb907a7d775c5ac579610ea2be71.1755096883.git.robin.murphy@arm.com>
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

None of these drivers are doing anything that perf_event_open() doesn't
inherently do as of commit bf480f938566 ("perf/core: Don't allow
grouping events from different hw pmus"). While it's quite possible
that they should be doing some actual validation of the schedulability
of their own events within the given group, for now at least removing
this redundant code makes it even clearer that they are not.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ccn.c               | 16 ----------------
 drivers/perf/fsl_imx9_ddr_perf.c     | 16 ----------------
 drivers/perf/marvell_cn10k_ddr_pmu.c |  5 -----
 drivers/perf/xgene_pmu.c             | 15 ---------------
 4 files changed, 52 deletions(-)

diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 1a0d0e1a2263..63549aad3b99 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -708,7 +708,6 @@ static int arm_ccn_pmu_event_init(struct perf_event *event)
 	u32 node_xp, type, event_id;
 	int valid;
 	int i;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -814,21 +813,6 @@ static int arm_ccn_pmu_event_init(struct perf_event *event)
 				node_xp, type, port);
 	}
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable (for example to create a CCN group
-	 * periodically read when a hrtimer aka cpu-clock leader triggers).
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 267754fdf581..85874ec5ecd0 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -552,7 +552,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 {
 	struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -565,21 +564,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable (for example to create a CCN group
-	 * periodically read when a hrtimer aka cpu-clock leader triggers).
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	event->cpu = pmu->cpu;
 	hwc->idx = -1;
 
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 72ac17efd846..54e3fd206d39 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -487,11 +487,6 @@ static int cn10k_ddr_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/*  We must NOT create groups containing mixed PMUs */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader))
-		return -EINVAL;
-
 	/* Set ownership of event to one CPU, same event can not be observed
 	 * on multiple cpus at same time.
 	 */
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 33b5497bdc06..5e80ae0e692d 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -877,7 +877,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 {
 	struct xgene_pmu_dev *pmu_dev = to_pmu_dev(event->pmu);
 	struct hw_perf_event *hw = &event->hw;
-	struct perf_event *sibling;
 
 	/* Test the event attr type check for PMU enumeration */
 	if (event->attr.type != event->pmu->type)
@@ -913,20 +912,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 	 */
 	hw->config_base = event->attr.config1;
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty

