Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF599F7B2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EC510E600;
	Tue, 15 Oct 2024 20:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l/Ch0etB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE3710E5A7;
 Tue, 15 Oct 2024 15:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axo9k7lU/bIy9B4yThpUBVeCYJlMdDmw6/xJaWqL9w9fhCbH+W5nqJiIodarjUkLLPBKJFy6DJ2qp019YLp4atXwOdghij3CC7tG//kvVOZ5Upcq6tZN6RUZwn49xnKvzt6lHin9KtG2IW86ddvASnJjJNjYRTBe/1kNaenagQHoCIK+I4RLwfgKST4VSqJxvX77WtzQyYZJGkE3kPU6Qku/0PvxCJIjpNRhSIJj+onGGO3ZIN02YItuYgSNeF3pYuVPnlPenaxO5y41sUG0SuqMsyCjXoKFUOxsiyDBrAELobhB5pbkIFn8UpQwL17Dm++8xsV2ncYvwVOxSZrquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeFbwwYOoIblsKPl/s8N30cj3fK8KQ5mY3fN6Hyt39E=;
 b=rSiw0eGG444LRwFEcMfK9dmjnQ8+uSJrhaL81Ml6wI5mqqHtjaKWjA0weB5LFRGrS4UEPstcnJqN/3wTSkMo7NyMIjv/2zanhAK3y419uXeOz8DflVeZmQ53r1SUcMQKkqMmVRLGqOqwYPCV3aV+pb6Gqwo67MWhUNw7qVCtmAFWMsZGjb1xvUq454ZdLZWwR2uuwq6qfKKsWSteoFWJO36178d72nDbWiMC1PxdubgsRh5XebZ8e3Q7BNroz5e/2RZV4L7MiWnqUpxoCKAn7DG2g5v5Kq1BL+yMOgDpTk+9C+xzxBNEnyqtGSQ0mcORavf6v+4hcKjR7DONhJUpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeFbwwYOoIblsKPl/s8N30cj3fK8KQ5mY3fN6Hyt39E=;
 b=l/Ch0etBOd4wF5ALD2AUZpKN4ptcOReI3rmcpUrvMbsGtpPyfq+A9ri4P+37lEFdXBRG0Zzjj1CeBlVS8PL/blgP56j06RTWUQASraeStsw8KDfRTYOU2/2/Gq8TxXgp2KgTphRF0rakGIfEtXGaiLpeqVl/Fu3vc7f8sh7xVnvxSauDBCEKfOG2Zu5zDHwpcJWRjBmP7nfh408VqoiSsuHmgrNHLjI17oEKkleHALYlmh/0CgtWoDfdTlRJImdRNOAPBZfUrF+dboP9adu5U+SxNm726udgBqu+GeyRoFHEMa0w2W9dCpz1JQ07YpHcrlaAu7gGBOTrIW50N5N2kA==
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 15:24:20 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::d5) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26 via Frontend
 Transport; Tue, 15 Oct 2024 15:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 15:24:20 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Oct
 2024 08:24:10 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 15 Oct 2024 08:24:09 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 15 Oct 2024 08:24:05 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>, <herbst@redhat.com>,
 <lyude@redhat.com>, <dakr@redhat.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>, <jglisse@redhat.com>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <bskeggs@nvidia.com>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v1 2/4] nouveau/dmem: HMM P2P DMA for private dev pages
