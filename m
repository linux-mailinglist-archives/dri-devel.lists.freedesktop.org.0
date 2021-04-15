Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D419435FF78
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502B6E9BF;
	Thu, 15 Apr 2021 01:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B726E9AF;
 Thu, 15 Apr 2021 01:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLH5oxkpt7lDNy+xRnBUbFTZzE1rpQq5FTecW9YSPhxb6nQYusncL31Zi75Sf4cTCP2SGIP+AEkerUSwGTy51Ksp3q3RRDdl+LmoasFwlSIpLToQcm/QHg9SVNzkcrkxtqJ/Il2kAdSF8ekUll7XvNe3byCaYKyIQIMo4bKxDnL4pgMfktA/wRLvHAeu06RXOrzilYHyiUkaBZYyUK5JFx/LKZab1jdJZ7HBrKrcKCWCsQuwiayQBlkvWt89GCG/kfYVYJt8ZlQO/GDBNUVtjPQ/xphYJ/bNIVvEvlYM5Ep0p+i4GqNKHFaNldbjmqMf98tArtseFNu2FBK4jHmWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxoTWaG+E8CqwGyWXn1CMW3AAEwxV3ZJtfBRmM3ttVw=;
 b=C9gLq5cVRlq5F26RNMxpkOXukLb8nGKh8fDXC63S0Jl/QqWsijB1mvEeULmuaPhMdOzBHBSzJX+kzEtrdYg6UJt53dEUgJPkWnBvnM1MixANgWs9U3pgpePyD3vNsHMBW+lZ9TlVA1Dpc+LxMKPVALJYrTT+P43pp0YRXO3DBE6D0JvRdNm2A+fDfHZiao/2O3V5hfXPPZ5Su90eevvJ7a0UZL4QoO3x0K7oS745pnkdbRabownbVVKf2VRcm6g17OAPrMbX3mP9uwkvRG3PLlLMdpi6hCtDsfap/60dsX9tHq0JgWyzmRBEt/6U4c1GKbTJb+yZu+as2bcSHBhCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxoTWaG+E8CqwGyWXn1CMW3AAEwxV3ZJtfBRmM3ttVw=;
 b=Bp/FSg11aLIm9rkrtTK5NeF+TYf4jsjUxs/CRToBl+DoQ4C9QHtsxTTalovvtEL7fBr1N2RKn6yjYvnw5erfTr9FgO43KSrdKuJRP5eCS2h0XkTc/B0ppmbAjQg7i3qP4LBsja+tLF5NkV+L/KWQIKwZWc6AsNn7A4sDoKXDgwI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/34] drm/amdgpu: add param bit flag to create SVM BOs
