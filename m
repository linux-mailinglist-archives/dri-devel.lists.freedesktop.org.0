Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762549427B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5D10E1FD;
	Wed, 19 Jan 2022 21:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256F910E20E;
 Wed, 19 Jan 2022 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642627809; x=1674163809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3gKOknV1d3UPNNSXPcj3dSRsx0lhTHV4qg0E+/rW70=;
 b=NQPFZAd+fe+2FXbLFpOQNkhvX7HIw8cSzuzAkOQaw/h+kmNfip77DCRZ
 w7zCXyFO72KoNsZfqhoNk2EM1WvycXe4cdlJjVbi9zFkHJ8s2zayjV+//
 0ptXhM/QoNF/dI03g2N1MSRLCytwj9AFlC4KJj+fT9xkzsbEUomqJDCjC
 qIkpzVAAnKb34LPd5d1r96ehmYpE7gNzvDbCZzzKXrh7mRST5ZwZ+ZFZv
 XXesvRJIv+sTzMl2qjcOAEipkruJiCGc6nlUeGnQwXa+2CruIoTsCTPee
 fsaCGqZT25ClRFvc9f9wwRFuOjRv76R0siVip1gvX6kO0gOLm/yY1FF7I g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331548314"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331548314"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="475289712"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Date: Wed, 19 Jan 2022 13:24:17 -0800
Message-Id: <20220119212419.23068-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119212419.23068-1-matthew.brost@intel.com>
References: <20220119212419.23068-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
GFP_KERNEL to fully decouple the error capture from fence signalling.

v2:
 (John Harrison)
  - Fix typo in commit message (s/do/to)

Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 67f3515f07e7..aee42eae4729 100644
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

