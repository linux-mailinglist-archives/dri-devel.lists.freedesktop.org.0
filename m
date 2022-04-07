Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C924F7D89
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 13:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96F710E9D9;
	Thu,  7 Apr 2022 11:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3210E9D9;
 Thu,  7 Apr 2022 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649329607; x=1680865607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vq+WHe0fRq5MeVc2xCkkiRKAkBz1JYQuA7zP8fWAgmE=;
 b=OuGjyNMlcXP5C81UKXfadXBQaQBY5j6TOx2Cso1xqabOSBTl4YhJZ/H+
 w3f/AVwrqp0hqgWWuV0WnaBt1NXaXNKAEfdsDLiue+plyOnDLMVXVQ+7q
 P/o3aa/pOgL/TEUzLE3odCQYY73FEMMQnVa5kZh0GlGD8fpx0ENghUQ0k
 tMsuOwkByduhXGffxPOv8AcSJFz+SBMj5s6KzknPezfLkIbxDupvi0+/r
 ZKZFVq9kiSGS2IBPHsPWJBWmMCzkHU7CJOVQ8ahs7S8c22db+VJq0Mxmw
 52wSx7eIMLqO+noriRr4eObNOn6psunEwqSpC+TqcTjX+A58BMN/PPOwo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="324455035"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="324455035"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 04:06:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="642442340"
Received: from doboyle-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 04:06:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/buddy: sanity check the size
Date: Thu,  7 Apr 2022 12:06:08 +0100
Message-Id: <20220407110608.1184820-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220407110608.1184820-1-matthew.auld@intel.com>
References: <20220407110608.1184820-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure we check that the size is compatible with the requested
page_size. For tiny objects that are automatically annotated with
TTM_PL_FLAG_CONTIGUOUS(since they fit within a single page), we
currently end up silently overriding the min_page_size, which ends up
hiding bugs elsewhere.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 8e4e3f72c1ef..a5109548abc0 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -70,6 +70,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		min_page_size = bo->page_alignment << PAGE_SHIFT;
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
+	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
 
 	if (place->fpfn + bman_res->base.num_pages != place->lpfn &&
 	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-- 
2.34.1

