Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FB6D7EA8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1670A10E0B1;
	Wed,  5 Apr 2023 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89D10E0B1;
 Wed,  5 Apr 2023 14:08:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVlFitGk8Gkn39xy5037HWWDUKYQHK9lr5WViGoGqD6mg7ovzq8eemKuYSrOp3d/R+/XiMQo4faUnZopCe9HYNaHNvWzhuxPoOpqbDVZesi0WArjpnH2/xzMAh5ksOmeRrQ7OgagiNPTqljX45euCwa4KMOSi1QOoa+kJPgndV4PsQDMeD9ykRRFHHM3V3ypvNP6dUMCOpCQjELMiaIp7TmzMWiBc+Ee33NEWLR4h+e3md6eWTr4xGDe9HYp0pFLmTwGzNDSMlvuy0XR/8d8kzm7uqnwbpB3CeJ4sXnaM81SPlBSjvTG3EUI758iDgzihrDSmqlu/8NOcrxaxCllxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoZlFdk+5Tq0QdS7YZmDVfbJJ4QcVHY3IU/lcaAc6m8=;
 b=AKVQiNU3vNNgGKs0d9rPHHdbJZEM9xyUtmsF694sD7YnY2lSXpnRf6um4ETah9j27EYKxp36NjOkU0Ph7jTsOm0p5E7PpiNunm+kYhtpF5fgad15cpd33xqLYKbK8PTyHNgf+ahgei5OryGkSAYeSlj3Um1p/0vw1sEfMioLbmf7EOZQJZEruCu0vruQ7MmUgCEuFJHMp/9adV4zPsDtnoV34E+Dk0JEQmzDiv8p3k/9wfjN75jxF+mfzsxPDC1wXyDlMx24k5sKC5/+hdeCJMb/KccaqTFzEhPmdZC/MB6YsXzh7OnIkJKHHKDH7g4aXTxyohX48sIXw62x27/1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoZlFdk+5Tq0QdS7YZmDVfbJJ4QcVHY3IU/lcaAc6m8=;
 b=uPOPgbRoP7iqPZa8UH8fSLNiNP86zCyKRM9mnYAqXcTL64mbQTRscrHEKHBhbxS+TssIEGKcoEf2Hbtc64+7Dj4IqysX3cI+TTwGVksyD+hrCZLW4CE6KF/4MXhssvgaQsfFM86HF/+wPiv9IRX+jLvCGmCu53im2StAq7KTRzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 14:08:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 14:08:14 +0000
