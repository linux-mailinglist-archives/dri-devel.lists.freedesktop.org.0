Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F762C6596
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CB96ECB8;
	Fri, 27 Nov 2020 12:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BF96ECE3;
 Fri, 27 Nov 2020 12:12:47 +0000 (UTC)
IronPort-SDR: d4TUJGcSyFiSi2BeInKXvDq+vtuWPKWPx+xc+nXG8JBtYXw7YEPEv6ppZ2gnFlJaPs3kaWptpn
 mb/g9OfBt6fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883889"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883889"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:30 -0800
IronPort-SDR: hJ9uWPKTUe3z2RdeugnykWKbQ25OP9Xtf6/xYS8XCNfgi98e4Zz7GP0mh+X5WksoeQwVcDBXHW
 4JMd7gBcDAww==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030070"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 158/162] drm/i915: Support ww locks in suspend/resume
Date: Fri, 27 Nov 2020 12:07:14 +0000
Message-Id: <20201127120718.454037-159-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

Add ww locks during suspend/resume.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index b7d40a9c00bf..c41865d5bf1e 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1099,7 +1099,7 @@ static int i915_drm_prepare(struct drm_device *dev)
 	struct drm_i915_private *i915 = to_i915(dev);
 
 	if (HAS_LMEM(i915))     {
-		struct intel_gt *gt= &i915->gt;
+		struct intel_gt *gt = &i915->gt;
 		long timeout = I915_GEM_IDLE_TIMEOUT;
 		int ret;
 
@@ -1182,7 +1182,8 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_object *obj;
 	struct intel_memory_region *mem;
-	int id, ret = 0;
+	struct i915_gem_ww_ctx ww;
+	int id, ret = 0, err = 0;
 
 	for_each_memory_region(mem, i915, id) {
 		struct list_head still_in_list;
@@ -1204,19 +1205,20 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend,
 
 				mutex_unlock(&mem->objects.lock);
 
+				i915_gem_ww_ctx_init (&ww, true);
+retry:
+				err = i915_gem_object_lock(obj, &ww);
+				if (err)
+					goto out_err;
+
 				if (in_suspend) {
 					obj->swapto = NULL;
 					obj->evicted = false;
 
 					ret = i915_gem_object_unbind(obj, 0);
 					if (ret || i915_gem_object_has_pinned_pages(obj)) {
-						if (!i915_gem_object_trylock(obj)) {
-							ret = -EBUSY;
-							goto next;
-						}
 						ret = i915_gem_perma_pinned_object_swapout(obj);
-						i915_gem_object_unlock(obj);
-						goto next;
+						goto out_err;
 					}
 
 					obj->do_swapping = true;
@@ -1228,13 +1230,7 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend,
 						obj->evicted = true;
 				} else {
 					if (i915_gem_object_has_pinned_pages(obj) && perma_pin) {
-						if (!i915_gem_object_trylock(obj)) {
-							ret = -EBUSY;
-							goto next;
-						}
 						ret = i915_gem_perma_pinned_object_swapin(obj);
-						/* FIXME: Where is this error message taken care of? */
-						i915_gem_object_unlock(obj);
 					}
 
 					if (obj->swapto && obj->evicted && !perma_pin) {
@@ -1247,7 +1243,14 @@ static int intel_dmem_evict_buffers(struct drm_device *dev, bool in_suspend,
 						}
 					}
 				}
-next:
+out_err:
+				if (err ==  -EDEADLK) {
+					err = i915_gem_ww_ctx_backoff(&ww);
+					if (!err)
+						goto retry;
+				}
+				i915_gem_ww_ctx_fini(&ww);
+
 				mutex_lock(&mem->objects.lock);
 				if (ret)
 					break;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
