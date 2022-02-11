Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B14B245B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CB310EA95;
	Fri, 11 Feb 2022 11:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD5410E8E8;
 Fri, 11 Feb 2022 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579291; x=1676115291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nzYpmn6gX9ESbHKbu0boofl8yem4eQXjlK9JQttipjk=;
 b=RusCvUoYnteqsZvBtLj6chy47WBdyg1kmBtbcD0Psl6zs/O3YfkMGs2G
 12nsRgtFSkzjMev2sD8kMXFMB4GnvyU6uzEl4CDepcFqdv8QGsh245yeo
 A0z9JJttaqmCTgtobhhI4y2UR+a9Z8uD6UMjEMzymUvUK6Uf5Eu8KNBUR
 Lz3rlDFjWF3W97yjekoUB4qP9UaSVW8iuf9dFII6s7JdRE88xlR0uvOui
 CFr346uOGKcL9PZwisGXOphpzcUjeItEnhSRzNmoTfsnRblHJHLYegPhu
 8B1SHYpqtfqFxxcrYq9JX5QMynxN7aiFfV3Qxf+oAMXTJ7N4x4GQUM2+F w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548225"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548225"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354950"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:49 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/15] drm/i915/ttm: require mappable by default
Date: Fri, 11 Feb 2022 11:34:24 +0000
Message-Id: <20220211113437.874691-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211113437.874691-1-matthew.auld@intel.com>
References: <20220211113437.874691-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On devices with non-mappable LMEM ensure we always allocate the pages
within the mappable portion. For now we assume that all LMEM buffers
will require CPU access, which is also inline with pretty much all
current kernel internal users. In the next patch we will introduce a new
flag to override this behaviour.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
 drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e9399f7b3e67..41e94d09e742 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -128,6 +128,10 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags = TTM_PL_FLAG_CONTIGUOUS;
+	if (mr->io_size && mr->io_size < mr->total) {
+		place->fpfn = 0;
+		place->lpfn = mr->io_size >> PAGE_SHIFT;
+	}
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index f2b888c16958..4689192d5e8d 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -199,6 +199,11 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	struct ttm_resource *res;
 	int ret;
 
+	if (mem->io_size && mem->io_size < mem->total) {
+		place.fpfn = 0;
+		place.lpfn = mem->io_size >> PAGE_SHIFT;
+	}
+
 	mock_bo.base.size = size;
 	place.flags = flags;
 
-- 
2.34.1

