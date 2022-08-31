Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B785A887C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696410E503;
	Wed, 31 Aug 2022 21:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D2D10E4FD;
 Wed, 31 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982633; x=1693518633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzjBVMVGZoC9kAo77GOhyIaNIkMhaEzxU8ALVwJklIg=;
 b=WVWQ/ueh31fflFVXQN7PO8DV7Ahv3yFjX7zMjmZCFksaDwZkBEPqUzBL
 zPzCELWSZBWqcRxg9mfww6M7bfY9aaRY+69W0AcNhkcTpCCH9b1YJuqOT
 2VDHQ/WrVuqxblObQ/U4jHz2VjQpdCXIut/vH1KJRLK8H1aiiJkK6S1V2
 6uE1n3kADOBFL8ANNmW5/FOGjs3FPBeQ5yED4kwScI5VXuPApjmo8K1A0
 D/0w7rA1it2xzCp5pf0xqpAsNXaTdLiu9/953ntUaqbweW+ewHtC9vjZA
 +OdNnEk3+GQCHqhfw15zjwASFaTLt1CJb1y77u25SlfHxjxNzt8BLPQiG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="357270169"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="357270169"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586248"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:32 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 11/11] drm/i915/mtl: Do not update GV point, mask value
Date: Wed, 31 Aug 2022 14:49:58 -0700
Message-Id: <20220831214958.109753-12-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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

Display 14 and future platforms do not directly communicate to Pcode
via mailbox the SAGV bandwidth information. PM Demand registers are
used to communicate display power requirements to the PUnit which would
include GV point and mask value.

Skip programming GV point and mask values through legacy pcode mailbox
interface.

Bspec: 64636
Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index b19a1ecb010e..69efd613bbde 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3923,6 +3923,14 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
 
+	/*
+	 * No need to update mask value/restrict because
+	 * "Pcode only wants to use GV bandwidth value, not the mask value."
+	 * for DISPLAY_VER() >= 14.
+	 */
+	if (DISPLAY_VER(i915) >= 14)
+		return;
+
 	/*
 	 * Just return if we can't control SAGV or don't have it.
 	 * This is different from situation when we have SAGV but just can't
@@ -3943,6 +3951,16 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 {
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
 
+	/*
+	 * No need to update mask value/restrict because
+	 * "Pcode only wants to use GV bandwidth value, not the mask value."
+	 * for DISPLAY_VER() >= 14.
+	 *
+	 * GV bandwidth will be set by intel_pmdemand_post_plane_update()
+	 */
+	if (DISPLAY_VER(i915) >= 14)
+		return;
+
 	/*
 	 * Just return if we can't control SAGV or don't have it.
 	 * This is different from situation when we have SAGV but just can't
-- 
2.25.1

