Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA30785749
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 13:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223110E416;
	Wed, 23 Aug 2023 11:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B8610E410;
 Wed, 23 Aug 2023 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692791858; x=1724327858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RRVTjc+CdSuvuDzLLpOaBi+ubSNk7bvBZJKj0Qk5YUw=;
 b=POBt0Ty4VaSMwI+uU4YgQ8MckdT/VDx9XHmpk1ZTG5XVviFmAu8w0dj8
 M1YFLI5li8f7ptOmrmLRZQGuBhSh4f/gvI8mTPXnP0GUpbvppIVr755v9
 IGndivrXeWoFR4uC2Mzm5XfK9Mcih7SDWLwvPmUBmRzxfsMHX95oofObg
 o2EHXSFvJYdrHB07OQm7JV+ejmNOilmfI5Oyp0ZyBzV666p3ulovUNTio
 S7+XGLfm7VHyRUkGaap8F71I1zOT0uCHszs16nta3Vfm9AE45M6TN8vyC
 DGSIm6AnRWQTXozHKqt+m8l1JmIRN06ZBHZit8mhq6TiipRV3XHxniu2v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354472218"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="354472218"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="851019790"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="851019790"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:37 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp while computing
 DSC max input bpp
Date: Wed, 23 Aug 2023 17:24:25 +0530
Message-Id: <20230823115425.715644-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
References: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Edid specific BPC constraints are stored in limits->max_bpp. Honor these
limits while computing the input bpp for DSC.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5b48bfe09d0e..2a7f6cfe2832 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2061,9 +2061,11 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	if (forced_bpp) {
 		pipe_bpp = forced_bpp;
 	} else {
+		u8 max_bpc = limits->max_bpp / 3;
+
 		/* For eDP use max bpp that can be supported with DSC. */
 		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
-							conn_state->max_requested_bpc);
+							min(max_bpc, conn_state->max_requested_bpc));
 		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
 			drm_dbg_kms(&i915->drm,
 				    "Computed BPC is not in DSC BPC limits\n");
-- 
2.40.1

