Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E243BA33542
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65BA10E9EC;
	Thu, 13 Feb 2025 02:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNkiali8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7467B10E9D5;
 Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412619; x=1770948619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xiYrQywzTQeQSmfRV6a60V++V9gelBOETlUeFV0EEEQ=;
 b=mNkiali86RrXetpy2Kpspdz6HQezSjPO/G5KaQo9hwnvPeqEM7+dWa8o
 kYWsdojBENwjrB8JwvYn35yFzWhe4tJrdmN6uTYEN6wPwcbNgXXxK6oM5
 Ht2G2DLTZU6lR9t2OjlxsjUB9hUwtOtUy43KriEcfJtDM9rOy/zpy858B
 hU4tjm2UN1P/Oy2TywElHE1ZzyaRkG2GPUdlljdqXHCDyHX6yMG2DPWp8
 Z8h28iVFz69IOYNLiGBxcXbDwKOwHp2Wq/IlLw2LYLzFswi1YlpNaE88A
 /66DZC0o3f39fasfg0xQZ0IeWRrqa9SzyuALvL5k3j6A17mjZDdGYtgO+ g==;
X-CSE-ConnectionGUID: pZKKf8KPSia4NqdlsmAXcw==
X-CSE-MsgGUID: 4Q/atDchS9mN7AdpXJaCyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456041"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: H+txoSNnTGiqHGmAunoZwA==
X-CSE-MsgGUID: 5xBQERrfT3OmV72hMcJqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945099"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 22/32] drm/xe: Add drm_gpusvm_devmem to xe_bo
Date: Wed, 12 Feb 2025 18:11:02 -0800
Message-Id: <20250213021112.1228481-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 60c522866500..15a92e3d4898 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 
+#include <drm/drm_gpusvm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -80,6 +81,9 @@ struct xe_bo {
 	 */
 	u16 cpu_caching;
 
+	/** @devmem_allocation: SVM device memory allocation */
+	struct drm_gpusvm_devmem devmem_allocation;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
-- 
2.34.1

