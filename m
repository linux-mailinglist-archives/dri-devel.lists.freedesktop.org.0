Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF378FB6E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038C10E75B;
	Fri,  1 Sep 2023 09:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91C10E75B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561814; x=1725097814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmMFBl54DGomrl6mUaoAL44XRz4yGBGBl8B2yYFPTN4=;
 b=lOyyRFPHhZEezIBax4rFOVPGF5ABUtaNrpDiXYmwfqcYJWwoEAMC8u20
 pEqRK0ZWx15Lpgud8J/c3AJZcnrzlamxu1Sra4sWp8xYDrdP2N3l6i+fH
 5HG128EFuDSOOBUBoQmBiDBxsRIQDR0E47mOVvUS36PfWlWHEvnETVvyY
 /cOpGlyVXM8EtFhpxyaHq6vk01xtPmb4DoRt0k6yvst65OJzWnFiZF/bT
 RfAqzhJukUsWJ/FEYJnJGsV6V0LhhDvFVlTqpX2w5vYymlMtux33WTSBh
 46xoQyN5tQJdtT3mYm69s0sQFcNrvu3DlaLV77+cM5SJkiZaORJh+N3S1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206900"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206900"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679938"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679938"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:12 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/11] accel/ivpu: Add information about context on failure
Date: Fri,  1 Sep 2023 11:49:50 +0200
Message-Id: <20230901094957.168898-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add additional ctx number to error messages on mmu context
initialization failures.

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 8914e34fb54f..5b48983c7cf8 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -490,13 +490,13 @@ int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context
 
 	ret = ivpu_mmu_context_init(vdev, ctx, ctx_id);
 	if (ret) {
-		ivpu_err(vdev, "Failed to initialize context: %d\n", ret);
+		ivpu_err(vdev, "Failed to initialize context %u: %d\n", ctx_id, ret);
 		return ret;
 	}
 
 	ret = ivpu_mmu_set_pgtable(vdev, ctx_id, &ctx->pgtable);
 	if (ret) {
-		ivpu_err(vdev, "Failed to set page table: %d\n", ret);
+		ivpu_err(vdev, "Failed to set page table for context %u: %d\n", ctx_id, ret);
 		goto err_context_fini;
 	}
 
-- 
2.25.1

