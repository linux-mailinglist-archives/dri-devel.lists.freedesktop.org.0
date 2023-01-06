Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8865FF0D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFDA10E85C;
	Fri,  6 Jan 2023 10:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0A410E85B;
 Fri,  6 Jan 2023 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673001527; x=1704537527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RXEOTWGJesZYNwY1dLKYW7Mjw/ctUqOL/IDqKg4sjE0=;
 b=QYa97EhsRpEIbzMJwjb9iGJwkt66oRvmKX//qk8bWo875cXq8USXg5LO
 fpNDTE12z5uqyoPopURSgTfnGXnOFZqJ8k4MK3r2sRcuKMes1J8KcnGAi
 L9DcCoVcm0PuDL6vR6nQD+NP0xkABF7xdA/d7wCZV+p9aCm9U9pwL3V3q
 dxkmHChEryfao2Bl9ZuwK33RCYRIqaMiN5pzLn21EM+U3gfC6rRDdVu/w
 S08nUNfwBPXVnUOVG4DYAK7NSG1eyuYij2xn+GNMmgLyNuHoZdBgPiqqk
 SyjbmorCKgbFgMxYi2z+onGvN25eRew2F/SDAF6jmypG1O6bSxhDeOv4Z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="310242588"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="310242588"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 02:38:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="901250693"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="901250693"
Received: from mjervis-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 02:38:44 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Do not cover all future platforms in TLB
 invalidation
Date: Fri,  6 Jan 2023 10:38:35 +0000
Message-Id: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Revert to the original explicit approach and document the reasoning
behind it.

v2:
 * DG2 needs to be covered too. (Matt)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
---
Matt, does DG1 need to be in the MCR branch or plain Gen12?
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7eeee5a7cb33..b2556a3d8a3f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1070,7 +1070,19 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 	unsigned int num = 0;
 	unsigned long flags;
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	/*
+	 * New platforms should not be added with catch-all-newer (>=)
+	 * condition so that any later platform added triggers the below warning
+	 * and in turn mandates a human cross-check of whether the invalidation
+	 * flows have compatible semantics.
+	 *
+	 * For instance with the 11.00 -> 12.00 transition three out of five
+	 * respective engine registers were moved to masked type. Then after the
+	 * 12.00 -> 12.50 transition multi cast handling is required too.
+	 */
+
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
+	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
 		regs = NULL;
 		num = ARRAY_SIZE(xehp_regs);
 	} else if (GRAPHICS_VER(i915) == 12) {
-- 
2.34.1

