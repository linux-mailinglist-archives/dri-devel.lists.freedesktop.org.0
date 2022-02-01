Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF624A609B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3B210E6A1;
	Tue,  1 Feb 2022 15:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2F910E65F;
 Tue,  1 Feb 2022 15:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEIPmtVES7tWmxq1TEpJStOonCJIdfSJLDuhzEIEWOA5k8ToiqWDVxt3vRyMpRfRlGB1f//pQIMIsHdMx/ghS0p4ab1yaSmonm6hskJCW/aZeLaC1p56rvepjmz/z0jKso4Fotq6WSsMlm45mU0AVO2z7mFaejiMVQR6XrYt1PFT05k9SOENPVvp8SAmP9nmcAAH9lU46sRlUQWZTkbzpsIo9WVXJPJ7MQkVJWl/nhfRZLJTST/uMdXe6PpNdbQ8GLrACOmHicLpb7kuqsHnuo6MfF+5DOFFlCpPXDTf95fZHgi+9JuUkEZRrg/GLM+T39iy4wjKzbY3UgLAAXb2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+Ds8XuvIQCliA5UspM8Oc/AcPjUdtndfcKQDOa3/hc=;
 b=TPHPwnfjbc1q1yk8ZaW8uqjFqvENWOqLjHJXu/xQm2TQ1H6Xk7zWsI5Gd0NJ2g8K9roVRhNBwl2yqm1jFonZWYwETyzfGeZT3u/GYZkdwSEZXSOFSPV67SdJyGBJydCcICeC5aET3efYIYsGoCRkiTE0G+oGBjHYqbl6SRb29RRlnWmTsfczyb/JnQ9vIXrGnxp+oLd+M/9D0Y/b0SZqb3KrN4fP1dJeDZNc7WzYnjoOapuzNrt0AxsKUq6t9b7Zrf8Ez3II5uTV2ZwifnQ0FwMgTk5hZCbP7SxF0Nw0QWAhlO8ayXh5Lem3KJ5AQZYpndhEtJV0IWyct7wjvxtpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+Ds8XuvIQCliA5UspM8Oc/AcPjUdtndfcKQDOa3/hc=;
 b=4AJTY8atc21jijwqwiybIcj/fVE4+vSME8eAlRGYrcPXkc61Xyw4eTYzidrQfncJZXV/RyTGHLswVFg2z2QcVrLqMzZYNFUFWXErjWzbBvA4IzT+dpr/jgqQxCX5wx53T8AX5jh4XWv4ihaoklLwnN+uA0ZkWSDXQEc0HZbMmJA=
Received: from BN0PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:e8::10)
 by DM4PR12MB5117.namprd12.prod.outlook.com (2603:10b6:5:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 15:49:14 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::34) by BN0PR04CA0035.outlook.office365.com
 (2603:10b6:408:e8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:14 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:12 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 02/10] mm: add device coherent vma selection for memory
 migration
Date: Tue, 1 Feb 2022 09:48:53 -0600
Message-ID: <20220201154901.7921-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdd01e16-5b59-4a8e-5e44-08d9e59a65d1
X-MS-TrafficTypeDiagnostic: DM4PR12MB5117:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51175EC397AAF7E0005BDC8AFD269@DM4PR12MB5117.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ourpP8LM10rGf/GH4g4jISLF0EVHSkqOZEpl/X5KbhAtx9h/RyO4YCh+VvQ4KOjFkckj5l9Nd4tWLrz1AVrcEC+Kd3zjBUdFx1iVAv+KM8hmvdYIH0OuOqwd7mIKm1vhbH0Yw0uDxP4HyTZYp2ud+1IhyGVsWcXaS6T2NVFRIx4xdp7DkmFtvqwaCjxGOPx9glucUcpgDxwWZyEPUl+LZn46pc1PjK9OF7Ih9V38BsuI2yLXFk+lpoLmjqIQg0WHS4Dln1EB8c0yjttBBgjnm0uJga+K8P0oiU+aPMFXhEj7xDAT6aqjxamd1BtuhP+Cb6zOobk+tvhfZlPmE1NujWIWWLSbx1YOYv2zHTKk+fU1xFRvxhLp1WxKhUqpghajxjQHESc/FPzeNi/gT5rvgufo9WYO3bkPeFXJfPPyqsaitS9IboR4BeS7tPjtUIdxcFIH32VAa4dPrIojMq0+uEUeUolTzQEOW6on2g/niLnGjBB6kpvtYMDJXxpgGwhVqPnOMvaS4mClwsLUM7d4kmNbzcELzfOXmuZ67LbeLFYAsPPu3wtbTixXSFARYNl+PUEHapfLSDw2XRQfVIzh9hubwKYI89sVROu6aojR6SRKusM/WOCDIsO/Jm7868kJp1WsRzip8vKDlOc6xCQ/1LZw48TODnSjExk02w6UOehgIU+HXUEJUERKF56pcFZ1i0nIZqN+YIj+ywG6xmCFvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(508600001)(5660300002)(44832011)(6666004)(4326008)(7416002)(2906002)(82310400004)(36756003)(40460700003)(110136005)(8676002)(54906003)(316002)(86362001)(16526019)(47076005)(8936002)(70206006)(83380400001)(186003)(26005)(1076003)(336012)(2616005)(426003)(36860700001)(81166007)(70586007)(356005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:14.4955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd01e16-5b59-4a8e-5e44-08d9e59a65d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5117
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
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
---
v2:
condition added when migrations from device coherent pages.
v6:
Corrections with zero pages, to make sure these are only migrated
only when MIGRATE_VMA_SELECT_SYSTEM is set.
---
 include/linux/migrate.h |  1 +
 mm/migrate.c            | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

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
index cd137aedcfe5..69c6830c47c6 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2264,15 +2264,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
-				goto next;
 			pfn = pte_pfn(pte);
-			if (is_zero_pfn(pfn)) {
+			if (is_zero_pfn(pfn) &&
+			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
 				migrate->cpages++;
 				goto next;
 			}
 			page = vm_normal_page(migrate->vma, addr, pte);
+			if (page && !is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			else if (page && is_device_coherent_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

