Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E1AC77F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF12110E6F6;
	Thu, 29 May 2025 05:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbQYNb4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7376010E6F9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497468; x=1780033468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+Og/7//HP2ImpOPljrHL/2A9Bv5uMTbEhhPjy/aPyo=;
 b=lbQYNb4jC1txl8eXLp75ILHeE5A7bgdTFv1u2Kxxli/sS7piieZxh2kX
 rbvgyQgkvxq7OP2pB0OM4wLJn/kPacnOP+g9cpJg153VWN/MknTM/o5bO
 V9rvwijMiXJ9clXKWRpRNqKAnfg0jreU9pGlZl4TAWdiC/EzQKqUqGkkB
 MPp1Zt3V+ZzJ7ZXkA54hoMGonOOsucgXxDSkamARKeKqpjM6OQ1afFpNE
 jx1H91q47a22HVBjSTk8XfRDpxGxNNxrXKbtUokH8yjIJKkjxnW2LPVD7
 +JZwx3woGFWsQqWjpwCisIZb0lx9+WnnIb3cBWYdjW1tmOoO8mg5EwVSC w==;
X-CSE-ConnectionGUID: uxBTtTPgRgSeriPf6nzH7g==
X-CSE-MsgGUID: yocG8v28TSGueda535Kogw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963418"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:27 -0700
X-CSE-ConnectionGUID: Qm3Lbc/QRMGZMhshJ4HxFA==
X-CSE-MsgGUID: pJCuEKEIR1+XYLHUM/QRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443629"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:20 -0700
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
Subject: [RFC PATCH 26/30] coco/tdx_tsm: Add bind()/unbind()/guest_req()
 handlers prototype
Date: Thu, 29 May 2025 13:35:09 +0800
Message-Id: <20250529053513.1592088-27-yilun.xu@linux.intel.com>
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

Add basic skeleton for bind()/unbind()/guest_req() handlers.

Specifically, tdx_tdi_devifmt/devif_create() declare the TDI ownership
to TD. tdx_tdi_mmiomt_create() declares the MMIO ownership to TD.
tdx_tdi_request(TDX_TDI_REQ_BIND) locks the TDI.

No detailed TDX Connect implementation.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/virt/coco/host/tdx_tsm.c | 83 ++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/coco/host/tdx_tsm.c b/drivers/virt/coco/host/tdx_tsm.c
index d1a8384d8339..beb65f45b478 100644
--- a/drivers/virt/coco/host/tdx_tsm.c
+++ b/drivers/virt/coco/host/tdx_tsm.c
@@ -44,10 +44,49 @@ static struct tdx_tdi *to_tdx_tdi(struct pci_tdi *tdi)
 	return container_of(tdi, struct tdx_tdi, tdi);
 }
 
+static int tdx_tdi_devifmt_create(struct tdx_tdi *ttdi)
+{
+	return 0;
+}
+
+static void tdx_tdi_devifmt_free(struct tdx_tdi *ttdi)
+{
+}
+
+static int tdx_tdi_mmiomt_create(struct tdx_tdi *ttdi)
+{
+	return 0;
+}
+
+static void tdx_tdi_mmiomt_free(struct tdx_tdi *ttdi)
+{
+}
+
+static int tdx_tdi_devif_create(struct tdx_tdi *ttdi)
+{
+	return 0;
+}
+
+static void tdx_tdi_devif_free(struct tdx_tdi *ttdi)
+{
+}
+
+#define TDX_TDI_REQ_BIND	1
+#define TDX_TDI_REQ_START	2
+#define TDX_TDI_REQ_GET_STATE	3
+#define TDX_TDI_REQ_STOP	4
+
+static int tdx_tdi_request(struct tdx_tdi *ttdi, unsigned int req)
+{
+	return 0;
+}
+
 static struct pci_tdi *tdx_tsm_bind(struct pci_dev *pdev,
 				    struct pci_dev *dsm_dev,
 				    struct kvm *kvm, u64 tdi_id)
 {
+	int ret;
+
 	struct tdx_tdi *ttdi __free(kfree) =
 		kzalloc(sizeof(*ttdi), GFP_KERNEL);
 	if (!ttdi)
@@ -58,17 +97,55 @@ static struct pci_tdi *tdx_tsm_bind(struct pci_dev *pdev,
 	ttdi->tdi.dsm_dev = pci_dev_get(dsm_dev);
 	ttdi->tdi.kvm = kvm;
 
-	/*TODO: TDX Module required operations */
+	ret = tdx_tdi_devifmt_create(ttdi);
+	if (ret) {
+		pci_err(pdev, "fail to init devifmt\n");
+		goto put_dsm_dev;
+	}
+
+	ret = tdx_tdi_devif_create(ttdi);
+	if (ret) {
+		pci_err(pdev, "%s fail to init devif\n", __func__);
+		goto devifmt_free;
+	}
+
+	ret = tdx_tdi_mmiomt_create(ttdi);
+	if (ret) {
+		pci_err(pdev, "%s fail to create mmiomt\n", __func__);
+		goto devif_free;
+	}
+
+	ret = tdx_tdi_request(ttdi, TDX_TDI_REQ_BIND);
+	if (ret) {
+		pci_err(pdev, "%s fial to request bind\n", __func__);
+		goto mmiomt_free;
+	}
 
 	return &no_free_ptr(ttdi)->tdi;
+
+mmiomt_free:
+	tdx_tdi_mmiomt_free(ttdi);
+devif_free:
+	tdx_tdi_devif_free(ttdi);
+devifmt_free:
+	tdx_tdi_devifmt_free(ttdi);
+put_dsm_dev:
+	pci_dev_put(dsm_dev);
+	return NULL;
 }
 
 static void tdx_tsm_unbind(struct pci_tdi *tdi)
 {
 	struct tdx_tdi *ttdi = to_tdx_tdi(tdi);
 
-	/*TODO: TDX Module required operations */
-
+	/*
+	 * TODO: In fact devif cannot be freed before TDI's private MMIOs and
+	 * private DMA are unmapped. Will handle this restriction later.
+	 */
+	tdx_tdi_request(ttdi, TDX_TDI_REQ_STOP);
+	tdx_tdi_mmiomt_free(ttdi);
+	tdx_tdi_devif_free(ttdi);
+	tdx_tdi_devifmt_free(ttdi);
 	pci_dev_put(ttdi->tdi.dsm_dev);
 	kfree(ttdi);
 }
-- 
2.25.1

