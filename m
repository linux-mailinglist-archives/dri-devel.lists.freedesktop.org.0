Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8664A609F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FC110E696;
	Tue,  1 Feb 2022 15:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2230E10E69F;
 Tue,  1 Feb 2022 15:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brfz9RuV4jw9UwqmPA9T2Vp8FgDTDpR10uo6OMQUFoGyDO1aGjYRhGe7JJ2ErCkE+RR1sPpmre9EyYBNy422zCEIeosTvU8tEQCfZXprEGe0ZG+C8RVSghOGFyy+C83xus2AJSYt52+o+j/xnkNRuAz6jYrGMEUHO6Hdjv57CbA3YOlWhMFLK5KqkqVx91KWPkuYbiTCuLuboEslwrpx4HooYAC+lfq9gSrqu7imhFYKV0QcDO8Os4Jrv1Tyu6NYVpsBOUPLmnJjxx5T9Zj5TNgZvE0aCdHcABfH+TQlyJbQdn8hyXQDLpXMD614odHFathawin8YFAx9EA0ChfsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6Dg+JXQ9T7IJxjdebVIQf/JKMmpP4b0PXF0E4ioiTI=;
 b=OIAC0IJCfyXQo64Izqbru2GD1U28etDj3GbuZ1FpIPaofZRxtley5D20QnqQLihLR+UujBZzRtASgOyMRtWUgnOICilPZZpgUjtuy7QCE8aJZSgnFEzzhNoS4V7XT87q+7uZXSLrdAwIC67tjGV8/zZdROiveVDQ0SsV6O4cByZKnrXw+I7vAh48qjHjje2CoqC7NF7slqIPR0uV2HGssJAP9xIJ42c9vwJ4Y18T3HqsysTLewJAKmndwQUvV+h0azWVS5mGvAnXTsdPW2lpKnyPy30Qn+OTVe7bWkQuFL8c0Q/R1ZzlCJ04xKRklSrpRO3z9pB2Xfx2sq3k8vGgzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6Dg+JXQ9T7IJxjdebVIQf/JKMmpP4b0PXF0E4ioiTI=;
 b=GRRvDYwF5CUe5hvSR6HaZ/Dm0pUkHtRdidQuo8LdQX4eiP89aa2zNyQUBFgWoTDJpWI2pnSDC1lmgXG3TLO5s2p2HwKgp67KzajyLXopMUK8fZkOUktikYq3jAo5OlfklGHpjXMRNpGpnRI2tKe0R3OIjYC+4n/VZopH+M77JYs=
Received: from BN0PR04CA0059.namprd04.prod.outlook.com (2603:10b6:408:e8::34)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 15:49:16 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::fd) by BN0PR04CA0059.outlook.office365.com
 (2603:10b6:408:e8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:16 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:14 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 04/10] drm/amdkfd: add SPM support for SVM
Date: Tue, 1 Feb 2022 09:48:55 -0600
Message-ID: <20220201154901.7921-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d9593a7-667d-4fd4-d781-08d9e59a66d2
X-MS-TrafficTypeDiagnostic: BY5PR12MB4035:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB40353F3FF2D5AFCEE1175B25FD269@BY5PR12MB4035.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUDlsgBXXHokhWfBqsNyr8A1TcI3BzZMOtWQK8I/y35cqGp/+FX7+xkyPS37xaMN0WXi2GEuYtICeXCbEgoDtwrq6jteqKCDMPPRL7/RhcSf8BU7qiGno14mMhG0RDgTTR+gOoETDSXJNr3QW1CEtD8ZBcq8CObM7frManV+2AeBZQNhlIJUe+1FdvOq9BL4usfGvbfRX5CIc1l6/V6y1jJOqiTeM7wj9kDGzzPbugAEx0xxVXM8AOFRpW2P10SLivMBdO01rMhvjB0Di/y3KpdFyuGEgbS33lfTdMlqnOAPP63DFv1SWv2u8PUNJJRiJZ9jh1tb4mol1frz3CIY3aXKx3ItPNNHReBxDrS7Dx8WpvIYitgk1p6XJSxQtbq113tZzOMR94Z2XZBDcx9J4wm5CprH7VL3yOV2G5zm3+oyWrBqi/isIhmT0lDnU86kvvlo3Ef+Xwpl4a2+Z69c2DmYOpg1aoWz8NmQg2GeNjbsDVbWlA2U1wMoOCyszqlcncpPE0HBgCX/YZUJg9dVDo3+ENLfqnFfhorO8Nw1I8/mzVlr1CH9Clz89k/OeQC+4XyOxPzNvXjRehssl0tD0A4/J8RuJ8kVBA7XcG3dOozdU8FJP3XpWVZnlZX+6J+6M0ndT2lyYMhKIhDS0Ng2wCNY2b1TyxtKkFWI9gxo4kyKxN1CRtMtUlu8Q81mZbGsnrciFG9iM1T4upkv5Aw3lg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(110136005)(7416002)(54906003)(5660300002)(36860700001)(8676002)(8936002)(47076005)(356005)(82310400004)(81166007)(6666004)(40460700003)(4326008)(426003)(83380400001)(336012)(2906002)(86362001)(186003)(36756003)(16526019)(7696005)(26005)(1076003)(508600001)(316002)(44832011)(70586007)(2616005)(70206006)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:16.1828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9593a7-667d-4fd4-d781-08d9e59a66d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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

