Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EBC663F49
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 12:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26CF10E5A2;
	Tue, 10 Jan 2023 11:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4294F10E5A0;
 Tue, 10 Jan 2023 11:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673350547; x=1704886547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NkYnLTAJj/tzOIV/Zb+sAUOE5OSyd2MqX9s6BRrI5PU=;
 b=UCnHLL4upYF3Hkh6yCgxW/uyycy7T8QSWRXU83WuR+nrZ0KHaWPjf3fQ
 foehtE0peM8im/QBT+su6hWoSW5IqqUZ4ZTL1Cg3O+sr7XcBXYQIg4gBg
 8IhjdlaDTn9yx02kQpRegI2jFQ6pfnQw6rnIbdxW40zST1IZ3TQVJ2Gws
 QHkvPB3V1/0kFA1QEi8//eHQMqB4b1Ey9F1ZfBi8z9GtOgctGii/h26Lg
 7mDCoXfTGieMlyjEzq3zO+EmxN9ppnTlcDnUIHt8S+GA5GtcgUPx5OxtZ
 whJQvF58AzAzhYlY6+D4JaA8k6f11W6VyRf7C3f1JggC/dKgk0nzcUZVN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302822264"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="302822264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 03:35:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="745745930"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="745745930"
Received: from gregoire-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.88.71])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 03:35:45 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/i915: Do not cover all future platforms in TLB
 invalidation
Date: Tue, 10 Jan 2023 11:35:33 +0000
Message-Id: <20230110113533.744436-1-tvrtko.ursulin@linux.intel.com>
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

v3:
 * Full version check for Gen12 to avoid catching all future platforms.
   (Matt)

v4:
 * Be totally explicit on the Gen12 branch. (Andrzej)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7eeee5a7cb33..5721bf85d119 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct intel_gt *gt)
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
+	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
+	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
 		regs = NULL;
 		num = ARRAY_SIZE(xehp_regs);
-	} else if (GRAPHICS_VER(i915) == 12) {
+	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
+		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
 		regs = gen12_regs;
 		num = ARRAY_SIZE(gen12_regs);
 	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
-- 
2.34.1

