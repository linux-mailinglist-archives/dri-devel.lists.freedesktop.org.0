Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C69F8720
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3961610EDDE;
	Thu, 19 Dec 2024 21:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVA/pUu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAFD10EDE2;
 Thu, 19 Dec 2024 21:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644137; x=1766180137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wUg75Qsz/5qCmX8kwJhAhXe0Wn/Pi5X+TZMis6dh6RE=;
 b=QVA/pUu/zEEwZKUPK8RKdtwc3/bWxfltUCzdQWZpDKAL8dNTcKT/CV2n
 JkZ0FyZc+vmUL1HghTijmTnXWsSBwkGtrEo7syX2OY3hyFULf3L9GDKGt
 KCMlmzeRxTdVtq4mHC5S+eNATcWZq9lvHT2DM0L35tYogB7G4Oowhkzd1
 iFB7mSAXtLDBoe0kYIkyXi24HsOrBexuCOBBvMSj+V7zYLozKmMNd8qhZ
 PaGKEpuaVYNa1Cr0GmxSqOLYcjZ0biYGSyCevi4wPMno1ku/4wQH9egYB
 ra3kNv8VYYS98u5Ekn0PnYGeCKvz2C/FZXRArCko7P+g5qmZVLqCLtDK8 Q==;
X-CSE-ConnectionGUID: BAZ8rlzMQZyeALqmGgPSDQ==
X-CSE-MsgGUID: tPDJHghOS2m2s9JzOFhCnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52590411"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52590411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:37 -0800
X-CSE-ConnectionGUID: JGyyfWhsT1SYxNP608yDcA==
X-CSE-MsgGUID: NU5yeEn1T2yIek/XriswDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="129146344"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:35:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 15/16] drm/i915/ddi: disable trancoder port select for
 128b/132b SST
Date: Thu, 19 Dec 2024 23:34:04 +0200
Message-Id: <ef870539039a73ab70c70db56d19cba5adc4544b.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1734643485.git.jani.nikula@intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

128b/1232b SST will have mst_master_transcoder set and matching
cpu_transcoder. Ensure disable also for 128b/132b SST.

Co-developed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 37b771f07d59..c74c3ab25589 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -657,6 +657,7 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
 	u32 ctl;
 
 	if (DISPLAY_VER(dev_priv) >= 11)
@@ -676,7 +677,8 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 			 TRANS_DDI_PORT_SYNC_MASTER_SELECT_MASK);
 
 	if (DISPLAY_VER(dev_priv) >= 12) {
-		if (!intel_dp_mst_is_master_trans(crtc_state)) {
+		if (!intel_dp_mst_is_master_trans(crtc_state) ||
+		    (!is_mst && intel_dp_is_uhbr(crtc_state))) {
 			ctl &= ~(TGL_TRANS_DDI_PORT_MASK |
 				 TRANS_DDI_MODE_SELECT_MASK);
 		}
-- 
2.39.5

