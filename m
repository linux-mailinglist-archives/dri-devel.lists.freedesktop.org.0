Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC144B2476
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151CE10EACD;
	Fri, 11 Feb 2022 11:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4541810EACD;
 Fri, 11 Feb 2022 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579305; x=1676115305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bm4/VWwj73yolCQPcub7eYPn8GkUx5eYPoPj/s9kAPo=;
 b=KE39b5FAhcp86lCJ74C9KG8BpbuXxUeG9lCCEGZyBm25IPM6FFHKhIFJ
 ut6KpCUR5b8PTMQKo0qHMKYkOrEbzK0mXa5Qey0fOwM8rousTSwRiaTgo
 pTSw/9b8pznmGMyEZZtdHaLwzh72tdt6PUwBAIqdCo48MfWxhVqgUdWo2
 T9Alq6xp40nuB4omBRRZr4rdPl/hTPB+Q2xarkrjWd0hIha6WYoGd4v9t
 v52fuFJYuyAvqXS7BsX8XVJU/Qnl/08CgMDJGY7Safldgs3VKbyi/Ossf
 zduips/WcUQrl7n5R0RlEdShzgkcg7akEpgjmFK55K+Ivz1lbJt7tQY/B A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548257"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602355005"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:03 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 12/15] drm/i915/create: apply ALLOC_GPU_ONLY by default
Date: Fri, 11 Feb 2022 11:34:34 +0000
Message-Id: <20220211113437.874691-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
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
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from DG2+, when dealing with LMEM, we assume that by default
all userspace allocations should be placed in the non-mappable portion
of LMEM.  Note that dumb buffers are not included here, since these are
not "GPU accelerated" and likely need CPU access. We choose to just
always set GPU_ONLY, and let the backend figure out if that should be
ignored on discrete devices.

In a later patch userspace will be able to provide a hint if CPU access
to the buffer is needed.

v2(Thomas)
 - Apply GPU_ONLY on all discrete devices, but only if the BO can be
   placed in LMEM. Down in the depths this should be turned into a noop,
   where required, and as an annotation it still make some sense. If we
   apply it regardless of the placements then we end up needing to check
   the placements during exec capture. Also it's slightly inconsistent
   since the NEEDS_CPU_ACCESS can only be applied on objects that can be
   placed in LMEM. The other annoyance would be gem_create_ext vs plain
   gem_create, if we were to always apply GPU_ONLY.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 9402d4bf4ffc..ecb8c2feec46 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -424,6 +424,14 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
 		ext_data.n_placements = 1;
 	}
 
+	/*
+	 * TODO: add a userspace hint to force CPU_ACCESS for the object, which
+	 * can override this.
+	 */
+	if (ext_data.n_placements > 1 ||
+	    ext_data.placements[0]->type != INTEL_MEMORY_SYSTEM)
+		ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
+
 	obj = __i915_gem_object_create_user_ext(i915, args->size,
 						ext_data.placements,
 						ext_data.n_placements,
-- 
2.34.1