Message-ID: <149ab74c-4815-1174-c66c-494408b5f8e6@amd.com>
Date: Wed, 5 Apr 2023 16:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <cece14bb-d3c5-3772-855e-bac0bb7766d7@linux.intel.com>
 <c57a9fcc-7721-9958-38f5-b3a1b0b56772@amd.com>
 <ZC1thkzodefVK6XU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC1thkzodefVK6XU@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cf7f9d-3e2b-41f2-951f-08db35df320f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: miC9Kc1Tv77FmNb2w7ip7iQf3bEkUTXzjxrdvKHAdaLmKK5OSJzkZsexRzhwE6ntwKMIbixZKePS35Oyurbuyx+HenKmHZEAe7ir11Qqh+iR0cq2DIlp+ohUwsdHyCz0j9GEFqSD3Jd1rRUbhdIUyE8hR/HMjpnlkBENBS9A62eUCzSAbK2t+kCgyr9bwi0ItdzQPyB4J+7nNvKi3d85JxK/KSGBUSzfhMvYdjdLmRVffmPnsr3zF3VWAnm1etlBXaAb/v4nTNwmBXp4FDdtihB6mwMYLdEHtxf8kDW/PhzE5zKaZZb0GbFkxs1gq9HBWFeG460MxI+512RAB7cI1s1bt/luqQwditgjsrmkXTBXZB6jqP6PSJsamZ7Sk2MnKyWcmbwIty/adCLGcOC6rIvg/qF24Qo5WfGWZjY369cSzkfaS+yZ/TqzlE0vMPmh+1hgAy/8AIFms/hC7/y27YrYlZdTWlQHITZdcnarWgBP2Q2HXis55ynOkkPTSe5AqRExqBGaUkDmrr7G6gsaXWfrQnR1DMQ6+6vZZrX6PXERNRkFz+4srj71RDZE9P8Jk+o7675hojOe00kHS1cgXYqgHrL5jZlkh8v8YRhFqre6eU8Z2rdOOA+S+a6sIfC/B+p0pfm1zT18mG5khaqbqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199021)(5660300002)(8936002)(7416002)(31686004)(2906002)(54906003)(316002)(66946007)(41300700001)(186003)(66899021)(478600001)(66476007)(6916009)(4326008)(8676002)(30864003)(66556008)(966005)(6666004)(6486002)(53546011)(6512007)(6506007)(2616005)(83380400001)(36756003)(38100700002)(66574015)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNCTE1xZVBXbDk0UUxwcTlyNGhwNTZlNVdnSmpJM25UR3Joa25HeXVmUVRV?=
 =?utf-8?B?WkZRL1dWd0hNdUlYaXBvYWdoQ3ZwTTVBVXI5RTI3T3hoeUY0WTF3NVZnbHdG?=
 =?utf-8?B?bWRyOUF5NWNCL0EyRVJ5dmtPT0ZNZmc5cHFEdG1ZM1J3R2NmSi9hS1I1bG51?=
 =?utf-8?B?WkhCb2NCRHhZMkk1YzRONE9HMUIvMUlBSU95QmhISkxmeTB5OTRaL0hNSG05?=
 =?utf-8?B?ZmROdjVYRFRlc2M1VmZmS3hKV2lKaGRPbUthd1Z5bXIvUHI5b0ZqWC9qbklH?=
 =?utf-8?B?TnpZbkRTeENnTzV0TkpjZDcrc1NtellJSll0bzMvc29NbWRYVlpVUEc2UGsw?=
 =?utf-8?B?YlBjNldEbGQ5Y3Y4b3FoOWpaTXJ6MnUyYW9oeTVTUXRQdCt6TUw5bWkzVEFx?=
 =?utf-8?B?TXpnblR2dSt5QytEcFJmaTVHdFJPOVNDNDVudEdiVFlwcG1VWXowTVcwQmFQ?=
 =?utf-8?B?T0xhMDB5R2h3d2VsUysyTE1KS2ZOU3FnSmUxbkJrOEtrb1N3RG5FNXBOV1Zq?=
 =?utf-8?B?cjZ0dGNESGFsTGRnbmlRR1U0REFlN2FPMEdUNHEvUlVFSGtOT3diN0Nac0dG?=
 =?utf-8?B?by83dGttS2tFTVRuK2FMUnhiSTZySkg5MjZoejVKTzF6M3NlL3E2eWRFYUFP?=
 =?utf-8?B?S3FSSVRYR0xhVm1xSlRsU004V0ViOVlkMjdnSUlXdlJjQ2E4NFdJL0M5REsz?=
 =?utf-8?B?eUlHbDZpbUJ0YzgxdXhzRWhrUGZUdzJLOVlxazZweGpsSnFOdk1ZcXlSNHNZ?=
 =?utf-8?B?eFY0YXN3cXppRFZVSFpxaWwycmY4UnJlczM2K0UxWlIyRkk5alhaN01wVnMv?=
 =?utf-8?B?dCtXSFpoM2dzLzFPRTRNbHg5bnpTTXU0VXBKUThBUE1UZW80Zng2eTZ2TFN2?=
 =?utf-8?B?NFZHaUlNQzFwV2d4VTBrZUozbG5sdEczZjNBZmtwelN6SkQ5b01sL2tweE1B?=
 =?utf-8?B?K0FzeTNVdG84ZnpWSHM4RHA1VFZhRmliUll5cWo0aFVaeGQxK2FYRGs4b213?=
 =?utf-8?B?RnFhNlJidlpWanJlTE93bTZzSitVdUhPc3lCbktWU1FSa2VmVlg3b0dLMUEv?=
 =?utf-8?B?bnU2UnE4RG9YYjRRUVV1R3ZnUTlKZ0hyOFZlUzJHemhBdDZhc2ZMTjh2Uk1r?=
 =?utf-8?B?akVwa0dYWmFrY3k5Wm1lRUxiSXE1dE55UHhNM1VEUWpPVE45ekV6SlRHUk81?=
 =?utf-8?B?REtaWHVKR0xYYU92bzlFS3FjSS9RUnk5QXpxcWMyNnptWWhJOSs0L1AvS1lF?=
 =?utf-8?B?UDVzN0tTL0N3TnE5clI2c3lOVTgzQ3JRa2xxVmR4VEcvOUlOWGZXWWh0VU9z?=
 =?utf-8?B?U2x4SjJ3Sk1ONGJrQU15R2hJYllnM01sVEpOanRHSlVJMXVGSERXMGE3RTdu?=
 =?utf-8?B?Vmk3VnhQaWFMODZmYjhVd3pCNjEzK2JlQnJiNnB0VHdGS01ZWVprUmk5ckdT?=
 =?utf-8?B?MERrSWN3YlJVaUIxcHVXL3J2UkhteGliVnhhUWlFM1daV3ZiSGIzM2RPOUtM?=
 =?utf-8?B?Nkd5UTE3R0JPbWFTN3R4ZXNxVXFnMnJmSUZibVJ3THNWVUNuUDlIM2hIdjhw?=
 =?utf-8?B?djV5a0w2dmgzcFhwcGdnN01jZVlWSkdmYWpicldmZm8yMEcxWEg3V0lRbjkr?=
 =?utf-8?B?emcyVXJNZWZLUzd4WmpXTkhwS2ZTWUt0SUVPWkl0dDhnc1JERXlhZ2NTSE02?=
 =?utf-8?B?bVpIcWg3Um9tVEMvSkI4RzhhNmh1WFJMTjlSaUVIN05nRW1Yemt3dVNaUjdu?=
 =?utf-8?B?WVpzZ0JtcTNtNGVoa0QwOHljODd4NzFMUndnT0tsN080OTBHN3RpWUY1RW9O?=
 =?utf-8?B?dTRVaE1obHd5QVZHTHBjc2FVVWJMdzRVYm9FbUhzOWJqdUxVV2NIdWxVY2Ra?=
 =?utf-8?B?NDFHcmJ1a1FvSnlEdkcwTGxjT1VWTkhTeitXVThUb1NGT2NjVDNhb3AxTEVv?=
 =?utf-8?B?Ukwyc2ZobFFRRW1wbytCWmUrdGRWZUZCQmVKRFdDKzZscnpWNjdQYVRTbGtl?=
 =?utf-8?B?cFYzYzUwYU1SYTY4elJRYU9wd1RWQTY1NDh1REJ5L2ZhQzFtWHZIREVWb1Bz?=
 =?utf-8?B?eEhpbnpWdll6MjdmcVN6WlRnWGxyR29kVis4c3RCNWhWemVJQlFWZGdJaVhm?=
 =?utf-8?B?VkZ6cmdlSkNDSzJ1aThWZnhxTkhDdGlTM2NyQWtvc0UzdjZJditvMDJBNGpW?=
 =?utf-8?Q?fDLrKIqRGwV9ZSS4BviWJJzLbH6r3qnxLYmlc5vtvoz8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cf7f9d-3e2b-41f2-951f-08db35df320f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 14:08:13.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf5/Dwl53I9YJH8TY7KvvuGjn0sd3w2CKIgziavegNKC84EWdQ+waczhyO5wKyFj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robdclark@chromium.org, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.23 um 14:45 schrieb Daniel Vetter:
