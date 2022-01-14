Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1148EF4D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 18:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6333B10E683;
	Fri, 14 Jan 2022 17:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2070.outbound.protection.outlook.com [40.107.95.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9ED10EEE8;
 Fri, 14 Jan 2022 17:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fq4SCY0IzU2/qS0Dw4rjvRrv7YgGaCMwMKsGCopLZdPqw0dpdqw4hra20KAio8H1ZYTfl3hOPnXhxI88VvAdLnbg0jGjT+3rWv/CwwD0oyuOKJ3B9CQM2AIun+6emcIT/n5eyB7JnAT6SvOXcWIM8DZrW6h4FOoHzYRm/nvQ5XC20RLtIn6r4l332jFQVPFo17tEZcgzkWA0ZJjhNb+OtBO5cxBW0YqyFFBHXN/H1GS4QIr1w19CwmZHlP629eG4hixK5xbw1NeaYG+HAU/FbW2HyAZAC8vhDtFzy/kuCuGGP74Iiopzwq94QYjZUOjU/3UKVQ33ecUdIiJ2z1i9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fak6EuMqqdlXUUqF3jx4at7xJGGv8gSL9C/QJ4nOBq0=;
 b=lmx1mQpJXDZk1KGzEl219lfdTH59auviKD9hCtmrVZtu/xKqWCtwmTtsvrV3AYhH8yeSomL9JkT5yA8tQfhTq+UcycTqrhn6HNcYfZZYyxBshERwsqoL63CZFcSHGKHrWf2dycI98qHJwQTP/VPCawtd3XA4t/kepSglE2I5cLGgd9OUO/BsOqfNWPfGFdeXQOlwQvqONrgrEaiwpLiAw3MVJfKaUzscnn500qWFCVhXVfdb7RR+GGQuPoJw9hz/BMJL0PBS1XImpe5rjjWWHseKF/twW2omkYcU2ufXvRtZnCeoZM8Fw7gtGL87src+R0XKW+AHMXqxqIZqnQbIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fak6EuMqqdlXUUqF3jx4at7xJGGv8gSL9C/QJ4nOBq0=;
 b=RLR9PhO/Ga0xktj9MJtc1Viax8gCI6kEmqyzHMtPjnqcdPLDK7L8AywfwMBYKIadgfZHGgmVdu7XuYeUiGY7wl9OV7cMB45n9kEX/bzxEupGxPxT8ygPHOOHd/842IRBA3hOLPRHzoRhh2HoP9p5QRSrkVB0GJEsoP0Vn0xnrsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4581.namprd12.prod.outlook.com (2603:10b6:208:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 17:41:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 17:41:00 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
 <386142cc-1df5-228c-af24-2187998d9307@amd.com>
 <b80efca2-4a51-7ac9-cc9e-e497ac7c9c7c@amd.com>
 <YeGoVhLgMDOJS15K@phenom.ffwll.local>
 <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
Date: Fri, 14 Jan 2022 12:40:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <92f1cc2b-d4db-6c50-d8a3-cdcd31127d15@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4618e8f8-0efb-4f36-85e0-08d9d785072b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4581:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB458190F077D87E9873110FD392549@MN2PR12MB4581.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xCLwG4JeekE659ZCv02yPeNPX0fJw+fDLugj3Cl0HGmF/rB54CyQHN1BgsYCL/f7BEsr4pji4a6gG+TJTt6xRla8KjX89zzd1Jmjmie3Y1Mjxwr8+Lnr5hdD8swPE6nyUG7u0q6jQNGK2BXPE0iVrTBj/i7rNzcyJNmNQLH/LjLGWd1NsoHgUKuiH2Ago0RoNN9AILOz2bdCn1GhffrlVE+y7s3TYBwkt4rafTUHtBQ0EpyNpP6C16I9+q3U4azt9z78caePAj4EUgs7S9ZjHIbb2Zb9EhB5rihZxFmehMnOiVweLyn5NJUfvmt97U/J+MLpq514seg6SnzrHP1UGgspcCrwsPOOj7ig5JPJbv8hTEbkbZOJhaIX25rsYoVvtLhh7SNh4w52Ilekdlb5UjP8GUk8wu/eIgSb7ouR2CPs02Lqf/kF4/iEPZJ3zk9n8z7Yd8IWwuEUE2hsrOJFvTJropV1r6Ah+yoqNY2bp0KreOYMd3GHq0ok4Rp0dCSCKUh/NxiexTBF00fjTaGiHc1HJtR0cyMBMtuTrSl9zxio6E9QEFnrs+7YVAU3PuLPRmlbE3vKWdQskQSmQu/StWc2FY+/hqzDpn97ixdp5v3NR+cIvbufjax2YCTKL5okl+oF2BfCY1e7Q4z1C/c+IE4Hhr3SZV3rFJS6SQ0XHbtNKMbMYM7UlRpy/M2an/2k8gZDyUlwm9c6qNeN9Bf/vvaZA7uajIMzJFywlyJzH+BmicYBRhz/HTt42ELrrWH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(6512007)(86362001)(66574015)(31696002)(6486002)(83380400001)(2906002)(66946007)(8936002)(36756003)(316002)(26005)(31686004)(6506007)(54906003)(44832011)(66476007)(66556008)(508600001)(186003)(110136005)(5660300002)(2616005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE1MakZsQzRYUUw0WEJlejcwUkNsODVuejNkRHJ2NEhMVGJiM0dZY1R1WDJO?=
 =?utf-8?B?Y3FJazlQZzVXSE1hMWJDa0hCTWVqZFRyS216VHFHOVRRZjQzUnNuWnBEbGFC?=
 =?utf-8?B?Q1BYQzFtYzdIYUlMU1d3Rk84U1RZeUd5ZDJ6SFp2WHZ2aW16YXBnS0hQK1M3?=
 =?utf-8?B?QkRWV1NVQjd3RUNyZFRMNTRzWE9vYUd1RGptLzd3UkEwYkkxNDVMK3cxWHZn?=
 =?utf-8?B?SDlKdWN4b1RZRENZekRMRlkyQW1JZ3BSN1ZtQk1DNGxWRXNIMFl5WWtTQlBi?=
 =?utf-8?B?QVozYjNVaThoWXZXQU9oZTJGVjdaM3VDUGhGRkprZFBvd3l2N0crSW1oSHVK?=
 =?utf-8?B?NmRyZHM4WnNMN1RJKzd6WjE0Q1kwVDlwdE4zRGZZbnRaYitEY1VxeVlIdjZh?=
 =?utf-8?B?R1htUlI4SU5TN2Urb2hhaUY0YWNLMk1abURGY09hNnZNZzgwVVFkYUxZRmRl?=
 =?utf-8?B?NFdISXBmbjk1MEJlOVhCWmxEdU8vMFEweWtEQ2RQWUliU1F2em5FL1JpWTAw?=
 =?utf-8?B?NzZESHJ2RzQralo2cUpPRjQrc2txSnFCSGZxRHNtbG9SMjFDSXhxaVd3S0hZ?=
 =?utf-8?B?L2p4c0RacGVWYzdXazdzUFIxOGxXNmpCN05ZUTdDanZYS2NhYVpmMlRYTWdi?=
 =?utf-8?B?OWJVZlIvaWVQaWhHLzloN3I0UXVUYlk1ekxGNWFqNE9iRXFNaFVOYlNMOWpP?=
 =?utf-8?B?VTNpb0h6Vy9ZczVsZGVybTRiaklMRGdBOGxXaEo1U1pqT3QrSEV2aHNhNkYw?=
 =?utf-8?B?ckdXWlgyM2cvTmJNMm5YeFp0MDJtYjM0ZkhWK1BkMndid3Uva21OUHpDSXBX?=
 =?utf-8?B?amlzR1ZVSjVWaWlkNGNQOVhmUWJ4VktoM3hoZ0ZpQjRxUHlQWEpVdThWaUZT?=
 =?utf-8?B?aC92eFdNSklWMllZZ3NidG9FbmgwVWZqVElxQWw3ODR1bHAxckpWNlJOYjFF?=
 =?utf-8?B?MmNhMzFWZklDTWowKzFJMzhqRUxWa3poa3lJSXF3TDZ0STBiOWkwcnZFRzVo?=
 =?utf-8?B?WHJzc2hRZzFsZWpFOVV0Zk9rSFAwcTJHS3ZEYURjL3ZTS0llOTZKUCtvUGt6?=
 =?utf-8?B?TTVvaWNadlhZQTZjdmJYZWtxZm4yNTlrWlFsZGdQdzU5RUhGeUY4cnlCWUJq?=
 =?utf-8?B?K01zazBraVo1bWpNdkFjN2hBM0M1MXJEcyt0cEtiQ1d2SEg4eERDTGtuV3RZ?=
 =?utf-8?B?OWZiZWVVSEVwbXAvZzlNck9adEUrNG1ZZlVENDhEcGpSdDY2WHJURStSQnBV?=
 =?utf-8?B?dytZS3FDU0lXaXlReVJ0MDhLbS9kOGx1NU9IL3gxT3k5aWZjSEV2WUJ2TFox?=
 =?utf-8?B?U3M3UXJwT3dOQTVpSlJEUjYzNGdnVzJJOFBBaXVSSWEzcWN6WDc1WUhWcmZB?=
 =?utf-8?B?UGk5a010TXlKeldTdGthajRicjdtYkJTc2ZNQVgzRlk0czdrb2ZWZ2pleXlr?=
 =?utf-8?B?MWUrMWVwTmd5OXlOY2J0L01jWXUrM0x6ZncyWWFOVjY5VTdXTE1laXZaMUpB?=
 =?utf-8?B?U3UyUzZQbHpQOUdveTFrM3JRbjl2S2ZKOGN1SWlqSURoNms2V2QzNHlJbHRT?=
 =?utf-8?B?aUpwMnVUVExaQUp5THc1ckN2VHppOElIeEtmLzJzZlUzMnArQ002a0prU2lN?=
 =?utf-8?B?cWNaZzVVbzB5aWxpdEtQckQvaEJLbWp3WUlXcFcrcnBIeko4aVYyc0o2d1g3?=
 =?utf-8?B?YUJSR3NHS0hNdG5adjN0RUhtT1RRY2NnZnZob2Vud0tYQkZ0QVU0U1ArZDd5?=
 =?utf-8?B?K3pTbVdLQkdQV3lCNlU0TE1pbDR6UDhZQlpYdXl2MEhHeklTRVRILzcwVXQ0?=
 =?utf-8?B?YXhVZEhidDhDeGlqdEVWcWFzamNlQWNOSHdZRzJOV3Y4ZmFwc1hFa2tiZERl?=
 =?utf-8?B?QjZNY2R6c0tlRVRGNDlRWkpjTTlqTGxSVmVDQWYxQXVYQTZwOGZIT3ZGeFE3?=
 =?utf-8?B?VUNMUXlldVdaaXY0a01GRFBvZVp2blAvZVg0OWY4bXh6dXl0Tjhpcy94NDgw?=
 =?utf-8?B?WURDWG85YVJZVFBXSldpTXA4R2g5MXFxWko4NkptQmVQSnF6bTNiUUMzd05x?=
 =?utf-8?B?U2lMcWxCRFh4c2lTVlAzY1JHTkdJNkN1TjVhTGdPMzJURXZxd1krK3lsRlhV?=
 =?utf-8?B?QTRoaEtoY01lNUxhTjNHZjFqV3picWhjMXA4eVhtSnFwVjZUeGczVmdkTnFm?=
 =?utf-8?Q?/AWCp7sbS/nixCYV6K8aJZQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4618e8f8-0efb-4f36-85e0-08d9d785072b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 17:41:00.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaaI/bGQjrkH+0JJcoXTUbhwiSPKROxNzJlEeZjMe0xHFzIzSqnvPE8Ohy+eETPYt+jOmwRESP1bZFfvYaZsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4581
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
Cc: daniel.vetter@ffwll.ch, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 dri-devel@lists.freedesktop.org, David Yat Sin <david.yatsin@amd.com>,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, airlied@redhat.com, Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>> Top post because I tried to catch up on the entire discussion here.
>>
>> So fundamentally I'm not opposed to just close this fork() hole once and
>> for all. The thing that worries me from a upstream/platform pov is
>> really
>> only if we don't do it consistently across all drivers.
>>
>> So maybe as an idea:
>> - Do the original patch, but not just for ttm but all gem rendernode
>>    drivers at least (or maybe even all gem drivers, no idea), with the
>>    below discussion cleaned up as justification.
>
> I know of at least one use case which this will break.
>
> A couple of years back we had a discussion on the Mesa mailing list
> because (IIRC) Marek introduced a background thread to push command
> submissions to the kernel.
>
> That broke because some compositor used to initialize OpenGL and then
> do a fork(). This indeed worked previously (no GPUVM at that time),
> but with the addition of the backround thread obviously broke.
>
> The conclusion back then was that the compositor is broken and needs
> fixing, but it still essentially means that there could be people out
> there with really old userspace where this setting would just break
> the desktop.
>
> I'm not really against that change either, but at least in theory we
> could make fork() work perfectly fine even with VMs and background
> threads.

You may regret this if you ever try to build a shared virtual address
space between GPU and CPU. Then you have two processes (parent and
child) sharing the same render context and GPU VM address space. But the
CPU address spaces are different. You can't maintain consistent shared
virtual address spaces for both processes when the GPU address space is
shared between them.

Regards,
  Felix


>
> Regards,
> Christian.
>
>> - Get acks from userspace driver folks who know real-world gl/vk
>> usage and
>>    khr specs in-depth enough to be able to tell us how much we'll regret
>>    this.
>>
>> - Merge it. Or come up with something new. Or maybe stick to the
>> Nack, but
>>    then maybe it would be good to document that somewhere in-tree?
>>
>> This entire can of worms just feels way too tricky to have it be handled
>> inconsistently across drivers. And trying to fix these kind of low-level
>> things across drivers once divergences exists is just really painful
>> (e.g.
>> trying to make all dma-buf mmap VM_SPECIAL or the herculeian task
>> Christian is doing to get our dma_resv rules consistent across drivers).
>>
>> Cheers, Daniel
>>
>> On Fri, Jan 07, 2022 at 12:47:45PM -0500, Felix Kuehling wrote:
>>> Am 2022-01-07 um 3:56 a.m. schrieb Christian König:
>>>> Am 06.01.22 um 17:51 schrieb Felix Kuehling:
>>>>> Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
>>>>>> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
>>>>>>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>>>>>>> [SNIP]
>>>>>>> Also, why does your ACK or NAK depend on this at all. If it's the
>>>>>>> right
>>>>>>> thing to do, it's the right thing to do regardless of who benefits
>>>>>>> from
>>>>>>> it. In addition, how can a child process that doesn't even use
>>>>>>> the GPU
>>>>>>> be in violation of any GPU-driver related specifications.
>>>>>> The argument is that the application is broken and needs to be fixed
>>>>>> instead of worked around inside the kernel.
>>>>> I still don't get how they the application is broken. Like I said,
>>>>> the
>>>>> child process is not using the GPU. How can the application be
>>>>> fixed in
>>>>> this case?
>>>> Sounds like I'm still missing some important puzzle pieces for the
>>>> full picture to figure out why this doesn't work.
>>>>
>>>>> Are you saying, any application that forks and doesn't immediately
>>>>> call
>>>>> exec is broken?
>>>> More or less yes. We essentially have three possible cases here:
>>>>
>>>> 1. Application is already using (for example) OpenGL or OpenCL to do
>>>> some rendering on the GPU and then calls fork() and expects to use
>>>> OpenGL both in the parent and the child at the same time.
>>>>      As far as I know that's illegal from the Khronos specification
>>>> point of view and working around inside the kernel for something not
>>>> allowed in the first place is seen as futile effort.
>>>>
>>>> 2. Application opened the file descriptor, forks and then initializes
>>>> OpenGL/Vulkan/OpenCL.
>>>>      That's what some compositors are doing to drop into the backround
>>>> and is explicitly legal.
>>>>
>>>> 3. Application calls fork() and then doesn't use the GPU in the child.
>>>> Either by not using it or calling exec.
>>>>      That should be legal and not cause any problems in the first
>>>> place.
>>>>
>>>> But from your description I still don't get why we are running into
>>>> problems here.
>>>>
>>>> I was assuming that you have case #1 because we previously had some
>>>> examples of this with this python library, but from your description
>>>> it seems to be case #3.
>>> Correct. #3 has at least one issue we previously worked around in the
>>> Thunk: The inherited VMAs prevent BOs from being freed in the parent
>>> process. This manifests as an apparent memory leak. Therefore the Thunk
>>> calls madvise(..., MADV_DONTFORK) on all its VRAM allocation. The BOs
>>> that are causing problems with CRIU are GTT BOs that weren't covered by
>>> this previous workaround.
>>>
>>> The new issue with CRIU is, that CRIU saves and restores all the VMAs.
>>> When trying to restore the inherited VMAs in the child process, the
>>> mmap
>>> call fails because the child process' render node FD is no longer
>>> inherited from the parent, but is instead created by its own "open"
>>> system call. The mmap call in the child fails for at least two reasons:
>>>
>>>    * The child process' render node FD doesn't have permission to
>>> map the
>>>      parent process' BO any more
>>>    * The parent BO doesn't get restored in the child process, so its
>>> mmap
>>>      offset doesn't get updated to the new mmap offset of the restored
>>>      parent BO by the amdgpu CRIU plugin
>>>
>>> We could maybe add a whole bunch of complexity in CRIU and our CRIU
>>> plugin to fix this. But it's pointless because like you said, actually
>>> doing anything with the BO in the child process is illegal anyway
>>> (scenario #1 above). The easiest solution seems to be, to just not
>>> inherit the VMA in the first place.
>>>
>>> Regards,
>>>    Felix
>>>
>>>
>>>>> Or does an application that forks need to be aware that some other
>>>>> part
>>>>> of the application used the GPU and explicitly free any GPU
>>>>> resources?
>>>> Others might fill that information in, but I think that was the plan
>>>> for newer APIs like Vulkan.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Thanks,
>>>>>     Felix
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Regards,
>>>>>>>      Felix
>>>>>>>
>>>>>>>
>>>>>>>> Let's talk about this on Mondays call. Thanks for giving the whole
>>>>>>>> context.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>>       Felix
>>>>>>>>>
>
