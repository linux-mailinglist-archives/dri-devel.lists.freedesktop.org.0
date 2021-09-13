Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A04098B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597396E202;
	Mon, 13 Sep 2021 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5C36E1E6;
 Mon, 13 Sep 2021 16:16:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATGUpx0fn1DTHNUn3yeeCAawi1pbBzvL66YCFRYmqJU470Wud74MfjZcH7bZwJUwaKLbU8HQ4CQ8T6FPCvpFYtSFzNS8C5J3AAhODJ11aN9IMCxZfbzum6Sda3r6DcZmk1+bNnubSEFGPn4MOKvx917XZXYiA3JkBlMv1c7Icp7RZRHGIDvQB0lGghZcgncQC0XhIn0ThmSSL+CmCIG/MbhUaVRJ8awnr7z9bZwX61Pgz3uc8eViU9VZm4ZDnfALaNd0Sx4mxSvRsIaUmqxwAcZavMaRS3IwC6OqFdiq+rjg1JK8L5/EXW+B73dJMHjEC9CzACyRnjwvmQvV8TkgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yGCdRI6fFPg1mwUequG95R/0vCAEuQnzJ4fOflokHM8=;
 b=H+e72Jf04KM5bR0JkweIC1kwKVfXnwbh5wEKSC4S6TjIS9xDKRv9Ji63N2jg6zhjdKOD81mlZqKN0KB77rqOqBsdX+3nVl5SRRRT3mZWIWfn3E+1BvJ/KkejrDAJ2CsaNDvsEn8ShnCeF6njkW28F4KJlK1zhZasVjmxgTZ7Xe+VZLAxOb7iJIOQt9vycuApVmwmOGR2VBasFj9oBSYWhWLbriUTWlxBRafljP2dJxSFWmp2OnSLcJ7RusosfFrY9OcQ6G2TUOJoGl53o/3DmTS0JVQ+vfcrQnpboe34t3Yy1nlYX8wQL5N8MDM3G52BLT5BZRSrTtrj5K046OjC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGCdRI6fFPg1mwUequG95R/0vCAEuQnzJ4fOflokHM8=;
 b=Qeio2KYOXaqBRmGd1kmgtJi8bAUDiiFpCPT+04s90yypsU4wMlXN/uooeAW39eJz21wAtMRcKJgoUSy4un210Sn1XIeipL4lu6VuErCLqvICajfOJnhSNKPPck5hMS9gA5TyGMA8KJJZRTmjWTDKqr07+b7AMSQxqt2rs0rSlDc=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 13 Sep
 2021 16:16:22 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:22 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 07/12] drm/amdkfd: public type as sys mem on migration to
 ram
