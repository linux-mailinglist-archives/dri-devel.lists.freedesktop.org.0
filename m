Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E58389BAA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CFF6E7FA;
	Thu, 20 May 2021 03:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6076E3F4;
 Thu, 20 May 2021 03:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6M4/rrPwnYzsCh9QDi0oZuznLmQAVI+NKsJ4rFZqve+ds/ywCMdlKOhVyI501KKk4CUKLluIx51n3i9nzvxUpv+qT9cKsrGEa2RYR060uS0I6D4D0m1jt9UJAO10OdxJHHaFgcb8rCenrn7EnGJ308LDYuSWVKDSMkqhgy6vTlNLMutmcJ7aMVzvk1DdyD0+82h3mLEeRud9mlBuGdoo8Mz/bo/mrXYxhGhuCnFYGDuVX/iOo1/6/o45mt9uJDmUFvPGNTISSsrZohvl1TEC4jJvxcJHffNCyQCjUYVk4qUeVSYyRb/ZTHhTnyOfdkEcWcCkneOKd0yXlV+9DNvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOjZEj7mcFIVTtlhsPGdBK9z41albFttuYYmmBEz45g=;
 b=Pf3YGvW/vX5jYlsh65W9zMQG51W5Tt0Z2kbOWL05upof0DVxovU9AztrVQ1LBvF4YlimDmxB411zqmIkEliqL+1AM8H0ZfQB6rR8kGKHSDG+1QOuZWLmXYYN08DXpTKv1roUTumpNEedXqQIRwzqbQudVcK/BYEDcLCZb6Uxf5oXIBpSQ7aPyIM/HQfvIR5RJu29CYMnhZvMFndltQsYiwjZNgWQZhy0fKQLBvlEoHk5DbR7t4xwO1Ae7cE69zoiHVCAWWvVzyhNSYzaT9eTqkXNzTaKnVFEN0rfjGNq8mOSBUs/AuoSO6voq69BQDfKcRVKUPsx8UzT4WDrc4+xYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOjZEj7mcFIVTtlhsPGdBK9z41albFttuYYmmBEz45g=;
 b=h5087Zn/CZZjfukuX6C1nDwAQ9rPJNMy6l//ixLUjUGNkLtGiMhwDOqz/qaYdjmw27AvM6EfTpeEkd1D6kxiutZenjAfupqZctOaHlXpMbjQkDIKO4n+9BNhmAq9yohK82YE2bps2K+iVHOmSIDbkZHKQ0aiTJrGNyf3Dywurdw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Thu, 20 May 2021 03:16:22 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:16:22 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Let userptr BO ttm have TTM_PAGE_FLAG_SG set
