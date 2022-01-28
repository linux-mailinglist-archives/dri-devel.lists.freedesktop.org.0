Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C394A018D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D42310E249;
	Fri, 28 Jan 2022 20:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC7810E166;
 Fri, 28 Jan 2022 20:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbp6LZFGr15WuC/k3BogyZ4Ib+lox9C3RKcWEks9wEVuxaDlr4kSi2PIsd8u4u5y+dKVM9C5J3tSdm9JUH4jrdFM/JVx6sgNiORp0P5pQ9GOCEjfbRCPwVlJ4PT1pogPgUtD62EMXH6RWrtu94uFldLIhdUd0kVMO01LUmEFWoh7KP8J96B2mFpf3p5b5CgU/F+Vpi93d5ODUNN/DsGmHYhFUukL0LUnugzAoFg2tQ22nGaiwoUaqHAm4qCxPhIwO5QyL+tNSB2bTmQFv+dKu3WDJccD1xkR2G6PkPGY9fDN/GcJ2oTpFku2qbb5D2z9ACUi99AUUvhIYaz3YHubhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6Dg+JXQ9T7IJxjdebVIQf/JKMmpP4b0PXF0E4ioiTI=;
 b=XU9BuQ7bwKtp3bp7F+DZE/Gt3tQ+Rw37n07657VSnk1kJuVgr8+qOXPuNgI/r/jg1wshuy3Rgb+mT7H6+lBpy211nmb/h1IXqB8WJtDpX5ksVXi7cJWJk617t8fLi5PuqdC4KRL/jxR2Ym1xflGDQmljHkJaYfHc1jQZ0da6TiEVhnz5k3eHVJjnP6KmrrrhzP8oifmlJ3E+ESIUA2/eduTwinpjG1iRMKuApxb/s4kD+hHXMNdvBwePy9NL89ay23DNNnYkfj+ODanSYJvNzGCySGqJWEo3BWf6LklO6RLSSdRhTPKfpxqfwvlwRu1QCq/1axoAgggTkPnUKzipQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6Dg+JXQ9T7IJxjdebVIQf/JKMmpP4b0PXF0E4ioiTI=;
 b=M3uJLlKjkVSkX45pjr+R9jcnZvA8bZ479bljP3oAJFoHB3nPxbilEYILfIcNvEHUsOhsD+nA5fWAlufCg2D0tRYjlcRhiPvtnnFtkn5dxBbr1B7F7+lLoRLlNcX8r4wKkGl61kk7LeNjFt7YD+28VV/mQAuJa8UV+hHh8ou2zGM=
Received: from MWHPR19CA0071.namprd19.prod.outlook.com (2603:10b6:300:94::33)
 by DM4PR12MB5374.namprd12.prod.outlook.com (2603:10b6:5:39a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 28 Jan
 2022 20:08:55 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::80) by MWHPR19CA0071.outlook.office365.com
 (2603:10b6:300:94::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:54 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:52 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 04/10] drm/amdkfd: add SPM support for SVM
Date: Fri, 28 Jan 2022 14:08:19 -0600
Message-ID: <20220128200825.8623-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f838c2b-9257-4ef3-ff35-08d9e29a0295
X-MS-TrafficTypeDiagnostic: DM4PR12MB5374:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5374557520F99653E15DE823FD229@DM4PR12MB5374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+rEp/I1mIBD9imRBf5q54sr/tD37GcuH8hFQx2fhJN35FMbCUbHADhZzfIjAWO/O5gqwJXZZZu58qJutQb0AX0n6bKLMfX/1TdeoMn8H4+8tB4mP3H0Pfu62psmUbofWREWZII7Q1m7brxx3h8m6s3KchPItYFxsJ2dK1dPqzKNh5xkn1X31K1opxV9diVBwIyuRHYetD3AQm9ob6f8qD9vzYybCga5Ii019Di6fOYFp/0t45m6+o8XijY0dum2QEqFLPs5avZQi0VAwSpbY4mjTsOE1TEFg+qJzJDnPpjy5HPYyHcSPFd6Z/WJyF9wCrO361wkl0HU2b7r42AoOUK0zoRoO53oXN6KUy5uy0VoAyjGIJghR9ZZf7KPnfG9DEX9zfNaZ2Oh/g7ze3F47amLKYYwCMLeB0JC42mX8VDF4B3PR7grbNSDGzcME/17ZXTYIvCBdIsVRE3p4R+kHoI/2Obu9KsXloPKhNowP0e76IqEimDVweVkAL8ZLCK8dxS71mOEXDH1Mv7zOR9k8GIB4Xzf6VgMdGGwZljRHog0ZkVFasf8P/DSKPsLHztpvS8jGE4QF0SyiuKuX9C3u1avPOPV928tMHmTlKtUWBzxq1qSyHRLk+8J55SVDfRvbWnA7aR85JJ3ToNWUYTT0MYXuACE5V1Y6ZDbV702jLQgjPC1/QQqE8xbrVGZP/IoCDrXkCii7uwjH9+K5CXN3YRslJHs4dyFdTPDQk1g+g4XjnmiuhBmkZcxZaM2du+ao0GwepPiDVM3pYU7XW/3aDjBSj74gr+86ELLf7tMmx0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(186003)(26005)(426003)(1076003)(8936002)(40460700003)(82310400004)(5660300002)(2906002)(110136005)(316002)(336012)(70206006)(7696005)(508600001)(86362001)(54906003)(16526019)(83380400001)(70586007)(36860700001)(7416002)(44832011)(2616005)(81166007)(4326008)(356005)(8676002)(6666004)(47076005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:54.4142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f838c2b-9257-4ef3-ff35-08d9e29a0295
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5374
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ed5385137f48..5e8d944d359e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -933,7 +933,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -948,28 +948,34 @@ int svm_migrate_init(struct amdgpu_device *adev)
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
 
@@ -982,3 +988,4 @@ int svm_migrate_init(struct amdgpu_device *adev)
 
 	return 0;
 }
+
-- 
2.32.0

