Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F8360015
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 04:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698BB6E4E6;
	Thu, 15 Apr 2021 02:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0FD6E0E9;
 Thu, 15 Apr 2021 02:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQzBk+q8WDxjd2KAWArg9wFJQNpw8JrZM4eTdpdcrThTH81WaR20KJ7PPlzm1z4nLVWMInk4cVrcXo9nhyey40soL47IyN4BkD2i9afuTWhi01tXbDnv/x0w3SlAIcyaRtUMXseuUVoncFK2RE0efCCqNxc+aMlqXybt2x2EntrQiV7X+hP3wCwMWDFa6Ngdllpx6jvhelbnyWbXEFJXd8to5eoA6dPNvVSo+lQjC7MS6YbbvtoIT1MVrjidmKmrZBCph/s7Lgy+XeaZ9YD1QiFohydDmpx9OhNuCMyrCjYcrevoVwrADAHyir1GVlOgklhf6LYQ6eGoM8oyrgm66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri/tUjTulPGEW0IrHqxeOGyJWitWHe66p8XvVNVStLI=;
 b=MaLmpKEpR1dE32k4yNR8T3ltPPNC8hZpAn2SIbXZgiCOGB8Uyv6e+/RHiFdN51HrvA711oMDrJWb09Qbv74zdFD4RU+OjOXsaMg8mgLwY/sbVMr9uZeOKv2IrAQTgKqKIZXO4MgvClwqtfBYSmgLs84k9kMC9d02/haGXiSW0oKRhgROMpwoCuwSUt2Nw0yzOnwmwAQJWEEMyzWPDjaHruO2d1poZG2yN66h5kAeA/qI6KAupJCrIjuBZeOT/3WpkRWQOq4mmtq6i48PsXSODQQJtQKXdJA4aCH+UwUaGDGHrIPxBoOsNFJATNELiOCgauKKcqb1hCZU8sn9qgCVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri/tUjTulPGEW0IrHqxeOGyJWitWHe66p8XvVNVStLI=;
 b=cRt/mfDbsiFbNllNKvI+BEOhzZvn1gQ3MdqvuOykmztw2zjNXFD9VID+IWp7mfxCkiE2qQskCSX2AjXc+6YH7e6gYHXBs4pbH7xBu1ehnTJjqJyDn52jKjmDETGHEySr6b5eNCZa9S+1s0cMCzSBSWTYc2fPicAurmlua0fQdWk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Thu, 15 Apr
 2021 02:40:29 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 02:40:28 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/amdgpu: Remove verify_access shortcut for KFD BOs
