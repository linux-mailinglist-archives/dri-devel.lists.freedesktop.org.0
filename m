Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4C51CB21
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D78710F91F;
	Thu,  5 May 2022 21:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D258F10F91B;
 Thu,  5 May 2022 21:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mfek9NK68GyPn8/ZdjENfTJ5kIGmAg2/+q3mAlt5nY2Y1z6yPetWQwY5T0dHhjVsVuRYyhty98yWo4VY67DM28xwOUU75HjW+uH3Zsw1kUSrF9+ungB4GhZQCNgwMnknWnuBTcPxbDe6OX8iqtFY1JRijuRjypT2ihY5xVsGvWGRaEtui3znxf/dgrgF/EELq1u2NlFzsGBKeBU8664QZPSRb130g4sigG3eo5PmMC9tK7ll11IacM2TQ/K5sKEHVEOISVYBEH/Muk9BHtbdlqvjzeL8WyGevyRranuWyNLo3+/2KPjEUb2TVx5rJmzcAi/Tf4CxsUY0to5VwZlJBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cD99Dx8pfAlPZd73o6wd/TUonMRb1bs7nyuiWO/hrI=;
 b=k7wZmkHfspoc+u5EDRsTaqtnwWZQ694qnozZHIItKDkhIUaRE8styUxtRTTzit/7PQa59H2bDu8oq8Y91VK1w9jpdSJK4fTgi+t0RmM3TMBYjpy88PlOWSrRydkN4M0zVynaNiK9ngzoHJ+1cXivkGZIdxCW4VByLXx+mD7riLweUBGtd9EmN+ND7643xPaJvrz9U+P5QKyoWL7krX95kTMluUZonWuwwANz0YUOJd4nHdWpbYT+P3Ea8WHTgdqr9pQtuXrZVe7PH4Rk6yGyEd1oejONJ0ULV3WUWh7Sd6w26iJW5mg9NYohQAFuAQEIFsjZPC0NhRjdKKA2chHiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cD99Dx8pfAlPZd73o6wd/TUonMRb1bs7nyuiWO/hrI=;
 b=X6qJUFkAqyW4DRqnTlKubsCVITPnnElHq39I8AHHkjFbZw8PASJnC9/rfEjx9auN/4MFeaXd5QINENbfozzug7Gn1py6TTmtjcXHtii4d5oYuy/gyhd8VhxufYC/0Bu65k5/6Lzkta/Zhrdy0i6iAXnhzsiFRuuFI5MilzZSIHI=
Received: from MW4P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::7)
 by CH0PR12MB5025.namprd12.prod.outlook.com (2603:10b6:610:d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 21:34:58 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::16) by MW4P220CA0002.outlook.office365.com
 (2603:10b6:303:115::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Thu, 5 May 2022 21:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:58 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:56 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 04/15] mm: add device coherent checker to remove migration
 pte
Date: Thu, 5 May 2022 16:34:27 -0500
Message-ID: <20220505213438.25064-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a417c8-e792-4c9c-da9f-08da2edf1a9d
X-MS-TrafficTypeDiagnostic: CH0PR12MB5025:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5025A2B3A6F143E20FDD0127FDC29@CH0PR12MB5025.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOQqz8Vx0G/RVPYEMJXeTy6ckEBPmnYfxqBQ1X2XsOXqeFLpGDg1gpohH+FMFl+iW/Rkuldub1c9E9QoJFCK0otHuwzI75kS0Esm8f8lOXVYglDMo43bUrbWSLjFeFi8c69vQNyKrcDNXtqXvcpC1AvRlPrMtaDcB3CCGa1rpwEeUEerfySeoB8hVecyDmEU4t4Gv+i4ltk1ntJ+X5ZiHxQKHW9O0O5U2GA/xc87Xy6Mp+o+nTI38axYqvowg4HUtf4Um77izS02Rrfbe8lHlb12WiTWRBrwwqT42PIUgFNRG1SsTXRIAXmFlnWCmv2zm+/TA/qlVYb9X9sn9h2sEiVIAynXBH/gHsZmWRHIlIdcFvGKB09rvtWpaulJz88BO8hOQOblr02iw+F9OuqcnDKLUce1beh0kgupCG59ZsU7t3NUmB/Q5po5ejuLF2bokvE5dclM7pqhdQ7B54YZJ29PQhZULQP7vxO3KwSf8RYdl+lDE/1Po8Gv/wQ8mqCIj3j14U+DjwyeWg+uBuGDxyZWxUr1H/G+8kwPd3zkTrn8wxwdVMFXddMKkBYRsEA5wZ5RRlnwRlma0NFBHIIPZVVvRbsPmq139z/iVbOaNwLmrFPokpSHkY3e+WtG5Tra0D+lOPSwJ5ZFQTU2frrLBqJ8CGnLDF3gtBssMrHic4E+Z0gfO4LDsu8VOokOzROp22+Q4IltdXpIlqcpJdujLg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(186003)(316002)(54906003)(6916009)(2616005)(1076003)(16526019)(4326008)(8676002)(82310400005)(336012)(47076005)(426003)(70586007)(70206006)(7696005)(81166007)(8936002)(2906002)(83380400001)(36860700001)(6666004)(44832011)(508600001)(26005)(36756003)(86362001)(40460700003)(356005)(7416002)(5660300002)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:58.3609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a417c8-e792-4c9c-da9f-08da2edf1a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5025
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

During remove_migration_pte(), entries for device coherent type pages
that were not created through special migration ptes, ignore _PAGE_RW
flag. This path can be found at migrate_device_page(), where valid
vma is not required. In this case, migrate_vma_collect_pmd() is not
called and special migration ptes are not set.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 6c31ee1e1c9b..e18ddee56f37 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -206,7 +206,8 @@ static bool remove_migration_pte(struct folio *folio,
 		 * Recheck VMA as permissions can change since migration started
 		 */
 		entry = pte_to_swp_entry(*pvmw.pte);
-		if (is_writable_migration_entry(entry))
+		if (is_writable_migration_entry(entry) ||
+		    is_device_coherent_page(pfn_to_page(pvmw.pfn)))
 			pte = maybe_mkwrite(pte, vma);
 		else if (pte_swp_uffd_wp(*pvmw.pte))
 			pte = pte_mkuffd_wp(pte);
-- 
2.32.0

