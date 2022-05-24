Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C616B533165
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF68F10F28E;
	Tue, 24 May 2022 19:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273410F1F8;
 Tue, 24 May 2022 19:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu6TjzO5zfxdF22hYV2QBgLVmFJgcUDwIE9eMQQyLCU939ppI8dE2BiidXIH86EaIas2QdG1zpHGv9oyzbzfwXOPzgjnBGs4jaE0TSs26AAgcSzDTy8bC2jxJVFhBS833V4HywomVlEpZMKtBVhg7d2i4vu0Iq+JkPxB0+iUsaVKiXN++MihGFfeeNKLH+vJbByf1/qC9ZHO77rP0030kPlHemaUInNZIDafWQbt50PBwSCdM8fzcSIrAnetXgXi7ztXmRpqeqUEZ72LhKlmBlHrZke+/2mzKBDG/DQQDl3xsjgfeYCGDhiR9DKH6NRvyLJnJdED2FYBlICQGTqkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=YLHdBvN+/F1vPl5f8C7F44lWIYu4gyFlbbe5oVFq2fPWcE3M4MTcMRJU9WD++iAerSBftPeOJIWkEzM42q9vVgyl281+RP49esJtnHG9l+NXvGCUcTPVO6sdokQyTFt6OrTs3f6oKbLpDZey9+Ja0g4zpwXsucmMFcFj3pIeVbDPxgmEz29vAr3HXSzmDmBAzQ6sKVLsbYUPjhmDlk1AphkoX5wte3KkZyC2CU0Zzgj3UVq0gEBkuWuX0GFUcjAxYM6BV70NKPDHpdOLd+FDdS+3dKdOYsR90UwDBTFaaflZP9r034yHz/MAo2jS5W2ksm7jBxPmsSlZN7DNB8Q3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=0OhBwbKlHpu6Np8bWWVYghbY8JlUA9VYxT+JPXS/x1INh/v/XaOmZVI2y0NqmnaHkYKBW2MKW/vuXTaiICvcCx6HWF8IhatguYd+1iQJZBhriH9eazBhcwZvP8ot3dyU8bt2iT9lejR6rqAwotBxFXlDTJKXyFDJEyKwSNWdY1E=
Received: from DM5PR17CA0058.namprd17.prod.outlook.com (2603:10b6:3:13f::20)
 by DM6PR12MB3417.namprd12.prod.outlook.com (2603:10b6:5:118::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Tue, 24 May
 2022 19:07:24 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::8) by DM5PR17CA0058.outlook.office365.com
 (2603:10b6:3:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 19:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 19:07:24 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:18 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 03/13] mm: add device coherent vma selection for memory
 migration
Date: Tue, 24 May 2022 14:06:22 -0500
Message-ID: <20220524190632.3304-4-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65c8d27-6d89-4695-a847-08da3db8a2ed
X-MS-TrafficTypeDiagnostic: DM6PR12MB3417:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB34178CDF987E277EB37A5889FDD79@DM6PR12MB3417.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17pQ4SBU8wbSGlHhFaZz+QIbTnwyfCKgYnzwsWJfT4SugeepQaBppQgfyNJ7j077U1w4a/zB7pnZil2J/Ww6PXitZK2PpmQDuJv55ZK+sVR3/3DifEy+RHs5jxAQcaCbPuIhGX2WF4KWlURR3Oq7D46+Mam5s0LvVBzUnDp+xqwd0swDmKxtd0/flRwFEkoln2zOh1KwEOa3ef8JSHkzNQI/ABe+mBkNunKZJ4X6vPHY9Smmnhjs2AwxiuOwBZOWjm1KNDQGwFoMskInsREV3hxMm2iJwro1orQSurItDELqPuqTeR3H4jyp6gfqmpT09lwkOEZIVN7EZON3K2+oUrFiKz8N+fvOAotG4AvtShJEJceOFaQxpDpsri6uqnzJsLqlnW2Eb8fUe1PqGLAAjmB5PunDwNCL59oyBMU1wMxqVdU3CTm+QR7gHkto4x4zgzPJ6mufk5NJgGJIScWPu5D4WT+0Jr2IY0ErEOcYUrSJhAQFIdAs/we02QVdkEXfa/ctYG6hMGZxiBkrbvVZNaAoAw8A67K8zw0Sq8x5MdB/OUalMc7J5D335nEEH11Ugrd2tX1LSnJY3SHCB2wJM+wWaRUxNbSyS3J7IBAxifO2lla1Ns4t7bxQitVq9SiFNEQC4UNhX01RIswtXizul2s2Mu/zod2otYK5z5NTwgbI5R1j78hVwzjkK385KHWKQO4xEcg88U4i1gJ62iqFGQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(7696005)(2616005)(6666004)(16526019)(26005)(5660300002)(356005)(8936002)(1076003)(7416002)(186003)(44832011)(81166007)(86362001)(83380400001)(36756003)(4326008)(40460700003)(316002)(82310400005)(426003)(70206006)(47076005)(8676002)(336012)(70586007)(6916009)(36860700001)(54906003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:24.2013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c8d27-6d89-4695-a847-08da3db8a2ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3417
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

