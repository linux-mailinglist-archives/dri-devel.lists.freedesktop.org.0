Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439E32EBE3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 14:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AA86EB79;
	Fri,  5 Mar 2021 13:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48196EB79
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 13:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOiIq8fX2510fGveABwpTHDG16knwpVa8k/+eJKffvlQJcNkgGT73/35jfGiLQZ8ZoLZPl2lvlD259cbThS4RI59FIP4yBltVGoK8pPdaXprJwNF7qCBYKwkq6Pdy58rKcrQimNVzKEP9GyDHjbe0BQna5Lg1bOf7kWoSytWKEbyagXcazAo33YBmJcsI7NJgBXA7HdreXIp0IZLDw9h5dfo8/GSg0MEDrI/uZEguD5VAnmuesWw1womvWH+jwaBcr5ea9KvXEgKmVbLC3jCpOslNV7fvzmBSbumuAwXd0nmjGjWJcMskn94akq4wvunR/oT/zhcuaNzL64uWO0lYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqdU9VyFMZeuMpO95QX7U2ZBKvUSUs5UuJ3SHNamwi8=;
 b=dLSogHnL8kld0XkecRbLw2EEvnNMMR3XwdVFxqGzogCZtB8NuODMspCyWnm+g+NGpk8bSN9gISysSGjGU8ohv/EhsHDTsu+fwYf1HOF5hEZQdWvsFx1ajwrF3xW4ZMDAvlul8u3OmilhbEkoJhy4goqsjYhXWgilrCZw7tzGEGXsdRh0WijvsnmPAK7xv/2wv6wW674wVWGaVIm+LmPZ8KoM/xHFugz1itOUHDtjaAhrgsPU9vAGMAlvatmWLPsF+MWUZLgaJYDKIBVRFA7GENOrorUH3iy30YgijVq7FsKCb7LUaxq7E3k0jrUfZjmtOON6uNfC1olcOJK+0t2HqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqdU9VyFMZeuMpO95QX7U2ZBKvUSUs5UuJ3SHNamwi8=;
 b=QM3AQL/KRdakUP6LXsVzL+7+wdupczYC2LOutAQKZfsT2ip1PfuxNvgdo1ndfqGzyYT12ennNek34pdnHbSjF+7aQWHPAshUDtTwUMtU0xs/YRmL5xcACUKquXnvqq1lAuqewungG4Diw+mUMmPpjVvBdbK6taGvFafDz8DHQ2g=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 13:08:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 13:08:15 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: use tiling_flags of struct amdgpu_bo_user
To: Nirmoy Das <nirmoy.das@amd.com>
References: <20210305125659.9923-1-nirmoy.das@amd.com>
 <20210305125659.9923-3-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d37e05ac-2a07-4e9d-1c38-e3909c00410b@amd.com>
