Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C2F47C840
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 21:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB42112AD0;
	Tue, 21 Dec 2021 20:29:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D81112B01;
 Tue, 21 Dec 2021 20:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640118568; x=1671654568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESzrR2C4+DN/vxE4MYel6qGJLGlvLdhOSJgN8+Dtng8=;
 b=hCG4zKKcrIb81ADHvIfG4FDpVEwJfrliA5uZlnGg+PnKVEuF5ItZpmBO
 7X7M24UVOySEe1RTpQzqSo5tYeM5DI5phBAoiFrKmv61wwSYJz9BrJ9fc
 Jv8Y7iVnZra6axH9PQvmbsyrN6Dk0ILycGs3hnZ6M52h/cA2rJmtII/tO
 lzECtqteVGal2EP6u/aSBlcaahETRrH7pe96DPFpJGAlOeKGwuck0yrnJ
 cZgcdExWxNKqsJr9P/vDfVnsBzELOAsXqYguBtpTBsWOfTjB7Q4/DNFyI
 57sqU3e1t7n07SXzzX6UZOQP3noqIZcm+nNpF3HSJomJ+9amILz+ef36f Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227782075"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="227782075"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 12:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="607182368"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2021 12:29:03 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Temporarily bump the GuC load timeout
Date: Tue, 21 Dec 2021 12:29:00 -0800
Message-Id: <20211221202902.1395588-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221202902.1395588-1-John.C.Harrison@Intel.com>
References: <20211221202902.1395588-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a known (but exceedingly unlikely) race condition where the
asynchronous frequency management code could reduce the GT clock while
a GuC reload is in progress (during a full GT reset). A fix is in
progress but there are complex locking issues to be resolved. In the
meantime bump the timeout to 200ms. Even at slowest clock, this
should be sufficient. And in the working case, a larger timeout makes
no difference.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 31420ce1ce6b..d09c205b2beb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -105,12 +105,21 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	/*
 	 * Wait for the GuC to start up.
 	 * NB: Docs recommend not using the interrupt for completion.
-	 * Measurements indicate this should take no more than 20ms, so a
+	 * Measurements indicate this should take no more than 20ms
+	 * (assuming the GT clock is at maximum frequency). So, a
 	 * timeout here indicates that the GuC has failed and is unusable.
 	 * (Higher levels of the driver may decide to reset the GuC and
 	 * attempt the ucode load again if this happens.)
+	 *
+	 * FIXME: There is a known (but exceedingly unlikely) race condition
+	 * where the asynchronous frequency management code could reduce
+	 * the GT clock while a GuC reload is in progress (during a full
+	 * GT reset). A fix is in progress but there are complex locking
+	 * issues to be resolved. In the meantime bump the timeout to
+	 * 200ms. Even at slowest clock, this should be sufficient. And
+	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = wait_for(guc_ready(uncore, &status), 100);
+	ret = wait_for(guc_ready(uncore, &status), 200);
 	if (ret) {
 		struct drm_device *drm = &uncore->i915->drm;
 
-- 
2.25.1

