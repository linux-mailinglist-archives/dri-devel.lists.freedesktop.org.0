Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B4E56AB51
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B79D113430;
	Thu,  7 Jul 2022 19:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E752113430;
 Thu,  7 Jul 2022 19:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihFiz0PUI5JUMFT/veN4I0OBognkYq8hGm7hNdLl7eW2zIrMJi7chxH1+NEX4EQIlzgtIoiCuXDvtEz4dAR/5lkHaQFDDsUzN8I30y0kkuwRfBy7Sgu4AEm3jGlBExvqZQWvnjW4T0jRr3T3yIQyzGKCJ1dKPU/++ix+L1g3TKBjHBcyQ6Kr6nb9Xd8M7nyqzls1ujIUWgBI9o5VA12+9cYEA36pAKisL2pxg47FddaY0IW9oqUu0rPLdJ4YMUEOYMtdGzzwN6rgYrhJ6jraVnWKKja1CGdXx4YJtP+VWsC/MYyvIaYqO6l8lB9h9GZoo7ZUVZzKns4rerZ6IxoM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=giMt36mVkZwQsQ0pjiFW/wE3si5QFA2Di3Z7176D5JIvciTUf60U0rmLa1pjMHyplPbsSQG9kH3A+KXmDsF00x0dYgSNbnJV2UXsZHe+DOqjFYKMjoXyJC4UcF93jNpgPFH0WzGCYb3z0Zp6mKPrqtsrchtrMVe67eq3fl0S7JJc+g4Sl/EbgC0po90Gfghva0ariIzM0beVO6W0B9pWnLIDJKIxaLAwPJWvDQAgDKY6npQw3e/qrroo2XAurlHQoDUQ+52prX4s9QE0WJSNWMt01zLvCQikm9xtb2kr3ujBI7MTAKuQU/HPyihJosdeJj6XrcNQAcJyX0DTncHkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=hmYnJ9CxZsaG8wOo5SMvu00goLz0mjG5JSMwAqzkbNToGK2LaGGZWREwPasAnEhfLQfjbqgZq4WY6AnAVJDKoSvOLQ4vGq7X4N56gjkEjwutyPgplwnlLL688M+YtXcKmr/901qPxxks51/4oLL+5rTGJJ52kz5ljveCnIz2SKY=
Received: from BN7PR06CA0069.namprd06.prod.outlook.com (2603:10b6:408:34::46)
 by MWHPR1201MB0095.namprd12.prod.outlook.com (2603:10b6:301:4e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 19:04:13 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::a9) by BN7PR06CA0069.outlook.office365.com
 (2603:10b6:408:34::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:12 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:10 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 06/15] mm: remove the vma check in migrate_vma_setup()
Date: Thu, 7 Jul 2022 14:03:40 -0500
Message-ID: <20220707190349.9778-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73d2f1ca-aa39-47d4-53f9-08da604b7ac8
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0095:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGr3uqiqAzEuw2vGF7p3y+UTHncf/xx8KL80zDL+Dco/kPqpJipvgo/5lgQbvEqGz+mzJwrQpQ9PQ7oxeyRO3CPDpJYREBGXNgebkH/tGE0rKVpRsf96LFyeZvCzVZ0VyobmY0v7BuzhoWSVCRixt8XNjgQgFtE+2d7WdgGXZCTIkp2Q1Mgni+Fd20ftQPaeVXIFfJvdlqK+9QMHkHSe9DGtIuCP3Yixy1SVdj8QZ1Wpijy6B8gGMc5jEjTTJk107HPAMPWBS0tew/2sxBLVLKbjcAExalBRK4Ro0sGzObrOZfL7WlksiKefa/hUWyxt0EwbxFOpaEVnjeptQWVPxZBX0ZirRsjfsZH3H+KkNkubFqdlBCw45lV+MXBErj95K9XcP0iaOsRqzlUxOl/OsUTvXaPhTD4S9vFj8uevk4K5+mzUIX6GSViHoXK4dQDIqX4KJMH3KwRE38vec6g8wPolGh4SqP1Nkw4Yp3nTpYmv8diynjodnrhwjwWzLH1RjEqHWVBiZOMdZ/KAQfEGPKo6XlcKedQMPkDX6z9jcllXFWAkkXQEj1k+In8UMo+0tRmS3Ka0C4TE4IGpTK4x1jJtPZjD+FU1kqnvkHh7gmGBOCvns0v8xyVxPrf+F1N8uBBrUb1asc1Ggh6Ozjkez5GBLge/bl53tN71BTvG9HTjUNrmyyhwFEsGe1QSL7uugnGKAQJBCUwzL4p1jKzqWZOesbxj308TCyECa3gGwc2Ikvp7W3P37nbILTT0TKM9de+hNMa/9G0Vb8iOG2jANAon0Ek9iBrcuFT+QKxLPx77zOnlwJYNvk0tmQ7Nr2TCjUzzaKTlZ0rqvjTjK3DN3ZBo+vOuKyIC41dsENgVQ6NsYuuVLFBvZIL7IFxYi9Ct
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(40470700004)(46966006)(86362001)(7696005)(26005)(41300700001)(6666004)(2906002)(2616005)(40460700003)(478600001)(8936002)(82310400005)(5660300002)(44832011)(7416002)(1076003)(426003)(186003)(336012)(81166007)(82740400003)(40480700001)(16526019)(36860700001)(356005)(34020700004)(6916009)(36756003)(70586007)(316002)(70206006)(83380400001)(8676002)(4326008)(47076005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:12.4484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2f1ca-aa39-47d4-53f9-08da604b7ac8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0095
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