Date: Tue, 15 Oct 2024 18:23:46 +0300
Message-ID: <20241015152348.3055360-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015152348.3055360-1-ymaman@nvidia.com>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 86127026-a9c9-4bc0-e657-08dced2d70e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PmqoIpocYN9j18sLReWwQo763iYXgOiMYJlI/7TqkZCVR6A2hgvNMmSti9sN?=
 =?us-ascii?Q?YDPVwSXPyup/seLgoitXWYAxwPQCdFpNOAJZL5Z8FSzoupgfYtjk1lrHf/s1?=
 =?us-ascii?Q?RZDWToz+Q0fF1MvF5GbJzX6eIeNSfuYbbbOGA26k2aqRrYm3lfbx32jYk+1I?=
 =?us-ascii?Q?YSyg46RLRNu2mAXLBGXGHTb9Lj44f6tpg7+MjCG95qgWHcMbDfcDApcEg6Dt?=
 =?us-ascii?Q?n/p47K9n/O/ySBQn9W/FxoVge4xy+OQkmHp3Dw5Rb5EXSP2GEgSP2jWb3pDQ?=
 =?us-ascii?Q?nTr2PRxNMPPiDxD6sTQF4R4rj4v3t5hPgXxVaJwbNSCqoq+Lky8JrU06jf2l?=
 =?us-ascii?Q?uStQz4zDfvwEbuj7408wLUv+GN9UfA2ex0kCkdLWhw3Pwa6QuVmVB8+Rs/JD?=
 =?us-ascii?Q?yeSlLKXaR1oAWwL0VGfnYKR9roFpTdVzEdijoH412CtvBOE4CJCb9UHz3Nis?=
 =?us-ascii?Q?P6j0tAea+N+ZGKssJDkPyQdA+5aZ/gIvA83u5Ql0vPASoa6rD+Ywp2tLEX1k?=
 =?us-ascii?Q?Ty0IQzmF8KZGgD9/X9kS2XzN7YZNOrRlNuK1BdLZZ90hTmyuQtw67kaKTCaV?=
 =?us-ascii?Q?G2rJQallL9mh9kJWGX665YD2KSSqAZ4wMQ03XCm/vwj1rnsrYUNmtIgCKi4m?=
 =?us-ascii?Q?YrCIS+4CFXcaYpNQxlfbKIVt1MF3IAXrdhmPIihSUfkkTINryJoPxim2mqgs?=
 =?us-ascii?Q?BPs6l5PDiD/8p0zxWwKU6UqGcTjBhFobCu/cpJNZ2UnlQrgbE3P5JpTPRzad?=
 =?us-ascii?Q?5Bn8ciKyUFuPXd9P2sm8BBWMvNqaMIf0F3WAwvndfXQB5gpv6quojeJ/TgwT?=
 =?us-ascii?Q?6WvlBnKurvnEElxgFLLOEL+K+fPCK47xbjIK7Wo2WT2Zw++gyscGBtg6Rl7U?=
 =?us-ascii?Q?wgFL8+ICwwogoDYhrn+UDLi4RG2jamsHhWLLEdmDq1FQTL+2DR0rxwnE29Oh?=
 =?us-ascii?Q?ghWOyKHhFUyM/9LRHpfJwn25MS4BZRB2NPEgGtAcirYduf6FwfswUCJiWKOB?=
 =?us-ascii?Q?x/L9dhronOqBlYOVCSsA+uwgzotbrEqVKd7nVEyrJ/bnGK7lfe/d6DFhGUc4?=
 =?us-ascii?Q?Z3PHBRVL0G4BZVHtuJzUCUxp1oVeNEcWPK23z/A0n7m0jipxXaZlMXJKNfjt?=
 =?us-ascii?Q?InnAD0fkDnHoyehZJ3MN3xg+uNpA8Mf+m0i4o1UfjLNq1cod5W3dAXuwyPcN?=
 =?us-ascii?Q?3TsDns8MHQXHAdQWiuKd+/C1GccbPdYlogbIbkudu83XJdi6l9kuRam+xpIW?=
 =?us-ascii?Q?296ivkg7ofl+AF/IZowHm2gOfLI3KDwZlIVzthCI8sMh5GzixIFGemDs53gn?=
 =?us-ascii?Q?Wogop3MiI6O28R1aIcOVQ5xwiAArYuPDK/QDqweqWu37ZdGdGDWW6NWv0Ssg?=
 =?us-ascii?Q?Y+wvH3644oc6z1kp/dQVeP6E6jJF?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 15:24:20.2710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86127026-a9c9-4bc0-e657-08dced2d70e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683
