Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9C576EAD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BA410EC69;
	Sat, 16 Jul 2022 14:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81F810E06A;
 Fri, 15 Jul 2022 15:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOC6GziTPn+qimKUDipKx9IzoQDfSMXK6oxiveM/o5MeF0UbZ9mJcpaGfkkdrXYixibhomFcpChUdSv2+9PB0CzP85fIH+aZuAxlk5Lnqv3qYsakPoE12je83bbdFUYA0GkReGhIRUspGErJAdn/rg5YyfYGv4hQ6nr46Z3N7Te/4AP+Cn2CNw7YsVpU0Ne7mfqTKD7xuVVVw3Y3VSxZenO9k7okpbwZWI+QHEYWDq2wNm74T/j0Nsnz6JQACR16a0eB5yRbhuFHIYhrtHVKnS1p1EetZjDLY8r9HvbsLVRFr+Ev/njdr7SPWuhG6BTU53oGoyXm1gEhc91U50rplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FufDotkIE3bdjczHZAIIAyLhAtHM05ZPrkv0yNJ6rj0=;
 b=QRlydB4cQU/ykWs4I4wRcnUKNVDmp3KN5225nJ0V3UYUd5OVzPikG4bdmMqDZyWURJf4rzhbXd/c2nxI9Ei9lGi/MPqAIoNvD6QmRxB+VQ/m+5GxhC/LysdVtW4KMLxGMf0w0z4y44XL6a/38sDFJPkym4n/kod914Zini9tgeBsYNzKipM0dQUMgdxOOKhu/lDOJ6Vd4PZzzHpC61lpbrgwW7LN5MzmCqJlwSIKA3d2dvBbxu34AY3SSQ8wSysgczuiVtDJQnQDAFnLCaqEwhuYyiZZ1VGBGWxpIUyr1gVw2Fxyyniz40pfvWqVeo0tIYKucqlZe3BJOAk5dAE9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FufDotkIE3bdjczHZAIIAyLhAtHM05ZPrkv0yNJ6rj0=;
 b=pvfJ4UZfVZ+Lrbb85UYtODyfEdylvP5Ka9rraduUOqH7734m7c2+DNxXSU2CxNShrgdUGDkIo8+pFfZTSFg1VR3ZA248k/6Gh8KS7y3dIHrsR7ai8+brvBsRPHcudnhDrJs2jbeNR1/jnusu8XGART2lO1dLWeCiUz3NGGQ5KEY=
Received: from DS7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::14) by
 LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.18; Fri, 15 Jul 2022 15:05:43 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::e4) by DS7P222CA0004.outlook.office365.com
 (2603:10b6:8:2e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:41 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:39 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 05/14] mm: add device coherent vma selection for memory
 migration
Date: Fri, 15 Jul 2022 10:05:12 -0500
Message-ID: <20220715150521.18165-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a2f3484-bb6c-4f4f-4f6a-08da66737c5e
X-MS-TrafficTypeDiagnostic: LV2PR12MB5750:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jQfFetPKdPb69TlQ9GJdiRSwpgh6CG9O9j4i+0A2InL4kpJOY5zOcgpP/nVAiH31gJWqDScpM3jNSXJ4arijUOJqSobM9+vbtXx88PQsjQn5VKynqYnGzAXIw4cYbr/dx28RXhEi55um2YGQTzJC03C3wI8+pfYE99ky5vwNOSWyTWDF6PvHr6zCqi7i9I4/Ps3Q/Pjo6exKQT7rxRkBMp7/L/hPCYnep7dnx9aP4w/KRtQuPLRNCx+Rc6HBnEHKpoJy4N7QrLhk4aHAqBpAaPWKYQ7/0jovuxWfTd3Y+9ZLrxfaaz2hcpTnTYkyf57fKYc23aZzO9tEkxbZL8BncphcMU79fioiuH/zFOMd/qL5hgItEd2skQTH+ie0QB6bpVudTrxFrF4LkmF/MwWNaqLGgKzFq051L4W86zkl/s3eRWkR9GZhYCpT0tK8zbwgGoiXM1+MoYfFty175rPK/4TYsZPb0UTBAG4jq0/25vVIDXQnTNyK2dN77ZMHDyHJtnivyevZZSrKsjiwClUNrMXhvjTcoMc1PWoqBoX5g5lmphHIEM4GaqqSbmf4eY2Jt4yYerPzbJ6nlMhgS4KKvzpU7AcbJm3APGQXEgxyGDnTj70Mj+Vdj9+w3Z/apwtA7qpZjc9JGuXDYuKlWbmWLuQEROHyoG8ZfO8jHKbEWWM2zzJBanITIcG6fGhqg629N29a66btg8823wNi/pX4hmdvKTH7yd6+alWoUpZ9SOhQI2S2Gb4vp4ia515mzZ1xLFjvSFS0qkqxV3seRlMln8zpp624WCozzvOvD/v05k3+fSX+bID4Wp3sbomF+zOYR3C68E+PXsuBI/HK07/YeW6j0ZIGDTXIUzr1mC1hos=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(36840700001)(46966006)(82310400005)(316002)(36756003)(82740400003)(40480700001)(8676002)(4326008)(356005)(81166007)(54906003)(6916009)(70206006)(36860700001)(70586007)(26005)(7696005)(336012)(426003)(8936002)(6666004)(2906002)(2616005)(1076003)(86362001)(44832011)(40460700003)(83380400001)(478600001)(47076005)(41300700001)(7416002)(5660300002)(186003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:41.9236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2f3484-bb6c-4f4f-4f6a-08da66737c5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750
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
Reviewed-by: David Hildenbrand <david@redhat.com>
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

