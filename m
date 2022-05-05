Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35451CB12
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405A10F910;
	Thu,  5 May 2022 21:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2072.outbound.protection.outlook.com [40.107.102.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F0510F905;
 Thu,  5 May 2022 21:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVJqdS99E1wZ/fYUQGXYDxkim1W89LAUgTZWkCp+uxKypjJFtHmgaiXXrwXdF5qVx4Pj90328CP/46UVl/X8u1q4LkhrsPBfDFsd4jSm/+yDkFcNqZCO6C2ByJWcimeSSPikLHvNzfrDQBYlFXbiq4wOItYXLkBMcYoC2eqXTo9LAGxn0Gw/vSnzUQaKg2oFrXVgE79ZgRie/lHhtqYwc7amZZ1ZWAkS/hikKoANATiYTaYgi32ISmBeoW2YNDe4EdTRDnSXyofCVqHWiS1Lw7y2TqWcOxU0+jGIcV6klV8/9uR+YHXQR/DAEhnfejeRT1zJ4HhOghCdCsVhcuNiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=YkPFAi2Na6rgBG42PT47EFBBwKkqpZfG+wwO9dZo+awyCaXg1KD+1IIRWjorQfDjvXQiMSMyGi9C0TIb6m+F24mirSzjBCc1v0f6APXUDdjyEjOhdYYxLv2IcTEdAA9UJ/lz/PkzykIFJaGg2ikvJGLVAks2dP2jCbdLvFw+vTPG5RthqKueibI/GvhrWC/8HWjMbZoVFZT+pc33olUTw3caSKhSnoCxO6ATtI1jg82Km//UbkRv17Jne7tQOmOrEKZv0fYn7vewhwn7FwnJk6sbt3dsNBZoftZthi4mljOWIhkHpe8/MAsF9Nj/pDZGNstPtJzOX0Xb2KPd3hoPeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW0Kci1BxH/G6MOqRePi9dIvH+J6rgyknG8pfmabAb0=;
 b=TGcc1AwLaagePAHbESpUJM4QbC20l45dQ+ISIULHbsmRvMIzfPKvAZpjeG5R6TymhDD41ThQEBJwsu9mXhQz22zoLBcIHmU+betfK1pnJvBxKETeRfSdXjPTlRXCduRuI+C5HNKbFtSEcxCnfREQ9T15lbVuYJv66awWf8PBpsw=
Received: from MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::24)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 21:34:56 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::e) by MW4P220CA0019.outlook.office365.com
 (2603:10b6:303:115::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Thu, 5 May 2022 21:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 21:34:56 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 5 May
 2022 16:34:54 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v1 02/15] mm: add device coherent vma selection for memory
 migration
Date: Thu, 5 May 2022 16:34:25 -0500
Message-ID: <20220505213438.25064-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505213438.25064-1-alex.sierra@amd.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e4f8a5-72ef-4318-c8e0-08da2edf1960
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB43678582EFA3F94A0A265F8AFDC29@SA0PR12MB4367.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oo2Sw0eIgGIKOwOZ7KkTPCe7Q8JerGkFJpNWNgFTi3AcEpdjWyzEzv7YHQrdI4+abpqypkbTw05/F3/If9AX+YCMGFpCTxAlDiP/zXlAp2CibRw68LlOGoSHFL2abtrBwNaTGK8WJl5ksXptSEayIlWfUedu6Lu7sheDjbhIwbys1w+dEacrQKSMy8QK0vMdCKFN+5gwRHEpIy2J8aM1i9u5D0TenDn3SiLV2T1djMZl6bpZZOgE+c+WZ1XZDxq5B0yIqUiESror9e99/wNP4O6K2s5/nIvRRh5XSiKrFwR6FjPEcVclidDr9GTq5z2RzB16UCp1VBqxOnrqhoWeuVbmuVts70h+1xgAfdXIfTc5IyFr7UiwQKWg8ZD0Fi7De5an+uDNSP1GXg2ofFH0+jEGxlpOhZAaw4Ee3ZGrQMDldVE+DPG6hXZSNyg9+WDyiDML1R5JkRWaVgofbu2CQogIL86yJYQxdyWxJbafciJofaibHN60OxKM2o+t3r5EoaivMVX/m88wW0n29qDa7Axw0IyMbqsmL27/nqTkaEKlKjuiZBCAER4DtJDClieNbLR39WnMKnTb1r4FB6jboKF2NK67GIpX9oyDC3Sl6qucGJQht5jvRqZvZzGwhfn95HIUJKG/m0xHOn9i7mGx+PUE7pxDUP5IK1dMVkDco8NfA9SR/DS1EdkSXNki80ukBe2N4+RHuhc8FFMVcD4pYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(186003)(1076003)(47076005)(2616005)(16526019)(336012)(426003)(81166007)(83380400001)(36756003)(86362001)(36860700001)(7696005)(82310400005)(2906002)(44832011)(7416002)(356005)(6666004)(5660300002)(54906003)(6916009)(8936002)(508600001)(8676002)(4326008)(70586007)(70206006)(316002)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 21:34:56.2985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e4f8a5-72ef-4318-c8e0-08da2edf1960
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
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

