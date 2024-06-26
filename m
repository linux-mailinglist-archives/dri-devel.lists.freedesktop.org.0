Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEC19184CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711D910E8ED;
	Wed, 26 Jun 2024 14:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmRbRcIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0510E8ED;
 Wed, 26 Jun 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719413299; x=1750949299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZLFbahMsfwl9ksR/fA89FFUsm+AfwNY5V4LJ098q3EQ=;
 b=EmRbRcIh7JN1Te3wQZjXg/jsWVj3Zl5z5HblTGfRExu+jVJBg6LsaGxm
 PgNC9BDCe55sj31f+G1iH0PJOmGZr6Oiup2KvyNyOhABm+FRcUjHHHrgp
 7nkKbyGzARexCLjt8C7bE1skeotbPr8wxcyKM9hqVhXQiOEsOJAICeMyT
 eKQiPPj4Y2J9YlBG3cyUeO+hMw0YsdyAlh6fl/Py6Qt5KPVLZ+AxXRh2V
 5bmSzJDgk8u5ZGgGftEIlXGlR6c/o1TCzb9pbY1aJ/JSANQizDcMPG3KL
 ad5mQarnGtUxI0GKGWlMCISQqinpWFUzO4A0dhTXjTWGoFwuTg1KPYxoX g==;
X-CSE-ConnectionGUID: XpV/+VtTR227tPhGJ2l7eQ==
X-CSE-MsgGUID: xUVYOWbQRxSPpS99OPrlcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16638432"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16638432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:48:19 -0700
X-CSE-ConnectionGUID: 9qhMGo0eT+SFH3ccXULMxA==
X-CSE-MsgGUID: DZQxBZHjQF+YvlEXpMNVaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="75220383"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 07:48:17 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gem: Suppress oom warning in favour of ENOMEM to
 userspace
Date: Wed, 26 Jun 2024 16:33:18 +0200
Message-ID: <20240626143318.11600-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We report object allocation failures to userspace with ENOMEM
so add __GFP_NOWARN to remove superfluous oom warnings.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index e93d2538f298..4d830740946d 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -90,7 +90,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 
 	GEM_BUG_ON(!max_segment);
 
-	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
+	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
@@ -104,7 +104,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	}
 
 	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
-			   GFP_KERNEL)) {
+			   GFP_KERNEL | __GFP_NOWARN)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
 	}
@@ -178,7 +178,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 	GEM_BUG_ON(list_empty(blocks));
 	GEM_BUG_ON(!max_segment);
 
-	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL);
+	rsgt = kmalloc(sizeof(*rsgt), GFP_KERNEL | __GFP_NOWARN);
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
@@ -190,7 +190,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 		return ERR_PTR(-E2BIG);
 	}
 
-	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
+	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL | __GFP_NOWARN)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.42.0

