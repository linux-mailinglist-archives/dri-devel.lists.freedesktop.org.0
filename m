Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C46632721
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 15:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032F10E30F;
	Mon, 21 Nov 2022 14:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD41210E2F1;
 Mon, 21 Nov 2022 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669042676; x=1700578676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+sEp8/ZtTB5D2wuDjJYNgKtN8CNBIgF6cAGgVXjPYVY=;
 b=EOPT2gIsse7VgjzCv8UQ7KYqynekg+BvOsCrj+QMT0VcrG2vf9OTPLfy
 A32oqjZUEVattjr3tvv3kaPLzfPyhjkIpuUsVRaL1CDpuLy3kR+wDSeFo
 m1Vh/6MbQbkrco3DLJQFFVXA3hoFKZqMqg1yQRuxHe1/yUd3L31GYVuya
 UKpunkb75e7d6zhHAzk2IrS+uSsbp/k+nhu5cdoAmk6iukhfJzshzNz3G
 1r9X29GYKVJEurcSEbhFj5vW7rdAFpPDJk5f+QrgVwOyk2zo4wy4MWDZW
 osukCxBQ9mMtumbfQpI1EcNl9AoxMBu/Hxes3ZFFj15kDEHNfOyOXu5ay w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315395325"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="315395325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="765985132"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="765985132"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.16.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 06:57:48 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 2/2] drm/i915: Never return 0 if not all requests retired
Date: Mon, 21 Nov 2022 15:56:55 +0100
Message-Id: <20221121145655.75141-3-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
References: <20221121145655.75141-1-janusz.krzysztofik@linux.intel.com>
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

v3: Use conditional expression, more compact but also better reflecting
    intention standing behind the change.

v2: Move the added lines down so flush_submission() is not affected.

Fixes: f33a8a51602c ("drm/i915: Merge wait_for_timelines with retire_request")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: stable@vger.kernel.org # v5.5+
---
 drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
index edb881d756309..1dfd01668c79c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
@@ -199,7 +199,7 @@ out_active:	spin_lock(&timelines->lock);
 	if (remaining_timeout)
 		*remaining_timeout = timeout;
 
-	return active_count ? timeout : 0;
+	return active_count ? timeout ?: -ETIME : 0;
 }
 
 static void retire_work_handler(struct work_struct *work)
-- 
2.25.1

