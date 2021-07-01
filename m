Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7533B978D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086396EC4C;
	Thu,  1 Jul 2021 20:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E416EC23;
 Thu,  1 Jul 2021 20:25:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436151"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564411"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/53] drm/i915/xehp: VDBOX/VEBOX fusing registers are
 enable-based
Date: Thu,  1 Jul 2021 13:23:38 -0700
Message-Id: <20210701202427.1547543-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On Xe_HP the fusing register is renamed and changed to have the "enable"
semantics, but otherwise remains compatible (mmio address, bitmask
ranges) with older platforms.

To simplify things we do not add a new register definition but just stop
inverting the fusing masks before processing them.

Bspec: 33288
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 88694822716a..151870d8fdd3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -468,7 +468,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	if (GRAPHICS_VER(i915) < 11)
 		return info->engine_mask;
 
-	media_fuse = ~intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
+	/*
+	 * On newer platforms the fusing register is called 'enable' and has
+	 * enable semantics, while on older platforms it is called 'disable'
+	 * and bits have disable semantices.
+	 */
+	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
+	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+		media_fuse = ~media_fuse;
 
 	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
 	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
-- 
2.25.4

