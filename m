Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D487350DD0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB27D6EC5A;
	Thu,  1 Apr 2021 04:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0896EC51;
 Thu,  1 Apr 2021 04:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPmqZi7YbBKMAs5tMkhQSnMwLOes3+DjVeGTswG8y1TgjFc45YOFUXJLNCT3ZMX7RtxypgVP4tqs0Yjapp0wEer7wIzUpe5zRYTM6HYAOwQiMm6pNcGdy7H/DKyqpsjA4Lm3JEVc65XCjQi0AaO79kSZf2b8RBd+niPiSgDKk29yc9g39VOdEX3h0CUi/53a8x5YMQmJSOK+6HOv/Sp3hNuLPqHc73QUqM7oOkMcvxCvxFexFuHwyJzu4f3t54XBd5G7mNEnTTxKAbtDqX29/ydFG69UrRmE2fAlUwIlQS8C6tSWE6UmIOxC7qUqGMrQVs6jBtvLzgtctPZLUG2UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmhTbfr52tpcoeUSjwGHcGWkQNYi6Gi4UC7Fj5TOWdI=;
 b=oNZORrcnZZHCw6Iiy2PQc3pkI6ggNS4nQI0BngUSoRWsSO0BaAQLeJYvAjGQeiWpjQ7VZDzW9bVtI8p0bqe0aJKg+tuZfMDYe6Dx38dIrTP1nyqNmeOT/zs3fZFkGtXBfL6ZjhhIPx0aScz8weClNCOKIe/Og4yH1TDGGNwz7fBkP6UH+2a2IzEhnYACxfDYLXbLCXDnGpYWtfGAZoDnPHulxWyW/pVJenUdVKKB6QoMjjeQ6H0+bnF4tX3MhrDoXuLtnr70Gf33TqhdX06g8RCCIbFUWQEbdMgUnobxH3VcotsoY3ZT9mRBpcOSS3hQEIF2T2HdqPCaY6fJPEP6XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmhTbfr52tpcoeUSjwGHcGWkQNYi6Gi4UC7Fj5TOWdI=;
 b=QoWV5r3b41vleC7GuuUh99cJJQbZFtJV6DHdiGVAg3ds4sEsXpFotCkBsiqYIMHnm9V+9aTqNIQ/puNFoEKWdmIIfzEV5pKSlXdZTTkVeuZCQ4DisH1zTqaB4HLGFzK9S1K/FkUb8M57mpZS+VCK+sYnxCV7FeLkgN5Hfb4LbSg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:09 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:09 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/34] drm/amdgpu: add svm_bo eviction to enable_signal cb
