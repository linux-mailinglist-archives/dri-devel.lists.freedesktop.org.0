Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427A4AD7AA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A9E10E179;
	Tue,  8 Feb 2022 11:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D074610E179;
 Tue,  8 Feb 2022 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644320348; x=1675856348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGFjpYxzUKbdYzhdaVE0eAbFb59GZXqm0cG24Mqkuzo=;
 b=F1VJQut/6liXCX3wqGPTWS2LBpNLZcGmiSQQAVnygRJBrocerObYpZIW
 7dSv+kalmKvfd3uLWZzys/M46jq58sWteamifDNYCKxKcBIq2tCaCPqb+
 78RlrKxYkNdpBbxqGB0p7AYdHbI3zqwBwUEN7VukUKmV/Q6CHfZvPo6/i
 ORmuuJbaMSzM3XBhIO9n3I3CDhei5eT7EkPWU02/ZF0Rms4dAffdNjvVo
 EfGE9z1rY5CKfRi+dy50H7413uw6njgGGUGdzxDLgvWXw1xRKWXBmzniY
 qMSFtnVn68PJ5R76m+nMKorb7xwOesrwyxMQufoGaBlBVEvp1zfF/NLZi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248878716"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="248878716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 03:39:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700816843"
Received: from amcgrat2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.21])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 03:39:07 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/buddy: fixup potential uaf
Date: Tue,  8 Feb 2022 11:38:15 +0000
Message-Id: <20220208113815.314048-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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

If we are unlucky and somehow can't allocate enough memory when
splitting blocks, where we temporarily end up with the given block and
its buddy on the respective free list, then we need to ensure we delete
both blocks, and not just the buddy, before potentially freeing them.

v2: rebase on i915_buddy removal

Fixes: 14d1b9a6247c ("drm/i915: buddy allocator")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index d60878bc9c20..2bf75e8abfaa 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -333,8 +333,10 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
 	return block;
 
 out_free:
-	if (i != order)
+	if (i != order) {
+		list_del(&block->link);
 		__drm_buddy_free(mm, block);
+	}
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(drm_buddy_alloc_blocks);
@@ -452,8 +454,10 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
 	buddy = get_buddy(block);
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
-	     drm_buddy_block_is_free(buddy)))
+	     drm_buddy_block_is_free(buddy))) {
+		list_del(&block->link);
 		__drm_buddy_free(mm, block);
+	}
 
 err_free:
 	drm_buddy_free_list(mm, &allocated);
-- 
2.34.1

