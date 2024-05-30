Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EAE8D4440
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 05:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCC10F215;
	Thu, 30 May 2024 03:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IDse6Nne";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0FD10F215
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 03:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4M/nTDNAxwTexmpC+C3Vh1xGJdF3kEM78F7DlsanAdmkq2J5wKIUb1cah2e2HeBFzjSHtssNPnkq1pJPcuD2wmFwzO1mxyldSuCq7QChli5L2o7PmAr3Q/Oq2NJ984U0enc5DB6xtTdFThnO3KRnmroROolE6TZ3OTTuxVlsDqg+mTsynIsNuhjEidw5+hN0oXYgpE2J6rt9KvrINEp2h1qEDKFi1NZx4tKU864DD75xzfZ5JmGFVvZXaujPLEZ2arug0/V9+0wF+2JbSXGW9dSvwaXy8imlQUvWk33JUxWapR/dj/9fSCuODW2mnez9duklpU5EJjLjoGsOtTfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5ktcI8gAVTUZZELD7FMAiEbNqZaimNqkVJVRWSEI5M=;
 b=Eat+RWa4zPR1CcMTui4mSEIJ9wmGKf3RBqoD5iVP722bMloDS5rPhZHjaYrkHKYnMXBYxB4/H7MW+J9Hq7fFS7uu/Vpovrfm8C00cElNpaVi58FRhsExYIi11NXQwnsAhnGju0hkbIL5BnQ7j/+7PG8LbcIybF8VFdwCf2EEddx9CDf5hy4RiyOeqrKKrF7yFg2Vp85Qf3GSEpyEXtMKUYCdwStjYFnBJZ4Fx7IA+STNeuudoPIXrf7bsY4kqapFI5EamodUfAgobAeyHA9zxV0FEU8ElG55DNRxOZHzcI8NmOSmsSgDalTxSG5iAl+tyy6WDCR3JdDO8LLX5SDzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ktcI8gAVTUZZELD7FMAiEbNqZaimNqkVJVRWSEI5M=;
 b=IDse6NnecbkqYW0+huoBXF/5nothV5l64x3F3+12cMIfhxdWN9VwHNmlRfgG1LDpg2ef/a659id7ZsNH/UteXhZvBxTcytWlbEzEtxj5YgPcX5Xy3EdxSsNuJf73oCyPonOipZ0s8YRgXa82zm/y2k0N9+maytocCOrFt74I/Ak=
