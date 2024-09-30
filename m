Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94B98AD7A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CAA10E58E;
	Mon, 30 Sep 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLJhNfPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0D310E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726046; x=1759262046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xs7q6rEvnbcbMeeaUSlO9zXSEJo7w+EXsVdD5ofN4TY=;
 b=dLJhNfPTNry64+h+u6dAqKbfbOWyLlsrGuQ2OqMw32cRRuETm3r48ZZu
 SZY1E+C21dgjKD2OfTeJKkoiplHDAG95VlKkaGC9WuA+fzF1jH+85obKc
 Q4oOFEZPLF9NzRU13XFD9B3kBbpqV9rhTNi4v1UjGb9l2/pc6TeB/5dqI
 u8XbIAfjgZlQfuZGJJLGZSA5RWMOfe1QYWiGWIoclGQY4ZdSsfTvVKv0G
 hByiIVtbvU8McxgQeuoebaNShAiA1Z/TyX7q87JUpfXHRl60SBbVCyDrP
 N0HfczmxM4bN/Z7j5XD7ykOEuo2MSyiLV6/fhTmVOEgh+/Wi6ukeB0Zo2 g==;
X-CSE-ConnectionGUID: He1QwpP7Toa0rsiy3gGD/Q==
X-CSE-MsgGUID: pAfygPtFR+SXIccm2sF/aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962377"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962377"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:06 -0700
X-CSE-ConnectionGUID: jP1SmKowSgGGN9lGd+Qr5A==
X-CSE-MsgGUID: Ox0P5W//Rqy4tP8LB3u06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370235"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:04 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 26/31] accel/ivpu: Use whole user and shave ranges for
 preemption buffers
Date: Mon, 30 Sep 2024 21:53:17 +0200
Message-ID: <20240930195322.461209-27-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

