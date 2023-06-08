Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739AF72830A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16810E075;
	Thu,  8 Jun 2023 14:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5C10E241;
 Thu,  8 Jun 2023 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686235906; x=1717771906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vEqW0IhJSpIseqUd395Z2yQwNDGZgrpkwT/H00I1x4w=;
 b=PCdlsLujPVaTXv4JFWO+SgYwznpL1yHMRUDSImjZZhBA6tgvlcAQ0Z9q
 ap364VzKsxLWNHojCAU7E6Dj/hJAcHfnFXjsApCJp2+tXqVbamaogYlY0
 Q9r3Z0nNMPkz9FMzf44S/w/oRJilnfaNpz80U4XoFoMtIx494adZ9zrGp
 T1ytUjv1b67KNc/RVdcmpD4pFWv0LF7BiWZk4tx86FDJp4fk0+AwykwW3
 ql9+mUa/bKGpfXAqzBWet4pQRFzr9HivK9Sdtp0su34YVV+znWsLWCjvz
 tRMGzuNVlVg9E9MXyV3nOCUiXPkrtywfCAA1KYTiRpOqG2XEmERJHB9xl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="336957598"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="336957598"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704134521"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="704134521"
Received: from rirwin-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.227])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:42 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915: Record which clients own a VM
Date: Thu,  8 Jun 2023 15:51:30 +0100
Message-Id: <20230608145133.1059554-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
References: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

To enable accounting of indirect client memory usage (such as page tables)
in the following patch, lets start recording the creator of each PPGTT.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 11 ++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  3 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h               |  1 +
 3 files changed, 12 insertions(+), 3 deletions(-)

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
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4d6296cdbcfd..7192a534a654 100644
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

