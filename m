Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD09164919E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 02:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987FA10E118;
	Sun, 11 Dec 2022 01:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CB810E04B;
 Sun, 11 Dec 2022 01:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDTu/8sgbU+NJOk5Q4XgN5JZekVMSk37ghCcGYdhlrFcZnpYioSMKv9GzqJW92dWv68aYVihQ1svkwfSQ8rkU3hkMiWr1PFB1MPu/puHsqVqntIzKEtR7retapGI0BKTkoMM/tqQnpuVzukWGDYA1cen9v6W1RjP7MlrVOyDBCdL60VmEaTpiTW9F5bV3WgGQWB0KuHttQW5Y8A5ECssrFFwarOTY+nQUuiNImPJofxIwYqj5wlY+uxECn/lExf/0Kfwe1ENH2p69RZrPdmSUf3i6VP6xzAlki2jYHtIyc/s13eUQTEQk368NaDhVhgDuHEMdQgtWFtCAApZYabbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rplnCYLCZvads2A82ttVEeezCxNc7naWINfxpr2Vcw=;
 b=W6Vwuw5tPI/Egp3AAPATM9eZcMYcVWaW2OPo6Y9crDeHN/1CU6nJFY/npha7QMfs/vAHkSdSMDPKgPu9GTqxMgzVhhWqWO1CJL4TD6ONsgsAiA4i+81dJTH+jI2iSnQ1at6gAeT0xnkqETKQpXccyDqnTgyaZv6fEoca0AXqvfy4qijSaauUk39+girPFJdZlVXDLlnamUzKjao6/QKa8Pwe6N7sXu+J6USEwtGt+B8nP76OYF3iT+SMSUJ4yMya/KzvZbfhLZggj6+5mn1rOzQfWImvHKNKlVKXWxKqFojqho+krFeMHXhCeO58jusloLk9sCdAHyq0Ti/gRBG/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rplnCYLCZvads2A82ttVEeezCxNc7naWINfxpr2Vcw=;
 b=G/L3xdrF+w+z0GXdfC3POOg/O5bapcochtc5RTUfEpxYeBz0o7VwM55AzTap/zYq0CQ4yUoUswClgwn37sdGyaU3CJ3BVxTkMHUB37IBDytiXk5f5fOGoqPBuqt5w0BfscILrBLJl8Sl7eAbIscJ/otfv7Wn6uDFVEsF+M2xxEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sun, 11 Dec
 2022 01:13:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5880.019; Sun, 11 Dec 2022
 01:13:12 +0000
