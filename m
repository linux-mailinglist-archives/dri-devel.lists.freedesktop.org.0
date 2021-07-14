Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D93C886B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE716E415;
	Wed, 14 Jul 2021 16:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AED6E415;
 Wed, 14 Jul 2021 16:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWs8QhAALTWjhL8Lzv/+m2v88n2GpzIhko8iDov9wZPJCfYOy5yLhhEzxfQFux7h6ORihBwuI03QHMoJnml6iKMz/cYF6Khj+tfVEyOHOjhtnIYuu3BmBQ2MzWHOt6vCdv7Si9DqJeKcxxUHoS58UKK8m+FdRNjFEu7BUUE05IxnDOVq6MzWUuRQL0T++R/f+VZt2j2YFOAe9j2KMnzZ6557deR6rvDwTevhQXUkfxVctyGIFV1mnzgFTEt5tU/xIqEERG0iI+KuOnGpOmSYOENuSbzDEn2hTTz6c9uMW4IEIi7NhtnpMcH0BQJa1st9/sooPhh+3pjWlqCM8nNBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn8wpiULj5dlzvBpbCqxWG+eiN90JrVPVdjNH2V79Nc=;
 b=kSjUKVYTWt30Rdn6iBijxT+R7nUp26PUFDN7A8ukj+BPDr4qeWB3IUaKKsuKZbGEsYiBrWnUtxHS1kjuiV1/fBm2d0DW/uCHeEODMs8qfOG450hgt09LDZiHClRH2cq3bLZQF3Dow5f3lcxKEXz+Ah3TxyK0xyCsuvN3f+JK0LZdDm7m5X3EIMZQQOc0OBQ3tqaykymfT9QugyHeByxdSaeAXZD1Sl1DO6ROUsqYwYxWnM6Y82Halwn0jCyfwfjM5tXOzGMq8aCMX6KcUdXMDNupEp+H2P6ihxeLxN2clpr/MrjjYNCBTLWaddWukYFjJGevOjbSAd485Y1JLS0j+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn8wpiULj5dlzvBpbCqxWG+eiN90JrVPVdjNH2V79Nc=;
 b=aRjhijyWHl0LJ3ctrBo47fvsI/4VaIB5h12qv1W+kOHHvVhZM6UM9G0Peff4tr+AMdaPlXFOye4Rj95uGOGleG34AoX4SYm8yZl66jnunB7KfwtTbFijFzVxRwOMm4ZCtuPS+bRvaJBTtD96c/Pwstwhha6WtVOi7N0z8pWOgh4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:11:37 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:11:37 +0000
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
 <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <93d35f0b-8ffe-d7eb-b6a3-3a8bb7b6d0ab@amd.com>
