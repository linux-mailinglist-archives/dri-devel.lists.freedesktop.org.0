Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA18451234
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971836EA3F;
	Mon, 15 Nov 2021 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7DE6E85A;
 Mon, 15 Nov 2021 19:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNHXbqxdUf3NocTaNGWQkp+6hXm/caM2wOzmea9YRaslvYghwswzpp+QiZ+9BCLEHqePY3KxWzOHyNjr95Ymb+s9WTJy4ri+sKUovpS8TISJS77PWbyYAwibBy9qU4stERpVX2b1uBtfYa1acyEw7h6hL+DLmWl7/e1cLWJdk84uVAAHezTkCnW4Ho1pwvClvfcTT5Om4fTKV6ADN+ZMaosJ5aNmQcWX6QVDUIb8c5+r95h56/PrDDPGG0pfHYBZPAxGrya1DcksexlgCpY+IGgzmeNdSArDWcJCdzVF9g3R9SmPYuQw+C1cG/cSXcJu+bTw2fkGErHw5j8Ba5kVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqcXW+Nnf1aq7dVzfo+wa58U40/rJKbCb+qwkMh3RW0=;
 b=JlCRnNtIiz8HwbFFaHDSUJ/yNIHhw1BmT8WjM32tQeEBLqn9LhiqBVKQrtXrR6FgCLzyIRtAIiGLohsEIxipabrLSL8ittlOnXn4lBD6DdfSBC4u1S9wC81+XOWH84iDXU3GeBXCEDaudOlAoPlNrMGla9554My6oKI9JakC30LZhAvwQBEoJ/crlfM0DVMpoGXrRLWDcUUCOgrjpU70AuMWV1JfiTeMSuOBThOm80CUi4loLhHQWcHXrQPj7uJRO1zDGlpXdudLfVHCbPiJ0e2iLLlBvsCSa4GfXi++gwetqa95lbXBCF5PGGa05igGHO34BusH7O37UfhKV95dqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqcXW+Nnf1aq7dVzfo+wa58U40/rJKbCb+qwkMh3RW0=;
 b=ML28S5MspI3Fc+XtLZk7s6VxxPS2dKTvnqIJf+uS0QlZN4SsmotaepKYeEEkG8YhXSiiMIUvdQzCp0zjAxwfEtonavVD6+0E+CDWAgW8BRhgK8Qnj1m9HX5pmljuDe64sG5y+Xfs59IzupLRfnz4a6x8fuuS/kwObS+nUDXh96E=
Received: from CO2PR05CA0099.namprd05.prod.outlook.com (2603:10b6:104:1::25)
 by MN2PR12MB2894.namprd12.prod.outlook.com (2603:10b6:208:10a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Mon, 15 Nov
 2021 19:30:49 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::d0) by CO2PR05CA0099.outlook.office365.com
 (2603:10b6:104:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Mon, 15 Nov 2021 19:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 19:30:48 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 15 Nov
 2021 13:30:37 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v1 2/9] mm: add device coherent vma selection for memory
 migration
Date: Mon, 15 Nov 2021 13:30:19 -0600
Message-ID: <20211115193026.27568-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115193026.27568-1-alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4487eb2-b616-4e76-e711-08d9a86e6da6
X-MS-TrafficTypeDiagnostic: MN2PR12MB2894:
X-Microsoft-Antispam-PRVS: <MN2PR12MB289420708CEC861C00AB0D02FD989@MN2PR12MB2894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r86A8ayglka0xAizp6J8l1R93yW25fXL1GzwLhTjoz2k2mLwPH9UhkiQ7XoXO75U43HE7kba1aa2qUf06lg6CaTqrK4L2504SDne6n/zKRIO3EsvetW3+LuoTXCCSCb40TsBs6UkxCPMHSZNn9bU0AZUJAQFTCAUeO0n7qDMnl8vXmdTb6lHFM5yFRD1byHm4dRXF24tI7ujMpx3LSRBo5TTGGFhY9lm8fO5c2Mivu9qcQ5rv+gePTeJG+4+wvmqB+X/eaXFE2KgoRwS6fmgu6hanZdPk/ePio2f40l6cmXp1QVbO1RgQ1eXYqYY14B5HeKDrV84hg6Tmy3rtFAjThOhedmfSuPH51b7LgMOa605qO99Edr+oRHK2zCIYmJwPoR43csG/9XyicFE2rYT1OD0Nmlu8EkaBEs1pZuc4l+Ez7X41bKfvGHgga0xG/t8p6wdaMw8haxkdoPTvvsyCqgXTkFZ3Q2+GyxhNG8jYPfRjpoH1zY9up5iC1sxy/ZZ5qG0wW12ydugu/ku3IDvJMxgZCFJiyWJbZeEKFcZdsZClinV/tOB7OGrbY0bAdOVN7mlDTmegSX1TYxk8fq1Ebabv59pWFe+pFDmPD2TdxSSWxw0GJ3l9R+1GR/c+5fLKeB7XhXonTz173FSQtSuxLqfriRsvzmBl/sxuac2Cn7W3ZmyddxHbuIzE/Hot7EimAes4y65+/YWq1zTmys4d9oYdmG+81jFogDYdesb2TA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(2906002)(110136005)(8676002)(47076005)(4326008)(7416002)(44832011)(316002)(83380400001)(81166007)(508600001)(2616005)(8936002)(426003)(5660300002)(70586007)(336012)(70206006)(36756003)(7696005)(36860700001)(16526019)(26005)(54906003)(86362001)(186003)(6666004)(356005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 19:30:48.7500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4487eb2-b616-4e76-e711-08d9a86e6da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
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
index f74422a42192..166bfec7d85e 100644
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
+			if (!is_zone_device_page(page) &&
+			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
+				goto next;
+			if (is_zone_device_page(page) &&
+			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
+			     page->pgmap->owner != migrate->pgmap_owner))
+				goto next;
 			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
-- 
2.32.0

