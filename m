Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4C6D7CCD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926D10E93E;
	Wed,  5 Apr 2023 12:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5423510E938;
 Wed,  5 Apr 2023 12:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HY6erHXNYzshs0ORdq3qm7CO5EQGh0ea70xraFWFgJbVbodrsRWJ3M8VjmribRCL41xy8sE6um2sCc3Z+EXWk2EuPDvH/zHiArzeApoXw3oW6eZMc8oEFq0NYEtLSGagDE4jr98Wv6kdgg7Qd6wtsRdLylt9hqslQgXa2OOfDw/NqnF0y2A5krcXBupvOFkfMgfsvVLiUYsjhHcvTYW2APdedEFfSBR6OPn5Bp3NCz9JbYUrzWWTpP/EHEO9atPv2flXGYyKB8rgWNmp2Ip4fHXGXIpJOqiky4izVayeuZGG2w/eHnse39p5cNQ/xShYVPdNJBJEbQLSaeT/JOD//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j+0pjvwwX1y8Dpv1jijIpbwxMVwU2QcieNW8fWmRFk=;
 b=A2dCW1NH89NjrJgZ4uj9HR8dB0jBxUENKLdAQAJsllrU5bYce/XxLanpDW/k8WB5x47Tpnv8WB7ncCDiqGnxnNS/5DGGmj0/Gd5EG4tnsiYUD1+1g6sYGnzb3eEIV5TP9Fp5ATj08duCKTWsCb5UsaVZ4sV2109NK9rx9Ai4RF0AzyxOwMcx/1bOhGEwewqIcqZ7Dmn0aoD7BhNWU4qlnBYyJTRBDt6lwaKvfQUXnLTp6lFoM7c3WlNB4PSGsZTEWEWd6g/rcHOZDOT9Ro11dgIb4OM1gELDaKqPbPG17W8ypTNOSzel1FFRBe3y7GPd3hpz6+9DZTF3qkHf47I2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j+0pjvwwX1y8Dpv1jijIpbwxMVwU2QcieNW8fWmRFk=;
 b=5CEtdc1qhj4jJ/Jje3bICA7cL1qhMhDrRtAO1S+2WvNEmZCSbY4JdrGC/KJwcLsbfCgTa+NKebzDwXW6QWH6R1x37p+NCHUevit7zU8fod85WYsU9O294eSnFIwaQ8F7b7ag8PnY+ocGfTSa0fNYcuBzwuzt7YTqW3FxxGrn+Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 12:39:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 12:39:41 +0000