Received: from CH2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:610:60::16)
 by DS7PR12MB6312.namprd12.prod.outlook.com (2603:10b6:8:93::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.19; Thu, 30 May 2024 03:41:30 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::5) by CH2PR14CA0006.outlook.office365.com
 (2603:10b6:610:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19 via Frontend
 Transport; Thu, 30 May 2024 03:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 30 May 2024 03:41:30 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 22:41:28 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <ray.huang@amd.com>, <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, Zhu Lingshan <lingshan.zhu@amd.com>
Subject: [PATCH] drm/ttm: increase ttm pre-fault value to PMD size
Date: Thu, 30 May 2024 11:41:04 +0800
Message-ID: <20240530034104.338561-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|DS7PR12MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b94545-b89c-436f-8248-08dc805a64a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YjJkKL3b1s3Ft9dlRzGZwa1ECMW4JMOq0eWxVBPKG5jKiKk81QOPb7yDPKI8?=
 =?us-ascii?Q?EniBaKE3T13ZZWeicNMMM43BYwN0flluZwdzTp3n5+aMMqYrUtqSYiqE1i9w?=
 =?us-ascii?Q?z5ax/Qmj0KEMP6nrU5mMUiWovlASTMd/nxKTgza9wGBbTcHkcpA3FXL2DVM2?=
 =?us-ascii?Q?fW3W7rvzis/SxA32t3CKMT8RmfpWqZRSoorZ2cNmE0PNZHos6eOPx88h9anr?=
 =?us-ascii?Q?MEP1JOmaOkJSCUPRkcgqn5fViKbkpitLpbsjBuIRIgi7oR+eqyIPqHApNHqk?=
 =?us-ascii?Q?ltUNF+jUVwl07yfKs9zonEiOVQeYLAvt8t7Oq66H3CIqV3B34ZV31xM/Dd8w?=
 =?us-ascii?Q?ABAhGzBjxicTFAABfyfXETewdXHrLW2/DOG+34+Sx+FKt3YeauRIma3Py7Q0?=
 =?us-ascii?Q?2+3wkvGAwMRzYRBs+YX25nbYNo/owfpJunsCb7aSa4ZhPayIlrLC6H9+gMRq?=
 =?us-ascii?Q?mHdHsfx0gM1DcPQiI1g7CYMqR85e7nAvEpkBdyJmZrbRIGs48HExZi08ppC0?=
 =?us-ascii?Q?i5K1rNtlgI/iMI6XsxcdhGLTsHqR/E0b0ocDrJTK+8oleSLF6wCi5BIfkFI5?=
 =?us-ascii?Q?TWG6udNpYVyiKDI8V4CK9vH5SWUFr1/2UfVAMeLPkMrJZPTveEy4/ZR5yD5f?=
 =?us-ascii?Q?srekzkSS51nlpY0dVQf7RVmbw0/lRF48xjjrjDZszHzYZoD9uJIVHnxNQE9Z?=
 =?us-ascii?Q?qcK57aFx+9OJso5HOzCKTJuK28prM00KM+Za5cNGmv8y5kC35RifOu7pKurc?=
 =?us-ascii?Q?iWKb1GGiUbwWoBOR0M3NAKyqQeVps4TfgGfXviQaetSxxh4vuLBQLMSohmUq?=
 =?us-ascii?Q?+thf1E8Hq6kvSAu7cmbeozwVmgQBL333bzqDtc1QcqmlFFkqJso5sO1pPF2Q?=
 =?us-ascii?Q?dJkuTZBhW0TemRGFL1BHyk71E6XA6JcvtnIXlXneLUFnSc/wat28+/6USnOt?=
 =?us-ascii?Q?GOssK9TcnSKYE/7u6aELLeZz2Wm8R66ndl6iUC5R1x0GDIdPxgrJDTewhU/H?=
 =?us-ascii?Q?uIDJWxVjqUqw8wB37Qhe7QUhLx74pYt43zrYhpLzAQoTRons/MPNxOfwahOH?=
 =?us-ascii?Q?i0YCFeOYC9xJL+w5FdDK+xmq8KHFCxFKhmWdIOw4ts/TqEqXF/J/8Wfdgqsu?=
 =?us-ascii?Q?cPVnSIZRAIhcq/3k1XiIRUZ+A5+shDnYE47nss1jXcxseMN3I8Ra8UC9aY9i?=
 =?us-ascii?Q?P4O+bxjQDG7D2ZLdG1wms2VWws1voU6VA1Uv3NAQ+OIyMvkbpQDRwU/0/+if?=
 =?us-ascii?Q?+2XeakEAoRAwIpDkDS1VKuN9WSWD7z+d2CEYHnI3XNCEaID+gVKW52dbZkWq?=
 =?us-ascii?Q?vk9Zmeb4SbV4GgpfL3NgfKOl1oYbappHGlKzrbwSZCIZLdTcrwqY5cF6z4Fo?=
 =?us-ascii?Q?ejt5joHRc6tXrrckTJaPGX0RikR5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 03:41:30.3385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b94545-b89c-436f-8248-08dc805a64a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6312
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm page fault handler ttm_bo_vm_fault_reserved() maps
TTM_BO_VM_NUM_PREFAULT more pages beforehand
due to the principle of locality.

However, on some platform the page faults are more costly, this
patch intends to increase the number of ttm pre-fault to relieve
the number of page faults.

When multiple levels of page table is supported, the new default
value would be the PMD size, similar to huge page.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 include/drm/ttm/ttm_bo.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3a..c20ef44002da 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -39,7 +39,11 @@
 #include "ttm_device.h"
 
 /* Default number of pre-faulted pages in the TTM fault handler */
-#define TTM_BO_VM_NUM_PREFAULT 16
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
+#else
+ #define TTM_BO_VM_NUM_PREFAULT 16
+#endif
 
 struct iosys_map;
 
-- 
2.45.1

