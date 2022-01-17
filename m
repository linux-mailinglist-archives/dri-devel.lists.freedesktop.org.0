Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCF490B38
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09A10E3A1;
	Mon, 17 Jan 2022 15:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBAA10E39B;
 Mon, 17 Jan 2022 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642432381; x=1673968381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2HFXyBiXYHH8MavvXcoEOjIszkgRiKWHDnia4UxLVt8=;
 b=mfO65HqwER9TsIb6Xod9AhNmxDizeWt8IjaOddAAXt8rWUAQdjtA+nlG
 0YHe+L+wLuBIAxD8hOf3WWC9gTbh776QKViE3bNf40q1A1S2IKYAGBT2D
 KHX21NGT416UZ/L2f5E9RAJlyYIUIsaIUJfZZ/J7V/1ZO3OM53qDRjW7T
 1ggqyJ1fuUvfTyqWMWT2v266R423tyNG1BNGjX+fr/w1QZruHhHwdEfFY
 Bl5mdkURxGIdSDEWlwhUz5aqoTSP11BhWTxJVxcfZ7ZNJh9GIIO7zHbza
 ZCKddoqtmYb0tTTt6oJtU80nMi5vsbKQbreSpSQb2RQ/IwSlea8tLjl9W w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="244838791"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="244838791"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 07:13:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="531376674"
Received: from ajadhav-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.243.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 07:12:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/buddy: fixup potential uaf
Date: Mon, 17 Jan 2022 15:10:53 +0000
Message-Id: <20220117151053.1844062-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we are unlucky and can't allocate enough memory when splitting
blocks, where we temporarily end up with the given block and its buddy
on the respective free list, then we need to ensure we delete both
blocks, and no just the buddy, before potentially freeing them.

Fixes: 14d1b9a6247c ("drm/i915: buddy allocator")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_buddy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
index 6e2ad68f8f3f..9ca81b095adb 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/i915/i915_buddy.c
@@ -293,8 +293,10 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
 	return block;
 
 out_free:
-	if (i != order)
+	if (i != order) {
+		list_del(&block->link);
 		__i915_buddy_free(mm, block);
+	}
 	return ERR_PTR(err);
 }
 
@@ -401,8 +403,10 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 	buddy = get_buddy(block);
 	if (buddy &&
 	    (i915_buddy_block_is_free(block) &&
-	     i915_buddy_block_is_free(buddy)))
+	     i915_buddy_block_is_free(buddy))) {
+		list_del(&block->link);
 		__i915_buddy_free(mm, block);
+	}
 
 err_free:
 	i915_buddy_free_list(mm, &allocated);
-- 
2.31.1

