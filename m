Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5DC40C1A4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 10:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B955B6E8D9;
	Wed, 15 Sep 2021 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067536E8D9;
 Wed, 15 Sep 2021 08:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBBd+21ZDVvJx0JT0sXUKPeDKn1PRW4oLriuKCz1ECvyv1wraoM8LlZso7UkJIOsdfbkcgOCKiHwC7L5j7MVpJrtFuvCepXFFEc8IXzzGqoAoaQHWWWKft/ZBLMaaGjUnNs6VJB24sG3XZZxLrPbgeKf/RXaTUoV4OKqsCxFcfSpkNG4RraA2RNYd3aMAIdR4gL3DetaZJC05Tfv+9uD6Nh+PP30IDxKhcmOznfcfNOCGlJBtP7ZchXpKALPRdcu68q3w3jR5L42w9z/DcW4RL0QfGklrMgwhPi0NOI+PQLiaT8mhLHgnZpu6+3Z5V/u4I3VQEf9ArIFteQRPP061g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1I06VdZQQFz4fangNBBT52xXob7/SrcYA4uX1qR3JfA=;
 b=YUAzPF9iBC9q9Zt3OT6Cq/OMIN8ryaMfzB7wGxMa8iHsYtxdjwWsDA/LrJWvnbywuNdk7FlHZHvkc8ud5Brsr1ZwnE85vv38riyYgrDM5eUtESRIlyqM94lotp9ernMqcUxHqBlDqHWf/2D2ILWgBaLWSCkuV0oIn1qPjXiQYp0TrP4MEZDfUCk3RSuzV3Wut4pNxUM65M64tHO8xyI2nc/iT8SZ9u/++7qeHYq+9WutlpWFUqAC2FV8LyOytHapyLrEVO1Axo5lrKcimAW97icCdv3mgeIoWUtpYOLhT4WPlOFjHIfG+WFSoBfEyc4JXARzseU1wjB0XQA5DBwuyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I06VdZQQFz4fangNBBT52xXob7/SrcYA4uX1qR3JfA=;
 b=OO6PwPfi+ABKWJ9LIl3TRyrkKzhAsC+AvAwoP6DtVGybfqlfZOgTV/vYZPnXX8f6ChmdgE9Rz0y17asOQw9FMv+ROVvFCQ2NQjvUBR7Bp2+5xz5ywwjENcLaBk6m4iup4J5E94IFKSmUYe/G3nGmoso1eUmqZkodq/5iPO83Nzw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 08:23:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:23:44 +0000
Subject: Re: [PATCH v2 2/7] drm/ttm: add TTM_PAGE_FLAG_SHMEM
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210914085033.2833993-1-matthew.auld@intel.com>
 <20210914085033.2833993-2-matthew.auld@intel.com>
 <106ed881-5cfb-6a73-f50a-32ef6edb5905@amd.com>
 <CAM0jSHPNP1X-eyVREFJxd4B0YtPcHNZFyvtVWXPL0maTA+pqsw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7a17e4a-c116-e2ac-3d67-a1728335ff37@amd.com>
