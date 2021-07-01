Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115CB3B9769
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16546EBF6;
	Thu,  1 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B46EB9A;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998667"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564518"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 39/53] drm/i915/dg2: Don't program BW_BUDDY registers
Date: Thu,  1 Jul 2021 13:24:13 -0700
Message-Id: <20210701202427.1547543-40-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although the BW_BUDDY registers still exist, they are not used for
anything on DG2.  This change is expected to hold true for future dgpu's
too.

Bspec: 49218
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index c34ff0947b85..df6358638fee 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -5814,6 +5814,10 @@ static void tgl_bw_buddy_init(struct drm_i915_private *dev_priv)
 	unsigned long abox_mask = INTEL_INFO(dev_priv)->abox_mask;
 	int config, i;
 
+	/* BW_BUDDY registers are not used on dgpu's beyond DG1 */
+	if (IS_DGFX(dev_priv) && !IS_DG1(dev_priv))
+		return;
+
 	if (IS_ALDERLAKE_S(dev_priv) ||
 	    IS_DG1_REVID(dev_priv, DG1_REVID_A0, DG1_REVID_A0) ||
 	    IS_TGL_DISPLAY_STEP(dev_priv, STEP_A0, STEP_B0))
-- 
2.25.4

