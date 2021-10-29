Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1D43F8F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57A6EA33;
	Fri, 29 Oct 2021 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EBD6EA30;
 Fri, 29 Oct 2021 08:32:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="210671297"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="210671297"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:32:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="448302275"
Received: from hohiggin-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.197.138])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:32:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 10/10] drm/i915: Require object lock when freeing pages
 during destruction
Date: Fri, 29 Oct 2021 09:31:18 +0100
Message-Id: <20211029083118.3386312-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211029083118.3386312-1-matthew.auld@intel.com>
References: <20211029083118.3386312-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

TTM already requires this, and we require it for delayed destroy.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 55b0f1df3192..6e5412e2b5ad 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -257,6 +257,8 @@ static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
  */
 void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 {
+	assert_object_held(obj);
+
 	if (!list_empty(&obj->vma.list)) {
 		struct i915_vma *vma;
 
@@ -323,7 +325,10 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 			obj->ops->delayed_free(obj);
 			continue;
 		}
+
+		i915_gem_object_lock(obj, NULL);
 		__i915_gem_object_pages_fini(obj);
+		i915_gem_object_unlock(obj);
 		__i915_gem_free_object(obj);
 
 		/* But keep the pointer alive for RCU-protected lookups */
-- 
2.26.3

