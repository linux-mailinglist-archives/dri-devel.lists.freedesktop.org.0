Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DDBAB8312
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E99510E1D3;
	Thu, 15 May 2025 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTdMXQoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4610E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747302089; x=1778838089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oc9q8630Fb+uduiqTYszuY7m3DLcjau3kFFcH3sUqwM=;
 b=cTdMXQoYScq0Gyv0lCuPJEpty2JNU/affnVqKVSePl810HCB91Hhg1X5
 lC5b/EAauJLVRDPPFBO/EDZU/gZarKxn9vkw/wNPqnGzROVDwYm8yBSfi
 u4BqHh25VPRtW6ObcEapVV+eEWGuTW01cDf7GUtK99i8o3olCbf2xutTN
 4U/zF+/XDAZV43Jvwe458Vayrbiexnx74qNl3jlrFBOtI2UTmiBlszIcm
 FfyymOaLBN2xirt0lJGWeHvaKmB/2/eiHoqwTKx0K/yYZRcN6P9DJzXRX
 iu592ZA2kYUBMDA9KS95NnGRKLYPV81SoSwSgJ8lTCQ8oUAK6t8mMYRkO Q==;
X-CSE-ConnectionGUID: VZkZmUg3RzWuOzxWVwXjbA==
X-CSE-MsgGUID: lQmAVHGHQU6rxvGE1funWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49388997"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="49388997"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:41:28 -0700
X-CSE-ConnectionGUID: YYFg8TUhRl6HfZU89WnIeA==
X-CSE-MsgGUID: w/qNDBzcRSeU5CP74LnSaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138815861"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:41:26 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] accel/ivpu: Reorder Doorbell Unregister and Command Queue
 Destruction
Date: Thu, 15 May 2025 11:41:24 +0200
Message-ID: <20250515094124.255141-1-jacek.lawrynowicz@linux.intel.com>
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

Refactor ivpu_cmdq_unregister() to ensure the doorbell is unregistered
before destroying the command queue. The NPU firmware requires doorbells
to be unregistered prior to command queue destruction.

If doorbell remains registered when command queue destroy command is sent
firmware will automatically unregister the doorbell, making subsequent
unregister attempts no-operations (NOPs).

Ensure compliance with firmware expectations by moving the doorbell
unregister call ahead of the command queue destruction logic,
thus preventing unnecessary NOP operation.

Fixes: 465a3914b254 ("accel/ivpu: Add API for command queue create/destroy/submit")
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index b28da35c30b67..1c8e283ad9854 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -247,6 +247,10 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
 	if (!cmdq->db_id)
 		return 0;
 
+	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
+	if (!ret)
+		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
+
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->id);
 		if (!ret)
@@ -254,10 +258,6 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
 				 cmdq->id, file_priv->ctx.id);
 	}
 
-	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
-	if (!ret)
-		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
-
 	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	cmdq->db_id = 0;
 
-- 
2.45.1

