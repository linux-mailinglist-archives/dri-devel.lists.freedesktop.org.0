Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC89423CD
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 02:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E7010E32E;
	Wed, 31 Jul 2024 00:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrIHYfY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267CE10E262;
 Wed, 31 Jul 2024 00:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722385832; x=1753921832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptiJFpcxcUokqaP9PdFq+FGJm+jDe2svhscYd8NXJ0M=;
 b=OrIHYfY5h9I4hCnpqRSoyNMPPf3CE1Jfk/yTlYucAqKrUMJKHi7dFp/8
 j+aSuMaZYLKDPxFNrWbPU6JEisVD4bwPV8yq9r2RPl5aohkk8jfu7finc
 6Y3OcQSq5KFwKJjDmiaVv6W51Z7h5gaex93V27C/kapMiPVhuPL9GJEpZ
 3KXGNgQyaD3rY2EEHlXI0kCdNEsn2vAf/4TacCf/+OuYoYhsgRTgjpfgb
 H4yZBodnfy7i3qqqewfrasKs9XSgyWH0pNrzfSQj+eJLi27+xYWPwJ+JB
 eEoOCQVbJ909HjSXTsYivmzI5mSlZApo7uOqy4mWSqEZU4sf9P/H0VzGO g==;
X-CSE-ConnectionGUID: XdFIOqRhTdaYxjHgux0KbQ==
X-CSE-MsgGUID: zl5UUHd8RFCX54uf3R16bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23156096"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23156096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
X-CSE-ConnectionGUID: iSfPjd5kQ5icKwrUydTiXg==
X-CSE-MsgGUID: fB0Js/7+TwuoyWm2ZHUMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77781800"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 17:30:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: tj@kernel.org, jiangshanlai@gmail.com, christian.koenig@amd.com,
 ltuikov89@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 4/5] drm/sched: Use drm sched lockdep map for submit_wq
Date: Tue, 30 Jul 2024 17:31:18 -0700
Message-Id: <20240731003119.2422940-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731003119.2422940-1-matthew.brost@intel.com>
References: <20240731003119.2422940-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Avoid leaking a lockdep map on each drm sched creation and destruction
by using a single lockdep map for all drm sched allocated submit_wq.

v2:
 - Use alloc_ordered_workqueue_lockdep_map (Tejun)

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..cf79d348cb32 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -87,6 +87,12 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
+#ifdef CONFIG_LOCKDEP
+static struct lockdep_map drm_sched_lockdep_map = {
+	.name = "drm_sched_lockdep_map"
+};
+#endif
+
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
@@ -1272,7 +1278,12 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->submit_wq = submit_wq;
 		sched->own_submit_wq = false;
 	} else {
+#ifdef CONFIG_LOCKDEP
+		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name, 0,
+								       &drm_sched_lockdep_map);
+#else
 		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+#endif
 		if (!sched->submit_wq)
 			return -ENOMEM;
 
-- 
2.34.1

