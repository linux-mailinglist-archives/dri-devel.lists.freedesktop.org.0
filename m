Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5739E6509E2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 11:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96E10E21B;
	Mon, 19 Dec 2022 10:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E210E21C;
 Mon, 19 Dec 2022 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671444809; x=1702980809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B62nWMsZIXg2Iq7846E/qXDsSL4x0qI11dTRpOx86ok=;
 b=cKmBGG8ocx7xII3x6NhyCLbI8jmwXp/2Pkywy/lONkptYzXzTBK+FUeA
 LnksGKPbKJmjh7G79OoJf4e5WtOKMrsdjhrfCRZmsatYLqk7xVhGxiiXn
 fiHXcU0JgK38Ktd7cKOdAavZse09u/xy2i5CSLJIw9DIaVtLmV8Bx/qyc
 GHKXIyISP1nk3K8VmIgQAe4vWSbfanUHel+kFnZ8cPIvVKM2kIDugIN+9
 VVI8kICWHHmGVcN1hk7BBsgoge+BGwhGCV1bXAmI86Rx/RPdaSlge9TC2
 bJxTuJoe/x6NtdwNbK5sMsBfzfg+r88fmLPy0MDZGIw1ayW66FZd3N6UF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="383661585"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="383661585"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:13:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="713970041"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="713970041"
Received: from jacahill-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.235.153])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:13:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Do not cover all future platforms in TLB
 invalidation
Date: Mon, 19 Dec 2022 10:13:15 +0000
Message-Id: <20221219101316.168129-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
References: <20221219101316.168129-1-tvrtko.ursulin@linux.intel.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7eeee5a7cb33..854841a731cb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1070,7 +1070,18 @@ static void mmio_invalidate_full(struct intel_gt *gt)
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
+	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50)) {
 		regs = NULL;
 		num = ARRAY_SIZE(xehp_regs);
 	} else if (GRAPHICS_VER(i915) == 12) {
-- 
2.34.1

