Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B170C3C8340
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 12:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9FB6E20A;
	Wed, 14 Jul 2021 10:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1DF6E20A;
 Wed, 14 Jul 2021 10:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezLyqRRG3NCbQr9ZbyBvjJwcmHs0wpncoCswzLD2Jf66fPH7M+ISXPcW1aQWRnsMTQvNfSSuD42Vw0IuN/NYQOyMIsrtn4sAOLlBuFirAnJmEs21CdFBRA/b8l5KvFeOT1bOl/OQH5ib6nznZha6ydzfes2fS2n+N4kdB91PH5dFtD5Vclv3YIdSW8sh0Qerd/YQHjXAV0Gbg374Bdw5F/j86b2EQVKyKotjPKgKpf3AKzsOpzsI5+YA+fXQXtIguCOvxayIPfb2s+4xJhzYs3RgjMZH4GVymhs+6mCf+26pmrUheWTsMzmSAGCH+VqtPYw6CCBjW0qkaeyjgDn/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69vaihAb+XTwhQbPuvOxn/ugcaObJ80hJm4rhGxbjc8=;
 b=g9QiUKwWcOO+Ab0hAmPNxjlBWp0cWAsB82kCsgPhx7PtKNwpOC+wzIeSR+wWTBt1VHkhnlgURP8q0q9ljV/j+yybZa5+M+FClJZ2tHwqS/bzPZS0O5rnVElJPqZK61i9jFoBWNlcwT03NKqCGkjKnKXSasLVLnkI5ujflMl7907LHX06AwrpWvb93W00BByCYFFgOhZyqHe9wkMAaaA2KV53x3TdvaW7IQE1tPa9vFFqOthSoIVXIxAMr6EVDc5O0NVdMvJEpefOiNI1NM01py2knmV90J1lzVBx83G2dzAkhc7KJyfT2EgRVeM3LLkWHdePx8V0L1R1WblzITiRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69vaihAb+XTwhQbPuvOxn/ugcaObJ80hJm4rhGxbjc8=;
 b=NoWTpK3CF330sspP5RFC3NGxtvyqI+K/mC4+QcLLve2iWkZmRclkiAnG6EJSlA5X6v4kuaxBKCLawqQEgE8oKgdKI98kRzQNv5vz3N5SGuuwnxLPyrPy2OTRtZTYkWpcYM1YRgdFsR7csMbTjQXv2d032j72Kh/x4hPfI/mZXik=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4847.namprd12.prod.outlook.com (2603:10b6:208:1ba::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 10:51:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 10:51:21 +0000
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
Date: Wed, 14 Jul 2021 12:51:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0021.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P192CA0021.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.23 via Frontend Transport; Wed, 14 Jul 2021 10:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baa00bdd-ece2-4661-77c9-08d946b550bf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4847CF0CB9C007C47E329A1883139@MN2PR12MB4847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gBF+c2Wqot7K4efWc1sYGQpplLWNtpaYsjVWVKA35/oekWeqPUrDjwxnglA0r05Tk9EqjEv3e2VNZDXNnCglsGIKS346b2CrMlYnkdncRXt/qH8zbuSm8yi5OwOZUVC42Rgv7Vp/bPzUn/1Cv394NTvqLZYsoZ47EuAlnxd//1H4kv6/TA3M/kQZaMgvB3o89MQI7BFn1jEj/3vJO9ZYViuCECrL89FxVwGSjUZT4eC19UEb1Y5NA9whNGNn3M2TGahVpGvycfpV1EdNgmwk2Ad4HtjdyDDIE24XMn5AIsGotRyegKahw+5IDNMRGRR6H1Pwcyhiz+zeeDIUJJrFSAyl7HrUb1lqTuoEitmlbGD2R8dVqvDpoULDsqPmkfliphFy4gL6m0DPae7IxPkWRYjy1lU0dnbwrBik79OqVpkCAIp8GNj82qcx3mHxzH8sT5T184xMBExK6VCJqIKXt7pY7MkAZmmOPEtYZXPFETaxR8AoaqbocUtE3Mn8k2kd16Hi72DeXEj/+T1SaLotjjqw5v2MCUyqD6NImLMmxuEZzt1cjRikHtds5ehpoudq0M6KoAlbR0BzXp5LJE/iwhx/PKs6nI/QdSvfRinBQ08+XWULT6HECaPgVzh0dectVblEwL7tGtPKWyjkbsrCwwhWRo5BnLgsBrzPH/ABgN212SKA7V//XzYoH3TueTn1Qr0kbeD25kXETQHUkVfCFJ0SMOG7nCJDgpCItSLtgEcsFkFgLW2Baj2nJc7Bf+Eh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(2906002)(38100700002)(66476007)(66556008)(31686004)(186003)(478600001)(6636002)(31696002)(86362001)(66946007)(8936002)(36756003)(316002)(83380400001)(2616005)(110136005)(6666004)(6486002)(4326008)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZxeTVaTGVFbmk2bmk3UVVJaEpyeTFSQ3F6NTN0YS9rOTBWbHI2SG8zUEN5?=
 =?utf-8?B?dUh0R01tem5WZ2FISER2M1E5NTFabGEzYlNNMGJDdVREckFVUlFrUjFhY1R6?=
 =?utf-8?B?bEJUZmdqUDQyL2pUbU1pb21sanh5emRwa3BrSUE2QS83WW5TbS9WVHlqaEMx?=
 =?utf-8?B?U2pBa3hjSUFZUTZzSlVjWHd2bjZwN01YUjY4eVRHVHEyRitUOHpKQmNlbWVR?=
 =?utf-8?B?K05TVDhQWkVXaUJWcjZxa2dDSEk5M0Ywa1ZDdGVJcEtMbitaczRBSzJvUHk3?=
 =?utf-8?B?bGlqY0VucFQvNDlNWXJOYjB4K2VtOGMxam11ZWkzN1kzcTVaRlFmUVVTMzdx?=
 =?utf-8?B?UWZmalZuTEttbmhHNzJZWkV2dnE5b2NQMUZ3NnJ5Tnc1a2wrNWZJbEZ3S1RS?=
 =?utf-8?B?ZngwTDlYZEFwZE1KaEZuMmlPQklZWEpWNm55SDhMbkdmYk5DWnpGWE10MVBq?=
 =?utf-8?B?MGt1UTVZTWhycVBsVklsSWFkYXdDbkthTUduQ3pDbEkzbWR5THpCRkpvL1dW?=
 =?utf-8?B?WFR4T0NZeUFleEdBWjI3bkx5Z0hlWXpzcUt2ckZsV0lyN2VJV2dMZ2w4Yzl5?=
 =?utf-8?B?RWZJUDQyUkhJNGFSZmdVZTJTYkt3RFNDNkRiZkdKVHc5bm55dWUrV2MyeFpK?=
 =?utf-8?B?VEkreThNb0MrNGVxTnIxYVBBenZKbXRoa0N3R0g1TU5tREhqbWJZa29GSkRE?=
 =?utf-8?B?WHo3S1NlMURJNkZ0Smpmd3hkMnhySHlFVGRPcnV6eW1NQ1pxdm1JdzFCbGRs?=
 =?utf-8?B?VmJuWGxyZ09WSG1hdEZBWUtsWXY3Q0RzcVpvOU9RWHBNRkZNYklJSEV0Mk5T?=
 =?utf-8?B?bWRLMVVYeUtzQStxckFWa2toM3pGK2d1dXM3c2JBWk5hZFlUT3BMV3JkY2M3?=
 =?utf-8?B?ckhtOUxhYk8yaElTMlRaZk1BRGhrUzQ0NzdscU9VK254SFdwYkpkd3BlVlpt?=
 =?utf-8?B?dTYwRVczNFZpN3JHNFMyUDVXeDQzWEpTeDdHbG1WcHhIb1VSTjNOWS9Ra3dE?=
 =?utf-8?B?dWRaTGVUV0VQMGo4YWR6L2pkUGlVdW9Mb21oalRnQXhyelBpeVVjRTA3MnVm?=
 =?utf-8?B?UXlDbU1OZWtaVUpDemNhN0xaUnBSRFBUMEdEcEFVZFUzNUdNV3dYZzRrWFBO?=
 =?utf-8?B?UFFuNmNOZUNKbGQyd0VISFQvUTEwamQ0WnhOSG5ZRHVxUGloUFJ4N21iTm40?=
 =?utf-8?B?ekZuckJZbDN6bHZQanlJUHc0TVIzaTNnWmtCTGRuVGJKcTY0S2lLTWNwWGFo?=
 =?utf-8?B?MlRPQXZKODByaVBKb1ZXL1VsVHJaSTZuSWNvNEFhbVFXZWJXdVA4R0xLb1dX?=
 =?utf-8?B?a1BYRlN1ME5iTmI4ellJUEVVbDFDdkNvdzdCbmpjQTE4K2lQNkx1VE9vZ2Vy?=
 =?utf-8?B?c2R2cC9yM0JnYmJGNndqd0VzSWFuTnV5Y1YvUHFuV2k3cG9hVk4wYmhpUU83?=
 =?utf-8?B?dEJ1ZVFFVUh6K3NwZm5lLzEvcGEvWWk4aUFySWp0WmYwaFRqK1pQd2NqM1lB?=
 =?utf-8?B?UmhZODUxZ1VCVkFsM0FybDJoZ0J5bndySFFKV1B5Rzk4Q0pSR0VzUldBOUtm?=
 =?utf-8?B?UFhJQWZtY2ZtZmJzcTllOGtva2lCdFNUcTJseFRKS05jMzJhOHlwM21CMjUx?=
 =?utf-8?B?eFh0WmtsTzM0MWVndW5aamR5SVZHQjUycHpEbGpSeUJQMFZuOTdGdnZnL0F1?=
 =?utf-8?B?T2VHUUh3R1R1OWxkaldWS0s1ZzB2VEhSdG5Wc3FJMWpQUlJ1d2ltM0Y2aFlq?=
 =?utf-8?B?RUJMajBPU3pSWmlnV1c4bDVVT0QvZkFnSkZwbERSYU5ZTWhpc0hzY1YyVStB?=
 =?utf-8?B?Q1EzZDhxcUVqZUlDMEJERDF5RzhwNVNnOEZ2ejEweDNJTnZyVFRQRmRrakU0?=
 =?utf-8?Q?sd3Kn4RCUujh6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa00bdd-ece2-4661-77c9-08d946b550bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 10:51:20.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1V5NoKYLNWk1ZLUWgCO49lm2XDMzxcih7UWD63ysuftKvLvLJbGbtgU2EGw4jS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4847
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 12:44 schrieb Daniel Vetter:
> On Mon, Jul 12, 2021 at 06:06:36PM -0400, Felix Kuehling wrote:
>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>> is_cow_mapping returns true for these mappings. Add a check for
>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>> PROT_NONE mappings.
>>
>> v2: protect against mprotect making a mapping writable after the fact
>> v3: update driver-specific vm_operations_structs
>>
>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> So looking at vmf_insert_pfn_prot() and the comment there we can't have
> VM_PFNMAP and is_cow_mapping ever be true, or things break. On platforms
> without pte_special at least.

Key idea is that we never end up in vmf_insert_pfn_prot() because the 
vma is mapped with PROT_NONE.

>
> So I'm not sure this is a great idea, and definitely not for all drivers

Yeah, I'm absolutely not happy with this either but it seemed to be the 
least painful thing to do.

> ...
>
> Can we clear VM_MAYWRITE instead to force this to be a non-cow mapping
> instead?

Well we have considered forcefully setting VM_SHARED, which won't work 
easily for a couple of reasons.

But clearing VM_MAYWRITE in amdgpu/amdkfd may actually work as well.

Felix can you test this?

Thanks,
Christian.

> -Daniel
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>   include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>   6 files changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index b3404c43a911..1aa750a6a5d2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>   	.fault = amdgpu_gem_fault,
>>   	.open = ttm_bo_vm_open,
>>   	.close = ttm_bo_vm_close,
>> -	.access = ttm_bo_vm_access
>> +	.access = ttm_bo_vm_access,
>> +	.mprotect = ttm_bo_vm_mprotect
>>   };
>>   
>>   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 5b27845075a1..164ea564bb7a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>>   	.fault = nouveau_ttm_fault,
>>   	.open = ttm_bo_vm_open,
>>   	.close = ttm_bo_vm_close,
>> -	.access = ttm_bo_vm_access
>> +	.access = ttm_bo_vm_access,
>> +	.mprotect = ttm_bo_vm_mprotect
>>   };
>>   
>>   void
>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>> index 458f92a70887..c19ad07eb7b5 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>>   	.fault = radeon_gem_fault,
>>   	.open = ttm_bo_vm_open,
>>   	.close = ttm_bo_vm_close,
>> -	.access = ttm_bo_vm_access
>> +	.access = ttm_bo_vm_access,
>> +	.mprotect = ttm_bo_vm_mprotect
>>   };
>>   
>>   static void radeon_gem_object_free(struct drm_gem_object *gobj)
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index f56be5bc0861..fb325bad5db6 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_access);
>>   
>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>> +		       unsigned long end, unsigned long newflags)
>> +{
>> +	/* Enforce no COW since would have really strange behavior with it. */
>> +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>> +
>>   static const struct vm_operations_struct ttm_bo_vm_ops = {
>>   	.fault = ttm_bo_vm_fault,
>>   	.open = ttm_bo_vm_open,
>>   	.close = ttm_bo_vm_close,
>>   	.access = ttm_bo_vm_access,
>> +	.mprotect = ttm_bo_vm_mprotect,
>>   };
>>   
>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>>   {
>>   	/* Enforce no COW since would have really strange behavior with it. */
>> -	if (is_cow_mapping(vma->vm_flags))
>> +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>   		return -EINVAL;
>>   
>>   	ttm_bo_get(bo);
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> index e6b1f98ec99f..e4bf7dc99320 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>   		.fault = vmw_bo_vm_fault,
>>   		.open = ttm_bo_vm_open,
>>   		.close = ttm_bo_vm_close,
>> +		.mprotect = ttm_bo_vm_mprotect,
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>   		.huge_fault = vmw_bo_vm_huge_fault,
>>   #endif
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index f681bbdbc698..40eb95875355 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>   
>>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>   		     void *buf, int len, int write);
>> +
>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>> +		       unsigned long end, unsigned long newflags);
>> +
>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>   
>>   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>> -- 
>> 2.32.0
>>

