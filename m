Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0209DF536
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFFA10E216;
	Sun,  1 Dec 2024 10:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J7kLu88k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69E10E216;
 Sun,  1 Dec 2024 10:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2eEo3JjBbLTQYmp7JaASfZ+08c2xUiSPMRSCJxNZonGKUR9kKEUYOAiosWiBx0zxpD0ura8P3PlT0MA5ifyiS/SFWVU1BeR3zSvKpBpBo5pBRFRI6wKpPINOS9lhsnNFeUuwmfVKDgOD9cPBiIFrxWZUsbv8bSUGeCWd2/Tgj8pZhwfdPjXEpRZofMapyf1EGvygvYShOgX48sarHfTGyZdeYYfr9eRV1sqoefMxjVFggMOE9KNnuznetSWxp6+4jSUgIRrPaJdLsfsa5D9heZ1ap5kLiv1jW3ZzK56mVBX3hUBR1+ubSRDIlVlj2ARhLdSLRoxijFrY6caW5Fo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA/4IxtsjDCMtBq0SlhR9bcQvXIpvvmGq2lJk5dRHR4=;
 b=YFR0hPn4TAMd0ljg+5Rsn1f7SzbtmM0jbSrPybw1+kn40+58X19wXjZvr04BKFEceKISYuWCdHJ1Ig37846HqEH5I4aPfgFqFZZwoJSG2lLgTztunsgwyCdrhoZgON1D1OTCBE9eMNX1xh4niFlKpp1DT5TBJAHkodgtEqKJamnbPaQPpNpMwusfdFVCN4pKsKxSJy2uwYVaAYK3o3MZD3XG0mN7pSILY6Xb9k9iTJ/23RxIJ+XsM1HWxWc4bmlcU7EhENJOSYqd0wgg5/QOMRZ6gV98z6NWewsDpOfBnz9SjZCgK3aw0gDfu+hyR1aR6My3PSYWLcRtOhr7kyWydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA/4IxtsjDCMtBq0SlhR9bcQvXIpvvmGq2lJk5dRHR4=;
 b=J7kLu88kTOcBPx3vqLhtD5Q7ANddfM2NN5b9z+Jj6nJuh3bzGFMF+ssoaqsvz9B9zVOngS0xCcvy1ozISCWVXUU75aUECHNOQlxtlGkY047i7IgZQ6aUwUWzvLvN0FK63v2HEqlqZEGu/ArSljRbyXXe1Qzz5Lr468Zqutbz9Y2BIuDsMKO5XiynaYL8/3/l1UesxfL5XAXaBqfFZnC0/LXaxYQ6PLL3X8S8HRRTWNTg4eZ6COx/+qbeMK9BbnnF3Kwcm9Pos95lKnh7wkK9WMGeopXpK+e5i3P+yxfIXq2/euOSAMIurqddDT2siB1R5jlQbO0T6MbgI3SR4GEAYA==
