Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F74A60A5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924EF10E6BC;
	Tue,  1 Feb 2022 15:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96F010E6A9;
 Tue,  1 Feb 2022 15:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGCedzGovX275HUO5JlmwulXCtDtxetFle6FN1YNkUuviqirX8laCZibgKyiFncEpZGMscP13wJWofUFq3GoltRTR25OcNB8ylc8NPE+VPuBBj+7Dz53Ca6F8deAiWV5IZz68SUlp7aCj3ti+O3w71DZaIjVI7O0K9Bj7U5En943GyHndqXzp5xB2oQXGfA1eptgB7PhOaQ7PVh28ne5OPK3pO+62CRJN/Aj77s7zblHcKWzeTeJo0rBM1k3JO/8CvRRbBuv+cePZ5/I06E/rkLILI9s8Thd0htl5OL01MyN7X6L30vOllA7Kwke62x85UDpJNG3huML4BCHfy8n0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKdah9ociAAjWA8oWytWUkonkykx0MrDTa+hoh93Wfs=;
 b=Ja5y8b8OpjFmbBUgRCxhtP9sKpMGU6MeCbQGi93R5lUKxAZd1iTvd77R+ojZiX8s1faKDhRt1Qvvpbug7R/A9waEne1ZZxiCvCwFoFnvUQUmvht541fH5R3sQa0NLQwLh6jzRqRP5L2KhJhiO2EuAWGqOenGNmSBR2Xhkl0M1qmrsHHJFbBvUBKhfe8SM+RwIgpycqGUAxen3YPe4qn3qgi1/Q9WSLwOLQ+lcZlHXp9/HifXZEc6zCI++trn0mvZiimqIaeaX8s31ZwLQOz/clyLsvPge7nWu4achEd7LCKbZ9pbXQ+PJzTkndAStCV4W4MJs14Dkth/jgylKxXbvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKdah9ociAAjWA8oWytWUkonkykx0MrDTa+hoh93Wfs=;
 b=jvtpZ9Z9t8/Ruk5IksK1InLUGNbmMpXMrBTifmv01iaRyHleXYbmuGkvanNQV152PKq0T0QfUr8wXf9t8MJV1Z6ghl+H766YTotDYahVOqtvk01ux0STmiDfJ9++Jyzml8gukb5DXSgJmvULA4NhX94fhT9ZkbG/Ezmf8WO5bfg=
Received: from BN0PR04CA0032.namprd04.prod.outlook.com (2603:10b6:408:e8::7)
 by CY4PR12MB1173.namprd12.prod.outlook.com (2603:10b6:903:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 1 Feb
 2022 15:49:17 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::e) by BN0PR04CA0032.outlook.office365.com
 (2603:10b6:408:e8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11 via Frontend
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
 2022 09:49:15 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 05/10] drm/amdkfd: coherent type as sys mem on migration to
 ram
Date: Tue, 1 Feb 2022 09:48:56 -0600
Message-ID: <20220201154901.7921-6-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a3f5b76-3736-4d2f-e5f7-08d9e59a6723
X-MS-TrafficTypeDiagnostic: CY4PR12MB1173:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1173896496AECCA89BA35E3FFD269@CY4PR12MB1173.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WYOdKsIBE2rsmnZoemwhr4trvhjFMbgPvvwllFIx4/ZDIaxundRejzDXP9KxTb37I/UCVKMzU0Vlyt/dvC79CDLbqP2FQVJfmy6Z7GLTtjJ0I0bQgssU9+IlW263IwHl+kCobVsR3sPCgaS/AfOS6eieqqWFayAwltq/XMgwALKcGwF38kHhtVQFMMYm7G5mYczxGeF3uwxs1RJRakHrR4Lf2T+ZeFMacfom3UtBvGEj3nMJ7LaI2MZdvZz4zDSHxHS/FGPt3YTtHHAm5qqT5+0nfOyXeDCLNPAxkKjuKRjaQ/41El1bkGV3iFx6dCT/FlPFXaW+V5ElrAu6y1kJZfC1z5aLKNgSVVLqwZrFCRX4fXBzGEGdpOzePdF0KcW6IO962bYQSTMe/fLKsd9vGOsdstmryZ8idA0cYcgMq7YcN6p50bN3LNtktSbONE8oJ+cYu7j1ZcSO+UkbbgrFBGdLSdh8iC2tMRXaXRk3tERFWeoaEyagU+4fEj2UeiqnI+vYcmKB7gaihrasgUfmnb0ZgrdVtN9pQeNsmXvOiCS13uvwS7WGwvmTHj4Bkn9wYiX2nYy1Y73rQ75wpjPMRCFwnNVvAb3C2Dy3K8ZUhCLds6N0pZAwwlQYq/8s917f7mn1Bf2lRJo/zPNtz2aKsKEKBeBSy35bMm1h2NfvxSsyx5SFFw8LU8DBymycUOQzpB2x+tHJ65lTpeRAa/9Dkg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(16526019)(186003)(1076003)(336012)(2616005)(36860700001)(426003)(83380400001)(47076005)(81166007)(356005)(82310400004)(86362001)(7416002)(4326008)(508600001)(5660300002)(40460700003)(36756003)(44832011)(54906003)(110136005)(8676002)(70586007)(8936002)(316002)(7696005)(70206006)(2906002)(6666004)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:16.6984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3f5b76-3736-4d2f-e5f7-08d9e59a6723
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
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
index 5e8d944d359e..846ba55723fb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -659,9 +659,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
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

