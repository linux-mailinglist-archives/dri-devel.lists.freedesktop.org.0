Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72346A508
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1176E8B9;
	Mon,  6 Dec 2021 18:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F696E16D;
 Mon,  6 Dec 2021 18:53:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV+qFWor7OHD2Q/kFKPO94HDl1WsIVaw+bbJRwpgga7HSs+X4kctVpdkZLGSwy653+QyfwSIEkko8mh6kGfLgVoiZZXivAFZLWJQQPC1yzyE6ek6D+3OqRDgY7FrSaPBjdmcbg+7u+OtsIpkxBtk88lfovtF6lOWqxk/Yh6aywkWORF9Z4tq5gvDlxPGas7tVSjFe9xE3Nt6GI2Zki/0XbLOU5Ot6Rkm1sHXLHc6sN5CkSZ7lDKPGJfwx29tFUn+2ZO1X+kp/EEBjOqITnp4KJ+I7Napyg5GDkibLR0TKFLl0JpBLKxtpaWTAM843o5wdqWLKsaOUEugx+kyusfPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN4TZuTqTKm3s0l6VB7Pala5pjfNrTVsDcquCXNhKko=;
 b=mk4dZ+L2shHNlyRHXrl2e7D3HJIuTIIgN4kprAIKl2UMaiXDjMaKQPY5QuBhnGmHmnoc5Bz4c17jxzGLNrC0JZyG2rf3Lz0dW4xJsFWFnU8ya8Fcc9sAUm49Xj/OrqU7rpJbW21O99XSEHoAGdMf1rDlNHQQ5txJHVOGIKEyom6lT2x+DWpvk9Zcb15eMrqiU2eRpFpsf1oNuVwgZEL2/t21i8/MYk3cGzS7j+loEDoBuUBrepBth8APEk4bhQTI7zzowBYueGuPccjF3Py/B+8o7Y7eyiaSlHkhw/irShZD9V/U97h00V0tNRgxs6HUWRRKkBykS8Ht44zAwMscNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN4TZuTqTKm3s0l6VB7Pala5pjfNrTVsDcquCXNhKko=;
 b=ApOYXAklk/55JuPCJN5r5M+vCJTHm8NhaBb4a2LZv9kx6FsUUd1ADj+O9oy3K/6oyEe39HCWzH1onMJspFwL0EGERSnfvhKcF2KMuNwYA8mQ/8BirCp2Vs9XUswcDVB2gBqUZzOtIMdXaUeZ96dAnQRimBIeG1fzuU+tDatU3/Y=
Received: from DM5PR15CA0050.namprd15.prod.outlook.com (2603:10b6:3:ae::12) by
 CY4PR12MB1160.namprd12.prod.outlook.com (2603:10b6:903:38::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22; Mon, 6 Dec 2021 18:53:03 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::a8) by DM5PR15CA0050.outlook.office365.com
 (2603:10b6:3:ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:53:03 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 12:53:01 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v2 02/11] mm: add device coherent vma selection for memory
 migration
Date: Mon, 6 Dec 2021 12:52:42 -0600
Message-ID: <20211206185251.20646-3-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bdb10641-ec2b-4a8e-0d65-08d9b8e9a200
X-MS-TrafficTypeDiagnostic: CY4PR12MB1160:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1160A785CB9FA30BACE7564DFD6D9@CY4PR12MB1160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6C19BgRxo0bBTH0pjwACnstoFHPqGqngupRo+puvt/3gCYRVhBWDwKNWo7pKhs5nG36iox6VvLkFZlr1H89GuGchRKmgjX/lXJlbymugWanVvyCPSpRZFQl/Gr4GbKOhyDMnSJ9nUmUH9+fbhCkqv5ijqdfz4xwdSR6N4r3lWcQs5SIfP7dcQKL/lQDKjq4L3P2qmXBgEKz4OLbGUtqiYGRc1Khvb9+Ta1+Gm4eGGoQwEd/tpadTB1qcOb54/M8DpuFcfKQP4d1hhiAjXHT69RXi3iiVx4q1JVZn3FtwS43OoNakGx1ozv/gnKyOcdSc7VO8nY70wbgZvhbOE1Wbq3U00AwQcPIZltYiGL0ZnSwSJWQAqeTW948O8z8F0sHDoOwqmgNIKgLESuS/6TWmexJnT4DF1wKUg+f3pxgUuPR6Cn1nKunfiQVKgnsA9C9+wqShjUDUUs7oOsRIZRU5JNtejIvsLSV4LMGWbc6L0qnw9LFFlR8pV8XRugxUEZ7fuLOl0p2tAHW5bif4An5SSgMbSU02ZBagMwqOefYbz96fnOtAI/4iqrw0uK5YPa9kmD/93M5wzXBF/U0yfRb8iFwutKWoFsU9RVK0eRm1Cx/PlsYRnBeuSiij8mvUPmSTABtAIPEDjqAoCBpZSodPHr2B8NFA/GaU/zDwHrNbbJIvynk5dxuL61Fh4l/2P/iyYKHCdOoEFvEyROWqCLA8vdV4t0p4QYXq5IxFHBwCzkoN0OE5fKXjnc3jl/X1iLlnm6YVJtWTE+zkphmseZTIpIS5SmdRRmiEC8Knf4lrr4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(16526019)(508600001)(81166007)(83380400001)(186003)(426003)(7416002)(36756003)(336012)(4326008)(40460700001)(36860700001)(26005)(6666004)(47076005)(1076003)(44832011)(8676002)(82310400004)(70586007)(86362001)(54906003)(316002)(110136005)(356005)(2906002)(5660300002)(2616005)(7696005)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:53:03.3814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb10641-ec2b-4a8e-0d65-08d9b8e9a200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1160
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
index 91018880dc7f..0367f471211a 100644
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

