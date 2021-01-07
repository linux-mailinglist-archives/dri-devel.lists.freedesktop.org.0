Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633A2EC8C5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECFC6E3DF;
	Thu,  7 Jan 2021 03:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0846E3DF;
 Thu,  7 Jan 2021 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkfCW89q9xapNSHITfuzegW57OnxFKEm+Bspg+lvqwb4dAdrqCqSiFytyPT2U9SVN4HJ5IOwBIZwJq+SWCaJS28LFg33FCxvNNQw43LGcOEnxwpsGBaAvoQltQJVeNT+jvxOZ0yU4Dk3w+fLTD5jnFXYa4dmj6k34ZODVevQJdRlGvJXEo9Odn5RpP9FIV1X6ucjxqNpy0fHNGyeZDkX5K24WykbqZpWOi60Wx4B+wh6rA8W68oF3aiw3+tvFv3xbwRXeMuUEmD+7HbQvWJpszPjCIz8tqwUkr+ngQqUtE4QAnWDAEujX5C6AJDPLXHJIRO7DLs8dW2tmFouw9L3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyFKS/T7D7oQcgZ8EuyLEf6P7RzWvjwQMD6FU9iPzRI=;
 b=FVsDH3PtXZgwgw5/AM5DbadlWb3KX6CpGIqhr5ifW5liB/aKm5VTnEOkYxE1lRgHkVNILOaSK4GyYCtH6QJVtwYHP16tzz4ed1a1t6wZY8JR7fHhGHFqOWSh2EI0mzSpine3xQ4WExdZICluyCDGDqO/k/9JxkXXIPUbmA5a10cAYVn+3aRwiEjJx/ehsto87UQ56+9RsCaEepynC1f4bGvo065KY7Y6Y/cMpJFVek7FYlyi3ARL4CMG9NpR0vN+DKF5mcRbzGNLu3B7xI43CwOcqObiNSvvXL1hw7L3IFYUI5Gy8ppq+3F+RW9+qkBS6zrRKUX8ey+fZ1qNqhCE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyFKS/T7D7oQcgZ8EuyLEf6P7RzWvjwQMD6FU9iPzRI=;
 b=lDNsV3vRwuZVQR04SCgd/7rHJSeWXdvxcB4gPLvIcCdjkXVrNalY0kARNqWemqlzzTs4REiAPmCJaNliO0tRPCbFVahucsaOyydgPLo2xeMimuRmqzJTJHBiYCE2vKylD3oQKLYvmgvn4v7A2cCqYndhQXNhFHWoLLB31afSU6E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:35 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:35 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/35] drm/amdgpu: add svm_bo eviction to enable_signal cb
