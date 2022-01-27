Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18849D8FD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9391F10EE0D;
	Thu, 27 Jan 2022 03:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BDB10EE02;
 Thu, 27 Jan 2022 03:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXN/du3ozvdYHrYqJXv5yWq93Kbd8iTHpyxpxlLfYSr6jtEyhbJ+qzjW3RiRFuH15eFpUyX0Klt1xOLT1ZhOBHKBQ+5Yruyed4fZh0973SdvcuNTdLOAHMhR/HhPrgofERnjkjBFqb0urYn2kjWJTjAIe3D4JDSEMBkTxcC7YnxkdFC/BQfdO+vLO8a5JOsD4RbbH8ay57IsXAjdIKs7LF2xWXXeMEtQqelLbZNa5du23dWHW+1pO4mITaeKy+lWtDC8S44gC0zUppM5KW6bPwCHyPAhgq1IugFxgaIm2eQ7u45s1ZbheO18myitdZmOv+OxtVSjFmd5T5uVa5h82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=dud5Kb6XbxG42rdpzm4ssKlpcE/YRw01lnBjSZZ3ZhN8LpTUTllPeKS7zuVjH2LJPdG6AXUjUZMeP4gfvqekX8hXVxWyvFIDTrw6bgwZ8McPvPSAWUQvcjeNdorrIaVhSlIAdEYxOmiU0kCnn/jYyojI/cKt/jBc7oFcOb5dwqTqZq/WAfzWRYSfj1LUHjxhes6paGrXk7/8Ne+iZNwWK/lSimkEh+vofPzDW9d3/AAygS3h8WVeZ9qAeIY9xJHRMdnNXynu4XT6lXA7Tmv7aOiPv7cxHFYNNhS6ymJTJ8iYJyylpGK6loGF1vt7AI9UcMBLKGuvSwu3p2h7kdnonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=oyg2VguT4fgT5Bq1A1bQJn+cQF/7AtS2U2zCNM3zUiQQHXgMc1TJnWiiV/t8yI47dpc9ZqZNF/iZw4DXG3TxTEiJ1iK3zLLZlb8uO6yHN0B6eM0jk+r7fLbfdY/2gnW22YJgIqchedn+74/xQvn0UPtiHQJaoy20RCna4NgqBCc=
Received: from CO2PR05CA0105.namprd05.prod.outlook.com (2603:10b6:104:1::31)
 by BY5PR12MB3873.namprd12.prod.outlook.com (2603:10b6:a03:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 03:10:06 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::94) by CO2PR05CA0105.outlook.office365.com
 (2603:10b6:104:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.5 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:01 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 04/10] drm/amdkfd: add SPM support for SVM
Date: Wed, 26 Jan 2022 21:09:43 -0600
Message-ID: <20220127030949.19396-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5afa845-0344-40c8-9978-08d9e14284db
X-MS-TrafficTypeDiagnostic: BY5PR12MB3873:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3873CBAB1E789348BDA86CF8FD219@BY5PR12MB3873.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8xCXVbvMyHTlYOrFyjXrIUl6FyjdvtPugco3FaiMrhR886tqt1ep8rC06DQCjSPE8bsAYD3UNCxx6mAvDBeWatzDXnN0ZBQtg3gpcWL+HU7D85Uii9hz3OoMqd5vbgIDu2RtzNOJJn15RjcLAsADhL8LJw9QLwV99093a3oGKCKyc/iMTeKBDRscPHhP7U7edXGFl1n18BlC3sz/Fa5DOavu9IgigKO9Ty4hX6u3HgHO5BVncmjQNmvjeTqY6yDVxMgZ0h7h44ei2nEXA8WnOz2TNH3Twm6y1rG2Mkr0MqQLxwnpR92ZZfKX5HmUh2l2v+kRTauDUa7p5GT9GB72EG3LuUicyUdoTV6M35L/7ScxXHtmt2JLuZ03ADyXG6HMG47r/0nX7cLs8QXCapVPlLcXfituFvNDM2Q6Jopp3E4d+stJ2ikJuO0biV6ZDAD3TW6BR31jQPln6ThfziIPoEMR9ExAedAZnsJKBWXQ1tefuM6Mn6Dch5x7jo3mhf976A9NAGhuVOhXDYIoTDNQEgL/BqpStji55oxlq7yIg/hasn37u4h1O2hemi1ggsQyw0X/ty+/NQqAO+wAmCHlc957MhlZj4YQD7WxmH4J0mmiPYmwGK+yN8UulXQ4Zy17svKKmm+j5Ky+8woszaF7plFbVpBsxb7C9m+08nmClNcPzxdHRhzhwKzqHv0lE2rnONT8BNcMR0krL/rotG7vD960G26Km8JWse+aJx1MnNzLDBzCatSUCH3reS98QSspI+BLKtdixHUNt2KhITKG2j1RJ0FasB5bgAt5lO5teU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700004)(46966006)(82310400004)(70586007)(36860700001)(8936002)(70206006)(2906002)(16526019)(6666004)(40460700003)(86362001)(36756003)(508600001)(44832011)(336012)(426003)(5660300002)(4326008)(356005)(1076003)(2616005)(81166007)(7416002)(83380400001)(47076005)(54906003)(8676002)(7696005)(316002)(110136005)(26005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:06.0836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5afa845-0344-40c8-9978-08d9e14284db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3873
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

