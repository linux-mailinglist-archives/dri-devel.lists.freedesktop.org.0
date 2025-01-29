Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609BFA224BE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B5C10E8A3;
	Wed, 29 Jan 2025 19:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/NtHDo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3BE10E893;
 Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180284; x=1769716284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KJKLYeQ2ZhR+rwdiXGyOYk3zuBy8GGtpZt9d67eYN38=;
 b=O/NtHDo+aGkmP3MHGX58ZpL/oR7gZO6ToWo4gMhxEDmTYT80pdS1sCzk
 +NhX5l49e1EGDqfH3IDUsLue//o2P6hz0J9qmIFtaxGQTJdELFFaTUSOU
 sLpDNJmb4p7eXvRvvaCUUKf8kEbopx3TEbRE0HSPsMverMhyxh0Tu/iTq
 dT/s9xoPAudt/EgYByS1R/S01c5e+kDSv3MZUQUyUMyGFHC+avRQm8MPg
 9jA3zWOvO59mOqbSlAvKAOrDLsNhdzCHuYNKfUs6gzkAczvfeibiiLdTW
 upsjBC+Fuv7SB+jZHAXNF11M64Eqar8TiMw4+CgMC1F3thyCCOGdigqNu A==;
X-CSE-ConnectionGUID: WyW0pnWhSw2V9mgE1q+RJw==
X-CSE-MsgGUID: fPZGpMuERXaXv7FY0Y5dZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132823"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
X-CSE-ConnectionGUID: u/dToLebTLyW7QTebvzKOQ==
X-CSE-MsgGUID: c+5g9PVqTK2WDUoU1kR2IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392163"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Date: Wed, 29 Jan 2025 11:51:58 -0800
Message-Id: <20250129195212.745731-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device query flag,
which indicates whether the device supports CPU address mirroring. The
intent is for UMDs to use this query to determine if a VM can be set up
with CPU address mirroring. This flag is implemented by checking if the
device supports GPU faults.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 include/uapi/drm/xe_drm.h     | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c059639613f7..40f56eaf98fa 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -333,8 +333,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
-		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	if (xe->info.has_usm)
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b86dc1b4c2fe..37e54ca6ffe9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
+ *      device has CPU address mirroring support
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.34.1

