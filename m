Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86BA224BF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0493C10E8A5;
	Wed, 29 Jan 2025 19:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ge5Dflt9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9657710E897;
 Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180285; x=1769716285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FPrMvQOtIVh5E5KGw6lN7OgswspLJgvvtavgsr6VB9I=;
 b=Ge5Dflt9fa/sV+LFIpiKKKwh5w/0s6Kp4CGcK4MQ9HfN7wBkSScpCvWU
 Kl9Wjv7Fx2iPRiEoWXDKDdi6drC5Y7GbZoHIw8dZ0JPc/5fvHiVExGQrH
 mX4C8SBCzx6bwe2Ppi1nO5pYXVdcSXspsGz4lpLXOfiikjj2XgQsoj5Xp
 sH8iMXcGWqYfl8m4hY+ubyL/EseWq2gmoO9f1bBOgqoDBq5jwmI+uQMBD
 3drzLav03idMptOpJcHLcdhqzm9EOdv4xXaDmDaOXXeyX32Ua6ah1J9j2
 /h8+y9P/u5ycxWd83F7u8AK9jY2Zl3q3Ow0MZs40h4fQGa9pTu9ZxYYnf g==;
X-CSE-ConnectionGUID: I/sGrkYrRsSlIwFA5yG2CA==
X-CSE-MsgGUID: Y5R/kV3ATbSM7rEAMgkdjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132841"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
X-CSE-ConnectionGUID: nXnG/u8+QUmTHwDzLYZb8g==
X-CSE-MsgGUID: dij8FGDCSy6EKavPgwox0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392172"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 22/33] drm/xe: Add drm_gpusvm_devmem to xe_bo
Date: Wed, 29 Jan 2025 11:52:01 -0800
Message-Id: <20250129195212.745731-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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
index 46dc9e4e3e46..6d53ccde0256 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 
+#include <drm/drm_gpusvm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -74,6 +75,9 @@ struct xe_bo {
 	 */
 	u16 cpu_caching;
 
+	/** @devmem_allocation: SVM device memory allocation */
+	struct drm_gpusvm_devmem devmem_allocation;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
-- 
2.34.1

