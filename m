Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE69C2EBF
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA7010E360;
	Sat,  9 Nov 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaeAv+tN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334E10E357;
 Sat,  9 Nov 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731173355; x=1762709355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jL521Rg11rGFLjmPgqAuPSkCfXrq6c598uHpSXKSI6U=;
 b=BaeAv+tN6uvMvgD0CAUsC+3AriKDcCVqm0fgiCi+4YXzMWACjN2zq5Mr
 Z/LMR7kqIz++v1JqzHbxWlt7WwK/GZ5h/6ERdPVmYZ6Oa1tal6BHi1W/o
 zH6t0q9CqaUpDSEoCvrPpC1F3V2o8E9f0L4Ztn4YNp86RjyKpZc3B1M2l
 JkDPWbZyXh/RwByqKsOSEF8I6Xsh8dGYQnkOlw/28UpU2g3OZrsFRUEGK
 MZDsayTDlL9bCXIsAE32bcFomv311CO9PIXo64g+O3zoj3TxF7mpTOm+f
 GJdf6moX4K1yXMSQOvX24RkEDj2GXE9iysQ7X3v9hnqp5QdP8VLEHZJgA g==;
X-CSE-ConnectionGUID: 26s3niMrQ062fSqSaipUWw==
X-CSE-MsgGUID: Xmoz32DJQR2TRgXlzNjDAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41600130"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41600130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:15 -0800
X-CSE-ConnectionGUID: yC+fD0VWRWe4IDrnMKM6Rg==
X-CSE-MsgGUID: H35kI1fURzStITDrHCvkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; d="scan'208";a="86499491"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2024 09:29:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com,
 pstanner@redhat.com, boris.brezillon@collabora.com, airlied@gmail.com,
 ltuikov89@gmail.com, dakr@kernel.org, christian.koenig@amd.com,
 mihail.atanassov@arm.com, steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 4/6] drm/sched: Teach scheduler about dma_fence_prempt type
Date: Sat,  9 Nov 2024 09:29:40 -0800
Message-Id: <20241109172942.482630-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109172942.482630-1-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
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

Update drm_sched_job_add_dependency to detect dma_fence_preempt and
correctly store it in the dedicated preemptive fence xarray ensuring
preempt fence semantics are followed.

Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index eceb9b8c6f5f..607722364876 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -76,6 +76,7 @@
 #include <linux/sched.h>
 #include <linux/completion.h>
 #include <linux/dma-resv.h>
+#include <linux/dma-fence-preempt.h>
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_print.h>
@@ -916,7 +917,8 @@ static int __drm_sched_job_add_dependency(struct drm_sched_job *job,
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence)
 {
-	return __drm_sched_job_add_dependency(job, fence, false);
+	return __drm_sched_job_add_dependency(job, fence,
+					      dma_fence_is_preempt(fence));
 }
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
-- 
2.34.1

