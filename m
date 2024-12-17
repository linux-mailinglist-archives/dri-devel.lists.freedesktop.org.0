Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F69F5A7C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68C610EAA4;
	Tue, 17 Dec 2024 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex8Z7LwI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F01310EA86;
 Tue, 17 Dec 2024 23:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478392; x=1766014392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FPrMvQOtIVh5E5KGw6lN7OgswspLJgvvtavgsr6VB9I=;
 b=ex8Z7LwIxhwW7421nfy1ms0VNibydjgB/+N0OQ9APOH/Un0gwK0BIg+1
 gqnZcItvu7IiT1MFBTCUHYY8Dn9soe1hUfEaHyb/L146oInFb8BnpRCNI
 3SIBY9Cbk/QTjcIBlmRrjEX+3fpHZ/BKQw8PUO0J0w2VDO2/3Km+8Setc
 3M/E+keqIYuRbm6pNs+tMXewBhNtoqunHAvFskSpJd6wY25UYji3XuLvt
 mtRFiiHE3+B/oZxKz1qwUVQNiGhNBAKMijALRAS9L5yilknSHvgVZ3ABC
 3cPsLn42VHouykPcMoIyZ/MtE/OENM9WlMr1wnRmzYUO8NlTBYj37BC6J g==;
X-CSE-ConnectionGUID: mnXSftlPT46vKSAc0g3R7w==
X-CSE-MsgGUID: UULeLiYnTlCX+KXAmCMYRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517444"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:12 -0800
X-CSE-ConnectionGUID: qdGyxSztSfWGTZieF9JTSA==
X-CSE-MsgGUID: TK9EP4vMTc2S1ioUHDSKvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273451"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 20/30] drm/xe: Add drm_gpusvm_devmem to xe_bo
Date: Tue, 17 Dec 2024 15:33:38 -0800
Message-Id: <20241217233348.3519726-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

