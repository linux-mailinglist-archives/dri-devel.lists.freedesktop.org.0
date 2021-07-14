Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596723C8503
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 15:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23306E270;
	Wed, 14 Jul 2021 13:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A31A6E270;
 Wed, 14 Jul 2021 13:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrVOscqfL2buhPN4p23DmOAaAu4HWNluE4Pp+LpK3Oa1UaHcBIgKrMGWqYccOZNRDnZUK+CDB0Rs4Rl4RYXWnBev5TUepAdT8u2XMscILweay9RzDb3xLhi9hpqhz4q+BREVYEFNNVveqLJgbCWfP9IpDq+eSvRe7p75bKZcY4EtjDpKTe32Y32LQMZYo1pt1pZJP+dsAtQZKCA6JDQePvO6Es72VjRxQGmskllpNzj+OQDxKMJraiIdSJ5fNmeBu363NrSnbXYSMv5qA+31ntlaa9kWEs8u5mCKmEe3OxhbSrtTAXBGhiva2a4JPyRXvm8uDf4x2e9DTpf2V317nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuCUGhi4NoyTnRJHNlMfHabIbfVXxYeGKp+VFlZMeCQ=;
 b=KH1tW9kWQWYCvZRzgFiN1X2HBmDPN5mBci8fmeMBsyHNTTZ0EfJSdGCYa4ALJb7pmFOzTZqYRAZi947zDrFWvRtqTnn0dvyKl94wFQPylnld/nen6/GoDm2MeU7SgHBmydfhPnUwOfqL/dI3fIFVROEo4eCmxuLnY/+mD4FV5tlwW3B8Sium+x8CZ3YOKKplCLe/Clziqs5wHbzV6jVsKSFAGAcwDbptQIAsld7JrrFRPpOKh72rc0oIh4MocQHZr2xICqB7EIJP+Z7fPhactJPRGo7v2qKxtMy6auVK9oJGtrONfIeMafr8vdb4wLWYcMXVU4G8xMpf9gwhEJGJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuCUGhi4NoyTnRJHNlMfHabIbfVXxYeGKp+VFlZMeCQ=;
 b=RxL0YDRGEuOlnWLLza87vYwcmEb5NZBwkacFuHtUzehxicRQxt8t4ynkkfUHrMu4Bq7ObVVdQ/M5iac7nIWnGRoQ+rNWsNjgKjZENaSv62ZDZ/r85/nnCHD5wCSdqJiGUplsK9jlSN6tc9nAku4ojBWqFk7/65oNngcE9UrbESM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Wed, 14 Jul
 2021 13:09:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 13:09:44 +0000
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
 <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
 <YO7HNStidzhlHYe0@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c70ca813-72a6-ed20-8fa0-94a55cdbfcbf@amd.com>
