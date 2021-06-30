Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B043B82AD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 15:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9396E9D1;
	Wed, 30 Jun 2021 13:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FA16E9C6;
 Wed, 30 Jun 2021 13:07:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195634533"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="195634533"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="558290343"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.133])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gem: Migrate to system at dma-buf map time
Date: Wed, 30 Jun 2021 15:07:01 +0200
Message-Id: <20210630130701.349458-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
References: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com, "Michael J . Ruhl" <michael.j.ruhl@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf map time if possible.

v2:
- Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
  selftest to migrate if we are LMEM capable.
v3:
- Migrate also in the pin() callback.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 21 +++++++++++++++++--
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 +++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 918c19df7b66..13312d89c2ed 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -34,7 +34,14 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 	 * Let's pin it here to avoid having to call the move_notify
 	 * callback, The call of which is not yet implemented.
 	 */
-	ret = i915_gem_object_pin_pages(obj);
+	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
+	if (!ret)
+		ret = i915_gem_object_wait_migration(obj, 0);
+	if (!ret)
+		ret = i915_gem_object_pin_pages(obj);
 	if (ret)
 		goto err;
 
@@ -180,9 +187,19 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
 static int i915_gem_dmabuf_pin(struct dma_buf_attachment *attach)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
+	int ret;
 
 	assert_object_held(obj);
-	return i915_gem_object_pin_pages(obj);
+
+	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+		return -EOPNOTSUPP;
+	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
+	if (!ret)
+		ret = i915_gem_object_wait_migration(obj, 0);
+	if (!ret)
+		ret = i915_gem_object_pin_pages(obj);
+
+	return ret;
 }
 
 static void i915_gem_dmabuf_unpin(struct dma_buf_attachment *attach)
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 868b3469ecbd..b1e87ec08741 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void *arg)
 	int err;
 
 	force_different_devices = true;
-	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
+	if (IS_ERR(obj))
+		obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
 	if (IS_ERR(obj))
 		goto out_ret;
 
-- 
2.31.1

