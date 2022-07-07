Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0B56AB49
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ABE113400;
	Thu,  7 Jul 2022 19:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA621133E2;
 Thu,  7 Jul 2022 19:04:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXJV+ldUOHYhl3CBTgPo0r3VXnLf0gu9wJ9UA2/ZBClIpB40lhlytnV7UFCUSnx6d5503Mu0vXk38AUtXdACLgrD9nn6X09QUFDebHnEOXX0ft4M0wGoMB27XbryVZxVsBjEeXBcSVxpwSmk26feuu4nE/au95EuxAG3nL2yzSk78rRr4vwNJ+OYyKoYThwJOwvIhqWhNhq8UGhiFmLBjVaGZ+QNZ/hq+IfEeeU/ZcssBGI0HdF16GFNmZhkF+6lOsUp31Gei2DM4a3ygLrq+G5fNqz5LkLdN134ZcgwVjR/X7L35S55mTfZsV4gBrsuMpEuaDdak4v2zcFdQ/hvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FufDotkIE3bdjczHZAIIAyLhAtHM05ZPrkv0yNJ6rj0=;
 b=Segpd9P+bghmMY2jTQ5H4VSl52Lv6ct4Ks4hd7OwE/tnvePsArBvWFcbKrnuXvKBqhZy0hewwnhzEtDjWLrEage/o3kbdlC2oB4EPnJpsvagWnM/jf5lU0Osx7SaCQeoIAq4ewc1aBfNAMVKuN2V9Vg4j/ZE9npoDinWiwEuxP+TKjPVqWUkOrWZMgSyFbK14kQFwYa5pvGNMawjJU90F92F8WOXgiZqN67qFWAgCd9UKgLo5XtjVQOoT5lKylQ8XwafqfxX3OTgo3nqMubHeak8USr1vpHZEJA3U6E2caAsTxoBIOrLSkEinaRkvXdEdRNQDabM1a++sBF9C7Dakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FufDotkIE3bdjczHZAIIAyLhAtHM05ZPrkv0yNJ6rj0=;
 b=M2bSdX6EZT22LDiUAEPVXwxAFTrxxYtEBdadDOzqXeaWQlCQIMyOYXf0uoRebsbJNQYYOI5OrAjlOOAM9k07jNIl9uQZ+Vs7FdzHjuiOp8rD1Ko0ZbDN9mHd1gpI7n+2vBcwTkrjUYu/XFr0Ow3+N/vk8fuZ0uT0WhjaLVVsWeA=
Received: from BN7PR06CA0070.namprd06.prod.outlook.com (2603:10b6:408:34::47)
 by DM5PR12MB1452.namprd12.prod.outlook.com (2603:10b6:4:a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 7 Jul 2022 19:04:11 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::f) by BN7PR06CA0070.outlook.office365.com
 (2603:10b6:408:34::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:11 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:09 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 05/15] mm: add device coherent vma selection for memory
 migration
Date: Thu, 7 Jul 2022 14:03:39 -0500
Message-ID: <20220707190349.9778-6-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd1980b8-54e6-4e55-fddd-08da604b7a0b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1452:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2CHRDsUuJJcoPUPRbA9o5xJiw1nCarWXULY8wZtLhxwk770zUgsVdp4qT91iu/QFWXwgiMT2xrwsaC1lPM+hdvFTMHmRbskv/nVopfhFBduo8MJp4j+4PKrAIgU9Lp78RbOw7tSf4HIMPhWpJ/ufrLETrIL+DmWOdr2bNuiYt+MpAEIwY0q5AU2acHjWFWUloKB646Puqhrf1WXksVNL7iw8CQrf6rmX+Hp6Sbs0hOySi8Y2soEETGIq9bnR18IsOxjT1UBoicpBMnhSh1DEN6yrCPnECuY/F4K4RNI9YZtdici6aM7Ke1833sgUqTC5REK9+SB/KUABRi4ZEdMDSOin65wtj06rkAG6hfEj3xCaWSLawb6q/26xHD7jrdCgzrNVTVuls0fijGndKzpCR9qx5TP1L+gjg7HKCCHDKTU5T8kmQ/JulvhVt85MaHEabNmEc8nFAABjMHgNQWlmZyYpHH6FcKTGHKL/GqypOKSGAbpwvSkxsUW+neBpmpx4agWJca3VEJt8bzM+u9OUa3SIGm+VVZv/QqTP7nbV4SujokmrH2yQDluVGMHMhOar8el96JbrivjlkQqF4M9TNus3jgfpLdjk6q0At/I2LnndFolhv8JEo1fCBsgO+Vg9vuZqUqMsYx0Lv/NPEV/7fEqqUc82OW+tyH8RS462APdpmksmu57Mw+AHBq4NdG5zuxYf6dryKDteHzGPGoaRnDMhUfNieIO7XhUlZt0LA0GilgovcXWq289XAFx87LcVciAnrx7OxjTG8Jubk05s+wXuPSU5XPLl/9EiIL81X7pLetcP9hWyPeOVb3uT7aUCMOElZ8IbTt82hiR7cZnClF9h7CPCyAS2pfglwuBYgcJ0Dx9RPZSvDX5E6sKoygJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(36840700001)(40470700004)(1076003)(8936002)(2906002)(8676002)(82740400003)(70206006)(44832011)(478600001)(2616005)(5660300002)(40480700001)(34020700004)(36860700001)(70586007)(356005)(86362001)(4326008)(40460700003)(7416002)(82310400005)(186003)(316002)(36756003)(81166007)(26005)(16526019)(47076005)(6916009)(83380400001)(426003)(41300700001)(54906003)(6666004)(336012)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:11.2141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1980b8-54e6-4e55-fddd-08da604b7a0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1452
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

