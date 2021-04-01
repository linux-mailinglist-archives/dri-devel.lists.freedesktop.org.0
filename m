Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BB350DCB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759F6EC54;
	Thu,  1 Apr 2021 04:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA96EC4D;
 Thu,  1 Apr 2021 04:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPHOyNQLuAmxLJpRXv3XDrYqKEpgwPo6+TKfatxbQw6mADEV9evZO6neaKIx0DAZVoV0EPt8uG/WzCsaJoekU9RxzeodufxpGRIzGYELx89iZ23EFDPbYy4i8j+/nV68SNJJYih5N9f82xw0BQHfRx7Ei5wUHfNsv+R9uC3zwqCFb0hNtwI9tughbmYean1WGk3yqlKjOpaVSp+xq5esWZ6GHGP61Sp3ikSdBgMBDf7EM6S1jBAAtP9olg9CfR6v/gyFhMS7OTBxyWw+kDHr1WxQ6vP0Z/WbR4lq+qqCj322w6+wr3JBC+/ZL2FV/EuKI/rhfyWH2A5jZd5t/OA6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lBK76N2FePSxts81JrJmLJU8P7hMwGZe9Kw98an91c=;
 b=aZjoj3DHSuL0Ului2qY1sr2hsE2DVi0MjE1uPy/2lNf2H8MpqflQXE178HmvPcEMj/Aen0dgRFnYI7DeNZoct98NC3fEjJtdUEYKm1yIFJWz9X2sS/e+HKEdIy0y3AAakir01j0G/piAlu1f06xPUouQO9vvsffjbjyuSKG1i8HSAUZbEqa8KfuNQTaFvtdMW7ivtYTLEDM7VN0W+NHnHah1ZPtrqoIGjc9fFEG65s/xtl98/M5ZErRN2Ls9wVEdtTL7InFRjTUygqxQRKxi4/NDHJDEEzRoSydkJSNejIYFWRuX1VzdUVmssgCp5PyPVt/wru6HowUQ94XHCEXEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lBK76N2FePSxts81JrJmLJU8P7hMwGZe9Kw98an91c=;
 b=Xbntf+quNW/OGGBWpWiIytdhW0HeAm2u+qMVe1Qxa2v9I1i8f3AlQDya+oxaR76rJMehdEDRXH2Rugk9G0Y0dLC7H2PNM2+Mor0DASC0XT49Rt2ChLe034DnvoX5tZResY1OHhGLpfXb791LVACY1LuD0djBmraP25utXmF1WvA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 25/34] drm/amdgpu: add param bit flag to create SVM BOs
