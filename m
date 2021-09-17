Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F440FDAE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41EE6EE4F;
	Fri, 17 Sep 2021 16:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1866EE49;
 Fri, 17 Sep 2021 16:14:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="209917778"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="209917778"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="530886226"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, matthew.d.roper@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/2] drm/i915: Check SFC fusing before recording/dumping
 SFC_DONE
Date: Fri, 17 Sep 2021 09:14:07 -0700
Message-Id: <20210917161407.812335-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917161407.812335-1-matthew.d.roper@intel.com>
References: <20210917161407.812335-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Xe_HP and beyond the SFC unit may be fused off, even if the
corresponding media engines are present.  Check the SFC-specific fusing
before trying to dump the SFC_DONE instances.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index b9f66dbd46bb..2a2d7643b551 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -753,7 +753,8 @@ static void err_print_gt(struct drm_i915_error_state_buf *m,
 			 * only exists if the corresponding VCS engine is
 			 * present.
 			 */
-			if (!HAS_ENGINE(gt->_gt, _VCS(i * 2)))
+			if ((gt->_gt->info.sfc_mask & BIT(i)) == 0 ||
+			    !HAS_ENGINE(gt->_gt, _VCS(i * 2)))
 				continue;
 
 			err_printf(m, "  SFC_DONE[%d]: 0x%08x\n", i,
@@ -1632,7 +1633,8 @@ static void gt_record_regs(struct intel_gt_coredump *gt)
 			 * only exists if the corresponding VCS engine is
 			 * present.
 			 */
-			if (!HAS_ENGINE(gt->_gt, _VCS(i * 2)))
+			if ((gt->_gt->info.sfc_mask & BIT(i)) == 0 ||
+			    !HAS_ENGINE(gt->_gt, _VCS(i * 2)))
 				continue;
 
 			gt->sfc_done[i] =
-- 
2.33.0

