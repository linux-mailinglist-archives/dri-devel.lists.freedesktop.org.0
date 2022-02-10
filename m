Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0B4B0D65
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 13:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC0710E853;
	Thu, 10 Feb 2022 12:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E7810E852;
 Thu, 10 Feb 2022 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644495411; x=1676031411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iC6qgl7ytn02+2kCYRuzhkojGgWcNJlVqnRbss8TRFc=;
 b=h5TBUBdBwxLdu9jAa31aGEwt269vrN5QKEMSo0by7l8IpGec97/PLGlx
 ku3eOl6EJ+bSa3kBN9NQXiJv1VFKyAVGcDuQZq7XHZiyHoXaLz+i8Al9D
 Jg5KnYWtMj6HGD8H8Gvh0Vzwwp9SoN57Kki3v86WqyHJJickowetDhQ5d
 FbkoRQXFE7J9hxHSBnbRSTbQoeNrj57Nmm8PWyMzKNB0BG/BCbYcPerEL
 GE2bt/8ZgbtVcZ+S5uthSOOtyZoQgKtwcfw//7TcCCIO6J4zqWvodjLaY
 f/X93phm1PJV9IwBF1sVjepo8l7kWqJ4achPckun/NPvmEhKZ0vCOOoO4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="247060982"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="247060982"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485664988"
Received: from paulbarr-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.11.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:50 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/15] drm/i915/selftests: handle allocation failures
Date: Thu, 10 Feb 2022 12:13:09 +0000
Message-Id: <20220210121313.701004-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210121313.701004-1-matthew.auld@intel.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have to contend with non-mappable LMEM, then we need to ensure the
object fits within the mappable portion, like in the selftests, where we
later try to CPU access the pages. However if it can't then we need to
gracefully handle this, without throwing an error.

Also it looks like TTM will return -ENOMEM, in ttm_bo_mem_space() after
exhausting all possible placements.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 2 +-
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 42db9cd30978..3caa178bbd07 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1344,7 +1344,7 @@ static int igt_ppgtt_smoke_huge(void *arg)
 
 		err = i915_gem_object_pin_pages_unlocked(obj);
 		if (err) {
-			if (err == -ENXIO || err == -E2BIG) {
+			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
 				i915_gem_object_put(obj);
 				size >>= 1;
 				goto try_again;
diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 56dec9723601..ba32893e0873 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -822,8 +822,14 @@ static int igt_lmem_create_with_ps(void *arg)
 
 		i915_gem_object_lock(obj, NULL);
 		err = i915_gem_object_pin_pages(obj);
-		if (err)
+		if (err) {
+			if (err == -ENXIO || err == -E2BIG || err == -ENOMEM) {
+				pr_info("%s not enough lmem for ps(%u) err=%d\n",
+					__func__, ps, err);
+				err = 0;
+			}
 			goto out_put;
+		}
 
 		daddr = i915_gem_object_get_dma_address(obj, 0);
 		if (!IS_ALIGNED(daddr, ps)) {
-- 
2.34.1