> On Wed, Apr 05, 2023 at 02:39:35PM +0200, Christian König wrote:
>> Am 05.04.23 um 14:35 schrieb Thomas Hellström:
>>> Hi,
>>>
>>> On 4/4/23 21:25, Daniel Vetter wrote:
>>>> On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
>>>>> On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström
>>>>> (Intel) wrote:
>>>>>> On 4/4/23 15:10, Christian König wrote:
>>>>>>> Am 04.04.23 um 14:54 schrieb Thomas Hellström:
>>>>>>>> Hi, Christian,
>>>>>>>>
>>>>>>>> On 4/4/23 11:09, Christian König wrote:
>>>>>>>>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>>>>>>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>>>>
>>>>>>>>>> For long-running workloads, drivers either need to open-code
>>>>>>>>>> completion
>>>>>>>>>> waits, invent their own synchronization
>>>>>>>>>> primitives or internally use
>>>>>>>>>> dma-fences that do not obey the cross-driver
>>>>>>>>>> dma-fence protocol, but
>>>>>>>>>> without any lockdep annotation all these
>>>>>>>>>> approaches are error prone.
>>>>>>>>>>
>>>>>>>>>> So since for example the drm scheduler uses dma-fences it is
>>>>>>>>>> desirable for
>>>>>>>>>> a driver to be able to use it for throttling and error
>>>>>>>>>> handling also with
>>>>>>>>>> internal dma-fences tha do not obey the cros-driver
>>>>>>>>>> dma-fence protocol.
>>>>>>>>>>
>>>>>>>>>> Introduce long-running completion fences in form of
>>>>>>>>>> dma-fences, and add
>>>>>>>>>> lockdep annotation for them. In particular:
>>>>>>>>>>
>>>>>>>>>> * Do not allow waiting under any memory management locks.
>>>>>>>>>> * Do not allow to attach them to a dma-resv object.
>>>>>>>>>> * Introduce a new interface for adding callbacks making the
>>>>>>>>>> helper adding
>>>>>>>>>>      a callback sign off on that it is aware
>>>>>>>>>> that the dma-fence may not
>>>>>>>>>>      complete anytime soon. Typically this will be the
>>>>>>>>>> scheduler chaining
>>>>>>>>>>      a new long-running fence on another one.
>>>>>>>>> Well that's pretty much what I tried before:
>>>>>>>>> https://lwn.net/Articles/893704/
>>>>>>>>>
>>>>> I don't think this quite the same, this explictly enforces that
>>>>> we don't
>>>>> break the dma-fence rules (in path of memory allocations, exported in
>>>>> any way), essentially this just SW sync point reusing dma-fence the
>>>>> infrastructure for signaling / callbacks. I believe your series
>>>>> tried to
>>>>> export these fences to user space (admittedly I haven't fully read your
>>>>> series).
>>>>>
>>>>> In this use case we essentially just want to flow control the ring via
>>>>> the dma-scheduler + maintain a list of pending jobs so the TDR can be
>>>>> used for cleanup if LR entity encounters an error. To me this seems
>>>>> perfectly reasonable but I know dma-femce rules are akin to a holy war.
>>>>>
>>>>> If we return NULL in run_job, now we have to be able to sink all jobs
>>>>> in the backend regardless on ring space, maintain a list of jobs
>>>>> pending
>>>>> for cleanup after errors, and write a different cleanup path as now the
>>>>> TDR doesn't work. Seems very, very silly to duplicate all of this code
>>>>> when the DRM scheduler provides all of this for us. Also if we go this
>>>>> route, now all drivers are going to invent ways to handle LR
>>>>> jobs /w the
>>>>> DRM scheduler.
>>>>>
>>>>> This solution is pretty clear, mark the scheduler as LR, and don't
>>>>> export any fences from the scheduler. If you try to export these fences
>>>>> a blow up happens.
>>>> The problem is if you mix things up. Like for resets you need all the
>>>> schedulers on an engine/set-of-engines to quiescent or things get
>>>> potentially hilarious. If you now have a scheduler in forever limbo, the
>>>> dma_fence guarantees are right out the window.
>>>>
>>>> But the issue you're having is fairly specific if it's just about
>>>> ringspace. I think the dumbest fix is to just block in submit if you run
>>>> out of per-ctx ringspace, and call it a day. This notion that
>>>> somehow the
>>>> kernel is supposed to provide a bottomless queue of anything userspace
>>>> submits simply doesn't hold up in reality (as much as userspace
>>>> standards
>>>> committees would like it to), and as long as it doesn't have a
>>>> real-world
>>>> perf impact it doesn't really matter why we end up blocking in the
>>>> submit
>>>> ioctl. It might also be a simple memory allocation that hits a snag in
>>>> page reclaim.
>>> So it seems the discussion around the long-running synchronization
>>> diverged a bit between threads and this thread was hijacked for
>>> preempt-fences and userptr.
>>>
>>> Do I understand it correctly that the recommendation from both Daniel
>>> and Christian is to *not* use the drm scheduler for long-running compute
>>> jobs, but track any internal dma-fence dependencies (pipelined clearing
>>> or whatever) in a separate mechanism and handle unresolved dependencies
>>> on other long-running jobs using -EWOULDBLOCK?
>> Yeah, I think that's a good summary.
>>
>> If needed we could extract some scheduler functionality into separate
>> components, but the fundamental problem is that to the GPU scheduler
>> provides a dma_fence interface to the outside to signal job completion and
>> Daniel and I seem to agree that you really don't want that.
> I think I'm on something slightly different:
>
> - For anything which semantically is not a dma_fence I agree it probably
>    should be handled with EWOULDBLOCK and passed to userspace. Either with
>    a submit thread or userspace memory fences. Note that in practice you
>    will have a bunch of blocking left in the ioctl, stuff like mutexes or
>    memory allocations when things get really tight and you end up in
>    synchronous reclaim. Not any different from userspace ending up in
>    synchronous reclaim due to a page fault really. Trying to shoehorn
>    userspace memory fences or anything else long-running into drm/sched
>    dependency handling is just way too much a can of worms.
>
> - For the memory management dependencies, which are all dma_fence when
>    pipeline, I do think pushing them through the drm/sched makes sense. It
>    has all the stuff to handle that already, plus it's imo also the ideal
>    place to handle the preempt-ctx dma_fence scaffolding/semantics. Which
>    would give you a really neatly unified command submission interface
>    since in both cases (end-of-batch and long-running) you fish the
>    dma_fence you need to stuff in all the right dma_resv object (for memory
>    management purpose) out of the same place: The drm_sched_job struct.
>
> So I'm _not_ on the "do not use drm/sched for long-running jobs at all".
> That doesn't make much sense to me because you'll just reinventing the
> exact same dma_fence dependency handling and memory management shuffling
> we already have. That seems silly.

