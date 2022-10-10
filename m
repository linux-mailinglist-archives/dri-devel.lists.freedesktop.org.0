Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EBD5F98C1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 08:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5065F10E661;
	Mon, 10 Oct 2022 06:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A235110E636;
 Mon, 10 Oct 2022 06:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665385134; x=1696921134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qlq1IObP68vJbvkP+CaTOW2ez5IfZtikRpOP2Z8uyro=;
 b=OOO6i9MAwNyfhzn2LRwUmidDu3FvYGGv2kBk9LjRKQw32Jz0doQkz+ZN
 JiRfexnqZ1aYb3aRCWmZj4+KSfpPc2kpjPZt5ojYgpVBwzy2TzXQ3hiW4
 Jf062dxXUTilpI38n75l4zPyCeCSV3ieBQHAOGMGRRvFh/Ahf6EWRbqPW
 TBU98U7lx/j9XQUlUmxXFh/Fb+zDElypX59xA8LSck4+iYBpAAWWQMUNE
 aWlUVVZ4LN57IoQ/ZMaoVGnxXw+kdcgPFAe5+/1H216DV+SX1tlqefspQ
 BhK87Okil7cKxJeClZI1gPxUaJMKLKBwJ3MjleES73KZsC5dlbhzinDDF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="305752991"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="305752991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2022 23:58:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="576947129"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="576947129"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 09 Oct 2022 23:58:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/17] drm/i915/vm_bind: Expose vm lookup function
Date: Sun,  9 Oct 2022 23:58:10 -0700
Message-Id: <20221010065826.32037-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make i915_gem_vm_lookup() function non-static as it will be
used by the vm_bind feature.

Acked-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 11 ++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 1e29b1e6d186..793345cbf99e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -346,7 +346,16 @@ static int proto_context_register(struct drm_i915_file_private *fpriv,
 	return ret;
 }
 
-static struct i915_address_space *
+/**
+ * i915_gem_vm_lookup() - looks up for the VM reference given the vm id
+ * @file_priv: the private data associated with the user's file
+ * @id: the VM id
+ *
+ * Finds the VM reference associated to a specific id.
+ *
+ * Returns the VM pointer on success, NULL in case of failure.
+ */
+struct i915_address_space *
 i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
 {
 	struct i915_address_space *vm;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..899fa8f1e0fe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -139,6 +139,9 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
 
+struct i915_address_space *
+i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id);
+
 struct i915_gem_context *
 i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
 
-- 
2.21.0.rc0.32.g243a4c7e27

