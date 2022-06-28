Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51655BC9A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429110E634;
	Tue, 28 Jun 2022 00:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B48A10E611;
 Tue, 28 Jun 2022 00:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECxnCUevJ5EHEWP/tNTRU1uFb1AhVKXtt692WBDQbVE/Cl43Y7uF95Hm6ALLQBjIuUl7g7yhXpPNYyr8qfWi6NRBFKYXkYh3QM8WXjtlbTgBl9tJfXuqeUoPFO8qJHCFAod5j0XdQ6+h4D9zGnHvUoMTcZBeZSkxRLSQ29yIjCkXOzSo27LLE3f8RtsStXdQhgsvdHzBLZiYuwebX79fkoti9K0Bkr0JrKBn4GgrxJtO49Q106vrhMHjJCQS8ZMfKS4jibR+73P83M95KRueBgaUPNfoIq0x0IjyqA4yyg/S63bEonQyby2jL7UAQFO87E/bVPSsb2HTVo/WdmJvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=PMld9Tu03EJ1t8Pz0Ymup3kkjlfdNlz0XEiZ44LlNrBOQDRo9gjyfMNXHxSR3UxDp/DECNgmMOkhmmoIRBrmbdU35r1ut7IcXQFboh9qhsMw/k9XnyW7H3tr26skqYNkBLYYF6ocj4FrdcGVas1K3iBivEllR2zykT3LkOmbx7BK2i6o9AWxXmtYgks7SRzXej9mWdi7Z/jbyUBOQJvJkwqgXLyu3MaJZkR76JdgoCF8apgA+JSApmteahTS626JtaKDU9DZcztDQG8G0UMfjaKpPjy/m83myt1EHfKWqwWXJnGVIWFYwbXQ/ygkUqIPOu8SJGymchW3nbBQkN/s0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=rju4uXN/eQHXojgxg22tXznI0G4wTfLGf0MnUU0isc8F1t1tlqujJaJRcNig8jWd+doD7++4thC03Mo7EGq+e578MAiPtPc4QRV8Jp1EzKDLLHY9P5iqH+3N0vsIBJo1nc8zvwBWr1uKP+vobxIypBvdvUONF/YNu7lO8k10WdE=
Received: from MWHPR15CA0051.namprd15.prod.outlook.com (2603:10b6:301:4c::13)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 00:15:24 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::5e) by MWHPR15CA0051.outlook.office365.com
 (2603:10b6:301:4c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:23 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:21 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 04/14] mm: remove the vma check in migrate_vma_setup()
Date: Mon, 27 Jun 2022 19:14:44 -0500
Message-ID: <20220628001454.3503-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2795fad9-0fac-462b-a9db-08da589b4bbb
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: staTyeIixwAZnINmxZQ6SP0NwdsFniCsictnGBX5mQHoYsqMkhS4ixSdog9iXdHA5/xGZU8yTio2+ZBUzgcxoHECAiLsMWX9ZP8/BlNFN0LdGEWR64qMoQPSpF7YdIrFe9pMoHZ/OwEHCiT2kAWb8GKw7B+fHDtEd8FY9rQXddam71Fe4QBDn6LCYx1rHEbJ71fObD06umaATtG/b0uU0MOcx6wEOUlrhfax9ksZ5yundIVmk4AZ56SGutrPCszOLNUAU/fOUBcEALbtR3XPrjIZrbD9kfzuTY+NqM1zPKcnPuE4emvpOk/qZawEEoOtuVckKONoLG7Bu84gCspgEWP4VRVdG1704ooHLrpwT6j/NXGwpUNt1ADeI4EPsEMXxDO5nORNxOl2rxlg20Ufxe6hFbH30SSpbLYS4bkt/Zj9UL8UZvoZ4H/xCnCAPuNe6IV2sVx3Ecc2JoSiCW9ycxy+h38JYHWNeetvZVg4ivfIPUTx+3K0ti+QR1pqsOFooadQNijVEiMaeXymcu9Zuc6iCWKacycv2A40NDgv4DvHg0qscgczERnisd9cZ7f/Pe0BftQUKe1CRbs8uCmwA88vGDQKcQE+44fAbKTJ7BBBQ8B8UQgIZGrwG9JVI6AwQD52rstsRTo1oCAUVidAuYFbakwNspC3h+Huf1urEcCt+NQjX8p85UYpYR72d4/r3iYJyh1IYalhC8uH3TmOi6wYqDHbQFz4gBQzAZN/DLTJIzWAcGjiWrdOlVCbRSDFHVI8rRXyteX6ZObQ/HjS13GPBvR010cWj34W8b0i2GoANsCrPrSi4+jdDOlenWIU47sFKIIi1afU24WLyRqTUQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(40470700004)(36840700001)(356005)(81166007)(1076003)(16526019)(6916009)(82310400005)(186003)(316002)(2616005)(40480700001)(5660300002)(426003)(36756003)(7416002)(47076005)(54906003)(336012)(83380400001)(86362001)(70206006)(40460700003)(2906002)(36860700001)(8676002)(26005)(44832011)(7696005)(41300700001)(4326008)(82740400003)(70586007)(8936002)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:23.8236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2795fad9-0fac-462b-a9db-08da589b4bbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
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

