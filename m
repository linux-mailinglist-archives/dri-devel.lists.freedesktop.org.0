Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83A55F466
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A46C12A7A2;
	Wed, 29 Jun 2022 03:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4711BFDB;
 Wed, 29 Jun 2022 03:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foRori54YIgkOCtWCJNRZxciVBBQgLEOepHAZrA2JEzuAMkkk9LwJRFOTWlIStBbeUOiF20RempvtuBJvpmhI3aCPDoUh0YFhXs/LisAH710DgsIUbNtKDLoT8Q0scxohMVaMb4R5ug2GMjmdXb01xNPPzrbcoKNKnvwqbhPwwO0HzLjwCFFMwwJpwXdHH2iQgTHJ/LULCjqSs9FLILSYwUvD34EMksOfIDHZf4bkNLlIkP5JrAyChezYHIVi+T+rmF2TJQh+zCt3dGj3LKQNibiYd6XV3iWTa2omsLLd+Z/Rt6vVyn1tvO6YmNxP6qiv2EFhRkGI92EsfYYucO95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=O97aNftRAgmGKSf6qMxqxC9tC8yXa2Eh63vwfYkb5SKB4bxzl7IMDzOEaujpztgkuVyp/7GwLi3FreOHLhXa3v0vcZbExwJRm6TyaSnxZ7uFgk5kIEZUnX9Q8mDcH4Gu0xpJ3c6GjFDTZlkUodlBX8V4AXPxC0uH3Vz6Rk5SwyH/JZ4E1u12VpfrFTBWfSzyXf9RUFigq/IRHIhq9X9jYgAM9CkEd5uOY6SGc9zpUCRP2VWqdIDbrZ1yNEvm6j5z7XbaM5oe7mxa3JZdESVOnBOaBXQevT5nq+lEzY0uBoloVm56AVxUL4TFWdFwJKIpju5+5N50lRFBnBej1oVskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=PICJoyzxncOk47jyZR1rgoCf8qgUMsbZl9bqjliscdm09P2RLfS7R9wkkwMUJtCOFTH6pXtwImJlWyxy/y2rng6IEQz7V+pgJI/c2KDM5c+2WE4UOqw/5FHrIbzZEJ5Wb11QWnU+8hljHbZCZ2iNBAgOHSjRY0v3MhIzTurWAYI=
Received: from DM6PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:333::25)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:55:09 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::b) by DM6PR03CA0092.outlook.office365.com
 (2603:10b6:5:333::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:07 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 04/14] mm: add device coherent vma selection for memory
 migration
Date: Tue, 28 Jun 2022 22:54:16 -0500
Message-ID: <20220629035426.20013-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40f0858-cdb4-4182-a7c1-08da59832901
X-MS-TrafficTypeDiagnostic: MW3PR12MB4442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DK585iY9gEgPfYFUevAbU2Awii+SHxPI3M2mNVEMhGyo6dy0SUTi/RtPrjLLduOkb6yos7W8PWnZQ8hEmVVaI7m1tk/3evUjcOM/GwJIDl/PnZrQ+dFUQuWltQdiUlrxgHVa5C8wQ/8sxxiFd3mCYo1uQNOMWqPT8EbT+YGaaavZoAcNpu6FQan0Pz9toYF0dxRQDl09RFYzIqbLOphoQH5k0Hco28lzL+YXQT5czmleCeCyr6msEJtd7svgQPsUd483zq5FRQE31B8OnER0Oagso1MFmOzlmp4Bw5soy403AFrVmG6ODb4a7v0/IU5Dir8qaoCD1T12KJ5Z41eezGktgEYWsdcli+BQ2YitvKTujoGVBr+OU5nZNl7t0gaHWcFEIVU2Vgn4gROnaIfNdtRf0UyT5Ku4N8kHxm5KFYE0t9LqFFS8de9CwLb92ZJypxM2FVQ2yT+JmtumFV9GShRWuLYCsMU8FmIJcWdNWevLGywL/VCq0gm5ZelYztExbG5I4TUDWDVro+WiCLV39Ywpy/aeg/Hd41AtqkLJptOfig3b71gq2cbEajHQdWvZ3GcP8F5vMm+zu41KKb7ASKI+qEPRla7QsX1l1pblTf/0prz7weHtPatO/5Ta3hT4DgQ7rxqjVh/LktGX7LOutestgZ5lXkJWBxnLMxLU53s5XmvU23oNf5GcvweQizamSU8y1jPu7BzBieBDMpLSgjFkJM7lCkz8zmPBH9OzfAlyAKq7iFXwgefq6G3elW80ccxueiYjprOIQ7AXj9h5l4KNpOviAfN22AYk6SdA+wbjZgi5Jm2a5y/mmxazMhU8gbMYQ40e/4hT3rhVrqRnYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(40470700004)(4326008)(83380400001)(86362001)(36756003)(54906003)(47076005)(1076003)(6916009)(2616005)(26005)(316002)(41300700001)(5660300002)(81166007)(2906002)(16526019)(8936002)(186003)(6666004)(40480700001)(70206006)(336012)(82310400005)(40460700003)(478600001)(426003)(8676002)(44832011)(356005)(7416002)(70586007)(36860700001)(82740400003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:08.8815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40f0858-cdb4-4182-a7c1-08da59832901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
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

