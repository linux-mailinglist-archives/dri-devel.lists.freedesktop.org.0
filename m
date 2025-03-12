Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C42A5E61A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D593710E7C8;
	Wed, 12 Mar 2025 21:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdbXVWQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6D010E7C9;
 Wed, 12 Mar 2025 21:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813534; x=1773349534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQzNrbMNsDHRatCMaX4YzNLYM3HahmCCH4Tux4106Ak=;
 b=YdbXVWQvIx5tqRSW19wfLhFsslC7VLIuaT9uKFrGC8bgSb/GOnITHGqx
 5szvJGIX6bRjNoBFtuTd4UYfU1tto1u59sEG6EFcnvfus5t0FQiqTPx7c
 joLH36kY9RWDYg16/Sfk3QRprjC/WSmJ3jM7v8IvER2/hxNtbgF57zWO5
 F/CSoKCEYJ2wlswsaUwZEubXbClP1K10eTEokaCJrfmk11ldgZ4r5WlX0
 Djo2zKy615lxr9c4987zGykxJCYdq6mhUclM4srVfbYowA7nFf6UIo8TE
 rrkrk6QIGM2aGqPYbyV8vwR/fwweD0DVnRM6370zD5G7llhQZUOttVrOo Q==;
X-CSE-ConnectionGUID: 2yQVtS3wToem3z5ShDbj0Q==
X-CSE-MsgGUID: BFLvSjwnSkaL1elUQsyg2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562238"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:34 -0700
X-CSE-ConnectionGUID: /usUw8J2RqCgHUcPXeLaoQ==
X-CSE-MsgGUID: LVk9YQgDS7aixUQa7S9EJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791206"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 13/19] drm/gpusvm: Allow mixed mappings
Date: Wed, 12 Mar 2025 22:04:10 +0100
Message-ID: <20250312210416.3120-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Racing while migrating can cause part of an SVM range to reside in
system and part of the range to reside in local VRAM.

Currently we disallow that and repeatedly try to force everything
out to system memory.

Instead, allow drm_gpusvm_range_get_pages() to be a bit more permissive,
and allow mapping of mixed ranges.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 8d836248f5fe..5d502ca091ee 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1213,7 +1213,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	struct mm_struct *mm = gpusvm->mm;
-	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
@@ -1295,7 +1294,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		goto map_pages;
 	}
 
-	zdd = NULL;
 	num_dma_mapped = 0;
 	for (i = 0, j = 0; i < npages; ++j) {
 		struct page *page = hmm_pfn_to_page(pfns[i]);
@@ -1303,17 +1301,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		order = hmm_pfn_to_map_order(pfns[i]);
 		if (is_device_private_page(page) ||
 		    is_device_coherent_page(page)) {
-			if (zdd != page->zone_device_data && i > 0) {
-				err = -EOPNOTSUPP;
-				goto err_unmap;
-			}
-			zdd = page->zone_device_data;
 			if (pagemap != page->pgmap) {
-				if (i > 0) {
-					err = -EOPNOTSUPP;
-					goto err_unmap;
-				}
-
 				pagemap = page->pgmap;
 				dpagemap = drm_pagemap_page_to_dpagemap(page);
 				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
@@ -1341,7 +1329,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		} else {
 			dma_addr_t addr;
 
-			if (is_zone_device_page(page) || pagemap) {
+			if (is_zone_device_page(page)) {
 				err = -EOPNOTSUPP;
 				goto err_unmap;
 			}
-- 
2.48.1

