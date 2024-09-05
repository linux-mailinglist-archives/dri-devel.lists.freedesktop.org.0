Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D196D367
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 11:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950A510E843;
	Thu,  5 Sep 2024 09:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/V2lxpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BABC10E840;
 Thu,  5 Sep 2024 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528834; x=1757064834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DZ29/FJS9eeMPI/4e/YxqSnsah4g9bujTt1F49R/VRs=;
 b=e/V2lxptSnDWfNKwtpo+yxhqSAbyC7FzS+dWZ11B1KuJZ/yFsBl5lDmf
 qHBXWhau6AwTt0lV5dJfYLvfaT9WgLJTze9A4qqCuXdFxJY3B3/+EoX08
 3ENmrBZSrzxYH1MStf+086sD28fSA30rfyuM75R3a0vaZz+s+eBcqRtcn
 h4nysTNKMLsxx37oGCMBTV/KvOIXfYjHbvdtm0cofnMdCEGXLVGz4ynDC
 cAyGeIw7MPO5BjdhroUcJrDSjN7wJGDcDyFHGXpqS+KO95piuHeprD2ut
 vg00Gc6fe0UwZ4HjlqS6gmb0LDt0gH+tLXWOlME7l68Vk9OMkqOX5LYRI g==;
X-CSE-ConnectionGUID: USEpj/uETyCd9wFrhFjvJg==
X-CSE-MsgGUID: hWaBRgaLRh6CamFXOhrpJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24391714"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24391714"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:33:54 -0700
X-CSE-ConnectionGUID: IseAvhKQRnCl3r9Dcc7XXw==
X-CSE-MsgGUID: 4iEs858fT+mWQcuwJZWEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="96354397"
Received: from unknown (HELO fedora..) ([10.245.245.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:33:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>
Subject: [PATCH 2/2] drm/ttm: Add a device flag to propagate -ENOSPC on OOM
Date: Thu,  5 Sep 2024 11:33:22 +0200
Message-ID: <20240905093322.29786-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905093322.29786-1-thomas.hellstrom@linux.intel.com>
References: <20240905093322.29786-1-thomas.hellstrom@linux.intel.com>
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

Some graphics APIs differentiate between out-of-graphics-memory and
out-of-host-memory (system memory). Add a device init flag to
have -ENOSPC propagated from the resource managers instead of being
converted to -ENOMEM, to aid driver stacks in determining what
error code to return or whether corrective action can be taken at
the driver level.

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c |  1 +
 include/drm/ttm/ttm_device.h     | 13 +++++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..c4bec2ad301b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -835,7 +835,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 
 	/* For backward compatibility with userspace */
 	if (ret == -ENOSPC)
-		return -ENOMEM;
+		return bo->bdev->propagate_enospc ? ret : -ENOMEM;
 
 	/*
 	 * We might need to add a TTM.
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 0c85d10e5e0b..aee9d52d745b 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -203,6 +203,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	}
 
 	bdev->funcs = funcs;
+	bdev->propagate_enospc = flags.propagate_enospc;
 
 	ttm_sys_man_init(bdev);
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 1534bd946c78..f9da78bbd925 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -266,6 +266,13 @@ struct ttm_device {
 	 * @wq: Work queue structure for the delayed delete workqueue.
 	 */
 	struct workqueue_struct *wq;
+
+	/**
+	 * @propagate_enospc: Whether -ENOSPC should be propagated to the caller after
+	 * graphics memory allocation failure. If false, this will be converted to
+	 * -ENOMEM, which is the default behaviour.
+	 */
+	bool propagate_enospc;
 };
 
 int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
@@ -295,6 +302,12 @@ struct ttm_device_init_flags {
 	u32 use_dma_alloc : 1;
 	/** @use_dma32: If we should use GFP_DMA32 for device memory allocations. */
 	u32 use_dma32 : 1;
+	/**
+	 * @propagate_enospc: Whether -ENOSPC should be propagated to the caller after
+	 * graphics memory allocation failure. If false, this will be converted to
+	 * -ENOMEM, which is the default behaviour.
+	 */
+	u32 propagate_enospc : 1;
 };
 
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
-- 
2.46.0

