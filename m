Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743D70E6A2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 22:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8982B10E4D2;
	Tue, 23 May 2023 20:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1110E4CF;
 Tue, 23 May 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684874447; x=1716410447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZiTkK8ghbg91Z96/7IFFwPOyV6x0WgHf2+R3kLeHO1Q=;
 b=M/sWjvsM6LT2j0S74ugR/iAbz4iJ6WDQSBTC9tSNqszi6NnkUHdsZCt3
 aX0e+Lr+iaNqlassxN6qStTUzehLPZxzI+JgrSPIwPUJz47XlIeP54XqR
 SlNFl4WnqPIxoxqj/2/fWS5U0Yn8fFTGfA6HyG171MmYgTVdIDAfQC2T4
 CG5x1xqu5XG4Hv93YTK5FMCCw24dsYUmgO3QJVFOplzZkANhRWjOYVVdA
 AnrRlRbYg2UpC1JVsWBA4QXFmhPhsK1nxLjozkI/S/hUrMcdQd3sjEvz0
 9nmVgTmTT6t0xmS/8299helG3+ldEyhSQ32FPMr7pdaXAavhTJM1Vnf4C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="337939596"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="337939596"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 13:40:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="698201960"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="698201960"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 13:40:45 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/perf: Clear out entire reports after reading if not
 power of 2 size
Date: Tue, 23 May 2023 13:40:42 -0700
Message-Id: <20230523204042.4180641-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clearing out report id and timestamp as means to detect unlanded reports
only works if report size is power of 2. That is, only when report size is
a sub-multiple of the OA buffer size can we be certain that reports will
land at the same place each time in the OA buffer (after rewind). If report
size is not a power of 2, we need to zero out the entire report to be able
to detect unlanded reports reliably.

v2: Add Fixes tag (Umesh)

Fixes: 1cc064dce4ed ("drm/i915/perf: Add support for OA media units")
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 19d5652300eeb..58284156428dc 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -877,12 +877,17 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
 			stream->oa_buffer.last_ctx_id = ctx_id;
 		}
 
-		/*
-		 * Clear out the report id and timestamp as a means to detect unlanded
-		 * reports.
-		 */
-		oa_report_id_clear(stream, report32);
-		oa_timestamp_clear(stream, report32);
+		if (is_power_of_2(report_size)) {
+			/*
+			 * Clear out the report id and timestamp as a means
+			 * to detect unlanded reports.
+			 */
+			oa_report_id_clear(stream, report32);
+			oa_timestamp_clear(stream, report32);
+		} else {
+			/* Zero out the entire report */
+			memset(report32, 0, report_size);
+		}
 	}
 
 	if (start_offset != *offset) {
-- 
2.38.0

