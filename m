Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D443FBA86
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D5289C6B;
	Mon, 30 Aug 2021 17:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1BC89C6B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 17:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfzx/H3pRwFiRVKaFZ6s5bTSXtsV2YYMaPNjyZDn2z0xARaruwQhE33Igqd+qhRm+W/42vBFsis180MNYe8/C5ZHELy+mMyi2Qu4KwhmVACG6Y5M/XFORje730yB78W5fwnjpGh5gIcGafAx+EoEEnnsqTn2cyEYVxztVFWN4xWSEKybPFabjrHzoDcYeJufAK9DUnG+ETK3Hbd4e9sZ8fkGdk7ku03LJjoT0FrSNtr1pgAbVjLUXdkVKj5UljDrRR9FRbtRv0SYd0pTgPYWnbLvdneY1JOxZdTBuJ6FLMmIRum2n4IV+1vdvgNlkA0/dquZNIGtElzDuOk2FIxjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXozR3PIjO024ASkLH1hoVAnzTNu6kwtPvuFJ/EwVng=;
 b=bUwcwdsSSov6JUBjSbh2rf56BPxY+K9acTYXxcwY7aVyeoT4kRhxbyYEUZ7xTbGpHTQ3l7nTgZNmVD80sglFCrcblzT7pz4mIXKNwNLyJz+vIYv7omTotB5Ag9aKF+yEbI5lErniIJSacl16DoB/d7gnk5YwUc+45tpR4Eabu4nCfcw0Q7WvdNRXbW+zAzaTb/Y1bYooX3uoIkYhM2ZOzE83hscbmGsTHEtLhn8wkkN0cy93eFpKhcY35AqL43pL6elrh8wkRlONs916bFEuRr4LcNa1dn9dnMorTKAVJvc7GhTMJ1la0s9Wm+OulAyahJMB4Zkscvkq54Dn63zl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXozR3PIjO024ASkLH1hoVAnzTNu6kwtPvuFJ/EwVng=;
 b=kaV5wAYzLEeIDShmIuP9jASWTXywtVCy8717a3QYhoSGmtu6Ex84PU29+PcQ+Hso39Y+V6V1q1XjuRVT0LS5vJU5BI6ZRODz/lJk7p5naJubiv5HHA2NlK3iWga7YeIVjoNARdJtdkRJJ/7irK3RGcXBSdShjbm78szO9IisE+8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 17:00:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 17:00:33 +0000
Subject: Re: [PATCH 05/12] drm/ttm: move the LRU into resource handling
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org
References: <20210830085707.209508-1-christian.koenig@amd.com>
 <20210830085707.209508-5-christian.koenig@amd.com>
 <5a3d0707-bd54-cf26-32d7-489e1ca83aa2@amd.com>
 <c489c547-0164-15b5-e129-f4d08bd4756d@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <2fce2eb0-e8b6-a830-d3a8-cc373528aaee@amd.com>
