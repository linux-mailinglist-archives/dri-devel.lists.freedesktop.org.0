Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E012B7A93F7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B7310E5DB;
	Thu, 21 Sep 2023 11:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C57610E5D5;
 Thu, 21 Sep 2023 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296940; x=1726832940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5jfoHNJS0McsYshlIpXdMGiO2HDTMCQ8PZKGgsbIxCw=;
 b=DWNYkXOckxSrFOep+NmxsszuYY/uZh3K2AC5bJ0WMQgK6rjkINUYfjJr
 y4I/v5gjkt22TGWC+JeqF2z2lsZJsMRzFG5R9XgejRpDpcOYa2D1RqN6U
 /ClmdW8HCXQxpcIN2O9QUYqdWdusXGy/rILZKlrkUQQQS/6CE7Z4ZF3gl
 rFBs1/VRkxR9HqPP/JGdUqkE55mjbwvJ50ht7SlfMAVc/ORNMMXDlFcJs
 ZDI/K+PTv0PD0ee4UMKF7nn/rTNl5IQXuEc6Pabkw8zLILIGhxsXqIbs7
 mrAmkYozWI7rLvFwyjFPjtT4bfKXmUBft8wXE3RBh30CcJZvHzmIC1E5M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384336789"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="384336789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920700884"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="920700884"
Received: from asilke-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:58 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Record which client owns a VM
Date: Thu, 21 Sep 2023 12:48:49 +0100
Message-Id: <20230921114852.192862-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

To enable accounting of indirect client memory usage (such as page tables)
in the following patch, lets start recording the creator of each PPGTT.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 11 ++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  3 +++
 drivers/gpu/drm/i915/gem/selftests/mock_context.c |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gtt.h               |  1 +
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9a9ff84c90d7..35cf6608180e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -279,7 +279,8 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 }
 
 static struct i915_gem_proto_context *
-proto_context_create(struct drm_i915_private *i915, unsigned int flags)
+proto_context_create(struct drm_i915_file_private *fpriv,
+		     struct drm_i915_private *i915, unsigned int flags)
 {
 	struct i915_gem_proto_context *pc, *err;
 
@@ -287,6 +288,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	if (!pc)
 		return ERR_PTR(-ENOMEM);
 
+	pc->fpriv = fpriv;
 	pc->num_user_engines = -1;
 	pc->user_engines = NULL;
 	pc->user_flags = BIT(UCONTEXT_BANNABLE) |
@@ -1621,6 +1623,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
 			err = PTR_ERR(ppgtt);
 			goto err_ctx;
 		}
+		ppgtt->vm.fpriv = pc->fpriv;
 		vm = &ppgtt->vm;
 	}
 	if (vm)
@@ -1740,7 +1743,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	/* 0 reserved for invalid/unassigned ppgtt */
 	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
 
-	pc = proto_context_create(i915, 0);
+	pc = proto_context_create(file_priv, i915, 0);
 	if (IS_ERR(pc)) {
 		err = PTR_ERR(pc);
 		goto err;
@@ -1822,6 +1825,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
+	ppgtt->vm.fpriv = file_priv;
 	return 0;
 
 err_put:
@@ -2284,7 +2288,8 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		return -EIO;
 	}
 
-	ext_data.pc = proto_context_create(i915, args->flags);
+	ext_data.pc = proto_context_create(file->driver_priv, i915,
+					   args->flags);
 	if (IS_ERR(ext_data.pc))
 		return PTR_ERR(ext_data.pc);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index cb78214a7dcd..c573c067779f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -188,6 +188,9 @@ struct i915_gem_proto_engine {
  * CONTEXT_CREATE_SET_PARAM during GEM_CONTEXT_CREATE.
  */
 struct i915_gem_proto_context {
+	/** @fpriv: Client which creates the context */
+	struct drm_i915_file_private *fpriv;
+
 	/** @vm: See &i915_gem_context.vm */
 	struct i915_address_space *vm;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index 8ac6726ec16b..125584ada282 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -83,7 +83,7 @@ live_context(struct drm_i915_private *i915, struct file *file)
 	int err;
 	u32 id;
 
-	pc = proto_context_create(i915, 0);
+	pc = proto_context_create(fpriv, i915, 0);
 	if (IS_ERR(pc))
 		return ERR_CAST(pc);
 
@@ -152,7 +152,7 @@ kernel_context(struct drm_i915_private *i915,
 	struct i915_gem_context *ctx;
 	struct i915_gem_proto_context *pc;
 
-	pc = proto_context_create(i915, 0);
+	pc = proto_context_create(NULL, i915, 0);
 	if (IS_ERR(pc))
 		return ERR_CAST(pc);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 346ec8ec2edd..8cf62f5134a9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -248,6 +248,7 @@ struct i915_address_space {
 	struct drm_mm mm;
 	struct intel_gt *gt;
 	struct drm_i915_private *i915;
+	struct drm_i915_file_private *fpriv;
 	struct device *dma;
 	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
 	u64 reserved;		/* size addr space reserved */
-- 
2.39.2

