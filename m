Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DB275A8F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ED26E9CB;
	Wed, 23 Sep 2020 14:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782E6E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1OScZJiMl3zGVk1yCedfA2AywokAWZoz/BSF1IJeAomPa+hOLSw92zwIGh9PDc8ZsdolGoq/M/MLquilf5/AdfiQzxSKSd0LdB9iJRYCz0IFhQMCRKRBuv9G0RebnRYMU9p38u2xbXDEiYZTeSuOiqcwYGNsp6RzS+4HIbaQJOtJRrcLrAMg9ucZbM+peroF6Ns3uJ51vyE/dE+zApvwUTzu6itX/oA83wtL3PTOBkQq/obFW8roFarG1Zy1SeOmJRiSXdnupct9xbW23YRLRuS5U/4ebQbbXxsqlstDZby+vrAUlhyIUv2OCBuDJGONo7/axrl12KvKDDGK//7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xm7y0S0VxaGq61La9EcKe1PrV4X/+Pf+IcWui9Ohq8=;
 b=c2CR0gMcLlt9XWBktMuGzt0cPQOQ08HQVTU7her2H8bJT9lGe47Lx2Xivpn8AtHRB7cF0xnQTonkBIxTjwCcM0Ysj7AIm6mPMBsjscs7ODgiClLcAW7/G1u97H5tV0QuNEIDcwbZrUj2H1B33oG6DY5Jwdwb7ee0Q2NoKYUqw1CMvJY6h3NVeZ34lmG/GpUEF4hi4RJXdwMaFFSs68AZ8fjBFV0w4kSKjfbbdXGhSHRaLjz40nSF2uE09jRpSXdotT+vH9yM+WnJm0Cb5JD2YiWXY00wzyA95w9YaqE6fSmANZXoM9UZ6gOufdrld0WzAEmZpj7jmajvZCGlsnIcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xm7y0S0VxaGq61La9EcKe1PrV4X/+Pf+IcWui9Ohq8=;
 b=uf16kxlMYgyJM8uqVEkYuec+SB8A5S2HaYI/2NTHTyGi3f7Jrqu4okkYsXlGnv9DxJkWoSu3mjw9RI30WmmvZVElPwX2vTXozEwxdM+KCT3EsgdSqc5mvPtiIi2OK604BWE1sDCL6DBciDhVwYk6TIKTdmj3ju2Ie29KnSgoarE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:46:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:46:03 +0000
Subject: Re: [PATCH 07/10] drm/amdgpu/ttm: handle tt moves properly.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200923030454.362731-1-airlied@gmail.com>
 <20200923030454.362731-8-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <51eae609-0ea5-d204-f34b-ea5d67989760@amd.com>
