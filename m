Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBB3C7339
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3682F6E0DA;
	Tue, 13 Jul 2021 15:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7A89CF4;
 Tue, 13 Jul 2021 15:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORK6isah1GfYVxi2PvNNxbWPn64Fo0K7SzgwzyMpn9iejnB/xWPKnnZSi6YU5cKkjYvo2U7aUTn+JJ2AmD3g/PCnDjRDBAstYYeYx2FQxXMG8I1IM9VZDvJLuQtvz3LY7y+d4/bJpAZcm0C9DiKfu5rn5QE1eonslae71WlSGCPMvdZsLUYdSNG1VUbx6y8E9pByc5eSuKFW8N3h40qK3xfgDAdBVeKZQZrn25GC8nfJKbZB3bouOZwPkscmdcTeI+X6wZBW/VchN1dvXkU5FHkv7W7zrY+j4514sChXBGuBaeNs6QFC3Wi9T485vkcVdE1KiJdfChPpCxVbp++Meg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTw7qDWKrpZoCBCPmqWRV2Z9I40isJQ4wQCUCUt7klg=;
 b=eDYaQWut8hYVT5T/MrdvViHeaePVyBG/+EebXDpZOyY2kvMcrXY5bRWuVbuX2KtPJLfh+QLAyyqI0YihuUSDy+x/AHq3naEwGgICu+IFkJVCFrENVUiTaBxsJ5mOB9cbmZ+Hbarwu9uB40lei4h1e8pC7xbbfCjYSfRJQT43r70YdT9Hpqg1Tme7oRdbjgBm4Uldljk8djB9qLzKBj9npu9rupdiZyyayHdV0ztU2AiXRPK6B/PvS9AojXU707dE4dOU7NF+AHq7pgoEtq8VYcfCSLfkLlaQEx4LzxYn0SpqX7FqgBnjWrypsIqcee/rIK5uIEiue1ldhV6Ysq5Q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTw7qDWKrpZoCBCPmqWRV2Z9I40isJQ4wQCUCUt7klg=;
 b=dMqAS2M/PBERmkRy0ESscdY+CSzX8C1GR4/NZMXB1UAOXBglBP09vq7Ntt404yWrfuSERjAtNJJhdPmFdXL75J7OHSFSZQYg41F7Mv3TCWv4dMaR+dFxHZpI2X29gO1nb7/d5eO07mMS79YMkdCyNBPG3AlgT1RKFHHOUDFhhLs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5065.namprd12.prod.outlook.com (2603:10b6:408:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Tue, 13 Jul
 2021 15:29:19 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:29:19 +0000
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <a3b0c945-790f-944e-9af6-48fae77a1402@amd.com>
Date: Tue, 13 Jul 2021 11:29:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.84.51) by
 YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 15:29:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f4f94a4-f383-4547-ed5b-08d94612fbad
