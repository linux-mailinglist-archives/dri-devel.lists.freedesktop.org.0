Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE73B9727
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A3D6EB59;
	Thu,  1 Jul 2021 20:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7996E0B8;
 Thu,  1 Jul 2021 20:20:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="272469698"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="272469698"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:20:22 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="448041878"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:20:21 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: michael.j.ruhl@intel.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, ckoenig.leichtzumerken@gmail.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, maarten.lankhorst@linux.intel.com
Subject: [PATCH v1 2/2] drm/i915/gem: Migrate to system at dma-buf attach time
Date: Thu,  1 Jul 2021 16:20:14 -0400
Message-Id: <20210701202014.910098-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701202014.910098-1-michael.j.ruhl@intel.com>
References: <20210701202014.910098-1-michael.j.ruhl@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf attach time if possible.

v2:
- Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
  selftest to migrate if we are LMEM capable.
v3:
- Migrate also in the pin() callback.
v4:
- Migrate in attach

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 12 +++++++++++-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c |  4 +++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index ccae17d5f441..280291a4a9dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -170,9 +170,19 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 				  struct dma_buf_attachment *attach)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
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
 
 static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
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

