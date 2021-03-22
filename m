Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8D343F21
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8FE6E1D8;
	Mon, 22 Mar 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EBD89FF7;
 Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgZEh/mIHmN+R63dcknHdWlgOkBLuSDvacOnhiRjLZjZwC65XYIl2bIcRDkV/yjcKi5TCxZ4rK1KBePfi5qxPSNOKVTv9ie8ppV1Fj5YTId6g7xR+kgGwAd/j+vCwnzMwIIfvd3uQpbhhhGpaX7Ve4YP1RY5VSSEovHIQ2kk5dJ0nhkncOsmUuoCzfuQLl6KH4oh9WgHm9uDjZDaDYPFL3vziuf0YgeDWus4hDt0pAS+558nlpBdQeln2z+xjzuVTkNCDWRanz+LNtK0azgE4A70s0YtgcDZbiO2tzg4b+EDaPLPogLk2+nstPI5Os/shjwJm+1RO47vmAHiSf3nLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYbK478X8wg6RjfOVrK7LwRhvQtdzhEaeqEC4YR2chQ=;
 b=EyzYnPhF+bS1xsOP5+wlMCeeQv+83SfHwvWzDA9Qqo43kxsL2tMwE9ZcxZT7mmpUdJvhd5CluiJHoF7bVwof7pFnXvy8V1pPZgOvB4Cs1HyXfbHhBxYhwj2F99K31QYDrqTkcusFIzi2QYdJD5e0tSPHziGT1c9hP0KZNwu7J8JNHmvtRyTT+Qgr/8iHZr42QPmmWGeR2RaL8PQBwQ3iaZdR9NQjf1KfcNQ7jwvVj0kNl0mL4NukSijZO532oVwA3QycTRqkHZ8boblzm8ka5c7k0NfWzgbOgYzfZwqj9f4J/pKqTuMgKOQJIYt5aGc8J2rmLy2EQrNWiZADjV6JkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYbK478X8wg6RjfOVrK7LwRhvQtdzhEaeqEC4YR2chQ=;
 b=gUu1WmrjqFlRe8sMh0Gfiz2TEdSV77KZ4Jm2SkRUJxY0/U8ZqxnmBvkcdy4InerCFnf2bTpqcNyr8BhqJ3Wcf9LHBq1h4C0AC/HD8dJsxyzASm4pQp7FAbczGplwrkCcSlz1stGWZ1IXS1CP7XcYxamH4W/18lAN+MLGWXpToeE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:43 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/44] drm/amdgpu: add param bit flag to create SVM BOs
