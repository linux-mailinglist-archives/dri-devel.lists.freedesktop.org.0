Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921459915A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2552F10E974;
	Thu, 18 Aug 2022 23:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09CA10E1BA;
 Thu, 18 Aug 2022 23:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866150; x=1692402150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdvGhzM3R9uJ3bHUy5thnOPa3WE2pXq3FwmmT50JPIQ=;
 b=ik6eq8ja1l4LtvebjSP/bpN9+vlvk0i3Px29+zwqxHlF8UwM+YDP4iqv
 1zqILwZ60Gvoi0X3/YvOOqluLfl2l/OV/Fjl/c8zBRxYf1b1og5K/sCYz
 TlH9OyQABbKVjBn+n169KXqqeN2nPReqAyjmfQfFSzaRXuImqiORMh2NS
 RKyj3bPTUL0L1h55MwfZiDy+s7+pVSkK0ONBNjo4CU5y4O8tsvtfAtVOe
 FuvH0lXNIaaYFjFvKof4m+Q0tccLg9G4PTtVhji/0xiQM9hYTfS5vCv1o
 d8v9b3oUhTjzt7Q5S+RyE+dge5poUAsREJzo3et0PZ50/kIgaJbDmumrB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938512"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938512"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953286"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/21] drm/i915/mtl: MMIO range is now 4MB
Date: Thu, 18 Aug 2022 16:41:44 -0700
Message-Id: <20220818234202.451742-4-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Previously only dgfx platforms had a 4MB MMIO range, but starting with
MTL we now use the larger range for all platforms.

Bspec: 63834, 63830
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index a852c471d1b3..e0a8a8cb2052 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2232,14 +2232,15 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 	 * clobbering the GTT which we want ioremap_wc instead. Fortunately,
 	 * the register BAR remains the same size for all the earlier
 	 * generations up to Ironlake.
-	 * For dgfx chips register range is expanded to 4MB.
+	 * For dgfx chips register range is expanded to 4MB, and this larger
+	 * range is also used for integrated gpus beginning with Meteor Lake.
 	 */
-	if (GRAPHICS_VER(i915) < 5)
-		mmio_size = 512 * 1024;
-	else if (IS_DGFX(i915))
+	if (IS_DGFX(i915) || GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
 		mmio_size = 4 * 1024 * 1024;
-	else
+	else if (GRAPHICS_VER(i915) >= 5)
 		mmio_size = 2 * 1024 * 1024;
+	else
+		mmio_size = 512 * 1024;
 
 	uncore->regs = ioremap(phys_addr, mmio_size);
 	if (uncore->regs == NULL) {
-- 
2.25.1

