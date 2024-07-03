Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B203F926570
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B1410E936;
	Wed,  3 Jul 2024 15:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Js39l3hF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D399110E92E;
 Wed,  3 Jul 2024 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720022375; x=1751558375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4iV+aQttd3YAfBPE810KZ/J0jy+wRBDu8do37P7beec=;
 b=Js39l3hFe4wRqeEkvPBLDa5hz2IgWRtS4oq1U1j5fpg94rvgQsz8qVX3
 NfuC6f5hetLye8q9csl1qnSO5bBDeBzjG+qa6p337+ena+Ox+DU+siFX/
 6k7MpiIt+rqKVC5UmpOtUwOUXeNnvIgNlo5+w4e6iWEXPBqXvd3SxUjW1
 nI0xJk5+7buzbFrPvIPH9ujsDBeptby1IUjVEqPRo4FDxfxAuAeTu6HAU
 J7iXDfAH2/vhZYk/ura7AqMOrvpad6Q2Lj46YOI626lT4Rz1/9aUuU4qK
 SDHkYz0xqe3FXsTXDA4wrKRch4zmMNtdJffdsPOpy4E+djzOZs01c9iXF w==;
X-CSE-ConnectionGUID: bpf3/gAVTUigD72lKKuFPg==
X-CSE-MsgGUID: HdygV9ioSFykzS+Y7b2kUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17131779"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17131779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:59:31 -0700
X-CSE-ConnectionGUID: i/QyMJXrRfS4Ein5BUpKUg==
X-CSE-MsgGUID: OGCyA94YTDy98SREk2YD/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46964121"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 08:59:30 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/dp: Add the LTTPR PHY OUI DPCD register
Date: Wed,  3 Jul 2024 18:59:36 +0300
Message-ID: <20240703155937.1674856-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240703155937.1674856-1-imre.deak@intel.com>
References: <20240703155937.1674856-1-imre.deak@intel.com>
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

Add the DPCD register for the LTTPR PHY OUI. This will be used by a
later i915 patch to dump the descriptors for the detected LTTPR PHYs.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 include/drm/display/drm_dp.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 173548c6473a9..a6f8b098c56f1 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1543,6 +1543,10 @@ enum drm_dp_phy {
 #define DP_SYMBOL_ERROR_COUNT_LANE2_PHY_REPEATER1	    0xf0039 /* 1.3 */
 #define DP_SYMBOL_ERROR_COUNT_LANE3_PHY_REPEATER1	    0xf003b /* 1.3 */
 
+#define DP_OUI_PHY_REPEATER1				    0xf003d /* 1.3 */
+#define DP_OUI_PHY_REPEATER(dp_phy) \
+	DP_LTTPR_REG(dp_phy, DP_OUI_PHY_REPEATER1)
+
 #define __DP_FEC1_BASE					    0xf0290 /* 1.4 */
 #define __DP_FEC2_BASE					    0xf0298 /* 1.4 */
 #define DP_FEC_BASE(dp_phy) \
-- 
2.43.3