How about we stuff the functionality we still want to have into a 
drm_job object?

I mean that really isn't that much, basically just looking at 
drm_syncobj, dma_resv etc.. and extracting all the dependencies.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>
>>>
>>>>>>>>> And the reasons why it was rejected haven't changed.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>> Yes, TBH this was mostly to get discussion going how we'd best
>>>>>>>> tackle this problem while being able to reuse the scheduler for
>>>>>>>> long-running workloads.
>>>>>>>>
>>>>>>>> I couldn't see any clear decision on your series, though, but one
>>>>>>>> main difference I see is that this is intended for driver-internal
>>>>>>>> use only. (I'm counting using the drm_scheduler as a helper for
>>>>>>>> driver-private use). This is by no means a way to try tackle the
>>>>>>>> indefinite fence problem.
>>>>>>> Well this was just my latest try to tackle this, but essentially the
>>>>>>> problems are the same as with your approach: When we express such
>>>>>>> operations as dma_fence there is always the change that we leak that
>>>>>>> somewhere.
>>>>>>>
>>>>>>> My approach of adding a flag noting that this operation
>>>>>>> is dangerous and
>>>>>>> can't be synced with something memory management depends on tried to
>>>>>>> contain this as much as possible, but Daniel still pretty clearly
>>>>>>> rejected it (for good reasons I think).
>>>>>>>
>>>>>>>> We could ofc invent a completely different data-type that abstracts
>>>>>>>> the synchronization the scheduler needs in the long-running case, or
>>>>>>>> each driver could hack something up, like sleeping in the
>>>>>>>> prepare_job() or run_job() callback for throttling, but those waits
>>>>>>>> should still be annotated in one way or annotated one way or another
>>>>>>>> (and probably in a similar way across drivers) to make sure we don't
>>>>>>>> do anything bad.
>>>>>>>>
>>>>>>>>    So any suggestions as to what would be the better solution here
>>>>>>>> would be appreciated.
>>>>>>> Mhm, do we really the the GPU scheduler for that?
>>>>>>>
>>>>> I think we need to solve this within the DRM scheduler one way or
>>>>> another.
>>>> Yeah so if we conclude that the queue really must be bottomless then I
>>>> agree drm-sched should help out sort out the mess. Because I'm guessing
>>>> that every driver will have this issue. But that's a big if.
>>>>
>>>> I guess if we teach the drm scheduler that some jobs are fairly endless
>>>> then maybe it wouldn't be too far-fetched to also teach it to wait for a
>>>> previous one to finish (but not with the dma_fence that preempts,
>>>> which we
>>>> put into the dma_resv for memory management, but some other struct
>>>> completion). The scheduler already has a concept of not stuffing too
>>>> much
>>>> stuff into the same queue after all, so this should fit?
>>>> -Daniel
>>>>
>>>>
>>>>>>> I mean in the 1 to 1 case  you basically just need a component which
>>>>>>> collects the dependencies as dma_fence and if all of
>>>>>>> them are fulfilled
>>>>>>> schedules a work item.
>>>>>>>
>>>>>>> As long as the work item itself doesn't produce a
>>>>>>> dma_fence it can then
>>>>>>> still just wait for other none dma_fence dependencies.
>>>>>>>
>>>>>>> Then the work function could submit the work and wait for the result.
>>>>>>>
>>>>>>> The work item would then pretty much represent what you want, you can
>>>>>>> wait for it to finish and pass it along as long running dependency.
>>>>>>>
>>>>>>> Maybe give it a funky name and wrap it up in a structure, but that's
>>>>>>> basically it.
>>>>>>>
>>>>>> This very much sounds like a i915_sw_fence for the
>>>>>> dependency tracking and
>>>>>> dma_fence_work for the actual work although it's completion fence is a
>>>>>> dma_fence.
>>>>>>
>>>>> Agree this does sound to i915ish as stated below one of mandates in Xe
>>>>> was to use the DRM scheduler. Beyond that as someone who a submission
>>>>> backend in the i915 and Xe, I love how the DRM scheduler works (single
>>>>> entry point), it makes everything so much easier.
>>>>>
>>>>> Matt
>>>>>
>>>>>> Although that goes against the whole idea of a condition for
>>>>>> merging the xe
>>>>>> driver would be that we implement some sort of minimal scaffolding for
>>>>>> long-running workloads in the drm scheduler, and the
>>>>>> thinking behind that is
>>>>>> to avoid implementing intel-specific solutions like those...
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Thomas
>>>>>>
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>

