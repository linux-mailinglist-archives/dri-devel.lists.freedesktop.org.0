Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5144A0185
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E743310E244;
	Fri, 28 Jan 2022 20:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E3B10E166;
 Fri, 28 Jan 2022 20:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROV0JxFZ/1D64xMkRQfRxLLjRZ0UZtZz6Janb1mnxxBfFPJjrTojmJxKhSQ7eYrpYgvOiQ1pOiyQx8COdUe4qqcqOsWJB/FnVMjOxnMgK3QhS6HsS+V7u38osgKsnnElqaLRfTw3UxpsldEzix3fgvYkwAEXfMQsnpvBtjMmFhNFUVfx5LQIq3wivzi642fWx9Ro/8cTlkIzq5nCqUFpcKuDi8/5Nqyr/vba+lRr8daS2n1GwnuP4LYc3o5HF6y++KCfPFdXlUq6ygpwSdpy23f6LWnKyS+5+8mX6tqhOsCkLVqSemucRCXOin5nQ0lvPelUzVmZzux4Mw0qZGa3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0rN4N4gPflqxuYM3l8bPuLLJMLi9xz0M3xCz+bR1Mw=;
 b=MgDkbaWfPJcNN48HRAY28nWniRQGxDbrETa3oVeGUqL/4+g/WSvl0DMAoT6emN/cwI/rzhHUvtGgy1MX4bi86UEnw2506YNDtQUmHH4HRmPoRTYo/WbNFfYLy+b/+uS3SToaG6YUikddid+bC8SAx1n3NuGvcl5SNSC1iMZG30atzPqBckD1hJ/pqc0r6myLiUZ6dbL6u+u4r9uoAvybTTRYsbuUc4OB9n7aqJBnwzu5Dwpmrnu1Nlz/GMuUn9+EyOxY/n0HVqQxul+wV2iO30sn+yhvnDmZ9zquNnfw9SCw4vnMa52TPwzwwQ4cJ6tq1YiOe3sVqB/VqOLATSq8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0rN4N4gPflqxuYM3l8bPuLLJMLi9xz0M3xCz+bR1Mw=;
 b=mTUNB02JGvzgtJ2sIWWPeNEXnOr7LnPC9qaAMxfGPUQQzmdZN88Rh+1C4jx6tvMTR6X4G9Gdm6eTXVmOmiteqaE6H0RVtH8xIvCCZLHr84V9rIlEpiZkacPERzjHNtcp6mXZekNtRZAkG8CbKVQMnk3FC/i8OGn0BAA/KcRz6v0=
Received: from MWHPR19CA0059.namprd19.prod.outlook.com (2603:10b6:300:94::21)
 by BYAPR12MB3078.namprd12.prod.outlook.com (2603:10b6:a03:a8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 20:08:53 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::6d) by MWHPR19CA0059.outlook.office365.com
 (2603:10b6:300:94::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:53 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:51 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 02/10] mm: add device coherent vma selection for memory
 migration
Date: Fri, 28 Jan 2022 14:08:17 -0600
Message-ID: <20220128200825.8623-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e16e69d-3d5d-4dc5-d100-08d9e29a01c1
X-MS-TrafficTypeDiagnostic: BYAPR12MB3078:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3078E1A3872172A6D76BF816FD229@BYAPR12MB3078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Rq/Cz0F1EZ+wZLMGMcZzIM6b3Cs399ng2cXCFf27rAvaXfoc9OUUqmnlwRMe2GbEGW32A2xfDNTxKMWQiI4e8BAG5iax/hPsCsP81zAE3nG7R8YPsUL74Qn0mHl8Bym27l9b6NiFSVQDUU9udWbo2Tfe/u+Km/kJxvsNBEZAUjHSCaYIopa3BvXSWcFu7UTH/LoO7saVips2oP0V58DizbcN7fezdPY9K99SV7VuuLK4s/IKe/G6UZAvqcXwA0paeEsrD5DZoJx5v0rCEWlCupibBHmKySduaAGN8vhe07Ne/sShtAO46KZ/L0La0HL4zd4FdidUbvTM3vLPsCAmePjaBX/uVTsrrpVBYup8Ug9HdlZUWqFQ1Hvzq5hnjua5u1cOMKiKxxQQ8Pqoyd74AXq08/OI4M/e68OVu/t2umAR54cBMPqUmuAL4F6pXsmdNToGZEk0QVz1QaezcRzzDsZgRLl8j777tBXqFOzxkgyy9uPp4o8lC7X4yA2dxCvZ39MpF/JqL8vnKoepSZ7unbugKbRSkmCLTYeWQLEL1K2TgTPdWwWDPdnobzALxc6cFmyTF540txsUoadMwTE7qNtaKS1eeikR1M7U91omyOrnK2Oo2/I+gBTMJIU8QsL7tXvgufGb7Q1wQaivBph2G26E7Qp2rOUhVbJHay8vuUz+/nzV/iNQN1MuSQ7BiWPveB+++UGsEJYWP4tAJVdFA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(4326008)(8936002)(70586007)(36756003)(70206006)(86362001)(8676002)(81166007)(2616005)(83380400001)(26005)(7696005)(356005)(508600001)(336012)(426003)(47076005)(82310400004)(316002)(6666004)(40460700003)(44832011)(5660300002)(54906003)(110136005)(2906002)(186003)(1076003)(16526019)(7416002)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:53.0237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e16e69d-3d5d-4dc5-d100-08d9e29a01c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3078
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

This case is used to migrate pages from device memory, back to system
memory. Device coherent type memory is cache coherent from device and CPU
point of view.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v2:
condition added when migrations from device coherent pages.
---
 include/linux/migrate.h |  1 +
 mm/migrate.c            | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index db96e10eb8da..66a34eae8cb6 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -130,6 +130,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate.c b/mm/migrate.c
index cd137aedcfe5..d3cc3589e1e8 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2264,7 +2264,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT))
 				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
@@ -2273,6 +2274,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 			}
 			page = vm_normal_page(migrate->vma, addr, pte);
+			if (page && !is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			if (page && is_device_coherent_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

