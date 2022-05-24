Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11A533176
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EB610F342;
	Tue, 24 May 2022 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8D710EFEB;
 Tue, 24 May 2022 19:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2jrqoXww3avCUAFbAwUyx/cbbFesr0U95A0ivZ1y22o+R7Sfk+l2XSTzkO7ODOEdDc8KfMiWMLmmdNjqLRbqbFB6g4YOI4h735MB3H0Mfq/TTJHG2vfO3nqk2373XQ/uM/Qkz0YEhrJt+A7K5pxTES8AHiuLwELz0Ftgubs1lPzS4PaMxbwbPEIZ4MstZOstAK/4wBu+Hn1U88kdkRGFqfB6lRF8bzruvUkPwcveclSEqj9y0Ie8F8XUdL5Phh5/hMj5vEB61atpw8FpTBK7XIPiYvrZPrVUBzaTqe0fPZXfkF0DrR8Zqn8AMO8k8a0FAW/F09dpLefy6Wt8I09EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=PMvyGxLYyW0oWBIHQ+dsVLZWhpv523WHaVnvom361IJl8ZBZsuB0vXivs6cSqhEjBhvFKOmwYoNmpuVFnlnHP0SexMBTE854VlsefDnu24UFralV/gGzpn3EZz7VhuCSgJ0WcBLPJJwXQTKuhMzWFa2ptJkj2di/kR0uCD9jCw0ORVBPvVHXi/imijRzMF1fFwQOqZsY2HrWj4roZDcXnBCYmNaLbPDmkkuZ22RFcAhhfcH25uE42xR1IEZZTNrFJsOcI0jjPgXHNo0iyRFToSw3pqzTFnwbv5OhgjY9B2nlU4VNMM8fJuzWOBuG4cfdOY46nhiDIK7OjPgZygv6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=UWZRWqxGVkmUabgGqh3zajL+p55pkQZSJBPJ3nFt0vdACEdfslJLs+jzbVwi1TT9yYaxVAyoZI1R153sg6Bd+UW4nuH+Tv151ghwntSsc0FnRhbwfC0dIf+Cnpj4vlNRtPEMEqhd2dGHqhL8fsG4Koy+tH15r1gzoubb3SzOOyU=
Received: from DM5PR17CA0049.namprd17.prod.outlook.com (2603:10b6:3:13f::11)
 by CH0PR12MB5026.namprd12.prod.outlook.com (2603:10b6:610:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 19:07:24 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::49) by DM5PR17CA0049.outlook.office365.com
 (2603:10b6:3:13f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 19:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:24 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:19 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 04/13] mm: remove the vma check in migrate_vma_setup()
Date: Tue, 24 May 2022 14:06:23 -0500
Message-ID: <20220524190632.3304-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a91ef5cc-edff-4f91-06c2-08da3db8a32e
X-MS-TrafficTypeDiagnostic: CH0PR12MB5026:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB502615936EBD8AEF7E8B7189FDD79@CH0PR12MB5026.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4LmTn3ZlwfKU9Vnu6EbR78VtWkqIVTGzaX+5s92JvkJJHAieuIi0L0WizvIHMVvV9fZer/F3mktsMlfV2joOO9CjpEbT8n+xoA81fKSJFU2z74viZUdewOL3Ogi9AFam8PwGwjx/1ZiHlSOIK4gRe6fINw//kkUSZF3YyieSMCS6CHk2JmR9KpRFU4k0gG8lwXl5jE5WdQrjsa29rpz406GqkN4Goav40WxlflTx8PkUolosXiI1hBv8HtcUjOEMxwoNoqn/e8YgqJr5AmkMXBj1rBabwGhsCainDBgOelfRtD9Y+zhHBNCn+P8tOB2mhcRLRkgqJIGk2icV0bSgYzyJKfMjiuITqYfMztvWW4IOm/0SvKbJ1Y59pYVfoYdYwmTixDd5Fbx4LlkX59tvMNyzWRglmiWj6tZDeNxOQF6nV2aUN2XZTmzPaATWZCRMhNDk6JSM3OpWXxwzePMudfwqkh5dd60u0Un3RAjwCZjzww9xHWrcR5kJoXXgvrxZTMOBTJvp7CHt9S3XF8XRNy+nGQnlMW9LNR6pTVYk8VI2wRkMvSIyjIPx75Ckc+5q93lBB1vwA32X0In14r/GG/zVAPrieIWbPCIzi6X+TzIm2h/cfL5SN25V7eJl+G/Yjd+5bHbf+l00N3H06aeE4JNRzm9uZfBH8UGEVV9D1w4FwLDyRnLE5j+/8/sMEFwqIuG3gxgzdHPIBnT6RKAZA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(83380400001)(336012)(426003)(36860700001)(7696005)(47076005)(186003)(1076003)(5660300002)(16526019)(44832011)(36756003)(82310400005)(86362001)(4326008)(8676002)(70206006)(316002)(7416002)(356005)(6916009)(54906003)(26005)(81166007)(70586007)(6666004)(2616005)(508600001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:24.6232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a91ef5cc-edff-4f91-06c2-08da3db8a32e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5026
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

