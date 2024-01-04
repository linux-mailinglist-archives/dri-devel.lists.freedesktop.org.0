Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD182411E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1902F10E446;
	Thu,  4 Jan 2024 11:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBBF10E43D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369452; x=1735905452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+y8VfG/l9WdV1CV7VtLC4jsOLGvdb8I1j7iJFqV/4Qw=;
 b=Z/ylu4kPOe+bDNMYfQgtc0EQbpMCzLJEX/D6PdKZl7fvogMgzq2ZjOJf
 4nRbMDPb0FQLs/NBSbPUyFyZ9Pt+n8sdfKznjDuieiNssvdDcEfujYVZA
 nesVbKvS4EMoG2dVh7WZYDNNhvaoP92Dy05Os+QdgcSE9/ircGSv/NYTu
 M8aAr7SXu4KSw/lziBKF391NbD7U3sSREY17ioVrdfxldhD2hDKIaddI2
 htyoMIgpCqGDDtRfH0KGpA2I6Vp/J2uOoOEoC27hgfASNuzuX1D+yTaTv
 aVHWFinY4VotN1mJyc6/XpUpKQpMN1IXSdfjAVm/J4Ep/fuPuWHW0yTYN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584155"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584155"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275729"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275729"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:30 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/16] accel/ivpu: Fix for missing lock around
 drm_gem_shmem_vmap()
Date: Thu,  4 Jan 2024 12:57:03 +0100
Message-ID: <20240104115713.8657-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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

drm_gem_shmem_vmap/vunmap requires dma resv lock to be held.
This was missed during conversion to shmem helper.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 1dda4f38ea25..6890d33cf352 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -361,7 +361,9 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 	if (ret)
 		goto err_put;
 
+	dma_resv_lock(bo->base.base.resv, NULL);
 	ret = drm_gem_shmem_vmap(&bo->base, &map);
+	dma_resv_unlock(bo->base.base.resv);
 	if (ret)
 		goto err_put;
 
@@ -376,7 +378,10 @@ void ivpu_bo_free_internal(struct ivpu_bo *bo)
 {
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
 
+	dma_resv_lock(bo->base.base.resv, NULL);
 	drm_gem_shmem_vunmap(&bo->base, &map);
+	dma_resv_unlock(bo->base.base.resv);
+
 	drm_gem_object_put(&bo->base.base);
 }
 
-- 
2.43.0

