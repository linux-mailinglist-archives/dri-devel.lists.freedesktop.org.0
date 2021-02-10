Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73031610C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 09:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F03C6EB12;
	Wed, 10 Feb 2021 08:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F219B89BF4;
 Wed, 10 Feb 2021 08:31:53 +0000 (UTC)
IronPort-SDR: FRlQP5hcI301hR7jBP5ev9S6gVOOSk8NrhfMbVm07GhdcNslCbkE7mlDwvkhWBbaL6ilyL/gvL
 dhSTQeutNmCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161183226"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="161183226"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 00:31:35 -0800
IronPort-SDR: 7/5C9DyRREDl6tV9ed8o8ID1Gt1sGDSjYsDntFtBNlPuY5Fhp05Ta/RFTcxZ30h1jd5vUWbeaR
 hpcZFgXosmVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="361212728"
Received: from kialmah1-desk.jf.intel.com ([10.23.15.164])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2021 00:31:35 -0800
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/2] drm/i915/dp: Retry AUX requests 7 times.
Date: Wed, 10 Feb 2021 00:33:38 -0800
Message-Id: <20210210083338.100068-2-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210083338.100068-1-khaled.almahallawy@intel.com>
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
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
Cc: seanpaul@chromium.org, Khaled Almahallawy <khaled.almahallawy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Given that intel_dp_aux_xfer retries 5 times, so configure drm_dpcd_access to retry only 7 times,
which means the max number of retries for i915 = 7 * 5 = 35 times.

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index eaebf123310a..73d711a94000 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -688,5 +688,7 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 					       encoder->base.name);
 
 	intel_dp->aux.transfer = intel_dp_aux_transfer;
+	/* Follow DP specs*/
+	intel_dp->aux.num_retries = 7;
 	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
