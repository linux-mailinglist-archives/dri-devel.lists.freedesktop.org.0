Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046A8252B1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA7410E5DB;
	Fri,  5 Jan 2024 11:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5A10E5D8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453754; x=1735989754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfOzlYIswgstqqhbXADk/sDzHu6bxavldI76y4e4/ac=;
 b=U+iUMPeEurhO498+7KRpEwqZpNIhHgXUOD5iT0J2Hiph0BaaaTwI0Txo
 XZikVIaw9Ap3Jz6ZYMCU23eIEeo0NkfV91kST+FBkszl1mFSZgCQyps0x
 qHCw1okDghP5xyWMl8Ulo7I/SU5v4LmumxhIcmN3X6kqQib12qJ9Ogcno
 OOx0mhCtEjHnOErq81IjZ4BdUgLIVCSswpTEOTvn8+zVXlmFq8Ngo+HGZ
 BrdNbE24B83czrOyQqOhTWf82u6or1G/szSI/4nVkhn43SnXDN/sA3bW9
 dSouqycQOvPqgpoCQaDRGyCNNgivEB0tQNrEegAd3PpT1SELoNXRKewOL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255446"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918738"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918738"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:32 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] accel/ivpu: Free buffer sgt on unbind
Date: Fri,  5 Jan 2024 12:22:15 +0100
Message-ID: <20240105112218.351265-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call dma_unmap() on all buffers before to VPU is unbinded to avoid
"device driver has pending DMA allocations while released from device"
warning when DMA-API debug is enabled.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 6890d33cf352..4de454bfbf91 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -112,8 +112,6 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 
 	ivpu_dbg_bo(vdev, bo, "unbind");
 
-	/* TODO: dma_unmap */
-
 	if (bo->mmu_mapped) {
 		drm_WARN_ON(&vdev->drm, !bo->ctx);
 		drm_WARN_ON(&vdev->drm, !bo->vpu_addr);
@@ -127,6 +125,18 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
 		bo->vpu_addr = 0;
 		bo->ctx = NULL;
 	}
+
+	if (bo->base.base.import_attach)
+		return;
+
+	dma_resv_lock(bo->base.base.resv, NULL);
+	if (bo->base.sgt) {
+		dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
+		sg_free_table(bo->base.sgt);
+		kfree(bo->base.sgt);
+		bo->base.sgt = NULL;
+	}
+	dma_resv_unlock(bo->base.base.resv);
 }
 
 static void ivpu_bo_unbind(struct ivpu_bo *bo)
-- 
2.43.0