Date: Wed, 14 Apr 2021 22:40:13 -0400
Message-Id: <20210415024013.15522-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415024013.15522-1-Felix.Kuehling@amd.com>
References: <20210415024013.15522-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::22) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 02:40:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33913512-f58a-4457-14ea-08d8ffb7d46b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42066A0E4BF3C85803DF95E8924D9@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ewR3accmdrlTMLPWK927m/Esle6bg0DIizIT6Oz5MSIdjq7NEt0praOMfTiI/cond39f6PsZgSVF/sCmjjVjEo1nQMk1yrMqA5XW/ZuX+HAyog1iMxAQZC3azdEoEA43bMN0P/d2g75Ye0vO+Ybd8FJ7ILjVKkp9LUpK/u+NC6nOokD0NOg856pojZzvyqILUTuR252WHC0HcE4OkIFmkD5pgxkc6z+bNGI0p/gZ8Rfu+eSE4AlzT4IMB4GHd5G8IBvw9sVwzVjBZeTkZ6vUi8Ubgl3JLA7H+qb/XkDmL70H3N7KPYewnRvRjW6LgVtu3G3i2ybKlZdpCfSsSp1r84dwCZIDmuPfZPiuqO3IEnBnoJLroDPg+RHKCi+g4RayETD489/E+hokMYtCr54K1dPrTDWgEvBxbmSLEASeLEjBJC56Jidj6SjxP8H9J9x1SbhkElqXr+KfQowXoMBc0Z9yjUs0MtL2/kyS6CH63d10S5fPKMBZJPB/fbQoGxQwKT4fumZ/SgGMlfBZaowBmJu85eQacJIkBZORbQ605kvvF6u8HSGkQ0DfGY8i/2vyj3mHL2VBGP5RIwODQZ1rz+S2kOwZau4j38sPqbzBlL0xIFA/zoKZ6c07a4CS8DZvZjoqSo8H30qzFt/sD3vlGe2a6+XUnHUNqkvcTU9Ago=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(26005)(8676002)(7696005)(2616005)(956004)(16526019)(186003)(66946007)(6486002)(5660300002)(1076003)(4744005)(316002)(52116002)(38100700002)(15650500001)(6666004)(8936002)(2906002)(38350700002)(66556008)(450100002)(4326008)(83380400001)(478600001)(86362001)(66476007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jD6zwHvW7p+UhF8/h/K3aINyYXWjmuBIwBsWQtGWzlECmcOqZXYPH3kRIYOS?=
 =?us-ascii?Q?STvFaGUqm/ZM8boWSlSZLrYdrbLHius3Fa/S/KZJbLQEWtXE7n4/mCCNPp9l?=
 =?us-ascii?Q?sScp9e39wlhU7ZM0lNpisr4JeAtDTX69C6wkENMUvlOwWq9CPuDaH6dmvfjW?=
 =?us-ascii?Q?vocxFGoPmsKcLuaWmAjlWHaSpgaCdAq4e+9bwLHzD32AVqwES8xJNl2XcCIB?=
 =?us-ascii?Q?iNkHCiIfgZDUKGXbdvhNEvz8HxXv34XG3beSDmUf/qxgAMzBNZCJgYUgaWta?=
 =?us-ascii?Q?Ohdk/+RpexZ9JdDXLVFiC6ZsQfI18ocLNSiKQNsnMi25vsamB1azvQkiqama?=
 =?us-ascii?Q?0T2mIVGKOMxFtdo79WWimON6tXpDvm+fiS0jhSYvuxGq9tXWRsMeAOjFuFpI?=
 =?us-ascii?Q?tsiuO0R6nscsReYILaEINJOo0V6PGn2QGiTK6W+jmeaSrIdFxFUqEI4/tCZF?=
 =?us-ascii?Q?maM0YJawy0N6sPKZACD7PfhkqMJUPe0rvGLxNwVSzd5pPeWdcl3kTwSzkm4V?=
 =?us-ascii?Q?jJTBCeO/E+YMat7Uk9J19CDL8U7iQYYcwRSi7LraIx9Q0Uu00Z7MVy5u43Ct?=
 =?us-ascii?Q?gXd9Hj5kkjuV7Ewlx5KOJBbrVbt6DxLP14REBL1ftIQxHQbWJbSFgYlsbz0B?=
 =?us-ascii?Q?VOn0EAkZQQ2qbUMUH11beI3PAjbES4jLa/KzNV63u5tuaB/3d8TXEr/FiN6L?=
 =?us-ascii?Q?VK35d8B+ihhvHv8/TORByDIT9poLCC/TYVPwHpWq0Nbd7b8VnUS6XaycSPps?=
 =?us-ascii?Q?0Vhddo55AmswbCQeLmRDiO5o7Vi5PH6ZQsMusmdSGZypHGVuwGfKEDnm6Vn8?=
 =?us-ascii?Q?gZDaWRHc7i4vzySGbDjBLXM3oI/lJwLGzorj4jfP0ISzC8lUX7wMpFglzYG5?=
 =?us-ascii?Q?dwwancBIsnelEZDfFPRy617iX0A/o8IA3AvcWiL1eVMs5Xj/Y9KeNElfjn/X?=
 =?us-ascii?Q?cUbg4CNZa6MwvAmzVJAxdJsMr83HqjaBKTiupqrTK8wj/2NRgHZLh7gptfGN?=
 =?us-ascii?Q?+J+uPeFcdgU53DCzRtrk/QL4EUZ4lhDulfISyvJ/8LQSU2tB+gvS/k5GHzqG?=
 =?us-ascii?Q?T7iy0wnTH9xcnMsxxoZG5YNokbleeodXwX2PtgdLHKMRlMNXdpqctjAUmS31?=
 =?us-ascii?Q?qIkcqT8QFldkY/bPuKreJm7bXfEobu06X1JlDE56Sz951/3I4Iiiz3ab/Qyj?=
 =?us-ascii?Q?EEIGFuBVOdda+U+EGcFgRleVxVaRJGu8qz9Yr1oJuOPJceSuMqHyNUh4bBgB?=
 =?us-ascii?Q?THRrvSTqgQSmzQHSHFZrpq/ywAEVJWDl95Sbl+DEFBpVXyOJSmrXcCm4BxcS?=
 =?us-ascii?Q?tbCeiXJpRPwwhHF+dlB5bIP7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33913512-f58a-4457-14ea-08d8ffb7d46b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 02:40:28.2642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5EuovRaKAvPklGhnabuY9fiSOnEgXxkyPHp0ZJ8VMJoZOyYRTemPwFe/yHnacuLP5UDs0ZnnmENrK4cxT23ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shortcut is no longer needed with access managed properly by KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 936b3cfdde55..4947dfe9aa70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -165,13 +165,6 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 
-	/*
-	 * Don't verify access for KFD BOs. They don't have a GEM
-	 * object associated with them.
-	 */
-	if (abo->kfd_bo)
-		return 0;
-
 	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
 		return -EPERM;
 	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
