Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC74A4FB1
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 20:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C7010E3D3;
	Mon, 31 Jan 2022 19:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFAC10E38C;
 Mon, 31 Jan 2022 19:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNMLpyo8SDioMDh9dCwOdBqvECAikg/N99PGQVYu7bDdIHMvliAOK3X9l1ogjGAOXJPpX88/YBtEWS+RVIPm41NtqGBVrStva30tjV6gR/ILRY3Hf8jyQM4p9BKlYK+IT9KfJNPnQ2FBLuqacqsKR2FJj7fksHgo5hdfKjtjLUGFXYy5mkecb7ji6Hq16LXC3ObR74nnSfIbUFRlsYJ6uyr70+6MMEofk3rcseqPPEwJ0++6IGZUAi6u0jAEzpgBBV6yMmuSc89wns7d0j794ck/LIPGs+qokE9WFVQnsiRB5mI0usD/YQAKuTgfhhYBGbl+N8CetGTy0XM54mk3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+YaAMhQyNsAqVFJAT/Ctx16/U5d3CdfKVLSeHIp9i0=;
 b=ejMsyNMDqqAG+oAdN/EUDD/UCVMyjxPJQGQukjO6BhRGluMQDAveiHfuNIT1DO0fFaqbL1+L9U6QIM442m4BfwGgGdGbcFQYpMcTlZAu97PNU2bUvqdcrBMEs7v9fPJuQbyr64/cFdf7O7Kqa5pERP37QcBDw4Kd5Fhr5Q84XfvAgw6Gh4sfPNjv/DJqkkmsmBI2i7GeUUC4C2fMpPuFCo+CAUqE/4Baoc4kb2qhfKX+R7v03zp5VuRFflpPqrWAdCjFTBXZokrn7ghBo1ypFB27j+WF6y93GQchq275lk/1qef1W5PLqDFZNbqy2XMWt3CN3uvYQtnbORpAzyiNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+YaAMhQyNsAqVFJAT/Ctx16/U5d3CdfKVLSeHIp9i0=;
 b=R1FIkcb3j922mLTCmHHtE0KaZRyrHTWGiG73cjJA3FW4nzSw/YNCQeCUIFvKrp++6BkTUIZyLJ8longVN1rXITWURbif9atiIVxmoyiFRSH8Bf4fUUOOYpSwWi+HwpnMNGcyAkYE1edpf0EJq+E0sfswUdERG/5/nbWDKbE4Shs=
Received: from BN9P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::20)
 by DM6PR12MB4636.namprd12.prod.outlook.com (2603:10b6:5:161::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 19:48:38 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::95) by BN9P222CA0015.outlook.office365.com
 (2603:10b6:408:10c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 19:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 19:48:38 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 13:48:36 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH] mm: add device coherent vma selection for memory migration
Date: Mon, 31 Jan 2022 13:48:13 -0600
Message-ID: <20220131194813.31779-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-3-alex.sierra@amd.com>
References: <20220128200825.8623-3-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2ac444-f5a4-485a-7e60-08d9e4f2acc6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4636:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4636CB1D025867DD4EDA4E94FD259@DM6PR12MB4636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bcnZ3U3k6FFAUOiho7zeXnVLD76/+elJmQmlc0wHpdi5pW5Q33dBb28mJr6lM2ClakUeRuTGKBoJKWL+LqIWmPLplhePHLGgK2PoGfuc2IQoGAJBKQtIbt1Qa6QtIwFoEPCMq9FmXNFJQxTIthiycWin27FLRRoWyQXq/KBVbx212ZZDCM58tYEyGtiLrCrbLbh3tvr8iGPNeap4JR5c2c4KKUB3x6YppgqoQ5XkQEqNRsWUCAwWOrUqHwNB/NobapcAn5FbgJzXZsQuFpMn3M6Wis7bxK7m3TEp2h5PGl/rjdqf3RnRXgvq8W3WaCuweRKjtvyj8zWyUys47Opvw0Gfn3fVAL2lT+vZ/0D/8JcLgeNS0enOw9VwKM9lyYTWUG+1qtu1dGX9F0ZenpouKsKeyCAsII23rULyyOyPPhpY/v54go3B5LiqWl11nRPTyaJNG9GnFvREjSqvOWAaKMiJgeb3n7IjCyBlInq+M7kBSuGNymW9X3qH3h4L2Gewuk0RBQyqzjWyEdjGk2dw5XvsXbIsDsf285YXNx0ZWxdAWkxJIZtQ4iRVoJBeaFEJkR55MW3SNhM2DnVEgOxwniSxVF54XhXUn2H77g+1ETUehZuxkUWs5pTOKg4iCOSPM9WiIMohrq8qNz+J9yEQyU22iX/WYBrxycn8qf8TY5TK5RzmrIH8GX7mWlZthUaUHCGeKzv0rbLOti3DY0EuJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(44832011)(6666004)(54906003)(7416002)(7696005)(1076003)(70206006)(70586007)(26005)(16526019)(508600001)(5660300002)(40460700003)(2616005)(336012)(426003)(316002)(186003)(110136005)(36756003)(36860700001)(86362001)(4326008)(81166007)(2906002)(8936002)(82310400004)(8676002)(83380400001)(47076005)(356005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:48:38.0762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2ac444-f5a4-485a-7e60-08d9e4f2acc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4636
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
---
v2:
condition added when migrations from device coherent pages.
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

