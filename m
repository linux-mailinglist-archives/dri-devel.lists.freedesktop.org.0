Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 295424ACED9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A632E10E44F;
	Tue,  8 Feb 2022 02:21:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CFE10E4D0;
 Tue,  8 Feb 2022 02:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644286856; x=1675822856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGH8r5WHeuiHn0GrW+7tN4Rue9sNZO/N5pcyVey5Nrw=;
 b=NSbBQUavt0KdOH7d8pL8/9CNYrnx8g+zMhhq8vdQjy8CReR7hsRm4v2N
 ynRpnwnGRHdbP+fZJkrcyPGGFZzyxLjrwqXU0ABrR71iVuv7e6LVvId4Y
 jPOnxeVwcnvaUJ8hrrNJl9WKSR+yXXQmhXYw/wpwgPksqnOripPljW2LO
 FfETMY7NkPf/H1gAwr26GNnGCZMGxPugbNrkqgmUOgkg9o9dpmGDVMQ/K
 JCy4gghGSa/DYx1O6D3EK5QmA/McWb7Yum69NB4BD+Fqp2rxFO2zrmx9E
 k0OcN3OLK1BZXGOS9zn1V5PE0xVakqMLVDmQdLW7vlAnojKyG1uIJSm83 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335257347"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="335257347"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 18:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677960811"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 18:20:55 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 8/8] drm/i915/guc: Fix potential invalid pointer dereferences
 when decoding G2Hs
Date: Mon,  7 Feb 2022 18:20:54 -0800
Message-Id: <20220208022054.2143332-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208022054.2143332-1-John.C.Harrison@Intel.com>
References: <20220208022054.2143332-1-John.C.Harrison@Intel.com>
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
index 7e19b453981d..7081586dc24a 100644
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

