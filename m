Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFD9956B3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6242710E59D;
	Tue,  8 Oct 2024 18:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4wjOeTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0A10E588
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412543; x=1759948543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nHrNeNJsF/XXWidU3270UWoFA4O2wgRb70EVT2SYX5E=;
 b=F4wjOeTGcX+BosAtfRymoqppJ3gSPg9vbillr7fNHsBgSM2hZPbOuRQE
 0lBrMB5AJ8i8FriKZ7xhp9wkV55fMf3xzDfCOLlkn1lAoxeNRk7sXA2GY
 qf5hLSXvpfeWhL6Qsx55yINgjpII3l36FHuRDm1S5D97Puvnaqzry08HR
 crg44iyQIyeUno/nxYqKYN0ZOhjtwFsZntqvRmMWL+BCcifqTjxAOA1P1
 hFwNhVajLq3MLR2tG69iUHgkr6CCoBU4W1umA6SVfTvWqaTRLLicXHPVW
 cjNQ9O//YTAuZjMitlDx9vrClm4wSPghM8F6dtix1R/1/GqkApl4Z1UC2 A==;
X-CSE-ConnectionGUID: 4Kjp3ZOuSIm/AccLwX+i2g==
X-CSE-MsgGUID: RRAqn9OjQJ2IXJ+1ppKZrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38295377"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38295377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:43 -0700
X-CSE-ConnectionGUID: 75lAtwCFTgu/OxF3Np5Inw==
X-CSE-MsgGUID: lzkJKALHSFeawfpQajiarQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80530939"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.125.110.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] perf/dummy_pmu: Track and disable active events
Date: Tue,  8 Oct 2024 13:35:01 -0500
Message-ID: <20241008183501.1354695-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008183501.1354695-1-lucas.demarchi@intel.com>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
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

When unregistering the PMU, disable the currently active events. This
allows userspace to see the change and possibly reacting on it, like
reopening the fd. With perf-stat, "<not counted>" starts to be printed:

	$ stat -e dummy_pmu_0/test-event-1/ -I1000
	1.001227905                 12      dummy_pmu_0/test-event-1/
	2.004009349                 11      dummy_pmu_0/test-event-1/
	3.005785067                  0      dummy_pmu_0/test-event-1/
	4.008565935      <not counted>      dummy_pmu_0/test-event-1/
	5.010446891      <not counted>      dummy_pmu_0/test-event-1/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 kernel/events/dummy_pmu.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/kernel/events/dummy_pmu.c b/kernel/events/dummy_pmu.c
index c07e111bff01..496cb8469a05 100644
--- a/kernel/events/dummy_pmu.c
+++ b/kernel/events/dummy_pmu.c
@@ -14,6 +14,7 @@
 #include <linux/random.h>
 #include <linux/seq_file.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 struct dummy_mod {
 	struct dentry *debugfs_root;
@@ -25,6 +26,7 @@ struct dummy_mod {
 struct dummy_pmu {
 	struct pmu base;
 	char *name;
+	struct xarray active_events;
 	bool registered;
 };
 
@@ -97,9 +99,25 @@ static const struct attribute_group *attr_groups[] = {
 	NULL,
 };
 
+static void dummy_pmu_event_destroy(struct perf_event *event)
+{
+	struct dummy_pmu *pmu = event_to_pmu(event);
+	unsigned long idx;
+	struct perf_event *e;
+
+	/* Event not active anymore */
+	xa_for_each(&pmu->active_events, idx, e)
+		if (e == event) {
+			xa_erase(&pmu->active_events, idx);
+			break;
+		}
+}
+
 static int dummy_pmu_event_init(struct perf_event *event)
 {
 	struct dummy_pmu *pmu = event_to_pmu(event);
+	u32 event_id;
+	int ret;
 
 	if (!pmu->registered)
 		return -ENODEV;
@@ -117,6 +135,13 @@ static int dummy_pmu_event_init(struct perf_event *event)
 	if (event->cpu < 0)
 		return -EINVAL;
 
+	ret = xa_alloc(&pmu->active_events, &event_id, event,
+			xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	event->destroy = dummy_pmu_event_destroy;
+
 	return 0;
 }
 
@@ -232,6 +257,8 @@ static int device_init(struct dummy_device *d)
 	if (ret)
 		goto fail;
 
+	xa_init_flags(&d->pmu.active_events, XA_FLAGS_ALLOC);
+
 	d->pmu.registered = true;
 	pr_info("Device registered: %s\n", d->pmu.name);
 
@@ -248,9 +275,22 @@ static int device_init(struct dummy_device *d)
 	return ret;
 }
 
+static void disable_active_events(struct dummy_pmu *pmu)
+{
+	struct perf_event *event;
+	unsigned long idx;
+
+	xa_for_each(&pmu->active_events, idx, event) {
+		xa_erase(&pmu->active_events, idx);
+		perf_event_disable(event);
+	}
+}
+
 static void device_exit(struct dummy_device *d)
 {
 	d->pmu.registered = false;
+
+	disable_active_events(&d->pmu);
 	perf_pmu_unregister(&d->pmu.base);
 
 	pr_info("Device released: %s\n", d->pmu.name);
-- 
2.46.2

