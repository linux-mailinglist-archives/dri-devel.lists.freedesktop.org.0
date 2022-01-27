Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C993349D8E2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E33110ED43;
	Thu, 27 Jan 2022 03:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991AE10E763;
 Thu, 27 Jan 2022 03:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+Ug+HUuMQa5+feJEDtmkYuUuKpWF/LTs9veYB9lpT196JBBohTjp2NlhbuG1/AZxbHDtjogBVRbBeMVSX5uLZHIeAvHG/aaSeF7qNb6647lgPYx3dJ3yaLnrsJpB106RcfwaSnDje6+dXfmrZUq6mY3u+ucbW1DJ/8owvX2J5hMxHCsd/2ahJsolPIlBinU89gtbQyaYlmJGi+wBiV2KVujQTQQbIYPa+OAM9WCt/vSKk3zx/NUdd2yw3zgklTn1KWpkJxEAjprvmYF0jB2xit6wVkLtmwzVFJgs9Leb6d0gADsivB+lOd7N8UXXoC7Vu1AGAUwNV7mwbK1YjpWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWDM69tVcCu3/7sDv6tQ0MrJh3kz8/wwZi72uPu1Edg=;
 b=Z22dABpQZwU4G5inhSMdOpUf83VkkJ8o6Gpm9C+NIhu5OGAiokkb/aDCwGBFBSR0RsiVg0sB4IwhAea/0K7nDhWoHSscnq9Nh3AbUnZTuaM7k+RQMB8GTWD09ug2WKLa1+Rp+VeipjUC92QcoiPpVIrFbhz0rnURzXl83UrCaArb5BPk+ypQAnRvzS6WNMcq0MUvdPJ5F6F30mKzJA6+1+oHR6x3cz6zBPqXpUdH0KiDhnenJRe2J5JpEgpnjMAA7SM6iaZf54bMuMq5Q0es2hyxf///3euHhOQkZqjS8g0QBNEzfTTHsLqM6VUUmKtLm/LcvpjytBoCzJBIbBzCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWDM69tVcCu3/7sDv6tQ0MrJh3kz8/wwZi72uPu1Edg=;
 b=GMp55czC4a3WjqWP0SKIXqK43JaDaZJeIQ80y+bRwEa2t7JpF7PZ1CWy0L9/2aMF2PmDV1ahAOPgCLWg6E5lyLeOVC5w2u3zPVkBjiKnYi3xQ2H0X7gtQ/fVihsbB9Tyxz1nMxxF+sGlIoO+KPI4I30BRj5kJgTb9LQuz5TcbyU=
Received: from CO2PR05CA0092.namprd05.prod.outlook.com (2603:10b6:104:1::18)
 by BL1PR12MB5271.namprd12.prod.outlook.com (2603:10b6:208:315::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 03:10:03 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::65) by CO2PR05CA0092.outlook.office365.com
 (2603:10b6:104:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 03:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 03:10:02 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 21:10:00 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v4 02/10] mm: add device coherent vma selection for memory
 migration
Date: Wed, 26 Jan 2022 21:09:41 -0600
Message-ID: <20220127030949.19396-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127030949.19396-1-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84bf4b59-de14-4c2b-aa64-08d9e14282b9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5271:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5271B04BAC1A159786120368FD219@BL1PR12MB5271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O6YczEsz69AvTvEsW9/oMmWH1FlSpMmjnz6TYlMF6eq2XpxF88gFtIKe3ONiepFntTYHafJPKwmmFaA89KwuXn/9Iyqy70gE9Vex0XKzm1ySvEWCyu1/Q1mzR8ui2Q2hakC+A8cjRZIt95kJOJ0aV8XxXBpTsH1MtGLdITOxeyZUKKq47l3FjiIe8bHmIihT9+xIDtFUqvtAvLAzDJqOq2qVUvsr5JV42yA8u5VpyE9/1z2tFJ7H/Aweq68GZQXyZeVr3RlWiXWoGrLxZJbIH4IbyjefuMg0jvyyTZLA6S3DYaQGMpck7U9uxdHy49C1pVJyJk2SHdECMDS3mnUVxc0k2m01KWKt3Dp4tpUQ5nHoOpTtzcJFc9RWbI2ruHNXCtwVl490jQ8pp/4m3oPI3VG68phmZuXYbd52oXnciUvrE8FobdNAJieoEjNkXpzi1VumFtdndYgSBPvS3CfEY4cp8VzktUW94wad/5OeXOccYaXtZP8XsByT4M7H9qIlBXuAPFy4EWkx24UVG0rUiEh77Qqat2iIhwn9V0Jteu9VBmKfk8aF7cJjQMspmqmCEILuoWCsN9oSVREn8fs+8OerAhvQ5ceCpBwRPtsCw9Qeg8uJ6vP4ypK/0OtJKf1tkueczR1gCUsWsbcS7PmaMe5skBw2YUOamA0DzEp41/Sr3yeUAaI2m2jM6EL3IelKwps2Ej7eyJnJMW56/qdOIA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(86362001)(336012)(2906002)(36756003)(6666004)(110136005)(54906003)(40460700003)(47076005)(426003)(5660300002)(7696005)(508600001)(8936002)(186003)(16526019)(8676002)(36860700001)(4326008)(44832011)(356005)(316002)(70206006)(81166007)(26005)(1076003)(7416002)(2616005)(82310400004)(70586007)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:10:02.5057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bf4b59-de14-4c2b-aa64-08d9e14282b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5271
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
---
v2:
condition added when migrations from device coherent pages.
---
 include/linux/migrate.h | 1 +
 mm/migrate.c            | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c8077e936691..e74bb0978f6f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -138,6 +138,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate.c b/mm/migrate.c
index 277562cd4cf5..2b3375e165b1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2340,8 +2340,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
-				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
@@ -2349,6 +2347,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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

