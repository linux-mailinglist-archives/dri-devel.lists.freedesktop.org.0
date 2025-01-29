Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07C3A21D65
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2499610E7F3;
	Wed, 29 Jan 2025 13:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZRxLlmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22E010E7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155599; x=1769691599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aFl9pp6nxwxHMN2o2eE8CddPNd7mkAh8rT2SwnGyT8o=;
 b=MZRxLlmn7Qdlalrhm+n9FGDBlTvku14S7OIMt9veHJwVaswNaVXxZcO0
 F9KEPNsCzaxl44vXgMSHpPR3cmTX2BfI/fSKNDmHTXUPBmI1zWkTiAPC8
 9yo98NMS53VpAQ60FU1KFQDCI/uUuamtQ5vMHVAFR6T8xAyR2ST9JHm28
 QYa/JyOIGCWuKP3SF1GclNyzreJSyVTRRAESbIxRqNS4JZPvo04amyDdg
 kFzlP4CnCoiC9HWmb58X3r5EelwsZfNl2+U3+9IWFulxrQjmHtroD+r1u
 Z9bxpR1CKBdvS1OhCiy9m7B/2Zzrson3XC1WVAuua8rXC04zjv9FrPlRA Q==;
X-CSE-ConnectionGUID: alztp4QLSKuDgjukmve0aA==
X-CSE-MsgGUID: gzcfP0r1TyeyVQmPX/hUTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080754"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:58 -0800
X-CSE-ConnectionGUID: GSnnaCqxRBurBD6lum3xDA==
X-CSE-MsgGUID: bv2mvmleQvKvKzYPOpdNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109937349"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:44 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 3/6] accel/ivpu: Fix missing MMU events if file_priv is unbound
Date: Wed, 29 Jan 2025 13:56:33 +0100
Message-ID: <20250129125636.1047413-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Move the ivpu_mmu_discard_events() function to the common portion of
the abort work function. This ensures it is called only once, even if
there are no faulty contexts in context_xa, to guarantee that MMU events
are discarded and new events are not missed.

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3c162ac41a1dc..c1013f511efa6 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -375,7 +375,6 @@ void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
 		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
 
 	ivpu_mmu_disable_ssid_events(vdev, file_priv->ctx.id);
-	ivpu_mmu_discard_events(vdev);
 
 	file_priv->aborted = true;
 }
@@ -980,6 +979,13 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
 	}
 	mutex_unlock(&vdev->context_list_lock);
 
+	/*
+	 * We will not receive new MMU event interrupts until existing events are discarded
+	 * however, we want to discard these events only after aborting the faulty context
+	 * to avoid generating new faults from that context
+	 */
+	ivpu_mmu_discard_events(vdev);
+
 	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
 		return;
 
-- 
2.45.1

