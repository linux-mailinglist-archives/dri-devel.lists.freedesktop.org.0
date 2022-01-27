Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BBC49D900
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8492910EE4E;
	Thu, 27 Jan 2022 03:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA8A10EE0B;
 Thu, 27 Jan 2022 03:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9s6CrHD65iWB5JWzWJUHSFj453dCm0kbToXrVl4TeRy9U/5u3sVr0C0D4u4CdFyx8RCdh8ijjeugn3Uq+3B3Uf+bQO/KKfhFd8zg6jLd1xFqju2o9X3Da2th1FMIMW6R/TT060UTxOS0bXeo7XxBADIX6bvEXEGkwzaEgXW7h8NTU5QyGeZCjpUmX0rD2+UYdqXEiFGd5XPvQSnhPPmn9lijcD13OUC/By0riuCeBBhHtxiLUGChagwMGog8CAX+RO20HpXwXMAnFOP+dxoOlB9YE0pp4biQphC8mf9M/xBx82PgifGCv1fge0KUZplKI+e8cddhXg0Ij4Y7twbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=g1JIhYHM7Ut8j5BAdTw8gqhlvbqXwYa997KX9dl3ZOzKvDjVpIdOR7Gpwp5Bpjv7+fsMZEbpavWRdv6FkKwoB5M07z7kGvwsCEbg4+QFmlmlenH5CvAsl0RLxpY2uXa9818J8p/jjdzbn2b7oKz8Ftm32J+51MKJPFXvjqq1ihoz9m0DbKt5Y/twP2eIUOVj/KEeUBdiGaJEgszAFl7kEormzCf4dTgiuJ1UpIlX48PXKRbVU/kMX1f+XLrBG+QMIuAKluaYMhGDpqFIyfvQcrROCwAgUrCgcjPVkI3wO4/Eu836acHnyrhDrKr6AqWNnTJ+L++lZH90gpYjhTbkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XOWr7fnVYEba5NhGZxd4trx6OZFuB1g3xD2zb3WjmU=;
 b=Bqi/85bv5ai7K9yHG3gFtXhVK4cipQ4VqBt3gQDgYkM3vZu6ratTu1He+WBbNEQCASQswufx9U8fstD1isdY9tJBEHiRlpU35c84MyGmd0ISaJJzuNTQf9TCeOUWOiGP3VNTXwYlxf9PaXJ6d/f1lNVZUEknU9CetnrnencWJL4=
Received: from BN0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:e7::9)
 by BY5PR12MB5015.namprd12.prod.outlook.com (2603:10b6:a03:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 03:10:06 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::e0) by BN0PR03CA0034.outlook.office365.com
 (2603:10b6:408:e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:06 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:02 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 05/10] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Wed, 26 Jan 2022 21:09:44 -0600
Message-ID: <20220127030949.19396-6-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2acd24f-aee5-4e50-67de-08d9e14284df
X-MS-TrafficTypeDiagnostic: BY5PR12MB5015:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5015B3DBD6D0CFC18A3FE2BAFD219@BY5PR12MB5015.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2RWzh+1HiZBOGs2vV/HAKTqxNUFGuUUBXDLYqhkBRNsuJrkMAd6t02ID5yuJidDWdIVG9aA1JT2AkxO83GePsxmFD7d3ZoJOuEvyc/kfsXgNTc2pq7HCGGn5LB/TOCL9FbIT9+viou+k1maIeXAxNhL6hqscX2E2ea6VFkVpAPEaVcyHXMbmB9Rw0MYZ9juCZTp1SpfXVu3+rRIxwIf6j1hux5Y1kf8fJ/lSrOYHKrKhuFRLB6d2VKMwslx+xY+cOfFhjZyailebC4tWfCl3UTv3ivdtymkmcAIguXXfSByrEcFle19kg1ShKxA5VOF3gkd4v4o1QDxdwEV8ECRs0cfy9K99x4AtIhOCRt1lVxYvIp4zzAQMFiUWSOmBM+cil9h/HU/mbCP+Hz+blrqfn/RqCbkKE90H9KHtBn6hKpeCC7HB1Ayi2aDfYsz+4JoPCYZ+84JpxKJloIRiIttQZ9Vq7p/D5zGcgqwV+kgJmcmnmwYLplqJA1vN5yTAiT2ewJys1WHR+DJGwnxQ4InYk7E3FIYqc/B5vEVqWdZ2dZ9C0vhSUMziEFn+K9MFRZ/O1uI+PchmlRarvgaSuBSaNj6Pl8e0lQA98UFangc6KdO3e0GGQAdtoVudqdC/JaFjMs19ow7bsvRArgv4rmS5vIst2huyIEw2hfI56JrMO5TubwjwiM4DWzqeuHS8FHTrJ2ZsEdz9B9q3xHYlYAZET6j+R+EhLEtts8EXWbIKficTShf9MWGxk6jsMgvFK6swab52ZvLQZPJhRbwUGE+1V8cMqUYSbwA8tYiaf46YAk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700004)(46966006)(8676002)(81166007)(44832011)(5660300002)(40460700003)(8936002)(54906003)(110136005)(4326008)(426003)(86362001)(70586007)(1076003)(316002)(82310400004)(336012)(2906002)(2616005)(47076005)(508600001)(6666004)(26005)(186003)(7696005)(83380400001)(36756003)(16526019)(7416002)(356005)(36860700001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:06.2335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2acd24f-aee5-4e50-67de-08d9e14284df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5015
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

Coherent device type memory on VRAM to RAM migration, has similar access
as System RAM from the CPU. This flag sets the source from the sender.
Which in Coherent type case, should be set as
MIGRATE_VMA_SELECT_DEVICE_COHERENT.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9e36fe8aea0f..3e405f078ade 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -661,9 +661,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_COHERENT;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

