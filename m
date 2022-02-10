Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACA4B0D4B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 13:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E3F10E83E;
	Thu, 10 Feb 2022 12:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664810E831;
 Thu, 10 Feb 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644495399; x=1676031399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vth5Zx3SKzb9ZDLkZT5NWnvO0cYNUrS5FgGylYthOjM=;
 b=nXj9Y1VWfVFUVm8EobrDVtWcOiVW1t+BNmTYJUCSd2J18SHCRuytzLA5
 /n44Zc7Wj5IwDhHRSKTM081cdKJxDOwMNyiDfQQTrDO7GbA5d8TY052S8
 6HmeNcwr1/pAmH6TBCGNh3NBrTvgP90cIaQ8eCCxazjMGGjTbMHo0iOW/
 nOQqEwMf3dHmsVxp7qWgsfFrlO2hg9k3GYdq/s4zfm6XizDWyJPDLpJgu
 ahnfTkLQCXD47CQEyVczjhzP3u4/43Zq22jvsyGSb0SitlD1hPwwRrYpq
 M8xJ16LPs3O2LgN31DcpRqtXKYsyV8N9EANm4YM0XLu8vbnXlLtszJstk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="247060932"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="247060932"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485664947"
Received: from paulbarr-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.11.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/15] drm/i915/ttm: require mappable by default
Date: Thu, 10 Feb 2022 12:13:00 +0000
Message-Id: <20220210121313.701004-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210121313.701004-1-matthew.auld@intel.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
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

