Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552D7322D7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CF010E565;
	Thu, 15 Jun 2023 22:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA08610E562;
 Thu, 15 Jun 2023 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686869026; x=1718405026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3+QDlXhCxFo0nsuFqE9WvxxBhEXDo4bmX+KemRz3d1w=;
 b=lgCYwLIGU/fcNiKhM8Oy+V/SRaN2DARiA7a3U9KL6eaotNApI/4Djwo2
 XAs9mGSjQdv+Fszl+f8ymJSh/L1/wKHstZ5711vSFh3vx61/zxmx3qbfm
 OYO4/ub3T9sYNfXcXmJusYe1QQSP9V0cm/cxEzgZr6tV3HluUFXD9gURI
 reucbuv0QHInkf5vgQFFTP7cwwV0q1jNN85X0wiroPJmIkl3HIiz32mGt
 +qPG6/3Ay9of9Wbc9pSnXfQWN6MJxyUOfOOc9b70Vkn4nv8iDEkIq5Ryj
 ndtetEliWQtpgFAnFo8gcm+bXSIEsSlCayQIHMWaniL0hWEo3IBmX6Z24 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348765979"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348765979"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 15:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="886862358"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="886862358"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 15:43:45 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Remove incorrect hard coded cache coherrency setting
Date: Thu, 15 Jun 2023 15:43:43 -0700
Message-Id: <20230615224343.965937-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previouse i915_gem_object_create_internal already set it with proper value before function return. This hard coded setting is incorrect for platforms like MTL, thus need to be removed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..693d18e14b00 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
-
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
 		i915_gem_object_put(obj);
-- 
2.34.1

