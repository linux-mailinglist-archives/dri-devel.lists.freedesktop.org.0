Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE13B48DD56
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 18:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AD310E52E;
	Thu, 13 Jan 2022 17:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7F10E244;
 Thu, 13 Jan 2022 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642096706; x=1673632706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EGyJh0FUpyR/agh5tAYMERWmkz4wA3u1IM8s2ywzkQE=;
 b=IAVm64WG1SY8JmrAI94bk2p6L4scXNwNuk6drD68d60/8k0UuGmOw6k/
 54YPAfiFLMtfXYnH6gG5LRbfCF4RL6LF14Dz8pi9FkN4juqJFS0IEQzuG
 uaf0da0NwOrxez9UX/aUQsOlQ8Rw4XyrLVl5oaHL81pN3svSTxmIrIuJi
 6vx0YYYw8eoxrinEptGVT2MFDzA3TIfOhHxE+gq9T7V4opDtKXfzcSr5Y
 /W7OdDCFkcBWRjzQI2pu+CMTuvnzFLhBWdH81tbyvRglWK7O5u4AVbYTt
 nXZd09vYjRGc9TygzX+AUuY0ItGjIXzLAOktq39WByn9uacGJ3gSDVde+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244030357"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244030357"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:58:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="516028966"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:58:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Date: Thu, 13 Jan 2022 09:52:31 -0800
Message-Id: <20220113175232.20897-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113175232.20897-1-matthew.brost@intel.com>
References: <20220113175232.20897-1-matthew.brost@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com
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

