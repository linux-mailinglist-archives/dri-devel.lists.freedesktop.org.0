Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E446AB5913C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE3310E312;
	Tue, 16 Sep 2025 08:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUMI63gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072EE10E312
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758012498; x=1789548498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fCZbhjZ9Ku7qSdeBBwrYI3ui+E9EvNOgG2sfjrEzFiI=;
 b=VUMI63gs9PiUldOy3dghMWiS7GEm97ULU1u7Eo9pgW4GyDMr5mqox9x6
 Pd1LaW6YMleoF3XmMcOx0Wko+ZWD1d+pO77sD+L/vG+aA94JT200G632t
 D9EU/RRDiyE2VUIWzaPMhYJ8HtUPgEFe9IbwfyLkQKWk1ExEL3Vik/Rtz
 YRnwnNEmGDnzzlyTNgdODF7K8oXi59/SRjPZvCkWMp2cc8YdMnQ/fcq8M
 5YlDLhDkmxsDG308YBny1xG4QS5hdEK4Dr687CzbD51jCk5tTgMzOXkJY
 rA/UnzgtfSjwFYxKdT/4+nP0DgZvLYUmc1gwELRb1e8Cu8L6MXecBz8MR A==;
X-CSE-ConnectionGUID: hFUUdRFlTme0SZ3kX0RkFg==
X-CSE-MsgGUID: HkL4IFAZR3GSGhJGdAAceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60428641"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="60428641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:48:17 -0700
X-CSE-ConnectionGUID: ohGU9lnrT2SeP7iYsxwaug==
X-CSE-MsgGUID: DXBe67qPTEiX0SteRZ6zXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="178893611"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:48:16 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v1] accel/ivpu: Ensure rpm_runtime_put in case of engine
 reset/resume fail
Date: Tue, 16 Sep 2025 10:48:09 +0200
Message-ID: <20250916084809.850073-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Previously, aborting work could return early after engine reset or resume
failure, skipping the necessary runtime_put cleanup leaving the device
with incorrect reference count breaking runtime power management state.

Replace early returns with goto statements to ensure runtime_put is always
executed.

Fixes: a47e36dc5d90 ("accel/ivpu: Trigger device recovery on engine reset/resume failure")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
v0 -> v1:
Added 'Fixes:' tag.
---
 drivers/accel/ivpu/ivpu_job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 521b7ac6e35e..044268d0fc87 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -1050,7 +1050,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
 		if (ivpu_jsm_reset_engine(vdev, 0))
-			return;
+			goto runtime_put;
 
 	mutex_lock(&vdev->context_list_lock);
 	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
@@ -1074,7 +1074,7 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 		goto runtime_put;
 
 	if (ivpu_jsm_hws_resume_engine(vdev, 0))
-		return;
+		goto runtime_put;
 	/*
 	 * In hardware scheduling mode NPU already has stopped processing jobs
 	 * and won't send us any further notifications, thus we have to free job related resources
-- 
2.43.0

