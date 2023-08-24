Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60328786FBC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7EF10E54D;
	Thu, 24 Aug 2023 12:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB4010E549;
 Thu, 24 Aug 2023 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692881674; x=1724417674;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jtvw5zcNhGMBKe6Ud3tL7JFy9/ao/NAV0grHKG9Brxc=;
 b=eH7oXODf00yMHyy5zT0uBUQ57Yq1z34/d3/mnFhqOtU6OFK/DKzmYpwc
 Qs8GHtLdhLuMMk/9qw+vuOoNzkqfUNzklIYBcsZOsyZKQQfzaZm3EVjJ0
 wBOtqubgqWF6GnL5PccS9wd6TK7nYx0DcDmDYc+M9mZGJFtquOwSW6ebA
 /RYbyj6Tbpyibb98dBrX6aSMCZpaw3PqqrE/S79OhFsddf1seVZ7L8uOt
 jjProTkz9QGTywth4r07Fe7HjU+avuSf9gTZ71oQXPJbLQjp99gGHusbS
 zUV5dLS/vAwmgFkgAZZ+tOEO6PNtiSS7mTcP8rZUmJyR5n79tOmitRgo/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377160111"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377160111"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860688650"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="860688650"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:32 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drivers/drm/i915: Honor limits->max_bpp while computing
 DSC max input bpp
Date: Thu, 24 Aug 2023 18:21:21 +0530
Message-Id: <20230824125121.840298-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
References: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
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

v2: Use int instead of u8 for computations. (Jani)
Add closes tag. (Ankit)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9161
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7067ee3a4bd3..8f3dc79089ea 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2061,9 +2061,10 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	if (forced_bpp) {
 		pipe_bpp = forced_bpp;
 	} else {
+		int max_bpc = min(limits->max_bpp / 3, (int)conn_state->max_requested_bpc);
+
 		/* For eDP use max bpp that can be supported with DSC. */
-		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
-							conn_state->max_requested_bpc);
+		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, max_bpc);
 		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
 			drm_dbg_kms(&i915->drm,
 				    "Computed BPC is not in DSC BPC limits\n");
-- 
2.40.1