Date: Wed, 14 Jul 2021 15:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YO7HNStidzhlHYe0@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 AM0PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:208:ac::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Wed, 14 Jul 2021 13:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae48006-155a-4a75-1355-08d946c8a5fa
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386A3C9D623AE9E07D2992583139@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KvyxCeB0LBVXhoGZV2rTsAb9FELEOTa2g+WyimjALO2URW3Ep3U/sKeH++pOyg/etIofkqpC4OOiyjZ7XyGO3qhyrsKFe5wt7mW4c14zNrLsQNzfjGZsMWC6nPYDowTl6mC/kK8n/VWUyv8VjTLd6sBBDCrjhsrVsTpXOqtAJ9NOInGhqdKsL19AZuHwShq7yG987xDqcyoJ/JmpCSaxF29nZmQgB06PQIiCbAN/QO14h4LO4hiZoqXlIfsL4O0Csjx/VmMNRLJ05ZrIEOumeT9BVRH3DsAewGE8h6fHXOe5pq+kVHSDaz+KEkn/ntzDt5KWBsFNvoKGbq2bACZ5By7WkhZMyn4CWDU2L8IxRjf/U9TFc1h83Dxp7+G36/fFNyRwUH3NjDMV/KUYsZzlyx4WdDha6I0Croxx595BcGXAxUi9rn6ue0FHRlA4gzJXOPc8swuIRV6gOmza25mdlkkK75szje4xVT5p2J6S08sDiaiTRR5TfrI5Tto6ML6M3H2vtsq35u9RhJAeEh8RkmsxeJ89Hwai/lOwKzu4P512E1wiULT/C048hQf0x0RWRLTccquo8kNjVhS/ub/Mii8Ggl0n76Ue5ogaBDInznQ33W/LH2BCub/eyQ67nXL6cJ5lAsPZZidSifnK+5fTOX96t/99iPrXvr4G0q0UvDBRRkBVceM9qlkNrgX5TXOoFdtstu3BUbQTQhiYG0uHny1X4EkAVqQqTcETzlBr7B4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(66574015)(6666004)(83380400001)(8936002)(2616005)(4326008)(2906002)(5660300002)(86362001)(186003)(6486002)(8676002)(31686004)(38100700002)(66946007)(54906003)(66556008)(478600001)(36756003)(6916009)(66476007)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnM5bHgyeHRoNTRGdlIwdFUxWDJEUEpaMzE2L2xpRCt0WHNHM1hYczAwMkRC?=
 =?utf-8?B?TDVoYmhGb09KTnNRT1hLVFgwYUsyRElpdUxxdVZacDhHWklCbHpVS1NuOUhu?=
 =?utf-8?B?ODIweVZ2c3VwZXNyTGpBSmpOSi9pWkF5QXRvTjVjQlVQTXpGVVlmd3J6WkRF?=
 =?utf-8?B?ZGp2eUdRVFhuYTdES2RJUUdWKy9Mc0QvWFBaajUySUZXNzQyYlhrQUpCYld4?=
 =?utf-8?B?ZHlITUdkU2VCZjhCWExYalVMenY0c1dRM3FPakU1RHZBL2FkVkdJWjZiWDZk?=
 =?utf-8?B?QXVoNFlpaksySklKOUdUdlNZMFhnaGIxVlRQb082M1hRWTludnVCL3YzcXA4?=
 =?utf-8?B?UFIzQkczemJyMnRLMmE2cDl2S3pGYi9IVlpxYlloRTFKQTNoNzkvT2g1dUtU?=
 =?utf-8?B?TVhJTEdnSlJ6U25NOWp5QS9JOE1zWXhTUEhucFRVZ0VaWXBQZXl3TjhDbGd5?=
 =?utf-8?B?c3plelltRHpsT0pVVURoNnAyUm9OdmlBQzB2Yzg5eXZoVEUrV2Nuc0RWZGNQ?=
 =?utf-8?B?YmlMbWJsUHNoanNPcWRMMGhkeEs0ZERmbi9UTnZITTNNRzEwTnFURVViaGdC?=
 =?utf-8?B?dGdGRERmaHEyM1RqYm5nVlErUWtkVkFWRm54WnErNVUxaEFSY3ZReWpBb2lK?=
 =?utf-8?B?bFl4bUVrVmZNMjhzMEpXc09ZRWZIb2doUElwNDBDdVdTTTlSNlMzSmlHaFFM?=
 =?utf-8?B?Y2U2NDY2REx1bEpsaUJNMHlhbS9zZWhPNUJIeEJVUDVzc3RFZUcvV01VeW5z?=
 =?utf-8?B?RU9hT1d2VnBDMUNLNjgvMUJMZ1FZOHNVVjJ4U0kwaFJBNUprTGZ3RHVUMjVH?=
 =?utf-8?B?K0VkdVRXa1doelBEOUdnUVRGU2V4eVdOODB4NFZEUUV3QU1rVGIvam5CT2dh?=
 =?utf-8?B?UnZrL2JxeWdsWHhKS1RzbEhndFlIZW9YQTFsek5Sem51bG11ZmRTTkZXY2Uz?=
 =?utf-8?B?V2g2SlpQaXhIUWRlSnZ3UFlzazVxV09aTUN0RldRNGdldG9VR3ROOHlSSUJ4?=
 =?utf-8?B?OCtSWFBhemc3bHc1clloaU8vbXRuYnlKdXZNTFp3NU1vOCtYNXNCTWZFb0JZ?=
 =?utf-8?B?bWdzMUhJV1drcGhkQ1RESkR4Uk4vTVFkRjU2eFVRNzZZN3lrbjJLV09zUFhH?=
 =?utf-8?B?K1ExUjloM0EwdVZHVmhRaitXeFp4OVUyOGdKRkViZ1BVT1NkZWRGdStaaFp4?=
 =?utf-8?B?QldHZnhrbFhVK2VVc25lZzl2NkRWRkdYVWtTNjVHTjJvd2ZhOVFLdUt0WURB?=
 =?utf-8?B?c1J1V29VTUFVYk1HS0l1OUR5VVRxU3lSWStTS1haS2ZsblNPL3ZWOVlPME1K?=
 =?utf-8?B?RmUvWVQycElHeVhqcXFDeWw0VG1YZlpHQi9WVVI0ZG16YVZlcUFUMzVoa1Ar?=
 =?utf-8?B?eFVYcVk3RklxeGxoRVlsN290WnBtZ2Y2QlNnTFFOTmFiRXU3cVNXd20xT3RX?=
 =?utf-8?B?eU5vVGhSYmx3MjRYam80R0FRTkZmSzltQ1RTUWVIUFA2NCtVaDYvWjNrY2Vt?=
 =?utf-8?B?NDZyekIyYks2NDQ0SnFoUmZRSXdhczNINE8ySWFxSlAzSFRhZ09YSTh5aTJl?=
 =?utf-8?B?OW55cEN5UmJUMHdiS25aSC82TGllRGFPMFgzR2Q3YmFiWlh2V1AzdnMyYkFQ?=
 =?utf-8?B?OGw0YkFXS2lLNThnNkJvazhQWEJHN3NQbTM1eW1TWkd3RGE1ZzZMYTEyNHc5?=
 =?utf-8?B?YVE0VDdRd0N0MWo3dko2alFpL0lkRk9DNCt0SzRzMkFCTStUTlBETk5NVlBJ?=
 =?utf-8?B?M0RZWFRMWHpWYkhDUk5qTCtNSm5OSktNeUdHZ3FoelZoUU84SnFvc1VNd1px?=
 =?utf-8?B?aG8xZmdjUFRXdVNOaXltY3Jic0VPWklFcmQvT0Y5VnpKcnFjN3VXVy9URlE0?=
 =?utf-8?Q?saaJLYB5qT58j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae48006-155a-4a75-1355-08d946c8a5fa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 13:09:44.3028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMirNoVOJ614OcTSvoXinMLPCgi4RkhwrsiBNx60vQ642AChPzUahc0qj6eYEGQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 13:15 schrieb Daniel Vetter:
> On Wed, Jul 14, 2021 at 12:51:15PM +0200, Christian König wrote:
>> Am 14.07.21 um 12:44 schrieb Daniel Vetter:
>>> On Mon, Jul 12, 2021 at 06:06:36PM -0400, Felix Kuehling wrote:
>>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>>> is_cow_mapping returns true for these mappings. Add a check for
>>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>>> PROT_NONE mappings.
>>>>
>>>> v2: protect against mprotect making a mapping writable after the fact
>>>> v3: update driver-specific vm_operations_structs
>>>>
>>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>> So looking at vmf_insert_pfn_prot() and the comment there we can't have
>>> VM_PFNMAP and is_cow_mapping ever be true, or things break. On platforms
>>> without pte_special at least.
>> Key idea is that we never end up in vmf_insert_pfn_prot() because the vma is
>> mapped with PROT_NONE.
> Ah right if it's PROT_NONE then it's ok. But the code here only checks for
> VM_WRITE, not VM_READ, so PROT_READ can get through and go boom? Or
> something else I'm missing?

Ah, good point. Yeah that is indeed not handled correctly and can cause 
a BUG_ON().

Looks like we need to revert that patch and go back to the drawing board 
then.

Christian.

>
> Maybe time for a few amdgpu mmap tests that go through the combos and make
> sure it works/fails all correctly.
> -Daniel
>
>>> So I'm not sure this is a great idea, and definitely not for all drivers
>> Yeah, I'm absolutely not happy with this either but it seemed to be the
>> least painful thing to do.
>>
>>> ...
>>>
>>> Can we clear VM_MAYWRITE instead to force this to be a non-cow mapping
>>> instead?
>> Well we have considered forcefully setting VM_SHARED, which won't work
>> easily for a couple of reasons.
>>
>> But clearing VM_MAYWRITE in amdgpu/amdkfd may actually work as well.
>>
>> Felix can you test this?
>>
>> Thanks,
>> Christian.
>>
>>> -Daniel
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>>>    drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>>>    drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>>>    include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>>>    6 files changed, 24 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> index b3404c43a911..1aa750a6a5d2 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>>>    	.fault = amdgpu_gem_fault,
>>>>    	.open = ttm_bo_vm_open,
>>>>    	.close = ttm_bo_vm_close,
>>>> -	.access = ttm_bo_vm_access
>>>> +	.access = ttm_bo_vm_access,
>>>> +	.mprotect = ttm_bo_vm_mprotect
>>>>    };
>>>>    static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> index 5b27845075a1..164ea564bb7a 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>>>>    	.fault = nouveau_ttm_fault,
>>>>    	.open = ttm_bo_vm_open,
>>>>    	.close = ttm_bo_vm_close,
>>>> -	.access = ttm_bo_vm_access
>>>> +	.access = ttm_bo_vm_access,
>>>> +	.mprotect = ttm_bo_vm_mprotect
>>>>    };
>>>>    void
>>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>>> index 458f92a70887..c19ad07eb7b5 100644
>>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>>>>    	.fault = radeon_gem_fault,
>>>>    	.open = ttm_bo_vm_open,
>>>>    	.close = ttm_bo_vm_close,
>>>> -	.access = ttm_bo_vm_access
>>>> +	.access = ttm_bo_vm_access,
>>>> +	.mprotect = ttm_bo_vm_mprotect
>>>>    };
>>>>    static void radeon_gem_object_free(struct drm_gem_object *gobj)
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> index f56be5bc0861..fb325bad5db6 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>    }
>>>>    EXPORT_SYMBOL(ttm_bo_vm_access);
>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>> +		       unsigned long end, unsigned long newflags)
>>>> +{
>>>> +	/* Enforce no COW since would have really strange behavior with it. */
>>>> +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>>>> +		return -EINVAL;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>>>> +
>>>>    static const struct vm_operations_struct ttm_bo_vm_ops = {
>>>>    	.fault = ttm_bo_vm_fault,
>>>>    	.open = ttm_bo_vm_open,
>>>>    	.close = ttm_bo_vm_close,
>>>>    	.access = ttm_bo_vm_access,
>>>> +	.mprotect = ttm_bo_vm_mprotect,
>>>>    };
>>>>    int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>>>>    {
>>>>    	/* Enforce no COW since would have really strange behavior with it. */
>>>> -	if (is_cow_mapping(vma->vm_flags))
>>>> +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>>    		return -EINVAL;
>>>>    	ttm_bo_get(bo);
>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>> index e6b1f98ec99f..e4bf7dc99320 100644
>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>>>    		.fault = vmw_bo_vm_fault,
>>>>    		.open = ttm_bo_vm_open,
>>>>    		.close = ttm_bo_vm_close,
>>>> +		.mprotect = ttm_bo_vm_mprotect,
>>>>    #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>    		.huge_fault = vmw_bo_vm_huge_fault,
>>>>    #endif
>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>>> index f681bbdbc698..40eb95875355 100644
>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>>    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>    		     void *buf, int len, int write);
>>>> +
>>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>>> +		       unsigned long end, unsigned long newflags);
>>>> +
>>>>    bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>>    vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>>>> -- 
>>>> 2.32.0
>>>>

