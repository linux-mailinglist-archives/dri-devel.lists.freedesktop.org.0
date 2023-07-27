Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99254765682
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CABF10E5B1;
	Thu, 27 Jul 2023 14:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F7710E5AF;
 Thu, 27 Jul 2023 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469727; x=1722005727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+qbhanDaamxDTlSoYGO+3FKw+hWs29j/CXQ8FdM/mTI=;
 b=biGruv4XjC7qsxvwUBErRBExSxMdw1oxfCnxr1lBtgfqSKgd29Xp38U+
 OLik0Z22qCYQrepGWsf1y9uJCMh/KAoe32PxH5XnRSZF7OnyTSjY7SpMb
 LFIZFAFTLVRdH/5QK5xvMDWsIkXmYihlUXCmF+sBbchj50KT6ReYZYXki
 UH24fi9AXfeoucXSR1p2/l5nnkrPjBiwc8XUHgOH7MZZs6bifX6GZB4cw
 kR5BuQwReAzt1jkagHDIelsrAzB4OcyUw0uKFgUSR6FZuwPihubmZjLjo
 WzM+TWXkeKKpFcDWku5JShygauEZjgya70YE7kruZC36QfAv8K9+ZoZgp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268427"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433750"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:26 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 6/8] drm/i915: Lift the user PAT restriction from
 gpu_write_needs_clflush
Date: Thu, 27 Jul 2023 15:55:02 +0100
Message-Id: <20230727145504.1919316-7-tvrtko.ursulin@linux.intel.com>
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

Now that i915 understands the caching modes behind PAT indices, and having
also special cased the Meteorlake snooping fully coherent mode, we can
remove the user PAT check from gpu_write_needs_clflush().

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index c15f83de33af..bf3a2fa0e539 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -41,12 +41,6 @@ static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 	if (IS_METEORLAKE(i915))
 		return false;
 
-	/*
-	 * Always flush cache for UMD objects with PAT index set.
-	 */
-	if (obj->pat_set_by_user)
-		return true;
-
 	/*
 	 * Fully coherent cached access may end up with data in the CPU cache
 	 * which hasn't hit memory yet.
-- 
2.39.2

