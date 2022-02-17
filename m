Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9D4BAD83
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B478B10E928;
	Thu, 17 Feb 2022 23:52:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591B10E8C0;
 Thu, 17 Feb 2022 23:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645141930; x=1676677930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3v5+pBjetguZklbetmNoX7H+ve3nESGp26QGx0hCrw8=;
 b=KQE8c4H/Wg11iOWYNoAJPAroq+adS6DZQ1Bj+xCzv1texN2WtVNrKYhq
 CwGQh5J3khI5+J2W9t62RCKRnTtNokvdrBh2qo83sMH5ptl2oMAO+Conp
 S3nGQ3TRPsNvXu1+HH7zOFT5mVIcwTjUqR9qhdmy7wnHaC9zAn1usYCxp
 lvdQkw9jq2c66ffmmmpO1dXoYpCG/Dqm1OBhM5x7eM/xuy3IMVNJs6SDx
 FqgodpXev+9jwEkUrCeD6ugQGgwFCXwRpLGBupg7DpTvLkH9KnkNIoMs0
 hZ9e2qAO9q5NQ5jD+f9XStUHpLpTX4kEJw/Q9OUFpAHPfTTqV4ulfrKZO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311749005"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="311749005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 15:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="545964450"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 15:52:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 8/8] drm/i915/guc: Fix potential invalid pointer dereferences
 when decoding G2Hs
Date: Thu, 17 Feb 2022 15:52:07 -0800
Message-Id: <20220217235207.930153-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217235207.930153-1-John.C.Harrison@Intel.com>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
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

Some G2H handlers were reading the context id field from the payload
before checking the payload met the minimum length required.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b70b1ff46418..ea17dca68674 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3895,12 +3895,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 					  u32 len)
 {
 	struct intel_context *ce;
-	u32 ctx_id = msg[0];
+	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
+	ctx_id = msg[0];
 
 	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
@@ -3946,12 +3947,13 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 {
 	struct intel_context *ce;
 	unsigned long flags;
-	u32 ctx_id = msg[0];
+	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
 		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
 		return -EPROTO;
 	}
+	ctx_id = msg[0];
 
 	ce = g2h_context_lookup(guc, ctx_id);
 	if (unlikely(!ce))
-- 
2.25.1