Message-ID: <c57a9fcc-7721-9958-38f5-b3a1b0b56772@amd.com>
Date: Wed, 5 Apr 2023 14:39:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <cece14bb-d3c5-3772-855e-bac0bb7766d7@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cece14bb-d3c5-3772-855e-bac0bb7766d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b155943-3f13-40fe-e0a3-08db35d2d380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfKCEMgNqjnMyUf5M84IT5qlKDJWJS+kU9j6kRTfK8iZbFRB9jYUPZBoS3EYO3hEb+PoFPghovD6ZeaVS475X9VKvPEaRS2NSxfiAP40BIdEwEkQTPZfQprYfLTRdf9dB6Ue70yssSsgMdwyrJAPpPhTtAzceGzKn6FiX0vGmiatUltYDMJ73RkznHyAM12yrdjNLIbzz4WCNxb5Xa2DhU/5AokD4loMsa4tuRVhQH95qIpw1UV2i4jocLrFpin2oSyPeMNz3ZpnhFs990zX2Vdjdu9kYYsJJ6ibB8ITmNvMhdOiCMRN4jekT7QL01exq+s5NFsK17jG4pVF7fYg0tQKPovu4tV+sDVPGnUsiQ5raKSo/Hfq59hQqsyLafhPIcUIBS7Xj5uKva+ji8S7mcJWjSrPCSOwdoLdglSNZArKsXpEhUY9ZAA8v3JXr0I7g5bpgKXQ5jfsnj1Z59UubNj44kOH4d35SPumXaF4kUuJWZWl4eYZiq0su2MlooznoXlazdYQmMooon7yWv4UJgv/V8eqyTD862ES3Ig4bSV64FGLiiYL220sgTVLs/6Iw5l77gm+R+xyvA8Dvmaw451cvIjvQ12APe5MszjVvnKA2Yz90OOgHS3CsBEtSYHHHaVIJbPRongfEZ8Qi7+2wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(38100700002)(5660300002)(7416002)(2616005)(6506007)(83380400001)(66574015)(186003)(31696002)(316002)(110136005)(6486002)(86362001)(53546011)(478600001)(6512007)(6666004)(966005)(36756003)(66476007)(41300700001)(8676002)(4326008)(66556008)(8936002)(66946007)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU1NU3YrOXV5THVvWld5UTBEOHBsQmc5elFlWlpNT3AwakpFREg1eU9YZytS?=
 =?utf-8?B?bnozRW1xQ3VMemhnTUd4Qk1KaVJWRStpVmpVSFg5WXlEQVFYZGY1T0dzbXRD?=
 =?utf-8?B?akRtQnRlNFlPZk5UUTBCVHBIaGl2SWNHdzllcTBHNDNvUU01L3JtMHFSQmpM?=
 =?utf-8?B?OXg2c3JRdjMyL3RzVTd2akJrS3VwR2tac1c4cUQyeTZIdlBnSFN3OC83TnFC?=
 =?utf-8?B?V2JmdWIxaWJKRTVmSkFWTlZJZHFacXJkU0VkVjlMbjFzcnJ1VytvdWRJMzFn?=
 =?utf-8?B?MCtXenBNMncrTTMxZnRUMHFYb0UwRWZ3R0t2WGl6SXo0ZEtOblNMaTdmUFRP?=
 =?utf-8?B?eXJnd21xQ1FYZk1FUUVpRGdnMDFPT1BQcFk3bklUS21LRjR5diswR3pjbmhW?=
 =?utf-8?B?T0NYR2pUUGlVSnppMzFOMGpOdkhya0MvR3NhcnNESk5yZlZvZUNCSFI4bHpu?=
 =?utf-8?B?T2RkcGtYMXB4YlN5czY5THpscmZFSm9aR3hzV3AybmZueU9ZQ2l0aGRMblpE?=
 =?utf-8?B?Qzhjd0FuczRRVEtsZmcwaFVtREdMTGd1cWV5TDl6QkFwR1FnRFVxRXdCRy9Z?=
 =?utf-8?B?VGpMSTlsalJFQWRmT1NmMno4VXdGTDFmNm8yVGJ4bkh4aCtPMzVzcURIYjV3?=
 =?utf-8?B?V1JBWkpUQlZxUVc0SkxTaWRiUDI2Z2Jhd0xvMDcxQU9CeFRmWkxQNDNZL3Rj?=
 =?utf-8?B?TVFwUENOOGJIOEZLUldsalIrNGs5cEZzblZqeXhJU1RSWUdMdEY1ZEI1Mk5l?=
 =?utf-8?B?ZmpDekdDNzlpZzNDeFZaZkFUMkVBdjE1RzFURjVkNGprSy9mUjlML1ZNaUlI?=
 =?utf-8?B?LzBXNERsTWt3RU9hSmQzcU9rVG9yMDdJMWoxck0wUTNaNllnYlBvQ0lmVk5H?=
 =?utf-8?B?SFJtcFZFcmEyVE9qRHlGcWNhaVd4K01lNFhKNUYrT01JeVdsb2xlN1J4cGla?=
 =?utf-8?B?UFpQRFJ6WTBvQnZ3UU1tL21JeHQ5ckUxell4Z0tJNFByRFZoUTJ5dHJXdVJH?=
 =?utf-8?B?RkljV0gxb0Z1SnZHeU5PLy9uOGUzL256bzJlTkNibGplSXdNZ3pCV25zZmll?=
 =?utf-8?B?eitOY1dENGNsd3lsZE4xcTRkQXBQQVBJeGF2MzRFeHVWOE03elhuYVl5SEo4?=
 =?utf-8?B?UC9HL21ZSlpDenZEYUUreVUzSHcyaUZnL0VobDcxNXpNRFFsazJtc1VEdHdm?=
 =?utf-8?B?S3JzNENqdFg5c3ZaNUc1Zy9SdlNvTTBwdUlDMGZmcmhKZW1kb05OOGpHNTBt?=
 =?utf-8?B?ckk1SExNY3paTk5wQmNzYzV3em9hZ2pHc2RwQTU0YzNxRWE3QjBpUzMrRHBY?=
 =?utf-8?B?NnByUVVPVGpTUG9jdW1MdmN0ZlVERjl2NHNTOFJUQXlNSEVrNWg5L1VXWjds?=
 =?utf-8?B?UjBzcFNzN09UbnFqYXRucVVGUGpxWUF0YzlabzlGYlc2WUlQdGJCSWJQWURw?=
 =?utf-8?B?TnZabHlFNWUyczdONGV5b3pNOVlyYUUzM1hjaWhvZnNPYzlPVDlVbzBNbUZP?=
 =?utf-8?B?cE95alZMY0NEK2dzYjVkRFo3U3BOcVZVR2FnVEM1TkNYeUNRU3g1Z1FOVGR1?=
 =?utf-8?B?aUlzenM4UTA2MSsyNUdtaDQxS0xNUGZpdFdJbVAvSnVoZSt0dWUwRjlmYmhF?=
 =?utf-8?B?YzBUZDdubTA4Z1Z4Q0diQmF0UXR0ZjBqeGNGMkxMRWRLZ0phUGhIblY1OUt5?=
 =?utf-8?B?N3QrZysrMnN5dElYbk01eDFtVWROTzlGSFIxZHNVSWhYSk4rVUZyYlZGV2Nw?=
 =?utf-8?B?cVI5bkcrN0QvOW5zY2hLblk1RHJBby96R1hGR2d3Z0NXcUJTYWhqNkdaZ2N0?=
 =?utf-8?B?UnU0MEN5enZONEUxQ2cvNVVaNEZVSWdXQVZCdXdac0FWWGk5M1R5WmhvSlkx?=
 =?utf-8?B?Zkwzd1lOT2tySzY4aGpFWWlQckxzTi85TFkvTE1POEdyMTYzTlF5Z3V5MmZH?=
 =?utf-8?B?QUNIM1ZOdjh3dG1udUdZTWUwU1RFQUxiQUl2K0Z4UTlYaFRrZWNEU1liLytu?=
 =?utf-8?B?dzk3d1ZiY0FLb0xRaGQ0bWJTdms2UUhybEw2cTBRRTdtNjVBZFhSaWI0dmhF?=
 =?utf-8?B?aW10N3M2TGREdThjNm5tbzRPTlJPbGxabmp3cHVMQXNFaVBWM1daSEcyN1FZ?=
 =?utf-8?B?Wmp3Z09aNmlNU0hYVDlSS2tzcjZJS1g2QklWc3lXTlJ6WHorQnBaUk81WlpN?=
 =?utf-8?Q?jvD7YHIZx+MYlb+lUKNiy67ZCraC+an6N/DnRVlJWrgK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b155943-3f13-40fe-e0a3-08db35d2d380
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 12:39:41.2998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUVdTG37dHlXcADrKF6iIrT/HuorbXkfFpVCMKmhWQK2SYw4BPs/810/MgELsQn4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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
Cc: robdclark@chromium.org, airlied@linux.ie, lina@asahilina.net,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.23 um 14:35 schrieb Thomas Hellström:
> Hi,
>
> On 4/4/23 21:25, Daniel Vetter wrote:
>> On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
>>> On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) 
>>> wrote:
>>>> On 4/4/23 15:10, Christian König wrote:
>>>>> Am 04.04.23 um 14:54 schrieb Thomas Hellström:
>>>>>> Hi, Christian,
>>>>>>
>>>>>> On 4/4/23 11:09, Christian König wrote:
>>>>>>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>>>>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>>
>>>>>>>> For long-running workloads, drivers either need to open-code
>>>>>>>> completion
>>>>>>>> waits, invent their own synchronization primitives or 
>>>>>>>> internally use
>>>>>>>> dma-fences that do not obey the cross-driver dma-fence 
>>>>>>>> protocol, but
>>>>>>>> without any lockdep annotation all these approaches are error 
>>>>>>>> prone.
>>>>>>>>
>>>>>>>> So since for example the drm scheduler uses dma-fences it is
>>>>>>>> desirable for
>>>>>>>> a driver to be able to use it for throttling and error
>>>>>>>> handling also with
>>>>>>>> internal dma-fences tha do not obey the cros-driver
>>>>>>>> dma-fence protocol.
>>>>>>>>
>>>>>>>> Introduce long-running completion fences in form of
>>>>>>>> dma-fences, and add
>>>>>>>> lockdep annotation for them. In particular:
>>>>>>>>
>>>>>>>> * Do not allow waiting under any memory management locks.
>>>>>>>> * Do not allow to attach them to a dma-resv object.
>>>>>>>> * Introduce a new interface for adding callbacks making the
>>>>>>>> helper adding
>>>>>>>>     a callback sign off on that it is aware that the dma-fence 
>>>>>>>> may not
>>>>>>>>     complete anytime soon. Typically this will be the
>>>>>>>> scheduler chaining
>>>>>>>>     a new long-running fence on another one.
>>>>>>> Well that's pretty much what I tried before:
>>>>>>> https://lwn.net/Articles/893704/
>>>>>>>
>>> I don't think this quite the same, this explictly enforces that we 
>>> don't
>>> break the dma-fence rules (in path of memory allocations, exported in
>>> any way), essentially this just SW sync point reusing dma-fence the
>>> infrastructure for signaling / callbacks. I believe your series 
>>> tried to
>>> export these fences to user space (admittedly I haven't fully read your
>>> series).
>>>
>>> In this use case we essentially just want to flow control the ring via
>>> the dma-scheduler + maintain a list of pending jobs so the TDR can be
>>> used for cleanup if LR entity encounters an error. To me this seems
>>> perfectly reasonable but I know dma-femce rules are akin to a holy war.
>>>
>>> If we return NULL in run_job, now we have to be able to sink all jobs
>>> in the backend regardless on ring space, maintain a list of jobs 
>>> pending
>>> for cleanup after errors, and write a different cleanup path as now the
>>> TDR doesn't work. Seems very, very silly to duplicate all of this code
>>> when the DRM scheduler provides all of this for us. Also if we go this
>>> route, now all drivers are going to invent ways to handle LR jobs /w 
>>> the
>>> DRM scheduler.
>>>
>>> This solution is pretty clear, mark the scheduler as LR, and don't
>>> export any fences from the scheduler. If you try to export these fences
>>> a blow up happens.
>> The problem is if you mix things up. Like for resets you need all the
>> schedulers on an engine/set-of-engines to quiescent or things get
>> potentially hilarious. If you now have a scheduler in forever limbo, the
>> dma_fence guarantees are right out the window.
>>
>> But the issue you're having is fairly specific if it's just about
>> ringspace. I think the dumbest fix is to just block in submit if you run
>> out of per-ctx ringspace, and call it a day. This notion that somehow 
>> the
>> kernel is supposed to provide a bottomless queue of anything userspace
>> submits simply doesn't hold up in reality (as much as userspace 
>> standards
>> committees would like it to), and as long as it doesn't have a 
>> real-world
>> perf impact it doesn't really matter why we end up blocking in the 
>> submit
>> ioctl. It might also be a simple memory allocation that hits a snag in
>> page reclaim.
>
> So it seems the discussion around the long-running synchronization 
> diverged a bit between threads and this thread was hijacked for 
> preempt-fences and userptr.
>
> Do I understand it correctly that the recommendation from both Daniel 
> and Christian is to *not* use the drm scheduler for long-running 
> compute jobs, but track any internal dma-fence dependencies (pipelined 
> clearing or whatever) in a separate mechanism and handle unresolved 
> dependencies on other long-running jobs using -EWOULDBLOCK?

