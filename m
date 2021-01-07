Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20502EC8B6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F56E442;
	Thu,  7 Jan 2021 03:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1A66E40C;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fotA772tOTRqZgS0X9deKfH/f/gYw5ahBBoijPKje6qnynf6kYapW2RqIAhwdT1xept2dR/soNPWFWwRr4Wp2oRZJe1VZg0FxL7RsTeU4sG8R9WMGGV1z199jPxzYOLeu4DyFNvl+boZD5pqKLH2mXxzjgkvMhBt2QaDM6YiDP438PlORvyCRBt4c6vuKAip53v+4wYzTPMLyrlFeX1JyBo7Hou9RSAHdipRo8rLFAEolcoICXiMCv5eEvwIhUlf8GNgXt+dZvO3EJcHD3sqi4Os02qpHTsQli0WZCD6traVjaQoVc/U9AZPmF6hyEpSw8I/Quf4RgPJaDO50tt+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorfvLTiZghsHyA5cKDGWmdKVmXVLKpKGoLF/1yWkc4=;
 b=AebaJMykw4u6OjSYb/vrGRr0uKV9z2E1PjflDbZsMZwfsV3JhsC8EpXKhCB77B3JsJ3nB0L0sWb7nIkYoMIv/jz1lOvI8cLGr23GHBO8ce0UaAKT/OEwTjpy4swBZvPn55JGOIGdnW1jwM5I63PKhv7rtuBL1jIiiJjtEqa79NWwRxi6ZQlM+6EVEcTETkhb8QWHfKVn60AbOBoRmIc5Va6qF8+h6ITG82xh6p4DHRyVQfn6fpJb/+flV9DIhfK0U6Nmnpgyo1Em+wzcF9mTIc7wwTUpshy5JvHFRuFR9bB27CKaUrmbfnqwBwPi86b2AhfrFvvnULq9wE2C6TTkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorfvLTiZghsHyA5cKDGWmdKVmXVLKpKGoLF/1yWkc4=;
 b=zOpnuuMLmTnhC5VCLH44mU5av/zfobGd2cM+Ke8KDCNjvqmkubU8LBH4twTxdF3K6ONrQjRJ2Do7zGfD/YJ1eFkCh1nHnKlBV2jn0Ay0QWQXT4rvmbCDyOGscawIEo7zZ3kdaRxZEn5NUfbyHD10zmQScqgI0IWBjoOZrDZpIAM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/35] drm/amdgpu: add param bit flag to create SVM BOs
