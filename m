Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F296508F3E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1424C10F16F;
	Wed, 20 Apr 2022 18:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9F810F0C6;
 Wed, 20 Apr 2022 18:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650478587; x=1682014587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQvdXMR8VJZkfFbkqOekFtgyx8K8r75dirGeAIhwMPM=;
 b=T3COwRHXUlS5uNauVdXKA9WwyavgQm4VGnjWNvb5KSNEt31iSf8m0kLo
 BuDxQ6amXOxhaC+lxHqgnxzXzVoSgV9xfwWgOKgNSm7y1kK123q2EpM80
 bIXJ0JW7Hkkm2cJlqBi3dflGHGgOIq8/xTTa9WTlFilfALZA+rjVtqYZz
 VS4U2d9WRcf6qbXCHtULaUFuDQ2ksmutZfz3ZSEuXD3Yyinqb6fgP13BA
 FLTthjGY26JMwxq6ULq8e6i3NPsmsYj7CIg+gp5VENhh07fpsjm3YfR+z
 rw/TTfPFDinA6F/HJco3urZ0468qs3vWlO03TPMEpjZv87xJ9uGYiUMgU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261723156"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="261723156"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="593286070"
Received: from briansim-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 2/4] drm/i915/buddy: sanity check the size
Date: Wed, 20 Apr 2022 19:16:11 +0100
Message-Id: <20220420181613.70033-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420181613.70033-1-matthew.auld@intel.com>
References: <20220420181613.70033-1-matthew.auld@intel.com>
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
Reviewed-by: Nirmoy Das <nirmoy.das@linux.intel.com>
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

