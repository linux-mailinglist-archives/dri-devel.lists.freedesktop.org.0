Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FC81B390
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 11:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1165610E686;
	Thu, 21 Dec 2023 10:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8610E659;
 Thu, 21 Dec 2023 10:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgoZnRZE+Ux7FmjGVdbK5yjToO/kRQ+UwTLVPdGjwEeQFPJ/BN0aAdvukI1NYrj4E3JrAVhAdGREGwBeUP7+HBPoykc23xBhMoqhi0Td5c0zHAQwcLb9RqB4EROu5WAAXUG+ndKMIOIn3Chz3k+ebpzf/1IBAoOOEu+AVa/dF5wIO905APHPubXFLep2mEVwW9lP9npmwrrbeS9Aod6DpSNK30S9DqZCRdCkAdzYSSgDu/zPTzC/mrnkG8d8zkRP1Rm1ZuULKNW+EVjJSF1OkBhQXSvBPQSXhAx1ZZSYuFtzJoLdNwM/kbgirCeh+6pDCQld0V99H74b13YB4EylDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bajd7MGkTsjMScAwmgOSu1U0ReSWl0NPH0w+zqqnW5w=;
 b=l1k+zJ18nXEfy7VWOK+Bd4Pk2JmMRFLTXgRvhAe5WgudcRxYM2TLRbewBzJTlJ3lyK0ZSDECOn9qOXqP94vyMlNh/U2WR2ZYsWS6MJ2Cgq923ZCok6rUysnkTtkj/ciTvYKar9bg9Y08YWjauj+YLHI63qB4N7Kv/57UM4Rwc+2tqPcSnRr9sC8PmMl8KVkd9jeboWGI2mQFt7LvUq9nCvCwk3pTpF6+756OCoPtPqU0vdL7zIXiQrGFrGCZ3f8Wh85WVsMHPfzh0JIdypoV6GnzcMiVPTBonevFwiBGRkwkAIxBlc7soBYeilpR9mr3LDvtBsMbElZpVtqkEUWrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bajd7MGkTsjMScAwmgOSu1U0ReSWl0NPH0w+zqqnW5w=;
 b=eUj5VxjIS+u5pNmZ+5K6OByxzg4DQBN5vRNB1k//X+0lSpUp+i5vCWXbdXxcY6GoRJWwUhSedeYcKFElL3C23Pvey2gBlgImP9lQZnmrgcstcSX/mVGnBoqhTCXn8ptSBLdwId15J1apYopOVf3OtBxygFhmoJlpudHzY2igvi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 10:31:31 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::4775:9a44:9a76:8816]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::4775:9a44:9a76:8816%5]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 10:31:31 +0000
