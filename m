Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6148A43456
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1510E561;
	Tue, 25 Feb 2025 04:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLgQq/Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3C310E54B;
 Tue, 25 Feb 2025 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458534; x=1771994534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rKgFzO2+2Xh/Z2Ng5SyhdCAwsCqv9S26R0fkvrzJx8A=;
 b=TLgQq/Ok1NN3T2xQZbBOuuWJGkwrPLu2Ko8UD16khDnwrjLym3rCe+C6
 oyBE8m0EjhH7NYa0jkUY7u4x2grZStQgh2aiorl7QGY/R8wDW07KlLkTA
 pWJb+PZYgw0jHj60tP2LsDbfKfUdwyopZSeGiPmOtAyfTMPgjpWPhaAOr
 cIcqL/lELxbvd0+elfj3qHY/wpb6/CmlR+aKzh26FOBeVexq+lULvguoT
 56AwWaKJTqVZmSkBbmYKFhTK2ehmNbqSL1XKV0V+Pqq3szOad6GoIGEwl
 3i8HepIDCwzJFhIrAJbSZybNMPw0HntxdDnkzFARhObNDWD7xRtdgwsbI g==;
X-CSE-ConnectionGUID: L4a7UJzMQKeK6TtWt+d1Lg==
X-CSE-MsgGUID: xIKalcw2Sly8yvusTwQkMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885017"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:13 -0800
X-CSE-ConnectionGUID: TGscxf3sTyuLo6tzul8VRQ==
X-CSE-MsgGUID: 9h4HdbktRHSv8s1KPG4MLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290302"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 19/32] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Date: Mon, 24 Feb 2025 20:42:58 -0800
Message-Id: <20250225044311.3178695-20-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device query flag,
which indicates whether the device supports CPU address mirroring. The
intent is for UMDs to use this query to determine if a VM can be set up
with CPU address mirroring. This flag is implemented by checking if the
device supports GPU faults.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 include/uapi/drm/xe_drm.h     | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ebfae746f861..24f9997ab4eb 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,8 +337,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
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
index 30276d7c67d1..bb1dc6587e56 100644
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