Date: Wed,  6 Jan 2021 22:01:22 -0500
Message-Id: <20210107030127.20393-31-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05cf83a9-ab03-45a4-a2f5-08d8b2b8d30f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408F3FC4C1FE915079C837F92AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDOFIgKWsnA648GoG0v66QBOeF6MsKPR5RpQtxWMmD3+VnhT/HXxjqcxrnKfbZtCUVTJT53KcnlPsWMhXDqwiigoeCnxIqmJIXDJDuL7NitmZavTHGe2NZ02ap9AsrmeYTUGA4koLNHfuvZfzXrLgboBM2uuWbgRPaPwSKRWQwk8XGMFHGUICAyx6yxFcESQYMRGkomdm58axOJN3hz4upEbM46574OBuPYlTYM5MP6EoWq0qFyKHw9uuHoyrJew80MOB7VJlnpafo2OsyNjnSlms4LDCIQRdsSSppAbvAG3KJzwhZETDOwaGtDWQIQg4mgXY8iEFJKXqc70kpfLLaMqP8Y1U4bng5OrPdtpvKZ1T3R4RMPbjmePif163Yruc0ilwcM9Tq0Yyru3+WzdYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NVxCGqaq37jrDL5dZNtkzm/aA3DhwrZ33TdORfsYVOIKPqO2/Uc4jlIrBXRf?=
 =?us-ascii?Q?W7bi5Xc/I5rENpnSIa60cW3VRQAaq6dxIGZbzxuNE77HsH3YLX65Wxx9il0C?=
 =?us-ascii?Q?V7R2I2JWgUHe9yVSeECsfHMHowyr+CVBCy/RC/xZuynznKRh4pZfN6cIokce?=
 =?us-ascii?Q?z3GnSfcEsrS1TNfnNfTJ0LQuCp/FVtZ7GOVxXDdlEa5ZxWlx4Vv3rl8ATSMT?=
 =?us-ascii?Q?HJVCqlTWcCo0mYkZj0iSpZ4aRpc36eAIGazU9bfV77TEwisHpshCf91zZfeC?=
 =?us-ascii?Q?ALMUocHhNUwr0G+5mEMXu8PeRDED6RTns2CzazQE8O8Ttt8gdyV/wJtqa1Up?=
 =?us-ascii?Q?2OGEp6m0E8SxozQkB2VgGGAAdA6UaYmVZ7aOxcF56MSJFxN2qeYUfFBs1qF6?=
 =?us-ascii?Q?C4Ytn72nWdFWaQsnc95S9ldwYr9khoeBzEXss1uCsFM+kaYVYFXqF4GTysBR?=
 =?us-ascii?Q?bkArJ6HKsG3IdG26gBKCINv2lugs9z2Vi94KWT9Q046RHJw7jdCDyn/mp6T9?=
 =?us-ascii?Q?2RcEV5LpMwywm8oOQj4/AO874legF7k1A3JXIWipkDLkQe7ysFK/0uAGfq4X?=
 =?us-ascii?Q?LXpNIw8Dc6V5Q6BtX9fSn34YefFxNs8OCrsy7UCkSCiboyqRu9Ajm9vFRN+g?=
 =?us-ascii?Q?FUhG3cna0xWcj2aTNtgoYrBanF4OIBrRHgl0LDwhcMtj+72BCFhHEVMXBlHK?=
 =?us-ascii?Q?knNyh3aQERU+29MSGaWdeavLJQIt/J52ei5KGf/tEZBfSuqEktk8ZNaIIios?=
 =?us-ascii?Q?QTP70wyKuFbZRh8oWRacjIjRbmi9GVUMc8lu9JSjj2itCv5PjhwgGnWXCCVX?=
 =?us-ascii?Q?vZxqlsv1yzp+3yrsmhoUQKsgrQ/4lcDvMaZxg6x1epfofTpvheLcFTQtNkBb?=
 =?us-ascii?Q?5tOPIeZY/j4YnCid0Mqo7m2z+O7bSFz2TWCIKqwH754IczndqTPOQBtdctpl?=
 =?us-ascii?Q?wcLV5qsU9c/c+iO00q090eCWqyjFvyWfkqdAkYLMGwN4/rLO68Jw/nfA4D1Z?=
 =?us-ascii?Q?2jpG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:05.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cf83a9-ab03-45a4-a2f5-08d8b2b8d30f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pktef1ojWBY7YaVx9UKVLjFtAuua8eucqF25e2mHq+jxKOscQ3UBgGu53uFbZzJDSk/d6plabZGkj/NJDkYb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Add to amdgpu_amdkfd_fence.enable_signal callback, support
for svm_bo fence eviction.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 9cc85efa4ed5..98d6e08f22d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/sched/mm.h>
 #include "amdgpu_amdkfd.h"
+#include "kfd_svm.h"
 
 static const struct dma_fence_ops amdkfd_fence_ops;
 static atomic_t fence_seq = ATOMIC_INIT(0);
@@ -123,9 +124,13 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	if (dma_fence_is_signaled(f))
 		return true;
 
-	if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
-		return true;
-
+	if (!fence->svm_bo) {
+		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
+			return true;
+	} else {
+		if (!svm_range_schedule_evict_svm_bo(fence))
+			return true;
+	}
 	return false;
 }
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