Received: from CH0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:610:e5::23)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Sun, 1 Dec
 2024 10:38:07 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::7e) by CH0PR03CA0258.outlook.office365.com
 (2603:10b6:610:e5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.16 via Frontend Transport; Sun,
 1 Dec 2024 10:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Sun, 1 Dec 2024 10:38:06 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 1 Dec 2024
 02:37:59 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 1 Dec 2024 02:37:59 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 1 Dec 2024 02:37:55 -0800
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>,
 <jglisse@redhat.com>, <akpm@linux-foundation.org>, <Ymaman@Nvidia.com>,
 <GalShalom@Nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-tegra@vger.kernel.org>
Subject: [RFC 2/5] nouveau/dmem: HMM P2P DMA for private dev pages
Date: Sun, 1 Dec 2024 12:36:56 +0200
Message-ID: <20241201103659.420677-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241201103659.420677-1-ymaman@nvidia.com>
References: <20241201103659.420677-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 124e31bd-e88b-4ca1-39ff-08dd11f43e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlS2ib7zLFQeVi6ncrc2kdUZJp2r0qik4WAftnohOi3NKtCjGgBHNVCHagKJ?=
 =?us-ascii?Q?VsVtDZLUGjbL0hXTaXVHlFhDYjmLET7+lsD1Ocj6Wi8/5NhRqBAHt8weob7r?=
 =?us-ascii?Q?qsh7rIQyOn6D0C0lD8s30oVBrjQ1g87nHBqXDhDMkVVgjLrhrIrg7rFKf7J9?=
 =?us-ascii?Q?WPppxEghzj/1NXOSxQ41IacPlMaR6zyu1qoMiw8DlIvZ/QyQqqKGgtvxwf63?=
 =?us-ascii?Q?ga0TxfqoB3Jnylq5Va7atDb3F/9K9h0gpn5et5D58nx+J1Nw54YbavFq+bdS?=
 =?us-ascii?Q?PWM5rSVSAp/fF8tFbh/AUcQkcs+Z9gPtrNKRkKKp3UKLdfJLxXcBHzRnu5rA?=
 =?us-ascii?Q?eYwrfjOcMghYwxYuRt77TC/hlzdrODOABw7YyhiKWTS4KnzwoyKvmGoJ6M+f?=
 =?us-ascii?Q?qOfXdG3J9ToXTVJv/hIx9EShZMCrAsbcqLnhC38pmbbAS/VcpejWft2aI25C?=
 =?us-ascii?Q?FXkHKWQ7CTj57YNj6f+j3IunJIWTy0HLaEWitjA8vJqiZIZAr9LjYqNdD0T9?=
 =?us-ascii?Q?PlCYtDuTYNJXewpkPlHPOFduxaZvQn5ZaV/5ddO28DJ2sthzuL/3BtPb4WfN?=
 =?us-ascii?Q?KJIfXElem7lBOZKeutUgVBAtnbnec2nP3v9sTT2euD1OQD3VlFHuvExwFMGW?=
 =?us-ascii?Q?nb9SInN31LApKows2OytZB5RKBBBR1QOThncUqHE3eoiynkOpwp3i/cVaLaw?=
 =?us-ascii?Q?nsBHyc3aGAcKgehPgw1ctrYmdGC7X6PnsdNWsXrhPT57afgb80s+mePrwiVJ?=
 =?us-ascii?Q?Dpye96Rrlx+lY40PuGBdiOKA5+uOg++sxXTRb73LYt1P8Tc0a/OvIJInmn44?=
 =?us-ascii?Q?oe8gflN9w7kAMWFXpqHJz5NSoLhw4AZrigCuVFHU3bpj/snpS+GzZWGHEOQe?=
 =?us-ascii?Q?foVUw4luvt4lTb33UlAVpexBi/H7ltDAKewwfXZgx3oktCo5REFn7NVI5FS4?=
 =?us-ascii?Q?HecdrOqw1cCaoUHtZWKzHTyuMAhSQFE3oUStkwtz7QhuNnsPVhqB6GUTrKoT?=
 =?us-ascii?Q?v4M+eKD5je3Om74v3QNFs/j9H9Ezy1Y6lGF9JE/9OquA8V7fkqkkJDndNmW9?=
 =?us-ascii?Q?zN/4jaszSGnVSZ/d4WYUk6MVC3QwcnqBUJ9i1Gk95EkiI6F6AFzqBWexKQDX?=
 =?us-ascii?Q?gH5f9HFV2f8JfMJDVjTsSDG6MXUOm+zOdlLUsucl/FkFBjKPz3t4z5sNgYP8?=
 =?us-ascii?Q?nxGluyzoVbCPSfOUiVaiNSexx/M7/Opz/Rm8+uWQsUGwaBZwrdzUPMtrRKNb?=
 =?us-ascii?Q?pyto0ES7MR9IXWiRzU1w4BCVYuvcTDpXJfZ8R2tDPhwmMJVqLxtsw39EUHBF?=
 =?us-ascii?Q?Tgq3j7Yzn4rnIScVU0wUDoju9kJErnqA1q/cKrICzN19bHOsif0Bkdg4X2nl?=
 =?us-ascii?Q?LeNTbsexiBf71RlZuS+XTedCM37Oz71H4dMHGw0YX2dHCK4t5UeVhUqyAQE5?=
 =?us-ascii?Q?tPe2rdH0hECam+IxIUJ8Hz8ab3k/pT+WX876AtQpUNMdhClFKXyYIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2024 10:38:06.8833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 124e31bd-e88b-4ca1-39ff-08dd11f43e3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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

From: Yonatan Maman <Ymaman@Nvidia.com>

Enabling Peer-to-Peer DMA (P2P DMA) access in GPU-centric applications
is crucial for minimizing data transfer overhead (e.g., for RDMA use-
case).

This change aims to enable that capability for Nouveau over HMM device
private pages. P2P DMA for private device pages allows the GPU to
directly exchange data with other devices (e.g., NICs) without needing
to traverse system RAM.

To fully support Peer-to-Peer for device private pages, the following
changes are made:

 - Introduce struct nouveau_dmem_hmm_p2p within struct nouveau_dmem
   to manage BAR1 PCI P2P memory. p2p_start_addr holds the virtual
   address allocated with pci_alloc_p2pmem(), and p2p_size represents
   the allocated size of the PCI P2P memory.

 - nouveau_dmem_init - Ensure BAR1 accessibility and assign struct
   pages (PCI_P2P_PAGE) for all BAR1 pages. Introduce
   nouveau_alloc_bar1_pci_p2p_mem in nouveau_dmem to expose BAR1 for
   use as P2P memory via pci_p2pdma_add_resource and implement static
   allocation and assignment of struct pages using pci_alloc_p2pmem.
   This function will be called from nouveau_dmem_init, and failure
   triggers a warning message instead of driver failure.

 - nouveau_dmem_fini - Ensure BAR1 PCI P2P memory is properly
   destroyed during driver cleanup. Introduce
   nouveau_destroy_bar1_pci_p2p_mem to handle freeing of PCI P2P
   memory associated with Nouveau BAR1. Modify nouveau_dmem_fini to
   call nouveau_destroy_bar1_pci_p2p_mem.

 - Implement Nouveau `p2p_page` callback function - Implement BAR1
   mapping for the chunk using `io_mem_reserve` if no mapping exists.
   Retrieve the pre-allocated P2P virtual address and size from
   `hmm_p2p`. Calculate the page offset within BAR1 and return the
   corresponding P2P page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1a072568cef6..003e74895ff4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -40,6 +40,9 @@
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/migrate.h>
+#include <linux/pci-p2pdma.h>
+#include <nvkm/core/pci.h>
 
 /*
  * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
@@ -77,9 +80,15 @@ struct nouveau_dmem_migrate {
 	struct nouveau_channel *chan;
 };
 
+struct nouveau_dmem_hmm_p2p {
+	size_t p2p_size;
+	void *p2p_start_addr;
+};
+
 struct nouveau_dmem {
 	struct nouveau_drm *drm;
 	struct nouveau_dmem_migrate migrate;
+	struct nouveau_dmem_hmm_p2p hmm_p2p;
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
@@ -158,6 +167,60 @@ static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
 	return 0;
 }
 
+static int nouveau_dmem_bar1_mapping(struct nouveau_bo *nvbo,
+				     unsigned long long *bus_addr)
+{
+	int ret;
+	struct ttm_resource *mem = nvbo->bo.resource;
+
+	if (mem->bus.offset) {
+		*bus_addr = mem->bus.offset;
+		return 0;
+	}
+
+	if (PFN_UP(nvbo->bo.base.size) > PFN_UP(nvbo->bo.resource->size))
+		return -EINVAL;
+
+	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
+	if (ret)
+		return ret;
+
+	ret = nvbo->bo.bdev->funcs->io_mem_reserve(nvbo->bo.bdev, mem);
+	*bus_addr = mem->bus.offset;
+
+	ttm_bo_unreserve(&nvbo->bo);
+	return ret;
+}
+
+static int nouveau_dmem_get_dma_pfn(struct page *private_page,
+				    unsigned long *dma_pfn)
+{
+	int ret;
+	unsigned long long offset_in_chunk;
+	unsigned long long chunk_bus_addr;
+	unsigned long long bar1_base_addr;
+	struct nouveau_drm *drm = page_to_drm(private_page);
+	struct nouveau_bo *nvbo = nouveau_page_to_chunk(private_page)->bo;
+	struct nvkm_device *nv_device = nvxx_device(drm);
+	size_t p2p_size = drm->dmem->hmm_p2p.p2p_size;
+
+	bar1_base_addr = nv_device->func->resource_addr(nv_device, 1);
+	offset_in_chunk =
+		(page_to_pfn(private_page) << PAGE_SHIFT) -
+		nouveau_page_to_chunk(private_page)->pagemap.range.start;
+
+	ret = nouveau_dmem_bar1_mapping(nvbo, &chunk_bus_addr);
+	if (ret)
+		return ret;
+
+	*dma_pfn = chunk_bus_addr + offset_in_chunk;
+	if (!p2p_size || *dma_pfn > bar1_base_addr + p2p_size ||
+	    *dma_pfn < bar1_base_addr)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
@@ -221,6 +284,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.get_dma_pfn_for_device = nouveau_dmem_get_dma_pfn,
 };
 
 static int
@@ -413,14 +477,31 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(dma_addrs);
 }
 
+static void nouveau_destroy_bar1_pci_p2p_mem(struct nouveau_drm *drm,
+					     struct pci_dev *pdev,
+					     void *p2p_start_addr,
+					     size_t p2p_size)
+{
+	if (p2p_size)
+		pci_free_p2pmem(pdev, p2p_start_addr, p2p_size);
+
+	NV_INFO(drm, "PCI P2P memory freed(%p)\n", p2p_start_addr);
+}
+
 void
 nouveau_dmem_fini(struct nouveau_drm *drm)
 {
 	struct nouveau_dmem_chunk *chunk, *tmp;
+	struct nvkm_device *nv_device = nvxx_device(drm);
 
 	if (drm->dmem == NULL)
 		return;
 
+	nouveau_destroy_bar1_pci_p2p_mem(drm,
+					 nv_device->func->pci(nv_device)->pdev,
+					 drm->dmem->hmm_p2p.p2p_start_addr,
+					 drm->dmem->hmm_p2p.p2p_size);
+
 	mutex_lock(&drm->dmem->mutex);
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
@@ -586,10 +667,28 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 	return -ENODEV;
 }
 
+static int nouveau_alloc_bar1_pci_p2p_mem(struct nouveau_drm *drm,
+					  struct pci_dev *pdev, size_t size,
+					  void **pp2p_start_addr)
+{
+	int ret;
+
+	ret = pci_p2pdma_add_resource(pdev, 1, size, 0);
+	if (ret)
+		return ret;
+
+	*pp2p_start_addr = pci_alloc_p2pmem(pdev, size);
+
+	NV_INFO(drm, "PCI P2P memory allocated(%p)\n", *pp2p_start_addr);
+	return 0;
+}
+
 void
 nouveau_dmem_init(struct nouveau_drm *drm)
 {
 	int ret;
+	struct nvkm_device *nv_device = nvxx_device(drm);
+	size_t bar1_size;
 
 	/* This only make sense on PASCAL or newer */
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
@@ -610,6 +709,17 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 		kfree(drm->dmem);
 		drm->dmem = NULL;
 	}
+
+	/* Expose BAR1 for HMM P2P Memory */
+	bar1_size = nv_device->func->resource_size(nv_device, 1);
+	ret = nouveau_alloc_bar1_pci_p2p_mem(drm,
+					     nv_device->func->pci(nv_device)->pdev,
+					     bar1_size,
+					     &drm->dmem->hmm_p2p.p2p_start_addr);
+	drm->dmem->hmm_p2p.p2p_size = (ret) ? 0 : bar1_size;
+	if (ret)
+		NV_WARN(drm,
+			"PCI P2P memory allocation failed, HMM P2P won't be supported\n");
 }
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
-- 
2.34.1

