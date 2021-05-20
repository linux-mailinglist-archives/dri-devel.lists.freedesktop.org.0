Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D4389BF2
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66336E832;
	Thu, 20 May 2021 03:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135246E832;
 Thu, 20 May 2021 03:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lvs4/UI67ayUhmsOfUN88Z7scQrdMZM21pSRtB43BeBbj/5XEnm41YszRWqO7aXXeDFLJR01rdq+qpmJ2OfE3gdA7BKzdBpI/xzhIKOWWdaul+uJgeOCB/2rC+JnLAn0HvxHZatWfOZI5mGOKvlNV4wW/Y/PrvcaUrV4lsLa2viGNcLibEEM5XVRxAy0a6TdXvPAZ0WL+3WGiEyrbgEUZg8+mpAkwDYSgN7UMgEZy5z4YaT4sgjaJ2UWOhRnUNbXQS2zGscTNwgHnKLlgY85FqgXKOLXuvAd2YU030q0bOh+8fAN2CyE5ro5BQpeTWC3XDUW5knk9s715loYuFkU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufDOzskts/fYT1CElGhyXyk6pf3A2Tg5uiTy5kfKRzQ=;
 b=RTxgJLLqZVFNrVVvUJf3aETDaktnLTjhHtNSoT2iHTwO2VM6JufvmF5tRFPk778cNbAF5uJ2fcr9AgpqVSw60S+f8fWCmwt9gXLUP7UfUjAVrTvpkGBz1Dt47lrtB6vflY4E3kygLV6GTsRsUFkPx/XBjawx+jrLYFkP5K7G+6pkBY0XOIyB47napFSoRj/qJDfEYtav9Hat03JH094VYhMJM6OfQm/fvdivLSnVHrZ8fNWAMKSft+AtLvDoXs4i2Roj19KpQoMtLsKTxNr032t9weE01kYX9zv9NItaJFDxzsXjWrHTsClJqn73l5UDyu5kdC7sLsmDlUJMuifitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufDOzskts/fYT1CElGhyXyk6pf3A2Tg5uiTy5kfKRzQ=;
 b=3ogwoSTnM2W2eUHaQVjp+uF5cKqTRVS3SoFmDQFSODPSmCVDZFvbBbag4nZ+UdqjqkP5YB9pWpKJ0P3PfMmxU/9sds/5s5gTGoTXliuKhJ7bssnbuRwabMer8T7HB/X5l2uHn4BjQdJCMx1TXV1nouOFZYidI0tOp3qzQ0w804c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 03:37:29 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:37:29 +0000
