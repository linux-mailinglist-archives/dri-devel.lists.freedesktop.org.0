Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2469F386
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 12:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4661310E3CE;
	Wed, 22 Feb 2023 11:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59610E1C0;
 Wed, 22 Feb 2023 11:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKpvzDB2yNHB6GXqnwA4H/se1vD/RkfWo5Z3ynO0Ely8/eP2bnYzXZk5fbMabplSiCQGAzF4tMrGXR1wPNONC3vOjUenASli4ffNAyUXLSLL+ziHAQq7Kf7RXAg/iARFbf2oDxtyqRypVmtL7pmGdo6IPXOF80U+xaW4ZWoNvuRCuCTzVvHuyMSywdWtdegIOEqy3vKoBbF7Uiu+9ZDNa6OW9gnYfDcLRZ7B3ynPGK/8J5UjiKuauLLgzUd8voSsh5Zx1IOOkayOkefpR/1LqR8w/asZrSZ97PdbaDzProy52m8IsrraEi0JCp6qrG8dx75hFDvFJqK9dcJSe6PFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h3ihYuIeCI8TUFzRgYF+U4heGQusiq82t40cQBn66c=;
 b=Nukk7gBH+viqfh8mvA8e5pOBd0tHnFLh2e3i6CV7t7EkwKbhr7MLrs95pzDJ0gQUPNlS5DEvhemOKPCQuCAE/edx4MLpvVxIdSdq1barvlc/rcZoUNFsPCoQo6afQRiIM/9Vai8E8hCtyinSDWSLwmhz36UWh17YU/lCb9p8Pb1weyJHcdDR6vOw9JmuvEaioo8b8JBcN7TZNPO/9/KjGDxpxVqpq9mlyHI/scn8sMbUKyWhl6kTMwIoVs8ZKJRfak/MBX0LJIcF7Jack13cEDr7wphnwkGr+Ckh0v5cPT+pgauDK9i3enS6Essr5TM+JGVM4DhqXTsdAKuR4+cmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h3ihYuIeCI8TUFzRgYF+U4heGQusiq82t40cQBn66c=;
 b=ugNphz8Slm3Vm8c/J4qLfR/iHd6Fbl3bJ7J/ijD59F46vl3wqGGTtIXkRvimmN7XUKMyml+GVeaQ8fWV7g4ZOqkBsCu81Q/xamVzXY7hzxCsEtTjlEVO74wT7ZyRuiPtbRYkuvB2pX8uRSvE+kvgYQv2QjoAKeTnVGqomafGo/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6770.namprd12.prod.outlook.com (2603:10b6:510:1c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 11:39:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 11:39:20 +0000
Message-ID: <592a66a8-2265-ec51-b38e-baf7fd005e6e@amd.com>
Date: Wed, 22 Feb 2023 12:39:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Intel-xe] [PATCH 1/3] drm/suballoc: Introduce a generic
 suballocation manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
 <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
 <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
 <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
 <1ca4881b-c470-1f59-03c9-edcddbaa7a6a@linux.intel.com>
 <24ada492-c951-46ad-6771-3af88caf2fb3@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <24ada492-c951-46ad-6771-3af88caf2fb3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 1837dbcb-e9c0-445b-c56c-08db14c96fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scJgcBMmr0O4G6CPwV+3M6qV45JQ/xeMyQ4FlVKcYv7SZ2aktioYb8mI0TmBZyi3hXSawVrv0WUtRYG7O3xGWpn36x089oyMyRHrS/9tUciAD+eMqDoufryRKdCynQelkHGgLivPbRGVDZ032eMKPpOSKjt/dk90crPEKc68AV/f7hchUUQdUyr7PXJ1R7dm2DE6Oe8VleBzU2zAulmWvkwVfYlhvvqvwx6/N7D2thmUSZZlvB++jvO/q4W+rYaepizhzZKUZVhb0kkSRi3AqtsEDwm/+uFlWHPetw3SDrexi3FTCxqntbJEEqYArF9UrOdvJjHkRAZAieHHOcjhKg3JOfsP8bqKVqURtb2ABwIVzVr/CX4U/2rm6DxFtuabQ9QK7VPb71CqCMzztPWbXD8IfCvD2fGBLJ3rnVi+aDLjqFS97YTL/ZS8CzWtoFkEIEqjKWmlC3FV+jIxN+hsDzVBQMU+F/7BrQ/pDDp2B2O3KBwkBiBeyfI9mdYxnARl/Z1G+q8Fb4qEA0ycwDJ3AyAWNmFu7MSDA5kth+sEGu1qmIeS8FUVTL1FvgHW+IPhuzTvbjZaDowKmSXJSyOU2DWh+ZZ5oj+pTRCXFxukJCII+CAXAWTGL6oBBTY0kDJXGKToiop49oOBCiPaiIbKzdWnE9WHcVo8URqt/hsBHMatErIMayeXgVZbZ251YaHbTny0I9ohc8hZdTee9chp/8VLSfz/90UD60C+bgBcNyFpP6KkWYyfTFXl1wGFfyE9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199018)(66899018)(31686004)(53546011)(8936002)(8676002)(66946007)(66556008)(6506007)(66476007)(4326008)(41300700001)(6666004)(38100700002)(66574015)(5660300002)(6512007)(186003)(2616005)(31696002)(54906003)(478600001)(6486002)(316002)(2906002)(86362001)(36756003)(83380400001)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzRCRW9ibU90WjJlSTV6RzBscW9FQUdNRk1kRE1oVDYrUEl1Yk9SUi90dW5S?=
 =?utf-8?B?cjJjNDFzTzAwZGhhZUxWdG5NSS90SG5lODRJRUtNOVZFSW1oU3BINmRpa21l?=
 =?utf-8?B?L3pTclFQS0JiM1RTcXFtaWtGNFZ5M002ZldYM3VnRHFJUmVFeGJtd1UxQkp4?=
 =?utf-8?B?MEcrR21CcHA5ekp5eHNnMmFJclZUd0Q3d1FNMzQ4VHNtVlBEVHR5RzluYUlP?=
 =?utf-8?B?bE9KT0JlejNpSG5sTjBjSWxSbkxmL2o5RVVZVUNJamxPYnlRbnN2VzduQUtI?=
 =?utf-8?B?RUZ1ZmlINnRHdFd1ajNRRHIrTWlsMGlGOGFhMVQ4YngwS3ZXWGRqVERHZGZ0?=
 =?utf-8?B?TUQ4SE9KbkFSMmRHS0RydzQ3QzBBYmpRdmc5ZEtLSFRnNmVyaUVjcHVGQkMv?=
 =?utf-8?B?Nk5oTzNSU2FoZ1VKazBueWlZQWo1QTdRRmg0N3RsbWEwRmJ4VndDWHRnU0I5?=
 =?utf-8?B?RlRNMVQ0TEJuMWdqTFNiSjRrVlhsTnFhWTZ3aGRjREgwaFZERDhLYnhEQ3By?=
 =?utf-8?B?MFBjbnI5UE9uS1JWQUFYVnRHa3dDRkVpVm9weDY3U3RtWHZ6QUFQdHpvZmx3?=
 =?utf-8?B?MXI3WUlhbnZUbEpjUG9lNWY4Q1hEVkVrb0ZuTjQ1TWJvMm43Sm8xbkFyRzdV?=
 =?utf-8?B?c2JhNENCSTEvejNGbnk5MTA0RzVlNlo1UDFLUXJINEI1ZVZlcjVqcDhBY0FQ?=
 =?utf-8?B?VURqbVEra2FpUDRid3FGemZDOHJCallMM0JkdFVGM0YxWU9ZWlBTeUZvOXpm?=
 =?utf-8?B?TmQ1VjB4bXZKVldTMFpwSmMwUndGSUxoWE9DbTVxWkRpT1IwZzVjZ2R5cTFh?=
 =?utf-8?B?S0gzTTVKL1REc0E2elpSRTlzZWhFOURNUUdteno0cVZtejlUZ3dKOGZKSWRx?=
 =?utf-8?B?WEhJUm11NDdqcnFQemE0VytzT1lFUnFSWm5Zdk93akpqbVY0RmNNTUVnTXFs?=
 =?utf-8?B?TjhEVy9zQytIUmVpRXljd3lDOUo5US9US1dnc0hWQS9GNDk4dG5HRE1IRmFQ?=
 =?utf-8?B?M0hLalM5TFBCbnhwQTcyNGxaUGxEZnE2ZUpOUlhzL0pBZVRETjFBdkFvT2FK?=
 =?utf-8?B?YlBTQU0yd0dNOTZZMnpFT0ExUGVlRW5QSmhvWVNpTUVZTHVla0ZjMHdlU1Fn?=
 =?utf-8?B?NHRUZEhPalJkQkk5bVRnaG84SnJtSGUyUXpUaUI2TkoxemdZam9QSFordGZD?=
 =?utf-8?B?aDFUbmZhZU01cVljSDhGRnVOVUFhNkdrRnBRc1hpekpuS093eWtvRHZROUVI?=
 =?utf-8?B?QzdSRUZFZS9odzlhbXFrbkZPaldSczYrckFkT0RuNkRpNThXYlBGcjZ2M2tX?=
 =?utf-8?B?bEdPTTBTaFFvWHRtYUEvM2h4b1JJSStlQjFmcHEvamJnYVZiYldtajNZY0h0?=
 =?utf-8?B?czRGMlQ5TEFBOGJSbC9QS1NFN2N1d1ZxQk9YbExUOE5nRm5yNzdDamwzNzNH?=
 =?utf-8?B?OUc5ZVVaRG1wTGlraGNhZXZNSW04QTBmRFUyNXhEK3dIZVRmVHlMN2xxSGZj?=
 =?utf-8?B?eFVudWoxN2YzcFFJN3NBY3ZFNkpHZVc0OU1peHVRSTlSUnF6WTVaUDZYSHB4?=
 =?utf-8?B?SmdCTjVHR0pMd2RhdXVkaVU1N1ZXMGZxS2ZVak1Id2NvaEkxQ25NUGFpUEN5?=
 =?utf-8?B?cUIxKzhUbkhoNnl4Z3hIWjJKZVJldkNnQ3c2clRBTDJGY3RTTTErNVN6b0Jx?=
 =?utf-8?B?WnVocVpHMExNK3RmbUlGVWNKVW1GNEtjQ2NZbzhtTk9pTXlmWnRoY1ZjZUxM?=
 =?utf-8?B?T3l5V3hTUExheXUzRm1ma3FZbm85YVRyOElZdEZqT1ZEaDJzQzlrUHJjc2Qx?=
 =?utf-8?B?WjdYNXpScWVKSEl6UFhyV203T2FaUGo4TFNVS1NXZ2p5dDJDdjM5V0ZpOUtI?=
 =?utf-8?B?Q3E3dmIvbHh6QmR0TncxOFV5elpER2JMOWkrM0FuRFZjTzRHb2drc2wxQ1dN?=
 =?utf-8?B?dDRjL0dFOGxESUFNZk5BTXFiY0ZrbWFZOGlFQzU0VEZaWTRTd1NJVERyNGtm?=
 =?utf-8?B?OWc2elZ5QVliRWM4NGE5MSs0aFk2QlF0aHNOc1R4dzE1TmliVFhRYjQ0Tjk2?=
 =?utf-8?B?VmZGTU9jUVpBRjJmNys1Yk5KRXRjYUZ1RmQ3L2lDRkZmc3B5UjYrM0NZa0Ry?=
 =?utf-8?B?K09XMTVVOFpJTFhVazM0ZnhNcG9FbnFkVWFpZFZvdkZjVmZueDYzTVlLMDd6?=
 =?utf-8?Q?acOLjwivPUR+1TDLTQ4bb4E4IxR98n+q9Zv0xWZkQnYJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1837dbcb-e9c0-445b-c56c-08db14c96fdf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:39:20.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neb0yE7E3Os3deiWlt2IsNPifm2mbuClpwHNl7Oa1Ewkhz4AXZj0bga9Tvtzrhed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6770
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am 22.02.23 um 12:00 schrieb Thomas Hellström:
> Hi, Christian,
>
> So I resurrected Maarten's previous patch series around this (the 
> amdgpu suballocator) slightly modified the code to match the API of 
> this patch series, re-introduced the per-allocation alignment as per a 
> previous review comment from you on that series, and made 
> checkpatch.pl pass mostly, except for pre-existing style problems, and 
> added / fixed some comments. No memory corruption seen so far on 
> limited Xe testing.
>
> To move this forward I suggest starting with that as a common drm 
> suballocator. I'll post the series later today. We can follow up with 
> potential simplifactions lif needed.
>
> I also made a kunit test also reporting some timing information. Will 
> post that as a follow up. Some interesting preliminary conclusions:
>
> * drm_mm is per se not a cpu hog, If the rb tree processing is 
> disabled and the EVICT algorithm is changed from MRU to ring-like LRU 
> traversal, it's more or less just as fast as the ring suballocator.
>
> * With a single ring, and the suballocation buffer never completely 
> filled (no sleeps) the amd suballocator is a bit faster per allocation 
> / free. (Around 250 ns instead of 350). Allocation is slightly slower 
> on the amdgpu one, freeing is faster, mostly due to the locking 
> overhead incurred when setting up the fence callbacks, and for 
> avoiding irq-disabled processing on the one I proposed.

