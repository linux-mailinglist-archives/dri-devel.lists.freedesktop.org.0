Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC945BCFEA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A8310E651;
	Mon, 19 Sep 2022 15:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AE210E651;
 Mon, 19 Sep 2022 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663599762; x=1695135762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JHrYECgzEe8LGDHUKM2IYQMKdpVDU84mqnOBo3OCC/E=;
 b=cczDXUWLyuvsvQzeCi11TWjsx/swyS4ez+qRv/31I2HEx5+E21MPwo7+
 Q6UwInzmvSwviDDjIyMtVRdb1/FRO5RQFVWenX24b+vQ+sPiPvdXtUUZQ
 HiX6CjaeALltpV1kskpQFyMyy4eC969svFgHXrfhJjT5qrIeQcd7zvxFK
 bmQsEiv+eoGvFGmAaMo0bWkQ0ykhnVjrb9mP4q+BPfj5yb8qdaxr3jgyz
 g3iKUAUACpKykhU011wzgTdko+0YnFTCxnx8Dspw6v+LhEoY/ns1VuC9C
 jLFQWXCVD9ueCMxlaw+bzGn8AK1wc729wHqwbHql/HUElCkc1yMrNRHiC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279804229"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="279804229"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 08:02:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="596115304"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 08:02:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Do not dereference NULL bo->resource
Date: Mon, 19 Sep 2022 17:02:33 +0200
Message-Id: <20220919150233.5457-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: anshuman.gupta@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bo->resource could be NULL hence add a NULL check for
bo->resource before dereferencing it.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6850
Fixes: ad74457a6b5a96 ("drm/i915/dgfx: Release mmap on rpm suspend")
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 0544b0a4a43a..8608801cd9ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -513,7 +513,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 
 	if (likely(obj)) {
 		/* ttm_bo_release() already has dma_resv_lock */
-		if (i915_ttm_cpu_maps_iomem(bo->resource))
+		if (bo->resource && i915_ttm_cpu_maps_iomem(bo->resource))
 			wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
 
 		__i915_gem_object_pages_fini(obj);
-- 
2.37.3

