Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E79B2509F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8818210E796;
	Wed, 13 Aug 2025 17:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6A2110E78F;
 Wed, 13 Aug 2025 17:02:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AAD71CE2;
 Wed, 13 Aug 2025 10:02:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F4713F738;
 Wed, 13 Aug 2025 10:02:06 -0700 (PDT)
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
Subject: [PATCH 10/19] perf/arm-ni: Improve event validation
Date: Wed, 13 Aug 2025 18:01:02 +0100
Message-Id: <b1cf78c0f67dda1069f5132db9093fe0dec4c66e.1755096883.git.robin.murphy@arm.com>
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

Although it is entirely benign for arm_ni_val_count_event() to count
any old hardware leader/sibling as an NI event (perf core will still
ultimately reject the cross-PMU group), it would still be nicer if it
didn't. Stop trying to special-case software events and simply skip any
event which doesn't belong to our PMU. Similarly drop the early return
paths since they can almost never actually return early.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 1615a0564031..d6b683a0264e 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -271,40 +271,37 @@ static void arm_ni_pmu_disable(struct pmu *pmu)
 }
 
 struct arm_ni_val {
+	const struct pmu *pmu;
 	unsigned int evcnt;
 	unsigned int ccnt;
 };
 
-static bool arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
+static void arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
 {
-	if (is_software_event(evt))
-		return true;
-
-	if (NI_EVENT_TYPE(evt) == NI_PMU) {
-		val->ccnt++;
-		return val->ccnt <= 1;
+	if (evt->pmu == val->pmu) {
+		if (NI_EVENT_TYPE(evt) == NI_PMU)
+			val->ccnt++;
+		else
+			val->evcnt++;
 	}
-
-	val->evcnt++;
-	return val->evcnt <= NI_NUM_COUNTERS;
 }
 
 static int arm_ni_validate_group(struct perf_event *event)
 {
 	struct perf_event *sibling, *leader = event->group_leader;
-	struct arm_ni_val val = { 0 };
+	struct arm_ni_val val = { .pmu = event->pmu };
 
 	if (leader == event)
 		return 0;
 
 	arm_ni_val_count_event(event, &val);
-	if (!arm_ni_val_count_event(leader, &val))
+	arm_ni_val_count_event(leader, &val);
+	for_each_sibling_event(sibling, leader)
+		arm_ni_val_count_event(sibling, &val);
+
+	if (val.evcnt > NI_NUM_COUNTERS || val.ccnt > 1)
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, leader) {
-		if (!arm_ni_val_count_event(sibling, &val))
-			return -EINVAL;
-	}
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty

