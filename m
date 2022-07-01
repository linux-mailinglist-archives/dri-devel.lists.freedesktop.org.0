Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F1563C96
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CC41126A4;
	Fri,  1 Jul 2022 22:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA08511259B;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=80hjzPTeGxeXxOGv0eYJOCogMf1Z0537GlzLcMFRirw=;
 b=Paf65SO11YUKiuwI60yRaAFNoSWfqqEQcLLMbCriXZOSIBYZpG89q3Mv
 KEUTlysqSwAYxD6IpZdE4qSvYOvbgQSMAXke0sB6L3i3tU1zMIFJSb0XE
 yBaz7fkuCdiFlwtnM+7N9dYhRj8zIsTYFytuFZxWV3mfBTjWJs+PUkbDY
 Fm6mdP6s21MePm9QhckYtb/ePIVjxxq4fY9R4uSHuxdHLCsqkqEucsODw
 M4sZk3vFXAqZuWqwB709x5YYOOD4WIlciFEv00lExc/S1WF62eou+Gs2X
 qpOx66rsUV0T3Pgbc6wT3q+wGYNh2P2eDc7iBn9RYNukdjfsDtmhzWVBA w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789056"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789056"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645112"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 09/10] drm/i915/vm_bind: Skip vma_lookup for persistent vmas
Date: Fri,  1 Jul 2022 15:50:54 -0700
Message-Id: <20220701225055.8204-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vma_lookup is tied to segment of the object instead of section
of VA space. Hence, it do not support aliasing (ie., multiple
bindings to the same section of the object).
Skip vma_lookup for persistent vmas as it supports aliasing.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 6adb013579be..9aa38b772b5b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -197,6 +197,10 @@ vma_create(struct drm_i915_gem_object *obj,
 		__set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
 	}
 
+	if (!i915_vma_is_ggtt(vma) &&
+	    (view && view->type == I915_GGTT_VIEW_PARTIAL))
+		goto skip_rb_insert;
+
 	rb = NULL;
 	p = &obj->vma.tree.rb_node;
 	while (*p) {
@@ -221,6 +225,7 @@ vma_create(struct drm_i915_gem_object *obj,
 	rb_link_node(&vma->obj_node, rb, p);
 	rb_insert_color(&vma->obj_node, &obj->vma.tree);
 
+skip_rb_insert:
 	if (i915_vma_is_ggtt(vma))
 		/*
 		 * We put the GGTT vma at the start of the vma-list, followed
@@ -292,13 +297,16 @@ i915_vma_instance(struct drm_i915_gem_object *obj,
 		  struct i915_address_space *vm,
 		  const struct i915_ggtt_view *view)
 {
-	struct i915_vma *vma;
+	struct i915_vma *vma = NULL;
 
 	GEM_BUG_ON(!kref_read(&vm->ref));
 
-	spin_lock(&obj->vma.lock);
-	vma = i915_vma_lookup(obj, vm, view);
-	spin_unlock(&obj->vma.lock);
+	if (i915_is_ggtt(vm) || !view ||
+	    view->type != I915_GGTT_VIEW_PARTIAL) {
+		spin_lock(&obj->vma.lock);
+		vma = i915_vma_lookup(obj, vm, view);
+		spin_unlock(&obj->vma.lock);
+	}
 
 	/* vma_create() will resolve the race if another creates the vma */
 	if (unlikely(!vma))
@@ -1670,7 +1678,8 @@ static void release_references(struct i915_vma *vma, bool vm_ddestroy)
 
 	spin_lock(&obj->vma.lock);
 	list_del(&vma->obj_link);
-	if (!RB_EMPTY_NODE(&vma->obj_node))
+	if (!i915_vma_is_persistent(vma) &&
+	    !RB_EMPTY_NODE(&vma->obj_node))
 		rb_erase(&vma->obj_node, &obj->vma.tree);
 
 	spin_unlock(&obj->vma.lock);
-- 
2.21.0.rc0.32.g243a4c7e27