Message-ID: <223a4acc-ee20-ae16-8b0b-63d358d0902f@amd.com>
Date: Sat, 10 Dec 2022 20:13:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <5ad09c47-1f50-07ce-7b8b-f8e4195f2256@amd.com>
 <c9243d99-2a02-2e95-82f6-c70db9a08641@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <c9243d99-2a02-2e95-82f6-c70db9a08641@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: be30d94a-8ca5-4808-459e-08dadb14dfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e0nhMiwLJmc3O105vkDlQEFJh5tQBWfZtmoXrGb9R756XeQCnCJtvSxeg/68X7Rw+y/Hx3lskxgBQvZFsgYSvR7BNSUpLcSufSPPTc0UH9u3a4q7TPIdCiUsjPikRjVaMV94TaNS4MFehp6jdPjrpvBb5h7K5v2BKh5wJsvRs6vRgZkNKYFARxWElrM52TDNa5mILoh0HnPCoBEuipi8ZW7uuc/TzJUoteSp57WgvGMtXe68NvsFue9zJGT69yc6EIF7JT1myUo7yAWYcIVGWqyZLtzdZ6buffeZTR5tZBg7dsQwm3DZ4g8f1i1vUts82adr12s7qfNRsrIsocVlSetElokuNjiP4qSevthkiU67wC2j8UI4wyRBUGTUGJGiHp+ZSo+1jzcRJfCS5PPumrLr93KDUvN70Navesz3+acYrqYpH+rPuXiU7h6u1bou3cfA9UfHaCy+FQB6dsxh5ldSaatgKh9lrWeD8XrZWf9uuNU663hTsA2wHz9AGDOmTrwxd2mndzEAyYOS6dOEL5B2nHrI7wTzc4iIVJs1dDg3SkBMK+NMjLfP7bdQgyBc6Os19vvWXfEL/h5T7gej6OjdS5LBWuevT8oLhUDBYPy1gyctkN06EJF/48meySGwZ+GW18qyo5xms/exsCfkUQyikIjuciTvPXVhW6DgD9IBrSr5Vva5/K4rFd/yzuL+w05n8YPqArClEirbxN8RDgwefNFZjtYt5yFvhJVKkIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(4001150100001)(2906002)(31686004)(44832011)(38100700002)(31696002)(26005)(36756003)(41300700001)(66476007)(6506007)(53546011)(6512007)(86362001)(8936002)(5660300002)(316002)(110136005)(66556008)(66946007)(8676002)(478600001)(6486002)(186003)(2616005)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBnU2hmTlYvNlg5YjFnSVN3d01iek9WR2tHazJqTDBJajQ5V2lUOVlDbUNo?=
 =?utf-8?B?YUhYRHJVQzlxcWdzZUdyc3hReTRxRlRzYnNIQ0pUNWNCdE9ER1dmenMzSjBL?=
 =?utf-8?B?QkVmSGZ1dzNMR0JWSzBBZnI3VXl3WUtOd0xQTkFQZEZsMlBPeFZYNEFQQzBz?=
 =?utf-8?B?eFNFQ2JMckxySHh1WG4zeVp5cHhJb0dPRXYwYitobmVRckc4NkY2M3dZNDJQ?=
 =?utf-8?B?d09ucmdGZDBzQ1VIc3hPdzI3cW0yc2JTa0o5NHhpN1RTZmxWY0JkbFBoTzQy?=
 =?utf-8?B?L0RpNGpZVnFtNmNiTXVKK2dsR2dhVGhDdFBJVDNJUHUyT0M0Rnk5OGpnQlRv?=
 =?utf-8?B?MEkzS0xkcXJ2Rmw5V0RmdlpGTWpUVDZkdHExbzZqa0l0VDJVRGU1eWVNQzJF?=
 =?utf-8?B?bVR0VDZHMk5rRVY4WXp6TzVtbitoMCtna1cyVCtJbjdNSGtndW9NNTcwVWZa?=
 =?utf-8?B?NFR4cUVJZXB5cC82Ymdkc2RaWTlzNHNsR3RRbklDUkVuQjRhVEdERDRYWElv?=
 =?utf-8?B?VzFTT1NUQWlMb3U1V1BPZFFRaGV5bWJvMkcxclRnSHhFK01nSGRnbzhWbGVz?=
 =?utf-8?B?ZmJPWTRWRHFiclV2NDEwTTd5eURtdFFnbmNQczNKTUg4VWhvUUU2Y1RNUUxW?=
 =?utf-8?B?UjdqRVVVemc2QnNuOFY5eTdHMi9SbCtkVVU0a2ZRcmFYb1F1VEdkekVCc0RP?=
 =?utf-8?B?ZzkzNFYyMm9NVmpTR0ttckdmbXJNc1MxL2JQZi9YSmgxbnZzMCsyQU5vcEd4?=
 =?utf-8?B?d1NYaE04OXdwRFdWMVcvSHhObytTVVl5YUIrcm81RXUzTFZtNFdKdk9kc0ha?=
 =?utf-8?B?UW45MHdGWEprV0N5c1dQTU53dXVFYThwVFdUQmFPeFIzYVdJdzk2YlVYd3ZU?=
 =?utf-8?B?V1J1aTFTRFZJbkZYMndCY0oxUWY4T2NzUGNxQkJyRnhEdkNoOVJhbFk1U0xZ?=
 =?utf-8?B?djhOY3MwYXRvOUNaZTN5MFM4ekZyZGFuNlBySjNrQ01kMFYrZ3RpcWdndWM5?=
 =?utf-8?B?NXNPaFB2Vk0raTd0SVNXVGdRYzNhTXhRTDd0clQ0Qm03VEJyMTk0T29qUjdD?=
 =?utf-8?B?d3krdGVTaEZDRlVMY2pmNGFFbm9mc1huaDVxUW5kVDZxRFhMWWQySnJtUmNy?=
 =?utf-8?B?Q3VZY2FJNi9HNmxpNll6RXpja3RzNzdLQ2Y5dHdkeWw1VmkrQlVKdXlGTUJW?=
 =?utf-8?B?RjlaMDM5RGFhTTB2QmtDMFg0eTN3L2crMVJNRTVhNWY0T0o2WHpMaUdka3p3?=
 =?utf-8?B?S0RleWNTcm1la21GdWlTY2pLczlVREtvOU9UZGozOU5OWDRSRllqTElOUVhy?=
 =?utf-8?B?VnVCZWY4TkQwK1JwQnBIU1JURTNRS2EvWXg3am1WeXNiY3hIVjFyYnMyeTJW?=
 =?utf-8?B?NHJxRS93VmlMUnRKVVd4TkNNcnJ3TmRkdFZXdXJDcllKWDFvSmR2bFhFNGtC?=
 =?utf-8?B?L2QraFpLS0RZc3Z4OVIvNHEvMlhCaFhVeTJQVE9Cc25SYkRyaXdQTTRwY2FU?=
 =?utf-8?B?Mm5WaVZrbkthQWRJR0pmd0pveE1LeGZUcTFXaFFiWFVFZytveVJQSEU1aEhQ?=
 =?utf-8?B?VzIwUFZSa0laV1hsWjZRSTI3b0JXVGxiL29wSnJSVTkxVkVGc1ZMc1UwREdJ?=
 =?utf-8?B?WnFLMEM0VUxkVUQ1aVZwTElMMTFrcVE0TzZuSnlDYVBQdGdMam1qWmI5TGRV?=
 =?utf-8?B?ZUJvaHNPWE93a2M2SUdUa2Y4eThyOGZvQmxSNUU3QlRZcTlzVWZSOHhEYUJC?=
 =?utf-8?B?eEYydlFBaW1XR3ovRzZ4M1hwWjdMM1dJWHlqS1VQb0k4bjB4UERyVm5BY0Fr?=
 =?utf-8?B?S3pPWnR0aDFHbytjeHhUaTByVWIwVEJHdzc1VCtyYmVObTJZRDREZ1E4YklD?=
 =?utf-8?B?R2FlSmRRTVpTY0pPUDFVU0RxN3U0U3ZlM1FrT0crM3UvMnhlY1lhZ200VXFt?=
 =?utf-8?B?MVJmRjg2MERJMmhQQ01ybE5yQlU5bFdaVWtKSGkrRFUyeFplK1k1L0l2M2o1?=
 =?utf-8?B?YTZ0dlNZS05MbW1tTXpBbVd0V3RnUjg1VFNKK3QrQ2hEeDkwM1JDaXU1ZlRu?=
 =?utf-8?B?RzM1UE1udkRFK3FhbURmYm9LQnN1N1FWaU5DRjk5OGt1ai8vallTWUxVWXVF?=
 =?utf-8?Q?80SkL9nT+ttNG7V/cbPKjDAea?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be30d94a-8ca5-4808-459e-08dadb14dfa5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2022 01:13:12.5887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nv+E9O4Z6yiIXxF9qZjeAUGhEkh5+/62IQO+5z5Q1Uk95ERT3mfJl+tWmokgjx8jzZHZ1M0NZ0EI/csqiu7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-12-10 um 09:12 schrieb Christian König:
