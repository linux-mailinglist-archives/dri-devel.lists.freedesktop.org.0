Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7753978F
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1C510E5B4;
	Tue, 31 May 2022 20:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CB110E52C;
 Tue, 31 May 2022 20:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKvFkCeP4lDN8CIZgmy+ToFYCXPbwrx1czeJvzUNKmtcdt3k6X2nKypYQw+bvbo136V+kUvOVPhtlYyYS22Cn4wbAX8R98dAXFKlv80Jx+/+9vhi9ntNmytirZWgUW30JxmqwQr0R4ZrgmfyHQJVzmNuIaqVm41FWy7DoVr6umAg9O9XbV9fbcaa7LQYoBcjTRPpR747VVxXfo9eJwVk/4d6D1ZOs3S/3bWKKhQ2FRbgg42AdUhwmRyfNRXiRgNpbU6ICr+JPWyXI6fP6ClwimD7m9ya7UynTogMyUuWw3cvy14e6u7qp9phI8LhYSiNPn2FFzFhzxusnNhQRor23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa846fnxeU9bk+TyhpVkrT9/4QOUTaeNbDS2MCZJQec=;
 b=g8eFA0yNXv/Kvwyc0gPSCGt7KHYSKAba40RT2OFnoGg26soy4lFOhaY2QsNjrzXCRApAeGL5+w8J/liT8mRuhp4qBcJY8PpAAruEbuucTxRDkCHHiaYb/g4aY0HqTtlLCuOtGY2+M3TDW92LhZl326U2CGwYwz2yuMNxxwf6zaxsy9ZjjEdW0uEzd6y+0eauuUnxCIux1eZd9tP92crP8yk1ZyiM6MJw7/m5g+nr+3kXeHAScII3jpIx5gVXwCKpofWSz2KQt4RB1wSkASnHW8aQTGcWSqTP+tu9nqtW3cK0l3tqMOqF4N76h+b+TJDknvl59Mihy7YaCV+6DKAZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa846fnxeU9bk+TyhpVkrT9/4QOUTaeNbDS2MCZJQec=;
 b=Xpj2bBXhnJZHBgd6hOfg2sS+/n5HbnSQeEyK1yw0lQFqQXcxcul2yLnQUsmrnFAWNBEi6NvvndNVAkn7me1MfVUJAtyqiil7KNimwDMsLN5b92w7Atr3beNabDlfq/JSh+2enRAYIoWx3Ktf21LXXmM7qcTXMm/sKsVXRMkE6lI=
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by MWHPR12MB1661.namprd12.prod.outlook.com (2603:10b6:301:3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:01:00 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::f4) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:01:00 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:58 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 06/13] drm/amdkfd: add SPM support for SVM
Date: Tue, 31 May 2022 15:00:34 -0500
Message-ID: <20220531200041.24904-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2d37d13-0a44-4ee5-3a20-08da434048eb
X-MS-TrafficTypeDiagnostic: MWHPR12MB1661:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB16613BEC76276FA7261335CBFDDC9@MWHPR12MB1661.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajwy4Z7kWfKiOcWn9eDQNf2LEaJ0BMbD8toVnQfX3YxxAfrJSC29F9L+N81NGx2t0RnCIir8CucUM2eGqyI/BTZCGKT4XmlwUnC/Z+CddX3HhoubXTPv53xcalilvwSs+ZXVYdfB5smLo7ZotTSJlSkTe9/ZCaeEzOu1lNhF9a2wJvY7017E6CjJA5w2ApXMM+z+kVAS9TvoINHDlkHiViN9bTiEg/JDDrHtQEUp2RQNBaiboydiG3easpYL5FTXu23wsPjJJHcYOGKyj0TzinIdogG5w3WLJm+U+HG3Lpoog8Z6Jmu86n0wSH8EZIzcIcFozfFh864UFdICPIFMHOVzj32s2Jgxxx9T/NlUSp9PdoCaQrXdyxpW4WdqYllf4PXvXO/S0Tf/rxLXHHWUCyAsBmfHl/Cvrv2CJBZeO4HN7MMzOBcRhliCsQYxo7MREhGDeFoXIafUnq6cIzjHLmWchJgfUvcW18LAlgnZ8qk/s9Xk584JM484kLxdfOpZIrF4vCq1hpyVl3f53qPi/Kvit9yMDlDo/KNp7w3Olvham+M2vpybpdaOAAPHMKlOj4JQeBhLHw6uj0dgWOj7B5/YfGm8U4Z+ahvHuG6oMtOH30I8lpvYzulJoMi2vp8osk7jOt/cmJAsA7QeMb9j8Q9XSGGpCOleBI0cfwFBDrf6CrlG7KvGvifKXJxQgFlGTCrA7yjEboW5UJu9HEF5qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8676002)(2906002)(2616005)(26005)(54906003)(82310400005)(316002)(44832011)(6916009)(36860700001)(356005)(508600001)(47076005)(7696005)(336012)(81166007)(6666004)(86362001)(40460700003)(16526019)(186003)(426003)(83380400001)(36756003)(8936002)(70206006)(7416002)(1076003)(4326008)(70586007)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:01:00.6064 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d37d13-0a44-4ee5-3a20-08da434048eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1661
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