Subject: Re: [PATCH] drm/amdgpu: Let userptr BO ttm have TTM_PAGE_FLAG_SG set
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210520031523.12834-1-xinhui.pan@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <786ef553-430b-ba98-952d-68d7b33159fa@amd.com>
Date: Wed, 19 May 2021 23:37:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520031523.12834-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Thu, 20 May 2021 03:37:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea9629f8-8126-4509-28d4-08d91b4097fa
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5273D28C0B5889DCD7504918922A9@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Sf8k+Cpd2cgOuNmvQNNDCPyumsM6J22T17xDj7JIazGWQTH0YErgmxgoqrK6Bso4zqJQVgPOhmJQtw+vJCLFvg2xHwiUOS7pDKbhPH6GjEyXqQB4FAUVEW59JqLZeC8FCfg6oL6eNBQ3YzKnb+aiaeGM3mAJpTW61j/OFtVEcupPXYLU1YB8OZqWQ4iknNRAGRg+KoppYG6aLXdoINxmtr1jff6TTPiMAzs5PFgVrzV4HAeomZVEsdzUOePXBnEnS0M9JL6uyTOwGr1beg2/88rBVdaGM/bZyYHxcOocoJjz6D74jljVl7xLMDDi3ALcGmYe1FtG/gX3KfZJrb7OTmYWQlHoQBVcrJMtCFP/8R9SHAw9YKbaWZWwo866oW5vUALHK8Wt8oOWim24okwUr9t39aMAhlbH0cQm/VUJ0DyV7Ma9RntUK6RmzGMMlcFQplilZTEPJ+l6dEOQIt2a+W3KSBnpgMECQ0aeHTqysJFGzMdPo2EuQYtOV4JM8Dl518tIcwMdjdBSXX7OWWUQR/7daGuMihP1ur3PVwfCfSMVKqj3E2i61OMzz5q+W351nBO/Rc+IySWJbvRJ0NwdC8MAddQpQF2lxjcpPvum7/WSC3+7hUiFKcfaMQ8meHzg3Jx83UX+eDmxrXX4IdA4AcZUKZxjgSzSHiATLRyXCfPMgrMhjpL2TIfSr2UrAhh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(2616005)(956004)(186003)(16576012)(450100002)(316002)(5660300002)(8936002)(2906002)(8676002)(66556008)(36756003)(4326008)(26005)(16526019)(31696002)(66476007)(86362001)(44832011)(6486002)(38100700002)(66946007)(31686004)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N3prTk82cmdkTUNaa3NqM1k3SFJOMm1rNFBkR1FRRDh6aXZidUdJeG12aWxi?=
 =?utf-8?B?M0VtSU9uVFd6bDZzZmI4Wm9NQ3QvRG1MYm5mNUVCUEJqclJmNVdRWnZaQ1BN?=
 =?utf-8?B?NGxkdjZpbFFsclN0a2VGRmUyTzRkNGRrRlJEK0ljN1paU0xYdmdDZjc0dExY?=
 =?utf-8?B?VkY4YUZpRmQwb0N3UzJtRnVNSTNoWjJiNTJVQ0Jwa1Z4aXN6WEJRTXo4QkpT?=
 =?utf-8?B?ekg0Si9GVnIvNWJaTHhJNjZwNDIxcFFPZUFVSng4WHJ1MkFoYkUyaWF2RnZL?=
 =?utf-8?B?cmpKa0dNdXE3VkhXSFZSWXd6ZFlIZE1UcjRzamh4c3RhQnVMZzNuTXI4OWJz?=
 =?utf-8?B?TXNyYnIyMEpidytpbFR3Si9nVkZBKzltN24waTBjKzZqamxwaXMyRWIwUTNa?=
 =?utf-8?B?aGVDOFNSZFhPejF4d1dNa2tadnVhVkQ5Z1dmRWtJMUJsTW5IVDF4MXp1T2Fs?=
 =?utf-8?B?NXVnVUx0U1NBdGliWHBNVkVxWmdxMHRPMUtBdk1CQTQ4Z2xkS3k1b2RPNk12?=
 =?utf-8?B?V2p2dnU2WEJFeGREclA2L09aNE1mTHlvcVFuVkM3THk0QlFCcE1Ta05sSFU0?=
 =?utf-8?B?cmIwb1RPY1M4RjkweVFMZG4zRW5mTHNMdGlxZ01RNWo2Y2RldlYzQWplT2JT?=
 =?utf-8?B?ODZOUkU1WDE0bU0xUzMxcGQ3d2RWeXBlN0tqeTQxdHREVmRLd0hZRm9MWnBo?=
 =?utf-8?B?dkd2QURxbEN1NWZUVHB5T0pSam0zM3VqWjJKeTliZzI5elRwNytIWmx1NVVP?=
 =?utf-8?B?dlJsNnh3WEUzN2hJWXZ1VFp1a2FPaEhXbEduTThmdW4xSXNHelRsQnp5Mmhi?=
 =?utf-8?B?ck5wVDB1YzBubldXaDh3VkFjMzAyM0FBbE1sMytUWXppRkRlUTMzcndpeisw?=
 =?utf-8?B?cDdZcU9IYmpINTV0WFl0SmZ4QkVjS1Jpa0V4eFVtdm95clFFY0Y0VDNablU3?=
 =?utf-8?B?RTJ0MEdScnlkMjk2ZFUxM0FKV0VBSVdlbDkzajg5T291bVlwU2xCaEc1dUh6?=
 =?utf-8?B?eXZGRURrOVpJZjB3YW1CUElTZkFEdzRsQkFNODhseURqSXowbUlSME9ZK0p1?=
 =?utf-8?B?YldEVThNSG1NYXVIZWp3V01KdERDa1B0dU9nU1ZzNmR2YkVjQTdqZzZjOEov?=
 =?utf-8?B?SUZVMkV5b1JLSkNmTm1qdEpMN2RRZ2tydmJYSHp2WGNpRE5uUDdiQ1VzdGFU?=
 =?utf-8?B?SVQ4TThvTUpvMWIvNTkyenZ3WXQ1SmpHanNVZWRGdGtWY2dVR0g4RWpESFFo?=
 =?utf-8?B?Z1JOMWpGV0pRWjVwa3NQWnhpNlR2U2VUd0JkVTdlUFp1NjRHcmxJQjZkKzB4?=
 =?utf-8?B?NkZDSmw1UlU1Y3FBcTdGdGQ2aW9JdFNBL3dkWWY1QXlUWlVDMllReDlDdDBr?=
 =?utf-8?B?aCtkS0dSbWkxYUpGL09rTXRYTkswcmJRV2VkemlvVmZTZEtjUGNsbkIwMDQ4?=
 =?utf-8?B?MHNMWWV1bGFMVmw5eG9samhvOGdqQmo5QXo0QUdZejJWZ1NEa3RCMDM4YzNt?=
 =?utf-8?B?YzFTbnlEN3NWZ1U0ek1iYnFnV0EzMWtMN3hWSjh0SHFsYVVGaHNlK1MxZ21m?=
 =?utf-8?B?UFhOdCs2QUhtYzJJRDU4VjhDU2R2cGFGaWFTOHRWck1WdjY2N2hCZVZxMXVt?=
 =?utf-8?B?eENoa1VUZDZaRmNsb1h1UlZxNmtKUFVWb2x4Q3M3YkdYbVJaeUVnTXhERGt5?=
 =?utf-8?B?Y1dtemdaNEhCaEwrK056UnRjV1psMlZqZ1NHRTF6TUI1eEx4ZHh5c0RNTXp5?=
 =?utf-8?Q?yhtf3e1a9fbEwmTt7DPI367EvhkPLu46Y1IOJbU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9629f8-8126-4509-28d4-08d91b4097fa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:37:29.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU8jtoqYgZQS4Peqp7nTRFz7CyXkeP0+smQ7DDfTMqf2nV8Qp6g8LtPNPIUxQB/XRjE1Jw1hAvhZuoDFMUGmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5273
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think this works for KFD userptr BOs. But this problem is probably not
specific to KFD. It's only most obvious with KFD because we rely so
heavily for userptrs.

