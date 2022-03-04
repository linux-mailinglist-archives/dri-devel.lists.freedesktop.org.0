Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF84CCFED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 09:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7510F886;
	Fri,  4 Mar 2022 08:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EEA10F87E;
 Fri,  4 Mar 2022 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646382425; x=1677918425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sLYHV5J8jmnLt2f828BckcOTEH+ElpbXyQ1JMi2jIv0=;
 b=P3OPJHZu2sC/YTaQg8XE1OjSHdXYsVpKTEY12CiTMWTCO59hAPbSPlCl
 OBAj739Goeb63x8AqB8n/cDFTeDrbC7A61aLImrM8xUrTgRbI8xNmguKK
 jBt7q8UfCCIFIbKn1OXEBOOzgo/rxW8Glift/42jubHCNoYdhVuN24098
 iR4plUFvmGuOq1CtqERavsOJTuJywMUM6pJCybxQHJKjqPzaqFFaChBlF
 S8v++BwiE5KQqBDGk8w1HVqatVxhgG1yVPg8qOu5XWKhbwB84fmpAc1NJ
 p2VYaBm9Pqam773YbGwpjNCRjccmuST/IgLh+HoI/Zcpi682OXC7ivWMp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="233887219"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="233887219"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 00:26:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="810380414"
Received: from mmazarel-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.59])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 00:26:56 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/i915/gem: Remove some unnecessary code
Date: Fri,  4 Mar 2022 09:26:41 +0100
Message-Id: <20220304082641.308069-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304082641.308069-1-thomas.hellstrom@linux.intel.com>
References: <20220304082641.308069-1-thomas.hellstrom@linux.intel.com>
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
 niranjana.vishwanathapura@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test for vma should always return true, and when assigning -EBUSY
to ret, the variable should already have that value.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index c26110abcc0b..9747924cc57b 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -118,6 +118,7 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 			   unsigned long flags)
 {
 	struct intel_runtime_pm *rpm = &to_i915(obj->base.dev)->runtime_pm;
+	bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
 	LIST_HEAD(still_in_list);
 	intel_wakeref_t wakeref;
 	struct i915_vma *vma;
@@ -170,26 +171,21 @@ int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
 		 * and destroy the vma from under us.
 		 */
 
-		if (vma) {
-			bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
-			ret = -EBUSY;
-			if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
-				assert_object_held(vma->obj);
-				ret = i915_vma_unbind_async(vma, vm_trylock);
-			}
+		ret = -EBUSY;
+		if (flags & I915_GEM_OBJECT_UNBIND_ASYNC) {
+			assert_object_held(vma->obj);
+			ret = i915_vma_unbind_async(vma, vm_trylock);
+		}
 
-			if (ret == -EBUSY && (flags & I915_GEM_OBJECT_UNBIND_ACTIVE ||
-					      !i915_vma_is_active(vma))) {
-				if (vm_trylock) {
-					if (mutex_trylock(&vma->vm->mutex)) {
-						ret = __i915_vma_unbind(vma);
-						mutex_unlock(&vma->vm->mutex);
-					} else {
-						ret = -EBUSY;
-					}
-				} else {
-					ret = i915_vma_unbind(vma);
+		if (ret == -EBUSY && (flags & I915_GEM_OBJECT_UNBIND_ACTIVE ||
+				      !i915_vma_is_active(vma))) {
+			if (vm_trylock) {
+				if (mutex_trylock(&vma->vm->mutex)) {
+					ret = __i915_vma_unbind(vma);
+					mutex_unlock(&vma->vm->mutex);
 				}
+			} else {
+				ret = i915_vma_unbind(vma);
 			}
 		}
 
-- 
2.34.1

