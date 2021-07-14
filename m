Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69053C80B2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA506E1CF;
	Wed, 14 Jul 2021 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D646E1CD;
 Wed, 14 Jul 2021 08:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiGRi0HzdOTugltBniCFALUM4rXVyDgr49KMTeIXB0jYRE/5zrzQ71xjm/aYLI8+ZssJJ5SCVRwh4deHanAEeZ19xevXHRqTrH2vkIwTdhihmJjnRDXb8X2gBFALnhfZb+Sy0cbuFPefUqnD2OKwdfeXYcNmpdFuEI+ItxMPtTI7OvM6D7+HTnbGOw5qjusMWBO0ODXNga5VD/ACYQB7Tn+cJc3JU9L8O9BSZSDkng40VMZA3CaEdqrm5M8qSYs7R4nPorQQDga5K6R40r0PHFPsmpkRGTlexDrnWdhbvzTBzckSwLHCITpANZSVNj+3eR/iMoNbSobIvmLZugD1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ltEWAXzHyd+pjoXT73vrgvR6fG5ECBfC2vG/naWnRY=;
 b=OoR3Yp5zjy57TAxcLxjYKiyWhP5a/Z5WXysYVX//hW/svlkJJN8jmmYMbkZx0Iev0SZ7J0MdV0RM9dpyvUYFW0RlGYpkIGWfbopqV5MK+/UWVUxtYg+rzIGkoNHsH7vzEvxiLNDEbFKXQlN2DZELTSo1kUxrN6OHqteS9HlYZkQzW2bijvOqNO9RfFSxG9bENc79yz+9INV4AHCk5FEjGqUNwlfyAXYIaTw/wxpZPt2O1smkLaaMjSeEX71BLcIAW0V8FDmJQ0saScZq2OI5LJ6823tv4umu+Yvt0jHjvO/6WO6cB4RWOLisRreqRvEcQUfESaWwES+SkvN7CkHeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ltEWAXzHyd+pjoXT73vrgvR6fG5ECBfC2vG/naWnRY=;
 b=fiDq8R0gZ5tUjwh7xOUX0tlD6wrd5xiDX1/YEb8OgFXRn0fkLkRNp1NkVa/VlQ89WS6R6FytNS5YsEq78IzuQp6UByI2O3iWE2ywKBtT/JbzslruqfBECf47cMdbiPnKHPjNaK7HcuhvhzqB5bMJswtHGnxvShkDr/e3ezvfjSs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 08:51:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 08:51:06 +0000
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
 <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