Date: Wed, 15 Sep 2021 10:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAM0jSHPNP1X-eyVREFJxd4B0YtPcHNZFyvtVWXPL0maTA+pqsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::42) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:d03d:8939:3840:1f95]
 (2a02:908:1252:fb60:d03d:8939:3840:1f95) by
 AM0PR01CA0137.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend
 Transport; Wed, 15 Sep 2021 08:23:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4d11625-cbc0-46fa-c23f-08d978222223
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4094432FF348D6D353122D5A83DB9@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFCxu0Zwt0LsyQTzb6kjLy8UWbGgQHgODMXBycVlQ9DPR0K7j3wPcOFUhj2peoh20XrkC2wqgjoTptATUDZrzHMQ/31pjBf1o94LlXVjJqo87nSyw8DyBvLoN9PRDKvyet1zZK/rNqJpsB7rGWertlS1aioDW6bukRqW2iwPizYEOq8+ELKNUna3eK9xsNhdx3xJ106MzAfkTugpPPqTMRgnSZt9CXZpoEIcDihs2nrCrILwJ51KcjUR2iT90s0jOWPLcfyozaUSKRnul3LGmNBYuJDyy3zVFAnec+pRxg8nSutujjGUvuvdKi86+WL8ysnqS1OQjULjiwpg1gCNkDPwtqWwZHZsCyCAxjuijZLH/JgUVroXfrCEt2f2M98yVST2pV1+9KsINMPVqtmtGJEMaH7bZuS9VhF+rMh/uc6is/I1Hkt8CJseT1SiV5y4EGAAJbWFD5iZXx9PCESS4YqHGdNuteCFsjkzu7+yvxDdCuT11ppCI0Qmd89y7eoFQfzmYoTk0CITGHaHdzZ/C2o6fyQehagJ3hVikEDbPwxisFuGZgRbQBaV7vFl5iBTG+nHq8boIfQlQ4J8rrHP5XLgxB+H4NC34p3h2vfVklYFBNQkfvJr4CH8w4zgOJZU0qR/x/tD3ZhAFzgHSOT5B7W8q3LJIoIlswqyzzLIqrqeIOi+/EbDA4yWPTqhoXtu3NXNZx7ONdp9dnRI72m4/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(478600001)(6486002)(66946007)(83380400001)(8936002)(66556008)(8676002)(4326008)(2616005)(54906003)(316002)(86362001)(38100700002)(66476007)(186003)(6916009)(31696002)(36756003)(5660300002)(31686004)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3VIUWFiRzZHVjA0ZlVKRUgrNkZNRVdNcEFnQUZtV2k5c1JzUEs3SUlpTlFw?=
 =?utf-8?B?cmtJZzRZYTd5YmhrZ2t3Nm5oTzBZQjNnRzJPNTVpZWxWVkcrVU0zWUhZeHdh?=
 =?utf-8?B?eW1pbHFYZlBoZEh3SkJrK2xLdkhFN09iVVMzYmZjUERvYWYvSmUzNFNERHl1?=
 =?utf-8?B?TDlQdnFOT2JPSEtkU3p4UGJYYjZFUUxqYjA5WEthUHN2cmhLenI5MTF0bHBu?=
 =?utf-8?B?Qnk5RnNNd0RkK2E3VG9BejJuMEk2aitOSklHTDVBVTl5TDdGMndDUUhhdGFR?=
 =?utf-8?B?ZzdIRE0zZkk1SVJXNjhPOXhwdE5jcWx2UWx3d3M3bWxHNGZ5THpRbnc1bkdI?=
 =?utf-8?B?VDNpUXZJYkM1VkI1dzhKTlZva1A2UnE2MmllV0psN3BsMmtqRUFFbmdMOC8r?=
 =?utf-8?B?ZjhlaENsNkpnMVFGYUxXcVUrSjRtbllaRDlnbzhyclN6cWNyMFdaWEtjOFBW?=
 =?utf-8?B?dXZoVjFhZDNsV3dnZngwWUdBcE44aFR6V3cwUVd6dHFNVi9CaUJXMUxka3po?=
 =?utf-8?B?bktlMmIwejk2eHJoQWdiY0w2K3EzVVZtK1lzZCtSWjRFSFNBNVNLTHBUZXdO?=
 =?utf-8?B?dTRseXQwMEF2MXJ4eHo0ZnF3NCs0Z296WlhvOUR5am1WTGd3UFVVTXlXVWFi?=
 =?utf-8?B?T1VSaWlNZjF3US9FY2VTT0tuV0o2UGhkSU9JQXVHRkpkdUc3Unl3KzBkSkdI?=
 =?utf-8?B?Q0M1SFFqeTFoSiswb1JNVUJTMVM0S1RvVytjTmRUVjVsaXFGQkExcDZsZjB1?=
 =?utf-8?B?UWNteDhmRUVQZ1RyRkhDby84Kys3eW5TVXp5MkNiZFVYWHd4dGZvaXVGeHpq?=
 =?utf-8?B?MlJxS0F1dG5jT0M0NFZxcnA2MHZ2TmNqbFFmQXJ0WFBCdkl3WWVtbmpMM3h2?=
 =?utf-8?B?VzZXL0xyS1Z4cW91b21KK2VvY0hYZE5Md3BvZnhZdVU0bTUyc3ZjY20zUnpl?=
 =?utf-8?B?UGVZNjBWNit2cjMzT1YwM2xUVG9zNUhab3A3NEVJZENIRTB4U3c1UzZSNkRK?=
 =?utf-8?B?czNEcFRZL0YvV2Z6b0pIOGNNbjlMQ1BBUlVXUDFUWkQxTkFBcHdQTWQyaVFs?=
 =?utf-8?B?MUFNNDBYQzFJc1ptc25EUjhGa3dDY0tVa2JFZ2JCMEtCaFlPOWNRMk5RTmh6?=
 =?utf-8?B?dTFrUkNTVlJrU0VFaENScmp4SnpveHZkQzhwbnVDZ25tRmxIbEtMM0plNHZD?=
 =?utf-8?B?T1NHWVB6RzYvRHBuWnNXelN4UDZkSFh3MnV5NEloRW5DVzBmckVtRURDcHhS?=
 =?utf-8?B?dGN2b2hvRERYRFpwNHJ5RHFNb2JvcDVPUDdIQ1lzWFEvZGRNRW5hdGl0NWNN?=
 =?utf-8?B?L1Z2OEswa0Y0c0ZGb1FKU010REl1a29YQVRUVm9POVlpbUIrTldRZjJkVGhG?=
 =?utf-8?B?WklkTEo2dmxPMnBlcXRsU2Nlb1AzdVUwclZFckxWNVpNeWs1RS96Q21vYnBw?=
 =?utf-8?B?NXZyU1JMQjM4UlB6bi9hNWdDcUhsQXJLdGpWRDl2NDl1K2JpNUhhaG8wb0R2?=
 =?utf-8?B?MTl2SHl3WFh2L280SVIydXVNL2xKT2hsaWM4allhSzVMdm9FZ0wwTjRoUnVv?=
 =?utf-8?B?SXBudlY5UW5PN0RhSHdTYVhRL2wxMWJCRjZqRG9LM1JhYVlJRjJZRlNnV212?=
 =?utf-8?B?Y1FYNGhQUVZwakdFT3N6UVRIbEtUM0wvbzBvUEpmc2x0SzJ4cmxFaWIzemRQ?=
 =?utf-8?B?WS9RaTlaMmdkbXloejBiNUtVbXBNZEtMaHNqQU1wOVpPODhjTlZWbE1NbFpC?=
 =?utf-8?B?Q3JOaTVGUUtNVGY0KzZqVVRlZEV3NVd4REFMK3dtNUJ3T0dDRm9qclF2YzJq?=
 =?utf-8?B?by9RWHc3aFVpcDBoZHNtc1F4M0ZsV24vaUkvbklEcnVIeDlxV0JoQmRHVld3?=
 =?utf-8?Q?eZaxLTnmnjxaA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d11625-cbc0-46fa-c23f-08d978222223
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:23:44.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtoxcoCzpA+H9KGw45/QDtGgCcJe+al3A8R6/ZUbBceOeOjaitM4lPglEgXSJgCC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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