Date: Mon, 30 Aug 2021 13:00:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c489c547-0164-15b5-e129-f4d08bd4756d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:fe36:59a5:493:2924]
 (2607:fea8:3edf:49b0:fe36:59a5:493:2924) by
 YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Mon, 30 Aug 2021 17:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48835ab1-04cf-43f4-4e49-08d96bd7ae2e
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44474B8D301C212F22BB6264EACB9@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Re+2FGLS51Sl7tNvMWnVTE9dp4aDRXI/0Z3SUInQXerGxhCsN6PMPbybnlhvwhwTKZO8OkQE8rBPG0Yn208+owsF0p79igMrdTBcIPNCO4ZxHHRBa/Yuh25ZxeGe0LZGwm+xj1RsQu5gHYZxSjvSEJTURY/5/z/0ejb+WjmY8NB8ezkeWbWm+MTSzgqG3NNke5OkEqdzb3RHh2XKxraBc1GO/0R9krNP5bpfZGPSUHrFlqLkVH8czySfaPUrlhBswjEBpjDY1AzrwXRJzwq4NFjs1uDcgSROVPE+kWv4PBD8XvHH+V/Ev/GpK3bvR1GXYMs1IvtqLqGlUKLYXOySei0KSti5j/g2HjyqEJBCXpNgbDxVxnDtrPj0EfS1k0ezWDPjCju1sXX4yASkNwabGZ1JOSOJ7Zlz1zC0PY1X4S3B0jkNboEmP7IZyawNHGMBfJlhIpvV/CV8MmyvdqB29A5IwjfXcaiD45lW9qsUTgN2+nDo9yeXQoEhPJ7F4mrCzTvdUGQ/hFEJT2Go5HjhhETrlYa34b4gR7xUH5ZTeqWOeAlmZMUDeoiDBReqfG3LySz7jizonfN8y+m/at+0s+W9F7+FukfUI+cH92EK60/xitfl8wAC/mdgshGE7ZtOtbLRRWHLd6rLcBbMS679ClEfxv30ErvS8+q4Gj8IgDv7Td2164AwkvrCTia3Os87YdWFRb7lO3vinpG8FBWJmILk2BYNbHebPQVYX1QG+3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(30864003)(53546011)(66946007)(66476007)(186003)(6486002)(2616005)(31696002)(316002)(86362001)(8676002)(44832011)(8936002)(66556008)(36756003)(38100700002)(31686004)(66574015)(83380400001)(478600001)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBSZi9FcndqaGpHREVhR1BqQlljZVQrQmlUdW5YQXNqY2hlUzFFdWJNZVZE?=
 =?utf-8?B?TDlmZWpYamlQM29IQXlJOXBrK1NxMWVrMStjVXdkNFFMcGpIZWZ0ZlpCVHBH?=
 =?utf-8?B?ZGVURnRGYU5CQk1FcU1EcDQyOG9wZDhFUTFBSmQ1M2k5aGdRRnh1TWowS3ZT?=
 =?utf-8?B?WkhXcUd6OVRuQ2FlUE9oOGdmbmZmM054eUw3UGdaUGpCVE1HWkFBWU8yVWgy?=
 =?utf-8?B?RENIZ3FXcVhWQTF2czhiajRkcEdJVzFEQ21iZGpuTWh5b0VRZ1BwNmRqSjlO?=
 =?utf-8?B?SS9udmhGMitpMVdiUDZIbVlhYzIzc25GZE5LVnN0S0Y2UUV5SWVwSkMzOUxJ?=
 =?utf-8?B?RDZ4amxPbUhQNXRUZXBPY0tvdC90ZklJQ05DVzVwL1VQZkd6VWdVMWVhSDda?=
 =?utf-8?B?dHYvMTZZblZiTURPTDJua3RXUWtNMHpidlJhMDRjekdHRjVFWWwxdkF0S1Ix?=
 =?utf-8?B?Qi8ybTRiVzNFR2Z0anBSbHNrU1NGZXZmaWlHS2NjNVlUNi9pOEJJdkRsV2c0?=
 =?utf-8?B?RXRWVUdMQlQ0dEh1NHpyeUZLUXVsNm92NnRRZ0JXVTJJSmpGR1lkQjJGekpV?=
 =?utf-8?B?QWdOaXZNZTl4a3BpSSsxR3lCd0M3N1phdnFvZUdLNVlibVJtdlhkTDIwRFlF?=
 =?utf-8?B?R3B6MGhKOTlHbUMyVWk0bzhVNzgwdmNsaExlT0VGNGlQejd3amJHTWVINEQ3?=
 =?utf-8?B?aFpHWTcyRnkrUVAycW14UEJVNzFxR0VlamNZVmxHTUc2RHc2elIyMWJVNDR2?=
 =?utf-8?B?MnRrK1hRVWlxOEoydDlnNlh6ZFRRZHJCRWcrdkk5UjczaUZWY3BIbGNIejBD?=
 =?utf-8?B?ZHVvK2dWc1h2ZkZsclc0Um90dW4rZHJlNG9jWXRvR3ZCOS94N2dGMklsTTQv?=
 =?utf-8?B?VVI2R1poTnFLeUNEMUVVZEs5bFcxdnFQODVXd3M1RnVQMFg5ZFdGd2dQT3Bh?=
 =?utf-8?B?YVo5N2N6Snc1allkcFI1eFFZdHNVRFZPblFLOFllZys1bEl0TjE3VkQ2RGdn?=
 =?utf-8?B?VmNQSjJKTENUMXVZck5IbGNSQ2hSeStEM2Rkc3RPdHVLblNLc2NZQ3JUdVcw?=
 =?utf-8?B?Q090d0FHbDJFTzhOaUlMMGJGU2E1TmpRY3NvcGtDSEhsVlhaa2RUTkhSdXVn?=
 =?utf-8?B?LzJtbHpnckp0bGxQSnpYZWVDZk1NWWx3R2U3dXdJa1ZOWXlURFRJYXk2OHdO?=
 =?utf-8?B?d3g4SjZWRFdwMW8yeWg4Y0M3ZTdkUGszNWlYM2xxbEJNeXQyNmJ1Q0JRTnlK?=
 =?utf-8?B?Tmc4UG1kNkhBMEpYRi9OZWRsWnNocHJnUU51YVBLS1k2QVA4a3IvMUxOWWtS?=
 =?utf-8?B?Y0d6VGFVbThDK0kzL0ZjWDJ0TklFQml0aUdqTXNtbjZVRlhGUTNBS0lPd0t0?=
 =?utf-8?B?bEpkemtVR1h2aW1udXNGODJLRHhBMkdSc2J4RzZIclBhRnU1Y29MMTFCZkRW?=
 =?utf-8?B?V3FTVHl4MUxubkJrUDhjUHJxQllIdXhkTVpMU01WaXovRXluZTlBbi9FNmJz?=
 =?utf-8?B?c1FmVVJmSFpnSzJSMGlibDY2aVBoZ3gwc3NaYWNlczVkVHQwKyswcDJPU1Rs?=
 =?utf-8?B?UWIyVklOdS92bVNCRjV2R09WS2ZnTjR6TTNESHZ2cjNtaTlXNmwrMFlpQUNR?=
 =?utf-8?B?d0tOSmltZGcwL2l4VkdkWWJBT3ZOZFppaldocm5EUXlqWEN4SklucUhldFJ4?=
 =?utf-8?B?SUpjSnJSQ2U4cHgzRzNrVHdSQnIrRWl4dFdvS2dCVGh3cG83S1JnWGY2UjBz?=
 =?utf-8?B?d3BCNnJnL1dKb3hBM2k5QllGY0ZiRDBxdkRlTGU1NWhsWTgwdTAvL2t6blJh?=
 =?utf-8?B?MVFJUjh1bTlXNmhDZmV0anlQY2doNTFld0NFdUhYaS82U3lycFM3RGdtQXNG?=
 =?utf-8?Q?dDNhtvg/iAu2M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48835ab1-04cf-43f4-4e49-08d96bd7ae2e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 17:00:33.5675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lfqgCopdcN9DrhK5PegX5viLqoNupCLarcDhejIkNXMowAX3HlkEfdx5E9SQfOhugd7MOgStIgTqvqM+XiBXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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


