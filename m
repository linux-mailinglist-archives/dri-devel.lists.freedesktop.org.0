Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E637C53947A
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1118D10F4BB;
	Tue, 31 May 2022 15:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E061F10F45B;
 Tue, 31 May 2022 15:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSs/Ld04MMg0TretMXIG3YIE8eUoJQ96g2N6P200mwBcHYDpSuhwduoOaRSg7Kdz2BSar8KU/2mcZybdRdq74Hb/zRqFph/v71AuA1yaSqanNS2UmB9hOIKKK/EMLkVksPO9kst6rf6rTXuwTV8PNB/wNP/Cbc7L+JDwW/aWDDr5mkI2ErXKH8I+HqffQ50Ijl59E7FaAutDLLN+9tYaO6tdjEeSDgjwjwOJkHC0pLlPKeEltloWrpBxtmQU3s86Zyd1GjHoE00YG7ZA7JpeI3nOquSZM+JZ1Z29Qzp+z5cosnNnfM3vPvRkWzyUmEYheOHyFQCOq5H+WSo9qgIg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa846fnxeU9bk+TyhpVkrT9/4QOUTaeNbDS2MCZJQec=;
 b=nkxxKHFWQTHGHLPKoPYPIsEPkxmsyDrDv9eyzfM+fBuO0qRif02xgqUv3I5bTpg0KRla1YFEX0QwsIGShF27WmWCrOhCZMUXCVeTmwCHfAo2FOf4G/DsxFaPem+bna3V9F4B+1O7hRMjGfYxDJrA1pj0wbYyW0LADhtUyDjLy1YQ6cd4NUeYNxj2APB0bf9aTtPTP0nJUQZK3pJUOeMd1bIuwsaTnm67xd8fUrkQYju7AEGNcRCnk3Fx/1snAPXr3ycOuP9vqycFIcUB/HNI0aD6ozazsjcI8EOHKqpu1vQhg5qvI4HAHSXaSCKYo+Vss/yOljAkctO06iqkaZ4Lsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa846fnxeU9bk+TyhpVkrT9/4QOUTaeNbDS2MCZJQec=;
 b=bPgc18dyHpBb5l35YOSItZmEaleflNznXY4JsPxLvJQ0mfGXQlZltYrBtfz5AFjYI1sjsH8kj8o+/Mlag6BZAgd9g05du5z0k5yyl6id/usZaThUvdGfNrsEkvg5lf3QcsUHrIbXP51p1jhHzUgj54df8rH0eorhJygsiBA9fbw=
Received: from BN6PR16CA0025.namprd16.prod.outlook.com (2603:10b6:405:14::11)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 15:56:47 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::6d) by BN6PR16CA0025.outlook.office365.com
 (2603:10b6:405:14::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 15:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:46 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:44 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 06/13] drm/amdkfd: add SPM support for SVM
Date: Tue, 31 May 2022 10:56:22 -0500
Message-ID: <20220531155629.20057-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0d9fafc-d521-4f3e-ffab-08da431e2a8e
X-MS-TrafficTypeDiagnostic: PH7PR12MB6396:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB6396A0499BEBB6404A24F59CFDDC9@PH7PR12MB6396.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcuAcTHnZrjXr+f3PgetLqaQsYF846Hapf9Edg5j7q97iKwuhZV/GwCVLAS6b5XqtoKOpdUNlCr12i0PFi4+uVtY9pmI8o8AQLMJIoTh/vwLNbu7tW026mwIpPod2Wqa37l6kXWzblp03L+Z/g/iWjZiCM56TzBDv9NH80x7W2WhzP11Wh8AOXwY17PUeuI1MqDAs9p7VhpS0ioud4WO/n79FWqCgu8+xJURk8Lc93rNO3ly8g5OAuH4UyV4V32YKizwxLl+ZafVQZAdRpHgO0ygz0ogJifLUYFQPtJj/9yayBnnF8mxLw4SA4S0AOArZH/rDTa2Po6eNNULtFt6NdmM6NP847LIiaZA9fUctCYYLLVldeVuPyKwo7yoaE/xuJv8Gx6wInqVvtUjQTnRCSf27Y9RZfbjU+Vl+LkhF1+tsxEJlJN2Lx/fN9xzEEtMGNd5xNNaXJTmUe3zkVwJtJLQUwTCfzswYltXvAFDXFLjzkgPymSQqLpCvEPKClaS71uKnO+RZIXdPXVCdyH3V+LhRql52Ql7AsEU1NfywyVF4kqKzVJ2UvWe53QWCz5ZoJ3eJPaQSmXtafz9+tips2Ui9LIUPW52BooFLcZb8iyrK9b/gYAUFfNwDOkdJVW2Ry7BEEiXA1agaU2vanfiCYm6g9p2nSsdECa6zsjOyD7GAIe+97vBdTbEAvLb2KKuaCZ6Ww60nP8346wzcIIavw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(426003)(4326008)(186003)(16526019)(1076003)(70586007)(70206006)(2616005)(83380400001)(40460700003)(8676002)(47076005)(86362001)(2906002)(81166007)(5660300002)(356005)(7416002)(44832011)(36860700001)(8936002)(508600001)(36756003)(7696005)(6666004)(6916009)(26005)(54906003)(316002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:46.7816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d9fafc-d521-4f3e-ffab-08da431e2a8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_COHERENT to create the device
page map region.
Also, MIGRATE_VMA_SELECT_DEVICE_COHERENT flag is selected for
coherent type case during migration to device.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 34 +++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 997650d597ec..39b8c4710caf 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -671,13 +671,15 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	buf = kvcalloc(npages,
 		       2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t),
 		       GFP_KERNEL);
-
 	if (!buf)
 		goto out;
 
@@ -947,7 +949,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -962,28 +964,34 @@ int svm_migrate_init(struct amdgpu_device *adev)
 	 * should remove reserved size
 	 */
 	size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
-	res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
-	if (IS_ERR(res))
-		return -ENOMEM;
+	if (adev->gmc.xgmi.connected_to_cpu) {
+		pgmap->range.start = adev->gmc.aper_base;
+		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+		pgmap->type = MEMORY_DEVICE_COHERENT;
+	} else {
+		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		if (IS_ERR(res))
+			return -ENOMEM;
+		pgmap->range.start = res->start;
+		pgmap->range.end = res->end;
+		pgmap->type = MEMORY_DEVICE_PRIVATE;
+	}
 
-	pgmap->type = MEMORY_DEVICE_PRIVATE;
 	pgmap->nr_range = 1;
-	pgmap->range.start = res->start;
-	pgmap->range.end = res->end;
 	pgmap->ops = &svm_migrate_pgmap_ops;
 	pgmap->owner = SVM_ADEV_PGMAP_OWNER(adev);
-	pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
-
+	pgmap->flags = 0;
 	/* Device manager releases device-specific resources, memory region and
 	 * pgmap when driver disconnects from device.
 	 */
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-
 		/* Disable SVM support capability */
 		pgmap->type = 0;
-		devm_release_mem_region(adev->dev, res->start, resource_size(res));
+		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+			devm_release_mem_region(adev->dev, res->start,
+						res->end - res->start + 1);
 		return PTR_ERR(r);
 	}
 
-- 
2.32.0

