Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA73B25091
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570110E783;
	Wed, 13 Aug 2025 17:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D31A310E78A;
 Wed, 13 Aug 2025 17:01:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D641C01;
 Wed, 13 Aug 2025 10:01:44 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 074E03F738;
 Wed, 13 Aug 2025 10:01:47 -0700 (PDT)
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
Subject: [PATCH 06/19] ARM: l2x0: Fix group validation
Date: Wed, 13 Aug 2025 18:00:58 +0100
Message-Id: <925c34a4b7f0defc3582a9fcccb6af1c21279a86.1755096883.git.robin.murphy@arm.com>
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

The group validation here is almost right, but fails to count the new
event itself. While we fix that, also adopt the standard pattern to
avoid racy access the sibling list and drop checks that are redundant
with core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mm/cache-l2x0-pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0-pmu.c b/arch/arm/mm/cache-l2x0-pmu.c
index 93ef0502b7ff..6fc1171031a8 100644
--- a/arch/arm/mm/cache-l2x0-pmu.c
+++ b/arch/arm/mm/cache-l2x0-pmu.c
@@ -274,18 +274,17 @@ static bool l2x0_pmu_group_is_valid(struct perf_event *event)
 	struct pmu *pmu = event->pmu;
 	struct perf_event *leader = event->group_leader;
 	struct perf_event *sibling;
-	int num_hw = 0;
+	int num_hw = 1;
+
+	if (leader == event)
+		return true;
 
 	if (leader->pmu == pmu)
 		num_hw++;
-	else if (!is_software_event(leader))
-		return false;
 
 	for_each_sibling_event(sibling, leader) {
 		if (sibling->pmu == pmu)
 			num_hw++;
-		else if (!is_software_event(sibling))
-			return false;
 	}
 
 	return num_hw <= PMU_NR_COUNTERS;
-- 
2.39.2.101.g768bb238c484.dirty

