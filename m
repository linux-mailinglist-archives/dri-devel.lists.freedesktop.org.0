Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7E5A39CA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 21:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2E210ED2B;
	Sat, 27 Aug 2022 19:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5651110ED24;
 Sat, 27 Aug 2022 19:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661629526; x=1693165526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bZ9+B1o/D1zRT6hV2AtJ7lVvAUEF2WK5WCBirwF4nsA=;
 b=SGmItLz5i/GtgLnS2xirYj8di++0HeKFf6xyt68U+fdPcuDRrQz29Fo4
 ihvVpc+99pvY6AJxG3ODfLT2TV/HaWSlozr5cKhfZLgMbhdaf53Cn08H4
 uz/Ub37/lRwgdhawAmfwHtz6ctOUSU0lfRvIvf8w1CBcAXLFtgsFo7Pyq
 nKvOT8kAYt4kukAFX4ZWnkOLWaFV7h6YxwGW2E3HZ4JbaZJIwatcRe+YS
 e8GoeGXHbyko8sInpr4t898rfEqlwSGC3t2c80Jq8uwTdQuBpubgQAg/R
 uhw8I1aFEIALmW8/N6VzNg84IQ0yraPIjHJQUmJsOIRC33ytIRNT/PeVq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10452"; a="294695591"
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="294695591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,269,1654585200"; d="scan'208";a="640457661"
Received: from hluxenbu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 12:45:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 02/17] drm/i915: Mark vm for vm_bind usage at creation
Date: Sat, 27 Aug 2022 21:43:48 +0200
Message-Id: <20220827194403.6495-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220827194403.6495-1-andi.shyti@linux.intel.com>
References: <20220827194403.6495-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Ramalingam C <ramalingampc2008@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

At vm creation time, add a flag to indicate that the new vm will use
vm_bind only for object binding.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 ++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h         | 8 ++++++++
 include/uapi/drm/i915_drm.h                 | 3 ++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index fdd3e3bfd4088..2e25341f78ab6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1808,7 +1808,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (!HAS_FULL_PPGTT(i915))
 		return -ENODEV;
 
-	if (args->flags)
+	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
 		return -EINVAL;
 
 	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
@@ -1828,6 +1828,9 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto err_put;
 
+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND)
+		ppgtt->vm.vm_bind_mode = true;
+
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
 	return 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index e639434e97fdb..da21088890b3b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -271,6 +271,14 @@ struct i915_address_space {
 	/* Skip pte rewrite on unbind for suspend. Protected by @mutex */
 	bool skip_pte_rewrite:1;
 
+	/**
+	 * @vm_bind_mode: flag to indicate vm_bind method of binding
+	 *
+	 * True: allow only vm_bind method of binding.
+	 * False: allow only legacy execbuff method of binding.
+	 */
+	bool vm_bind_mode:1;
+
 	u8 top;
 	u8 pd_shift;
 	u8 scratch_order;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 520ad2691a99d..12435db751eb8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2522,7 +2522,8 @@ struct drm_i915_gem_vm_control {
 	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
 
-	/** @flags: reserved for future usage, currently MBZ */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
+#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
 	__u32 flags;
 
 	/** @vm_id: Id of the VM created or to be destroyed */
-- 
2.34.1