Message-ID: <7cdae7af-e789-ef92-922a-dcede9f5fc51@amd.com>
Date: Thu, 21 Dec 2023 16:01:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
 <963893ce-5f79-458b-9607-3a2d98fd2098@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <963893ce-5f79-458b-9607-3a2d98fd2098@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::12) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 925e8f6d-ec52-4db6-3f49-08dc020fff11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHI7ySu7GkXWdioV/JgfPAgfzDsxmmoQ1G4QhCn6oi+6VeNGJtNNKIhBOCJX/7aFMELcP2IckDgN4dxBR7stZ9N0AHndrFOw6WprDs/rEafXBbG4FecITs4dkQ6kxdtj5I0YhtPb/yfaOHSeW3jBRUq/VOIoJ6VmPmz0mFRZHvlTI+8HpW5JV8RZMcx3cJS8hJzpI2KZ6Glg45fxjib4FKv20v+izK7utUTKaBNyWMur4720lvQHEclamaOEt3JspR5DsYuCdDPPV2pm0BRWf6xMlavZ7ah2iWXLQ9WRRMiMfq5frpSp0TPduFtceAQ3RzPCzB3MAX/K+sJeWYqwGL1CO2UnH+Xccef9S9sHudbaqUQjrPKlqfilzCjvOJp+ZzhkadMc5ymDU0r2ZBIMah5+cT7CyLePL8DGqg+OthnzAqSMZ8Ngi7ZA1+6qsLMj5fMlLkBkixXfy63qIi1OZBX6Usfe7nkVKIr19jVsXThoBfeET1TaZET6KCRlIWFYxXBSCTmPmamRJ2C4fSyE4WfqyKFdSMX9B+VfNFyCXHsTuXZV5OYNCAhdin+gmgGvmSQOgal/0wJy0U07EW8sBDF2MNC+9tqduzZ4svfoDUov1n/P33oNM4vGa1WFYmdFIkYvyEGYh7LReBgalW0YDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6506007)(66476007)(66556008)(66574015)(26005)(6512007)(478600001)(4326008)(53546011)(8936002)(8676002)(6666004)(31686004)(316002)(83380400001)(6486002)(966005)(2616005)(66946007)(2906002)(5660300002)(30864003)(38100700002)(41300700001)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHlPaVlhQnIxNXFwV2E5ZlRWZS84MHg2bzBxZEl2WExYWlgyZ3BuTGF5ZWp1?=
 =?utf-8?B?TTVDMFgzUWZtb1pIZStzblZKYTFXVFRlZWEvelQrdlVFNGQ3UGlUSEMyclZK?=
 =?utf-8?B?WEpoNkJHUHNDcXh5WmlLM2JoSTlaKytNWDM3UFdMMXJIK2ZDT1MzN25KYkZZ?=
 =?utf-8?B?UDU0bVg4Vk93SUVYQk9pQzdGUWE5M09LM20yWkVXQlc2a00rUzlSR2p3SXI3?=
 =?utf-8?B?RWdLM0FjNDFmdFFTZ3N1d2ZRMmVLOWhYRTlCbG1LN2NDY1VPSm1ocmtvSkNJ?=
 =?utf-8?B?R3JNd1R1aTNPSDRUcG92OVlyV1pYb2g5YXAvVGpmSloyUWNZWWhNeWQwR2pj?=
 =?utf-8?B?YXFKbGpsZVlicnl1WjhWSStLRUY4QkRXN3ZEaFI2RHJhSXBpcUU1QWRRclVa?=
 =?utf-8?B?T0ZUbDZvUEpqTk01dnJjZDRmVnNwZ3A2dU1RWGk5bkIyK0xzblFKQmRic0pJ?=
 =?utf-8?B?NEZjVlEwYXVMdkZibitiZlRhYmtmc1VNNW9XVEJlM3plTVdqMnluNy9VUGRi?=
 =?utf-8?B?TFVnMldqaEFxcHZrOXVobWt3d01HRXB4R0RYN0JzV3BhU2lpR3VoM1NPWlJS?=
 =?utf-8?B?bU0wKzZIVFptbUNaYWdQS2d4TnhNSURJenFKRTY0cW1YNW5kUmN3ai9YUXhE?=
 =?utf-8?B?STF6dmN3ck1kTnQ0SzZlWkZqSW9ObzJ2aENGQ2pQemh5T01GQnp5NUdBUDZE?=
 =?utf-8?B?Z1I5QlJBZ1I5NzRCeEhEdGpMVllDTGZ4bnZ0S3JRNWFpQmk2OVRmRVRFVW9l?=
 =?utf-8?B?ejFvQVVhQU5EMkZZbHNLSXJqQ2VGODdMUC9sNEpKN0FwZG1lN201bDI4UFN3?=
 =?utf-8?B?ekxXMzMxSHc0Wjk4RUlYQnBNVkowVnZmREZFV3ZrcENNR0g3OHBMQUUwSlE3?=
 =?utf-8?B?RWo2ZTI4QS9CVTd3VkFtNGwyQU5lRHFrSGprcG04a0NaRW5FN1k5dkNqSHJy?=
 =?utf-8?B?aEh6Y3JxVzJCK0JIRmJQWEFEVnNjaGcwdGNlMVRDK2ZlR0tOQmVoS1Q4aVdi?=
 =?utf-8?B?MDRCWHVMZkQ4NEVwVVRKaGt2YzVPem5xMDM4MEpMUFBvOWZOQWtDdUIxQVlS?=
 =?utf-8?B?dkk2QXhLdW0wdWV3NjFDQU9RK09HNW1kcTB1Rjg2RmFKcDZrT0tYZHJxeHNv?=
 =?utf-8?B?R3VBSlJDSmFwZDdVcjlBSlF3bGtkMmFXR2xWTk9XTTNReVJlTjdSVnYvRk1w?=
 =?utf-8?B?R1dOWXhmNFIxaENsbUUwZjRKc3dnRkFIam5Hc0g4aXliL1FtUkpaZHBkbmxI?=
 =?utf-8?B?TWVaMCtUWFcxajd4ZVpjOTJQSVMrcTFUZDFCaEd1SlBpeG9CUUROWGZoSlNR?=
 =?utf-8?B?alM4ZEdkeW91d0l5VU9haW9PcjJwZm9pN3JvRzVHcEtHZmlGMjl1eGZFdXFy?=
 =?utf-8?B?WXUyQ05vNHloSWVjRHpiUXhlb1FwQWN3T296c3lLVDJ6R2xnb2FIc0NDT1Vn?=
 =?utf-8?B?ZzQ3U3VBSjk4OUpXOEZNczdqdjFNK2ZxS1gvYjBqUVRnMDM3ODBwUCtyajg3?=
 =?utf-8?B?Zm53R2NFSU1jT0Q0cUFEaXJOeFl6UzkvMHhjMjlWcEl5aitMbmFZa1k1WkZ6?=
 =?utf-8?B?TU9lZTB1My9jNE9WNFFSUlJTMDBwQjNNUlR4TU15Vk9Qd3Azcm5vT2FCVkk2?=
 =?utf-8?B?WEtxVThLYWdQRWd4NWQ1NGMzbEZWazd4TEttNSs4Y0M0YkVoQUZicjY1bC90?=
 =?utf-8?B?NWVVSituRTc0S3BucFN3VTdTNjNVQm0yM0V2VU9sZVJ3Mit1cm5WNGw0VzV4?=
 =?utf-8?B?Q1VodFpiVDJ5ZzdWU3FKREQ5aW40cWZiQXVudkJYa1F2Rmo5TC9iOHNFVFBk?=
 =?utf-8?B?QzNvRU1za2VSNUJLb296TjlQS3VscDUydHNMWGRQUW5YazdyNnFBVHl1d3Fk?=
 =?utf-8?B?MHNIUmJ1L05zR3RnTEIzSTNsMGJQb1V0R3lUQnpTUGJ4MFU4ckY0NmJlYklL?=
 =?utf-8?B?N1UxL1lTUG5tVDJBaWlNTnk1RVdSNnJDRVFQQ0x0QlczbFR1VW9weHNocFVL?=
 =?utf-8?B?enROZWVSRFpUcWRJLzJFa3p1eGJrS2g4ZE9hSDduMW1TTG1sbGJwMk9XUkZZ?=
 =?utf-8?B?dlA2K2pjd3ZvZzZLQ3VxdnBqek5JR3B5VUFnSlNPTGZkK0oxWktkcFA5SmY1?=
 =?utf-8?Q?QHFryrGl61MzH5+An2cITGcbx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925e8f6d-ec52-4db6-3f49-08dc020fff11
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 10:31:31.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgpLxwgmM46MhSR4PjQBl2AQ82k+hhBcUu1yHed0sBPiWnMZ7tzhGQeG9Lf5WCGNcIVHxZmUaPt05PikwJDkuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

