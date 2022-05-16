Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083395294F3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 01:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA9310E8CE;
	Mon, 16 May 2022 23:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195A10E26A;
 Mon, 16 May 2022 23:15:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGycQLZWpk1jFm9bT5KIJ8eBDNm1I54th9zc2VUj8CbrMrHN2KTat/tOHfSIcxAaYT3oQEIoZH51lcDv8MK4V2mAm6N981LokwXqcx/AQ7ahkV9sqeupOkwEu8GrzTCELI7Utklqgu6HVT4jCiZRAvOW0UPhyGSuwuw8gNb3UtjRVGjTdJ07RVw7qjH3RCwelHVOwvq2kQpRmx44JH9NhG9OX3IYWDJFD8fkd7QXo/uu8XiwPAr1B25a9iMU2UZPT4uj/Io0ue/wpf/rjCNby4Kdq5670ucVkPSR6k+Y406mIQtratiEthCn3NYtQAz8UTLXsncozi7ufp67cIbmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=Cdcww4ZrclRAMxIfv/JH73PI9iJmm7wPOnwS7b0zHrdCXC3UH9Abuab4trPxdlMsoqr8TbqR2HWidD1/qynptaZm2n42IDBV1wpnBs5EmEOC172uo9CZlYOveTIoYTj2c5rpIdQp8Li9p1dDewsHzDDTyJmWw6V2ZwKdtYvHcn7qkU/77tja7Zcxbr8tJbaumUGb7FkHxzMzzuDGB87vWKVmefm/A0MaZ33sYaqamFUGd6phbnDILkizsnQTWFXu0NN9bgD7hC8RwEIBantjkF754RCazVvOLx65h5Dx/n1akF93SqdsVTefK7L+y0cKma8VD/2d/0NCTvD862dxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=u/s9X83HfiLN03WjvO8F6VDWORylPzL7gY1O9gBWMPM0nqfWa41Yid5KcatytaXea6YK+FKo8WJaAay7m35KHsSy+1ndHTMEfVgwNPMo9i8XxVAbL4giV4lrMrxMBEUT9H3Rp2nYBMJFOmnpvYlK+kfmBuLUL9VpTi+ItCQ29JI=
Received: from BN9PR03CA0383.namprd03.prod.outlook.com (2603:10b6:408:f7::28)
 by SN1PR12MB2574.namprd12.prod.outlook.com (2603:10b6:802:26::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 23:14:58 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::ea) by BN9PR03CA0383.outlook.office365.com
 (2603:10b6:408:f7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 23:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 23:14:58 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 18:14:56 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v2 02/13] mm: add device coherent vma selection for memory
 migration
Date: Mon, 16 May 2022 18:14:21 -0500
Message-ID: <20220516231432.20200-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516231432.20200-1-alex.sierra@amd.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f0267e8-b2a9-4983-c82e-08da3791e52b
X-MS-TrafficTypeDiagnostic: SN1PR12MB2574:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB257416E1F445813010F267E1FDCF9@SN1PR12MB2574.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xemjRM8QmqgDayYUVnNcmNuSf3D+ZNZEM81/soXIrjNgmdMwpvDA4AyVDGLDcPfIYtfzZN7GzFXH+6V1XY/8ThTDXO1nViQZ55tIPy0CFDqSFiZ2WbvK4nc+hnCkEqYNI1WoCSqI+rvWVIKqiJ8bs+8125QznvjY9PlFsDZ+IIX+/pn+awv/uxOex+8BGe2JUbzgzERPVJznKcKMist5bh4CQS5+ykuGQw/U7DYJ6Y1cruU0Vxv3mHGsK1EvpwWGn6dvmEWQTNrb6a51uwy0aAvytC3lWNIZ8RPT7MBfqzKm25RVypbH5HvteT8DuTdZzk6dx7dEc1rHL/5tpsRUH/IpNjHrB60SnexD+VQJ9KDsCgLpFlUKjekmHObHX/FtawyCWVNVyG8q3YewiGAj98M8JdMmFMS7DAQ1tASJamGWNvsQzuJa3OOllM4hAV7wwWzCcETuXZTf8kG13O8Op6/tRw3cJcY5LdREc1e1RkxPC1D9Eajw0QiHsyBKzVKLrs0LjbhZLBWTNoMViprLlcSw6iZzySqaduiko0+z0l92bYmVasjWdinwyGrQS9GcI9g1L/W7X3KSiuO1IzUcwGFfTW0XWM97MO2PFx+7SYVnJBbNV4EYo34CShhp8peiWMCe2Ks34TL0RZoICunc0KkRHa3AZIRZewLnfOMbYWsCgGu45Xq+hluF4/4KsZ23HD7ms9VpfuyL52Eo38/Vgw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(47076005)(426003)(336012)(86362001)(16526019)(186003)(316002)(83380400001)(1076003)(7416002)(5660300002)(44832011)(26005)(8936002)(4326008)(508600001)(54906003)(70586007)(70206006)(6916009)(36756003)(356005)(8676002)(2616005)(2906002)(7696005)(6666004)(82310400005)(40460700003)(36860700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 23:14:58.0358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0267e8-b2a9-4983-c82e-08da3791e52b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2574
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
index 90e75d5a54d6..a4a336fd81fc 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -138,6 +138,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
+	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
 };
 
 struct migrate_vma {
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7e267142ea34..a0b997935cf9 100644
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

