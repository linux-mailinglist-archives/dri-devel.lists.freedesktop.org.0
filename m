Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1381AC77FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B96210E6F7;
	Thu, 29 May 2025 05:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYcaHTjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19810E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497493; x=1780033493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfSkXN7VFQD0j241YOoerWnrQ3UAC5/O1OD0Wg9yzYc=;
 b=IYcaHTjFZV2uxjMVwYXZ5cWhaJdl3ZM4xwOaYUMZMdA+FTpAgc/3rIEr
 w8/p2EV4MdzqiUo0X9bg+jZyKjnZI4L/3DOIRjuBhTBEf9bv7Hee1kNe2
 l62zcpNIc5dT5g5VapXycq7aYDoKc9avZFhLTa5VsdPDqdEizkWP4cBTm
 zCVaseZMGf5VYZGZoEj2VH6g1Um3oaLBeYYuvGPMCXzxg/iIPF1X2EcC7
 YTtI62GleFp1iv2Oi6q5t9iYZPv7HAeWQ/kTjHp5FCldpX4rhBrV7+8DL
 igyDdGwoX86wLDw3oKY+qUkcaOAOhkgGl4MVF5Zxtc8sR+C9wGBDI32uX w==;
X-CSE-ConnectionGUID: ZgH+3cYdRVu/JSmVGYA9NA==
X-CSE-MsgGUID: V5C7II2DQayl+9/gCqF8KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963528"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:53 -0700
X-CSE-ConnectionGUID: VpISARUySKWDHRrKuSvNOg==
X-CSE-MsgGUID: opx6ComdRiCGYPBNIKpm/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443716"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:46 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 30/30] coco/tdx_tsm: Manage TDX Module enforced operation
 sequences for Unbind
Date: Thu, 29 May 2025 13:35:13 +0800
Message-Id: <20250529053513.1592088-31-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Implement TDX Connect enforced sequences for TSM unbind. The enforced
sequences are:

  1. STOP TDI via TDISP message STOP_INTERFACE
  2. Private MMIO unmap from Secure EPT
  3. Trusted Device Context Table cleanup for the TDI
  4. TDI ownership reclaim and metadata free

Step 2 is the responsibility of KVM, step 3 is for IOMMU driver. So
TDX TSM driver needs to invoke TSM handlers for external collaboration.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/virt/coco/host/tdx_tsm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/virt/coco/host/tdx_tsm.c b/drivers/virt/coco/host/tdx_tsm.c
index beb65f45b478..66d6019812ca 100644
--- a/drivers/virt/coco/host/tdx_tsm.c
+++ b/drivers/virt/coco/host/tdx_tsm.c
@@ -87,6 +87,15 @@ static struct pci_tdi *tdx_tsm_bind(struct pci_dev *pdev,
 {
 	int ret;
 
+	if (!pdev->trusted_dma_owner ||
+	    !pdev->driver->tsm_handler ||
+	    !pdev->driver->tsm_handler->disable_mmio ||
+	    !pdev->driver->tsm_handler->recover_mmio ||
+	    !pdev->driver->tsm_handler->disable_trusted_dma) {
+		pci_err(pdev, "%s no driver or driver not support bind\n", __func__);
+		return NULL;
+	}
+
 	struct tdx_tdi *ttdi __free(kfree) =
 		kzalloc(sizeof(*ttdi), GFP_KERNEL);
 	if (!ttdi)
@@ -137,15 +146,15 @@ static struct pci_tdi *tdx_tsm_bind(struct pci_dev *pdev,
 static void tdx_tsm_unbind(struct pci_tdi *tdi)
 {
 	struct tdx_tdi *ttdi = to_tdx_tdi(tdi);
+	struct pci_dev *pdev = tdi->pdev;
 
-	/*
-	 * TODO: In fact devif cannot be freed before TDI's private MMIOs and
-	 * private DMA are unmapped. Will handle this restriction later.
-	 */
 	tdx_tdi_request(ttdi, TDX_TDI_REQ_STOP);
+	pdev->driver->tsm_handler->disable_mmio(pdev);
+	pdev->driver->tsm_handler->disable_trusted_dma(pdev);
 	tdx_tdi_mmiomt_free(ttdi);
 	tdx_tdi_devif_free(ttdi);
 	tdx_tdi_devifmt_free(ttdi);
+	pdev->driver->tsm_handler->recover_mmio(pdev);
 	pci_dev_put(ttdi->tdi.dsm_dev);
 	kfree(ttdi);
 }
-- 
2.25.1

