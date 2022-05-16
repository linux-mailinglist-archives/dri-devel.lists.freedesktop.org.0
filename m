Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E048E5294E3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51D10E9EF;
	Mon, 16 May 2022 23:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC2D10E26A;
 Mon, 16 May 2022 23:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjZE2e9bcegl7298mZGuI+zJ8Aq7us6Td7xR3EBKsihJt4EOT8gD4Zn7NJPMLAKYsCSWtXUs/t7KWeEA+3BQ4/tKNR780P+vBI84hfqjptQKN+X0+aI4IEOHGy+5vSY51XYXIwNA3ATeKzq15dwblkQNaFvDa1IcuuL4PKsuNGNVXJwAxQQlOuzoQDmmqiXn0ckXoUEsh5/pusnE/jY+lN7mnbSrjxQxQXgNWPqMrTxu/zHgwjttKyA5g14+ale9+Tk459g8Bpf5c/26k2W2wQ24sOVwepOXUuFrK9GRNBWb2Xv4BqoCZK9Fb5Ps1wqVnuvJUqhLVJhCrGm3zTBWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=mGXoYneU/D5QPDNhf4VL+8cCX0vghYIbGZ0wqj4p+vY/JzRa5TWUpVjl0imxtgq2sWhh+J+TlT7LNwBSP1ljG5X6oOkFXLpemcVkE6mPLfh63l9M2nERLg43ISHGwjBepDD5U64wdI0TEkXt6IapFAX4aX27ZBAsQLwgAsxeBZp08SVVfUDD/JOmgJULwipcgo01biBsE0/ONEgKGByoE9JEB/4E48YeTn2+yCo3Cp4j+eMIrnxX+hXiGOcZUE2xR+lUqSmrwK37SNJJkbqh1E7mOXYqexEyrg+sJodW3GAlS0yySthSXYf+T8M3DS8mrfc8IDRvQ1hvKLjVn30/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=QGof7MP+VX0skbHJTRpZFILF7FjXa7rte6Lil4eBMoIBrwursKSq5potuvOvdBPdJjBrYUbDNnqyK21XzSwZKR2VaQq6j579coVaSfu3JA8h6WNm1FQ4QqrSPNW+pE01/4M/1Q8RCDD08QeN49CaOkDxhUbs1S8143pSX+8Q13M=
Received: from BN9PR03CA0387.namprd03.prod.outlook.com (2603:10b6:408:f7::32)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 23:14:59 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::8c) by BN9PR03CA0387.outlook.office365.com
 (2603:10b6:408:f7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Mon, 16 May 2022 23:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:14:58 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:14:57 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 03/13] mm: remove the vma check in migrate_vma_setup()
Date: Mon, 16 May 2022 18:14:22 -0500
Message-ID: <20220516231432.20200-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 561bb88d-291a-47f8-86e0-08da3791e58d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4204:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB42045A3CA2A81DE0549EDFF9FDCF9@DM6PR12MB4204.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +khPt/n1FmZX8XqIAkfYFWqJQkQ0Yedk+XVR7mKqVJRuVgaq/Jl5kq/9drzq7KQxAOiwjavyAugYIjGdnOt5tFJKASN0JdvZIHTgACWqCnxVwC6eFwYbsobPF6skuba17Gh/6IeDjYydgbac9t+R+tv4AbJpL1+x207BwIg5+4VSPgbWSmW20FOSCKU2l/afo4oM5np/i6mT8WgYB8e0LTQnmEoPh43M3k9r5z+QlkTIvnu1c8ggASplgxSB1wpOurA0C18YVJl+nnBO9B3eyeDks4wXZlPcts9FPS6HRjz/HvFuAhJFOuyz3GhyIfTWGUbfRC4E+GaomTKvuuY5UflkRbiTrUR2/FASmmZ3eh5GcT3UZ8MCV1geq+xSkhrCClnUpmEX3nB39YNHU8YobpW8gsqTIWUlI7jQj9TRaP5TGxmDqVGsha+YuQcsOxYgnvR6WP60JJRs5mm6Dp29ETqGek7yhog2AlITMoLyQ953Wsfob+pErVI77o8q0tWsd8Pj8sEsEe1qMKVTcs4MHA632cCQ/m0gDXQOZEJTm6TS5pQqYHbfURTabR337YIwJ8u3DWU6UVeIHlrDig4EYGwV6jrHYidYWHmc6bJwofWIFTAVAPGcu1HjsKRw7mKjr/WZotC6a9Jsh6mHO97kowizyfOx7SrBwblIyzHmDmraV/0KCMl76QEdr/8IQBCoIRlQyzuE8RpspN9odVHP+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(8676002)(4326008)(70206006)(7696005)(6666004)(2616005)(36860700001)(86362001)(47076005)(1076003)(426003)(83380400001)(5660300002)(7416002)(8936002)(40460700003)(16526019)(186003)(36756003)(82310400005)(81166007)(26005)(336012)(44832011)(2906002)(508600001)(6916009)(54906003)(356005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:14:58.6764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561bb88d-291a-47f8-86e0-08da3791e58d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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

From: Alistair Popple <apopple@nvidia.com>

migrate_vma_setup() checks that a valid vma is passed so that the page
tables can be walked to find the pfns associated with a given address
range. However in some cases the pfns are already known, such as when
migrating device coherent pages during pin_user_pages() meaning a valid
vma isn't required.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate_device.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a0b997935cf9..b399c498f0aa 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -467,24 +467,24 @@ int migrate_vma_setup(struct migrate_vma *args)
 
 	args->start &= PAGE_MASK;
 	args->end &= PAGE_MASK;
-	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
-	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
-		return -EINVAL;
-	if (nr_pages <= 0)
-		return -EINVAL;
-	if (args->start < args->vma->vm_start ||
-	    args->start >= args->vma->vm_end)
-		return -EINVAL;
-	if (args->end <= args->vma->vm_start || args->end > args->vma->vm_end)
-		return -EINVAL;
 	if (!args->src || !args->dst)
 		return -EINVAL;
-
-	memset(args->src, 0, sizeof(*args->src) * nr_pages);
-	args->cpages = 0;
-	args->npages = 0;
-
-	migrate_vma_collect(args);
+	if (args->vma) {
+		if (is_vm_hugetlb_page(args->vma) ||
+		    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
+			return -EINVAL;
+		if (args->start < args->vma->vm_start ||
+		    args->start >= args->vma->vm_end)
+			return -EINVAL;
+		if (args->end <= args->vma->vm_start ||
+		    args->end > args->vma->vm_end)
+			return -EINVAL;
+		memset(args->src, 0, sizeof(*args->src) * nr_pages);
+		args->cpages = 0;
+		args->npages = 0;
+
+		migrate_vma_collect(args);
+	}
 
 	if (args->cpages)
 		migrate_vma_unmap(args);
@@ -666,7 +666,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!page) {
+		if (!page && migrate->vma) {
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
-- 
2.32.0

