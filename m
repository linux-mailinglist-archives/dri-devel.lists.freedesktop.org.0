Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA162F2D2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEB410E6C4;
	Fri, 18 Nov 2022 10:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00E10E231;
 Fri, 18 Nov 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668768200; x=1700304200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKuO+ywfg/O9J1nzXBEvA/H7AWf2qFV/Zf1R4tWV8vU=;
 b=GcliOn+XtGbEdxV2+Oc4fwPkopkv2q1CTEFRrXDSqsubcW7GUUWCkxFP
 +p8SsSjEUTb07kxQ4yRxnBT01ilnb5EnLwYzqcfd2VWfbpxcYCoIA5khI
 b1veRKG+2QPwIhD9DW8Bpjn0uh86h3goq3abrrJnb4ymIMD3nQk3DPTVp
 yjWJts4MIVUqyRRYkGS7cip0FbAit05naiOvTbdg1vXWikU/xWzhXxsfX
 mwJdsOqjz9E9bDy5rTBpaux0vdBal74p2MTUbBoTLnV0OaVXyfQ39pdx5
 5QgaoTLEKDpIn7EQu4TmZ24hP9e6eQGG6nfVNm+6xKNA+vexFtzisJiy9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311812878"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="311812878"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:43:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="729188087"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; d="scan'208";a="729188087"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.29.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:43:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 2/2] drm/i915: Never return 0 if not all requests retired
Date: Fri, 18 Nov 2022 11:42:22 +0100
Message-Id: <20221118104222.57328-3-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
References: <20221118104222.57328-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Users of intel_gt_retire_requests_timeout() expect 0 return value on
success.  However, we have no protection from passing back 0 potentially
returned by a call to dma_fence_wait_timeout() when it succedes right
after its timeout has expired.

Replace 0 with -ETIME before potentially using the timeout value as return
code, so -ETIME is returned if there are still some requests not retired
after timeout, 0 otherwise.

v2: Move the added lines down so flush_submission() is not affected.

Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.5+
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index edb881d756309..3ac4603eeb4ee 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -199,6 +199,9 @@ out_active:	spin_lock(&timelines->lock);
 	if (remaining_timeout)
 		*remaining_timeout = timeout;
 
+	if (!timeout)
+		timeout = -ETIME;
+
 	return active_count ? timeout : 0;
 }
 
-- 
2.25.1

