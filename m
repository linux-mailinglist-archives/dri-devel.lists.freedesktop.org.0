Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C413919BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7396ED8A;
	Wed, 26 May 2021 14:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A726ED26;
 Wed, 26 May 2021 14:15:36 +0000 (UTC)
IronPort-SDR: GDUF1OkIfbVMQ2I/DxORd+pcsO3b3P1ygLX+hKxABHrUnXO0AeHXHu/AoTSD6ou3nEgvK+ZKV5
 GslRUJtyvYHg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660603"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:13 -0700
IronPort-SDR: QK5pqXKCM3q6ZNbFnAUlyKvD44gOmYyoVYPYfpVshc+5zKmYA08QySQszR7KOs5PHpaqGAqspJ
 aW8V/Lbs1Uiw==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206325"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/12] drm/i915/selftests: Use a coherent map to setup scratch
 batch buffers
Date: Wed, 26 May 2021 15:14:50 +0100
Message-Id: <20210526141456.2334192-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Instead of manipulating the object's cache domain, just use the device
coherent map to write the batch buffer.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index ce70d0a3afb2..3d8d5f242e34 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1622,7 +1622,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		if (err)
 			goto out_vm;
 
-		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 		if (IS_ERR(cmd)) {
 			err = PTR_ERR(cmd);
 			goto out;
@@ -1658,7 +1658,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		if (err)
 			goto out_vm;
 
-		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+		cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 		if (IS_ERR(cmd)) {
 			err = PTR_ERR(cmd);
 			goto out;
@@ -1707,15 +1707,17 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 
 	i915_vma_unpin(vma);
 
+	i915_request_get(rq);
 	i915_request_add(rq);
 
-	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_set_to_cpu_domain(obj, false);
-	i915_gem_object_unlock(obj);
-	if (err)
+	if (i915_request_wait(rq, 0, HZ / 5) < 0) {
+		i915_request_put(rq);
+		err = -ETIME;
 		goto out_vm;
+	}
+	i915_request_put(rq);
 
-	cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	cmd = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(cmd)) {
 		err = PTR_ERR(cmd);
 		goto out_vm;
-- 
2.30.2