Date: Wed, 14 Jul 2021 10:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:205:1::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 AM4PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:205:1::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.8 via Frontend Transport; Wed, 14 Jul 2021 08:51:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c3f1b4-2e21-490e-4acc-08d946a484a1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4317E4D78F247F397E3F2CF183139@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:218;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytXgDweSKE6fSeAb06i1dbr05Gov/jq3+TF/djxPXaGcwAz7C75qIMCMMMucOoqRADynwDfFpylGt9smJTNbZPT0v/qREuBokmINL5f0NyTCAZaYUK9ivmvhhhG72nXk6iu4BOonqaqcrxlIDSFQuRPlPId0oFEgV2HgnS4jhO/USnJJT8tgY2qEKrJRAMqUtl1rL5gMgUZJmFtMXGKzZneePnccpmDuyyuoM/aoaysSQKgWjoluFtrTQmHIdcnEYPGKcsD6cLG0E0EEzpnWxC5mZ798oSbiMulzqMDU6KbNtnLgBAfvSxFzZtkJeON3omSIoFtBjNe0WBIGkr/gfDIEh1BI6eLtZaDG5n2xMW5CvJiVOSeSW/DhoDXCRs1jv+cIWa/hr1zopc2ZBV6iJJCNwFgSHYOFzPkFAHB5Vmpv/0YSHVuEkzJdclX7S5WxqMsDV3maXZoLPeswYYN0bWdOV/3gtxTaEUgqY9tFgM+panynNSDt2mkRfhIIZdRSWeWNqBcM/hcPhC9QS7MS1mv6eJsyVhFv93quCMKx0mEBm0eW2/AdchMq+PeaPStyTR0wPWO6kwZ0vNJq6BJDyVXVDVQ2ZUyghZOIXya8oARoMohe6Z8pPKPxFJwJV7w6UU1q6PDT4BUoPDuXZqwRex2ShyajzWwZPMpDrGx3OxfNASkQCDS5cLsE7kGQQighnXdN5erw4ezTJn4ydsrYUi8TzHPcSXoySkQDg+t0Nx6BOvug+XptYRhzGudS3pXD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(31686004)(38100700002)(6486002)(5660300002)(53546011)(186003)(4326008)(66946007)(66556008)(66476007)(83380400001)(316002)(31696002)(8676002)(86362001)(110136005)(66574015)(2616005)(54906003)(8936002)(6666004)(478600001)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTRaUVV5WDZ0Z1h2aitrRndIeDFBUFZnd1JGSlovbkVQZTVua2JrZUVPZjlE?=
 =?utf-8?B?NVZXZTY3UGJITDBOd0g4Zyt6TXE2eWU4Mm40dWhMOC9yL0JPZXc2SzdkWWpx?=
 =?utf-8?B?UU82cSt2V01QRXdDY3RjdFoyTzQ2LzJYWUNMRXVWeVIwQlZpN0FZTlh1MzhS?=
 =?utf-8?B?ZCs4bHplcXFzZm9GS0loTkR5SVIxR2FwYS8yc2hzWGlSeDI4N2FMQzNIdTBx?=
 =?utf-8?B?WCtUREJuM3FEZ3hJRXB2ZTYzRy9KU1JacmMwYUIxUGFIbnNFK0RpQjRQRjQx?=
 =?utf-8?B?ZFhZMHZPN0w3VkRxcW1Fd3pRQWNvRGMzZzgrNnFORVJWUmR4eTYzNFJ3dU5O?=
 =?utf-8?B?SzVONnMwMGlFdS9tZWNheDB6UEo0ZGFTd2hwYkNtdGV3MTU0NGJsT0ZXOTRW?=
 =?utf-8?B?M2IrUy9STEd1KzUwT0tibS82dHRTK3BBcGtOQURlaWFHNzZDZU1vMWFZcGpG?=
 =?utf-8?B?RElVOU81d3FlTlpoa0JBVDdTSXBML0Zxak15VGorUXY4MnR5WkFuaG5telh5?=
 =?utf-8?B?YktTdnhhTFF5TW5ndjFQSC9ocngvWGIybkNrcStrV2c0eGZHSEd5aXNWRWZY?=
 =?utf-8?B?cFVqLzZJNk9MeVBPVUN4RFU1SlFaUTZyWW16VkVZRk9OTWgxQXYwOVJUV0tm?=
 =?utf-8?B?L1FqZ1ZYNUtsTEkzM09IVmpkZmVobmRocEpxa3BFM0UzTG9jRVRGMEMyc0dH?=
 =?utf-8?B?TzV6TVdXNnV3SnNhcjRvbGZnOUZPS0lWa2pFZE5mZEFBWWVFSGF2RjNvSm1Q?=
 =?utf-8?B?bVgvVWtoR0E4TmViV3pZTlJvb252WjFHQUMwTVc5WFJQTklLUnJpQklPU3pZ?=
 =?utf-8?B?TzI3ZHoxejU2QlZCcnFqZHU5NVkvUE9lcUxYNzVXV0RVZlV6a0daQXM2OE9x?=
 =?utf-8?B?d3lGN1RmK2czUEx6aWtCaFZTb1BRUEdOSXplSC9RV0xwaUtQamJRME03eFBP?=
 =?utf-8?B?cWRkRkFYVVRKY2JYYkZ1RDdBdzZVbjZqa1hvWjQ3T05jWFIrLy9nRWRHZzVT?=
 =?utf-8?B?K09jeGNmY2hweXBTai9VaGt4dlE2QWpPU01IVkV5VU1LMlA1aExFa0grVHVE?=
 =?utf-8?B?bWZ3UzRScVo0ZzBMdXZPUXRSdnNLUzZVQTc5eWJFVDl5VUZsa0gwNmhNVFJJ?=
 =?utf-8?B?V0pyN2E0eG9YTSs5R1lxVTZyc3NCb3VGcGtjRGk5Z0N2aUVyai9nZ1BNOUkr?=
 =?utf-8?B?N1JDeld4ZWtpZUNQSmJvUm9NckNsaHVkYnlxUFZRRnlGUkVPT20zMWhzQTN0?=
 =?utf-8?B?dGROd3lJM0kzeFd6Tm5qS1JyVGFqN2hES0VMeDJDaERyOG9HV0l6dHBoUS9X?=
 =?utf-8?B?UkpYL2ZQOGJZMURDTzRpL0RzQ3lEakFuaWpqaVE2bHBESksrQ1lkd296eDdt?=
 =?utf-8?B?TTZCdmc2N2gycFYrdEFQdy9qVXZMdmVNL2RSV0pvTkpNcmFqc1ZqdnVHamJB?=
 =?utf-8?B?YXNFNjJzV1lLc0JNOWg0cWtGY3pyQnZXTkw4U1B0SmpVOHJCZTdxMm5CTVJG?=
 =?utf-8?B?Z0VoU1RDd3E1M09mOVM3cE9hYkExTlJ1Nm55RE9HQ1dMMWFJQmhKOXZzMzhH?=
 =?utf-8?B?c3F5U0tSWG1iM1N4Tzg5T1BKa2xBV1ljcnhjanhRdXB1cjFXeG43dDJYU1JT?=
 =?utf-8?B?dFc2d0NEWkpyQ3VzS0ZPcStjWEtkY3E4TlJZT1JXSGFOK3p6YVhLbTR2ajIr?=
 =?utf-8?B?Tm93cDVQcHd4WCtHZ3dzS2k5WExjQjQzUkJ0azRVOHZUODZkajFlbzVBZnVZ?=
 =?utf-8?B?OG1kUVloY3ptUTRoTVE0bGtUQk9CN3JGa082Wk9lYzFmaklndzBlRGRhNFpJ?=
 =?utf-8?B?OWRFR0k0d2RqNy9iZVNtVkxUa0Y0NlFER0pxU1VSYWMwRjV4ekVGUUlMUlV4?=
 =?utf-8?Q?kvmvRJKN1ig3x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c3f1b4-2e21-490e-4acc-08d946a484a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 08:51:06.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajEDCXXtGAkSypCm3bFHLXAaDvFjwX43mp4bgZeqccl6jpDLybN8pT4FHaRPTfSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 13.07.21 um 17:28 schrieb Alex Deucher:
> On Tue, Jul 13, 2021 at 2:57 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>>
>>
>> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
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
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Are you planning to push this to drm-misc?

Yes, just didn't found time yesterday.

Christian.

>
> Alex
>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>>    drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>>    drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>>    include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>>    6 files changed, 24 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index b3404c43a911..1aa750a6a5d2 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>>>        .fault = amdgpu_gem_fault,
>>>        .open = ttm_bo_vm_open,
>>>        .close = ttm_bo_vm_close,
>>> -     .access = ttm_bo_vm_access
>>> +     .access = ttm_bo_vm_access,
>>> +     .mprotect = ttm_bo_vm_mprotect
>>>    };
>>>
>>>    static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index 5b27845075a1..164ea564bb7a 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
>>>        .fault = nouveau_ttm_fault,
>>>        .open = ttm_bo_vm_open,
>>>        .close = ttm_bo_vm_close,
>>> -     .access = ttm_bo_vm_access
>>> +     .access = ttm_bo_vm_access,
>>> +     .mprotect = ttm_bo_vm_mprotect
>>>    };
>>>
>>>    void
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 458f92a70887..c19ad07eb7b5 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
>>>        .fault = radeon_gem_fault,
>>>        .open = ttm_bo_vm_open,
>>>        .close = ttm_bo_vm_close,
>>> -     .access = ttm_bo_vm_access
>>> +     .access = ttm_bo_vm_access,
>>> +     .mprotect = ttm_bo_vm_mprotect
>>>    };
>>>
>>>    static void radeon_gem_object_free(struct drm_gem_object *gobj)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..fb325bad5db6 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>    }
>>>    EXPORT_SYMBOL(ttm_bo_vm_access);
>>>
>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>> +                    unsigned long end, unsigned long newflags)
>>> +{
>>> +     /* Enforce no COW since would have really strange behavior with it. */
>>> +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>>> +             return -EINVAL;
>>> +
>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>>> +
>>>    static const struct vm_operations_struct ttm_bo_vm_ops = {
>>>        .fault = ttm_bo_vm_fault,
>>>        .open = ttm_bo_vm_open,
>>>        .close = ttm_bo_vm_close,
>>>        .access = ttm_bo_vm_access,
>>> +     .mprotect = ttm_bo_vm_mprotect,
>>>    };
>>>
>>>    int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
>>>    {
>>>        /* Enforce no COW since would have really strange behavior with it. */
>>> -     if (is_cow_mapping(vma->vm_flags))
>>> +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>                return -EINVAL;
>>>
>>>        ttm_bo_get(bo);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> index e6b1f98ec99f..e4bf7dc99320 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
>>>                .fault = vmw_bo_vm_fault,
>>>                .open = ttm_bo_vm_open,
>>>                .close = ttm_bo_vm_close,
>>> +             .mprotect = ttm_bo_vm_mprotect,
>>>    #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>                .huge_fault = vmw_bo_vm_huge_fault,
>>>    #endif
>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>>> index f681bbdbc698..40eb95875355 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>>
>>>    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>                     void *buf, int len, int write);
>>> +
>>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>>> +                    unsigned long end, unsigned long newflags);
>>> +
>>>    bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>>
>>>    vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);