Date: Wed, 14 Jul 2021 12:11:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 14 Jul 2021 16:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8a41a3-2136-48f4-ed45-08d946e20edb
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5273A8040B5E89ECD742591592139@BN9PR12MB5273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olY4kfl9ytvNeHBhRAY1IL77zm8zMF6xe0B6nXRpCf4Ux6btXWZVt8dbpKyIOjqbVRfTqyupc+tDFPEkJgOHGgpq26Wjrsdhp3KbFViScS3THsZ0MVaN5E9HR5SLuipnjJ6lhJhDUAes80xRfm15WnpX7zopua3JoN23Lr/Nu/cxpyezB30PlZRAcqlzlgQ+9kXxUk/Xe3chVEZ0F+6vl3rLUxXfGCTarb3joWt/3M7AaR0vQzKP0XnL0Ej9eHDVB71tpk4Z9DBkZ26MtYA0y1NZJCTgA9wRPy3FMbl9Zv5h9iGW0VpQ3xkHnlhQ2Z8B0ur9EouxtL1cR/q3NkLUaTEiS2HBdmJM9WBexJ+CK8v6ZgeUehKK4XF2+srxSEp2OqSH4NXB+Ai8GV/zpC/vOYBNtctaTZ4mS+/34ks4vqbN6c1JVisSNMhbATM03EkxR958RTWJeJS2RN/CcmTqM/UBGeNsky31Q21HbBmK2h/2lJhFbP3vT0IUKFvXYx1gAJBo30onC2aQpnHdYdmWke7vOy/n8sGNAeuHyM7J2qMuzFaLL5AmDCmZNq/ZAmvgzD5naFS6zKgaBMMl48u5OCXoBWltyn822ukxHrzGGZoaJJh6s7evT1WaW/Og0jIZa+/4795/B0vVuPwF0iVCox4T83I9qDFRZsP9UgMhjX6gAT3w42z+VWM/Ftd+pp2eVdVetO6Zkx0xQwsCQQYH8vJqHB90j87tUohxtb7E3QGHKpEEVrTxK+jPVcU9g2nW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(66556008)(2616005)(66946007)(66476007)(16576012)(478600001)(956004)(110136005)(36756003)(8676002)(4326008)(316002)(38100700002)(5660300002)(8936002)(31686004)(26005)(66574015)(2906002)(86362001)(83380400001)(186003)(44832011)(6486002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZYeDcvaXN0amMyNUlnOXlIUWozTEFzVTB3MjFsMGlaZWVIbjI4ZkF3TG9X?=
 =?utf-8?B?cjdxRU9wSkRpQ0NDLzZvNC9nY2V3dkhHalNZV21pMk1KMXdtOHgxK25BL3VI?=
 =?utf-8?B?aXcvWkorMW1EU2xLUThodVRQV0haNDlKNU5NS3ZnL3I0RlFpakRCbGkzcUta?=
 =?utf-8?B?Z2w3SnQ0dXRDR2x2dElsVXhDMDZtMndWeHlaL3ZXNGJiQ0ZnK2xuajUrZVJY?=
 =?utf-8?B?MENVVlowanpvaElQT0pKUHlCTTUvR2E2c21MT3NXeTdwaTBUUGg1NWw1L1Bk?=
 =?utf-8?B?R0loZTgxd0thK0VpVS8vNmVqbFdzTURqSGdXRWN0WEtkTmE3U2lUelQ0Y2FQ?=
 =?utf-8?B?R1ptMTZXcXRtdms4Smk1YzFsR2VNMHptaCswOGxEelNISzAyOUZmdG96VDRW?=
 =?utf-8?B?ZlYwWE43d3JERk1PMkJMdjBDSUdHTFlBNXdiNHR2OTV2b254Y1M0SG8vbzZE?=
 =?utf-8?B?aVJRRE40MXhndXkrby80ZzZzeDJyUDg5Z1FJaW54eFFxUEJZZHRRWFFXbU5O?=
 =?utf-8?B?bW13Z3pFdTRhM1BPUTBMbHFiaE9pLzczZUUweEFKVi93OFdVMExzNnBoZTVP?=
 =?utf-8?B?U1QyRCtzZVAvWkR3d01FM2NJS09FSy9WcnpRRmNqZTd6ZXNReWJzd0lIR1E0?=
 =?utf-8?B?NVJmVXVPdmI5ZzA3ckxyYllGMXFOUXYxV29oQTRPOC9HeS91dnkyZmZ4Sk9X?=
 =?utf-8?B?VlMrd3oxS0dXbVRUT1pBUStjdUZVWk5Ta1I3NWVFa3Q4S05DaFllNHVQSUJC?=
 =?utf-8?B?SlVjdEI1V3dPdlZSendOM0pLRlBWNDlweXNNQmw1U2JDSGIrcXJhZ0ZoaUFT?=
 =?utf-8?B?bEgxaUwrVGlzOS9TS1pWUU9FQko2bUhJL1E5SVQ0T3JqQUNCVkdFTTNIbito?=
 =?utf-8?B?SkNJdTh6ajhTSVBYamNsMDdaVXhWcHU5Qy91bS80R1Eyc1FhWFM1Vmd3c09x?=
 =?utf-8?B?ajNEVVgrb2V1Y3M5NEFnc2Q5NW1OSE9kVTRFVWsxWXZMRkhVa0JGdmhqQnds?=
 =?utf-8?B?UnJ2bUphWVUrSVc5T3VhTmI2Nmg0dzAwb1hmamxmMW9wTHBRSnhBSkdmblRk?=
 =?utf-8?B?bTBQbWpqaG0ySkdrSFZTd09VNFhqLzl3YnY5TGlBWGxXN2FSR1VXU0xxYSt1?=
 =?utf-8?B?UFh0NGVHRnliaUVqN09TNks2SWZXQnJMUUlwZTJra3B0aThlQlozK0NSdXEz?=
 =?utf-8?B?UndGcTZTWlJwaFo0d0FvUkhYcGFab1loVXBFOTJINC8wc0s0SXQ5Z0tESlpt?=
 =?utf-8?B?SThiZktzeStwSktGYXZ2Q0VEeWxqbmNEUTg5dmlSZHVkSzY1aStNU2xZSXo2?=
 =?utf-8?B?T095WXlvWFBDYXpOakpFWHROK3dheE5uV21FOVRjTmNBOFFDNEg2aGlwRVBQ?=
 =?utf-8?B?WDM0R0tjdVllcEJJL0xkVnNIc1d5eUhJN3R2VldFN1o3NFNNRXMrRTJKM3Zp?=
 =?utf-8?B?Y0JUZzc5RWM4QTVrZTVUdkhjT2ZGWndOME5Xdm5UYi80NVVpaUQ3SnM5dzlE?=
 =?utf-8?B?dTF1UG9iblBkbnUzSW5YMDdDbDBrNHNGRkQ3K2dSRytnUjQvUTdUSVEzRWVZ?=
 =?utf-8?B?RjlIdnNiS0hQdVpTNXlFODY2MlBYNlBYcUFEM25EUUpHR3JVUVZOeVIrOVRM?=
 =?utf-8?B?N2FEM1Y5MEg3STdWdWJrejcvLy9BVVlwSXpZSW9aMWhhanRSVmdvRERTWVBU?=
 =?utf-8?B?Y1hISE1vMCtRRXpJMUFNWDVUcWhxaVdzbUdtVHFUc1JDd0VVa2RSaXk4dVpG?=
 =?utf-8?Q?VS8/NaHfs0tAI5w2WhUC6eMAmHzmUZsb2EznMgI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8a41a3-2136-48f4-ed45-08d946e20edb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:11:37.6727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpyCMnuBAfdVbZjUcexIlhFRmtnICaUFbIJrNHGlpKVGz0ex93ntxTIS7jomFO7izTeYIzxjWAOh1ic2t3Z00Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-07-14 um 6:51 a.m. schrieb Christian König:
> Am 14.07.21 um 12:44 schrieb Daniel Vetter:
>> On Mon, Jul 12, 2021 at 06:06:36PM -0400, Felix Kuehling wrote:
>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>> is_cow_mapping returns true for these mappings. Add a check for
>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>> PROT_NONE mappings.
>>>
>>> v2: protect against mprotect making a mapping writable after the fact
>>> v3: update driver-specific vm_operations_structs
>>>
>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> So looking at vmf_insert_pfn_prot() and the comment there we can't have
>> VM_PFNMAP and is_cow_mapping ever be true, or things break. On platforms
>> without pte_special at least.
>
> Key idea is that we never end up in vmf_insert_pfn_prot() because the
> vma is mapped with PROT_NONE.

Ah, thanks for that pointer. I wasn't aware of that BUG_ON. I thought it
was more of an abstract "copy-on-write faults may be bad on these mappings."


>
>>
>> So I'm not sure this is a great idea, and definitely not for all drivers
>
> Yeah, I'm absolutely not happy with this either but it seemed to be
> the least painful thing to do.
>
>> ...
>>
>> Can we clear VM_MAYWRITE instead to force this to be a non-cow mapping
>> instead?
>
> Well we have considered forcefully setting VM_SHARED, which won't work
> easily for a couple of reasons.
>
> But clearing VM_MAYWRITE in amdgpu/amdkfd may actually work as well.
>
> Felix can you test this?

Sounds like it should work and be straight forward (I thought that about
setting VM_SHARED, too ...). I'll give it a try.

Thanks,
  Felix


>
> Thanks,
> Christian.
>
>> -Daniel
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>>   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>>   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>>   include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>>   6 files changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index b3404c43a911..1aa750a6a5d2 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct
>>> amdgpu_gem_vm_ops = {
>>>       .fault = amdgpu_gem_fault,
>>>       .open = ttm_bo_vm_open,
>>>       .close = ttm_bo_vm_close,
>>> -    .access = ttm_bo_vm_access
>>> +    .access = ttm_bo_vm_access,
>>> +    .mprotect = ttm_bo_vm_mprotect
>>>   };
>>>     static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index 5b27845075a1..164ea564bb7a 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct
>>> nouveau_ttm_vm_ops = {
>>>       .fault = nouveau_ttm_fault,
>>>       .open = ttm_bo_vm_open,
>>>       .close = ttm_bo_vm_close,
>>> -    .access = ttm_bo_vm_access
>>> +    .access = ttm_bo_vm_access,
>>> +    .mprotect = ttm_bo_vm_mprotect
>>>   };
>>>     void
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 458f92a70887..c19ad07eb7b5 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct
>>> radeon_gem_vm_ops = {
>>>       .fault = radeon_gem_fault,
>>>       .open = ttm_bo_vm_open,
>>>       .close = ttm_bo_vm_close,
>>> -    .access = ttm_bo_vm_access
>>> +    .access = ttm_bo_vm_access,
>>> +    .mprotect = ttm_bo_vm_mprotect
>>>   };
>>>     static void radeon_gem_object_free(struct drm_gem_object *gobj)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..fb325bad5db6 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct
>>> *vma, unsigned long addr,
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_vm_access);
>>>   +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long
>>> start,
>>> +               unsigned long end, unsigned long newflags)
>>> +{
>>> +    /* Enforce no COW since would have really strange behavior with
>>> it. */
>>> +    if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>>> +        return -EINVAL;
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>>> +
>>>   static const struct vm_operations_struct ttm_bo_vm_ops = {
>>>       .fault = ttm_bo_vm_fault,
>>>       .open = ttm_bo_vm_open,
>>>       .close = ttm_bo_vm_close,
>>>       .access = ttm_bo_vm_access,
>>> +    .mprotect = ttm_bo_vm_mprotect,
>>>   };
>>>     int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct
>>> ttm_buffer_object *bo)
>>>   {
>>>       /* Enforce no COW since would have really strange behavior
>>> with it. */
>>> -    if (is_cow_mapping(vma->vm_flags))
>>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>           return -EINVAL;
>>>         ttm_bo_get(bo);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> index e6b1f98ec99f..e4bf7dc99320 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct
>>> vm_area_struct *vma)
>>>           .fault = vmw_bo_vm_fault,
>>>           .open = ttm_bo_vm_open,
>>>           .close = ttm_bo_vm_close,
>>> +        .mprotect = ttm_bo_vm_mprotect,
>>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>           .huge_fault = vmw_bo_vm_huge_fault,
>>>   #endif
>>> diff --git a/include/drm/ttm/ttm_bo_api.h
>>> b/include/drm/ttm/ttm_bo_api.h
>>> index f681bbdbc698..40eb95875355 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long
>>> addr,
>>>                void *buf, int len, int write);
>>> +
>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long
>>> start,
>>> +               unsigned long end, unsigned long newflags);
>>> +
>>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>     vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t
>>> prot);
>>> -- 
>>> 2.32.0
>>>
>
