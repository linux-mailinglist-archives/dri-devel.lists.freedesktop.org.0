Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFE63917B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 23:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A2510E7BC;
	Fri, 25 Nov 2022 22:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F67710E7BC;
 Fri, 25 Nov 2022 22:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669415474; x=1700951474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GvXKeOHV66xn/CaKi+dZL1kW7UcAHgAn6ZGGG4zaliA=;
 b=gGfgDxtyV2hKfTS3AhpAG0YuxV3JMdCHJp7unXDGSEZFypFYoXQmnde7
 XgcsLLtSISlrpPGIVEXByx+mRLssgjFe/bzr7pJMIb/D/sg5Biw+Vy7Zy
 RIKIEJYPaYKgPFKqdz/hSoFeBiSGlGd00R9ZY5FLSY6jyhOl6SokszngB
 VPczFQCvGX6iVfFpcXWZjFMARzc2k7v6JLoJ7Hhe3lRv8FqYkj0eg5/C1
 DgEqM7LiQfPTR7rU/4fsw9gPsisJoxtydiqFTqqbiUe+8P7mhiJ01gIs+
 Mgm5qjUDgYJIqZCpAEmyOSwexhKF0g/EeO7wAik9BMN6m+aYZeot0hduJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="400836019"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="400836019"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 14:31:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="887798474"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="887798474"
Received: from ncataldi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.225])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 14:31:11 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/i915: Limit the display memory alignment to 32 bit
 instead of 64
Date: Fri, 25 Nov 2022 23:30:29 +0100
Message-Id: <20221125223029.323339-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125223029.323339-1-andi.shyti@linux.intel.com>
References: <20221125223029.323339-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
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
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chris commit "drm/i915: Introduce guard pages to i915_vma" was
"cunningly" changing display_alignment to u32 from u64. The
reason is that the display GGTT is and will be limited o 4GB.

Put it in a separate patch and use "max(...)" instead of
"max_t(64, ...)" when asigning the value. We can safely use max
as we know beforehand that the comparison is between two u32
variables.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb_pin.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c  | 2 +-
 drivers/gpu/drm/i915/i915_vma_types.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 6900acbb1381c..1aca7552a85d0 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -91,7 +91,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 		goto err;
 	}
 
-	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
+	vma->display_alignment = max(vma->display_alignment, alignment);
 
 	i915_gem_object_flush_if_display(obj);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index 882b91519f92b..9969e687ad857 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -457,7 +457,7 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	if (IS_ERR(vma))
 		return vma;
 
-	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
+	vma->display_alignment = max(vma->display_alignment, alignment);
 	i915_vma_mark_scanout(vma);
 
 	i915_gem_object_flush_if_display_locked(obj);
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 46f5ce19d4a0a..77fda2244d161 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -197,7 +197,6 @@ struct i915_vma {
 	struct i915_fence_reg *fence;
 
 	u64 size;
-	u64 display_alignment;
 	struct i915_page_sizes page_sizes;
 
 	/* mmap-offset associated with fencing for this vma */
@@ -206,6 +205,7 @@ struct i915_vma {
 	u32 guard; /* padding allocated around vma->pages within the node */
 	u32 fence_size;
 	u32 fence_alignment;
+	u32 display_alignment;
 
 	/**
 	 * Count of the number of times this vma has been opened by different
-- 
2.38.1

