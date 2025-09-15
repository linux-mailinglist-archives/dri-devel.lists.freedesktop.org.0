Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFFB5767A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9F010E41F;
	Mon, 15 Sep 2025 10:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jf504IKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523CD10E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932468; x=1789468468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OqRgzM4Zwn0h2gxnCRN2Zzizue7y+1mMBb/8Iw3Yih0=;
 b=Jf504IKoR2X08hcPyrFrhRKKygLekNlk7IM/DKB6r66nN6x64ntnLD58
 IwsYmBiKZ7YkfYpBWcu5a2nvDCXKcBvlVJCezm0xa1u/pg6ZgspwcuUsS
 6d2bLssOSwIOaTSobuYiX3vv322zU9tCgMU7YLjhCoeFBR4xTaMvQyqJS
 nLG9JRur7iB9jKTc42+VGxUFW68iHV1L0GcRGtLSFRMCYprP6D51AHMUe
 03nxWzMb04EIrsxrpWbR+tBQuIvFDWsOhWKPbqW9tp9upz1ZVasXea4IK
 FVOW6dEm5A/Etn6boKIvLZIM0YnK+HTOuTZU5bz8Ry4oAyQzI45qaGwkM w==;
X-CSE-ConnectionGUID: Gkc5aV8nTbC4ykSCZarixg==
X-CSE-MsgGUID: NFXWangJTO2TrikghyL4MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77632770"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77632770"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:28 -0700
X-CSE-ConnectionGUID: nrQInxR6QOK2y8qH2j0ZLA==
X-CSE-MsgGUID: wc9+EhvvQKSUn1gHUHWDFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174186948"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:34:26 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Reset cmdq->db_id on register failure
Date: Mon, 15 Sep 2025 12:34:21 +0200
Message-ID: <20250915103421.830065-1-karol.wachowski@linux.intel.com>
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

Ensure that cmdq->db_id is reset to 0 if ivpu_jsm_register_db fails,
preventing potential reuse of invalid command queue with
unregistered doorbell.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 060f1fc031d3..fa1720fa06a4 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -219,11 +219,13 @@ static int ivpu_register_db(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *
 		ret = ivpu_jsm_register_db(vdev, file_priv->ctx.id, cmdq->db_id,
 					   cmdq->mem->vpu_addr, ivpu_bo_size(cmdq->mem));
 
-	if (!ret)
+	if (!ret) {
 		ivpu_dbg(vdev, JOB, "DB %d registered to cmdq %d ctx %d priority %d\n",
 			 cmdq->db_id, cmdq->id, file_priv->ctx.id, cmdq->priority);
-	else
+	} else {
 		xa_erase(&vdev->db_xa, cmdq->db_id);
+		cmdq->db_id = 0;
+	}
 
 	return ret;
 }
-- 
2.43.0