Date: Fri, 5 Mar 2021 14:08:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210305125659.9923-3-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ea67:7c1d:b656:e8ef]
X-ClientProxiedBy: AM4PR0701CA0013.eurprd07.prod.outlook.com
 (2603:10a6:200:42::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ea67:7c1d:b656:e8ef]
 (2a02:908:1252:fb60:ea67:7c1d:b656:e8ef) by
 AM4PR0701CA0013.eurprd07.prod.outlook.com (2603:10a6:200:42::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Fri, 5 Mar 2021 13:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94f05cfc-a19b-4209-51fa-08d8dfd7bc98
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB433553CADF8AC4653DBCAA5783969@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpIcqDgNsnJB7b1A/38GOrUQ/QhEV5UKbXiZG50mzOAsmJlftlqM5rc3qHJmB50rCbL8ZGWa3PwDLH3tpJvSLzRk3viwcKa0KSkMZw/HLe5RXl9ta13CIG44v8tNgFCwTg3/nBim7mp+Q8aDA/oPqwryeCwxQ0wOE84xbKPz9NysdeyN3Ab5pMZeHOHXih/TSBTpCQbEJI/1IloJ0VOW2tO1VqBD5IAcX0jgVlgn3XuWzye93BSAMMfUYsQR0zxOFcgBOPW49/sxjlgN+L66YTl6JUSXNRhETEEYCoPxJucQP1PgGRt59tJKFhmXyxkkpXGUbfQGHn/l+P2tyRiTDEvK7kDI5xlp2WLzOTex9YO0fTAWq70dbn1xEJmLkoVkA+q8Sapeia87uChd8OjlZKsJP301CmJPJXJZavLA/hh8teeyjtrTkaWXhYh/2etl4ccp54J3MqyDmjwS8g4HrDNeqceOMYvuAlz1uUpWQOnHhO4WFms0Dp/NWHVJbkoYmlY5YoDHKetctLEN7SOCTqU6xtBD3M7zxYYFG/LxbJD5wLdl7YQDK7QgbtGBVNJMoX4oimpRM2tiytECaSQoaOpIvuBu8w2nfpI1KImY12Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(8936002)(5660300002)(37006003)(316002)(31686004)(2616005)(83380400001)(6862004)(8676002)(36756003)(52116002)(4326008)(66946007)(186003)(2906002)(6636002)(66556008)(31696002)(6486002)(66476007)(478600001)(16526019)(6666004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXU1dEoyajN3T3lmVUFYU0hISkk1RGk4dVVPNTFKYU9GcXJJNlJUR2NyUUly?=
 =?utf-8?B?c01CQlhTdDhXZ0orNGk0V0hRUjRRb29SR1ZMYklHaVF6L01IdWJUTWNtcGxo?=
 =?utf-8?B?bzFqUlErc3FMd0VLckpNYVpFT3czdUVOZk0rRGQ2dUJESDI5WkZJTWJ0bnox?=
 =?utf-8?B?UGkyM2MwcWUrWlYvY0dPcndWZlVkNy9ENnRBMEpVVUFrTlZ2YUtXM0VxYlFz?=
 =?utf-8?B?OGYxa1Vid3JOMVJzZUNuMlJmT0RYLzhpS3RpaWpteVkrbUFWZnhYeFhkZXZv?=
 =?utf-8?B?Q2RibmlEVzNzNlhER3B4em95Ym1tcTdTS2M0NnU3b1dRTC9Kald4Umk3RjNP?=
 =?utf-8?B?dGQ4eFFmOERYRDVHamlPa3V6czFZbStlS25wUll4ZVlHZjhVRWZJR0Z3UGJC?=
 =?utf-8?B?eXYvd1k4VlRPbm4xNkhzT1QwV3ZOaktFR1hrTjhqOG1Vb1gwRjRMK25oZVho?=
 =?utf-8?B?NkN5VUpmcUVoTnQ3Y2dGb1VGSnZTRjRvdTZCQnhlZWFqUlBJRUt4cTNWb2Fp?=
 =?utf-8?B?alhRK2o0TjNwaFlxU2lSakxWQlc4bndFcDBsMFVVak03cDFYRUhlb3lGcjMz?=
 =?utf-8?B?RlVMS2pLcmRINFR4YnZEK3JUVUdOVWYzNzFWR29NTFBZTVFBa3haVitsYlJW?=
 =?utf-8?B?VjlJbnpVMXJ5dkQyRk4zVFFERzNKU1hERW1QWkUrQUYxbUxoay9aWTFiOUV4?=
 =?utf-8?B?dHQ0NVJPc3V5V05Rc0RqMWQwMFN6VURFbzFHalFueDNhdWd3bUM0SWdpRnN3?=
 =?utf-8?B?RTdlNHlma3VkZGVoei9Qam9XdWJCR1NtU0ptN1V6Tk1hSHEwdnRmeW5iMSsv?=
 =?utf-8?B?Y01HMVFpbXd4WExCMFRERFpSYmhYL3FiUk9TOUQ4UXVpUG1hRG1NOFhpZkZz?=
 =?utf-8?B?dm1oaGVZVWV2TlA3QmMyZC80WG1NaFZnekk3TkVjR05ORzhySWUvdlJmd3NF?=
 =?utf-8?B?WnhSRktwckROcVpWc2ZzSVVQaWtjTXBsMjAvWlZiVnE4WmpSN1RxZ2lJK21T?=
 =?utf-8?B?TmMwYXZWOVgwVVh2Y1N4ZndVSldMTHlaRFQ3OGREdkEvalhuQnRYcTVFNTlw?=
 =?utf-8?B?T3E1VkMzSHVoR3JOUVk4c3o3Ti9qS2IxZEN1NVY3Zk1BMWRJdCtWTEJWREFT?=
 =?utf-8?B?K2dhSXl5cXlwZDRKVWpBeG1KOVdDc20vazJJem5vczFFUW0vNWhBWGdUNndq?=
 =?utf-8?B?RzlFTjByUVdveWI1TndVeU1mclJtK3FnQTlOcWs4OEdaRHdDaVkyZExKWkRF?=
 =?utf-8?B?NFgzeDg0OU9VOGNxdjhkdnNGTVhFazVNdGFjNHRWWXZWZ05MalVGeGVHU0RF?=
 =?utf-8?B?QjkvcjBnWHh5VHRoNE5odU9KcnBybkQwV3VDVnBpZ2o1VWFZUXBSYzRWL1hn?=
 =?utf-8?B?SW9aOCszQWtBTi9DME5SWG03cG5ia3o4M2F3UDE1LytyNGFCTVpRZWdoNUwz?=
 =?utf-8?B?QW83UmlNV3k2VEkvSDZmTDR6VWF0S1RIT2RQUGVsYWJXYUpWQkZydG1xeUFi?=
 =?utf-8?B?SFprVkdQdXlneXhMREZPWkJQUTVTU3g0dFFhWk5ETmh0SjBwbmEwdnBaVjJj?=
 =?utf-8?B?dnFTa1VkWTM4QU9mQnIzbHpYaXJKOTVyMjZxNFc0NHJDUUxVWHdSYWxlRHhQ?=
 =?utf-8?B?MVdXTVNKeUFIb01kQ0gwbTlpUVMzcjA2WHBtS1B1MlJSUlJPMGw5OHZBR0Ri?=
 =?utf-8?B?WldyV05ZMndJVkFjWHNPWFVUWjhQbEErODkwbGZ1NkJWNlJMS21vZnNVVFFM?=
 =?utf-8?B?NnQ2a2FtS3VQSTJSV2tQTHdNZ3oyYk11UEk5NklwVy83cVphdEpLdzZGWUxo?=
 =?utf-8?B?dU5mWENWSU0zZEcxQTNjaWxxSkFNcG4wYUpHNmdwY2wxYWp1QXpaRXZVc21Q?=
 =?utf-8?Q?bCg6kX1YHpivr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f05cfc-a19b-4209-51fa-08d8dfd7bc98
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 13:08:15.1345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbXmW3/Z/G53lsZ83B1lYG6peL6kUsJ66rH/Nzv9bURM5IWRX24mFPMb4ArX3RTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.03.21 um 13:56 schrieb Nirmoy Das:
> This flag is only needed for BOs created by amdgpu_gem_object_create(),
> so we can remove tiling_flags from the base class.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 19 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 -
>   2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index f21679f38383..c19cb6863966 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1190,12 +1190,19 @@ int amdgpu_bo_fbdev_mmap(struct amdgpu_bo *bo,
>   int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling_flags)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_bo_user *ubo;
> +
> +	if (!(bo->flags & AMDGPU_GEM_CREATE_USER)) {

You don't need the AMDGPU_GEM_CREATE_USER flag, just test TTMs BO type.

> +		DRM_ERROR("can not set tiling_flags for a non-amdgpu_bo_user type BO\n");
> +		return -EINVAL;
> +	}
>   
>   	if (adev->family <= AMDGPU_FAMILY_CZ &&
>   	    AMDGPU_TILING_GET(tiling_flags, TILE_SPLIT) > 6)
>   		return -EINVAL;
>   
> -	bo->tiling_flags = tiling_flags;
> +	ubo = container_of((bo), struct amdgpu_bo_user, bo);
> +	ubo->tiling_flags = tiling_flags;
>   	return 0;
>   }
>   
> @@ -1209,10 +1216,18 @@ int amdgpu_bo_set_tiling_flags(struct amdgpu_bo *bo, u64 tiling_flags)
>    */
>   void amdgpu_bo_get_tiling_flags(struct amdgpu_bo *bo, u64 *tiling_flags)
>   {
> +	struct amdgpu_bo_user *ubo;
> +
> +	if (!(bo->flags & AMDGPU_GEM_CREATE_USER)) {
> +		DRM_ERROR("can not get tiling_flags for a non-amdgpu_bo_user type BO\n");
> +		return;
> +	}
> +
>   	dma_resv_assert_held(bo->tbo.base.resv);
> +	ubo = container_of((bo), struct amdgpu_bo_user, bo);
>   
>   	if (tiling_flags)
> -		*tiling_flags = bo->tiling_flags;
> +		*tiling_flags = ubo->tiling_flags;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index 332e269c3fd1..7164c0799534 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -91,7 +91,6 @@ struct amdgpu_bo {
>   	struct ttm_bo_kmap_obj		kmap;
>   	u64				flags;
>   	unsigned			pin_count;
> -	u64				tiling_flags;
>   	u64				metadata_flags;
>   	void				*metadata;
>   	u32				metadata_size;

BTW: The metadata can be moved to the user BOs as well!

Thanks,
Christian.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
