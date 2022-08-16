Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB975956A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D1399AF8;
	Tue, 16 Aug 2022 09:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22298A5C;
 Tue, 16 Aug 2022 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660642564; x=1692178564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RcVGSqDVgei8ibE/RZOfErIbENbpKkAHT9AfV6p7t+s=;
 b=auTjm5ZOPYUQ60mlcut/vD0YK+lgYUcCZyfkWWwhsU5eBGmzl+3/9Aq8
 /vF+OWCAjFnYlDa35L5U5dj9oxlpIEFHMVr1WzXQ8f8A/vs6HLEie9E+x
 nDkdRGUixXsgO4sW7F76lQRzyp3v0Eiwt3RTB/9UF2rUa58d5l+/bW2Rt
 xu4pxHZv25gkjRWLTypXMOPRwGDFzUc4ajLjOtxliS9peRtkchhdvKsql
 0mO0ohCVaFM3gmH1KLY5dCXaD16Rlr3L3IC58uLPjOF8YZJJcrrjpXq2u
 DeQ9Ia/68yYSCn8O0DZ+4uyR5Y0+5Iw2Vd8pZCB0SMOWg/UK+EXLcjzTE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="279134761"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="279134761"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:36:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="733231092"
Received: from clbarnes-mobl.amr.corp.intel.com (HELO
 paris.amr.corp.intel.com) ([10.254.7.166])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:36:01 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 7/8] drm/i915: Use error code as -E2BIG when the size of
 gem ttm object is too large
Date: Tue, 16 Aug 2022 18:35:24 +0900
Message-Id: <20220816093525.184940-8-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 andrzej.hajda@intel.com, matthew.auld@intel.com, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_bo_init_reserved() functions returns -ENOSPC if the size is too big
to add vma. The direct function that returns -ENOSPC is drm_mm_insert_node_in_range().
To handle the same error as other code returning -E2BIG when the size is
too large, it converts return value to -E2BIG.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 69805cbe850c..8a5589accdb2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1249,6 +1249,17 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
 				   &i915_sys_placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
+
+	/*
+	 * XXX: The ttm_bo_init_reserved() functions returns -ENOSPC if the size
+	 * is too big to add vma. The direct function that returns -ENOSPC is
+	 * drm_mm_insert_node_in_range(). To handle the same error as other code
+	 * that returns -E2BIG when the size is too large, it converts -ENOSPC to
+	 * -E2BIG.
+	 */
+	if (size >> PAGE_SHIFT > INT_MAX && ret == -ENOSPC)
+		ret = -E2BIG;
+
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
 
-- 
2.37.1

