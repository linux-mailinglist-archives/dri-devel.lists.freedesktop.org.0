Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF848692A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA2D10EABD;
	Thu,  6 Jan 2022 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889A10EEEC;
 Thu,  6 Jan 2022 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641491371; x=1673027371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SCnzuQi3dotUBtBqeb54lLg+lQjxadOrtik/jgsOtJU=;
 b=ZI6mH4AQhm8wcu7RgJSQreGY5Gp8VY+xngla+lYi9ot0Poh0oNWPCrKu
 5NtufM4IRl/IyNXOo/rdGWZOwE7lwzLRTXyHJlUmcRvt/4HA0t5bo/hEe
 gmS4PRwHmIhK/vb/MVtOu3fhWuCoBKs/L+ZbBBoy2Mr7Tbcw3xA5VBtHF
 o9qmDQSr9ktM7Xe9AVh7YJKuGK98vNiNDb3Mmb9Ja4xV7AMmFwO5LRJ3d
 U9hfiVvuEwZqSI1WmV15IzRmp3ks6uNdUeZ7567EeID267zJQTPeeDbXw
 FuqcizzabccNkCPlkUTRFXHVmzOfnmUHfTtGs6YkLAE1Jtzd1VxPp00nZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266993590"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="266993590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 09:49:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="473015665"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.65.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 09:49:26 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/i915/ttm: ensure we unmap when purging
Date: Thu,  6 Jan 2022 17:49:10 +0000
Message-Id: <20220106174910.280616-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220106174910.280616-1-matthew.auld@intel.com>
References: <20220106174910.280616-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Purging can happen during swapping out, or directly invoked with the
madvise ioctl. In such cases this doesn't involve a ttm move, which
skips umapping the object.

v2(Thomas):
- add ttm_truncate helper, and just call into i915_ttm_move_notify() to
  handle the unmapping step

Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 1530d9f0bc81..de3fe79b665a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -556,6 +556,20 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
 	return intel_region_ttm_resource_to_rsgt(obj->mm.region, res);
 }
 
+static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
+{
+	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
+	int err;
+
+	WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
+
+	err = i915_ttm_move_notify(bo);
+	if (err)
+		return err;
+
+	return i915_ttm_purge(obj);
+}
+
 static void i915_ttm_swap_notify(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
@@ -962,7 +976,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
-	.truncate = i915_ttm_purge,
+	.truncate = i915_ttm_truncate,
 	.shrinker_release_pages = i915_ttm_shrinker_release_pages,
 
 	.adjust_lru = i915_ttm_adjust_lru,
-- 
2.31.1

