Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F170007D
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 08:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31510E63C;
	Fri, 12 May 2023 06:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7959A10E62B;
 Fri, 12 May 2023 06:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872949; x=1715408949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AAecL7ouqrJmQ5/YWd3Wbzie9flFju8h6zoqLaLdBJk=;
 b=emOTxUufZFGHTn3KCOJxFc6JbwXeIykn0nyACkRxkNlBpq50u4oIXKec
 xdKjvLJc9XbBPAivUwzEvGUBa1MQleT+vRiEn/OFm+vGfrrJapG7NfR/h
 ZcMmQQyMhkfnaJpFsKXbR4Lh3gSmFL4e4ezWr6csYTZaaB6F7rWiLtYBA
 H51YNeypSiXj3Fu9rfNEOd/YrXxq28S1H/cf+M1sngAcszAenVGkpK1+v
 ib5sQcpJn3AXz5Q5A2t6V6ehFx20vdpy63p9gUKKvPOhffR/9StiiFNED
 hBTIGO2GOoruxgIcOGb4BLyOb2+PdqOhEELHu9U2nK7ZvOC74ydlT/uZB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350741961"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="350741961"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811941301"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811941301"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:29:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/i915/dp: Avoid forcing DSC BPC for MST case
Date: Fri, 12 May 2023 11:54:12 +0530
Message-Id: <20230512062417.2584427-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MST the bpc is hardcoded to 8, and pipe bpp to 24.
So avoid forcing DSC bpc for MST case.

v2: Warn and ignore the debug flag than to bail out. (Jani)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 11 +++++------
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  5 +++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index a7cc9d418f22..7ea4f27a4bf5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1669,14 +1669,13 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
 		return -EINVAL;
 
-	if (compute_pipe_bpp)
+	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
+		pipe_bpp = intel_dp->force_dsc_bpc * 3;
+		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
+	} else if (compute_pipe_bpp) {
 		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
-	else
+	} else {
 		pipe_bpp = pipe_config->pipe_bpp;
-
-	if (intel_dp->force_dsc_bpc) {
-		pipe_bpp = intel_dp->force_dsc_bpc * 3;
-		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
 	}
 
 	/* Min Input BPC for ICL+ is 8 */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d92af6122763..636e3e8e57e8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -361,6 +361,11 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 	/* enable compression if the mode doesn't fit available BW */
 	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
 	if (ret || intel_dp->force_dsc_en) {
+		/*
+		 * FIXME: As bpc is hardcoded to 8, as mentioned above,
+		 * WARN and ignore the debug flag force_dsc_bpc for now.
+		 */
+		drm_WARN(&dev_priv->drm, intel_dp->force_dsc_bpc, "Cannot Force BPC for MST\n");
 		/*
 		 * Try to get at least some timeslots and then see, if
 		 * we can fit there with DSC.
-- 
2.25.1

