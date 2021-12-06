Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36ED46A528
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECF673144;
	Mon,  6 Dec 2021 18:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63276E8D2;
 Mon,  6 Dec 2021 18:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHkGo6cuPpgoq8aVAleC8XQXXyAxVRp4cqAjP9NSr6VK02R1HbZajDixEeRUAuDhzUH4HultlyQzPsN/N4ZKgoPQ5MNWx+3ixO0e9sL01ZSdOKQM2FC0vZGhAs+ES+x8lQXOd2fEhpS5etqN+9OuWUn1rf4HSwBsxsBiWUCAUAOfy7PaC75gLfIpW+N3kyGe8UMpb4U0jGZxtTD/VRnSzvQ6VCDDgMH44lswlEoCubtGVam3buvUsadcaANLRiMJF7EMwIBeqkNKdVGtnDrKPPz3Yog0XH8QukfVt3OiGnTbVoABfSsYt1PAgcSifTY/g/x4v1HcO/VCO3dkNP3neQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=cgtVwBOtiUKEAjlJI2vkp3hjw9vNDamSKBzhf70iQHiX1yqYR5u6OPkSyxPuwKQV9GMZEiJDnRkfLZ0eihI9Lfj2cMR6y/bHy0ec8UScWh1/LGwhs2FJnaxUBBalQjzPHq0yMLUw3HFIx7NqfPL+T9QnXezvpZjJZtzUd/3D3slchx4UCIuOApYKLBLkp9LHAD9T30netqFZQDYXwx1v5ppsgXaEc20j7ozCBqQL/2QW2bUYHmQJffs0s8IOvTOel+5yfLsTSlTxshjlW6iNEbWBdJ3kFrj/EpCEYQhH3c4lGklCoHi6SPMjwxnZ/vVDEFhSpTyq6NEv2OkkHYqX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=LalEHsUiXJ69tkwCIwgAYMuHr6vg5E2pqGd7XlBcSEnUFrLs3BCGKHmkxDSC6oTPe718kIqO13sCMNYFSPkVqis+FFTD10b61FWpSOGAZdXgNfm123QSYLpVWiP9/NQY3bhPPLTzY9wclUUkp+oeD63wJlzETtdHApQ0P2eFiEw=
Received: from DM5PR15CA0051.namprd15.prod.outlook.com (2603:10b6:3:ae::13) by
 DM8PR12MB5397.namprd12.prod.outlook.com (2603:10b6:8:38::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.24; Mon, 6 Dec 2021 18:53:05 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::67) by DM5PR15CA0051.outlook.office365.com
 (2603:10b6:3:ae::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:03 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 04/11] drm/amdkfd: add SPM support for SVM
Date: Mon, 6 Dec 2021 12:52:44 -0600
Message-ID: <20211206185251.20646-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14fe76c4-0a76-4903-faaa-08d9b8e9a316
X-MS-TrafficTypeDiagnostic: DM8PR12MB5397:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB53974A310D925BF7A37E833EFD6D9@DM8PR12MB5397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWRrEYj+CmpaslsfYG21BLuK3ZTfcujGZR50PP80QAvuIMoIFKuBs2k2fKXd6+D8lDm6b45gndeN4KM1npirwGbeYVHAVdKXLKyLAuV7TMwP0Noaxu8OXcSUhTnFB8K5oGXkTxewFEKUyOuOaM8FSqucEVJm9wkDxB5Qi0HNOBTtKGXqG71leI/Jq6f1iieZYK8hPIrN8MS+LRfMUQBxhrDqzqVzXpDkZTegLKHC+9wQhFclw/S/vPygGmV7jgofeLwd5ClwfE2QFKTBTYpvbbRmAXqDmsTuZSD1X56c2oPi89AomiDj9bUqAo0X2jYVDm4i46MTxYfFys+F2fJ5Hg07szFHDrkq88fwh50dKeYb2PeygDl6uCgi4qtGB9zK9wSlic0E+/+TNZCy9huZR5cz3n3qkmVszr4+gIY/H/U7d6eQ7VYkd7+cyjodAwVMyzIKdCb1g08VJFBCAFVoqfhRhSQNPWOMmG22dRDc5WnxzngC7T65MIOGIla3JKM7MhSR5dvFWF7vcHSKOXr2uRAv1BkOYJoaraebFxzbwpaAdcAIxdpH/rYK3Z7AsPc4W0Z2sn9w9DJDqPVVo1PJR6Z7V7KplujqtnXQtv0D0s9h0HZ8sF5iw5xINWB9RtRNKqq6DOVNUpAPd7m5FN64xqgL1dcNMtBM8zHIqhctL+XHMpvMOmYxQPZtja3hM7ZZfbzNc6O80MqR4qZPb+uTWwicQve73el+BxsXJ4nXJ4rcNI/66KIzD0PAvyas7FPrjy5qTqZK+JeM/qawPiXsdG4cp+sVfl0YNEU9Qyvh8Kk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(7696005)(426003)(40460700001)(54906003)(36860700001)(70586007)(110136005)(83380400001)(44832011)(186003)(508600001)(47076005)(8676002)(1076003)(82310400004)(5660300002)(70206006)(8936002)(86362001)(356005)(2906002)(26005)(4326008)(81166007)(336012)(2616005)(16526019)(7416002)(6666004)(36756003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:05.2093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fe76c4-0a76-4903-faaa-08d9b8e9a316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5397
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When CPU is connected throug XGMI, it has coherent
access to VRAM resource. In this case that resource
is taken from a table in the device gmc aperture base.
This resource is used along with the device type, which could
be DEVICE_PRIVATE or DEVICE_COHERENT to create the device
page map region.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v7:
Remove lookup_resource call, so export symbol for this function
is not longer required. Patch dropped "kernel: resource:
lookup_resource as exported symbol"
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index aeade32ec298..9e36fe8aea0f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -935,7 +935,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -950,28 +950,34 @@ int svm_migrate_init(struct amdgpu_device *adev)
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
 
@@ -984,3 +990,4 @@ int svm_migrate_init(struct amdgpu_device *adev)
 
 	return 0;
 }
+
-- 
2.32.0

