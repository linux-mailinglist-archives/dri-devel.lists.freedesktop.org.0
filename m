Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AF4539783
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D9610E483;
	Tue, 31 May 2022 20:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E4610E480;
 Tue, 31 May 2022 20:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANg0ssv87wEb2XlAkSXvQ2aM2moJqsHnzpBZUZEibwiJnW7XN8c9nIxHcSwA6fb4GXpJSnSNOD3FaLeph5QFsfI0VoMbRh7aw734EMqDAJ6gVHSIsZ7Ii5nQBKtKo48o5KnR1K6me6uUAqDNIMF9CIf1xyqvqAU1DiFdrgPLfIJ0g1bBY4BGnMowIqwTqhQ2kbOnAXU7GkrkZo/ZQmPXP3Rt6+244yPrvxwA/sYL9sw5KTGzLG4e5B4nHLJY7L6+u17JH5nFOJuJi3Imz3yQWd+z/s+dIC9rYhVWwvdKR9QScjYB/RArzzBrb091trmNAjix5fjFqVNBwN/lYGYVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=NzV1MfjFkfeNjlfSQJWq9Lj++LiagKnpb249faNZDkSQqjms/g0iWuSD89IAWmycxW+UXEAbvQd7sQZ+XIE3dxueMB6aG6sRyvekqYyQhEwtQpJXEeqfEMu+/rBJQeslZC9SGs8bvQmCW86tXLpD20wPdjtQkWOl9MHJUcLjP/tAJVZHifpMX2THkOQlUQ4odPkt7j5fGxSxo3SG0YLW3Zg8hU65GWHKX8HvcZzouLQaq4NwfyvTMSNr45vUMGAweFEUuWyr4yQHH4p3PQKdgb+HE6auDP9RrFh5r/xpWNO5yq/z71bO52LfqsiHhSkqB0JzipCf8R9NBkHtNTWG0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsm1npeQJz5adlkprwdiF30iBrFOX7mFKo901b9QP1o=;
 b=i6QtpeqwY7WedUfcYi41+sR5m8T4W1bUzEiLKPTUPrmEtIj3UBQEgi0JlC1+IPwPo3Zhp9t+3zZw61QfdMzz4idTN+1g2b9g9zrBQ4Rbl0lT0KsXF+Qko4+ObmbjKojSq5/IfooYz3rk1mBJKp47EIuaTZlSYXHngtzmt6U3Q88=
Received: from BN9PR03CA0410.namprd03.prod.outlook.com (2603:10b6:408:111::25)
 by DM6PR12MB3769.namprd12.prod.outlook.com (2603:10b6:5:14a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 20:00:57 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::78) by BN9PR03CA0410.outlook.office365.com
 (2603:10b6:408:111::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:00:57 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:55 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 03/13] mm: add device coherent vma selection for memory
 migration
Date: Tue, 31 May 2022 15:00:31 -0500
Message-ID: <20220531200041.24904-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bba815c-d1b5-489e-bd25-08da434046de
X-MS-TrafficTypeDiagnostic: DM6PR12MB3769:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB376983E617B315DAFDCB276CFDDC9@DM6PR12MB3769.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWqTiNeofnuKHB6n/0vxzk/17wAYkpSXhmJVdm5AteM7m6npVmQLKZdvBBNTtApdDJ6sadq+RcdSVbjFLje2RhYF3GFgKNUkP+KqZV6bqHYIdnen6O9rZAzut4gl34tlU92TanLFqALuTPsvLCsDS9FWNkoH10h3CSYOKBdSdnOn9HRGcyaA+U+nWs6/MdHLzL2yVeqnHULFuCey+lQCwa+OvxT/v7ZU2v6eKddoNofWLwHskN9hsyvEYtUdnJepMg4//oRALx8HAUMQd9zl00/KJW61ePCH8bFvZxWMs293DIEdBvIPLxUZJXo8jbLUVKGRkc3v++KnhGCOMomP1BPFn01D6zkDYHjZqInmnxRmcE34gjLPsFeYOsbJzHPApqWNJazZ5fWqOl626YKGjiCmX688z9GZxW3CiFSLRUSnzjbHls1LOGqConcHl1QYvVyS4FdeBR93dzzo8O5/3VL6+O+x0se4y4DXNaYAWE8CfO2zcv90P6zT7up0FnHyV+Bly8UTZBdrVqtxlJ/7480AvBEjoHVWgVRN478Thk1irOcas6/2wdp0ahiBN4caUwdNBT97SMIwPtGQOO4UctCEYnctWnkVSgm+kywMnoxZDDLy2Vvg+yE53K00rA+SV0bfRTh7D6D2KarUiX2fssr5usjCKD69RUN78V8hzc5/lq2X8zXlL83p+BxNZp49et4X74p9K61sGuz8VOJeQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(81166007)(316002)(2906002)(26005)(7696005)(6916009)(36756003)(356005)(47076005)(83380400001)(336012)(426003)(8936002)(4326008)(16526019)(2616005)(7416002)(70206006)(5660300002)(70586007)(82310400005)(8676002)(44832011)(86362001)(40460700003)(508600001)(186003)(1076003)(36860700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:00:57.1692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bba815c-d1b5-489e-bd25-08da434046de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3769
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

