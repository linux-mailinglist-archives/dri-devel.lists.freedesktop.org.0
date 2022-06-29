Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72E55F468
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B2B12A76A;
	Wed, 29 Jun 2022 03:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4537611BFB2;
 Wed, 29 Jun 2022 03:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efbuwCPcfwdQmjRQd8b9UCEDuLMIuDyqFk/DF0O9bOqblxapL/pi5QDZpqqb9QL5EL+OV8N/xEcuo13/Dt/7mzHULvcBZalmFn21ziBsHqlR5S9E0RxgeMyD7TNTXCo9MlfEKxwQ6LUHIJHUvXe2OAyle3msXSNH0E5akaw7fdqTx7ikIr+7ER8xYaOaJ/prRPZ6W+chtEo6zIx8YlvOkH6soG3/cZ16gfyHAgw2aodQlPDYFSSi37gkkw466QO0quJ1KCyHVhsmKJIxr2ETS8Ll4Ahh2bBdN/YzBRY5QlxD03x4Wa60n42jUhd0UQ+Lpefe7GpHUvgtiPSksoziuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=Iu93LlBpCFG1vuWLQhShdjBUwClsLXj63eUyNdyLZwNJ+5+14n6ikNiPgqhnrsQDDFJY8bmY/LL0Epn3uqiuiwN1sv+5cKalztVGLX0jmAGea+qQKO/xWO8WdwA9ilpGimhVkOVTVyd2IDIiISN+tKe6lizK+OuiPj8yamrn8r74SdqvAyIoB7899u6kcamGpHSq2bV4ZnBsTtIGZW0//XJWZARs6gaqnvSJBS07AhNXIfmaC4hlSMdmhj8ux0jkF8i6pZ2oUFGZSEoYcMp8+8nz3J9n0CCuIfNCfhsBjPib/dohpMHQU6fjiiYcdWti03vYdo+VkJfr16hR8NJD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EJHkZDbAdLVpEXXE+RGiJTJBXEdpU2pe/Diqmm86p8=;
 b=p+ZcJkweyTYWzKljk+bZVFaLopAo6NTsDs0hbQfDagK5uYlVw37OlS/LSV8PncqYCZDLH7FiM8hFJHb6nxN5Eb0OLshwEWymJKJsXtN8FNTWscbDQ8GZmZAwRsYVdfJMNstLt00E2N/OG+8F2fZj0sOcl3P4W4EyzYHBi4Bhcbg=
Received: from DM6PR03CA0099.namprd03.prod.outlook.com (2603:10b6:5:333::32)
 by BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 29 Jun
 2022 03:55:09 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::87) by DM6PR03CA0099.outlook.office365.com
 (2603:10b6:5:333::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:09 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:07 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 05/14] mm: remove the vma check in migrate_vma_setup()
Date: Tue, 28 Jun 2022 22:54:17 -0500
Message-ID: <20220629035426.20013-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1fba34d-f4df-4711-cabd-08da59832946
X-MS-TrafficTypeDiagnostic: BY5PR12MB4178:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CACcp/ae7F6Mw2HAT7MD4ge9CEu3ui74pWlKkUylt5MkfahXzACuZlwsjwdas+v/VRMwtRaN4zbGeUrCAcEUoFREsyD7z84Ncy7yUE6qpJ+u+o+TrHkXXpKcqXTo6fBgrFOVTInaI+Vf6+BfnwU3h5S2WG9IBad6guZ8A8UymrU4kc6wFg90qwDBGWWvvE/OKRgSd/OFtqKxhmGCeE+qjbzRKT9XCV5AA37JEJ5tlrzI7Gg2vw1MNqkV1gwu8PfyLBQCA3RdNft9V1gbcY82gdyCqEnsRjpSpKD6DIcEPXxmhRjBUg7y2VJIAECHXH3Z1GorlX4Lweur6xAMFjrhgSHhf7vsCZWH3Mscw98Bv5bQULHinEstoFGqaCAP8XOOVfpeSa8kfvjRL0GQIeN2Z0jfcZoHEzQWKMesNRJo1qDQxUbzz6dHflC0IZsMMuDTCYLPrUTdGHD3EJK0JD7yA1nppt6snai/NQkwzFtIOV5AfB59we6OJ6vq7Glt4GTPyCLoxnlwEBUUOkI2koMZatHLedCewfQNYIAgsNLZ+bxbl5ftfPsWd1FUJ3xJFr2EgeJC4AMOJrWJBEa9xdIO49M68SEnqQaUOdYyXiR0Ig3qAaU85M0Ke4KG1l+kyw9Kaz64k+xWj20wIv7ttoMnUqJfLMpSzHXniknfsXjZEyFvlQHGBVVumRPy0yj1G6NAXrbR0KTHN3OGGx+3wJ9tWpN9kq7gBOU9XmQgd7iIu1KFgdO2V+mLlc0hldOJsymvBSpeeNHPRPtRgi5Q8K3038rU9DhJk5Tllz0pty237kfinMKRGvy3db1PFtpyuyfjyPJVT8PFolAuvEdEkBVh4TSpvYEWsuUH/Ok3dL4RvfixkCff4O/lpca6hFy3hd1P
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(54906003)(4326008)(478600001)(6916009)(82740400003)(36756003)(2616005)(5660300002)(86362001)(70206006)(316002)(356005)(1076003)(36860700001)(8676002)(2906002)(426003)(336012)(82310400005)(47076005)(186003)(70586007)(26005)(41300700001)(83380400001)(40480700001)(40460700003)(6666004)(8936002)(7696005)(81166007)(7416002)(16526019)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:09.3502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fba34d-f4df-4711-cabd-08da59832946
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
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

