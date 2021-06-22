Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B75613B00DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B697A89F47;
	Tue, 22 Jun 2021 09:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22B589F47;
 Tue, 22 Jun 2021 09:58:55 +0000 (UTC)
IronPort-SDR: 4deIb2HvLJm8MJw2vtklDW3o1MKnQTpOFdfGh83RbJmVqA/A429MpARPbkicBF2B6vNAr95XI1
 qX0FvIPt/tNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206843467"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="206843467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:58:53 -0700
IronPort-SDR: t2JfLWQmPbwZwwdY4eMUX5a5f/QFYbXFkN3mwj/d0TabAHqVUC35bpBuIosMFAw0A71edx05xE
 YIFPS+wwSEKA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="452553207"
Received: from ctuckwel-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 02:58:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: consider all placements for the page alignment
Date: Tue, 22 Jun 2021 10:58:43 +0100
Message-Id: <20210622095843.132549-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just checking the current region is not enough, if we later migrate the
object somewhere else. For example if the placements are {SMEM, LMEM},
then we might get this wrong. Another idea might be to make the
page_alignment part of the ttm_place, instead of the BO.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index c5deb8b7227c..5d894bba6430 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -753,6 +753,25 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
 }
 
+static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
+{
+	u64 page_size;
+	int i;
+
+	if (!obj->mm.n_placements)
+		return obj->mm.region->min_page_size;
+
+	page_size = 0;
+	for (i = 0; i < obj->mm.n_placements; i++) {
+		struct intel_memory_region *mr = obj->mm.placements[i];
+
+		page_size = max_t(u64, mr->min_page_size, page_size);
+	}
+
+	GEM_BUG_ON(!page_size);
+	return page_size;
+}
+
 /**
  * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
  * @mem: The initial memory region for the object.
@@ -793,7 +812,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
 			  bo_type, &i915_sys_placement,
-			  mem->min_page_size >> PAGE_SHIFT,
+			  i915_gem_object_page_size(obj) >> PAGE_SHIFT,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
 	if (!ret)
 		obj->ttm.created = true;
-- 
2.26.3

