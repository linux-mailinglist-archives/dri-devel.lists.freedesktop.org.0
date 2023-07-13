Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FFE7526E9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB11310E6FF;
	Thu, 13 Jul 2023 15:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E2710E6FB;
 Thu, 13 Jul 2023 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689262052; x=1720798052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uxhKCuDtZOgQCvUsvQc5qWpMJevnFpZVvPtFdByoRQ=;
 b=GHD0JSGrW7Qf5i9PEXJq8ihhyxXyax8GGWYC/nO6J0/P2znKjS/1RHKM
 HmN6IfbQOE8rwuYa89FF7pLtCUHrQLmbAOfYkdB0m//aT30JOyXqNglij
 Xdm/C0lIk9G5Mxci03L+si/nZXMFbBU5kJLukJ88FefsRGiW9kDy7lORj
 Zm9uWYjzkc440SAqRfaHl4GDRN6fQAS1uW1kKURSg3Ijymkb4Gz0Pv1J8
 iZtvNMC4ouDSz7KnRkwUCUAhzecIdegTIMMBVyIzD787th0U4EWIr4bYG
 3B27keQWW7e/ySZcLbXERtwa088yBOYNZG+eEecRqf0dCzq19sjAQni3o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368778257"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="368778257"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="835635803"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="835635803"
Received: from apaulaux-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.206.56])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:27:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/2] drm/i915: Remove PAT hack from
 i915_gem_object_can_bypass_llc
Date: Thu, 13 Jul 2023 16:27:18 +0100
Message-Id: <20230713152718.645488-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
References: <20230713152718.645488-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

According to the comment in i915_gem_object_can_bypass_llc the purpose of
the function is to return false if the platform/object has a caching mode
where GPU can bypass the LLC.

So far the only platforms which allegedly can do this are Jasperlake and
Elkhartlake, and that via MOCS (not PAT).

Instead of blindly assuming that objects where userspace has set the PAT
index can (bypass the LLC), question is is there a such PAT index on a
platform. Probably starting with Meteorlake since that one is the only one
where set PAT extension can be currently used. Or if there is a MOCS entry
which can achieve the same thing on Meteorlake.

If there is such PAT, now that i915 can be made to understand them better,
we can make the check more fine grained. Or if there is a MOCS entry then
we probably should apply the blanket IS_METEORLAKE condition.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 33a1e97d18b3..1e34171c4162 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -229,12 +229,6 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
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
-- 
2.39.2

