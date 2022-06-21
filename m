Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3120553014
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E052F10FD8A;
	Tue, 21 Jun 2022 10:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74A10FCEC;
 Tue, 21 Jun 2022 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808415; x=1687344415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eM5Dcjm/HcptWxgw8J7RQEwYZvdlz8zP4bPNsCNYTEY=;
 b=Mlup0aXj/neDIiMwUcYu6d7oIw+J7t2DkorxV1SeG2SAa6ZN2obFFKwJ
 vsk9oCdBRMlJlCZCQUEfTD/gOoLMfRmlKHvOpN02OCtZC9tSvBgwq0qUB
 X4KqbmsjKX/X+BTewpHxwj1GHQR5eGWuCI0mAPjyyZ/wtZetvkfEy8dxZ
 pjo7WjXQnfzglnj5Fte/uuuxr3WcjdwCXRp+VYBfC61olYGoCqFpMq9Ga
 W/Yd8ndc7wI8k5+aMuS2hKFxVBNPjz2UPTNEdAb8q1n+iTipaeKVehdrO
 9gU3zfoeuW63HP42d8p+rR6vC9qxWUHLrnQqJFv34fySgWbxrPRaaXLZY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121961"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121961"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327134"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/12] drm/i915/selftests: ensure we reserve a fence slot
Date: Tue, 21 Jun 2022 11:44:31 +0100
Message-Id: <20220621104434.190962-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should always be explicit and allocate a fence slot before adding a
new fence.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 5bc93a1ce3e3..7c95b6768610 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1221,8 +1221,10 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
 					  expand32(POISON_INUSE), &rq);
 	i915_gem_object_unpin_pages(obj);
 	if (rq) {
-		dma_resv_add_fence(obj->base.resv, &rq->fence,
-				   DMA_RESV_USAGE_KERNEL);
+		err = dma_resv_reserve_fences(obj->base.resv, 1);
+		if (!err)
+			dma_resv_add_fence(obj->base.resv, &rq->fence,
+					   DMA_RESV_USAGE_KERNEL);
 		i915_request_put(rq);
 	}
 	i915_gem_object_unlock(obj);
-- 
2.36.1

