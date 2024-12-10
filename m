Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EBA9EB1A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 14:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DF710E8C7;
	Tue, 10 Dec 2024 13:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRRg58lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62910E8C7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733836186; x=1765372186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gcq+X6hIjP+NuICh65wQedWsph1z0FwxkCftGkiyaGo=;
 b=XRRg58lrUYcEKlC8cqHQzywR6vkL9XU2tVrN+vrK5FiUerUMI/SLQ+Rn
 eAVWsEk3exe7IgBcoLkarA3lOj7mgTi3Slxdk1BvS+DyoX2VNZIhJAnSs
 /nTlQg0K2rdeuP4usyuE5FHqrvTsJJk+zLtU41o1PxK8JjJajz1Y2eeei
 SLCmhoxdKwIT8gLW1YOIwghvJnUI1Kyyyk0UmearATCHAWsmABlCB3Pe6
 Xjjqs5BuaB+I2Vqy49qO3742OC8tCmAROgpaFya0xkT43YryZbTOWKYiW
 cOd6Ocax2KrXl2h3YwxyWbcqvXgKC/ZOy1DqR6Lu2i+9nSE3JmVBsVzD2 Q==;
X-CSE-ConnectionGUID: KTh0m5sTT0qbDS1doHgeCQ==
X-CSE-MsgGUID: 9K8Q6EW2SN2MQTXeZY8wLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34080115"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34080115"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:46 -0800
X-CSE-ConnectionGUID: T9a40iDkTdOL2+N6Anbujw==
X-CSE-MsgGUID: /AmFCNpSRnuJxV8bhftcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95242043"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:44 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 2/3] accel/ivpu: Fix memory leak in
 ivpu_mmu_reserved_context_init()
Date: Tue, 10 Dec 2024 14:09:38 +0100
Message-ID: <20241210130939.1575610-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
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

Add appropriate error handling to ensure all allocated resources are
released upon encountering an error.

Fixes: a74f4d991352 ("accel/ivpu: Defer MMU root page table allocation")
Cc: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 891967a95bc3c..0af614dfb6f92 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -612,18 +612,22 @@ int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev)
 	if (!ivpu_mmu_ensure_pgd(vdev, &vdev->rctx.pgtable)) {
 		ivpu_err(vdev, "Failed to allocate root page table for reserved context\n");
 		ret = -ENOMEM;
-		goto unlock;
+		goto err_ctx_fini;
 	}
 
 	ret = ivpu_mmu_cd_set(vdev, vdev->rctx.id, &vdev->rctx.pgtable);
 	if (ret) {
 		ivpu_err(vdev, "Failed to set context descriptor for reserved context\n");
-		goto unlock;
+		goto err_ctx_fini;
 	}
 
-unlock:
 	mutex_unlock(&vdev->rctx.lock);
 	return ret;
+
+err_ctx_fini:
+	mutex_unlock(&vdev->rctx.lock);
+	ivpu_mmu_context_fini(vdev, &vdev->rctx);
+	return ret;
 }
 
 void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev)
-- 
2.45.1

