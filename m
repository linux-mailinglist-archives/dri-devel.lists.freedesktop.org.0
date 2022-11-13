Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBA626E3B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 08:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765E210E1F2;
	Sun, 13 Nov 2022 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C13C10E1EF;
 Sun, 13 Nov 2022 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668326260; x=1699862260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HknDE+XqylXgk4cu6PhqK/1QTnLxO/1vvIcIY6DbF08=;
 b=JKlrxfs4dTMEaLrg6zWfHC/1+VsIZCUmGbmqTVf7iPrPjGmlu4gAVKjT
 9SVil9dctzDMO9dEhBBin7auNTDDyYsUf0H2gR+aWM375tPh4l0lMv+J5
 RecRpwrhZGBs4fiqqaV7oLGT+X3t1Knncp1VjfALbnNz6LMUr/bXLKmhE
 W8mswLYoPJdlc7EUeSkgh3iGsxqEwmSCBduQWYWGyQRaxAFklBWh6bnb5
 9ozze9g+nz0wA3mCuUDVtf1JaGsdsMJ9ShB74v6b0HWa/dfGQViR3Z1Ko
 VnvFerYy/fqT32+qHHychdatMuckk8eLw6KAomRtjEoePjxR6y3Zu+1x3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="312936325"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="312936325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10529"; a="669235688"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="669235688"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2022 23:57:39 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 01/20] drm/i915/vm_bind: Expose vm lookup function
Date: Sat, 12 Nov 2022 23:57:13 -0800
Message-Id: <20221113075732.32100-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 11 ++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7f2831efc798..3a696f61af92 100644
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

