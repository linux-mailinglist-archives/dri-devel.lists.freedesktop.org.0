Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71789539475
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C05D10F351;
	Tue, 31 May 2022 15:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C2110F45D;
 Tue, 31 May 2022 15:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQdhuIcOoAM6qNRcPXbrcsvQzQCoicAoJA7xmBp+rGiaNRANT+50PXJ2IQ8NFH3KZpjla2M6ix1vLPt4m1v+3r3+LPXGQl86p1RWFr/fOf2a9dxtShtYIQrgrmmlyz4M5bJjYITnIJWDSpRSAMYNc/JbQxO1cI3gO3kOlOumkVrC7zzMH5jcrNlOrWIFyqELZOrjOyJ6I0viMTjvh4DoGEJuw4jUOikPpCAO66OLU10dLw9MVrdHygfe4eNotulFe19MiUNFRUSl3BIVindzpLSV6MclcVgzQzqnc6RIq8ri7gJzk1hbECllQ3Uk/+t5NtUNtXDeOghtGdh3n+uNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=MPLMfL1Xd9J12XbOiLWBoqbjsWIyl+7PVKgxTelAlDQ05fKqLoIfPJBgMM3nJZn6Dyfe0mBzHkTViCDYtOwhSwSszglJiz8mP6fqvAsMgiPtCZh0JFkBDfu0z/iPl+jkRCZwCkkW/ibS8T7pt2Vx1qI5Ulodd197MvUi0pJhAcwgUB5rlbIcW6bk5PYlOi1t0z8crfMU2POkCkb30wfV2Gd981cqs8WHh9MaH+Rd0othWeaLpGZWDCw31KiYZaOFQLa48j8N2XBoglNuM0K/CiwoMQa1y7RN1d3NI1PEWnA8tE3JJ94YFLdO2r+e4vgxT8cpbMA9Dx+pL/HjueYAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=RzFrllmuEbUpr8KTtFL9+8l9grUYSMB08evt4Z4wa3e+S3x6Y3ULQTNLUX5SLCHhoB4GUCTnvuzPkqzao3FKcw4SDmXf8KPCewV1hEmq6LSVfvJv+motP9RuWIdjIjpTamZeJQXk8u5yTHtgFZpgxtOaVW7PWm5shg2N40Sfpd0=
Received: from BN6PR16CA0030.namprd16.prod.outlook.com (2603:10b6:405:14::16)
 by BYAPR12MB2872.namprd12.prod.outlook.com (2603:10b6:a03:12e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 15:56:45 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::c) by BN6PR16CA0030.outlook.office365.com
 (2603:10b6:405:14::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18 via Frontend
 Transport; Tue, 31 May 2022 15:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:44 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:42 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 04/13] mm: remove the vma check in migrate_vma_setup()
Date: Tue, 31 May 2022 10:56:20 -0500
Message-ID: <20220531155629.20057-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee4dc4e2-bd44-4192-3c80-08da431e2941
X-MS-TrafficTypeDiagnostic: BYAPR12MB2872:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2872D486982B311D213F8739FDDC9@BYAPR12MB2872.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixbuOcX4ZXPUzFEeGNs/p21jEykGmffe/YKe32budcTch4qCb00pOE1g1Q5+666uD3wL7Vv+rcJAtiCoDrdzRxXpiLOYvRwgW5Bs/VmmXd9n4xyFVqRWkpbKb/AeE/raI4kOY4ohhpZ2kX17WwjyjRTZxXAryqZDP2Y6+7dtVs9W2LiOb9yyViQDzk5svcZJsA6Ite+ILV/XsfaLbSV4n4j9BMUyrhvsCo0uFIesXstpHl4jbvFeg1kyQ0sr0CDMBeyrzpMKVlfO9tt4FmNtkE/EzJutNJLKMuItNWFh3oZKRXt2yjQU8X+bjEBT7gDKWbdYr6jM+y2NaKuS1cMpYM0Ywu1+wBULUDtlZYT38nrX150PdedpCl/lVD5cXVJCvvhbgw/wUQNdTz7xJI9xCvuG6YA/stLzUMWzRWYqsatLLOpI/bgNVJ1BBHjPpMy7F4/f/dPIxShDuc0iGswZEv1nBQ/GMUfuBb+GqOuVLIC8cGBxHPVZEEv89LissTxOOWsoOfkXewo/PNk1PrkZXypLFJf0E94iFKbQ8IDxm9q1Bf/GIGw+TwGe/zdCBxDKdQXFrJEJRYYYTU5mCl8UG8r5Z7JQ5fEHE2Eg3760vKOa6mmrfh/PqETzhDpN5VTXQxLi7YHu0/IUSgBkJNore+iZGr1oIj+yopg7+QbQjzY/HJaoZd1fpdte3E7sFQtt9h/9ryj/bC+xc28xATL9cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7416002)(5660300002)(44832011)(8936002)(508600001)(7696005)(86362001)(40460700003)(26005)(6666004)(2906002)(81166007)(36860700001)(356005)(2616005)(82310400005)(47076005)(426003)(336012)(16526019)(186003)(1076003)(83380400001)(4326008)(8676002)(6916009)(54906003)(36756003)(316002)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:44.5942 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4dc4e2-bd44-4192-3c80-08da431e2941
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2872
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
index 18bc6483f63a..cf9668376c5a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -486,24 +486,24 @@ int migrate_vma_setup(struct migrate_vma *args)
 
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
@@ -685,7 +685,7 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			continue;
 		}
 
-		if (!page) {
+		if (!page && migrate->vma) {
 			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
 				continue;
 			if (!notified) {
-- 
2.32.0