> Am 10.12.22 um 07:15 schrieb Felix Kuehling:
>> On 2022-11-25 05:21, Christian König wrote:
>>> We already fallback to a dummy BO with no backing store when we
>>> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>>>
>>> Drop all those workarounds and generalize this for GTT as well. This
>>> fixes ENOMEM issues with runaway applications which try to 
>>> allocate/free
>>> GTT in a loop and are otherwise only limited by the CPU speed.
>>>
>>> The CS will wait for the cleanup of freed up BOs to satisfy the
>>> various domain specific limits and so effectively throttle those
>>> buggy applications down to a sane allocation behavior again.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>
>> This patch causes some regressions in KFDTest. KFDMemoryTest.MMBench 
>> sees a huge VRAM allocation slow-down. And 
>> KFDMemoryTest.LargestVramBufferTest can only allocate half the 
>> available memory.
>
> Mhm, I wasn't expecting that we use this for the KFD as well.

Yeah, we use amdgpu_gem_object_create. I guess we could duplicate its 
functionality or add a "no_overcommit" or "greedy" parameter for our needs.


>
>>
>> This seems to be caused by initially validating VRAM BOs in the CPU 
>> domain, which allocates a ttm_tt. A subsequent validation in the VRAM 
>> domain involves a copy from GTT to VRAM.
>
> The idea was to initially create the BOs without any backing store.

