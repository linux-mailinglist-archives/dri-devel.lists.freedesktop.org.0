Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B200074B153
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4FB10E08C;
	Fri,  7 Jul 2023 12:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEB610E08C;
 Fri,  7 Jul 2023 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734510; x=1720270510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NcVKWbQrWWZ7ACP241GvLvVuhTC9NIuhdymQc/vUvWs=;
 b=GUt4twIsYwvjsOaijNidTQqZNvw14aPzVUxRBYUb2A58VDCH1MfRb3sF
 YBXKWVamjR9ArB0ltuFthydzOG7uQfdix2rUZO0cQ1JoMcT2jw2BwdoJe
 +duk/yLXUPAB23JYoJO2EXJNsUSzuBvBVjbItqpBaqIr3I3fovqA76hZ/
 KdjGQjrxIHPdRH8KLfsdK5w9RWpumlG5DMRvqwHOoU0upqitfjEkWrU/0
 H0p883rpJFQLrkNL73G0bVKTo9mUvN543Bwc2bwAgS8W8rlzfj5GWWH94
 +MJlXJTjWVPpYV+hRQifFI93ZxxnrCMAzr7/Ct2Xwvpcb/qoyIzgpRTGI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450237605"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="450237605"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 05:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050533706"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050533706"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 05:55:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix one wrong caching mode enum usage
Date: Fri,  7 Jul 2023 13:55:03 +0100
Message-Id: <20230707125503.3965817-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch
buffer") mistakenly passed in uapi I915_CACHING_CACHED as argument to
i915_gem_object_set_cache_coherency(), which actually takes internal
enum i915_cache_level.

No functional issue since the value matches I915_CACHE_LLC (1 == 1), which
is the intended caching mode, but lets clean it up nevertheless.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: a4d86249c773 ("drm/i915/gt: Provide a utility to create a scratch buffer")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 126269a0d728..065099362a98 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -676,7 +676,7 @@ __vm_create_scratch_for_read(struct i915_address_space *vm, unsigned long size)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHING_CACHED);
+	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
 
 	vma = i915_vma_instance(obj, vm, NULL);
 	if (IS_ERR(vma)) {
-- 
2.39.2

