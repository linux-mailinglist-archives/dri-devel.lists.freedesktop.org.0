Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A03446A52C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888A735C7;
	Mon,  6 Dec 2021 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0442A6E8D2;
 Mon,  6 Dec 2021 18:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiZdfTY9icg9ChrHb87kwCp6vo7gmL6GSDAr0NWm34NNcCxLfUznxdisn1lIboC0+ZX+zZkInVcdpjTzEGK0scQvK4JzjQ+KahsrHUrYLj8asqnMBrbiEtE3zrWede57phW3MyvOaAhC1mHsxZ0thm8bKhCJ0cdPee5/xmAbIv53rIL8mZimx0NgrMqbCX3h+e66hHDwgEOoz2vttjx3xRnO+Gy+a4lLkrdimCDQJUQlh/CMzmXWOtwFrdUtmHb7IV/aHkqXRo4ofJ/eO9Ko6mijllctlLL//K/fXqbXVOrnM81dh0q00KZX1SH1/kGPFNbUSdU9z9XeaY9XurN70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v23c+NYRLLX9+OBWXEU4kBva73Qsu4tzloWOJ3a/F4U=;
 b=i2b74TB4vRb1fdsAjCfu2KXq7U7POd0xDiX5PuIy4S9AU3vD/m3NWSK1eQLWLyWlJzKsDEV7v/SAQr+Wov9VMO926A42VHoVf0CMx+3RekeVh8969zPYXWSf5k2/mw0CBNKXvF4uhr3WdKrkkCCrmdpZS3tY8TF+YIKQv3dPZlyUbf5G+uodvFctzfHPDP8MHKShxp+C/N6OYloGxfqzCaPOl0bp6UEqJjtPiPFdDIVymph0M5NpGOuZsNdqdkTjzSRw2Fcxno5jkL1IesMH4Eb6BVJmvFiKS1svjNWSKYuc21DEYW0o6eFsPdXb6Cn/zE5sGHlfExza3JUTW8VvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v23c+NYRLLX9+OBWXEU4kBva73Qsu4tzloWOJ3a/F4U=;
 b=pcC2BMj59Ioicawl3moVjalWpYVOVqgTEybETUmqwo/ZSBuh6b7MwlFUqiabqqgigyYOSUWM1nDVXh20jrH3TiqHEyxkMkVtM925rO4YysW79MNxMO/2TaM9+B54FbHjhjc0GMmZQjFCI1s4i+Fk1/SkmAjM8SM6NtQyFr+Jq/Q=
