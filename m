Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028EC490A87
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C09510E2D7;
	Mon, 17 Jan 2022 14:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2050.outbound.protection.outlook.com [40.107.212.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8C910E2D7;
 Mon, 17 Jan 2022 14:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDM8P7zJxpoiFp1iBYI6VXvLjR+VOF3+AuVmrRqYWA4S0iwZpTa/XkIL1ryzMAqgEBjj5PQa3iGSsPdTvPxoRtaJrnznyD5E7SUgP05mqCB3JVVm/I4JrdWYgMM7K63rUs+P9WFCGHl8MhiNofi7L9zy+L3ojmoiiuGAy7VaZVIfi8LZcMpiQ2nfsmT28tVwlzbnCbWMAOKRU9wzwbktvlrW49DNjU6CXCwyaE5Cf8wS2yu+0ZNlfL7b+eslpi8HnnP20dHJkHUno3icps8GF+WcA/G2SCh8PEmtrj28VTDyHQ/2N9X0w7olYW9Xqlm/apmAhd3YIZVHtBW3VdjY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hjOJH+6z45U0V3o12xrK93jWXtq1sRcTYqTe3wQNL4=;
 b=O468En0fyIrwF6jwcWK153A8RaYB7e4IPc/EK3qjA2+Kq/qqhJHNTjguQpXaSMVWwqKo4/ieFAJR1seffeVkmlRKL1nWqeRpqel5xRFfd/ALdCeB5hk5wWvdEd+Z1rGt6Y5Ob6fA1FUP6YOW6lnnnFFQwEEIM6TuMrzevGhVL22e+7Ew+fj1MUWi5qKig4httQYZxw/WDDirkEVpdbo2uCdu6w2NUeMN1Hf0whDgeD3XLL6jAOmwxP2L9Bm7Fp4L9t1n85T98R7xqNfdZVccfCyEq+O53MXn4AXv36vVeCnFbFWLY8liumny9tt14gHsuLmeRdIcqbBdRO5Cceo3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hjOJH+6z45U0V3o12xrK93jWXtq1sRcTYqTe3wQNL4=;
 b=wdtCnIv6uGAE7mooC3fNnTmCn5+V97Pq9wN14dir7VIiWLHk28G/W96Bwm/Nbcy03Yq4NRiodLi8WEgJ0HxzEz2349W/kgUC9lo8CBrHMBEcnOr7mTY8kDqIZoHzF8gl4cH7gY0KWXvxxZ79lBqMTuoMUJQxFu4TjDOYzggY0G8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH0PR12MB5467.namprd12.prod.outlook.com (2603:10b6:510:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 14:34:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 14:34:39 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
 <63c48a97-aa76-0a3c-0c68-97de628b864c@amd.com>
 <387a53c6-8ec0-ff6b-aaa2-34398f36a369@gmail.com>
 <0210e651-cc71-c1d2-5166-7473f664f405@amd.com>
 <d0e694a7-4a16-7e9f-7058-beec32ab1717@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3028607c-59be-6c23-73e2-0136f5d01ce4@amd.com>
Date: Mon, 17 Jan 2022 09:34:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d0e694a7-4a16-7e9f-7058-beec32ab1717@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82c0cb1c-28d9-455b-a49f-08d9d9c67e35
X-MS-TrafficTypeDiagnostic: PH0PR12MB5467:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5467FEF15B54B4DCDE35CC5492579@PH0PR12MB5467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1FYG1eCTlTaXJ6roUuuoSJwvf2Q4l+rtPiGDRJbZy5LpHO5OrqG8sStQUaqZwL0vzAnHGTjjgB7oVVCASPNo2B/6gks5ifFwnGpk498jFohP4BWxujVGgur+XuS7JSUJYKcSoTAbkx4WAjcnl8AEtMkQfl80RpefFRqi7DQvjAulrxCpjGvDJYoEEnaSASX8udyGjrTrzkrXfGcZPS679UZHSdm309xP/gS97lJL+JPKPE1KqZtyRxLMUpLNGdY2KtZS59qEgRkHA6Z8FWFoHM5RG+7SXLUqNqPxwqUikLJXfL9l9lI1BqN7Y8oH4dA6AEbyGUajZNQ0kbGedOPkR5L3vbXk9UFSJrm0K/pTUgOVYC73JpZdJtRtUyovVtL9mLfNCU60mOcJ6B0NpvrCHqRSerZEsZNoCcsRX9SiH1+9ltlMFPbSPx2h1VkQM4toB0xO+YkhV60H47fjSq9m8hIKJmpksUqksEHtIEx7Pe6a7fWrR6zumDpUeEg5fmdc1P5Yht9HkgSpd9nRPBRN65GsDg/hbXD+1hrMrh3sLzlKFqPI0mi6Z72OxZRXAhWuy/SdHSMtjd357wOK/y0e3WmT1jS4Ar7uH6WY6nPqGyurCgj5RHSjvxb4V/nnhI97s5ZyC9ONAz6eakzM28JgkXsU/PUVDhHCsBl4G+wnyqinompKn/kPB/IDYMpQBfWit21WQBUodRqmuqda21/wLIY2wueeq6Cr/bywdaT8Zya7ckz+uhrgrrR6pynZWG+moRz3XuASjvWaCcZmTIeeeZiMZPTzZTjdj9z9bjZZfCL846bBp5bDSPGmulgJOKv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(26005)(54906003)(31686004)(186003)(36756003)(6486002)(83380400001)(2616005)(316002)(508600001)(110136005)(6512007)(44832011)(66946007)(8676002)(2906002)(966005)(31696002)(6506007)(66556008)(66476007)(38100700002)(66574015)(4326008)(86362001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEE4REdZNlEwZkZvNWcydmlpT0ZDcTd6MEFLMkZQOFljTmhhV09oV21WM3Fn?=
 =?utf-8?B?ZmFxb2llSDhiaE1jbUl6cUNJWWM3ckcrdW54bnFHQlcrclNCaHdRdGNvK3pW?=
 =?utf-8?B?Sms5alplOCtjMDlvK2ViM2pwbm96NHVuTnluSnpHdFBMQTY1b2Ftdmhob2dl?=
 =?utf-8?B?SnhBSDZPRm5XSzk5TTdncktGdzI0S2VUQWZGVFJUcDJ2enlwSTduRkZJaUNa?=
 =?utf-8?B?R0FHWVUzZ0hvblZ4d01XaWFPM2ttUlRySWwvTVVJSmpzUXRLaG9pckhuRStQ?=
 =?utf-8?B?bWwwV2xRQzBIODh2dk1tbG1xSmdhT3dyUlJWdnRVdVdZdWpqNFlLNy9MRmMx?=
 =?utf-8?B?Z0FZT2kwOUN5Rm5XUzRxOWVmSnE2OHd1K09jZFZJcnFBR0xtNC9sTEtiTWg1?=
 =?utf-8?B?MFpRbERyWXIxRWVLQ0tJZG83OC9RV25OUHdWYUJSNTdtOGhHdy9qa0dpOE1X?=
 =?utf-8?B?dDg1aTVTQUJOc2RYQ3BsMzl6MENVdGpNZDgwVlAyL1l4U2tCWTJFYjRScGtU?=
 =?utf-8?B?dldEMEgyQnAxam1tQWxhenVPWXlzbVBDUlY1WHg5MWJqamF4Y214VEtrcSti?=
 =?utf-8?B?b2JMdjBiSTNaUXU2MlhobHJHd09BQU0xT0k3K0Zrd0tIWnFNZU9jTkZOR1o2?=
 =?utf-8?B?ZVFlMkt1bWllS0U2YzNlRng0NjAxRzNhT0hMNlpmQWs1K0lsMUQ1UUR4aXNX?=
 =?utf-8?B?Nkw1V095bEVKYkJGZ2FLdGZMYVJQYzRiNGNqbEZ6alJ2aUwzUDFaT0VDdXJ6?=
 =?utf-8?B?dm11cjVDYTVUZS9hKy9ldDNkNXIzWTlmTVRjdUx5ZW8xOW4yaFMzSFRCaCto?=
 =?utf-8?B?a3RGbDhYWmVjNE5lSWtKNnFDSU9MT2MzSndBckhzOVFjUlVLWnYwVU51UTJY?=
 =?utf-8?B?MnNVUTd1R2dZT1l6SWNXQVIzOEJoRjhERWNqNjl3WkhLU25DZitEQTlkOC9T?=
 =?utf-8?B?Y1o5RU9uOEdPNmdleS9sdU9QZGx5dEllRlZQYlN0TXhKZ3ZvTU4xWFFVVW1K?=
 =?utf-8?B?U0tNYjJZRWYzTW9NbW4yNks2a3BNYVdRZ0hTNjBtT0kvM3dFRHJDR2tEd2xr?=
 =?utf-8?B?TzZqUFQ4VTNiS2VCVTZGcFBmbnFBSFdYSzRsc3BtNm1qL3BMMXZIVmV5azBY?=
 =?utf-8?B?cmJNbXkwbkdJeENWck1lL0RFci82RHhiRk1rcE5xZGNBTmx3Q0tPWkVVZ25v?=
 =?utf-8?B?S3ppeVBPQ2xZRFQwKzNjY3lvbTVXSTBRMmxFK1F3eFVFdUZuT0dVanJCOEJW?=
 =?utf-8?B?TnZ0U3dWdVlPSjZkZXQyUTB6NE1CRVRlQ1ZlS01MblZ4WDlpdGZXeGpEZm5y?=
 =?utf-8?B?c0xsL1owSGMvOGRxMXlORWRFb2FUMjQxTzlkOWRneWUva0FwWDN4L210ZmpB?=
 =?utf-8?B?d3duNlI2RjEzOFYvWXRGVDJRSy9Sa0pIRlZ0SE1vMjhKbzZ5OVoxL3dROGpC?=
 =?utf-8?B?TVgySWw0RlFGZEI5UlRLcE1McllwV05vYVZ5bkxlVzQ2REhJVVluWHJiR1NO?=
 =?utf-8?B?aXJrQm81T1JCOFEvU2UybWZRUXRJZThnTGcvSFdodkpJUGxlaFpNRlhDQjNl?=
 =?utf-8?B?RW55eHRjdnlRaUdlSzNEQUdkR3ZESGdFMG5tNTRXaTlGK0hpcG1TZHdhNUR4?=
 =?utf-8?B?MGVrSDdqcmk2akg2MjhBWGNKZkVPM3pmUXREelBCUHFBVTdFamYzVHg3Nks2?=
 =?utf-8?B?TGlWZjlmVjV6U3VSRUxuMnBTTVhGbTFLc3MvdTFXbmdpcjlRTWVDQmZLZ1JN?=
 =?utf-8?B?WUlReWhTS01YQlNWZWZGSzFCOFRPWVJIM1JEVzFzVFZBUXZBOCtMRHpYU3hu?=
 =?utf-8?B?Y3BLTmw2UFRiOXlKbm5MeElWcGhiMndWZWUvaFRQTk0wMG5JbXMvbGhwMnl1?=
 =?utf-8?B?aVZxVFh1N0NOcG1ENkRjMFVQa1J0Tk1lWW1uQ0VOQnYvNDJSeHhqVkRFYTdx?=
 =?utf-8?B?TkxJMGoxNzJCa3d4WFNQNUlEUG5IendSWDNuZFcvbWs3MGU1VVoxa2tCLzdw?=
 =?utf-8?B?N1Z3VUpoc2RWT1hxZjcySGhoTW03L0t2M0I2cVBpUlNZRjdFd0c4TS9FL1R2?=
 =?utf-8?B?L2VwaytQNnVaek5JMURBdXBLdWJFUGVQdXQrT3I1SGZnSWhaQXYwb0haZHow?=
 =?utf-8?B?U3JZZWF1YWxsZzV0K1RjbkNPWjJldWFXWUpFcjQrOEVVVXFRak9hYUxxWU11?=
 =?utf-8?Q?I0v1dEpmIOuB+Dc6++x03kI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c0cb1c-28d9-455b-a49f-08d9d9c67e35
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 14:34:39.6332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmK6wFeOLgIL6NURAPfLrwhPNj0wnzFN58QJo2licdXyHcLxH4necoCIxUj61ciEOAyowW4pYvhu4tKB10hpjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5467
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
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com,
 Adrian Reber <adrian@lisas.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-17 um 9:21 a.m. schrieb Christian König:
> Am 17.01.22 um 15:17 schrieb Felix Kuehling:
>> Am 2022-01-17 um 6:44 a.m. schrieb Christian König:
>>> Am 14.01.22 um 18:40 schrieb Felix Kuehling:
>>>> Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
>>>>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>>>>>> Top post because I tried to catch up on the entire discussion here.
>>>>>>
>>>>>> So fundamentally I'm not opposed to just close this fork() hole
>>>>>> once and
>>>>>> for all. The thing that worries me from a upstream/platform pov is
>>>>>> really
>>>>>> only if we don't do it consistently across all drivers.
>>>>>>
>>>>>> So maybe as an idea:
>>>>>> - Do the original patch, but not just for ttm but all gem rendernode
>>>>>>      drivers at least (or maybe even all gem drivers, no idea), with
>>>>>> the
>>>>>>      below discussion cleaned up as justification.
>>>>> I know of at least one use case which this will break.
>>>>>
>>>>> A couple of years back we had a discussion on the Mesa mailing list
>>>>> because (IIRC) Marek introduced a background thread to push command
>>>>> submissions to the kernel.
>>>>>
>>>>> That broke because some compositor used to initialize OpenGL and then
>>>>> do a fork(). This indeed worked previously (no GPUVM at that time),
>>>>> but with the addition of the backround thread obviously broke.
>>>>>
>>>>> The conclusion back then was that the compositor is broken and needs
>>>>> fixing, but it still essentially means that there could be people out
>>>>> there with really old userspace where this setting would just break
>>>>> the desktop.
>>>>>
>>>>> I'm not really against that change either, but at least in theory we
>>>>> could make fork() work perfectly fine even with VMs and background
>>>>> threads.
>>>> You may regret this if you ever try to build a shared virtual address
>>>> space between GPU and CPU. Then you have two processes (parent and
>>>> child) sharing the same render context and GPU VM address space.
>>>> But the
>>>> CPU address spaces are different. You can't maintain consistent shared
>>>> virtual address spaces for both processes when the GPU address
>>>> space is
>>>> shared between them.
>>> That's actually not much of a problem.
>>>
>>> All you need to do is to use pthread_atfork() and do the appropriate
>>> action in parent/child to clean up your context:
>>> https://man7.org/linux/man-pages/man3/pthread_atfork.3.html
>> Thunk already does that. However, it's not foolproof. pthread_atfork
>> hanlders aren't called when the process is forked with a clone call.
>
> Yeah, but that's perfectly intentional. clone() is usually used to
> create threads.

Clone can be used to create new processes. Maybe not the common use today.


>
>>> The rest is just to make sure that all shared and all private data are
>>> kept separate all the time. Sharing virtual memory is already done for
>>> decades this way, it's just that nobody ever did it with a statefull
>>> device like GPUs.
>> My concern is not with sharing or not sharing data. It's with sharing
>> the address space itself. If you share the render node, you share GPU
>> virtual address space. However CPU address space is not shared between
>> parent and child. That's a fundamental mismatch between the CPU world
>> and current GPU driver implementation.
>
> Correct, but even that is easily solvable. As I said before you can
> hang this state on a VMA and let it be cloned together with the CPU
> address space.

I'm not following. The address space I'm talking about is struct
amdgpu_vm. It's associated with the render node file descriptor.
Inheriting and using that file descriptor in the child inherits the
amdgpu_vm. I don't see how you can hang that state on any one VMA.

To be consistent with the CPU, you'd need to clone the GPU address space
(struct amdgpu_vm) in the child process. That means you need a new
render node file descriptor that imports all the BOs from the parent
address space. It's a bunch of extra work to fork a process, that you're
proposing to immediately undo with an atfork handler. So I really don't
see the point.

Regards,
  Felix


>
> Since VMAs are informed about their cloning (in opposite to file
> descriptors) it's trivial to even just clone kernel data on first access.
>
> Regards,
> Christian.
>
>>
>> Regards,
>>    Felix
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> Regards,
>>>>     Felix
>>>>
>
