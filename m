Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8552D76C55B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D39210E49F;
	Wed,  2 Aug 2023 06:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4571A10E49F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690958260; x=1722494260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UDyE/ujRwnhuSy/mId7ZDpazbne2oYRVmBRvtclErCk=;
 b=nDJ3thWsu+E5VIGDUXP0LxdaWWMkAUJYeinWVWH90Mbq6Iu/6d1DN17F
 CpVLKDdgcaUC1zapZuo/G+Qp9MJF7+MkRKr9G6FP51v4x+sAtmQ9YSi/6
 vPCzUtlnkjIUM63qIWbebMpfxMuMyCKYl+UmEtdTjmogdniZW9n7lIv2n
 24Pzu+QLDBQs0XSqG2/cGDBhSLS68oBPqi7jFGsh3pIYvNGawVf3ccCN8
 Uy53JSeptL9sNwUnl0BYK8/DaNs8q1COzTA/GMxKNxfRCcHuUKr9+sf9f
 j1yoKgej6T1euvKSRzgHhvQvg6I7ymD20TV4rAaAROs07p9UszWmRgtQY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435820802"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="435820802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 23:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764088124"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="764088124"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 23:37:37 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu: Add set_pages_array_wc/uc for internal buffers
Date: Wed,  2 Aug 2023 08:37:35 +0200
Message-Id: <20230802063735.3005291-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Buffers mapped with pgprot_writecombined() are not correctly
flushed. This triggers issues on VPU access using random
memory content such as MMU translation faults, invalid context
descriptors being fetched and can lead to VPU FW crashes.

Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
Cc: stable@vger.kernel.org # 6.3+
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 52b339aefadc..9967fcfa27ec 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -173,6 +173,9 @@ static void internal_free_pages_locked(struct ivpu_bo *bo)
 {
 	unsigned int i, npages = bo->base.size >> PAGE_SHIFT;
 
+	if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
+		set_pages_array_wb(bo->pages, bo->base.size >> PAGE_SHIFT);
+
 	for (i = 0; i < npages; i++)
 		put_page(bo->pages[i]);
 
@@ -587,6 +590,11 @@ ivpu_bo_alloc_internal(struct ivpu_device *vdev, u64 vpu_addr, u64 size, u32 fla
 	if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
 		drm_clflush_pages(bo->pages, bo->base.size >> PAGE_SHIFT);
 
+	if (bo->flags & DRM_IVPU_BO_WC)
+		set_pages_array_wc(bo->pages, bo->base.size >> PAGE_SHIFT);
+	else if (bo->flags & DRM_IVPU_BO_UNCACHED)
+		set_pages_array_uc(bo->pages, bo->base.size >> PAGE_SHIFT);
+
 	prot = ivpu_bo_pgprot(bo, PAGE_KERNEL);
 	bo->kvaddr = vmap(bo->pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
 	if (!bo->kvaddr) {
-- 
2.25.1

