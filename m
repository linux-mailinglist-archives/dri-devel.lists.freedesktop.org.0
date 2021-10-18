Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251904312EA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 11:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC4C6E9C0;
	Mon, 18 Oct 2021 09:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208496E9B3;
 Mon, 18 Oct 2021 09:12:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="209001425"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="209001425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:11:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="443330278"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:11:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v9 7/8] drm/i915/ttm: use cached system pages when evicting
 lmem
Date: Mon, 18 Oct 2021 10:10:54 +0100
Message-Id: <20211018091055.1998191-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018091055.1998191-1-matthew.auld@intel.com>
References: <20211018091055.1998191-1-matthew.auld@intel.com>
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

This should let us do an accelerated copy directly to the shmem pages
when temporarily moving lmem-only objects, where the i915-gem shrinker
can later kick in to swap out the pages, if needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8de1031a2c6e..d37581d9194c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -134,11 +134,11 @@ static enum ttm_caching
 i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
 {
 	/*
-	 * Objects only allowed in system get cached cpu-mappings.
-	 * Other objects get WC mapping for now. Even if in system.
+	 * Objects only allowed in system get cached cpu-mappings, or when
+	 * evicting lmem-only buffers to system for swapping. Other objects get
+	 * WC mapping for now. Even if in system.
 	 */
-	if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
-	    obj->mm.n_placements <= 1)
+	if (obj->mm.n_placements <= 1)
 		return ttm_cached;
 
 	return ttm_write_combined;
-- 
2.26.3

