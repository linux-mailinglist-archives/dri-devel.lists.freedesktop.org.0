Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28DAA6AC0F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 18:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAB010E67B;
	Thu, 20 Mar 2025 17:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bsy5/+xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B5710E679;
 Thu, 20 Mar 2025 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742491940; x=1774027940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PGNeKuKE8DMaviNnDfmTZWxBVhAtZeLIAjsfEOhdcTg=;
 b=Bsy5/+xntD9KJSQIpUHHSpbGhSZbIpmT/xITZGinCVL464MWnoR9yz4/
 zIMqqcCAQftI1Fc3iIrHdJcun1N8pO0vHCifFVf39hzzsY70G2YJHvbYT
 KEU4LbCefKRo/XIPfe2TrNL0251vWtxDrG1lAdJQo7cbvPXNKaOPLRq/o
 hoprt2RE7jTPSn/FHjpCwBsp/tHwZQ4WxKxaUo/KwlVOCSnU4HvfswP9T
 PBOPvNSOyJoeO9nb4yXFYaoqW1mqd6TdjZupyWlCgXc1L0kC1sxhCbKmK
 Nqv73u7FKqyZn6STr7Sg79aLw1LyPziM8S/UfUPhzwbraI41hI1aGccHB Q==;
X-CSE-ConnectionGUID: JlU1qu9ZRhuNv9cnVrQfBQ==
X-CSE-MsgGUID: XurVvqTCTTG8Lu/+alOs+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69095600"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="69095600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:19 -0700
X-CSE-ConnectionGUID: Q+NVO/GrTS2gwhvd4KPHDg==
X-CSE-MsgGUID: Ff4b9QFaT02jQPgb5T2mtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123168432"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.226])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/7] drm/gpusvm: mark pages as dirty
Date: Thu, 20 Mar 2025 17:30:00 +0000
Message-ID: <20250320172956.168358-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320172956.168358-9-matthew.auld@intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
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

If the memory is going to be accessed by the device, make sure we mark
the pages accordingly such that the kernel knows this. This aligns with
the xe-userptr code.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 7f1cf5492bba..5b4ecd36dff1 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1471,6 +1471,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			pages[i] = page;
 		} else {
 			dma_addr_t addr;
+			unsigned int k;
 
 			if (is_zone_device_page(page) || zdd) {
 				err = -EOPNOTSUPP;
@@ -1489,6 +1490,14 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 			range->dma_addr[j] = drm_pagemap_device_addr_encode
 				(addr, DRM_INTERCONNECT_SYSTEM, order,
 				 dma_dir);
+
+			for (k = 0; k < 1u << order; k++) {
+				if (!ctx->read_only)
+					set_page_dirty_lock(page);
+
+				mark_page_accessed(page);
+				page++;
+			}
 		}
 		i += 1 << order;
 		num_dma_mapped = i;
-- 
2.48.1