Am 14.09.21 um 19:31 schrieb Matthew Auld:
> On Tue, 14 Sept 2021 at 10:03, Christian König <christian.koenig@amd.com> wrote:
>> Am 14.09.21 um 10:50 schrieb Matthew Auld:
>>> Add new flag to indicate special shmem based tt, which can directly
>>> handle swapping itself, and should be visible to some shrinker.
>>>
>>> As part of this we should skip the ttm_pages_allocated accounting, since
>>> such tt objects should already be reachable, and potentially reclaimable
>>> by some shrinker, if under memory pressure, and so shouldn't directly
>>> count towards the swap "watermark" level.
>>>
>>> We also need to stop touching the page->mapping and page->index for such
>>> objects, like in ttm_tt_add_mapping, since shmem already uses these.
>>> Some drivers seems to depend on the tt mapping/index behaviour for their
>>> own purposes, so directly using shmem tt likely won't be usable there
>>> as-is.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c |  4 ++--
>>>    drivers/gpu/drm/ttm/ttm_tt.c    | 10 +++++-----
>>>    include/drm/ttm/ttm_tt.h        |  1 +
>>>    3 files changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index f56be5bc0861..e2131c73dcb6 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -346,8 +346,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>                        } else if (unlikely(!page)) {
>>>                                break;
>>>                        }
>>> -                     page->index = drm_vma_node_start(&bo->base.vma_node) +
>>> -                             page_offset;
>>> +                     if (!(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
>>> +                             page->index = drm_vma_node_start(&bo->base.vma_node) + page_offset;
>> I still have a rather bad feeling about that.
>>
>> This should either not be necessary any more in general or the shmemfile
>> approach doesn't work correctly.
>>
>> Please send a patch to remove this for everybody instead and we will see
>> if that really works or not.
>>
>>>                        pfn = page_to_pfn(page);
>>>                }
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index dae52433beeb..cc4815c1f505 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -293,7 +293,7 @@ static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>    {
>>>        pgoff_t i;
>>>
>>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>>> +     if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
>> Maybe you should re-use the TTM_PAGE_FLAG_SG for this and/or rename the
>> flag to better describe what it does.
>>
>> Something like TTM_PAGE_FLAG_EXTERNAL or similar? The only other use
>> case for TTM_PAGE_FLAG_SG which comes to my mind is controlling if the
>> pages array is allocated or not.
> This seems slightly tricky. We still want ttm_bo_vm_reserve() to
> behave normally when seeing shmem_tt, and yet it still needs to return
> SIGBUS or so for FLAG_SG, as per the existing behaviour. Throwing in
> bo->type == type_sg seems maybe plausible, but at least amdgpu is
> manually setting FLAG_SG for userptr objects, so I presume bo->type !=
> type_sg here?

Mapping userptr pages through TTM is highly illegal as well since that 
won't work correctly with the tracking.

But please double check the history of this check, IIRC there was 
another reason why we checked the flag.

Thanks,
Christian.

>
> Otherwise maybe just s/SHMEM/EXTERNAL and leave FLAG_SG as-is?
>
>> Christian.
>>
>>>                return;
>>>
>>>        for (i = 0; i < ttm->num_pages; ++i)
>>> @@ -311,7 +311,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>        if (ttm_tt_is_populated(ttm))
>>>                return 0;
>>>
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>>>                atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_add(ttm->num_pages,
>>> @@ -349,7 +349,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>        return 0;
>>>
>>>    error:
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_sub(ttm->num_pages,
>>> @@ -364,7 +364,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>>>        pgoff_t i;
>>>        struct page **page = ttm->pages;
>>>
>>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
>>> +     if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
>>>                return;
>>>
>>>        for (i = 0; i < ttm->num_pages; ++i) {
>>> @@ -384,7 +384,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>        else
>>>                ttm_pool_free(&bdev->pool, ttm);
>>>
>>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>> +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
>>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>                if (bdev->pool.use_dma32)
>>>                        atomic_long_sub(ttm->num_pages,
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 89b15d673b22..20d550185065 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -42,6 +42,7 @@ struct ttm_operation_ctx;
>>>    #define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
>>>    #define TTM_PAGE_FLAG_SG              (1 << 8)
>>>    #define TTM_PAGE_FLAG_NO_RETRY            (1 << 9)
>>> +#define TTM_PAGE_FLAG_SHMEM        (1 << 10)
>>>
>>>    #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
>>>

