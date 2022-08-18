Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42459915D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86110EA0C;
	Thu, 18 Aug 2022 23:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1A310E62B;
 Thu, 18 Aug 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866153; x=1692402153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=37lE3FD1iHRf26LEpCBliMaodGJ8MIyIAzQNYCyiVEY=;
 b=A0/O04ESkAWhpoJ9VDipqOYSfl4KOmMNrFm33H0VhPI/fRvVm7Bx9qcU
 vUjE5qprOzdVw+mbbgkk1HsdsIotxhRakthqU+qt/JoVq/Dc8uZqbFJT6
 SadG4F7mQd2tm7uWuMdTYh8Os84u+Nev80w+knqCFvV0S/9s04Tao9tS/
 mo97+eaUvAMGNd3CfNsGahk5Y8KBj+gEdHSanCAUFvZX29tonCDfyPmej
 x1DuaiSkLs1snlLj23IO8A7P+XT6/cL+jkCWa1WYLM4irSeknJaaoeEKi
 gRS3EG1Ad37BWRBSjMVczHDzoLGLijl1rPcOPlGLEDSTORRHE+ozgs20g w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938529"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938529"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953306"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 21/21] drm/i915/mtl: Do not update GV point, mask value
Date: Thu, 18 Aug 2022 16:42:02 -0700
Message-Id: <20220818234202.451742-22-radhakrishna.sripada@intel.com>
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

No need to update mask value/restrict because
"Pcode only wants to use GV bandwidth value, not the mask value."
for Display version greater than 14.

Bspec: 646365
Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Caz Yokoyama
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index d09e9e5f4481..47869fe964ba 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3924,6 +3924,14 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
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
@@ -3944,6 +3952,16 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
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

