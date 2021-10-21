Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B4435F57
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0556EC46;
	Thu, 21 Oct 2021 10:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09CF6E42A;
 Thu, 21 Oct 2021 10:36:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 25/28] drm/i915: Require object lock when freeing pages during
 destruction
Date: Thu, 21 Oct 2021 12:36:02 +0200
Message-Id: <20211021103605.735002-25-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
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

TTM already requires this, and we require it for delayed destroy.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 1e426a42a36c..d549f34829d0 100644
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
2.33.0

