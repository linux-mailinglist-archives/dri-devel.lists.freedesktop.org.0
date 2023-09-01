Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C17900F1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEC010E815;
	Fri,  1 Sep 2023 16:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3BE10E815
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693586938; x=1725122938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AByGrT4CU3qbNqZvnWozaTh0Bs6CYX10Dewq1r0qkT0=;
 b=Tf0a6izYC+JUs67wMDA9dIMs4Z8YByXB58mdx0CCKsJJHgw78Gwr1Jmt
 G8f51XNlORg8rqJ+zx7fypVNN6rm34KMloskzbM9l5jcF8PPU81uPgg2A
 QZb8fKwpKzNKx0opwa7tmuzWkAmflYGVDp1rRI6SMv7lDy1egvcDHGTy1
 4OeCwo+399wsDiCL4tMrkZQVOpNft/X5jlTJcHtrYgD0e7vZpwSisfblt
 PH3O79tB8fBQdJBk79bl42wnjtS5yzw5SgyRD5paezAfsuxQnWxFwTdVm
 1yIPCehmMlNIfGp97Qvv5Cl9a9fIClrTZB9aKChlYfZdVFXseDnroTiSy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375164116"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="375164116"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769246451"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="769246451"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 09:48:56 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 3/4] accel/ivpu: Remove support for uncached buffers
Date: Fri,  1 Sep 2023 18:48:41 +0200
Message-Id: <20230901164842.178654-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Usages of DRM_IVPU_BO_UNCACHED should be replaced by DRM_IVPU_BO_WC.
There is no functional benefit from DRM_IVPU_BO_UNCACHED if these
buffers are never mapped to host VM.

This allows to cut the buffer handling code in the kernel driver
by half.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c  | 2 +-
 drivers/accel/ivpu/ivpu_gem.c | 3 ---
 include/uapi/drm/ivpu_accel.h | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 2fef9fe154aa..8ab0f3225205 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -248,7 +248,7 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 
 	if (fw->shave_nn_size) {
 		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.shave.start,
-							  fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
+							  fw->shave_nn_size, DRM_IVPU_BO_WC);
 		if (!fw->mem_shave_nn) {
 			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
 			ret = -ENOMEM;
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 915c53d7bb97..2a91eb1e3627 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -89,8 +89,6 @@ static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
 
 	if (bo->flags & DRM_IVPU_BO_WC)
 		set_pages_array_wc(pages, npages);
-	else if (bo->flags & DRM_IVPU_BO_UNCACHED)
-		set_pages_array_uc(pages, npages);
 
 	bo->pages = pages;
 	return 0;
@@ -366,7 +364,6 @@ ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, const struct ivpu_b
 
 	switch (flags & DRM_IVPU_BO_CACHE_MASK) {
 	case DRM_IVPU_BO_CACHED:
-	case DRM_IVPU_BO_UNCACHED:
 	case DRM_IVPU_BO_WC:
 		break;
 	default:
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 262db0c3beee..de1944e42c65 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -196,7 +196,7 @@ struct drm_ivpu_bo_create {
 	 *
 	 * %DRM_IVPU_BO_UNCACHED:
 	 *
-	 * Allocated BO will not be cached on host side nor snooped on the VPU side.
+	 * Not supported. Use DRM_IVPU_BO_WC instead.
 	 *
 	 * %DRM_IVPU_BO_WC:
 	 *
-- 
2.25.1