I don't really understand why we're messing with TTM_PAGE_FLAG_SG in
amdgpu_ttm_tt_populate and amdgpu_ttm_tt_unpopulate. And why are userptr
BOs created as ttm_bo_type_device, not ttm_bo_type_sg? Christian, do you
know about the history of this code?

Either way, the patch is

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks for looking into this!

Regards,
  Felix

Am 2021-05-19 um 11:15 p.m. schrieb xinhui pan:
> We have met memory corruption due to unexcepted swapout/swapin.
>
> swapout function create one swap storage which is filled with zero. And
> set ttm->page_flags as TTM_PAGE_FLAG_SWAPPED. But because userptr BO ttm
> has no backend page at that time, no real data is swapout to swap
> storage.
>
> swapin function is called during userptr BO populate as
> TTM_PAGE_FLAG_SWAPPED is set. Now here is the problem, we swapin data to
> ttm bakend memory from swap storage. That just causes the memory been
> overwritten.
>
> CPU 1						CPU 2
> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>     ->init -> validate(create ttm)		-> init -> validate -> populate
>     init_user_pages                               -> swapout BO A
>         -> get_user_pages (fill up ttm->pages)
>          -> validate -> populate
>           -> swapin BO A // memory overwritten
>
> To fix this issue, we can set TTM_PAGE_FLAG_SG when we create userptr BO
> ttm. Then swapout function would not swap it.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 4 ++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 928e8d57cd08..9a6ea966ddb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1410,7 +1410,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>  	} else if (flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
>  		domain = AMDGPU_GEM_DOMAIN_GTT;
>  		alloc_domain = AMDGPU_GEM_DOMAIN_CPU;
> -		alloc_flags = 0;
> +		alloc_flags = AMDGPU_AMDKFD_CREATE_USERPTR_BO;
>  		if (!offset || !*offset)
>  			return -EINVAL;
>  		user_addr = untagged_addr(*offset);
> @@ -1477,8 +1477,6 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>  	}
>  	bo->kfd_bo = *mem;
>  	(*mem)->bo = bo;
> -	if (user_addr)
> -		bo->flags |= AMDGPU_AMDKFD_CREATE_USERPTR_BO;
>  
>  	(*mem)->va = va;
>  	(*mem)->domain = domain;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c7f5cc503601..5b3f45637fb5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1119,6 +1119,10 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
>  		kfree(gtt);
>  		return NULL;
>  	}
> +
> +	if (abo->flags & AMDGPU_AMDKFD_CREATE_USERPTR_BO)
> +		gtt->ttm.page_flags |= TTM_PAGE_FLAG_SG;
> +
>  	return &gtt->ttm;
>  }
>  
