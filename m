Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E5B25095
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE8010E78D;
	Wed, 13 Aug 2025 17:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F26010E78B;
 Wed, 13 Aug 2025 17:01:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DB41C14;
 Wed, 13 Aug 2025 10:01:48 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4993F738;
 Wed, 13 Aug 2025 10:01:52 -0700 (PDT)
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
Subject: [PATCH 07/19] ARM: imx: Fix MMDC PMU group validation
Date: Wed, 13 Aug 2025 18:00:59 +0100
Message-Id: <12766b2e16939ed97df8c410a994c730bede8298.1755096883.git.robin.murphy@arm.com>
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

The group validation here gets the event and its group leader mixed up,
such that if the group leader belongs to a different PMU, the set_bit()
may go wildly out of bounds. While we fix that, also adopt the standard
pattern to avoid racy access the sibling list and drop checks that are
redundant with core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mach-imx/mmdc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index 94e4f4a2f73f..f9d432b385a2 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -238,11 +238,8 @@ static bool mmdc_pmu_group_event_is_valid(struct perf_event *event,
 {
 	int cfg = event->attr.config;
 
-	if (is_software_event(event))
-		return true;
-
 	if (event->pmu != pmu)
-		return false;
+		return true;
 
 	return !test_and_set_bit(cfg, used_counters);
 }
@@ -260,12 +257,12 @@ static bool mmdc_pmu_group_is_valid(struct perf_event *event)
 	struct perf_event *sibling;
 	unsigned long counter_mask = 0;
 
-	set_bit(leader->attr.config, &counter_mask);
+	if (event == leader)
+		return true;
 
-	if (event != leader) {
-		if (!mmdc_pmu_group_event_is_valid(event, pmu, &counter_mask))
-			return false;
-	}
+	set_bit(event->attr.config, &counter_mask);
+	if (!mmdc_pmu_group_event_is_valid(leader, pmu, &counter_mask))
+		return false;
 
 	for_each_sibling_event(sibling, leader) {
 		if (!mmdc_pmu_group_event_is_valid(sibling, pmu, &counter_mask))
-- 
2.39.2.101.g768bb238c484.dirty