Date: Mon, 22 Mar 2021 06:58:41 -0400
Message-Id: <20210322105900.14068-26-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6decc49-d193-467b-da95-08d8ed22b738
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899E0442D2BA8E3BC256EB792659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJDy+Y9QrQsRAhIdbs0L4n1w94znUzqcduArsE/QoFH4DUxwC4E+d7KdicyWC7EHcA3P2xv3yNHAr0IOigdbj3zTv8k8M9eYnJEUR/GLNoZSPez2FvhZxFFAXYniwd2TD88AsVcqL+21BRAxIXPWh2NQFx7nf6QYiBT+h1UYOg2i22cg7f7c3OqbhF7aQLrFK8USKZes75pzrRet9XewyL0Z2XSDrb4zfqd/o35BqWBCtmwyP77Dmvh7B7p109ZNyPKVSKdJclyi8L9dleG389dG9/XoFSwVBiChA5ZurAurxXKSpSCaZir9F8iLOl9toCcO3n6rL+19qwSBWor4oV3JY4DfXCISRlr+5xJQJUwme7LHKIFbZQLH3/rtBV5p73rlAX/2l7vDOT71fg0r14nQYHEPNirg1xecpARrzVfFQ2QzS+sl2EgxSCzGC88UMizSCZwj7wQT4UeY1AniUQXrnSNFdGaH3xZIePkSY/60p3yr/OoLuR6V5mw0LY9MF1PzUX3E+3+pvAnnx4PXwfyK4m6rZ8gUM8fCo+q5LLoLS4ZoQjmHxCkdZIyJAwnyv61yqOjQS97WMpqN3KZ06jiwaX3XTGtHqBmCR1iVbIFxGIkdIZIgbcGJSCRSbtXTymcSQOiU8Dzjxdary13G6dDw9qor+RvetNwhLqlio2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HZnQ1RGJvAM6dqGwGbr3UBNxVlG0+EaVj3SX6305LxUWnNJwt9Pz+kEWpFjp?=
 =?us-ascii?Q?BaUYYlPMcq7xNDGJu/PetETdPZqq5EgYUeVtST51iS51fkQWzYbxKj96K+iw?=
 =?us-ascii?Q?34ExauOnwro2SBsfM+EgysxMDUmFIVPxwYrV1s5b7GrLBPiWCTjkKh7383cI?=
 =?us-ascii?Q?7S7j99R9V9myifJrgIV42c4JTg1jVSigrRLLUExuwpbSzI1Tp8Uh+3XAwXks?=
 =?us-ascii?Q?M9c1q+LRaiMzHm8FF04gWNu7rx0jt7Wod+Inz5mxZ/nMF00kObUpLIKNOA29?=
 =?us-ascii?Q?RI6fQ1Atl+UQlhD2H2B5aldpzbjPpJzWruHG9L+D+kea5Dj5My6Fm51cybpa?=
 =?us-ascii?Q?GhjvwOo1xqxxmQ3ba3kMXFubKEROB9jxU7BcFNhzXTFClgahNWAGExkyqxhO?=
 =?us-ascii?Q?BCarKBZ8ulgUKmNO8ERXpJFPOKBSQeXbt0YoRSjdB3VJAYRnwCggFCgZcXjj?=
 =?us-ascii?Q?07DEpuFgTZiLd/m21r6JOl6K73nPAzqF7d4++TFp/9TQ5LKjQqq7ZI4d6PeF?=
 =?us-ascii?Q?6ZC+P/au1qT8CUJ613sCM5/esPNb3nQ8EKIcLm+SYr9qDcbUNoTqrEqpYiWX?=
 =?us-ascii?Q?g/C+GH3NREedmD6VIpdnfYJfLYTO+KR/8ZFbHOl3YLhl9yW6xPyGwoPmozWs?=
 =?us-ascii?Q?RQtkAEhhRVd1dfIf6jqGAIT+SNdW9JHhRB/0JhOG78Dv/pjC3Jtpqvkd8a3d?=
 =?us-ascii?Q?PeHCqeMBfvyVJccFRdrfjt3kA3E6XcSF8y1Hqdv2oURSxx5pY8zDeGIOm4AP?=
 =?us-ascii?Q?cYVceTGH1FjZuALegsFXlSzNEtlwcW2HietxN3JdBCf7Jy5qlzHeOHdb/qzp?=
 =?us-ascii?Q?tB8/qLkEoZBaBwiiGvdgOFephMYGFQAa+YaCi9uwkc1Zrj7OmnfCDpul1DT3?=
 =?us-ascii?Q?rS/625ePMeLeuNt9jbJlXC7MkppP9KLTBi5mU+gPP1V3kXLcjs3yM7fyx1C0?=
 =?us-ascii?Q?G0j2+R4fzRG3wMbHTbhlEw1mycuDIwfl9fQq72shJAmjSsuEi39a+OlrrGYt?=
 =?us-ascii?Q?ObrUj0hYAY+X7w/MftdzyUyxbtMkuadBU6O+sKl3oGp12UDODRWo4qccrNyU?=
 =?us-ascii?Q?6GhhZOcdQWDYH21MPTeFg9iePbC6OTCyxioUFrku2UEUvkb4aT5wqzSFXIrF?=
 =?us-ascii?Q?7b7wrpa3o4fh00LIG4rLjC9dkxxcl0ZEKSOzqu5YFFkoWP7U4lAHZk92ZhoX?=
 =?us-ascii?Q?q0iIOs+YC+q0C488zStg6lqJ2z/xvkpOXgzIlLl0uqkJ5lFlKoD1s86sBfPK?=
 =?us-ascii?Q?VKDrNDWQfBkZZpg9tyLwoK9P6DZrEZkwhPdLAc5Zzqu0FJ+1N28Bd6KCyiHn?=
 =?us-ascii?Q?ui4hEWQxXGex+NoX58QO91ln?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6decc49-d193-467b-da95-08d8ed22b738
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:43.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je0Rtp65j+69VJEFNfaz4XBZM/bSw3x7Of7cETmtsupJpzrBNHXWEesB78V2cIjuHqrqxsCuKa/6mSED2PIrmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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

Add CREATE_SVM_BO define bit for SVM BOs.
Another define flag was moved to concentrate these
KFD type flags in one include file.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       | 4 ++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 9af644f256e9..bc38de8c5c38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -33,9 +33,6 @@
 #include <uapi/linux/kfd_ioctl.h>
 #include "amdgpu_xgmi.h"
 
-/* BO flag to indicate a KFD userptr BO */
-#define AMDGPU_AMDKFD_USERPTR_BO (1ULL << 63)
-
 /* Userptr restore delay, just long enough to allow consecutive VM
  * changes to accumulate
  */
@@ -217,7 +214,7 @@ void amdgpu_amdkfd_unreserve_memory_limit(struct amdgpu_bo *bo)
 	u32 domain = bo->preferred_domains;
 	bool sg = (bo->preferred_domains == AMDGPU_GEM_DOMAIN_CPU);
 
-	if (bo->flags & AMDGPU_AMDKFD_USERPTR_BO) {
+	if (bo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO) {
 		domain = AMDGPU_GEM_DOMAIN_CPU;
 		sg = false;
 	}
@@ -1278,7 +1275,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
 	if (user_addr)
-		bo->flags |= AMDGPU_AMDKFD_USERPTR_BO;
+		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 
 	(*mem)->va = va;
 	(*mem)->domain = domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 25411b2c4dd9..b07903d317e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -37,6 +37,10 @@
 #define AMDGPU_BO_INVALID_OFFSET	LONG_MAX
 #define AMDGPU_BO_MAX_PLACEMENTS	3
 
+/* BO flag to indicate a KFD userptr BO */
+#define AMDGPU_AMDKFD_CREATE_USERPTR_BO	(1ULL << 63)
+#define AMDGPU_AMDKFD_CREATE_SVM_BO	(1ULL << 62)
+
 #define to_amdgpu_bo_user(abo) container_of((abo), struct amdgpu_bo_user, bo)
 
 struct amdgpu_bo_param {
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
