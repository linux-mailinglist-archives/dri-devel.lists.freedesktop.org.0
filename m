Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AC42AA7C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 19:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26786E5A2;
	Tue, 12 Oct 2021 17:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8CD6E54C;
 Tue, 12 Oct 2021 17:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlkuV9KWxg9mboj/JoY3RF1CdXpKq6WXLr9fK8b+yOjUsVtA8nlKpFD3xbDG8dC/iMMD8McXqSjpeGt5aI6XOhOZAHAtBsMxHKXs05ADGgjvpEg4zkn20CYGqPxhmRYhoaEQ8VjxKK+VPjzzQG7Alf8t3I3a+EisgzuM+Yf1n6j2H1iMAODpyHzXPowc2AVMAOcSjRXKJhcYvHgKQ9Jj2F9lVrI7ejIcC36WPjGaizZSJX1Ii2FUUS5KojP1bSQOQW8FROpaOk8SB3kZRswZGJvGWXHYS6viznJM7L59aC6i+fzMdNHFVs2inIhTSBnVAJYgpSpKASTqkYWIxovjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QonVs1R9b3x7Zh59B2aYhKR/KBbOi/+fBz9YOjTr6tQ=;
 b=WCvneb3JYRvKyy+DPRbz/6llWiwGmGJz66Ho4KyMPkpXE1ljdin0AWf7K235Smm2sZ/PFKraPuv8/HaR2J1QrFh/wib0yGVPWm+NaoHT+86MNUEA6OQACcxoi20IlirkxCPjmR+54hrGoW8weYPR5+ww5CpdMBv/ORuyNwuKuCBnEwTaO4guRWSyT7hId2nI+OuQNHfbTUtt0y0BpVOUXXjK1VYzYDlXxjbxRBRVCXmElQxYdPvgxQccr5vEYZZwd07wFBlvBlbNvfHoBjeM/RQ8ojB6HNmhK5HHs9EyD38V6IswPWEqB8vniNDcKLeFVGQo328AbUP9p/Dw0vH8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QonVs1R9b3x7Zh59B2aYhKR/KBbOi/+fBz9YOjTr6tQ=;
 b=KOdecjNpcYHO4eqiec4yQzxRzNE+rKsDZPywHVSUz9l6M1WnUjSrQS/QVEyQuP5DYmvWg7/mjj0iGTLmZVEhumBkxMCy7Kh1SFkuzCGGk7LMsfijdkzMWezzS+V7Jqf8b9vXnOVaOUiBek1TN+pM/twJSsa2c/055N35FWX7k1Y=
Received: from MW4PR04CA0286.namprd04.prod.outlook.com (2603:10b6:303:89::21)
 by CH2PR12MB4969.namprd12.prod.outlook.com (2603:10b6:610:68::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 17:13:05 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::f7) by MW4PR04CA0286.outlook.office365.com
 (2603:10b6:303:89::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 17:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 17:13:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 12:13:02 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <hch@lst.de>, <jgg@nvidia.com>, <jglisse@redhat.com>, <apopple@nvidia.com>
Subject: [PATCH v1 06/12] drm/amdkfd: add SPM support for SVM
Date: Tue, 12 Oct 2021 12:12:41 -0500
Message-ID: <20211012171247.2861-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211012171247.2861-1-alex.sierra@amd.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd2665f-0967-4574-7f31-08d98da38e27
X-MS-TrafficTypeDiagnostic: CH2PR12MB4969:
X-Microsoft-Antispam-PRVS: <CH2PR12MB496925F6734D9D28156FF579FDB69@CH2PR12MB4969.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjkojzLIhrgVCd9gq/1w2gnD0blX2fjS0XErLiNr7xdv7GYnni9l/yy3csi5M6IbTRhzOcCqPll4nfB6JJeGHPbk3H0tqjwv9RE9eNv1Z2E6ttcwmL/GbVUjDB41TZtmGwGIdw5xs1F6C46ujtU6gLipstQ+2Sqi+Xm8M11Z92xGWRaLeq6fNIjYpBckwJ6bRG3gWNqMufaRONhdYMYQHM5jh90xIlY8hnKvOLQttj34LQm/08VGTc9vvxQhRBmWq8KAMjN/hOhwh0i9o7Et+jQ/Y1ah5qN1iYXd2+eKuJUpPnKiCdDHhlRrPtwYGCtip1S62tOkV0somj3n+mF4KSHZYgm7koUiSNXSF8yEHlid6oFZp/doc6538r5/xJ5Uvr1cBc4cX1ekvydKz2ZYVt5c3bI1/Lch90/Px+E2v9KgQ5EQKwFmKw1cotKLPQo4EuSK3trvF6H9SARjO8pxud9Qc8uNQDkL/cUxAguIMWPfsh0NSrbYt+C2iSOEPNdHUHprn6DKplgebW25PqO3lQXqi6ITZGHD1wYtQQpzoqkYTqB3dCR5yzrOWQrodIu1pbYaqiOeqCN2iR4akp5aVBtKr3JVYH2vijvTh1yOGo7WCZMeiYOSA1oSwjNPH9OfgBSkdNxpgNNgKVpVCYceVCViXjUVjp9akNny5LGMp1sd6FPzudfNBwZVTPNhqe7xN16o6UR6Oc19ggbItm8MxvU+Hbrah0+jbBQYPYUFs0c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(316002)(5660300002)(16526019)(36756003)(336012)(7416002)(6666004)(8676002)(82310400003)(54906003)(86362001)(186003)(8936002)(356005)(81166007)(426003)(26005)(7696005)(70586007)(44832011)(4326008)(110136005)(508600001)(1076003)(70206006)(2906002)(2616005)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 17:13:05.1895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd2665f-0967-4574-7f31-08d98da38e27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4969
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
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 32 +++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ffad39ffa8c6..9efc97d55077 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -866,7 +866,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
 {
 	struct kfd_dev *kfddev = adev->kfd.dev;
 	struct dev_pagemap *pgmap;
-	struct resource *res;
+	struct resource *res = NULL;
 	unsigned long size;
 	void *r;
 
@@ -881,22 +881,29 @@ int svm_migrate_init(struct amdgpu_device *adev)
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
+	pgmap->flags = 0;
 	r = devm_memremap_pages(adev->dev, pgmap);
 	if (IS_ERR(r)) {
 		pr_err("failed to register HMM device memory\n");
-		devm_release_mem_region(adev->dev, res->start,
-					res->end - res->start + 1);
+		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+			devm_release_mem_region(adev->dev, res->start,
+						res->end - res->start + 1);
 		return PTR_ERR(r);
 	}
 
@@ -915,6 +922,7 @@ void svm_migrate_fini(struct amdgpu_device *adev)
 	struct dev_pagemap *pgmap = &adev->kfd.dev->pgmap;
 
 	devm_memunmap_pages(adev->dev, pgmap);
-	devm_release_mem_region(adev->dev, pgmap->range.start,
-				pgmap->range.end - pgmap->range.start + 1);
+	if (pgmap->type == MEMORY_DEVICE_PRIVATE)
+		devm_release_mem_region(adev->dev, pgmap->range.start,
+					pgmap->range.end - pgmap->range.start + 1);
 }
-- 
2.32.0

