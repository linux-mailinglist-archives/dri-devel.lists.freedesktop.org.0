Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130554292B6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720286E4A2;
	Mon, 11 Oct 2021 15:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F2589FCC;
 Mon, 11 Oct 2021 15:01:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="227179432"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="227179432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:56:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="569984453"
Received: from phutoant-mobl3.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.44.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:56:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v8 4/8] drm/i915: drop unneeded make_unshrinkable in
 free_object
Date: Mon, 11 Oct 2021 15:56:15 +0100
Message-Id: <20211011145619.1397733-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211011145619.1397733-1-matthew.auld@intel.com>
References: <20211011145619.1397733-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The comment here is no longer accurate, since the current shrinker code
requires a full ref before touching any objects. Also unset_pages()
should already do the required make_unshrinkable() for us, if needed,
which is also nicely balanced with set_pages().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 76ce6a1500bc..1dc3c1940c32 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -337,15 +337,6 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 	 */
 	atomic_inc(&i915->mm.free_count);
 
-	/*
-	 * This serializes freeing with the shrinker. Since the free
-	 * is delayed, first by RCU then by the workqueue, we want the
-	 * shrinker to be able to free pages of unreferenced objects,
-	 * or else we may oom whilst there are plenty of deferred
-	 * freed objects.
-	 */
-	i915_gem_object_make_unshrinkable(obj);
-
 	/*
 	 * Since we require blocking on struct_mutex to unbind the freed
 	 * object from the GPU before releasing resources back to the
-- 
2.26.3

