Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6883C19EA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 21:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94B06E98C;
	Thu,  8 Jul 2021 19:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA806E94D;
 Thu,  8 Jul 2021 19:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNdGlOFNVec5ZkAesosEsQPpK+dNhX/0ZaQL7V9aQbz2+ojHXqbIdgY2VT7OVQvDbDR/MPzMd1WFt0xZbZrnypUgvRo0WZdu9xdTTHNdQzOHt666Hg0Y8L/yqIizcQQTzdvcnzd2ul9/yArBtWsVGMYMdkeU0Eo8S9PLHSmkFxrh+iFG3rUFNFfbY5ulUH27pCm3HEeeIfqy9K2IPfNuRxohcvo31y5P3Uw4TpGjaUVYBLZnXDod+xbEhuBrYeamCBiEScG4gpK7rXBPYfEeXaWcYBhGiTxmxGMlxum/vXVBIiGLL3qbMmyO4EnqkBwqT6Kow6I4FqzjZn08y9hNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK1hHoASBlRALQ6XRnWHXRzq5CePny80OVTvabOn4jM=;
 b=ZMLLQPGSSJ+IOrsKFVjTrH8NoqnmTHqWxQdFpmD/Jmcx5lWPm7J0ZVlGw2P7zRu3CN83XFB7BK0bwSgaCYTimagdz0UW6J+qIBawNpKkVbFMWh8q+GrJdaoBJulig/CsUJwjBfwN7ojqXb4+j25R1XCmzEvLRDnBLZbJg92yEe4hbVfTel/4g9fDe+hKfrAhKrNKKeVtunkj/1KjGCEFmpCCzWsc5VAhsXk94nzjcGr/OGFw0ChrAKSjPOHjMSTf3mUMxMvcditMiUcHRE27stKzF3joLtuj87Hi8RKwuZizI8Gi1Y5UlVNGD0t9LWTQOymOcThT+Qz+/7u+llg2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK1hHoASBlRALQ6XRnWHXRzq5CePny80OVTvabOn4jM=;
 b=f1Plz3tJzG1irvVmK+UkSZVk1BS8Co0j3mYpaawUE80TjwZZqx1pAu8rOALDkjxUhKe66JXs+9rbRdGKzMqKwX5g8pczmfBuB3Cl+VqhYX5zOx9CawM/AZxHHYeWDppQiPgYZt0hAFcVpVpu6QIW0Kw1JtVCNm/KmiKYvn6yu/s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 19:36:39 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::8cb6:59d6:24d0:4dc3%9]) with mapi id 15.20.4308.023; Thu, 8 Jul 2021
 19:36:39 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: Fix COW check