Date: Thu,  1 Apr 2021 00:22:22 -0400
Message-Id: <20210401042228.1423-29-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0706fc7-d76e-4ebd-c7f7-08d8f4c5dab3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222DB706E16790791819A30927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XTrFvVqzkBugR3etbCmcmMxuV7f7GleCQyWS+lMx6YgBeEHjmfx9DICv7sWFHMws8Vq/xZZXidSzNEn1WLHeEc6y5D6BaMiE9filr6l2LVXZ9hhWJTZKjcVC4LoS/ndocCLzNRZsc8AqcwZpUEA7jcrNcK6YBd1DkInsbxdBnVJeSBTKJAaLmQ6Ebsa+8KJBMc3nq8lbCm2+vWjZmO4o+CSl3kB2XmzRNaU5vcoIgL8wWYm9WyMnePd073dsIZzl5OpL8oI77ss2Of5UIrWVpQQwOVDo+vmdXWWTO76RF6acuvzh4cQvCmWOKRdqIij+6krMKiHtKURVwkU54dFQoZhh/uQet7Vk746RRdXgXsvRZisH6H0pg46L20VU+tMNQpZdzLWKcoWmKAyKp5h+DwLpjGUMasoKdiGygTROtH+YYijHlWLEdsIldPs3gluDtHd2rL+9DSWOnMTOs+Xhl+2MDF6rKwii/eegs/YY05vh92sKwF7A+eKeQMsrVcWai8WFl5wYv0xJQczjgRJVN5Q+tCywCqh7QtOhVtsT07LSBQKwAFQaosYqa9n9eOlMLcrfbDgZA7grV7RFoT7h/t/CT5Wu8nXItK9g0wtXdQHkP3dO76isxreqJLjLoivzmbNL26qKz31DvdgYuSFQqU5ZEYW42tLGmxd/05Vohk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UjjOIPa3WmHuIPct7b6tzDN1ETWOwBdVKGwS+IMlfN2ZnWhwT2BUEdybmAyF?=
 =?us-ascii?Q?DOOenpBpo0ADv2uoseZ6c1Fj19DIhQMzbskSJAFn/ufrxj8zNm2/jyopORxD?=
 =?us-ascii?Q?Beb2R2EWX4iBMqUzNuP3YjYJ6vH6Nw9cjnGlFJY/OwOVXVsvt/aL9uUSYoR2?=
 =?us-ascii?Q?LBJUDxBl99jzujv7ffHy2muRToBrw8JB1plG/ukf9f3kv2d84X3RmL9s+8CY?=
 =?us-ascii?Q?3az20C9TMMZIdqqBCKuBuPwdVB0n91vd/dwdp3SPk79keZv4XsfScpfSIbWC?=
 =?us-ascii?Q?SWpkZtRC4NTs9G5dYmxC1G1B4DMFYAp+ok/E5yy4qMjGiknix3DoRJtQ3nO3?=
 =?us-ascii?Q?sR9JZqs+t+giB4v4LHM7KmYweS2jPJkxREMenPbJC2yyXtvTWaZ0wiJ0yde4?=
 =?us-ascii?Q?T0E+j+oAr25M0+38vibRYxFH0sNWsWGMOBw3E5TGX4rX67XmYlTRry9CtWI9?=
 =?us-ascii?Q?XauRB/2JdGYAESmN5mWcF+g2ZtPK7JGGx0aUCntqXbB9AtnFqheo5G8Nl6Xl?=
 =?us-ascii?Q?hvx1goIz0Fq259zMEk3ntezyDRd1Tkp0AGXY0elryJZgQnp7VwRFHD5t+7PC?=
 =?us-ascii?Q?d2VjSRT7zpXCe8OC0RtYmxtO1Db6RzOEaf03WF4jIVkEKQJPf8f/J62p2VzI?=
 =?us-ascii?Q?00dUTCBJe4nxB6z/Nr2GuOjXkJhsMpFC6ReUbW8HIjziORbq3fsp47OkkyOJ?=
 =?us-ascii?Q?e5dndQ+Ho7LIZ3/BuZxQa/uiPeWHGBkeHHSkIukDb4ierjswPAmIi/wf43Ll?=
 =?us-ascii?Q?yphTdLPfxQWiyVdOrcaS33fn3znW0Iap2ySKh2la07e2cFKgmHTAwuLOIMp4?=
 =?us-ascii?Q?+D5ccb7dEZBKRTz4IQEtmoUrDWuZSpf5gtVY+zQ0MUDkdJXXN2Ceyqnbr/Zw?=
 =?us-ascii?Q?P7oQfN36YdDcBsA6tUxYGoh2NAliw28kMZsUF2SpaUztn/P+G276d2RxlDKj?=
 =?us-ascii?Q?3JdXgAQSV2UGnz4No9LXlXMiUTlqFQZVi3CudqUm0DuiqqbTRsghopjSQR89?=
 =?us-ascii?Q?6iU7im3vIc21x6Supg+G4SNkfdRxivAvYe1b0dy/CpLiDAJzVKynS7Q8uvxI?=
 =?us-ascii?Q?AumRMDMznjM6ATK2qwiihB7s2U8WzhPPAcOunLCpIMuKmTHjr2qA3wHqVX/1?=
 =?us-ascii?Q?3LZWBp7jHvBU+LUWQCHjGdC8tEV0FzVafMU4geRIlW1EwCOymqkN4AARlJyG?=
 =?us-ascii?Q?Xt3pgiY76ah+tQW6x9Ybx7kOzOm8w/U/4H6zb/ENjgP9FLUO3RCMNxdYwBgq?=
 =?us-ascii?Q?nlPAqCQghHDIDns3SZEGfLnU3ANAxqOBbJldXLdUP6nVydZyovQF84BfWm6E?=
 =?us-ascii?Q?At14gG8hhLm/NGGeASm5Qvww?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0706fc7-d76e-4ebd-c7f7-08d8f4c5dab3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:09.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCH5hdXMJ9/ztxfTnG2+Gd5tvnAdSKgylCXTV3r72MnkCZRlD1pzkPHTsnUpfqEN+QTT5C3cI3Vx3j5K7mvSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: Alex Sierra <alex.sierra@amd.com>
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
index 53559643c712..1fe233cddb20 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
