Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 400059956AF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 20:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D3F10E232;
	Tue,  8 Oct 2024 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJ2pfb3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCF710E232
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412540; x=1759948540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NF8wAROMOzFMcdExLwjtr/ohn+EHVISxj9yvB+SoDkg=;
 b=TJ2pfb3ocJRzE0VAUpg/5GkRoahQUIY2fll2kAdyK4FqzZd/c2Zm+LAN
 Iz93S+G9SysqOq9CbU6602oPGToUucyPOuLy94ZYRRWIxw21ZxUkNxVos
 h7rt8ImHFoWSpxUHOKdJBmxNr2OPht3KLR4A5lLBH2iBlPizCAbpreWlU
 vIqaqq+pvm4e+039hcKVCYTOF2WUCGc/WdcjYQSraka//dZeFc81kT/kK
 Lu560X1MbUIXFCqmFZQ/FtIoWAWV4haOKDQ/ZSdKoJfPOHP+2N+1xLLJa
 nN9KtJip6uRL6nxyIMij8xhajF16w6r6F6V2aqECVAkgwcHfxL6I3WGY3 w==;
X-CSE-ConnectionGUID: 3kU8Xw9oSKe5fKPaLs3Vjg==
X-CSE-MsgGUID: TvS8ilAuSaWYkC26ShXESA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38295346"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="38295346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:39 -0700
X-CSE-ConnectionGUID: uW9SEAZ9SHi/ZAaJsRS5Sw==
X-CSE-MsgGUID: wmi9BkTXSzOHjlW7L/92sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80530912"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.intel.com)
 ([10.125.110.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:35:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] perf: Move free outside of the mutex
Date: Tue,  8 Oct 2024 13:34:58 -0500
Message-ID: <20241008183501.1354695-3-lucas.demarchi@intel.com>
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

It's not needed to hold the mutex to free the percpu variables stored in
pmu. Move them outside of the mutex protection in preparation for
possibly allowing them to live longer, according to the lifecycle of the
object owning/containing the pmu.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 kernel/events/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 3b8b85adb10a..6395dbf67671 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11845,7 +11845,6 @@ void perf_pmu_unregister(struct pmu *pmu)
 	synchronize_srcu(&pmus_srcu);
 	synchronize_rcu();
 
-	free_percpu(pmu->pmu_disable_count);
 	idr_remove(&pmu_idr, pmu->type);
 	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
 		if (pmu->nr_addr_filters)
@@ -11853,8 +11852,11 @@ void perf_pmu_unregister(struct pmu *pmu)
 		device_del(pmu->dev);
 		put_device(pmu->dev);
 	}
-	free_pmu_context(pmu);
+
 	mutex_unlock(&pmus_lock);
+
+	free_percpu(pmu->pmu_disable_count);
+	free_pmu_context(pmu);
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);
 
-- 
2.46.2

