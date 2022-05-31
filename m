Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D253946B
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA9B10F32E;
	Tue, 31 May 2022 15:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B8210F1C8;
 Tue, 31 May 2022 15:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnuAVYykDZjOAnnfUCz4sF57Cmx1U7NTL07BTlQAgNe6h+3R77Z4vPCEMe1f48PoW3BHil/jjja8TQ3KbOENEL2QQJlJ75Gau+UgwXRxWxEBar7O8VHybKkVk7MHkbe2GidWQZqm3n1oi4aJgMc/LrHKnXPElqtMWPddcqf4+6tVKmKAqJgZGXzzlYg8+sJEsMFLG0p21en7+LRla0ZAdsRCe/4AsiZ5YpyR7Cq7WwUFtowd8a872L9jCUn49wsruFw3zVmLvdWbeg13gyp/VsZJB3IV4dcTevIDyRn/gcnTs2oRsLHgeT8hlqHaTAuQueihdbMhYoxOeL+c1/nrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=kblmqDAZG2IqiEyNpAI14A4Y4Qp7lFOFnxC+9cdEKO6mEbyn87vpUaIvnqrgePzKAd7lZRHIXQUufZf1ir7s3kMYL1WMBPm4wQBK8XVTmyWU1ATbKb45v2i9+2oYnYke0B/JivU4NbFjKGRfdM4J6I7EFuQb7WarAkZbUe56GVhWoM/4JCXbTjxR+GytHNu5+Xg5cy6yyW7nBRUvT5ZZHkXuC/d0Szj8z2ooDkMW9UQLnLhYusvAUpEK9953N2JQTTrjybO0r+TaJ48/86AExLWryWK7yliO6pQnLCDLMDR31lIi6uQhz6kZdUAkHEn4HYTMQinIN2UaVrpt64OOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=oYgQs81+qO3AS69IpjZAH4Qs8jhU9+Qt7Zfy3zd9cTQKYhsiOFUTBnLQjWVajZrg2tEj3z5Tbe5pgUiEVIDrN06+XM87DGsOq1pYBjuz+6qFQhxVbJd924mhyHS5uMhqytyXdNJyKrD87p0RPTZJlmbDKrCu0hh7cJ975c8QOnI=
Received: from BN6PR13CA0050.namprd13.prod.outlook.com (2603:10b6:404:11::12)
 by SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Tue, 31 May
 2022 15:56:42 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::37) by BN6PR13CA0050.outlook.office365.com
 (2603:10b6:404:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 15:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:42 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:41 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 03/13] mm: add device coherent vma selection for memory
 migration
Date: Tue, 31 May 2022 10:56:19 -0500
Message-ID: <20220531155629.20057-4-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 52e155d4-b24e-4722-e79b-08da431e27eb
X-MS-TrafficTypeDiagnostic: SN1PR12MB2445:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2445278930DC44DBEFF8570EFDDC9@SN1PR12MB2445.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHpksrVOEX9knmB5+Efsh4SXPHhrknUbFYo+Db2CJSAtrncfHIB3ze5YWZHn4B50oSEKjpBtNF+IOPreYXLOkPMNv4vhDSUReXFroKdublybOT5tVcR6A5hVSjGacfpLXWBtFj2xNtoriogu2ZN4eqxWjRtEwqFSqKEey0mw2s2SaKAP78J013dvfJGfQ0o86RZ7k8xtrZ8Dk8DAdGgQ2YdEXIIQEOiWWX3VwSvfAb9+jRqFLX/7oSP2D9EjCr33bZ5w1w7HjTgAdiy7wyxl6fof1diGU5THsGCq6YCk5Rprlhjoof1IzjZ7pqz7fjVtulgoac3e/lVHCqKTVKmJK6iFAGxIvnvZXw8Z6vmY8w9+sMnyvpM85z/m8B57gWRNKS+x97qH8cAjw+Xi69i8MK6u8cOf252huey33tXpLCIlnhkU1ULOQ6Ds/If/KUGOzGlxQJcVHQOJft8j1P7BIVt5mZlEYLBi4ZifZt4OYXPt29Ru4g1+eXJg+1CjS2JGhIMxXDie+6YpAsoC2q4EgCOGeUYOdTBabhgd+EXKyH5zjZ/Enti/THkR4Op0F8BR4g+rHZzSIINzarpO6iVNh/N1xoYuP2wyJdSqZ10+9QIds4Ie+qDYzP2k93eNH7FHIF1NMxycfX3+C18XwSOrXTc5xrQLppJdpCds9jiFmj3UL1fiSutwYnEmB1wTNBzS33xs7fsoEw0+egI5k0+TQg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(70586007)(356005)(4326008)(8676002)(186003)(70206006)(16526019)(5660300002)(7696005)(7416002)(508600001)(44832011)(336012)(6666004)(47076005)(83380400001)(426003)(8936002)(6916009)(2906002)(54906003)(36756003)(316002)(1076003)(2616005)(36860700001)(81166007)(40460700003)(82310400005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:42.3573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e155d4-b24e-4722-e79b-08da431e27eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2445
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

This case is used to migrate pages from device memory, back to system
memory. Device coherent type memory is cache coherent from device and CPU
point of view.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Poppple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/migrate.h |  1 +
 mm/migrate_device.c     | 12 +++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 069a89e847f3..b84908debe5c 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -148,6 +148,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a4847ad65da3..18bc6483f63a 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -148,15 +148,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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