I thought about it a bit more. I believe the BO creation without backing 
store is working as expected. But amdgpu_bo_move can't move the 
uninitialized BO directly from system to VRAM. It returns -EMULTIHOP. So 
the BO gets moved to GTT first (allocating system memory) before it can 
be migrated to VRAM. That adds a bunch of overhead with unnecessary 
system memory allocation and forces all VRAM to be zero-initialized on 
the CPU and copied through PCIe. I think your idea would work with 
almost no overhead if amdgpu_bo_move could directly move a BO without 
backing store to VRAM with ttm_bo_move_null.

Regards,
   Felix


>
>>
>> After that, freeing of BOs can get delayed by the ghost object of a 
>> previous migration, which delays calling release notifiers and causes 
>> problems for KFDs available memory accounting.
>>
>> I experimented with a workaround that validates BOs immediately after 
>> allocation, but that only moves around the delays and doesn't solve 
>> the problem. During those experiments I may also have stumbled over a 
>> bug in ttm_buffer_object_transfer: It calls ttm_bo_set_bulk_move 
>> before initializing and locking fbo->base.base._resv. This results in 
>> a flood of warnings because ttm_bo_set_bulk_move expects the 
>> reservation to be locked.
>>
>> Right now I'd like to remove the bp.domain = initial_domain | 
>> AMDGPU_GEM_DOMAIN_CPU change in amdgpu_gem_object_create to fix this.
>
> Yeah, let's revert and investigate this first.
>
> Thanks,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>>>   2 files changed, 4 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index a0780a4e3e61..62e98f1ad770 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct 
>>> amdgpu_device *adev, unsigned long size,
>>>       bp.resv = resv;
>>>       bp.preferred_domain = initial_domain;
>>>       bp.flags = flags;
>>> -    bp.domain = initial_domain;
>>> +    bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>>>       bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>>>         r = amdgpu_bo_create_user(adev, &bp, &ubo);
>>> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       }
>>>         initial_domain = (u32)(0xffffffff & args->in.domains);
>>> -retry:
>>>       r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>>> -                     initial_domain,
>>> -                     flags, ttm_bo_type_device, resv, &gobj);
>>> +                     initial_domain, flags, ttm_bo_type_device,
>>> +                     resv, &gobj);
>>>       if (r && r != -ERESTARTSYS) {
>>> -        if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>>> -            flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>> -            goto retry;
>>> -        }
>>> -
>>> -        if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>>> -            initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>>> -            goto retry;
>>> -        }
>>>           DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, 
>>> %d)\n",
>>>                   size, initial_domain, args->in.alignment, r);
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 974e85d8b6cc..919bbea2e3ac 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>           bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>>>         bo->tbo.bdev = &adev->mman.bdev;
>>> -    if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
>>> -              AMDGPU_GEM_DOMAIN_GDS))
>>> -        amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
>>> -    else
>>> -        amdgpu_bo_placement_from_domain(bo, bp->domain);
>>> +    amdgpu_bo_placement_from_domain(bo, bp->domain);
>>>       if (bp->type == ttm_bo_type_kernel)
>>>           bo->tbo.priority = 1;
>
