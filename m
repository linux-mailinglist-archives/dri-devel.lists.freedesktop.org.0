Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A330765686
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C7310E5B6;
	Thu, 27 Jul 2023 14:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350C10E5AD;
 Thu, 27 Jul 2023 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469728; x=1722005728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbRRS4pkZrtjFwIn3n1e/Q5U1aqA6UT5BLRvhc1Gt3g=;
 b=gZrpgv35/9PvATlJNOQP1LtyLdm+GxPCUcM5WwHMzM++7bk7A+XEJ1Q0
 Fe6Sh2Hxie3IDwoYQMXIsyV66XEFzl0cWdvee70MiawK9OoLnoZIRIwCI
 uwNjdTac7KB4ReA4iN/MbJajFHUITLShbEFOlt3KkuIUxW2z9i5Zbzuq2
 FR5jFTBJA5EzFSQnFQV8i5P7xsM/xh635TUu4HByfeQn91rHyO6xFyWAC
 ds2DF+AlFgL5VFOf0poWUSiwtAVVxp3DmP/fUQs848WmzaKIBfP0LBmCf
 pt/68BopNsLv/Mlv5gKw0NRfQpSWUBBg2Zho+so1jsaIgexm31SSV+JOx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268441"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433758"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 7/8] drm/i915: Lift the user PAT restriction from use_cpu_reloc
Date: Thu, 27 Jul 2023 15:55:03 +0100
Message-Id: <20230727145504.1919316-8-tvrtko.ursulin@linux.intel.com>
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
refine the check in use_cpu_reloc() to not reject the uncached PAT if it
was set by userspace.

Instead it can decide based on the presence of full coherency which
should be functionally equivalent on legacy platforms. We can ignore WT
since it is only used by the display, and we can ignore Meteorlake since
it will fail on the existing "has_llc" condition before the object cache
mode check.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9d6e49c8a4c6..f74b33670bad 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -640,16 +640,9 @@ static inline int use_cpu_reloc(const struct reloc_cache *cache,
 	if (DBG_FORCE_RELOC == FORCE_GTT_RELOC)
 		return false;
 
-	/*
-	 * For objects created by userspace through GEM_CREATE with pat_index
-	 * set by set_pat extension, i915_gem_object_has_cache_level() always
-	 * return true, otherwise the call would fall back to checking whether
-	 * the object is un-cached.
-	 */
 	return (cache->has_llc ||
 		obj->cache_dirty ||
-		!(obj->pat_set_by_user ||
-		  i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_UC)));
+		i915_gem_object_has_cache_flag(obj, I915_CACHE_FLAG_COH2W));
 }
 
 static int eb_reserve_vma(struct i915_execbuffer *eb,
-- 
2.39.2

