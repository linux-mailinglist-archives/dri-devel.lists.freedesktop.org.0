Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898ACA9C3D4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D0C10E8F4;
	Fri, 25 Apr 2025 09:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq2cpIFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D89810E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745573823; x=1777109823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sU8pX2NuvkWIj9ULN/FyqDIhd6MwHA+3wu0AQPmgG4o=;
 b=Lq2cpIFa26D8SMFpo6KympF+WQckat+Xt9JRtpot5Qoa8xonIi3WaA4r
 gn88fpWPpFvgAhsoqgiTPTRocWqoXnobdTMuKt9kZWDvybqb8VP0g8XCy
 seOTnBITPXG7SMnkrO+kDNC5ybcjpNV/pBQeo4cVIpOWpQJakXporN+Fs
 jQ135cyEZTo+A1L4sBTmV/tilIzvS24fZdIHGzANTdVWohnNGc1B4L9nu
 5hYQtn3RvUrwx0xn5sinhuNC+ltI+b1M2VtFJUU3RImwLMiSn1L9Ht0DN
 6C7XaJroB16yo3Fd8WGZSpTduWrTS4q6tJf5rqwdzp3wATkyLiyMM6JlH g==;
X-CSE-ConnectionGUID: gJPfNWNgR8CTc9edU4p6yw==
X-CSE-MsgGUID: PcpEe05+Td6d2S0yIuKN9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47115508"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47115508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:37:02 -0700
X-CSE-ConnectionGUID: dfZfEDJMRqmUvCrWXXR8iQ==
X-CSE-MsgGUID: 82FXMXfPR0SYOAIlie1I8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133389841"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:36:59 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Correct mutex unlock order in job submission
Date: Fri, 25 Apr 2025 11:36:56 +0200
Message-ID: <20250425093656.2228168-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

The mutex unlock for vdev->submitted_jobs_lock was incorrectly placed
after unlocking file_priv->lock. Change order of unlocks to avoid potential
race conditions.

Fixes: 5bbccadaf33e ("accel/ivpu: Abort all jobs after command queue unregister")
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 863e3cd6ace51..540923ffcbf8d 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -681,8 +681,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
 err_erase_xa:
 	xa_erase(&vdev->submitted_jobs_xa, job->job_id);
 err_unlock:
-	mutex_unlock(&vdev->submitted_jobs_lock);
 	mutex_unlock(&file_priv->lock);
+	mutex_unlock(&vdev->submitted_jobs_lock);
 	ivpu_rpm_put(vdev);
 	return ret;
 }
-- 
2.45.1

