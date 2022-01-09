Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE24888AA
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 11:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A4F10E4BF;
	Sun,  9 Jan 2022 10:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2062.outbound.protection.outlook.com [40.107.212.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6691510E4BC;
 Sun,  9 Jan 2022 10:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MISP5RmOH3zr0X0iapZMmBTruK1yo+XoG4VtgleMelD2qcol4PcYCw7Kt6r6AR00rzDRiOPcsMRLnMUiwMKpHrI15ZTfPxPLBPX3k1tGOS9X/On7OQtZDo3QSXsEsdv7jXzHwBkz7847mrl9Osg43uiy7R9n+dMZp0NQPGt4nbk8Swq+lxMcjdK2vZL6A0V+b0t+rhFXoT40vWNiqk91Hmsv5AneeJBCl3hS8XgUOcJATrwfF4hT/O1eGl7JxZzxwvbJJWr4RVtF0mWmOTyVUHT5Y0GoOHkVcMt4qTEeY3wB21hjnkTj6Ar7gl+t/xggLto3r8rNgNrh+sBQYedHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfzJHMizSFwUWEZO4hXs/gG9uLIEny0BXH9Jw7jpVbI=;
 b=Ll7jX8deOe8PzW8qVqgp/jtsNLLFb8rsYmbMowiAL9dp1idDnJaGQUxtJeRnMvZ7NAUOovQBxOBhcqMCtJrpEcZv0wnRT4ePtcr7b2PvPtYCDfS/lergUGnoUMblerZhqXJQhgDooSWdw0xbF7ICmmeNRqPTbSNhoHd/7UNrFtuOgrUnyTnXumzsaOoAMhksm9EP7JPxiSCRUr+onNxlFgI9B5dVFFC2NNvg7T0abj5DmsFZEwwQ3D6VfFrv2uFs9MKy/deX3Ny+U1WnMn4uA7FXMoLsm3wVnkyXmd7gV2cAgVpg+gsqWe/aWMlxs5QXPkvkcmXS8jsRksI25DxXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfzJHMizSFwUWEZO4hXs/gG9uLIEny0BXH9Jw7jpVbI=;
 b=MOdbMM87B1/DpYJR4ftB+bkGOzTTcWeMrQdZTSN9bmSbN6YhK0GCCgUU2z+9W9sAVn4XmonSykMatrjld0Y5O0zhWYgp5gKxxm+PgJFlBjkkaAAcyEtTC/gQtc7gdZMed2GRTjgDRuCrrxQG16so2Mu1D5M0037JJLyVs+1BhE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Sun, 9 Jan
 2022 10:14:20 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4867.011; Sun, 9 Jan 2022
 10:14:20 +0000
Message-ID: <2d1428cc-b681-f036-f03b-ffe51af8b2eb@amd.com>
Date: Sun, 9 Jan 2022 15:52:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 1/6] drm: move the buddy allocator from i915 into
 common drm
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <1d1a4278-5aee-20d5-b536-7ca199e85e93@intel.com>
 <4053214f-bbb2-b6ad-37e9-4a579792a4b3@amd.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <4053214f-bbb2-b6ad-37e9-4a579792a4b3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::26)
 To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea17c3c-2066-42f8-bf4e-08d9d358cce1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB47970978280DCB76CD3336DDE44F9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LClfxi4pgpd3amMD29KBGsCHj4h9xlhBAQ6P+jmRUEGDPWVY9WlKy31bO+/5KHy51RCQ0Hl3cMX9lYgGyHh4P7IHy+X5lB6hQ0Y20X9ADTYHcwX4xUvKBgkDCeX0wkn1z69v5/tELsPC1mGhJ9Ex5v10gnd/xQdYd5+E17kj17B7voEFM3z6CL6KUbRg5av9Asd0guXAfbVKtlWKXbV+0mlF5nGFIf2MWfX0hdv4RakjGyw/0ylPVkdTru1x9j8ieFc1ruWvpM48zCXPTCQ4yzQrK5frREH/AKpi8sQqJN2igy/LOoSQBoBTVbgatcBmGf8y4NSfRx3Fq2gpwkOdiCPLesa7IEvCjn909QPbVpw+gV0acnu0tOfmRFSgpLVp3iw5B64f9g5mUCRRnL9OfZxR+Gxq9BTPpk1uPE8r0Wk5G9rwszRxHdtYwbybQAy75nhrs2O3zg5MLIhxAbg4xVxEaBBBCKwkwCQNigcCh8HtUPbp0rDBV6t6zm3i7V1KysHcfe/DPUdaIp8jmgMjlZl8pUHjWoG6k0hCwHW3MKGPqHh2ZgpTuNA93ZHndQB5ajrJX6UK2zPLS1CEW1MGC1z1qKhDBqRx4Ze2q8C6oe97Kw+AlsahG8obIqpCWeJfT1ciTgTF0WiogdHP1jcHnd0JgTSMxGPQbYNlvm8YifLHjGL05ZOuYe+U+oVM8KwaERdUi0EoIHfPKy4fX0BET2YCLaSs2gRh4Lfuxj9EXViF0lc7A5QXi8WSSPFRm9DZMrs8JqjK74OKkiVnwohCn23YXGvNAC1GXWgngbk/2KacTmtjBW4L+w6wJVm/2gnN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8936002)(38100700002)(6486002)(508600001)(86362001)(31686004)(2906002)(966005)(45080400002)(8676002)(53546011)(6506007)(83380400001)(186003)(66946007)(66476007)(36756003)(4326008)(316002)(31696002)(2616005)(110136005)(6666004)(6512007)(66556008)(5660300002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay8xZGwyWDFLYUdtaWJWMk54Njc5NEF5cGxQS1FVM1V1L3hHbXArV2l5ejEy?=
 =?utf-8?B?cnIzeGk2aUhJeW1qeWEvcDFyUGhGS1Bad3hmSWVGbjkwcGJjWk9mUVF3QkJ0?=
 =?utf-8?B?QllVbURkTGJmZlpZU2dKSjlWMHY1RGYrQ3EzQjdJZU4yUVVieFBYS29lMUZJ?=
 =?utf-8?B?UERtUUR6T1FUV0lxREhTaEJDeDhENUkvUC95dXJkdE40SlFWaER2YTlWR1Zk?=
 =?utf-8?B?dnZ0d0lTc2pIUEpJKzRWWEE2ZHh2RDdwZ2dEZ0JOekI0VlhnQ0oxNkYvNDJr?=
 =?utf-8?B?QTJlMFY5c1ZSeUF5blRWb1FGOXdUWjdpYnVXMTBCNE1nTmJIY09FYjRLc2ZO?=
 =?utf-8?B?azJjaWpHUUNRVjdWcng4Rk1rUE83SDExRWw0NTZ0dTJmTXVxV201a2lCbUJI?=
 =?utf-8?B?WStJY1Yza2hodzhQb2JXMlFxWEZxKzhleFBvNlhiVGFNTG9PdnllZC9lbTFH?=
 =?utf-8?B?TXk3SUdnNkZNaUdsdkZmdkFwQk1iYlJBb1F2UEl4OGhZN2Z0T1BCN29ZSGF6?=
 =?utf-8?B?dEdsbkNYclVrSFZuZmFtV3B0QmlFZWdwaWh4dzNYMS81cVF2SkFDVVBIQm1S?=
 =?utf-8?B?S00wMEFmQUVjQUQ1QlRtWTlUUGgralNVUVhmSWM5Rm5ZOG90bkpqK281ZzF3?=
 =?utf-8?B?VVVnUGpaaElOQzlyRzB6V3REWDFZTk1DNTJuOU5UWjVMbFVJUDVVQzVHSzRy?=
 =?utf-8?B?NjR3RlhuSHZoKzRwNDBDdHR2ZEMxbUF6Ukdwa2treFZWa04yWGZBcTZXbU0x?=
 =?utf-8?B?OE1lODJaTVVweGFCK2hjTVZHVURZQ3A1NjZDY09pN1hlc2xINGFKUFdoQUV4?=
 =?utf-8?B?R2NFeW84Q2hUb1dtRk5HaGpPYStCZ3NJbHV5b2VUOEgxNVVRZk5BNEcralpK?=
 =?utf-8?B?RzZ3WVBndHlVWi95S1d1KzBveElHdXNNbmhCL01QUHJsZDdDR00waUdMQkdG?=
 =?utf-8?B?QXVMM2hnT1RUaktkdFpmSkFRZ3oyUHFHTFBiMy94QW9sNzVWMzJ1V1NNK3BX?=
 =?utf-8?B?TWJjYkZrWjhHVTk3aWF1VHJ3dmdsWFpIdlpLUmxhRnVXVGZRNzRBRWx4Tkty?=
 =?utf-8?B?NW1TVkU0S05aSUwwanpMVnEzTmNpaVhQQ0ZIMEpuTWRJWEQ2cWpwZ1Z3cjQ5?=
 =?utf-8?B?NklSanNJQVRxczNsUGVmeXZIbWUvZ0tkUTZxUzJmSWxtQUV2ejVwRzNlaHNW?=
 =?utf-8?B?TkJxc29iY1VIdis1S1AxMHhXR2lZRmNDSlhRLzZVZTFxd1ZJRFk4T1JtNUhl?=
 =?utf-8?B?WGxaN24yQ0RqTEcwRkErYlVKYTZmUm1CMTNxUktiS1dPOGlMOEtJeSt3K3RV?=
 =?utf-8?B?TzU5Vkw5UlgrVFJwL2p3TE1UWDJuNlpXSVFVdVhUaHNQNG5NZlYrL0pPVzBo?=
 =?utf-8?B?VzhGci9Oa1NDQTFHK0tkMGs0czVaY0pVcHhzMEIzSnRLTXR6WXVnU0VJNzd5?=
 =?utf-8?B?TEZ5eUlYOC9UUStxQllzWDliOXo4emZrY1V5cjhVdmkzNjFtdjJXcHRHUFMv?=
 =?utf-8?B?Yk16VFd6cXJuNWhITjB0aVgwT0liREJUNTAvc1dDa3pycEtKZEgybXlOK1VL?=
 =?utf-8?B?NlJwanpZQ3VpMXNmUFdRUVVXTW5sMjJQYTJNaW9lVXdoSXQraEVtc0lXamVZ?=
 =?utf-8?B?TEdsWWloWU9Ka1M5QitaQkY0bE1GSG4yb3pQOGt5QnlqRlJVRTBKcTVTWTl5?=
 =?utf-8?B?UXRhdytCS2lWZmNiT055NUpJdDkzQTFWQXNYSVdZanJwUVY1RldLT2d0dURI?=
 =?utf-8?B?ZnFrMHQyYlB4TUI1NGdRZG9BVVdVQldVTXVrbGpxMzBBa1FYWFk4dGlHMDVC?=
 =?utf-8?B?ZlBRSEZyWEg3L2I5TWZkQVJZS0h5U0NlWlZkclpHZVNnZCsyOHBpdnRNRFdS?=
 =?utf-8?B?L2VSNVBnQjk1Z2ZFSXpNMmV5TE1HWHhRTDRpbmgyN0ZyR1BvSWpBNzlWWmZa?=
 =?utf-8?B?RGtHdzFTSWZud2s2WTdZUTFwd0xqeVdVQVBMeWNnVXM2QlZ3WldwTEZTZHpj?=
 =?utf-8?B?cEYzSjZwaWwzb0RiRWNRVERBdkZzVXp3MWRJWVdkU0dpODcxVmFyR21SdmRB?=
 =?utf-8?B?MjU0SHlhZVd4WTdYOVdsNWw2d3lWNE03NFpDVXlyV1A1TDRyNm5mSnZ1WHVl?=
 =?utf-8?B?ajdzLzBaWHVmOEUrL0FVVVN6eHlrbUhzV0xCVzBma3pSRjRKN1BMWHBLUDV4?=
 =?utf-8?Q?rUZF20GkQhhrYOunOXoqPic=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea17c3c-2066-42f8-bf4e-08d9d358cce1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2022 10:14:20.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duASBLQZ0xioNOJZj+2D1ucJvDxRMGMx6sq5KFPeuAliMkXceJ4Di2yvmRX7yrm0vMCuplaOzEn+Zew0AYPlEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/01/22 9:27 pm, Christian König wrote:
> Am 07.01.22 um 16:49 schrieb Matthew Auld:
>> On 26/12/2021 22:24, Arunpravin wrote:
>>> Move the base i915 buddy allocator code into drm
>>> - Move i915_buddy.h to include/drm
>>> - Move i915_buddy.c to drm root folder
>>> - Rename "i915" string with "drm" string wherever applicable
>>> - Rename "I915" string with "DRM" string wherever applicable
>>> - Fix header file dependencies
>>> - Fix alignment issues
>>> - add Makefile support for drm buddy
>>> - export functions and write kerneldoc description
>>> - Remove i915 selftest config check condition as buddy selftest
>>>    will be moved to drm selftest folder
>>>
>>> cleanup i915 buddy references in i915 driver module
>>> and replace with drm buddy
>>>
>>> v2:
>>>    - include header file in alphabetical order(Thomas)
>>>    - merged changes listed in the body section into a single patch
>>>      to keep the build intact(Christian, Jani)
>>>
>>> v3:
>>>    - make drm buddy a separate module(Thomas, Christian)
>>>
>>> v4:
>>>    - Fix build error reported by kernel test robot <lkp@intel.com>
>>>    - removed i915 buddy selftest from i915_mock_selftests.h to
>>>      avoid build error
>>>    - removed selftests/i915_buddy.c file as we create a new set of
>>>      buddy test cases in drm/selftests folder
>>>
>>> v5:
>>>    - Fix merge conflict issue
>>>
>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>
>> <snip>
>>
>>> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
>>> +{
>>> +    unsigned int i;
>>> +    u64 offset;
>>> +
>>> +    if (size < chunk_size)
>>> +        return -EINVAL;
>>> +
>>> +    if (chunk_size < PAGE_SIZE)
>>> +        return -EINVAL;
>>> +
>>> +    if (!is_power_of_2(chunk_size))
>>> +        return -EINVAL;
>>> +
>>> +    size = round_down(size, chunk_size);
>>> +
>>> +    mm->size = size;
>>> +    mm->avail = size;
>>> +    mm->chunk_size = chunk_size;
>>> +    mm->max_order = ilog2(size) - ilog2(chunk_size);
>>> +
>>> +    BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>> +
>>> +    mm->slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
>>> +    if (!mm->slab_blocks)
>>> +        return -ENOMEM;
>>
>> It looks like every KMEM_CACHE() also creates a debugfs entry? See the 
>> error here[1]. I guess because we end with multiple instances in i915. 
>> If so, is it possible to have a single KMEM_CACHE() as part of the 
>> buddy module, similar to what i915 was doing previously?
> 
> Oh, that is a really good point, this code here doesn't make to much sense.
> 
> The value of a KMEM_CACHE() is to allow speeding up allocation of the 
> same structure size between different drm_buddy object. If you allocate 
> one cache per drm_buddy that makes the whole functionality useless.
> 
> Please fix, this is actually a bug.
> 
> Christian.
> 

I fixed in v7 version

Thanks,
Arun
>>
>> [1] 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FTrybot_8217%2Fshard-skl4%2Figt%40i915_selftest%40mock%40memory_region.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C56202fbe886f415c3b8308d9d1f5409c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771673545453215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ZnRmAQo%2BjX414hbqHigL4R18oBDKLIugUQIVcwhFI%2BY%3D&amp;reserved=0
> 
