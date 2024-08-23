Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0B95CD45
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350EC10E773;
	Fri, 23 Aug 2024 13:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTZFdPgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA03910E791;
 Fri, 23 Aug 2024 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418602; x=1755954602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZXagvd9a/iXlh5duGIJn7XPRJeVbbKXDz7sy800Ifs=;
 b=VTZFdPgLQS2rC275po5UoX/Exufod/Vdc1J5ANcGRjgGLHhzpFH7CUGd
 GnvNtJ0PIFvoX1myb7UHRLHIoHcEuYgFy166DCmxDcDdGaw0UCNAfGOMA
 FqBiKPncUk516PZVABTeUFAjkNPID8jXHtYFYo9bg/K3BhcZNFih6axzh
 45TCblhDRGsARdaqYNQ6aEfeJHRMRGsfc6u+IcSRQrE4tbyCb+tO3aqIo
 ISqa4KPEOEPZy8ZNqXOzvpUhhyNiyi0KgyXQVXmVCsB14SqpopG28AtDQ
 yCpqGnNSGoaKhWH8fcTOwep+jDCHrAsY5sneXiT+T9TDnaAxr3Sn4tqEc A==;
X-CSE-ConnectionGUID: GFtrMnUFTwSxggLoZ2t8uA==
X-CSE-MsgGUID: ZiGsqURTRkSj5qj5ysf6gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22483327"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22483327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:02 -0700
X-CSE-ConnectionGUID: 3gNkFhfYTRaoiKpOmn23nw==
X-CSE-MsgGUID: Q4DF+EcSQJ+sbOV/AG3HdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66614421"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:09:59 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 08/15] drm/i915/gt: Remove cslices mask value from the CCS
 structure
Date: Fri, 23 Aug 2024 15:08:48 +0200
Message-ID: <20240823130855.72436-9-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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

Following the decision to manage CCS engine creation within UABI
engines, the "cslices" variable in the "ccs" structure in the
"gt" is no longer needed. Remove it is now redundant.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h    | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index a6c33b471567..fc8a23fc28b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -9,7 +9,7 @@
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
-	unsigned long cslices_mask = gt->ccs.cslices;
+	unsigned long cslices_mask = CCS_MASK(gt);
 	u32 mode_val = 0;
 	/* CCS engine id, i.e. the engines position in the engine's bitmask */
 	int engine;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 9e257f34d05b..71e43071da0b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -218,11 +218,6 @@ struct intel_gt {
 	 * i.e. how the CCS streams are distributed amongs the slices.
 	 */
 	struct {
-		/*
-		 * Mask of the non fused CCS slices
-		 * to be used for the load balancing
-		 */
-		intel_engine_mask_t cslices;
 		u32 mode_reg_val;
 	} ccs;
 
-- 
2.45.2

