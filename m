Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B383D49CDF0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F7410E8E3;
	Wed, 26 Jan 2022 15:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA9610E7B7;
 Wed, 26 Jan 2022 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210531; x=1674746531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sct6csulG7TjYqbvvlRac8PPEeaLM5ZF4Apu5JBWjas=;
 b=Pv8gqHtFe6bGcWKGrvnadNfazcp9c+kaB0dlN+hjmmh+3j2MZSF0S0B7
 NNRfATXh24e8TuGEox++aqLFsc6N/fTaZbOBdudv8HoJVreRLAaMjNw1H
 8Y6iHWOLyI5Oginr0+fl+OQ/VX8yDvpqe/FoR8aUu7T7tHU3vwaFRDSVi
 pUnxXQPgtSXigrDDmtia83Vc6Rdgu6e4nZAhZ+4w1JdcyB2lbnhyuK5U/
 ojhH7VpxQ4VmxBlncWNsswGlwxeyYPdrJKgs3F9e+OAI5WpbkJTcKB0I7
 YDmWlGakb1qRogtUHzZFJwqKaYxoNh2xKLP/s+PXdg4oDpF9h46q2zH0L g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885211"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386241"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/20] drm/i915/ttm: require mappable by default
Date: Wed, 26 Jan 2022 15:21:40 +0000
Message-Id: <20220126152155.3070602-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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

On devices with non-mappable LMEM ensure we always allocate the pages
within the mappable portion. For now we assume that all LMEM buffers
will require CPU access, which is also inline with pretty much all
current kernel internal users. In the next patch we will introduce a new
flag to override this behaviour.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
 drivers/gpu/drm/i915/intel_region_ttm.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e1140ca3d9a0..d9a04c7d41b1 100644
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