On 2021-08-30 12:55 p.m., Christian König wrote:
> Am 30.08.21 um 18:53 schrieb Andrey Grodzovsky:
>>
>> On 2021-08-30 4:57 a.m., Christian König wrote:
>>> This way we finally fix the problem that new resource are
>>> not immediately evict-able after allocation.
>>>
>>> That has caused numerous problems including OOM on GDS handling
>>> and not being able to use TTM as general resource manager.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |   8 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |   2 +-
>>>   drivers/gpu/drm/ttm/ttm_bo.c            | 105 ++------------------
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c       |   1 -
>>>   drivers/gpu/drm/ttm/ttm_device.c        |   8 +-
>>>   drivers/gpu/drm/ttm/ttm_resource.c      | 127 
>>> ++++++++++++++++++++++++
>>>   include/drm/ttm/ttm_bo_api.h            |  16 ---
>>>   include/drm/ttm/ttm_bo_driver.h         |  29 +-----
>>>   include/drm/ttm/ttm_resource.h          |  35 +++++++
>>>   9 files changed, 181 insertions(+), 150 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 6362e861a3f5..70d2cbb1dbb4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -683,12 +683,12 @@ void amdgpu_vm_move_to_lru_tail(struct 
>>> amdgpu_device *adev,
>>>         if (vm->bulk_moveable) {
>>>           spin_lock(&adev->mman.bdev.lru_lock);
>>> -        ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
>>> +        ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>>>           spin_unlock(&adev->mman.bdev.lru_lock);
>>>           return;
>>>       }
>>>   -    memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
>>> +    ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>>>         spin_lock(&adev->mman.bdev.lru_lock);
>>>       list_for_each_entry(bo_base, &vm->idle, vm_status) {
>>> @@ -698,11 +698,9 @@ void amdgpu_vm_move_to_lru_tail(struct 
>>> amdgpu_device *adev,
>>>           if (!bo->parent)
>>>               continue;
>>>   -        ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
>>> -                    &vm->lru_bulk_move);
>>> +        ttm_bo_move_to_lru_tail(&bo->tbo, &vm->lru_bulk_move);
>>>           if (shadow)
>>>               ttm_bo_move_to_lru_tail(&shadow->tbo,
>>> -                        shadow->tbo.resource,
>>>                           &vm->lru_bulk_move);
>>>       }
>>>       spin_unlock(&adev->mman.bdev.lru_lock);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index e646aac9d7a4..41f0de841d72 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -471,7 +471,7 @@ static void i915_ttm_adjust_lru(struct 
>>> drm_i915_gem_object *obj)
>>>               bo->priority = I915_TTM_PRIO_NO_PAGES;
>>>       }
>>>   -    ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>> +    ttm_bo_move_to_lru_tail(bo, NULL);
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>   }
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 49f4bc97c35a..d5c6e096fd31 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -69,98 +69,16 @@ static void ttm_bo_mem_space_debug(struct 
>>> ttm_buffer_object *bo,
>>>       }
>>>   }
>>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>> -{
>>> -    struct ttm_device *bdev = bo->bdev;
>>> -
>>> -    list_del_init(&bo->lru);
>>> -
>>> -    if (bdev->funcs->del_from_lru_notify)
>>> -        bdev->funcs->del_from_lru_notify(bo);
>>> -}
>>> -
>>> -static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos 
>>> *pos,
>>> -                     struct ttm_buffer_object *bo)
>>> -{
>>> -    if (!pos->first)
>>> -        pos->first = bo;
>>> -    pos->last = bo;
>>> -}
>>> -
>>>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>>> -                 struct ttm_resource *mem,
>>>                    struct ttm_lru_bulk_move *bulk)
>>>   {
>>> -    struct ttm_device *bdev = bo->bdev;
>>> -    struct ttm_resource_manager *man;
>>> -
>>> -    if (!bo->deleted)
>>> -        dma_resv_assert_held(bo->base.resv);
>>> -
>>> -    if (bo->pin_count) {
>>> -        ttm_bo_del_from_lru(bo);
>>> -        return;
>>> -    }
>>> -
>>> -    if (!mem)
>>> -        return;
>>> -
>>> -    man = ttm_manager_type(bdev, mem->mem_type);
>>> -    list_move_tail(&bo->lru, &man->lru[bo->priority]);
>>> -
>>> -    if (bdev->funcs->del_from_lru_notify)
>>> -        bdev->funcs->del_from_lru_notify(bo);
>>> -
>>> -    if (bulk && !bo->pin_count) {
>>> -        switch (bo->resource->mem_type) {
>>> -        case TTM_PL_TT:
>>> - ttm_bo_bulk_move_set_pos(&bulk->tt[bo->priority], bo);
>>> -            break;
>>> +    dma_resv_assert_held(bo->base.resv);
>>>   -        case TTM_PL_VRAM:
>>> - ttm_bo_bulk_move_set_pos(&bulk->vram[bo->priority], bo);
>>> -            break;
>>> -        }
>>> -    }
>>> +    if (bo->resource)
>>> +        ttm_resource_move_to_lru_tail(bo->resource, bulk);
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_move_to_lru_tail);
>>>   -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
>>> -{
>>> -    unsigned i;
>>> -
>>> -    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>> -        struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
>>> -        struct ttm_resource_manager *man;
>>> -
>>> -        if (!pos->first)
>>> -            continue;
>>> -
>>> -        dma_resv_assert_held(pos->first->base.resv);
>>> -        dma_resv_assert_held(pos->last->base.resv);
>>> -
>>> -        man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
>>> -        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>> -                    &pos->last->lru);
>>> -    }
>>> -
>>> -    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>> -        struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
>>> -        struct ttm_resource_manager *man;
>>> -
>>> -        if (!pos->first)
>>> -            continue;
>>> -
>>> -        dma_resv_assert_held(pos->first->base.resv);
>>> -        dma_resv_assert_held(pos->last->base.resv);
>>> -
>>> -        man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
>>> -        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>> -                    &pos->last->lru);
>>> -    }
>>> -}
>>> -EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>>> -
>>>   static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>>>                     struct ttm_resource *mem, bool evict,
>>>                     struct ttm_operation_ctx *ctx,
>>> @@ -342,7 +260,6 @@ static int ttm_bo_cleanup_refs(struct 
>>> ttm_buffer_object *bo,
>>>           return ret;
>>>       }
>>>   -    ttm_bo_del_from_lru(bo);
>>
>>
>> Here and in other places this was removed, I assume ttm_resource_fini
>> should replace it but I don't see where exactly this takes place.
>
> Take a look at function ttm_resource_fini().
>
> Christian.


