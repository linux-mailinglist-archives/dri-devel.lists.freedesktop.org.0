Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E2ACE1BC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241CA10E6F9;
	Wed,  4 Jun 2025 15:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIZruoaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559ED10E6F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749051993; x=1780587993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TahMS2nYR6iSPLbgqLP6zvDTn7BeBxi5+rhYueug0FM=;
 b=AIZruoaIqSFxnxqCAVg4Wb6pdF/eQWfUKH8rjVr9XwagtlImn4gM9J0+
 ZktC0TLUsuHkAWMJcoeckOIH2PWFzcSZE0eYP2ARqVTrF0eHH7D+z+B/X
 9mO9+8UHSXMIoxqj9nLTHKK8rJHzijjCVIwc2/cbffj3I2WlJEEYAu6yD
 tpwQJh/Ol760Q27bvBM1QWXIF+HcQaNolhodDKATXLD4FOMZXI1qGBOpt
 lkc2+grG7hAj7UFMN3lkzvbnEkwbRp/FowmyNWhcVM5csb9Ao2BOAJ/TK
 Jg3cQtM6WGEBZuib/8et7XLOy8oRDbgL1lZ2e6jmH2o08KKxcKyEEEF3l w==;
X-CSE-ConnectionGUID: 7sfPq1s/RiO4Pb4cpovweA==
X-CSE-MsgGUID: umipF3N2S6+BRSmpDKg5aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50382811"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50382811"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:46:32 -0700
X-CSE-ConnectionGUID: kgO7b8eyQNyBso+8SygNDw==
X-CSE-MsgGUID: UeyxVk9lQFSWJr9/LOGkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145718182"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:46:30 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 jacek.lawrynowicz@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>, stable@vger.kernel.org,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Reorder doorbell unregister and command queue
 destruction
Date: Wed,  4 Jun 2025 17:44:50 +0200
Message-ID: <20250604154450.1209596-1-maciej.falkowski@linux.intel.com>
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

Fixes: 2a18ceff9482 ("accel/ivpu: Implement support for hardware scheduler")
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index bd351dd46d6b..060f1fc031d3 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -271,6 +271,10 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
 	if (!cmdq->db_id)
 		return 0;
 
+	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
+	if (!ret)
+		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
+
 	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
 		ret = ivpu_jsm_hws_destroy_cmdq(vdev, file_priv->ctx.id, cmdq->id);
 		if (!ret)
@@ -278,10 +282,6 @@ static int ivpu_cmdq_unregister(struct ivpu_file_priv *file_priv, struct ivpu_cm
 				 cmdq->id, file_priv->ctx.id);
 	}
 
-	ret = ivpu_jsm_unregister_db(vdev, cmdq->db_id);
-	if (!ret)
-		ivpu_dbg(vdev, JOB, "DB %d unregistered\n", cmdq->db_id);
-
 	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	cmdq->db_id = 0;
 
-- 
2.43.0

