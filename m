Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81D49302A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 22:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C6D10E47F;
	Tue, 18 Jan 2022 21:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A59510E19F;
 Tue, 18 Jan 2022 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642542589; x=1674078589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EGyJh0FUpyR/agh5tAYMERWmkz4wA3u1IM8s2ywzkQE=;
 b=KDdQwohoLov7kvyeIrgWVBgtfUzmPy8sOMIBgdIAEtmz/Vzf7cSopTbD
 RNPzkTDaudf9XvZFb3P6GbFyW3Z/qdcomXr6ep+RdmLPyhwuNXmyh2JMp
 cjPrBdZhgZ6WVr1zB0EXY62D5Lhunrqt5gNESRzWLKHUY13A66cvgKedi
 l7YP5p6yPwudFDCQBkkiRzePsoOui/Lff8ZG1uXyvQmbPPyLkZtFQ0OfU
 0sp0LZ9Gc9G0iLxzoqnUxmLcw9wBXEfiXKm7ltZklPVfreWQ0gsCgToWT
 lOK159s1G2Qr63wKVDfSAxcQeBK/VPDCgiloYpB0rt+EivQqGFNXUFICf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244716623"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="244716623"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 13:49:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="531968402"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 13:49:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Date: Tue, 18 Jan 2022 13:43:55 -0800
Message-Id: <20220118214357.33740-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118214357.33740-1-matthew.brost@intel.com>
References: <20220118214357.33740-1-matthew.brost@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
GFP_KERNEL do fully decouple the error capture from fence signalling.

Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 67f3515f07e7a..aee42eae4729f 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1516,7 +1516,7 @@ capture_engine(struct intel_engine_cs *engine,
 	struct i915_request *rq = NULL;
 	unsigned long flags;
 
-	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
+	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL);
 	if (!ee)
 		return NULL;
 
-- 
2.34.1