What I mean is that I don't see where ttm_resource_fini will be called to
compensate for removal of  ttm_bo_del_from_lru here.

Andrey


>
>>
>> Andrey
>>
>>
>>> list_del_init(&bo->ddestroy);
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>       ttm_bo_cleanup_memtype_use(bo);
>>> @@ -443,7 +360,7 @@ static void ttm_bo_release(struct kref *kref)
>>>            */
>>>           if (bo->pin_count) {
>>>               bo->pin_count = 0;
>>> -            ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>> +            ttm_resource_move_to_lru_tail(bo->resource, NULL);
>>>           }
>>>             kref_init(&bo->kref);
>>> @@ -456,7 +373,6 @@ static void ttm_bo_release(struct kref *kref)
>>>       }
>>>         spin_lock(&bo->bdev->lru_lock);
>>> -    ttm_bo_del_from_lru(bo);
>>>       list_del(&bo->ddestroy);
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>   @@ -670,15 +586,17 @@ int ttm_mem_evict_first(struct ttm_device 
>>> *bdev,
>>>               struct ww_acquire_ctx *ticket)
>>>   {
>>>       struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
>>> +    struct ttm_resource *res;
>>>       bool locked = false;
>>>       unsigned i;
>>>       int ret;
>>>         spin_lock(&bdev->lru_lock);
>>>       for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>> -        list_for_each_entry(bo, &man->lru[i], lru) {
>>> +        list_for_each_entry(res, &man->lru[i], lru) {
>>>               bool busy;
>>>   +            bo = res->bo;
>>>               if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
>>>                                   &locked, &busy)) {
>>>                   if (busy && !busy_bo && ticket !=
>>> @@ -696,7 +614,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>>>           }
>>>             /* If the inner loop terminated early, we have our 
>>> candidate */
>>> -        if (&bo->lru != &man->lru[i])
>>> +        if (&res->lru != &man->lru[i])
>>>               break;
>>>             bo = NULL;
>>> @@ -870,9 +788,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>>>       }
>>>     error:
>>> -    if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
>>> -        ttm_bo_move_to_lru_tail_unlocked(bo);
>>> -
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_mem_space);
>>> @@ -1012,7 +927,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>>       bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
>>>         kref_init(&bo->kref);
>>> -    INIT_LIST_HEAD(&bo->lru);
>>>       INIT_LIST_HEAD(&bo->ddestroy);
>>>       bo->bdev = bdev;
>>>       bo->type = type;
>>> @@ -1062,8 +976,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>>>           return ret;
>>>       }
>>>   -    ttm_bo_move_to_lru_tail_unlocked(bo);
>>> -
>>>       return ret;
>>>   }
>>>   EXPORT_SYMBOL(ttm_bo_init_reserved);
>>> @@ -1165,7 +1077,6 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>> *bo, struct ttm_operation_ctx *ctx,
>>>           return 0;
>>>       }
>>>   -    ttm_bo_del_from_lru(bo);
>>>       /* TODO: Cleanup the locking */
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index c5d02edaefc0..49b4bedf8715 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -232,7 +232,6 @@ static int ttm_buffer_object_transfer(struct 
>>> ttm_buffer_object *bo,
>>>         atomic_inc(&ttm_glob.bo_count);
>>>       INIT_LIST_HEAD(&fbo->base.ddestroy);
>>> -    INIT_LIST_HEAD(&fbo->base.lru);
>>>       fbo->base.moving = NULL;
>>>       drm_vma_node_reset(&fbo->base.base.vma_node);
>>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 519deea8e39b..9e0dfceff68c 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -134,6 +134,7 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>>> struct ttm_operation_ctx *ctx,
>>>   {
>>>       struct ttm_resource_manager *man;
>>>       struct ttm_buffer_object *bo;
>>> +    struct ttm_resource *res;
>>>       unsigned i, j;
>>>       int ret;
>>>   @@ -144,8 +145,11 @@ int ttm_device_swapout(struct ttm_device 
>>> *bdev, struct ttm_operation_ctx *ctx,
>>>               continue;
>>>             for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>> -            list_for_each_entry(bo, &man->lru[j], lru) {
>>> -                uint32_t num_pages = PFN_UP(bo->base.size);
>>> +            list_for_each_entry(res, &man->lru[j], lru) {
>>> +                uint32_t num_pages;
>>> +
>>> +                bo = res->bo;
>>> +                num_pages = PFN_UP(bo->base.size);
>>>                     ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>>                   /* ttm_bo_swapout has dropped the lru_lock */
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 426e6841fc89..355c542758b5 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -29,6 +29,115 @@
>>>   #include <drm/ttm/ttm_resource.h>
>>>   #include <drm/ttm/ttm_bo_driver.h>
>>>   +/**
>>> + * ttm_lru_bulk_move_init - initialize a bulk move structure
>>> + * @bulk: the structure to init
>>> + *
>>> + * For now just memset the structure to zero.
>>> + */
>>> +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>>> +{
>>> +    memset(bulk, 0, sizeof(*bulk));
>>> +}
>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>>> +
>>> +/**
>>> + * ttm_lru_bulk_move_tail
>>> + *
>>> + * @bulk: bulk move structure
>>> + *
>>> + * Bulk move BOs to the LRU tail, only valid to use when driver 
>>> makes sure that
>>> + * resource order never changes. Should be called with 
>>> ttm_device::lru_lock held.
>>> + */
>>> +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>>> +{
>>> +    unsigned i;
>>> +
>>> +    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>> +        struct ttm_lru_bulk_move_pos *pos = &bulk->tt[i];
>>> +        struct ttm_resource_manager *man;
>>> +
>>> +        if (!pos->first)
>>> +            continue;
>>> +
>>> + dma_resv_assert_held(pos->first->bo->base.resv);
>>> + dma_resv_assert_held(pos->last->bo->base.resv);
>>> +
>>> +        man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_TT);
>>> +        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>> +                    &pos->last->lru);
>>> +    }
>>> +
>>> +    for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>>> +        struct ttm_lru_bulk_move_pos *pos = &bulk->vram[i];
>>> +        struct ttm_resource_manager *man;
>>> +
>>> +        if (!pos->first)
>>> +            continue;
>>> +
>>> + dma_resv_assert_held(pos->first->bo->base.resv);
>>> + dma_resv_assert_held(pos->last->bo->base.resv);
>>> +
>>> +        man = ttm_manager_type(pos->first->bo->bdev, TTM_PL_VRAM);
>>> +        list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>>> +                    &pos->last->lru);
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
>>> +
>>> +/* Record a resource position in a bulk move structure */
>>> +static void ttm_lru_bulk_move_set_pos(struct ttm_lru_bulk_move_pos 
>>> *pos,
>>> +                      struct ttm_resource *res)
>>> +{
>>> +    if (!pos->first)
>>> +        pos->first = res;
>>> +    pos->last = res;
>>> +}
>>> +
>>> +/* Remove a resource from the LRU */
>>> +static void ttm_resource_del_from_lru(struct ttm_resource *res)
>>> +{
>>> +    struct ttm_device *bdev = res->bo->bdev;
>>> +
>>> +    list_del_init(&res->lru);
>>> +
>>> +    if (bdev->funcs->del_from_lru_notify)
>>> +        bdev->funcs->del_from_lru_notify(res->bo);
>>> +}
>>> +
>>> +/* Move a resource to the LRU tail and track the bulk position */
>>> +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>>> +                   struct ttm_lru_bulk_move *bulk)
>>> +{
>>> +    struct ttm_buffer_object *bo = res->bo;
>>> +    struct ttm_device *bdev = bo->bdev;
>>> +    struct ttm_resource_manager *man;
>>> +
>>> +    if (bo->pin_count) {
>>> +        ttm_resource_del_from_lru(res);
>>> +        return;
>>> +    }
>>> +
>>> +    man = ttm_manager_type(bdev, res->mem_type);
>>> +    list_move_tail(&res->lru, &man->lru[bo->priority]);
>>> +
>>> +    if (bdev->funcs->del_from_lru_notify)
>>> +        bdev->funcs->del_from_lru_notify(bo);
>>> +
>>> +    if (!bulk)
>>> +        return;
>>> +
>>> +    switch (res->mem_type) {
>>> +    case TTM_PL_TT:
>>> + ttm_lru_bulk_move_set_pos(&bulk->tt[bo->priority], res);
>>> +        break;
>>> +
>>> +    case TTM_PL_VRAM:
>>> + ttm_lru_bulk_move_set_pos(&bulk->vram[bo->priority], res);
>>> +        break;
>>> +    }
>>> +}
>>> +
>>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>>                          const struct ttm_place *place,
>>>                          struct ttm_resource *res)
>>> @@ -44,15 +153,33 @@ void ttm_resource_init(struct ttm_buffer_object 
>>> *bo,
>>>       res->bus.is_iomem = false;
>>>       res->bus.caching = ttm_cached;
>>>       res->bo = bo;
>>> +    INIT_LIST_HEAD(&res->lru);
>>>         man = ttm_manager_type(bo->bdev, place->mem_type);
>>>       atomic64_add(bo->base.size, &man->usage);
>>> +
>>> +    spin_lock(&bo->bdev->lru_lock);
>>> +    ttm_resource_move_to_lru_tail(res, NULL);
>>> +    spin_unlock(&bo->bdev->lru_lock);
>>>   }
>>>   EXPORT_SYMBOL(ttm_resource_init);
>>>   +/**
>>> + * ttm_resource_fini
>>> + *
>>> + * @res: the resource to clean up
>>> + *
>>> + * Make sure the resource is removed from the LRU before destruction.
>>> + */
>>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>>                  struct ttm_resource *res)
>>>   {
>>> +    struct ttm_device *bdev = res->bo->bdev;
>>> +
>>> +    spin_lock(&bdev->lru_lock);
>>> +    ttm_resource_del_from_lru(res);
>>> +    spin_unlock(&bdev->lru_lock);
>>> +
>>>       atomic64_sub(res->bo->base.size, &man->usage);
>>>   }
>>>   EXPORT_SYMBOL(ttm_resource_fini);
>>> diff --git a/include/drm/ttm/ttm_bo_api.h 
>>> b/include/drm/ttm/ttm_bo_api.h
>>> index f681bbdbc698..0928d8cfb45a 100644
>>> --- a/include/drm/ttm/ttm_bo_api.h
>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>> @@ -56,8 +56,6 @@ struct ttm_placement;
>>>     struct ttm_place;
>>>   -struct ttm_lru_bulk_move;
>>> -
>>>   /**
>>>    * enum ttm_bo_type
>>>    *
>>> @@ -95,7 +93,6 @@ struct ttm_tt;
>>>    * @ttm: TTM structure holding system pages.
>>>    * @evicted: Whether the object was evicted without user-space 
>>> knowing.
>>>    * @deleted: True if the object is only a zombie and already deleted.
>>> - * @lru: List head for the lru list.
>>>    * @ddestroy: List head for the delayed destroy list.
>>>    * @swap: List head for swap LRU list.
>>>    * @moving: Fence set when BO is moving
>>> @@ -144,7 +141,6 @@ struct ttm_buffer_object {
>>>        * Members protected by the bdev::lru_lock.
>>>        */
>>>   -    struct list_head lru;
>>>       struct list_head ddestroy;
>>>         /**
>>> @@ -308,7 +304,6 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>>    * ttm_bo_move_to_lru_tail
>>>    *
>>>    * @bo: The buffer object.
>>> - * @mem: Resource object.
>>>    * @bulk: optional bulk move structure to remember BO positions
>>>    *
>>>    * Move this BO to the tail of all lru lists used to lookup and 
>>> reserve an
>>> @@ -316,19 +311,8 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>>>    * held, and is used to make a BO less likely to be considered for 
>>> eviction.
>>>    */
>>>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
>>> -                 struct ttm_resource *mem,
>>>                    struct ttm_lru_bulk_move *bulk);
>>>   -/**
>>> - * ttm_bo_bulk_move_lru_tail
>>> - *
>>> - * @bulk: bulk move structure
>>> - *
>>> - * Bulk move BOs to the LRU tail, only valid to use when driver 
>>> makes sure that
>>> - * BO order never changes. Should be called with 
>>> ttm_global::lru_lock held.
>>> - */
>>> -void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
>>> -
>>>   /**
>>>    * ttm_bo_lock_delayed_workqueue
>>>    *
>>> diff --git a/include/drm/ttm/ttm_bo_driver.h 
>>> b/include/drm/ttm/ttm_bo_driver.h
>>> index 68d6069572aa..fba2f7d3d34e 100644
>>> --- a/include/drm/ttm/ttm_bo_driver.h
>>> +++ b/include/drm/ttm/ttm_bo_driver.h
>>> @@ -45,33 +45,6 @@
>>>   #include "ttm_tt.h"
>>>   #include "ttm_pool.h"
>>>   -/**
>>> - * struct ttm_lru_bulk_move_pos
>>> - *
>>> - * @first: first BO in the bulk move range
>>> - * @last: last BO in the bulk move range
>>> - *
>>> - * Positions for a lru bulk move.
>>> - */
>>> -struct ttm_lru_bulk_move_pos {
>>> -    struct ttm_buffer_object *first;
>>> -    struct ttm_buffer_object *last;
>>> -};
>>> -
>>> -/**
>>> - * struct ttm_lru_bulk_move
>>> - *
>>> - * @tt: first/last lru entry for BOs in the TT domain
>>> - * @vram: first/last lru entry for BOs in the VRAM domain
>>> - * @swap: first/last lru entry for BOs on the swap list
>>> - *
>>> - * Helper structure for bulk moves on the LRU list.
>>> - */
>>> -struct ttm_lru_bulk_move {
>>> -    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>>> -    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>> -};
>>> -
>>>   /*
>>>    * ttm_bo.c
>>>    */
>>> @@ -182,7 +155,7 @@ static inline void
>>>   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>>>   {
>>>       spin_lock(&bo->bdev->lru_lock);
>>> -    ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
>>> +    ttm_bo_move_to_lru_tail(bo, NULL);
>>>       spin_unlock(&bo->bdev->lru_lock);
>>>   }
>>>   diff --git a/include/drm/ttm/ttm_resource.h 
>>> b/include/drm/ttm/ttm_resource.h
>>> index 526fe359c603..5f9797f9d64a 100644
>>> --- a/include/drm/ttm/ttm_resource.h
>>> +++ b/include/drm/ttm/ttm_resource.h
>>> @@ -26,10 +26,12 @@
>>>   #define _TTM_RESOURCE_H_
>>>     #include <linux/types.h>
>>> +#include <linux/list.h>
>>>   #include <linux/mutex.h>
>>>   #include <linux/atomic.h>
>>>   #include <linux/dma-buf-map.h>
>>>   #include <linux/dma-fence.h>
>>> +
>>>   #include <drm/drm_print.h>
>>>   #include <drm/ttm/ttm_caching.h>
>>>   #include <drm/ttm/ttm_kmap_iter.h>
>>> @@ -177,6 +179,33 @@ struct ttm_resource {
>>>       uint32_t placement;
>>>       struct ttm_bus_placement bus;
>>>       struct ttm_buffer_object *bo;
>>> +    struct list_head lru;
>>> +};
>>> +
>>> +/**
>>> + * struct ttm_lru_bulk_move_pos
>>> + *
>>> + * @first: first res in the bulk move range
>>> + * @last: last res in the bulk move range
>>> + *
>>> + * Positions for a lru bulk move.
>>> + */
>>> +struct ttm_lru_bulk_move_pos {
>>> +    struct ttm_resource *first;
>>> +    struct ttm_resource *last;
>>> +};
>>> +
>>> +/**
>>> + * struct ttm_lru_bulk_move
>>> + *
>>> + * @tt: first/last lru entry for resources in the TT domain
>>> + * @vram: first/last lru entry for resources in the VRAM domain
>>> + *
>>> + * Helper structure for bulk moves on the LRU list.
>>> + */
>>> +struct ttm_lru_bulk_move {
>>> +    struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>>> +    struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
>>>   };
>>>     /**
>>> @@ -278,6 +307,12 @@ ttm_resource_manager_usage(struct 
>>> ttm_resource_manager *man)
>>>       return atomic64_read(&man->usage);
>>>   }
>>>   +void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>>> +void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
>>> +
>>> +void ttm_resource_move_to_lru_tail(struct ttm_resource *res,
>>> +                   struct ttm_lru_bulk_move *bulk);
>>> +
>>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>>                          const struct ttm_place *place,
>>>                          struct ttm_resource *res);
>
