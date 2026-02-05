Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMP1A1cahGmyywMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 05:19:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B189EE7DE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 05:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471AE10E7A7;
	Thu,  5 Feb 2026 04:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mccnkZti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6DA10E212;
 Thu,  5 Feb 2026 04:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770265167; x=1801801167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSIwdzS6CjBeSAnVkaOWaWwvfob3UlAErMPa099WXks=;
 b=mccnkZtil6poRf/nOX/zT0+egsxcQLe+gFMBcQBVVE6ydPDLVcugo8sm
 1dW+rxxQ407nRlHshVkKXOY/uPiUswiELkKDRhjBSxb90VRSYHr/h0Nby
 9UzNY5oDuukIhREsziAlooqzmVPf/9CbC9HMy7cqWHTiGMhLStEJrNnxI
 SOajoL5kruE5UpgqC8gfzO60CeW0F9nBJ/70HtxHEi11LmebXhp6O0/1R
 0R31SeP/WzXB7tMVppsH/TtistAHr7Qlc5/HTY6zgYDZhkJAq8oEInyOW
 Dd188kBR8P3rkBh3bVkg1iQ+/DEKpLoevibolALkLnO3/4TpKecgobygb Q==;
X-CSE-ConnectionGUID: WIwXd6V6TBmGR3yh3Z/IzA==
X-CSE-MsgGUID: ngAkgOt2SB28HPjCuJQlYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96914165"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="96914165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:19:26 -0800
X-CSE-ConnectionGUID: jR0lPex7Re2zEexvT9Nydg==
X-CSE-MsgGUID: Wlj+f5heTFWdG6A8e4G9YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="210453869"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:19:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, jgg@ziepe.ca, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 1/4] drm/pagemap: Add helper to access zone_device_data
Date: Wed,  4 Feb 2026 20:19:18 -0800
Message-Id: <20260205041921.3781292-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205041921.3781292-1-matthew.brost@intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8B189EE7DE
X-Rspamd-Action: no action

From: Francois Dugast <francois.dugast@intel.com>

This new helper helps ensure all accesses to zone_device_data use the
correct API whether the page is part of a folio or not.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
v2:
- Move to drm_pagemap.h, stick to folio_zone_device_data (Matthew Brost)
- Return struct drm_pagemap_zdd * (Matthew Brost)

 drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
 drivers/gpu/drm/drm_pagemap.c | 21 ++++++++++++---------
 include/drm/drm_pagemap.h     | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 871fcccd128a..4b8130a4ce95 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1488,12 +1488,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
+			struct drm_pagemap_zdd *__zdd =
+				drm_pagemap_page_zone_device_data(page);
+
 			if (!ctx->allow_mixed &&
-			    zdd != page->zone_device_data && i > 0) {
+			    zdd != __zdd && i > 0) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
-			zdd = page->zone_device_data;
+			zdd = __zdd;
 			if (pagemap != page_pgmap(page)) {
 				if (pagemap) {
 					err = -EOPNOTSUPP;
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 38eca94f01a1..fbd69f383457 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -244,7 +244,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
 		order = folio_order(folio);
 
 		if (is_device_private_page(page)) {
-			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 			struct drm_pagemap_addr addr;
 
@@ -315,7 +315,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
 			goto next;
 
 		if (is_zone_device_page(page)) {
-			struct drm_pagemap_zdd *zdd = page->zone_device_data;
+			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 			struct drm_pagemap *dpagemap = zdd->dpagemap;
 
 			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
@@ -603,7 +603,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 		pages[i] = NULL;
 		if (src_page && is_device_private_page(src_page)) {
-			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
+			struct drm_pagemap_zdd *src_zdd =
+				drm_pagemap_page_zone_device_data(src_page);
 
 			if (page_pgmap(src_page) == pagemap &&
 			    !mdetails->can_migrate_same_pagemap) {
@@ -725,8 +726,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto next;
 
 		if (fault_page) {
-			if (src_page->zone_device_data !=
-			    fault_page->zone_device_data)
+			if (drm_pagemap_page_zone_device_data(src_page) !=
+			    drm_pagemap_page_zone_device_data(fault_page))
 				goto next;
 		}
 
@@ -1067,7 +1068,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 	void *buf;
 	int i, err = 0;
 
-	zdd = page->zone_device_data;
+	zdd = drm_pagemap_page_zone_device_data(page);
 	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
 		return 0;
 
@@ -1150,7 +1151,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
  */
 static void drm_pagemap_folio_free(struct folio *folio)
 {
-	drm_pagemap_zdd_put(folio->page.zone_device_data);
+	struct page *page = folio_page(folio, 0);
+
+	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
 }
 
 /**
@@ -1166,7 +1169,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
  */
 static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
 {
-	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
 	int err;
 
 	err = __drm_pagemap_migrate_to_ram(vmf->vma,
@@ -1232,7 +1235,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
  */
 struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
 {
-	struct drm_pagemap_zdd *zdd = page->zone_device_data;
+	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
 
 	return zdd->devmem_allocation->dpagemap;
 }
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..14e1db564c25 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -4,6 +4,7 @@
 
 #include <linux/dma-direction.h>
 #include <linux/hmm.h>
+#include <linux/memremap.h>
 #include <linux/types.h>
 
 #define NR_PAGES(order) (1U << (order))
@@ -341,6 +342,19 @@ struct drm_pagemap_migrate_details {
 	u32 source_peer_migrates : 1;
 };
 
+/**
+ * drm_pagemap_page_zone_device_data() - Page to zone_device_data
+ * @page: Pointer to the page
+ *
+ * Return: Page's zone_device_data
+ */
+static inline struct drm_pagemap_zdd *drm_pagemap_page_zone_device_data(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	return folio_zone_device_data(folio);
+}
+
 #if IS_ENABLED(CONFIG_ZONE_DEVICE)
 
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
-- 
2.34.1

