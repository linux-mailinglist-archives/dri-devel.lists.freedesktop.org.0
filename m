Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5912C70CAB6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449D510E37A;
	Mon, 22 May 2023 20:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3817210E37A;
 Mon, 22 May 2023 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684786674; x=1716322674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=982noqbAMOmgA0reQGkrINQcNeHQ6NxxoGKNnbHUvag=;
 b=HbyO48oSNydScKIVsxqtkAzooA0E2TNkhAbq1goJya0MDb8/9OjFE2f3
 yOI3XJzaChR0UvZjK3wwfYiYncmhjo8q2o8TG4tS4bnsuwiLsNUfiu0UY
 PnHbSyMY18kvkQ0W5lAvm1yrVMjNldZHkZrtMGbhwJ+na6ADSBfAvoBCz
 PeB3SFHt3Qkh0Z2l5IvK5ZrY8Cyr/nN15ETzjQBQYFIor7FHoZRuYwk5Y
 gMLNcSZ+bZDiXvwM42O6THyBWwO0/8elz198QTcJhdilsjnQKXExKiU92
 4kqvhPdobJiNeA2iLcPSbcGQ72ag90c+xb1q+5XOZT/XikDUTYmlG/7i9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="439384879"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="439384879"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="706676116"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="706676116"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:17:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/perf: Clear out entire reports after reading if not
 power of 2 size
Date: Mon, 22 May 2023 13:17:49 -0700
Message-Id: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
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

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