Date: Thu, 20 May 2021 11:15:23 +0800
Message-Id: <20210520031523.12834-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HK2PR04CA0043.apcprd04.prod.outlook.com
 (2603:1096:202:14::11) To DM4PR12MB5165.namprd12.prod.outlook.com
 (2603:10b6:5:394::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (165.204.134.244) by
 HK2PR04CA0043.apcprd04.prod.outlook.com (2603:1096:202:14::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 03:16:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38fa8af2-e336-4758-2a68-08d91b3da4f1
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB514992948C16394250AB382C872A9@DM4PR12MB5149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hTHPXvEsOuoDLDgbVFgQXPHsMzuedtyGAv1Cae5WZ8LQfgrMB2tf6g7zAk8AfP1GF47DntLM7WQtKfZaXeu6X/qNT+PpUXNz/sqbdGAW6PKG9l/VCKuT2P52skkT+7ausM3ujhbiQxXUO+qko3USYX0rOVxtoo7DfHYtFSNLujp1XAdqKdIZOHRZvskInTNkZMC9xdQtfT+I2sQH41LY5wPpCpIsZ5IvB5xCaD4qS/s8z3BAzB/CUgH/MDHi4EX2Zin0UTRG0Rhb+nwkbtChe5Gs8T9ldRqo6uvC3TMy8mHEwNLl1UX9fymZ3x7hnyNQORBzj/b0MOdR/hfbSTZrxYXrnZN/0pguOaIRi9E8Q9UFBFNbea/oEVvKvOQue9GOzFbOb3OXemAJtMoEXNNSzh7gi9ztR2aQb/98ETXeu7tiYCfyXw3Fv0iIScuQVGe/y9kuShFKzv/mIycN8GiEXTK9QdFBhzxE29JzPrDGPqxM45z20WTV+LNtcuwnndr0XWycEpK9M6cki+bjF+RfV8SQG6M2CvkDWyDeSp1epUbtP+jJhXi17eCsOM2Q9v0w7cykj/sMJ0D7DF5XnMKnUOf1cpbZKPJOl3UMf5qS5y8C+OLbsaSpAFR56SbMpJwoKWMsp+xVNcgULypLgvxd8eMDU1AXxUBSrNpqJzVhBCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(66946007)(7696005)(52116002)(66556008)(36756003)(16526019)(186003)(66476007)(2616005)(38350700002)(956004)(478600001)(38100700002)(316002)(1076003)(2906002)(8676002)(26005)(5660300002)(86362001)(450100002)(4326008)(6916009)(6486002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qYpqlk/ujBCDuCOTWafEXRvepWQRskU8+uqETGSP9cI+Y5V+xxYYajjsnOcE?=
 =?us-ascii?Q?Mrx77Ra3EB+6jeUOx7yjlwZnbTS9DeoBOLgrwK0vChpqz7Cd78qZW01zXmQI?=
 =?us-ascii?Q?oqLJ44UUR4750JNguu1Fp+NysnmG731fHjMzQOyl4XF7z/Ir936Aq6VjSQh8?=
 =?us-ascii?Q?JroU3qKnqyF4ep9shH5CF41vh5lyKyvzbUqk/j74OktI/Fwjs3rcfMf1dBf4?=
 =?us-ascii?Q?7GT/BCYNeVzft1PXMFT6H8ZvqichJaq+nlSh8JXRtjPA3utvDCFuA8gQOlnk?=
 =?us-ascii?Q?DO/yAsh7rzNV+ZaOaFt8q7/HDLXQG76MLevkqQ81daDIrfnQ2xFN/WY7yo22?=
 =?us-ascii?Q?8i0Y4XO3s2FcQjXUOMniu7rSBO7Rba6ZsCTfCsTuqPUytaS8gP9dsdfve241?=
 =?us-ascii?Q?r3/P6zgLwoXk8Gfg8NrkpUSfdQ6/RtAA4uxvDjg3DSrSgEa34z9XYZX05qD7?=
 =?us-ascii?Q?SykV+VJX57Ub4N3OP/UNT4YRrib4kfouUjwMB6IdvocmDoqiGCGGI4GmMIZF?=
 =?us-ascii?Q?pK1cktcg+Vdcnor++fUrNgDVptF9J3LbiYTsIdvRxQEwSRlIQUQwfzAXx5Mu?=
 =?us-ascii?Q?yYrFC5MacGSS2aEfH1/pYDWUTkoXTSJF7oXUDOJQyeVnXhJwDUpEjS+m+jXl?=
 =?us-ascii?Q?4fkLmiZWQ6PVYBnGDN06s+vBWfx1UPPFax2tRDUD2eCqPnxZQ1O1em8U8yJe?=
 =?us-ascii?Q?mwm0GQ6bmJ047vlm/tX2JIcdwCu6oMGa6Tv2gV+VbmwL/ziWASdQ9i7ydYRw?=
 =?us-ascii?Q?dfPZ104d2LgBE30aIfAA1sBW9aUUKKLXLQn8yol9v6BRFIsS1CsLGlJzTCWO?=
 =?us-ascii?Q?F/1HAL7Zf8oZ8U0ArX+dqM6QEgpecscLl9chVWodwhYsv7v5XB1Jxx8imxGp?=
 =?us-ascii?Q?1xjwWvtw+Xtyg6DkINoSliwfZU7IJjJ6bVec40aVz3WfguBV3rCXROsBzRjH?=
 =?us-ascii?Q?1R2aZMh7HbzDDkNKhZv6G0kZ/UgsVm5Oxi8VJtRWUb9k92hHVi6pDoUqYt6l?=
 =?us-ascii?Q?otPCCemEaaRIcbfhrZIEoFfyHIVW5nkhFivmBKODTDgA7lp9DzIjeOwLoa6p?=
 =?us-ascii?Q?GQB5QSvsFk59MXb9b3utFMhmSFJWp3si+XdRIj2fVaK3iH1uaMnlalfYePN7?=
 =?us-ascii?Q?bdN697XeVezyEjycb/NypSLn4t1D2OTjAnOVySHd17xrjfktbdpwiTi8dPsh?=
 =?us-ascii?Q?WkYdZ/5kFIDx1Wxtju1G8sL02fB1N2gKALbylceV55wvMtXQgyVAZOAkF3iS?=
 =?us-ascii?Q?2RKkHIiorKdYPSA4mJ3WqOzkeUIxOHDrIpEC1dpnYx0MpT8F6hsPhpWlVlB8?=
 =?us-ascii?Q?30tG80Aids/Tar+LVWGql5Tu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa8af2-e336-4758-2a68-08d91b3da4f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:16:22.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deqfU96cUa9GBwwglMMLB3grZ7deagdaHpHXTorL46XzVw6h8BvKRrKJiR7VLLkN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5149
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
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com,
 xinhui pan <xinhui.pan@amd.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have met memory corruption due to unexcepted swapout/swapin.

swapout function create one swap storage which is filled with zero. And
set ttm->page_flags as TTM_PAGE_FLAG_SWAPPED. But because userptr BO ttm
has no backend page at that time, no real data is swapout to swap
storage.

swapin function is called during userptr BO populate as
TTM_PAGE_FLAG_SWAPPED is set. Now here is the problem, we swapin data to
ttm bakend memory from swap storage. That just causes the memory been
overwritten.

CPU 1						CPU 2
kfd alloc BO A(userptr)                         alloc BO B(GTT)
    ->init -> validate(create ttm)		-> init -> validate -> populate
    init_user_pages                               -> swapout BO A
        -> get_user_pages (fill up ttm->pages)
         -> validate -> populate
          -> swapin BO A // memory overwritten

To fix this issue, we can set TTM_PAGE_FLAG_SG when we create userptr BO
ttm. Then swapout function would not swap it.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 928e8d57cd08..9a6ea966ddb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1410,7 +1410,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	} else if (flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
 		domain = AMDGPU_GEM_DOMAIN_GTT;
 		alloc_domain = AMDGPU_GEM_DOMAIN_CPU;
-		alloc_flags = 0;
+		alloc_flags = AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 		if (!offset || !*offset)
 			return -EINVAL;
 		user_addr = untagged_addr(*offset);
@@ -1477,8 +1477,6 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 	}
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
-	if (user_addr)
-		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
 
 	(*mem)->va = va;
 	(*mem)->domain = domain;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c7f5cc503601..5b3f45637fb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1119,6 +1119,10 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 		kfree(gtt);
 		return NULL;
 	}
+
+	if (abo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO)
+		gtt->ttm.page_flags |= TTM_PAGE_FLAG_SG;
+
 	return &gtt->ttm;
 }
 
-- 
2.25.1

