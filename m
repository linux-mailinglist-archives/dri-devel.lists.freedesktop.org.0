Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08F765687
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543C610E5B2;
	Thu, 27 Jul 2023 14:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576210E5B0;
 Thu, 27 Jul 2023 14:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469730; x=1722005730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kD9quBf/SA2K77HBhUxBu97J9TXzK/yTvjKXlcj8wXM=;
 b=Mva6uJHaZPNIJoDb9CF0JPv3AWW3vm407H2iOLXPN88oaJUlLgKly8cg
 mtjCO0jt6HIu6q/HFdqlr2wUzjNCxEbBH8ZzgAa6p7ohA4/bpzfwutZXF
 vGL/FYA1WEa1sj+PGzI6TcZlK6bTLk2oxvN2hML5MplX36IsTwtrDUB9f
 6wlo2coKPVxp2GxdCLszHjhlkCL+EGRELpOsIdE0YCGTooxFoPV1u3EvA
 axe/fMe13JFVau0JiNKcYkkDH0aI78I8rt1qeLLDMdl5o0fGb3/DQjDAo
 s218fHKXWQEdNZsBVZv/jr5/+bvSCRSrDlJFtu2aR6vkHSVdpLfaA7EiU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268450"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268450"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433761"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 8/8] drm/i915: Refine the caching check in
 i915_gem_object_can_bypass_llc
Date: Thu, 27 Jul 2023 15:55:04 +0100
Message-Id: <20230727145504.1919316-9-tvrtko.ursulin@linux.intel.com>
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
refine the check in i915_gem_object_can_bypass_llc() to stop assuming any
user PAT can bypass the shared cache (if there is any).

Instead we can use the absence of I915_BO_CACHE_COHERENT_FOR_WRITE as the
criteria, which is set for all caching modes where writes from the CPU
side (in this case buffer clears before handing buffers over to userspace)
are fully coherent with respect to reads from the GPU.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index ec1f0be43d0d..8c4b54bd3911 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -221,12 +221,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	if (!(obj->flags & I915_BO_ALLOC_USER))
 		return false;
 
-	/*
-	 * Always flush cache for UMD objects at creation time.
-	 */
-	if (obj->pat_set_by_user)
-		return true;
-
 	/*
 	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
 	 * possible for userspace to bypass the GTT caching bits set by the
@@ -239,7 +233,17 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
 	 * it, but since i915 takes the stance of always zeroing memory before
 	 * handing it to userspace, we need to prevent this.
 	 */
-	return IS_JSL_EHL(i915);
+	if (IS_JSL_EHL(i915))
+		return true;
+
+	/*
+	 * Any caching mode where writes via CPU cache are not coherent with
+	 * the GPU needs explicit flushing to ensure GPU can not see stale data.
+	 */
+	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
+		return true;
+
+	return false;
 }
 
 static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
-- 
2.39.2