Received: from DM5PR15CA0060.namprd15.prod.outlook.com (2603:10b6:3:ae::22) by
 MN2PR12MB3919.namprd12.prod.outlook.com (2603:10b6:208:16a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 18:53:04 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::d8) by DM5PR15CA0060.outlook.office365.com
 (2603:10b6:3:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:04 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:02 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages to
 system
Date: Mon, 6 Dec 2021 12:52:43 -0600
Message-ID: <20211206185251.20646-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206185251.20646-1-alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde9e761-44fd-40be-1771-08d9b8e9a28f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3919:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB39196B03AE8B15D7146B901EFD6D9@MN2PR12MB3919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeyWUFX6pfGHIAs/N9DIyhPMFGmzsU52iBulv7lB/TrnTs6C1/HPOlajvgAbj2b0+aF0fPWJK1wl2nz9eF+mQyCaVB0A4R9Ai6ZbHXWXO+Hp7EyaVrf1+bv2QYbqR+y/dxjVO+MrCRn0FSzrJySoimSZF994mPepPP4INCt++MYX+TBaAertJ0BNj/bDIF5eYgTzjTVbx5VLSMfVQX1PCJLPU6V8ESulDNCce1Z5RRzhy2VLoBHBMFLVOSdLLNDS3Nx0kzvUgJK/QTY8DyfknFC3YllduPVzlcAqYqLs72oRDn3qBlwekDYkoOoHDBqZSwbyLdDTeugMYdy8ZW9USRoz+lg3vyAWVNTPuPZpEHxcAD7vlmDpoNBuE38zU5o8anVJGz3ddDeS2ADlOJtwiji+UUyMCGqLNWBZ5z76GEyjewzRGvd9nVb+d03vkTsjKcNNM+ouMheRM3Ou/nYLNcsUbxVjG9Q3v7VYjTXvTZ5lOaSuMU9sZSsf4P9xtS8yBwPSwXrSvT79xGKBpD3sdVtJjNNg2Tg6oCnmFNiZp2WClmqbQ/C8vgIHedDV1DOS3Dk2Hfgo2JA4u+jF07M3HRBioB9sCNUeTJR3yrIz3rdNDYF+J8WSqqbF6p6w7In/7GTbxenJQMTlFwPlNSCBpHC2PdLCBL+my6R8M4m9YdcHCna84B/DQZfG66q/N3119eDH8TXjOHMUNdB2BXOtjALgLVx3dayzid9vJQs9SIyPCnD/jd3z0uStEYlSx9+E5O1lAXyM4GylwBKxqdTBUB2UML44wnSH6CY0HusF6Rk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(1076003)(47076005)(4326008)(8936002)(86362001)(70206006)(40460700001)(186003)(82310400004)(2906002)(6666004)(356005)(316002)(54906003)(2616005)(7696005)(5660300002)(36860700001)(36756003)(336012)(426003)(81166007)(7416002)(16526019)(110136005)(8676002)(83380400001)(44832011)(508600001)(70586007)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:04.3032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde9e761-44fd-40be-1771-08d9b8e9a28f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
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

Avoid long term pinning for Coherent device type pages. This could
interfere with their own device memory manager.
If caller tries to get user device coherent pages with PIN_LONGTERM flag
set, those pages will be migrated back to system memory.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 mm/gup.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..1572eacf07f4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
 #endif /* CONFIG_ELF_CORE */
 
 #ifdef CONFIG_MIGRATION
+static int migrate_device_page(unsigned long address,
+				struct page *page)
+{
+	struct vm_area_struct *vma = find_vma(current->mm, address);
+	struct vm_fault vmf = {
+		.vma = vma,
+		.address = address & PAGE_MASK,
+		.flags = FAULT_FLAG_USER,
+		.pgoff = linear_page_index(vma, address),
+		.gfp_mask = GFP_KERNEL,
+		.page = page,
+	};
+	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
+		return page->pgmap->ops->migrate_to_ram(&vmf);
+
+	return -EBUSY;
+}
+
 /*
  * Check whether all pages are pinnable, if so return number of pages.  If some
  * pages are not pinnable, migrate them, and unpin all pages. Return zero if
  * pages were migrated, or if some pages were not successfully isolated.
  * Return negative error if migration fails.
  */
-static long check_and_migrate_movable_pages(unsigned long nr_pages,
+static long check_and_migrate_movable_pages(unsigned long start,
+					    unsigned long nr_pages,
 					    struct page **pages,
 					    unsigned int gup_flags)
 {
 	unsigned long i;
+	unsigned long page_index;
 	unsigned long isolation_error_count = 0;
 	bool drain_allow = true;
 	LIST_HEAD(movable_page_list);
@@ -1720,6 +1740,10 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 		 * If we get a movable page, since we are going to be pinning
 		 * these entries, try to move them out if possible.
 		 */
+		if (is_device_page(head)) {
+			page_index = i;
+			goto unpin_pages;
+		}
 		if (!is_pinnable_page(head)) {
 			if (PageHuge(head)) {
 				if (!isolate_huge_page(head, &movable_page_list))
@@ -1750,12 +1774,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	if (list_empty(&movable_page_list) && !isolation_error_count)
 		return nr_pages;
 
+unpin_pages:
 	if (gup_flags & FOLL_PIN) {
 		unpin_user_pages(pages, nr_pages);
 	} else {
 		for (i = 0; i < nr_pages; i++)
 			put_page(pages[i]);
 	}
+	if (is_device_page(head))
+		return migrate_device_page(start + page_index * PAGE_SIZE, head);
+
 	if (!list_empty(&movable_page_list)) {
 		ret = migrate_pages(&movable_page_list, alloc_migration_target,
 				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
@@ -1798,7 +1826,7 @@ static long __gup_longterm_locked(struct mm_struct *mm,
 					     NULL, gup_flags);
 		if (rc <= 0)
 			break;
-		rc = check_and_migrate_movable_pages(rc, pages, gup_flags);
+		rc = check_and_migrate_movable_pages(start, rc, pages, gup_flags);
 	} while (!rc);
 	memalloc_pin_restore(flags);
 
-- 
2.32.0