For some more realistic numbers try to signal the fence from another 
CPU. Alternative you can invalidate all the CPU read cache lines touched 
by the fence callback so that they need to be read in again from the 
allocating CPU.

>
> * With multiple rings and varying allocation sizes and signalling 
> times creating fragmentation, the picture becomes different as the 
> amdgpu allocator starts to sleep/throttle already round 50% - 75% 
> fill. The one I proposed between 75% to 90% fill, and once that 
> happens, the CPU cost of putting to sleep and waking up should really 
> shadow the above numbers.
>
> So it's really a tradeoff. Where IMO also code size and 
> maintainability should play a role.
>
> Also I looked at the history of the amdgpu allocator originating back 
> to Radeon 2012-ish, but couldn't find any commits mentioning fence 
> callbacks nor problem with those. Could you point me to that discussion?

Uff that was ~10 years ago. I don't think I can find that again.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>
> On 2/17/23 14:51, Thomas Hellström wrote:
>>
>> On 2/17/23 14:18, Christian König wrote:
>>> Am 17.02.23 um 14:10 schrieb Thomas Hellström:
>>>> [SNIP]
>>>>>>>>
>>>>>>>> Any chance you could do a quick performance comparison? If not, 
>>>>>>>> anything against merging this without the amd / radeon changes 
>>>>>>>> until we can land a simpler allocator?
>>>>>>>
>>>>>>> Only if you can stick the allocator inside Xe and not drm, cause 
>>>>>>> this seems to be for a different use case than the allocators 
>>>>>>> inside radeon/amdgpu.
>>>>>>
>>>>>> Hmm. No It's allocating in a ring-like fashion as well. Let me 
>>>>>> put together a unit test for benchmaking. I think it would be a 
>>>>>> failure for the community to end up with three separate 
>>>>>> suballocators doing the exact same thing for the same problem, 
>>>>>> really.
>>>>>
>>>>> Well exactly that's the point. Those allocators aren't the same 
>>>>> because they handle different problems.
>>>>>
>>>>> The allocator in radeon is simpler because it only had to deal 
>>>>> with a limited number of fence timelines. The one in amdgpu is a 
>>>>> bit more complex because of the added complexity for more fence 
>>>>> timelines.
>>>>>
>>>>> We could take the one from amdgpu and use it for radeon and others 
>>>>> as well, but the allocator proposed here doesn't even remotely 
>>>>> matches the requirements.
>>>>
>>>> But again, what *are* those missing requirements exactly? What is 
>>>> the pathological case you see for the current code?
>>>
>>> Well very low CPU overhead and don't do anything in a callback.
>>
>> Well, dma_fence_wait_any() will IIRC register callbacks on all 
>> affected fences, although admittedly there is no actual allocator 
>> processing in them.
>>
>>>
>>>>
>>>> From what I can tell the amdgpu suballocator introduces excessive 
>>>> complexity to coalesce waits for fences from the same contexts, 
>>>> whereas the present code just frees from the fence callback if the 
>>>> fence wasn't already signaled.
>>>
>>> And this is exactly the design we had previously which we removed 
>>> after Dave stumbled over tons of problems with it.
>>
>> So is the worry that those problems have spilled over in this code 
>> then? It's been pretty extensively tested, or is it you should never 
>> really use dma-fence callbacks?
>>
>>>
>>>> The fence signalling code that fires that callback is typcally 
>>>> always run anyway on scheduler fences.
>>>>
>>>> The reason we had for not using the amdgpu suballocator as 
>>>> originally planned was that this complexity made it very hard for 
>>>> us to undertand it and to fix issues we had with it.
>>>
>>> Well what are those problems? The idea is actually not that hardware 
>>> to understand.
>>
>> We hit memory corruption, and we spent substantially more time trying 
>> to debug it than to put together this patch, while never really 
>> understanding what  happened, nor why you don't see that with amdgpu.
>>
>>>
>>> We could simplify it massively for the cost of only waiting for the 
>>> oldest fence if that helps.
>>
>> Let me grab the latest version from amdgpu and give it a try again, 
>> but yes I think that to make it common code we'll need it simpler 
>> (and my personal wish would be to separate the allocator 
>> functionality a bit more from the fence waiting, which I guess should 
>> be OK if the fence waiting is vastly simplified).
>>
>> /Thomas
>>
>>
>>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Thomas
>>>