X-Mailman-Approved-At: Tue, 15 Oct 2024 20:00:36 +0000
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
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 117 ++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1a072568cef6..13fb8671f212 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -40,6 +40,9 @@
 #include <linux/hmm.h>
 #include <linux/memremap.h>
 #include <linux/migrate.h>
+#include <linux/pci-p2pdma.h>
+#include <nvkm/core/pci.h>
+
 
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
@@ -158,6 +167,61 @@ static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
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
+static struct page *nouveau_dmem_get_dma_page(struct page *private_page)
+{
+	int ret;
+	unsigned long long offset_in_chunk, offset_in_bar1;
+	unsigned long long chunk_bus_addr, page_bus_addr;
+	unsigned long long bar1_base_addr;
+	struct nouveau_drm *drm = page_to_drm(private_page);
+	struct nouveau_bo *nvbo = nouveau_page_to_chunk(private_page)->bo;
+	struct nvkm_device *nv_device = nvxx_device(drm);
+	void *p2p_start_addr = drm->dmem->hmm_p2p.p2p_start_addr;
+	size_t p2p_size = drm->dmem->hmm_p2p.p2p_size;
+
+	bar1_base_addr = nv_device->func->resource_addr(nv_device, 1);
+	offset_in_chunk =
+		(page_to_pfn(private_page) << PAGE_SHIFT) -
+		nouveau_page_to_chunk(private_page)->pagemap.range.start;
+
+	ret = nouveau_dmem_bar1_mapping(nvbo, &chunk_bus_addr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	page_bus_addr = chunk_bus_addr + offset_in_chunk;
+	if (!p2p_size || page_bus_addr > bar1_base_addr + p2p_size ||
+	    page_bus_addr < bar1_base_addr)
+		return ERR_PTR(-ENOMEM);
+
+	offset_in_bar1 = page_bus_addr - bar1_base_addr;
+	return virt_to_page(p2p_start_addr + offset_in_bar1);
+}
+
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
@@ -219,8 +283,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 }
 
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
-	.page_free		= nouveau_dmem_page_free,
-	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.page_free		 = nouveau_dmem_page_free,
+	.migrate_to_ram		 = nouveau_dmem_migrate_to_ram,
+	.get_dma_page_for_device = nouveau_dmem_get_dma_page,
 };
 
 static int
@@ -413,14 +478,31 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
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
@@ -586,10 +668,30 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 	return -ENODEV;
 }
 
+static int nouveau_alloc_bar1_pci_p2p_mem(struct nouveau_drm *drm,
+					  struct pci_dev *pdev, size_t size,
+					  void **pp2p_start_addr,
+					  size_t *pp2p_size)
+{
+	int ret;
+
+	ret = pci_p2pdma_add_resource(pdev, 1, size, 0);
+	if (ret)
+		return ret;
+
+	*pp2p_start_addr = pci_alloc_p2pmem(pdev, size);
+	*pp2p_size = (*pp2p_start_addr) ? size : 0;
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
@@ -610,6 +712,17 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 		kfree(drm->dmem);
 		drm->dmem = NULL;
 	}
+
+	/* Expose BAR1 for HMM P2P Memory */
+	bar1_size = nv_device->func->resource_size(nv_device, 1);
+	ret = nouveau_alloc_bar1_pci_p2p_mem(drm,
+					     nv_device->func->pci(nv_device)->pdev,
+					     bar1_size,
+					     &drm->dmem->hmm_p2p.p2p_start_addr,
+					     &drm->dmem->hmm_p2p.p2p_size);
+	if (ret)
+		NV_WARN(drm,
+			"PCI P2P memory allocation failed, HMM P2P won't be supported\n");
 }
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
-- 
2.34.1