Date: Thu,  1 Apr 2021 00:22:19 -0400
Message-Id: <20210401042228.1423-26-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0586614d-edda-43b5-65bc-08d8f4c5d941
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42220116963170677DC31FC8927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYLXbLFQwe1SSBPnSDtmVnCdSX3AqMp3qrL4UEf4MqZ/a3kw3SZSB55qMWiJbFi20Qd20ERAIsU/4m4gjvNUPByd/m06tTvQnAf8DjjFongifsCocc7AM1gfcXGOF/ClR1U8GTpXFYS6uKiXE8HrdENxTmk1FlyMXTP/zSqELYPlHDcQh1Vl9L5HoMgA45XywQa0Co2NNbEJgp1nW5mxwrom9qNikQStOHIkahKgiWJCZfaHw59gCNUauI3OIeEPXXV1geQCTJ4Aq+ci22ockZWopLxj1qfpxixCl9OyqPQ4hY2FYtzXpUSVoTdOjgfhACrAT6UveEO40Ynza5p+o9FDCd0/glVr+aHFJh3MtFUO7hBcC+TgcGoop69kaJbL63kDGDl6dc1jQ5Oxc8S3HDDZF20nC85wuaadYOiHM+LR3zzTNYzyXaE5OWSJBxe2bBDatP2+4/bf8D0wJbD6mhpqVTJm+wIuXmn6aBoeNqujLlETxftAXOxVZjygDB4mwVBUpXvJWGcRh3NHn4nda7vVeysT6aJPzqBAcDrKB9TjIHuHNCtHVpGqJgXIobQpzSMJ4Y5fGTtthZViNks4c8XNkleF6ccbeWQoe4fJIqrhsZostR1CuqMLCJGNzSpz+SWCuQA7xGphJBOMnkUu+zRGUf6JeRXbViJHdgc7prw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NBEIJwy+B8aI3GBAk57Px7sZxwv2jdIchWQ3d9DsTSkJizR7tvDHhsorgzwk?=
 =?us-ascii?Q?EdAyK4Bjb1RsnGIfY5tIk610tl2UxzpxPxMPg/2EXRYw49IY+1NH8hEDP32e?=
 =?us-ascii?Q?0/OopTSKfxLJibIZ5iDEvgwikrPJjGueI7TeecheaCFUacvaxbybNBGmxqsW?=
 =?us-ascii?Q?IXBi3yjWz4U3dZ3nG8yBDKAc5XtI3cMD3/uwU+gWttDyxfmeeqx5WiJvLppU?=
 =?us-ascii?Q?KTxeLRO6AHlAk7XVuQR/pltJlZhUHQTbHtxyMyB61+5CFZELhbgrSH4ZwF6M?=
 =?us-ascii?Q?iOu4YiCt72mgfxChfAPSzmu4xyAlnXGAIIYYYDNkrRUTZ3Pe9qfDm3+xp1xZ?=
 =?us-ascii?Q?z2frALpaksx5GT3Tvnh6oqT7GqSlgD8bGHP9RYEzFEM1C8u1eD5iVvk4M35m?=
 =?us-ascii?Q?nUWgyvNDyF7h02YKSUzG1whxRx04P4GIMuiXilBaSwz7E9pFRPnF/VBDtuSZ?=
 =?us-ascii?Q?VX5JRp9ajmFN+05glzsK2bn48sfGatvT6ruDYY8Wm61FTfRDm76qJyjzcGY9?=
 =?us-ascii?Q?1js2UhZ/9O/WZyl+DzYZgD0oAYGFMdBU4udsPmdfzhHOfnajBbcdqBOwOetH?=
 =?us-ascii?Q?vImzmDNchq2U4cZhwgBF/chmfHmUBWR1r+mK1L++UAxAOvTc8Xo+IkGZub0s?=
 =?us-ascii?Q?1mne+NVZTAR571F+k0+TMggw5LU8erwKsmqKUvzYw7MqCgbcjUYi3+R/aim2?=
 =?us-ascii?Q?HfOj7+OFkGhukQVFNPq24TJIgDEuwKNpb5pQ0ElxFGN3znHyssN+HpkszY2d?=
 =?us-ascii?Q?iQ3KoFZyEz0txyuSyPjLCEE9wB92agFUJe16Nd3mrFfhCV+JiXZMdNFYFUE7?=
 =?us-ascii?Q?XnUfzxHYXTQV6GslnfZDMsDEsSqd93UCgplGxtIVJC23pwgLorrJf5fCi7Vt?=
 =?us-ascii?Q?50x/M2zP4ZPayCY2RnyXwGSNRM6SALn7ACVSxz6qawKkhkcisuF7joqyKgYM?=
 =?us-ascii?Q?rxLwl2QZA05U+A/6Qqg/9XoI1z3Nig0Q/nDbbGra4SQIEcyefl7mM8VelsT+?=
 =?us-ascii?Q?NbBEs5Mo8uaNM0iXtmtT1+w/rPox+gjbEw7hiLcgZYuHqWu1vUFOsxBydJZr?=
 =?us-ascii?Q?6+u01smoZuOEkZ78n9Rnq/vnTdNirBHAE00yQxEKU7NUn0nUOTGLegL0gRKm?=
 =?us-ascii?Q?Q0Kscj3HUntHdx/aq6g3bNTLY9Qk5Y0BLBQdBRXUAAU6+lFeOxa9tuyfI7PS?=
 =?us-ascii?Q?azhwzKY/PB0bPh6Z2qSAAI3dAZc1BQmi2DRe91rf0E9d85nMB5WhmbTin524?=
 =?us-ascii?Q?EkkrVnIAIQStccblJ7dzXNqTsBTr1RqqtUAUrWWnUYPKf/WobeW5/6pcPFge?=
 =?us-ascii?Q?WsyADhLUxse9LIykrU0lrKw3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0586614d-edda-43b5-65bc-08d8f4c5d941
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:06.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xdc37HxV0tUgWqi5S6Qb8cQDb6gGWvC4Vn29kYdLAxICuzfGCfrmX5QA8eCJsRj7yF4woDiPUspwmjTO1UU8g==
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
