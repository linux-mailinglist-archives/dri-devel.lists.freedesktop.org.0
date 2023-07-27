Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04B76567F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4677A10E5AC;
	Thu, 27 Jul 2023 14:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747EA10E5A8;
 Thu, 27 Jul 2023 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469725; x=1722005725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f2FaxZgYK02GAcdlHnVIXnfNfBRmmzzwwFFaYr6dJMM=;
 b=AqP8imjc2hiiDFQtPUhB7fwKIo74TOKMjJuRa+6ghp4QUV5h2wQSSh+o
 XOAYoNyi/wEsIDngSN+oz1b0xWxQhIRHIVp/ydRfC3LMBKdAq3bKWWETW
 XybtQYAkqVw0Gz6LbnTUTBfjb3hYHjvWGIPh9H50hIjSuFVGJOZuWKZmt
 8zz4kveAPTYhfJCsDKVpwztGTjWpG4U6g2Q/XAD25qrmAQH5Xxv7eTerK
 L0rDYhcYeVZFSQ6BkE17K3th8sx0kfvMzOYnIMedMnRDEPIoyhnrgr9Ao
 9iLiKTBMV1U2dtP/28T9LKH2Y458Fyqz369JjU4gcJUhU+1W49H9bs0/+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268412"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268412"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433739"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:25 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 5/8] drm/i915: Improve the vm_fault_gtt user PAT index
 restriction
Date: Thu, 27 Jul 2023 15:55:01 +0100
Message-Id: <20230727145504.1919316-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Now that i915 understands the caching modes behind PAT indices, we can
refine the check in vm_fault_gtt() to not reject the uncached PAT if it
was set by userspace on a snoopable platform.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index cd7f8ded0d6f..9aa6ecf68432 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -382,17 +382,9 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 		goto err_reset;
 	}
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, coherency is managed by userspace, make
-	 * sure we don't fail handling the vm fault by calling
-	 * i915_gem_object_has_cache_level() which always return true for such
-	 * objects. Otherwise this helper function would fall back to checking
-	 * whether the object is un-cached.
-	 */
-	if (!((obj->pat_set_by_user ||
-	       i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)) ||
-	      HAS_LLC(i915))) {
+	/* Access to snoopable pages through the GTT is incoherent. */
+	if (!i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC) &&
+	    !HAS_LLC(i915)) {
 		ret = -EFAULT;
 		goto err_unpin;
 	}
-- 
2.39.2

