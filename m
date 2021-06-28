Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D733B62B2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 16:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203A66E486;
	Mon, 28 Jun 2021 14:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094E56E47B;
 Mon, 28 Jun 2021 14:46:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="271825243"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="271825243"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 07:46:49 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="408091062"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.242])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 07:46:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/i915/gem: Migrate to system at dma-buf map time
Date: Mon, 28 Jun 2021 16:46:26 +0200
Message-Id: <20210628144626.76126-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until we support p2p dma or as a complement to that, migrate data
to system memory at dma-buf map time if possible.

v2:
- Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
  selftest to migrate if we are LMEM capable.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 7 ++++++-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1d1eeb167d28..5207aa3af009 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -29,7 +29,12 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 
 	assert_object_held(obj);
 
-	ret = i915_gem_object_pin_pages(obj);
+	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
+		return ERR_PTR(-EOPNOTSUPP);
+
+	ret = i915_gem_object_migrate(obj, NULL, INTEL_REGION_SMEM);
+	if (!ret)
+		ret = i915_gem_object_pin_pages(obj);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 24735d6c12a2..b6278dba98d0 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -94,7 +94,9 @@ static int igt_dmabuf_import_same_driver(void *arg)
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