Date: Thu,  8 Jul 2021 15:36:21 -0400
Message-Id: <20210708193621.2198733-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708193621.2198733-1-alexander.deucher@amd.com>
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To BL1PR12MB5144.namprd12.prod.outlook.com
 (2603:10b6:208:316::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.198) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Thu, 8 Jul 2021 19:36:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca74623a-0d21-42fe-c657-08d94247b4e1
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206A5B5F7482D15918CE62DF7199@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ExqxO9V5fxTlfx4WaT+3ljAvD7CMCpB1LD75IqroPl2+txKzpvyyMbOt8BTdamw6oMa88ia93ZUuN4iKeiS413Wl63pCX1eBsJPAf0yMMP4PIo3Wa5Snq5UkPt+JgieEHn89uCZgw+/8qwsZYGj9YussZ9+hFAaSyCtYEYXZIZjYgwCbrpsG5IWRUXjhqaicYB27BE58n/FTsIuwm2lSQuIbH8akEW8amBxHIWcnz7v8VN8KuiD6FuJ67C+Cr/F7w3kQPuHaHXYOIvtndzHELyld9DOnctGljOp8+MINPDV0Rj3gPknP1zZMfwyGvcGDjuO1YBxETlkPKrubvXVp/6JQZjTfY5unxveH/LU99Sh1fYppW1NPjQgLosYZKzap9PehdO6sOS6Jw+oW/1eNSw/ODWw3HmVd3OoJBNUzbXkCCp54I8XnbaozOYx47s81Bd3RALkrAevbasqou2jG2BBZAmLw4Wsv5SILTakZsd0wswIqHXLwh9PoTOmCIajXX7NBQa+ejvimP1XxmhqYkxalPizTEdmKnFzRzAbAFpyyerC/flo/tYB/alCKxawQefyunhLq0x0mQcYDUCGAoligEma9M6D28gTxyBx3SA7uWwhgoTipuXk13vCU3M17tof+cLdeCrR/bXijnLwlYGGFgoASe/v2z1nJvlRI3uzp7Xew358usnWahW50kgpF2zUz+Zn3IJEg5HC7uTLFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(5660300002)(26005)(316002)(6486002)(6512007)(86362001)(6666004)(6506007)(2906002)(83380400001)(52116002)(66556008)(66946007)(66476007)(186003)(478600001)(36756003)(450100002)(4326008)(8676002)(8936002)(2616005)(956004)(1076003)(54906003)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNU1DLCbxYB8QaFIJOtwLeW7gMDmO3+0ovGABT/yHxLEA6azgYhnW1r7Lz16?=
 =?us-ascii?Q?YF1RjwiuMFrU4kYUf3uaumyBpLGGZVkAJGkryhDbKkdmvEww7iEy+RNFpxtr?=
 =?us-ascii?Q?qqP1HePAk/rjsOPb3mx0ZrHXXSUc5I7hktizeCXSxAs63yuP/wbw6jGBR4D2?=
 =?us-ascii?Q?eo3JXky4+Mg81VP0jTLdsX4qu8vm5pUiuXY6WTsogHcjZjSsKPUgbCJ3912Y?=
 =?us-ascii?Q?WhDNwczw3+bYQIxFHEd1ePwDyUDSoJTiQEY7AjfO4GPDVG8HvAkqNQ3NvVmD?=
 =?us-ascii?Q?bEwaTgxk05CQHkaUjXqkFFK7qNl2BRf2OCxVi9UUsJJNDZBcci713jGZL4HK?=
 =?us-ascii?Q?uAaY+nPApg0flrg6/dtACdpUTUaKuK5xNKKmi2J2pQiyiR1Wdvx2ItRdxG9O?=
 =?us-ascii?Q?IzHhoDEErMo2fKLk326VuXNxjRnpXWT5/S6wq0CYeA6cl4dt2adJ4+WCcFMy?=
 =?us-ascii?Q?XyC0J6fzUp0TzkL71getkW3/G/O1QkqKXGaTRnbOTqCZ5xZGprLeWgJRbzEY?=
 =?us-ascii?Q?uLi8QFeqh7ZamuWHJUgStwSmq7wQa4wh6wTGdHAXWKbm6PxQv1HAFa9B0TEv?=
 =?us-ascii?Q?drtZLIkgJlRgP5KllfY7AU90kpxUeziCKMektDCV8joVEV3TBUrsH5PNjGSW?=
 =?us-ascii?Q?1nSkuMm+DvwbsaZT0P06r3mOJVPQT5otH/G5LDITxAznmSd/xAAkGVdVPXGH?=
 =?us-ascii?Q?sUzDvYrOJO9HLGIyTHFmacZ3OpsJfdKgsl7UhFNO/EjFTcAvzptG2DZ3WnOJ?=
 =?us-ascii?Q?D2msbQCl5lhnrVfwJJK9CWulXhZeQOVkswe0Nc2RpDDhun5k78G2MHcf2140?=
 =?us-ascii?Q?QLPGDNEZCpuzSQwRuoviLqOUi7b0fHLtTm69tn29HpCLxAQKmWGvOi1zadz1?=
 =?us-ascii?Q?eGEKVIPfCkxFmlc7De+3SGx9ysvXjRbQ5QuADD7a7oS96S4peKMHrlINX5CN?=
 =?us-ascii?Q?YWliSOzH0F9AIw/eq84SrlxyDPeBTdJZIQcCFhuXQBRA8DVstbsTlEa+DGUa?=
 =?us-ascii?Q?Drfuk6E9zAdRIZUBm9a+VR6vQdVj+4NkBdf192TokOAMYywf6/MHZ+BTMfso?=
 =?us-ascii?Q?BCX3JzTau5/Sq+fO6noNn40WeMm8lrG3BJVQZjjMeFSFuWsMNiRGjqJydsVo?=
 =?us-ascii?Q?v7tJ70/e736++nUZGsnIrC8BgyAnL8IW/tSxDR4+Hd4sHfnV6phSg0CtCrzu?=
 =?us-ascii?Q?dumiqVBl/STKnTTcyLbh1EAxBJZY6tNdv5tZtKU6mZ4fyh7lN0cLLROihsBg?=
 =?us-ascii?Q?xuV0X1oXuhN3DQaSHznxxhoD85wAnogSXyWogQcx/uzZQLd/rgFbMu0QfYDf?=
 =?us-ascii?Q?bAoV2wjY9aWd5HzAtXnAFTgj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca74623a-0d21-42fe-c657-08d94247b4e1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 19:36:39.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: man+kFdsOoY4l7PN9nsfznjBsXtRPbfSzq7zFOI1grziqe4fvkG2tTI2JMUhvQGe+AacygUyLlXbDrQnvRduTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
is_cow_mapping returns true for these mappings. Add a check for
vm_flags & VM_WRITE to avoid mmap failures on private read-only or
PROT_NONE mappings.

Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..a75e90c7d4aa 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -552,7 +552,7 @@ static const struct vm_operations_struct ttm_bo_vm_ops = {
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	/* Enforce no COW since would have really strange behavior with it. */
-	if (is_cow_mapping(vma->vm_flags))
+	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
 		return -EINVAL;
 
 	ttm_bo_get(bo);
-- 
2.31.1