Yeah, I think that's a good summary.

If needed we could extract some scheduler functionality into separate 
components, but the fundamental problem is that to the GPU scheduler 
provides a dma_fence interface to the outside to signal job completion 
and Daniel and I seem to agree that you really don't want that.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>
>
>
>
>>>>>>> And the reasons why it was rejected haven't changed.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>> Yes, TBH this was mostly to get discussion going how we'd best
>>>>>> tackle this problem while being able to reuse the scheduler for
>>>>>> long-running workloads.
>>>>>>
>>>>>> I couldn't see any clear decision on your series, though, but one
>>>>>> main difference I see is that this is intended for driver-internal
>>>>>> use only. (I'm counting using the drm_scheduler as a helper for
>>>>>> driver-private use). This is by no means a way to try tackle the
>>>>>> indefinite fence problem.
>>>>> Well this was just my latest try to tackle this, but essentially the
>>>>> problems are the same as with your approach: When we express such
>>>>> operations as dma_fence there is always the change that we leak that
>>>>> somewhere.
>>>>>
>>>>> My approach of adding a flag noting that this operation is 
>>>>> dangerous and
>>>>> can't be synced with something memory management depends on tried to
>>>>> contain this as much as possible, but Daniel still pretty clearly
>>>>> rejected it (for good reasons I think).
>>>>>
>>>>>> We could ofc invent a completely different data-type that abstracts
>>>>>> the synchronization the scheduler needs in the long-running case, or
>>>>>> each driver could hack something up, like sleeping in the
>>>>>> prepare_job() or run_job() callback for throttling, but those waits
>>>>>> should still be annotated in one way or annotated one way or another
>>>>>> (and probably in a similar way across drivers) to make sure we don't
>>>>>> do anything bad.
>>>>>>
>>>>>>   So any suggestions as to what would be the better solution here
>>>>>> would be appreciated.
>>>>> Mhm, do we really the the GPU scheduler for that?
>>>>>
>>> I think we need to solve this within the DRM scheduler one way or
>>> another.
>> Yeah so if we conclude that the queue really must be bottomless then I
>> agree drm-sched should help out sort out the mess. Because I'm guessing
>> that every driver will have this issue. But that's a big if.
>>
>> I guess if we teach the drm scheduler that some jobs are fairly endless
>> then maybe it wouldn't be too far-fetched to also teach it to wait for a
>> previous one to finish (but not with the dma_fence that preempts, 
>> which we
>> put into the dma_resv for memory management, but some other struct
>> completion). The scheduler already has a concept of not stuffing too 
>> much
>> stuff into the same queue after all, so this should fit?
>> -Daniel
>>
>>
>>>>> I mean in the 1 to 1 case  you basically just need a component which
>>>>> collects the dependencies as dma_fence and if all of them are 
>>>>> fulfilled
>>>>> schedules a work item.
>>>>>
>>>>> As long as the work item itself doesn't produce a dma_fence it can 
>>>>> then
>>>>> still just wait for other none dma_fence dependencies.
>>>>>
>>>>> Then the work function could submit the work and wait for the result.
>>>>>
>>>>> The work item would then pretty much represent what you want, you can
>>>>> wait for it to finish and pass it along as long running dependency.
>>>>>
>>>>> Maybe give it a funky name and wrap it up in a structure, but that's
>>>>> basically it.
>>>>>
>>>> This very much sounds like a i915_sw_fence for the dependency 
>>>> tracking and
>>>> dma_fence_work for the actual work although it's completion fence is a
>>>> dma_fence.
>>>>
>>> Agree this does sound to i915ish as stated below one of mandates in Xe
>>> was to use the DRM scheduler. Beyond that as someone who a submission
>>> backend in the i915 and Xe, I love how the DRM scheduler works (single
>>> entry point), it makes everything so much easier.
>>>
>>> Matt
>>>
>>>> Although that goes against the whole idea of a condition for 
>>>> merging the xe
>>>> driver would be that we implement some sort of minimal scaffolding for
>>>> long-running workloads in the drm scheduler, and the thinking 
>>>> behind that is
>>>> to avoid implementing intel-specific solutions like those...
>>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Thomas
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>

