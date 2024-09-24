Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BA984040
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573B110E67C;
	Tue, 24 Sep 2024 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0RfyW9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C3210E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165931; x=1758701931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZG1Xxe+C1muu42/Zwh4cYcxQyfCDULpB7T2OXhNGAR8=;
 b=Y0RfyW9oyaQ6jhvXVPpTkF2yf9jNIPULJ1zzU7RAxfGwndQgcby6l6vZ
 PJ3PGrpQEIxQMpSH6QSScADJLcbGUbaBJfA5h/JjCPAjQEF0PfmuRRVQ3
 htj2P3QA+WNi5RGCnYNf1LAWOG6Cggdw3C5kOoC7U3uHF8l7K74BiZO90
 BbqGKkrltbHEEOteGyIPXVX+w+ETU4c3bKGR5ZZjv7i8BIZ9wOZSJ0jSv
 1+1Tqga8jooIz7oRAlfxzEJ4S7gPaAW0FI2EdF1SN72afk+BKEaaZGuy0
 cNlKPat1CL75443CMthvlbblBNXrUebdHfbf1zThu/hRxPES6h7rGSgU2 Q==;
X-CSE-ConnectionGUID: RHzQlsZjSB6nmfDcmLq77w==
X-CSE-MsgGUID: Br51PfmVTTe2GiR6V4gl8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507013"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507013"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:51 -0700
X-CSE-ConnectionGUID: P26YEEewQuyM5++gvJqUFQ==
X-CSE-MsgGUID: dcutSb7bQPSFuV3B2X0c/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170759"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:49 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 24/29] accel/ivpu: Use whole user and shave ranges for
 preemption buffers
Date: Tue, 24 Sep 2024 10:17:49 +0200
Message-ID: <20240924081754.209728-25-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Do not restrict range for preemption buffers allocation just to the end
of user and shave ranges, use them whole instead to avoid situation
where end of range might be already allocated causing preemption buffers
allocation to fail.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 48272bc853e0c..cd41b87715056 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -33,24 +33,19 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 {
 	u64 primary_size = ALIGN(vdev->fw->primary_preempt_buf_size, PAGE_SIZE);
 	u64 secondary_size = ALIGN(vdev->fw->secondary_preempt_buf_size, PAGE_SIZE);
-	struct ivpu_addr_range range;
 
 	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return 0;
 
-	range.start = vdev->hw->ranges.user.end - (primary_size * IVPU_NUM_CMDQS_PER_CTX);
-	range.end = vdev->hw->ranges.user.end;
-	cmdq->primary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &range, primary_size,
-						   DRM_IVPU_BO_WC);
+	cmdq->primary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.user,
+						   primary_size, DRM_IVPU_BO_WC);
 	if (!cmdq->primary_preempt_buf) {
 		ivpu_err(vdev, "Failed to create primary preemption buffer\n");
 		return -ENOMEM;
 	}
 
-	range.start = vdev->hw->ranges.shave.end - (secondary_size * IVPU_NUM_CMDQS_PER_CTX);
-	range.end = vdev->hw->ranges.shave.end;
-	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &range, secondary_size,
-						     DRM_IVPU_BO_WC);
+	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.shave,
+						     secondary_size, DRM_IVPU_BO_WC);
 	if (!cmdq->secondary_preempt_buf) {
 		ivpu_err(vdev, "Failed to create secondary preemption buffer\n");
 		goto err_free_primary;
-- 
2.45.1

