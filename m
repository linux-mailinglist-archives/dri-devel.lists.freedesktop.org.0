Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F76BA91226
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 06:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532310EA1A;
	Thu, 17 Apr 2025 04:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXXQobLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2891C10E0D6;
 Thu, 17 Apr 2025 04:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744863143; x=1776399143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I7MFE5scuc1PUAYJYHut1zn27lvkW+T30bK679Tjfdw=;
 b=FXXQobLKpqMlCyOXfoJUUtM4SGmqzjnuEJus9VSjgVpcqh5JKDzlH/uy
 vUgZl+auyMvWsj8Wu4Fs34NV+A1iMtIuW4s8qXbbTpQbLVfaREl/raxjK
 Mqgdvmfxz8DChqkqsjs513xZb2v7YHG+/7r8t1KBGz1Vux+by18ZUhJZO
 dMFTqbI0sFf87LHumbeSmnef2z7nS4AkUJGiz55KFu97rp3N2ao9K87UM
 bbgxVNsAqamW7NVO8696TX3BStCZOcyoEGUOF43Q99/+K6gOU/xJic6Ia
 gBI6FTts+sH54MuvUMRXOP4h23yMR2oq8vZvgNzIVtduJmpO8eGJJIQQF g==;
X-CSE-ConnectionGUID: fEoyRSwvSG2umqaS8VFzvw==
X-CSE-MsgGUID: tbheGbyjR8iawhwCIVq+KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34050105"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="34050105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:23 -0700
X-CSE-ConnectionGUID: FzETCzx5QvmzARnTaOJeZg==
X-CSE-MsgGUID: hOYzq5YzRaSj5yqKIuXDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131216556"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:12:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/5] drm/gpusvm: Introduce vram_only flag for VRAM
 allocation
Date: Wed, 16 Apr 2025 21:13:36 -0700
Message-Id: <20250417041340.479973-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417041340.479973-1-matthew.brost@intel.com>
References: <20250417041340.479973-1-matthew.brost@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

This commit adds a new flag, vram_only, to the drm_gpusvm structure. The
purpose of this flag is to ensure that the get_pages function allocates
memory exclusively from the device's VRAM. If the allocation from VRAM
fails, the function will return an -EFAULT error.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 5 +++++
 include/drm/drm_gpusvm.h     | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 38431e8360e7..e7d4ada21560 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1454,6 +1454,11 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 				goto err_unmap;
 			}
 
+			if (ctx->vram_only) {
+				err = -EFAULT;
+				goto err_unmap;
+			}
+
 			addr = dma_map_page(gpusvm->drm->dev,
 					    page, 0,
 					    PAGE_SIZE << order,
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index df120b4d1f83..8093cc6ab1f4 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -286,6 +286,7 @@ struct drm_gpusvm {
  * @in_notifier: entering from a MMU notifier
  * @read_only: operating on read-only memory
  * @devmem_possible: possible to use device memory
+ * @vram_only: Use only device memory
  *
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
@@ -294,6 +295,7 @@ struct drm_gpusvm_ctx {
 	unsigned int in_notifier :1;
 	unsigned int read_only :1;
 	unsigned int devmem_possible :1;
+	unsigned int vram_only :1;
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-- 
2.34.1