X-MS-TrafficTypeDiagnostic: BN9PR12MB5065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB506574DD34CEBEF01648BB6C92149@BN9PR12MB5065.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: if74FRa6R5yuDD8DjIQYq60iS/ldxErYr40Vv8anW7p8Fye4IYU03op2DvIoaqM7KASeCf4iNVObHMLhULedPvx1joYxIwLjVQMBkMmdjO98woKPXCw9LO/bg4Fkk2ijbKa4ag2/I/6loI9MXBLxwZQWNewbC5Sf/nMBlyN6bEXYaEePenxzgE0694w2u1Ph/jTg6MsA+vCVTh3Jh7Q/96HNCkut0Lgitc9Bzu6+iuKPvbtqL+rh0vcbPgIxFEHrKaBTd3GTUwvIY4PekXgwBpAH2bU++9bS6yrjp6lRlgOmkqNOJXPEW+7AtEg9UjWF12rM8fCW/hDBselvuNH0tesXfL1rCNZnDAU23PBNm8mPt9MtvGztOKCxwWM4H/Td5L7BRcEZ2y4ptsMmLwVqW0mLqGC5n77h/DFeu4fMyD5qr2kpAStjZyjcPmioZDZUJRM9q1Q/VhVpg3PNjwnG3zkg7VT+g6hSUY9JIdsaVJmraob8RhWjGe0eFAETMmZLxiWG6/c00JktLcm3er+/fcI15yHMAGKh0Q0W6NN9zux4NMCrbbzGcX+jmI7F/VCYY1NVV5QgByxgWJqEgGn9VXHtQbQoRMoHsjrGj2bcjTMTQOTdEjK9UbezyZFgCiRk3NnGxU/VWBkl7nh2Sia76QqynlVroiQYh3CG9T1ij/V1zkyO4z2cBJ7035/PDsfLrQSons5yp2iIA78uwUUMV2UHnPUgWv6XhTusdHYP8MQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(66946007)(316002)(66556008)(26005)(2616005)(956004)(38100700002)(5660300002)(83380400001)(44832011)(6486002)(186003)(31686004)(66574015)(8676002)(66476007)(8936002)(86362001)(16576012)(31696002)(36756003)(4326008)(2906002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGFWL0o0UzR5aTBTdms5T1lXVU40aERhdHlCekdmaldaY1kvN2pIcjJGWkp1?=
 =?utf-8?B?M2NGcEdXUmJvWUFGVmVEbDJhcElKYUdKZEUxRjkxOXVCNWdKWjdRQmppV0hv?=
 =?utf-8?B?NkdZZnFWazdOdmVSb3VlaUZwTi9zUjN5c1RLM0h5em51UXFjd1BBR2RtN1gx?=
 =?utf-8?B?TTZXOGhUdmo4c01RMlRjbnNsMytPR0F3WjhjYXk5ZG1XTXc5NERlQ3R6SjZM?=
 =?utf-8?B?Q2xxeVZTQmlqOCtFS1JaKytkYTdMWXQ1b2UxME1qWk1VR3YyQlR0NE9KWUR2?=
 =?utf-8?B?MlVmcC9JR2pBRVVTV3NBeXlDcmNRWGc2T29ZL0VWL3lEY3ZzenNaVmJGUlp2?=
 =?utf-8?B?WnRxc0tWMlJKQ3YwSERVY2M5NExtMnZxbVlqc2NQUWxHVTZJVnNkMUNzYUJx?=
 =?utf-8?B?UlFBblpSVDdRSFZLNHhzVTl4Tm5ubmV3MWR5NWxpNGIrV3Z6eS9oTTVoTWlq?=
 =?utf-8?B?TGxCcjM3WS9HUXRFbXV1S3FKdFEwalRnRnZoMUdPdTJaYkRpZUJ2YlBLV09Q?=
 =?utf-8?B?OU1qTzUvRHZBdE44THhWOHYyb1JVNklORll5bEE3Q09hd081SDRDM1dIaUhM?=
 =?utf-8?B?T0dxaFpTMmVRSEFuY0dRSSt1bnBaaHVORTVwRDJBMGZaeG55c3cxaHZDcjEx?=
 =?utf-8?B?Q3FiSE9HTkF3T2lubXE1eS91bVAwL0VsWG9HYUd0YWV1YVh3cW0vSkNpMHlU?=
 =?utf-8?B?RHFZQ0padnJYOHJoQ3lOQStLRHlEVERXbENOcnI2TXk3czNMVHpJL3FkTnNR?=
 =?utf-8?B?QU5FRlk5eXlicjFEQnByVW5OYkFsRDk1YW1CVzVaYVlXMlVWYUN5S1JuRmNU?=
 =?utf-8?B?SVhZaW9OL0dTL2tMVDZseFZRRTB6b3VVa2h1dEhwbytFcVJiU0g0aE9TZmVr?=
 =?utf-8?B?SGxkVkIzZ0ZGbEY0TEtIbFd2RTN4bC8yOUlsNVBiTFNTdFl4RnRXdTNnTXdy?=
 =?utf-8?B?MlRRZmVuWnVBdlM4ZmQ1d2tQTzVFakJYVnFzdWFhT1gxOHFJeUZ6Z2RVbzVk?=
 =?utf-8?B?cHdhVmtDNWZEbVVtLzZBbVFMTVFzNXhvZjBUUTBCQnRoWnRxSis5Y0QxT04z?=
 =?utf-8?B?WHg5ajJhaEorUlNJOFNhYzR1U0h4MWtaM2lBNnNvc2JKZXZ1NFV2K0pJVTRw?=
 =?utf-8?B?QXVWbndmVU1lUkZseHpkUngzcVVLSXNlNUI5SE50Z3FCR0FJSmd4MFBOd2dU?=
 =?utf-8?B?Mi84TEhIc1N5S1AxTzF3ak14bDVqQ3N3ZEQ0MGVFKy9VdFA1VlMvT0hPM1h3?=
 =?utf-8?B?UkdhVEd2cHJrRklRcTI0Mzd4MWs4TFdvOW14RCtRT1N5cTZFSktmRFMzY2Nj?=
 =?utf-8?B?RG1SYjk3cGl1YnljVzVjRktzb2NhRC9NelBvN0VIVmNGRkVGbkl0UE1tZkhV?=
 =?utf-8?B?anA5Z0VBeEdpbkxSQ3RPNzFjc3pQL0RtbGpiKzZ4dWRWdVU2ZGt4SGtvWTlN?=
 =?utf-8?B?OXc1MlpoYmNKUktsSXJCWXQwZGVGbGtESmlEeFlaRFlYcmo2ajJqNjZNdlVI?=
 =?utf-8?B?bElZRDhxVExocGIzbkdkSFR2VDA1SG9DbmxUUkFueHhid1ZZaWc4a2VFa21X?=
 =?utf-8?B?RSs1WGpCcWFRUEhwcm5yS0F6ZW5HbFBUYk5KQWtReWVpZVlHbEZjOFZpQThy?=
 =?utf-8?B?S0VzZzN1RzdsSE5sL1hIMUxhSzc4NEhCUUNrbHBFcmF0SXFrdDAwcDFkMkl6?=
 =?utf-8?B?TmllS2VXM1Q3dkpqYTBhUmVTQUhoQVJjSDdCSVRxMkxlQ0dSNGFjemsySmRh?=
 =?utf-8?Q?euWg5N8tsbvQHVdtXhwegqELIA5qpPvhKtW+EKS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4f94a4-f383-4547-ed5b-08d94612fbad
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:29:19.6775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHgekZEvgLaN4mPaHuHupcUOzfS0CQOp1vdyhI69awSfh2Ibo82cOJfDHhLERWE27ZHzlMNU+pggwHNrtrL5xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5065
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
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-07-13 um 2:57 a.m. schrieb Christian König:
>
>
> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
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
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thank you!

Alex, this patch is against your updated amd-staging-drm-next branch.
Please replace my previous version of the patch with this one.

Thanks,
  Felix


>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
>>   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
>>   include/drm/ttm/ttm_bo_api.h             |  4 ++++
>>   6 files changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index b3404c43a911..1aa750a6a5d2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct
>> amdgpu_gem_vm_ops = {
>>       .fault = amdgpu_gem_fault,
>>       .open = ttm_bo_vm_open,
>>       .close = ttm_bo_vm_close,
>> -    .access = ttm_bo_vm_access
>> +    .access = ttm_bo_vm_access,
>> +    .mprotect = ttm_bo_vm_mprotect
>>   };
>>     static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 5b27845075a1..164ea564bb7a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct
>> nouveau_ttm_vm_ops = {
>>       .fault = nouveau_ttm_fault,
>>       .open = ttm_bo_vm_open,
>>       .close = ttm_bo_vm_close,
>> -    .access = ttm_bo_vm_access
>> +    .access = ttm_bo_vm_access,
>> +    .mprotect = ttm_bo_vm_mprotect
>>   };
>>     void
>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>> b/drivers/gpu/drm/radeon/radeon_gem.c
>> index 458f92a70887..c19ad07eb7b5 100644
>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct
>> radeon_gem_vm_ops = {
>>       .fault = radeon_gem_fault,
>>       .open = ttm_bo_vm_open,
>>       .close = ttm_bo_vm_close,
>> -    .access = ttm_bo_vm_access
>> +    .access = ttm_bo_vm_access,
>> +    .mprotect = ttm_bo_vm_mprotect
>>   };
>>     static void radeon_gem_object_free(struct drm_gem_object *gobj)
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index f56be5bc0861..fb325bad5db6 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct
>> *vma, unsigned long addr,
>>   }
>>   EXPORT_SYMBOL(ttm_bo_vm_access);
>>   +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long
>> start,
>> +               unsigned long end, unsigned long newflags)
>> +{
>> +    /* Enforce no COW since would have really strange behavior with
>> it. */
>> +    if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
>> +
>>   static const struct vm_operations_struct ttm_bo_vm_ops = {
>>       .fault = ttm_bo_vm_fault,
>>       .open = ttm_bo_vm_open,
>>       .close = ttm_bo_vm_close,
>>       .access = ttm_bo_vm_access,
>> +    .mprotect = ttm_bo_vm_mprotect,
>>   };
>>     int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct
>> ttm_buffer_object *bo)
>>   {
>>       /* Enforce no COW since would have really strange behavior with
>> it. */
>> -    if (is_cow_mapping(vma->vm_flags))
>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>           return -EINVAL;
>>         ttm_bo_get(bo);
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> index e6b1f98ec99f..e4bf7dc99320 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct
>> vm_area_struct *vma)
>>           .fault = vmw_bo_vm_fault,
>>           .open = ttm_bo_vm_open,
>>           .close = ttm_bo_vm_close,
>> +        .mprotect = ttm_bo_vm_mprotect,
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>           .huge_fault = vmw_bo_vm_huge_fault,
>>   #endif
>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
>> index f681bbdbc698..40eb95875355 100644
>> --- a/include/drm/ttm/ttm_bo_api.h
>> +++ b/include/drm/ttm/ttm_bo_api.h
>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>                void *buf, int len, int write);
>> +
>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
>> +               unsigned long end, unsigned long newflags);
>> +
>>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>>     vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t
>> prot);
>