Date: Mon, 13 Sep 2021 11:15:59 -0500
Message-Id: <20210913161604.31981-8-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d6b7dc9-51e7-423a-1531-08d976d1d395
X-MS-TrafficTypeDiagnostic: SA0PR12MB4349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4349CF1B6A8AA9CC80D35C99FDD99@SA0PR12MB4349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qdM7zbPxz7/S0GEWadD1hRoIT48LLm34eWWDm07C4UPAOO1mlSrm1aIUXRdWbGevffHaz8zElJhXL0vw2HXMROxpnVKhYC8oVq4jYEi1o4Qa/4inr9DCFdlMlyx7/runRZ/RLuu72Iqj/WN5TrZbqsZrKBK58NC18KQOd9pFOhqbXM2LImD0bulDvip5aN6YLQgIqF2XX1xMOc3bcWIAUkf26TkQLea+RACArozeKF15wdt1trkyW8sjXYzKSRAb2QeUkVkEanzUPo82Zr+ffL9UVI9mVuSG/7hYoeYVxgUQJLmVQ7hyqfar7MqVVGHUOqDQVX+xdHxvnikhcJjAJBfaSzsjhuY+PdAvSPbc8JtGkUMW119/HPu34Qao1PsKKa21q8jRtnX7dx1W3VIO3PBeOaHSU21UwC6jnSKdXtomuxdV0bdrIo+5qgU7fUb3feXAUHLOr3Wmg8aJZcf4agc5PISbAHLRMysuWsUirhEc+R3+/WjVmJYro5L+lkCN46dsry+7nPDMis5IjTGiwDoCn/f7A+mJaaK3JJJxPoLE48F/DjUJRPf3fFpC3TIK+t70W7TCCTIzqPg2YYU/NJHZ3UIQa8FIRKqGUfhFWKzeAKoFk9M6AAyEiIWJGXhFLvJi7LRz+GctMylkWLheMG2rHQo81b0QqN3te2e/nO6wVp9M3bdA0kEozUcKYK3W/3yMogsnWHTpzTweTC9iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(66556008)(52116002)(86362001)(66946007)(1076003)(186003)(7696005)(478600001)(44832011)(6666004)(38350700002)(26005)(38100700002)(66476007)(316002)(2906002)(83380400001)(956004)(2616005)(4326008)(8936002)(36756003)(8676002)(5660300002)(6486002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DHPQ05IZ2gkNLpdT4htMZ7TCRhYuwQUprk9eNKIsUel3LdsERHuES6sDOcHr?=
 =?us-ascii?Q?lMqe1QT4vey3DnU+dvL+37+bnmjfKc1AJ5y/AXyVhpLE7Mp04TpOfK3kX2La?=
 =?us-ascii?Q?8hzrVC3ynmffmrFy5++YbDVH3RbCSF679hhaBM+lMTvD/OpKOiEDsU98X0mu?=
 =?us-ascii?Q?deBjVdF2cYRMbvAGvVraqvJuwW5imPWjODhs9hsqVDShvNxND0VRhclCO/lc?=
 =?us-ascii?Q?OEl2l12OYhjQck0qLc4YfK/MdZwL0XmBWyZnw/FrqGfm3TykUmY2yHdeGAeo?=
 =?us-ascii?Q?vfviA4KKoDsvyT1TuAcpTMTkUb0uqPhMfhT6zaPMb5G9Ocp3jIW/BLhF3twU?=
 =?us-ascii?Q?WSWH4qicg1wzA5DXyOx9IIjP+KAOMrETy8P2vL/gGi0Ppnn1X9Nbp95e6DrF?=
 =?us-ascii?Q?spmBgn9Q+EFUhtz+Mt4ZoKMsTFHrgvU6MLtQog/ebLqlniHY/oZHClc/oLqt?=
 =?us-ascii?Q?KOdZlmN5cd3x/Xtv2Ny5sapiLQFZ0O6k6AY5hRgQToY+YmzsQJlzlgQ9n7ZY?=
 =?us-ascii?Q?RmrU3svEKRuHJqmKoAHAi1NWK2SaygaObk8iDZFnDl1OX5074snbsyk8o0RN?=
 =?us-ascii?Q?5diz5qXFUmhO3AqQWRpxnuablt8wh44K+A3gKmbRRdzBz1187mC8K+Y7/id8?=
 =?us-ascii?Q?rkG6HY/tuJMXkaz/lakBO+3TUAcnjtzjFvQUeJotTpoQPuup8Ek2Mhm/YYnU?=
 =?us-ascii?Q?l6siZrOsYS4V6XNuh13th/cyjWOZB3xor0CcoEzKSFie7pxSjt9L9BGV7/+g?=
 =?us-ascii?Q?m6kYeYZzzkGNzGpzKQJ6Y6Kb/MWe7Akcxs4FbwjcCGLvTid9EYaV4/5Cb1xn?=
 =?us-ascii?Q?Q6m7X8a6LGx51shpIwKGaM8ET6zChXw110MBr8KU/C7imF0T6XBkKijoVGJ1?=
 =?us-ascii?Q?3lxZuwj32QeRrmuiKGZNSeecJ5LtRnmwrL22K2CdH3hZDPwfh7rrPossgTQK?=
 =?us-ascii?Q?/aWJkKxhkuXIyum1PDBxjEWtfqY8EOFq46p0L0skDZILyli2z4VHvGBPSRr8?=
 =?us-ascii?Q?MdC246c1UhWEnLfVeU/KPJ1wrJz2VtLfRUSvOPhdwTfk2mQ5BegM7OuatSVe?=
 =?us-ascii?Q?G2D5n7XvX6sB31wK9ZMWm4Zcu5RWqyIgMHuvt1Ux/0k7Ukw5XxCdCgCltgm8?=
 =?us-ascii?Q?f6/cf4ilMGbuj+T0uyShP0uuLXOP+ozITCcpbZ4LMo24mW/B84IuRKoYPZDq?=
 =?us-ascii?Q?C49Mb8LbYsPI2MJvHsaUGCafo5AilIL6yfX9kWfayjBPqgaNh7AsUNe+IUsN?=
 =?us-ascii?Q?PKcemUjdqrJDs/jVX3LbSZidRUezBzgLwLovkSeKDjM72s7jRxzcv7ZQHM/B?=
 =?us-ascii?Q?2N1T4+9N/jXkBnYTjCt/pu1T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6b7dc9-51e7-423a-1531-08d976d1d395
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:22.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQxJM1uG0Bsm8AAb1uTeJSafFqAk5psuJpaUpKi3gH3tF6hBKnR981eLfCIQs8zCtVhkKSEg1T7oNTaZvM5V3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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

Public device type memory on VRAM to RAM migration, has similar access
as System RAM from the CPU. This flag sets the source from the sender.
Which in Public type case, should be set as
MIGRATE_VMA_SELECT_DEVICE_PUBLIC.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index d0e04f79a06e..b5b9ae4e2e27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -617,9 +617,12 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 	migrate.vma = vma;
 	migrate.start = start;
 	migrate.end = end;
-	migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	migrate.pgmap_owner = SVM_ADEV_PGMAP_OWNER(adev);
 
+	if (adev->gmc.xgmi.connected_to_cpu)
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PUBLIC;
+	else
+		migrate.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 	size = 2 * sizeof(*migrate.src) + sizeof(uint64_t) + sizeof(dma_addr_t);
 	size *= npages;
 	buf = kvmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.32.0

