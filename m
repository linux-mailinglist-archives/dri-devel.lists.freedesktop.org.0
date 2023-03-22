Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D46C3EFF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 01:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B07D10E1BE;
	Wed, 22 Mar 2023 00:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AF110E1BE;
 Wed, 22 Mar 2023 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679444206; x=1710980206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQRvDdEwtNbMpD1/VG+PiGuCcO/ubN5B6Hxbv2NvjwU=;
 b=F3tJtTVMBi33+/RioFHdhjqnFJcYmBQPvtKW/uieebOaSjqfAlgz7eRw
 b7LQCw7rFmCGGl9KdCYx74KmnAbXslp8QP3KganZ5Hr8ABo+hmsWZpRqa
 4iS/2m+aLW/6jyWO5RAq4vpVIrD/gHtzt4lTRe6h72QkaYrJswqfO697r
 bJQiQ9O32JI/nuk6KJOUV53JHE12/n/Zq6esMGbl9hKzv3BIxCaWQRMej
 QMhx0sl/ZubfjU9BHWVx54xVhUkmcZJzTryZlfJrXLYmaFK37PEPT13m8
 cUAC0kZL2AL9C98H7llF4h1l/JXdcse6LrpJInXPZp54ripHVefwJLbw4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319477921"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="319477921"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825181538"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="825181538"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 17:16:42 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use i915 instead of dev_priv insied the file_priv
 structure
Date: Wed, 22 Mar 2023 01:16:11 +0100
Message-Id: <20230322001611.632321-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the process of renaming all instances of 'dev_priv' to 'i915',
start using 'i915' within the 'drm_i915_file_private' structure.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 22 ++++++++++-----------
 drivers/gpu/drm/i915/i915_drm_client.c      |  2 +-
 drivers/gpu/drm/i915/i915_file_private.h    |  2 +-
 drivers/gpu/drm/i915/i915_gem.c             |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 6d639ca24dfbb..5402a7bbcb1d1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -364,7 +364,7 @@ static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
 			    struct i915_gem_proto_context *pc,
 			    const struct drm_i915_gem_context_param *args)
 {
-	struct drm_i915_private *i915 = fpriv->dev_priv;
+	struct drm_i915_private *i915 = fpriv->i915;
 	struct i915_address_space *vm;
 
 	if (args->size)
@@ -733,7 +733,7 @@ static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
 			         struct i915_gem_proto_context *pc,
 			         const struct drm_i915_gem_context_param *args)
 {
-	struct drm_i915_private *i915 = fpriv->dev_priv;
+	struct drm_i915_private *i915 = fpriv->i915;
 	struct set_proto_ctx_engines set = { .i915 = i915 };
 	struct i915_context_param_engines __user *user =
 		u64_to_user_ptr(args->value);
@@ -813,7 +813,7 @@ static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
 			      struct i915_gem_proto_context *pc,
 			      struct drm_i915_gem_context_param *args)
 {
-	struct drm_i915_private *i915 = fpriv->dev_priv;
+	struct drm_i915_private *i915 = fpriv->i915;
 	struct drm_i915_gem_context_param_sseu user_sseu;
 	struct intel_sseu *sseu;
 	int ret;
@@ -913,7 +913,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 		break;
 
 	case I915_CONTEXT_PARAM_PRIORITY:
-		ret = validate_priority(fpriv->dev_priv, args);
+		ret = validate_priority(fpriv->i915, args);
 		if (!ret)
 			pc->sched.priority = args->value;
 		break;
@@ -934,12 +934,12 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
 		if (args->size)
 			ret = -EINVAL;
 		else
-			ret = proto_context_set_persistence(fpriv->dev_priv, pc,
+			ret = proto_context_set_persistence(fpriv->i915, pc,
 							    args->value);
 		break;
 
 	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
-		ret = proto_context_set_protected(fpriv->dev_priv, pc,
+		ret = proto_context_set_protected(fpriv->i915, pc,
 						  args->value);
 		break;
 
@@ -1770,7 +1770,7 @@ void i915_gem_context_close(struct drm_file *file)
 	unsigned long idx;
 
 	xa_for_each(&file_priv->proto_context_xa, idx, pc)
-		proto_context_close(file_priv->dev_priv, pc);
+		proto_context_close(file_priv->i915, pc);
 	xa_destroy(&file_priv->proto_context_xa);
 	mutex_destroy(&file_priv->proto_context_lock);
 
@@ -2206,7 +2206,7 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
 
 	lockdep_assert_held(&file_priv->proto_context_lock);
 
-	ctx = i915_gem_create_context(file_priv->dev_priv, pc);
+	ctx = i915_gem_create_context(file_priv->i915, pc);
 	if (IS_ERR(ctx))
 		return ctx;
 
@@ -2223,7 +2223,7 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
 
 	old = xa_erase(&file_priv->proto_context_xa, id);
 	GEM_BUG_ON(old != pc);
-	proto_context_close(file_priv->dev_priv, pc);
+	proto_context_close(file_priv->i915, pc);
 
 	return ctx;
 }
@@ -2352,7 +2352,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 	GEM_WARN_ON(ctx && pc);
 
 	if (pc)
-		proto_context_close(file_priv->dev_priv, pc);
+		proto_context_close(file_priv->i915, pc);
 
 	if (ctx)
 		context_close(ctx);
@@ -2505,7 +2505,7 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 			 * GEM_CONTEXT_CREATE starting with graphics
 			 * version 13.
 			 */
-			WARN_ON(GRAPHICS_VER(file_priv->dev_priv) > 12);
+			WARN_ON(GRAPHICS_VER(file_priv->i915) > 12);
 			ret = set_proto_ctx_param(file_priv, pc, args);
 		} else {
 			ret = -ENOENT;
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index b09d1d3865740..e8fa172ebe5ee 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -130,7 +130,7 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
 	struct drm_i915_file_private *file_priv = file->driver_priv;
-	struct drm_i915_private *i915 = file_priv->dev_priv;
+	struct drm_i915_private *i915 = file_priv->i915;
 	struct i915_drm_client *client = file_priv->client;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	unsigned int i;
diff --git a/drivers/gpu/drm/i915/i915_file_private.h b/drivers/gpu/drm/i915/i915_file_private.h
index f428778696925..c9cb8eecacde0 100644
--- a/drivers/gpu/drm/i915/i915_file_private.h
+++ b/drivers/gpu/drm/i915/i915_file_private.h
@@ -15,7 +15,7 @@ struct drm_file;
 struct i915_drm_client;
 
 struct drm_i915_file_private {
-	struct drm_i915_private *dev_priv;
+	struct drm_i915_private *i915;
 
 	union {
 		struct drm_file *file;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 35950fa914068..2ba922fbbd5ff 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1313,7 +1313,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 	}
 
 	file->driver_priv = file_priv;
-	file_priv->dev_priv = i915;
+	file_priv->i915 = i915;
 	file_priv->file = file;
 	file_priv->client = client;
 
-- 
2.39.2