Date: Wed, 23 Sep 2020 16:45:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923030454.362731-8-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0118.eurprd06.prod.outlook.com (2603:10a6:208:ab::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Wed, 23 Sep 2020 14:46:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12c7d5ba-762a-40d8-40a2-08d85fcf653b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB423934F414AB3F0ED46B1FA783380@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNwrp9xqFNAGVUEheLcSaC2v5Q7y6bGjVrAeAdNZ6fLZS6RJFgVMczcRwtzo6Y+3dsGmb4m5xONiTVBYhu/E001BPoOO8PJ10SDrisvlmKMUvpPS4MUSSOffHE5n6TMFmpQ1VVAwZGsVUa211zGq5VKLA3uy4LdpVWG46JB30bX5G7pyGrVHzoVx5Nh5yfh2xfGnPkAWG1CnYaQEYiJTZST8Oy/ejRGi1M65X3FLvieIJRsv6E8N5aZ8ReMtjePS9oAUClAauru4L61unDun0mwMYaAG+BHnwpB/7oS0PCTNCmSIN12ojyDA/yopA6UBtGMI9cMOmZeNIZ9ERo+pTr/HpOnxA06UDX3yotDt3ch6PGf1VN3j2jgcAI5696eb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(5660300002)(2616005)(86362001)(31686004)(16526019)(186003)(66476007)(83380400001)(66556008)(8676002)(8936002)(4326008)(31696002)(478600001)(66946007)(52116002)(6486002)(316002)(6666004)(2906002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: TfatwKZWxxmfEjqU05+jJrST8+eCBUKahv0b4zS0r2ynt9hOXzuZ6bshwD5ILRbPxFn4Ix2PUJojqrQ1fQ7NsX/XkYwxR2ZYhhG+HTKq+YyHKpGxVGOzYuMWhvAOibV124R7bWVe9ZLTshVBl6BckRSljbovuUu6mzBzCvlassltmF1NOLo5zSFoJlUm38Y/wpn46lgn9CdOoTiQWuSlichvQfhkt4aRfChNuNB8mojjYxDJFIYJq1NwEawnTejqMPuBUEwUhyyoGqIbabvPJ3xXKdbBdSIcxWRjDZQtKucPNwoZ2Y6YVtjdtv3cmQ8mUqna05TvIQ/rmJQZ6eY4sDK/vZLGh/E+KLlzoSVCWXR45NKe5U3Y5zfiDjUbO9TsWiaqRbsWRNQhdouFxukXMCe6vFZVDDmwX4EXFbYDvkScq1ZflIKCVwH2826YNfwKqEWi0/Mp6KqWR4jFmPXhpvrvjwZfH63KhERpl0CPmsuxtzOS/AkOleFI8CmhV4ubFFeUeEF9a2FgtXc2eFlIGm1zCzbCm6b/zW7S2jq+HOxbBDyMzgQI035+EC3cqJMNtzXF6aTlio0sfX6TZ+C74F/wkgyR74hu6TflgGNQebK3e6MTLE0aWSOn+ZxojcaPjydOQx2j3Xp1n9ESE9qVsxr8umZyfR9Trnx1quDn+nbb8JeSX2XxYWac+/YXA82aNi1AIJdM0YUWjS0HEeQYCA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c7d5ba-762a-40d8-40a2-08d85fcf653b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:46:03.5265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2PGUCnjBy34DmCirXbaOhxkCbP0PfHaU52TVzklj4+kikrruRe2xpsyaFUE6GRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.09.20 um 05:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> The core move code currently handles use_tt moves, for amdgpu
> this was being handled also in the driver, but not using the same
> paths.
>
> If moving between TT/SYSTEM (all the use_tt paths on amdgpu) use
> the core move function.
>
> Eventually the core will be flipped over to calling the driver.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index db5f761f37ec..d3bd2fd448be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -671,14 +671,16 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>   		ttm_bo_move_null(bo, new_mem);
>   		return 0;
>   	}
> -	if ((old_mem->mem_type == TTM_PL_TT &&
> -	     new_mem->mem_type == TTM_PL_SYSTEM) ||
> -	    (old_mem->mem_type == TTM_PL_SYSTEM &&
> -	     new_mem->mem_type == TTM_PL_TT)) {
> -		/* bind is enough */
> +	if (old_mem->mem_type == TTM_PL_SYSTEM &&
> +	    new_mem->mem_type == TTM_PL_TT) {
>   		ttm_bo_move_null(bo, new_mem);

I would feel better if we nuke ttm_bo_move_null() and always use 
ttm_bo_move_ttm().

Christian.

>   		return 0;
>   	}
> +
> +	if (old_mem->mem_type == TTM_PL_TT &&
> +	    new_mem->mem_type == TTM_PL_SYSTEM)
> +		return ttm_bo_move_ttm(bo, ctx, new_mem);
> +
>   	if (old_mem->mem_type == AMDGPU_PL_GDS ||
>   	    old_mem->mem_type == AMDGPU_PL_GWS ||
>   	    old_mem->mem_type == AMDGPU_PL_OA ||

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