On 12/21/2023 12:51 AM, Matthew Auld wrote:
> Hi,
>
> On 14/12/2023 13:42, Arunpravin Paneer Selvam wrote:
>> - Add tracking clear page feature.
>>
>> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>>    successfully clears the blocks in the free path. On the otherhand,
>>    DRM buddy marks each block as cleared.
>>
>> - Track the available cleared pages size
>>
>> - If driver requests cleared memory we prefer cleared memory
>>    but fallback to uncleared if we can't find the cleared blocks.
>>    when driver requests uncleared memory we try to use uncleared but
>>    fallback to cleared memory if necessary.
>>
>> - When a block gets freed we clear it and mark the freed block as 
>> cleared,
>>    when there are buddies which are cleared as well we can merge them.
>>    Otherwise, we prefer to keep the blocks as separated.
>
> I was not involved, but it looks like we have also tried enabling the 
> clear-on-free idea for VRAM in i915 and then also tracking that in the 
> allocator, however that work unfortunately is not upstream. The code 
> is open source though: 
> https://github.com/intel-gpu/intel-gpu-i915-backports/blob/backport/main/drivers/gpu/drm/i915/i915_buddy.c#L300
>
> It looks like some of the design differences there are having two 
> separate free lists, so mm->clean and mm->dirty (sounds reasonable to 
> me). And also the inclusion of a de-fragmentation routine, since buddy 
> blocks are now not always merged back, we might choose to run the 
> defrag in some cases, which also sounds reasonable. IIRC in amdgpu 
> userspace can control the page-size for an allocation, so perhaps you 
> would want to run it first if the allocation fails, before trying to 
> evict stuff?
Thanks, I will check the code.