Date: Wed,  6 Jan 2021 22:01:19 -0500
Message-Id: <20210107030127.20393-28-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72ad2acc-6b9a-4eae-b0ac-08d8b2b8c01a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44082ADD107EE4ECB4A10F1B92AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYz9brqsozA+CLDbMSh1Ek5FKaAti6qF9taNU/b8mnc4pODKCnJFvXJugCbU3I+Qlimh1z6ion6upSuNs3ynBPmDq8k7YNSClUkxfZX8vcSbtQk4zj05KyuqWCfHtJKZAD2QnQUV9XjTWwQVueOAnyVkFMUjJo0LFFOGps0Gurt8fI4QXBLIt/LDh26jhslaQyjCSBkqUQvC3fiozju9KN5d47otm2ESYT16M7eIdiI9ZU0cWUGQGZLabNZQ3yMGD+NnB+TP0O07UxeI1G/JVfdAErTRWyX6g+B3/kOg2s0/lFJe/eCoV62OYxZdBwlft/N9zqyztcqwCyWLEECGzDnrs/Ga7e0hlha+aWDBaUX7fOXlaVU+yGoO5pzF5m1FR14E146ycwIC1Zsp1Gv8Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C5nYRvLMitX1aa7lJ/7PO5h0xRn/ielA7ffAATQo0Kk/rFlfYwLSB1uguDfP?=
 =?us-ascii?Q?qTNfqcInmrMcOm/btsKifNOkLXr7ZI80iX+RDl6qRUy9O6dDt42mRKVWjKPw?=
 =?us-ascii?Q?rvE0R0RPsCbqyiAdgeaXzSoBHBVDNGhYMGQzK4Atj/wNBeI7IaiHMZGoI8v9?=
 =?us-ascii?Q?r2d2LrzKkkYWYiWQJ7FZ0d6PeVfTiDH/KdN+79LBXy3YF33Xm+bPsATqg3Vj?=
 =?us-ascii?Q?2f7HwS/WclSdLYGwqkgcC+imuMujWnaH+7Jrve04EwcyIs1v2y2E7B5I99EO?=
 =?us-ascii?Q?fdW9Lor16UvhNuGz5L85xPWyalVBkNf6Wc1YfqVwXdwtRBbm/rN0YgfWN9Ix?=
 =?us-ascii?Q?ExjfgjQO7QIfevDJP/AYNqb7Q+P/lk1kRVSNDRp883KuUoD0bGRKTEIt1Pvh?=
 =?us-ascii?Q?JbcnHugyVrned703oJGoMu/6O4Y97vcuR6002d1pQMThRmaFbqyH74L0jRMH?=
 =?us-ascii?Q?GFLTHshHZAZA6BcRR+nOD7JTVPFyBdYlct0Db3QVN+x0eqtiWoS+C5eax2+Y?=
 =?us-ascii?Q?Za1/BWb+lJxYNQj1zFgwVBxQlFQKF7s4ei1kYT5Eqd/ss7w4Sfuh+zbK3NYr?=
 =?us-ascii?Q?1xK3j/7jyakOrUXuqNjwpvPBZK4UAVd2DFw6wTNfVIErKOS87Dmg8BAd+1Ec?=
 =?us-ascii?Q?4rJg/+vkyitqgfKpuWQ9VumUNyjE08miJ0sJLGKdbY9VezQMuFBkneT0/xpQ?=
 =?us-ascii?Q?VD22MlgBJ/RDrIpCKyWkpP3mTx0zV3RqlOYD45t8MwvaxIMEdp0NMJczdXyO?=
 =?us-ascii?Q?aYfjSV+FalD7BNKO8t7jBrZNgnR/73ccW/vWNS4nWTPIUqLFZR+IXk15vpPu?=
 =?us-ascii?Q?eHqLb8opu8cyqbn/RFJLIVt2HDMQ57hBMYZS8Ixfg2sr7r8PzVp0EkOMJAjS?=
 =?us-ascii?Q?hPpcuhe4HK8PhwIcXNSe9EghksN+lCKFN7I5PPcYPDgq3q1W9KACAStjQw5c?=
 =?us-ascii?Q?4Do/UOY+nurOWYG/NV3GBtRkrKwbTr6f+odGb+5LGhmi3n7wD8GuxnGYOXOk?=
 =?us-ascii?Q?hyQj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:03.8740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ad2acc-6b9a-4eae-b0ac-08d8b2b8c01a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tn/wNRguJqLz+3D+XPhbW39ThWo/vFTNyFHFxJldSX83Sig8efmcxrpBoF/42QRW71ZRUPHF6TAPi8ovhawVRA==
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

Add CREATE_SVM_BO define bit for SVM BOs.
Another define flag was moved to concentrate these
KFD type flags in one include file.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       | 5 +++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 8a43f3880022..5982d09b6c3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -31,9 +31,6 @@
 #include "amdgpu_dma_buf.h"
 #include <uapi/linux/kfd_ioctl.h>
 
-/* BO flag to indicate a KFD userptr BO */
-#define AMDGPU_AMDKFD_USERPTR_BO (1ULL << 63)
-
 /* Userptr restore delay, just long enough to allow consecutive VM
  * changes to accumulate
  */
@@ -207,7 +204,7 @@ void amdgpu_amdkfd_unreserve_memory_limit(struct amdgpu_bo *bo)
 	u32 domain = bo->preferred_domains;
 	bool sg = (bo->preferred_domains == AMDGPU_GEM_DOMAIN_CPU);
 
-	if (bo->flags & AMDGPU_AMDKFD_USERPTR_BO) {
+	if (bo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO) {
 		domain = AMDGPU_GEM_DOMAIN_CPU;
 		sg = false;
 	}
@@ -1241,7 +1238,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
 	if (user_addr)
-		bo->flags |= AMDGPU_AMDKFD_USERPTR_BO;
+		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 
 	(*mem)->va = va;
 	(*mem)->domain = domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index adbefd6a655d..b72772ab93fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -37,6 +37,11 @@
 #define AMDGPU_BO_INVALID_OFFSET	LONG_MAX
 #define AMDGPU_BO_MAX_PLACEMENTS	3
 
+/* BO flag to indicate a KFD userptr BO */
+#define AMDGPU_AMDKFD_CREATE_USERPTR_BO	(1ULL << 63)
+#define AMDGPU_AMDKFD_CREATE_SVM_BO	(1ULL << 62)
+
+
 struct amdgpu_bo_param {
 	unsigned long			size;
 	int				byte_align;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
