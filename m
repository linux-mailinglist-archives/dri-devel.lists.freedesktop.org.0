Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318951CB13
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B980510F91A;
	Thu,  5 May 2022 21:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C910710F8F3;
 Thu,  5 May 2022 21:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZjA1wGQB25BLbjKVnJQyyu2pEGCPwdr+dTRfkW96tkRzlv9by4h9/1xvz9cP3DNLQRPFuHWotH49hyORDpLaptgvTXdPDiGYlvaIjcHuayxVsjZGJXfjuTLavJhQf/9pQ/jiUqgmNc9VloqU7I0JWU1cJTm40YzkgEScQADnNV5wjbl93no03WmZlKo6p/eshb4RS2WFOwSSxSi1XuGcKn0dbrbCIPdvQf1WXta7a4Wbapt4AjfXHYD0ryqnzzt1OVaXakhnUpzOis5jVEvutLZi4UAMRn/tnDI+Nqmvfn5uc6W1K4LhAZ0lmxkgNjAzie+fir4cYZ+lE4MHPb53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=oXOtADay8SNay0O1GNXp+c+309NRuzq1KVH4IZ4gfxQRJCAO22DVo4QVEYS7/F+0/Bsosz938ZTKvySlV3K8GTsOAONGTOaOf2sPRUegnsdimdswqVSLBrQ+9jQpp5bR44eMyAlhYxrbPGn0hseXq74RwtcImDWlTQirQZKo2Pd1Dz0s028gnKHCx7gPxXPY8ge1jP46a8P2usMODt0kjqIEObx94ih/oYtyRq3wOtd/QPc5zmGgFzWTtWQOFe00GVl4PyEVNax19/ZcoO3h4pJIa++iv3C4k00N3uyqHzNTJV25x77dwoH5E+CXaZzQ4QqTqrornBobNGOxwO9klg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=519oerrRDEbTv7GQOYa1mMQ+Fz3ORBOf1G9j+BglRrg=;
 b=3DypaFBL2avF42OQI26/Dvo2JhTGumkPOfxWRg5Ty8mz+mMCi4YrxXgqLB3GoNIOPz9tGTcb+RYQ9E4DHf0ADpucajcPReKKfvB05mI2prVXWcUY7O5ipgdFDugoPs9bT5rtoIFAhYlU9l0LfsOeFOVPLtI0pG3qmcxjeMlNBZk=
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 21:34:58 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::e6) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Thu, 5 May 2022 21:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:57 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:55 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 03/15] mm: remove the vma check in migrate_vma_setup()
Date: Thu, 5 May 2022 16:34:26 -0500
Message-ID: <20220505213438.25064-4-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb9748ec-f5af-4eb9-0e37-08da2edf19eb
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5207B375A1299B9F9C273ED9FDC29@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RBjvpmF3Mj+krfdfyB2/1/UJNz0905tZcAYulQeqqAsy0cW9mD+g62ok1bhnKdskX7ktj1E+BcnVbEFRqGDfpVwTM5l+RuxNk1ISjpmRCLWwD+bHEFA4uqK9dZbldKLfnKvyN2m5xkU+ka6vSRCYq93OE/cUaFTVgDexMr4T6UU5J8v59bW2UIiKtg/og9NlfQrrt7pwp9e0DYq0ud7aHy7T9bQHaCOjv/YfxKfjvg7r7+oiWMCh/CYNNG09RTVLv4C5kzBnpdph++ldLzeflKyCXkQl7S8tRmjfyX7PFYSm0TIduzx3w9JRaExyAv+eDVR456L5Y7zlLqBCXNeslXns8yuK2h0s640dRufy++dji5BoHSw1KTuHXQRwU8HUx5QckP5oZBzKiYAPkWkIPhDRQqSqLHOKke4n5+/ecPnYuPXMoNcE3fJsYI0V9S9LD80RTkf0vbEbx3I8mlcXQlkIU7x0B/2dUb0HNUWi+ElOT1Q8k4qprBccF/gPuhsJXqbyPCMJVOtJiKx0nwxdio9LtTgUIqeRMm73YEeaGEecTZadK6A8toojn7KmeIhW7mTPSdGVV/YQsAfLXBqXtvd76VwS5FizCeF8diUO8299Our8G6kYIQPW9DJc0+zTtm6Z24XuDYLhp1E0Sdsnpdw3Z5APw4YqcHQ+V7bT7n5VfFuwuf4FOb0Qq1rf8cohtuKJr8VOEEBomsc9R2ZRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(36860700001)(7696005)(2906002)(356005)(6666004)(8936002)(81166007)(508600001)(82310400005)(426003)(16526019)(186003)(47076005)(6916009)(2616005)(44832011)(336012)(86362001)(1076003)(4326008)(26005)(54906003)(5660300002)(316002)(7416002)(8676002)(83380400001)(70586007)(70206006)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:57.1891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9748ec-f5af-4eb9-0e37-08da2edf19eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

