Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3024B2470
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AD010EAA8;
	Fri, 11 Feb 2022 11:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3475610EAA3;
 Fri, 11 Feb 2022 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579310; x=1676115310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NfiTowHb2mo3U3AslQnv+Bu36eP2T5/HsNM+ia5oj8Q=;
 b=J0d6KA5SY9DUPFzS8NUHU8Z50+Iao39df+UcIPDbomaBhmTCf4kEuqvy
 5MEGru6Sgofgkz+1nxHUh4FftodKad3ou4bH8eyM4XbbMBLTRCRjOPoNt
 swrcI9EviG2EI/rsHuslC9hyWErE4Z+M3qGnEcjPY4dvP52Bsppu74uTr
 Sw91FAvY254WdUd3veh4+C5cRIkrNHZ32a1SUgvvmqIWo8Qd2j/5vcfBf
 gANn4KX+gIXwbKe1SDTngCCeBTZVzb9uhNnONGuY1Dtdyah5qyMY9w5zR
 lB24LlVMiUw1jJlx8wIRZ2wUhKDc/tOu+1gSH9VWQLGCB46iX4LzRAPfW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548271"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548271"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602355036"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:35:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 15/15] drm/i915/lmem: don't treat small BAR as an error
Date: Fri, 11 Feb 2022 11:34:37 +0000
Message-Id: <20220211113437.874691-16-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just pass along the probed io_size. The backend should be able to
utilize the entire range here, even if some of it is non-mappable.

It does leave open with what to do with stolen local-memory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 01838b8ce4c7..ad3cf348b4a8 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -201,6 +201,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	struct intel_memory_region *mem;
 	resource_size_t min_page_size;
 	resource_size_t io_start;
+	resource_size_t io_size;
 	resource_size_t lmem_size;
 	int err;
 
@@ -211,7 +212,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
 
 	io_start = pci_resource_start(pdev, 2);
-	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
+	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	if (!io_size)
 		return ERR_PTR(-ENODEV);
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
@@ -221,7 +223,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 					 lmem_size,
 					 min_page_size,
 					 io_start,
-					 lmem_size,
+					 io_size,
 					 INTEL_MEMORY_LOCAL,
 					 0,
 					 &intel_region_lmem_ops);
-- 
2.34.1