Regards,
Arun.
>
>>
>> v1: (Christian)
>>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>>      cleared. Else, reset the clear flag for each block in the list.
>>
>>    - For merging the 2 cleared blocks compare as below,
>>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 169 +++++++++++++++---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>>   include/drm/drm_buddy.h                       |  18 +-
>>   5 files changed, 168 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 08916538a615..d0e199cc8f17 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -556,7 +556,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -589,7 +589,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> @@ -897,7 +897,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
>> *adev)
>>           kfree(rsv);
>>         list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, 
>> blocks) {
>> -        drm_buddy_free_list(&mgr->mm, &rsv->allocated);
>> +        drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>>           kfree(rsv);
>>       }
>>       if (!adev->gmc.is_app_apu)
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f57e6d74fb0e..d44172f23f05 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>>       __list_add(&block->link, node->link.prev, &node->link);
>>   }
>>   +static void clear_reset(struct drm_buddy_block *block)
>> +{
>> +    block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>> +static void mark_cleared(struct drm_buddy_block *block)
>> +{
>> +    block->header |= DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static void mark_allocated(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>> @@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
>>       mark_free(mm, block->left);
>>       mark_free(mm, block->right);
>>   +    if (drm_buddy_block_is_clear(block)) {
>> +        mark_cleared(block->left);
>> +        mark_cleared(block->right);
>> +        clear_reset(block);
>> +    }
>> +
>>       mark_split(block);
>>         return 0;
>> @@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>           if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   +        if (drm_buddy_block_is_clear(block) !=
>> +            drm_buddy_block_is_clear(buddy))
>> +            break;
>> +
>> +        if (drm_buddy_block_is_clear(block))
>> +            mark_cleared(parent);
>> +
>>           list_del(&buddy->link);
>>             drm_block_free(mm, block);
>> @@ -295,6 +318,9 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>   {
>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>> +
>>       __drm_buddy_free(mm, block);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>> @@ -305,10 +331,20 @@ EXPORT_SYMBOL(drm_buddy_free_block);
>>    * @mm: DRM buddy manager
>>    * @objects: input list head to free blocks
>>    */
>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects)
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags)
>>   {
>>       struct drm_buddy_block *block, *on;
>>   +    if (flags & DRM_BUDDY_CLEARED) {
>> +        list_for_each_entry(block, objects, link)
>> +            mark_cleared(block);
>> +    } else {
>> +        list_for_each_entry(block, objects, link)
>> +            clear_reset(block);
>> +    }
>> +
>>       list_for_each_entry_safe(block, on, objects, link) {
>>           drm_buddy_free_block(mm, block);
>>           cond_resched();
>> @@ -328,9 +364,11 @@ static inline bool contains(u64 s1, u64 e1, u64 
>> s2, u64 e2)
>>   }
>>     static struct drm_buddy_block *
>> -alloc_range_bias(struct drm_buddy *mm,
>> -         u64 start, u64 end,
>> -         unsigned int order)
>> +__alloc_range_bias(struct drm_buddy *mm,
>> +           u64 start, u64 end,
>> +           unsigned int order,
>> +           unsigned long flags,
>> +           bool fallback)
>>   {
>>       struct drm_buddy_block *block;
>>       struct drm_buddy_block *buddy;
>> @@ -369,6 +407,15 @@ alloc_range_bias(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> +            if (!fallback) {
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    if (!drm_buddy_block_is_clear(block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(block))
>> +                        continue;
>> +                }
>> +            }
>>               /*
>>                * Find the free block within the range.
>>                */
>> @@ -405,25 +452,58 @@ alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>> +                 u64 start, u64 end,
>> +                 unsigned int order,
>> +                 unsigned long flags)
>> +{
>> +    struct drm_buddy_block *block;
>> +    bool fallback = 0;
>> +
>> +    block = __alloc_range_bias(mm, start, end, order,
>> +                   flags, fallback);
>> +    if (IS_ERR(block))
>> +        return __alloc_range_bias(mm, start, end, order,
>> +                      flags, !fallback);
>> +
>> +    return block;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +get_maxblock(struct drm_buddy *mm, unsigned int order,
>> +         unsigned long flags)
>>   {
>> -    struct drm_buddy_block *max_block = NULL, *node;
>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        if (!list_empty(&mm->free_list[i])) {
>> -            node = list_last_entry(&mm->free_list[i],
>> -                           struct drm_buddy_block,
>> -                           link);
>> -            if (!max_block) {
>> -                max_block = node;
>> -                continue;
>> +        struct drm_buddy_block *tmp_block;
>> +
>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +            if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                /* Find a cleared block */
>> +                if (!drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>> +            } else {
>> +                if (drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>>               }
>>   -            if (drm_buddy_block_offset(node) >
>> -                drm_buddy_block_offset(max_block)) {
>> -                max_block = node;
>> -            }
>> +            block = tmp_block;
>> +            break;
>> +        }
>> +
>> +        if (!block)
>> +            continue;
>> +
>> +        if (!max_block) {
>> +            max_block = block;
>> +            continue;
>> +        }
>> +
>> +        if (drm_buddy_block_offset(block) >
>> +            drm_buddy_block_offset(max_block)) {
>> +            max_block = block;
>>           }
>>       }
>>   @@ -440,11 +520,35 @@ alloc_from_freelist(struct drm_buddy *mm,
>>       int err;
>>         if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order);
>> +        block = get_maxblock(mm, order, flags);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>> +        for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +            struct drm_buddy_block *tmp_block;
>> +
>> +            list_for_each_entry_reverse(tmp_block, 
>> &mm->free_list[tmp], link) {
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    /* Find a cleared block */
>> +                    if (!drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                }
>> +
>> +                block = tmp_block;
>> +                break;
>> +            }
>> +
>> +            if (block)
>> +                break;
>> +        }
>> +    }
>> +
>> +    if (!block) {
>> +        /* Fallback method */
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>               if (!list_empty(&mm->free_list[tmp])) {
>>                   block = list_last_entry(&mm->free_list[tmp],
>> @@ -454,10 +558,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>>                       break;
>>               }
>>           }
>> -    }
>>   -    if (!block)
>> -        return ERR_PTR(-ENOSPC);
>> +        if (!block)
>> +            return ERR_PTR(-ENOSPC);
>> +    }
>>         BUG_ON(!drm_buddy_block_is_free(block));
>>   @@ -524,6 +628,8 @@ static int __alloc_range(struct drm_buddy *mm,
>>               mark_allocated(block);
>>               total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>>           }
>> @@ -558,7 +664,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>           list_splice_tail(&allocated, blocks);
>>           *total_allocated_on_err = total_allocated;
>>       } else {
>> -        drm_buddy_free_list(mm, &allocated);
>> +        drm_buddy_free_list(mm, &allocated, 0);
>>       }
>>         return err;
>> @@ -624,11 +730,11 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>               list_splice(&blocks_lhs, blocks);
>>               return 0;
>>           } else if (err != -ENOSPC) {
>> -            drm_buddy_free_list(mm, blocks);
>> +            drm_buddy_free_list(mm, blocks, 0);
>>               return err;
>>           }
>>           /* Free blocks for the next iteration */
>> -        drm_buddy_free_list(mm, blocks);
>> +        drm_buddy_free_list(mm, blocks, 0);
>>       }
>>         return -ENOSPC;
>> @@ -684,6 +790,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>         /* Prevent recursively freeing this node */
>>       parent = block->parent;
>> @@ -695,6 +803,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           list_add(&block->link, blocks);
>>       }
>>   @@ -782,7 +892,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           do {
>>               if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>                   /* Allocate traversing within the range */
>> -                block = alloc_range_bias(mm, start, end, order);
>> +                block = __drm_buddy_alloc_range_bias(mm, start, end,
>> +                                     order, flags);
>>               else
>>                   /* Allocate from freelist */
>>                   block = alloc_from_freelist(mm, order, flags);
>> @@ -808,6 +919,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>             mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           kmemleak_update_trace(block);
>>           list_add_tail(&block->link, &allocated);
>>   @@ -846,7 +959,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       return 0;
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    drm_buddy_free_list(mm, &allocated, 0);
>>       return err;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> @@ -879,8 +992,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct 
>> drm_printer *p)
>>   {
>>       int order;
>>   -    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB\n",
>> -           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>> +    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB, clear_free: %lluMiB\n",
>> +           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, 
>> mm->clear_avail >> 20);
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 0d735d5c2b35..942345548bc3 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     err_free_blocks:
>> -    drm_buddy_free_list(mm, &bman_res->blocks);
>> +    drm_buddy_free_list(mm, &bman_res->blocks, 0);
>>       mutex_unlock(&bman->lock);
>>   err_free_res:
>>       ttm_resource_fini(man, &bman_res->base);
>> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct 
>> ttm_resource_manager *man,
>>       struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>> +    drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>>       bman->visible_avail += bman_res->used_visible_size;
>>       mutex_unlock(&bman->lock);
>>   @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device 
>> *bdev, unsigned int type)
>>       ttm_set_driver_manager(bdev, type, NULL);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(mm, &bman->reserved);
>> +    drm_buddy_free_list(mm, &bman->reserved, 0);
>>       drm_buddy_fini(mm);
>>       bman->visible_avail += bman->visible_reserved;
>>       WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index ea2af6bd9abe..e0860fce9ebd 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -83,7 +83,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>                                 top, max_order);
>>       }
>>   -    drm_buddy_free_list(&mm, &holes);
>> +    drm_buddy_free_list(&mm, &holes, 0);
>>         /* Nothing larger than blocks of chunk_size now available */
>>       for (order = 1; order <= max_order; order++) {
>> @@ -95,7 +95,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>       }
>>         list_splice_tail(&holes, &blocks);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -190,7 +190,7 @@ static void 
>> drm_test_buddy_alloc_pessimistic(struct kunit *test)
>>         list_del(&block->link);
>>       drm_buddy_free_block(&mm, block);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -236,7 +236,7 @@ static void 
>> drm_test_buddy_alloc_optimistic(struct kunit *test)
>>                                  size, size, &tmp, flags),
>>                             "buddy_alloc unexpectedly succeeded, it 
>> should be full!");
>>   -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct 
>> kunit *test)
>>                           drm_buddy_block_size(&mm, block),
>>                           BIT_ULL(mm.max_order) * PAGE_SIZE);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a5b39fc01003..f7311b59f2b0 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -6,6 +6,7 @@
>>   #ifndef __DRM_BUDDY_H__
>>   #define __DRM_BUDDY_H__
>>   +#include <linux/bitfield.h>
>>   #include <linux/bitops.h>
>>   #include <linux/list.h>
>>   #include <linux/slab.h>
>> @@ -25,15 +26,19 @@
>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> +#define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>> +#define DRM_BUDDY_CLEARED            BIT(4)
>>     struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>> +
>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>>   /* Free to be used, if needed in the future */
>> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>>       u64 header;
>>   @@ -86,6 +91,7 @@ struct drm_buddy {
>>       u64 chunk_size;
>>       u64 size;
>>       u64 avail;
>> +    u64 clear_avail;
>>   };
>>     static inline u64
>> @@ -112,6 +118,12 @@ drm_buddy_block_is_allocated(struct 
>> drm_buddy_block *block)
>>       return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>>   }
>>   +static inline bool
>> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
>> +{
>> +    return block->header & DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static inline bool
>>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>>   {
>> @@ -150,7 +162,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>     void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>   -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects);
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags);
>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,

