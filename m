Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64D45122D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4096E6E921;
	Mon, 15 Nov 2021 19:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E2D6E58E;
 Mon, 15 Nov 2021 19:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI4HDbHod6WSGpCJHhUMA2pUQf/ooAMeOPre634urTH0N1+gsVuPRbVV56rBhda2rUXZhhL8gVHOb365LAy0674GUSJWEGm4pfsNJiN3eIIOz+i6QpGPNrGX7SCf5k7Vgm7qpoJM81m195rgrhrrGaC/TDvvXqR9j9aPSVVs/mP2lZfoxYk2w9tMMhHxBWsYIIEGi9Cs+5GLnssNK9F1jie+hkeVxfBUy7kRrRF+5+yQcbE0pvaqfg2xnrdn2mLqfX4ZPC5b4m8mp8L1k3gpUSE5lcTBj5mEceOmrvZl1FrHmuOOKMc5FgRs1UWFtCTjC3rHbtc/noC+FjruUbzVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=kLLTa+D+K0itJb7FVY4Avtv81isNyE72oAFoy1YLac5+yf7yyvAw/p5DKRy5KJ5g8UsNtylck7YXK/lMpttJnPNFeUEbhGfvIwv/P1vfNPcPaacYUjpMVznLHm+cgMVzT2T32ps2ixna7eZaeLj1lO4kuIhSaI8hW0D456YZxhEQe1S8QyGrjQSPPmbtMnXL5UjKnPFDk95bNbLX/NIPGZJqEfWEYfQ9yiH6DZTrv5CDzDoRvHbrclhvtqiSTRpwGlfn7OZIcuCZZHFiAekgCVyna/CHwRga72qOURmdLVHwVNRrv0vXSgn3fpPHhaJCnkveeOs4p3C/4cpUBlKV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAF0C1Az5E7eNTp++D6wdqoKFJy/vdeyTKmR/88xqyo=;
 b=FcaxIHciIP6sPV1sfm2plyd5pTqLpO44lvkA3yIIwJaS0M3pfVdmdsBb+dRSdGYQsrLuxVEpVWLxw20VCUTuJAOPaLvj7rPJN6T4EVzM3dv7dRJFIg6Q1tSrdXzpSGeDCgXEfR2j0vqVAO8tmKvDUgHDd1WtCg+rw74Z/QzZDNk=
Received: from MWHPR04CA0069.namprd04.prod.outlook.com (2603:10b6:300:6c::31)
 by CH0PR12MB5153.namprd12.prod.outlook.com (2603:10b6:610:b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Mon, 15 Nov
 2021 19:30:49 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::ab) by MWHPR04CA0069.outlook.office365.com
 (2603:10b6:300:6c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:48 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:38 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 3/9] drm/amdkfd: add SPM support for SVM
Date: Mon, 15 Nov 2021 13:30:20 -0600
Message-ID: <20211115193026.27568-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4175d0a-f378-4685-f5b6-08d9a86e6dca
X-MS-TrafficTypeDiagnostic: CH0PR12MB5153:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5153E444956813DC556925BEFD989@CH0PR12MB5153.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toviR95ND6I78zqfrcWK0rZ+Mp/xEA/wk1q5IL7SKvAyizibENDtKDwW1yo/53MY5mdxxneLX2s/4PxoXG08B5+xvNnKs5tpiqvjpW22yvIfLBzgL8+EsxHHmUtWB9FR6LN+KlT4bjsaBTOWFVePUbf1X/liJOpW1dqB82HruvRWTzIMunvyCmwhPpQid3+9tvP28e5+0v8iVh5NiM9+GHBxB0qVh4pbE/s1OITv2/jaIch45+/SMT928kpHg9RxAh+KvJfSy7Bd4VrnuFYG6TWcl1UvveDicu8JhO0EEFkuTp2w7VSKKYwR74FxNeTArF8TmWZMSb0Kdjdw6B3xlRb0DJyIxTHHrtHwZwn1aA/Wa+GQaGf6uki79aqI5EfubbUFv9S7DXmfPZ3S8NYQWU6Y6D6WDHmsTdeenVCqR2VE8KWihPi2X3pcYxUgV6hKxaoxTY4IsYJ6fHK/VjxPRt0Fy54Acm/WJDJhOXWZu4fkudAdWdj/wd7vPyEmDSL12DToykHbUwd5lHNveLhmoltX9KfmU0/lgEeqVZ57XMvBl/amqNsReuYdlA6zHR2+InsI8U/qzSPRbMMV1QsHdjD9HBYmhM73A7DkwEN/tdVkLSCyzScY0GBXrSgmf8YhfnRdZpMoXxrSZzMTSjhNDYryGj9VJlkpWd+M4WW00MjHwTgm+xeA1gj9TMfyNOtI7y4CIlD0WPP/3IhMT0gUXNrLofJ8GHMF8aqS+dehgTE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8676002)(83380400001)(426003)(110136005)(336012)(8936002)(508600001)(5660300002)(26005)(81166007)(6666004)(54906003)(356005)(1076003)(316002)(2616005)(2906002)(7416002)(70206006)(36756003)(86362001)(47076005)(7696005)(70586007)(82310400003)(36860700001)(186003)(16526019)(44832011)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:48.9803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4175d0a-f378-4685-f5b6-08d9a86e6dca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5153
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

