Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B435847B696
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 01:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4259A10E2EE;
	Tue, 21 Dec 2021 00:52:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B010E2A2;
 Tue, 21 Dec 2021 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640047942; x=1671583942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwM6+/4Tbeubh9FsNBjILnWryi9IyY2D2LlTrWj1Ggg=;
 b=mqgM5jcSEXm13TDDp3u1upsomTgjWxwwQoUd+n5UBZofu+AoteadOS1h
 cBKOWT8vPeMovz6JpeDUu16fq6eb3Vep9ukTr1/dyGFf/+KwBy0TXklfM
 sfY9U4pbMLJtPz0bPM2dmCzWIka6TaHHtlLcwQII7P+qCxNvFOc/oTceJ
 lb7S4FIUmNJC1t1qaU7MKqvzR3hOlfn/bziDE5wkf7SH3zHJP8fiuUoR5
 hveDCrlaXBpY06rjSESKY4Pm4LfoagbSFr0und4ivv8s8GOKtg/WP7kY/
 ht40JpOQayAbSohyRXXIeUx21zXx9nokjvE0UhqVYgPHLu8XMr0aK+2U6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264483624"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="264483624"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 16:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="547739318"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 16:52:21 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Temporarily bump the GuC load timeout
Date: Mon, 20 Dec 2021 16:52:19 -0800
Message-Id: <20211221005221.1090824-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
References: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a known (but exceedingly unlikely) race condition where the
asynchronous frequency management code could reduce the GT clock while
a GuC reload is in progress (during a full GT reset). A fix is in
progress but there are complex locking issues to be resolved. In the
meantime bump the timeout to 500ms. Even at slowest clock, this
should be sufficient. And in the working case, a larger timeout makes
no difference.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 31420ce1ce6b..c03bde5ec61f 100644
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
+	 * 500ms. Even at slowest clock, this should be sufficient. And
+	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = wait_for(guc_ready(uncore, &status), 100);
+	ret = wait_for(guc_ready(uncore, &status), 500);
 	if (ret) {
 		struct drm_device *drm = &uncore->i915->drm;
 
-- 
2.25.1

