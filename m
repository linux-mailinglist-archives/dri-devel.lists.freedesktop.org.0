Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F54CDA3E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4511710FE78;
	Fri,  4 Mar 2022 17:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7766010F87A;
 Fri,  4 Mar 2022 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414655; x=1677950655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxKe2GGzkwjIz+ImnZzi9L608mT8CnEWpLrIheZ8ddo=;
 b=f8byxwkRJNP/7WCel8H9D963ZIlBYkk4d5zWc4obpfsBNRScpTMPZseG
 srh9oh2n3dzvkHaptavmQOMF3Vs8KjXWrrC1Y801ELId0PKpXuQ984EDQ
 w8vtXJXC/fHOWyH9eMB4zEh6ix5i9Tyox+ox/5PwC3CipKI/pBghUS3VQ
 fz6lf2qDaWDi0yMdZLZ09Af//s8nWzlZGdHv2ilKmbjCS0O1QBrhMkIZC
 17YLrCt1RyLjl123DIi/YnSFayYvkMFI+fILY/5aSZcolXcWz0Cg74ka8
 Q8QeH98fmJrlRWgt0D9+ca5NQdzEuOKGEb0LqZT+U7Pgu0/n6g26CPZ+3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252848962"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="252848962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631216582"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/lmem: don't treat small BAR as an error
Date: Fri,  4 Mar 2022 17:23:26 +0000
Message-Id: <20220304172333.991778-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304172333.991778-1-matthew.auld@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
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
index 6cecfdae07ad..783d81072c3b 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -93,6 +93,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	struct intel_memory_region *mem;
 	resource_size_t min_page_size;
 	resource_size_t io_start;
+	resource_size_t io_size;
 	resource_size_t lmem_size;
 	int err;
 
@@ -124,7 +125,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 
 
 	io_start = pci_resource_start(pdev, 2);
-	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
+	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	if (!io_size)
 		return ERR_PTR(-ENODEV);
 
 	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
@@ -134,7 +136,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
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