Date: Wed, 14 Apr 2021 21:23:29 -0400
Message-Id: <20210415012337.1755-27-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dfac781-b138-419c-ed6c-08d8ffad29f6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208001005D0D7506627134F924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zytc/uiRMxq3dGyr4QULyxiChMELJc1jigaSTA+0QO1kgQWz0GWtG1wJ6WL6vClRLxeoctmUaUubulczYbP+6n1HxXLQS6kQ/mUo/rR2cOATIPnw2zWXDbAOF47x2vHjS+8U1xJK6Tdt2J5+kBZC2rvUniMaDKwP8GB9e0JTeG82YdeS8bxSsCAvIlhsLuuCeczYq+xhe9wtAPqv/G5aLP8QP8GlABH/SwQscBKFl2ry5WfWxBFoQZpyassHerW17pSfj1f7PHOylyxDWMbhjUp0LXWezi8pdGFv0JAYQEPKaDWq5ilGHGdEsiooFA9jRHPNvwWxZLirpb7QWUk3I+NrGIPzr2C0V0re5+w+VEYsr4f0X5zrSNrUhfsmCvcIWZzQlCW/dKU9cwYB+xz/PSzf9GRZZ0xhtroYFmhCuR0y33SuMMsIlqkaCvI/nVFpL8yQqXuX0rYwi/XxK1yLoqrYRjF3t20Ofg6UbC1jJri1+tavggfuNou2P0Efuc8tXrjmTe+4RMEomGLRCle+gVDFBIlCrTOn+a/8Jn5STtEs/qvybhicR39Dyhdkn64Xnarch/QhpME47mA5Fr0wwZ+YqAYocb0OW2GZwpVO1jucwspdioveK72+XFbZtSfWOF0oy9RmaYANsFB2ZxKcJr4Vm5jdPjT0Q0uLtXp5/i0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i8EgqBiWfg/A/O/SA+g8dcN7HadB4Tok+LytNQZusxt1nLWo1eWkaX9X9YQx?=
 =?us-ascii?Q?X980An7i/SSI2Zn+ftsbXIN1+ZO1fuDPifkpILUSZtV11XFD0quz6BAfgjtH?=
 =?us-ascii?Q?qUWP/5F1ZabNx+7fspyZ5M0kgWyttXr7sCkZS4XFVkK7f5jQh//JD3IBOMY4?=
 =?us-ascii?Q?mRgWtpthdNgrHAIcChtccw0ai9kpEFjlkCY5t36jGEvcmIV1HIWk+esSptqr?=
 =?us-ascii?Q?u08WbRsjg6A3xc26KaPPFBCojQ0bWf08ilDxJuUmdchbU9h47XzIiNvwKgGw?=
 =?us-ascii?Q?UtVgtZjwP0QGIGUjKScSnRqFZnq1EicvLv7EV1OtPRpc8SQATIlkhkMsAAlQ?=
 =?us-ascii?Q?Ao1eca6RFkGyNGHpMRcCOiZeCrDHL4yQY0b9z/7CzPjHQzrOPI3x6mXYISD4?=
 =?us-ascii?Q?aocXolznZFDJT+2e08llCmh9plYtg4bCV4BOqyhP8NbkrCkUncq75Jv4pwGa?=
 =?us-ascii?Q?zBwq2cs75sNeTD9bpOAzBqob+dwovbE6YBAHPFfjGj/Zz/3uvA/tPXjxgmLs?=
 =?us-ascii?Q?c8Pr8wH55l/iJvzsxX6hdDm6GdYPImYLOkjC6hT1BDGCmN9xNMGWrFLHNOeF?=
 =?us-ascii?Q?ybYIKMDcnMqeouxs60HcAKEQt5eH+tPOFeV82EYHeLZKKR30DHpMbXimk2Dq?=
 =?us-ascii?Q?niruAuHf/zC20SlYXPqn9IXPtdgDEBcRNlnpaHqikmJvKlcpC9iuUYJUPQak?=
 =?us-ascii?Q?Dj2V8NVZ67oEhPcJWeaaKwN7lm2R2KRK/x9X6W/lB0aS8oiYGpyryrAukk4g?=
 =?us-ascii?Q?KSm8rvwtiRsq4KG7OaipU70seEOtiHNTUsRu2Q61ytwuKd2ZR1QSg8lEDgwu?=
 =?us-ascii?Q?ULpVxg4Olp+vOQ7lGpmXyAyIRfBVmflzJydRfJiOVn4PohZq0qUu3+WB/vJt?=
 =?us-ascii?Q?5gJSf0Br2vKaFkFE7xn7TTkxgYCPFDc0sEUwvmrXfhEhkV5nktRdkYkh3/t+?=
 =?us-ascii?Q?ZyDb7rg6TY9Snf8qmk2Ng8ZytwT5xjhFrJRh56aRXKpsmMq7DP/rXfn+mZvB?=
 =?us-ascii?Q?i2B1oZySMMJ1LsLaET3L+1hZ+gwzzUd5/SpL/K+a7pdtYWCrNa03eRqHMvQp?=
 =?us-ascii?Q?na0fHgE2HfJ+ho0xAUQAAG7g9b7s36kJPbjO3+mJU2gH9Kn3UCyGLkssMx83?=
 =?us-ascii?Q?1E7lQ11OLz5zN/JGrlXVA9VJQtuvriHuDON6A3B7wsO2L6DjtHVsNVm8Z98g?=
 =?us-ascii?Q?ZnHCtct7OEvULt03Y0ezuo9JQxqHE2m8z/UZLON/f/EWZCgVq+4qwASEPjx9?=
 =?us-ascii?Q?WSR6q7DT7glJU+lrEUmZpaJ63nLx1AcpV9HXWqbf5i/36X1KdLh21Zsj15ou?=
 =?us-ascii?Q?nBi5p+wJ1qm8A7svW5WColwL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dfac781-b138-419c-ed6c-08d8ffad29f6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:07.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH1lc5CvDd4J/T2EkVvMz13uahU9Zn1LgiZ0VPhTimNrT194Htd4x/y/JiF4cs2HSmSLN9CA+4WXU/Nc8XNpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 7 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       | 4 ++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index eef17986d6fa..065735f40331 100644
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
@@ -1275,7 +1272,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
 	if (user_addr)
-		bo->flags |= AMDGPU_AMDKFD_USERPTR_BO;
+		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 
 	(*mem)->va = va;
 	(*mem)->domain = domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 2d1fefbe1e99..973c88bdf37b 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
