Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E96F5AA0
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 17:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3CE10E2F1;
	Wed,  3 May 2023 15:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3315810E2F1;
 Wed,  3 May 2023 15:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft5d/F1sxPumcMsOBjpvyli16HJeun0r5KMJtMN+Xh6QdUEBQt/tvCxSZ9BhfvBn6+vouJ7lFxxHbEi86WUkIkuhhFG8vCeFdaHmgtPqSk+J8BQw4SsGncX8+E5WrqAK/ZxsJXKh3aHqlbG9zl3L5rKAOg4J9ltYSbJ6/yaZ4xXy00MZlc1bS6q1pQKwEzRwVKHIdmoQbNIa8xFIc40tQhBoRQPK5cSNi6GAQ9dLfCukbUzLTi/V6YuUNjhuUp3GJfFK0YHQjb8j77EBHaFsyiMwZtnzQJ77+BD5Y6D8a+v35VcSTei6YeifUq3Swc936iPyCpctE7aAsLLr+noHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbu0l+BoQ5Ve+vWszsxR0zwcvGmm06cZQtiCYFrW5bY=;
 b=RfhtrJ7DVLpzD5b2CHJxbe/AcPQj7ALi5FpcjSPkczecppw9OX+wQ5zDiaEy7//fjpJtHbZ9CBpBoxaM9bWhr0m6AxJ6OqcxDxZeY9jd5g+p0/ffFv+Vx7gsiG07NxrzjK9BjEWf6GQngheug3vQly0vdzqEgcuYvaOmtIJ+Rq04R0ZB+D/mDsXQTkuDzmOO4iXg7Ng+VDrFniLVaYLlPT9FHhgC+Rkay60PRDbowvfmCgHX2N+exlW0IIKvWQLNGVVn7lkj19gAlZ3bIs8s7ovBJAATP1ySTw9XzQfePvxYHrwrjEB92UGUvKsIAMSQ4Jm1xg/f+ZsseizJhU8AUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbu0l+BoQ5Ve+vWszsxR0zwcvGmm06cZQtiCYFrW5bY=;
 b=efqH3l3ewFE7PF57uQVvXQV4VwL79lGzdM8MhJOOLhasGbGaM2R2UO3gftj72IzzorLhnh8VqL3EvhPPitbTSXjCPmvYWu8ZTqrP2G+9rSNMxDTJIpQ6NjoOA7WzZcrrPm/5YVOmM546XcRA7ZW6+sV+ghTTXRdWRu+cHSAROQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:08:08 +0000
Received: from BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f33b:5ab3:c532:e486]) by BL1PR12MB5112.namprd12.prod.outlook.com
 ([fe80::f33b:5ab3:c532:e486%5]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 15:08:07 +0000
Message-ID: <2bf162d0-6112-8370-8828-0e0b21ac22ba@amd.com>
Date: Wed, 3 May 2023 11:08:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/1] Add AMDGPU_INFO_GUILTY_APP ioctl
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Timur_Krist=c3=b3f?=
 <timur.kristof@gmail.com>
References: <20230501185747.33519-1-andrealmeid@igalia.com>
 <CADnq5_NXj4W44F_etRQ7HWdVTnf5zARCM3Y_o3EiwWiHj8QMpA@mail.gmail.com>
 <6ab2ff76-4518-6fac-071e-5d0d5adc4fcd@igalia.com>
 <cb3d2590-a1f8-fe7e-0bba-638ee80719af@amd.com>
 <CAFF-SiV0=WNmRW-D9uYUuj68Zq0APxtGLya9KR6FfZ7v0Zf2RQ@mail.gmail.com>
 <fcca2934-a556-797c-535d-a66fc67bbe30@amd.com>
 <85c538b01efb6f3fa6ff05ed1a0bc3ff87df7a61.camel@gmail.com>
 <CADnq5_NHtFbwT=x8u7GYc4ESL_HVFzjgtOd3AnVFBYMrjZq55w@mail.gmail.com>
 <c54414482b685af0991a6b095cbfb7534d998afc.camel@gmail.com>
 <CADnq5_MSY=j9AobDk7ACevur4Hwvw_ub7g16Mfm7ymMJqwVNfQ@mail.gmail.com>
 <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <57fa0ee4-de4f-3797-f817-d05f72541d0e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::27) To BL1PR12MB5112.namprd12.prod.outlook.com
 (2603:10b6:208:316::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f5b43d-36c5-495a-5d1b-08db4be833ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4x2LE6vWzfaaOsIKDZVJku/NjP112J9saTxwmDfy/qJMl7VqBgVoYVwuVU5NehkC03w5pWypnfRJGx4YqsHK1XdMJ6DosVzxCZnCZoRiXA+2lYtWdYHB+CfXyImiZU5ITDblaw50vSSQXwdCgneLua1CDjg28baYWX7DxByOqS10MiXF3ofORvILC0m6QtMrVRXttiUtkGYVYoFsBkFFDbsVeheRthkdHYNw1Nt0fKachDTFy2Eg7WGWCKa/fOGNDS0d1/kbpwdN6pAR5meyuJxt+/7M1B4W1r5m7u8NtSUUeHpXvwvPMKlM/NUDSk6a0Lw7FaNSf7eMARPBbRb4bCwLZR5zDD+5WXah9cdwX2G91PN+8J5taTT1+YCsRt7fAu5wRknOImGqEsm80Sk64DPRTBHfmdB5QqagDbHUKUn3epl9YAqjUz8Nep0LDDBAtmka6hF/ajpTXPuA76GYklU6zYrFr/xFAlKacPAxAi+enBp7H7Cwth9VnZwsbWxUNQllk8vObLgb3annOILtHLULNWj2KtmPHaDG8r83Hc8V/DRSPgRO4kWTMiLZf/39nYVLFg7cTvUgoj9AL1pX5qYbqg/lpXUEWW4aaY7RPS5LiVlE/uMQN9Qydd1qipbS5eokfrCHZFHfyAo7VApa6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5112.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(54906003)(6506007)(2616005)(66574015)(31686004)(6512007)(478600001)(6486002)(83380400001)(26005)(31696002)(66556008)(66476007)(316002)(66946007)(4326008)(110136005)(53546011)(186003)(41300700001)(7416002)(66899021)(8676002)(44832011)(8936002)(5660300002)(2906002)(38100700002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpyYnZWVm5aNEt5b2ZQK1g5TW1CNnlpQVAvMHFUZkpmUXFGTmsweExQVXlL?=
 =?utf-8?B?WnR1N0RBT0VtRXd3WFlnZGhGSExWQ1VuM2hyVkU2WUh2NzJDMHZGWW5hakJh?=
 =?utf-8?B?cE9sa3IzQ1l4MkV4R2E1M3UyaGd3bTd0c0RpT2VPK1ZWN0U5dm1wclhyc0kw?=
 =?utf-8?B?bjBqOEgwQWJzMlVtcjkwL3BNckp5NVdybm44T1FCSFk2LzhBSzlBeXRMYlJk?=
 =?utf-8?B?M2w3OHlYWFl1MEh3MC9kbWlUYitTaTRCbWg5bEM3RnhNNERtVXM1ek0rdTc4?=
 =?utf-8?B?R3MzQkcwSTFxOUNKMlVVUUtpQnJVNzFrS244RVhrOWt5NE5Xa0lyQXVscTB6?=
 =?utf-8?B?VzQ1RUgxNzRVcExHN3RSaDVZMzFSelRjdUM2Q1hQL1MxZjdMaWo4bFI3RU9O?=
 =?utf-8?B?R2gzbW9hSjhqK1ppZ2dyUW1yVFFYcmNVdnBWQllUaVF5WUJWbWlNVHVOOG1r?=
 =?utf-8?B?VUNqQUJqQUsxWXNXdzU4QXF3d0kwWUxoaHR6K1JMdnI3S3FySjhHSUIxcVlU?=
 =?utf-8?B?SE5iWGxIU0RNRTYxaGxPTzFmbkpUSFMwMlBmd1c2Q0JMSElqMGkrWnBuN0Fn?=
 =?utf-8?B?VzBCbEN0djI5TjExT2F1bUxBWllUbm9qdEFhS0JaRUdGZEdQT2U0dThnRDJG?=
 =?utf-8?B?QXFLNkUyNzhaUFhNaWkzb3Jpd1JMaEhhS1VhU3pveHdsVDV6cDhlbUpick4y?=
 =?utf-8?B?VUxqVy80R2JXaXd2bCt3TkZsTkk5ZjF6KzJFTFVkc2lrOFFWUGorYVlkaXZw?=
 =?utf-8?B?WGVpT0EwRCtmMmlic0p5VjRETEtzWnBiUHQ3RzJvOHJicVV4S1MvQkYwOXFl?=
 =?utf-8?B?NDRPS0ZZMDNPbGVSNzFtVFJBdU03VVl1Vi9wbjQ2WlM2T1EvT3hPeXo2T1RB?=
 =?utf-8?B?a2xMd0xRNGNENktlRmVBSUN0eTIxeFk5OVBsK3pBS3BaOVhPVVRDYTZOR1Nj?=
 =?utf-8?B?bFVsRUpMeDRGK05LVVRySFg3aVd1MTRNQkpGR3NpaWlyMDBDczI5N1dLSDUv?=
 =?utf-8?B?bm9KTEhoQ1JxZWRtSWtPUU9WVWc1Z1VwNVFBVEtxcDRRdmlQUWk1eDZCNFgv?=
 =?utf-8?B?emFvWjg2ZVVDcjJ0U3p1U1hvVDNpaUxvT0lKeHFncktoclUrdk5JalRtdStw?=
 =?utf-8?B?R2xTeVN1ZnpQYVY2dDBOY1JSQXZKa2lGY0REbjFMREtkeGRvQXZ4WHJXL2VE?=
 =?utf-8?B?dzB2YkNNcUJpVE53SWFzNno0cG82dlRBU2svT0owOGdEdGRyMW1ielFRUGJV?=
 =?utf-8?B?cnlGbWtoYm5ESlNpemt2dVl4UHJESGVrMHZvTGF3dXoweGtyclJxM0lxUG5K?=
 =?utf-8?B?b2w0YmY4c3BIdE1iNkZEUC9DNmdlZjZPOERiZStNM05nandJVHNXUlJ3c0pP?=
 =?utf-8?B?eE5sL3VCWUhMbld6WEtoaVdYM1hzWnVhaE1ndFRxUlpHL2R3U1lzMjM1bDdJ?=
 =?utf-8?B?VS9Bd0lmVjd4UnprU3FhejNMYzFwc3F5NTl1Z0ZKTGRObnBZZVBicEQwNjlS?=
 =?utf-8?B?MGF5ZzhtMVZzSjd5cmZXSzBUSUhrRkUySmlxcTBTVER4d0NNZERZTDNuRGNs?=
 =?utf-8?B?cXBoT21JaGsrYUtwTUt5U2FaQjgrZHV4N3dyWENla2lxWUo1N0hCdEkwbTRk?=
 =?utf-8?B?ZGdaTXBOaW5tbjZHbmFxVmRlZmluMm9oTEVoZHVpUEdvUW9HdWtzSzIxOVVv?=
 =?utf-8?B?REJ2Z0M5cWZOTmJWNFZaaXhVSExtNWpNY3pRV0N4TXdJWlVzazFMUUlJUWV3?=
 =?utf-8?B?QXg3bWZYdlFKOSt5SEM3a1RPK0VuZDA2M1ZLQys5WGVWU3B1bEJZNjRnM2gw?=
 =?utf-8?B?VjJYTUNFeHA3WkhkL0JIYkYxY2x0VHNkT0VPUisySUxBUEVMc2dsSlRhSjBI?=
 =?utf-8?B?clkrY1pCdEFiVlRVeS9uZVhJZFRoWU1aQVpFckJobHBkT2lCQnZpRGozb1RH?=
 =?utf-8?B?cjRXWitmSmhKSi9rcWhsZEZqNHp6dmJWWGkyUUJmcFBXK05vM2F6aXY4ZURv?=
 =?utf-8?B?RGh2cmJCbVphWVU4bFV3S24reTlqQ3laUFNrbTNLK20ybHNiMkFHTThxalRh?=
 =?utf-8?B?QmxncGJydVAyajRsZUZPVjBOeUIvbTBsWWZ0clh0MkdKQURUQ3lPd1hxTGV3?=
 =?utf-8?Q?Y+stVIZZHTYkx9kfu0kcq+9+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f5b43d-36c5-495a-5d1b-08db4be833ca
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:08:07.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSaxwiEdogUWoFhKCVzU1+4nT4qo7MWK4x3ixW4XaI4Rh5/lQXbCEZILff9J9iHyVSK+eXylBY1VYE6P19dqew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085
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
Cc: "Pelloux-Prayer, Pierre-Eric" <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-03 um 03:59 schrieb Christian König:
> Am 02.05.23 um 20:41 schrieb Alex Deucher:
>> On Tue, May 2, 2023 at 11:22 AM Timur Kristóf 
>> <timur.kristof@gmail.com> wrote:
>>> [SNIP]
>>>>>>> In my opinion, the correct solution to those problems would be
>>>>>>> if
>>>>>>> the kernel could give userspace the necessary information about
>>>>>>> a
>>>>>>> GPU hang before a GPU reset.
>>>>>>>
>>>>>>   The fundamental problem here is that the kernel doesn't have
>>>>>> that
>>>>>> information either. We know which IB timed out and can
>>>>>> potentially do
>>>>>> a devcoredump when that happens, but that's it.
>>>>>
>>>>> Is it really not possible to know such a fundamental thing as what
>>>>> the
>>>>> GPU was doing when it hung? How are we supposed to do any kind of
>>>>> debugging without knowing that?
>
> Yes, that's indeed something at least I try to figure out for years as 
> well.
>
> Basically there are two major problems:
> 1. When the ASIC is hung you can't talk to the firmware engines any 
> more and most state is not exposed directly, but just through some 
> fw/hw interface.
>     Just take a look at how umr reads the shader state from the SQ. 
> When that block is hung you can't do that any more and basically have 
> no chance at all to figure out why it's hung.
>
>     Same for other engines, I remember once spending a week figuring 
> out why the UVD block is hung during suspend. Turned out to be a 
> debugging nightmare because any time you touch any register of that 
> block the whole system would hang.
>
> 2. There are tons of things going on in a pipeline fashion or even 
> completely in parallel. For example the CP is just the beginning of a 
> rather long pipeline which at the end produces a bunch of pixels.
>     In almost all cases I've seen you ran into a problem somewhere 
> deep in the pipeline and only very rarely at the beginning.
>
>>>>>
>>>>> I wonder what AMD's Windows driver team is doing with this problem,
>>>>> surely they must have better tools to deal with GPU hangs?
>>>> For better or worse, most teams internally rely on scan dumps via
>>>> JTAG
>>>> which sort of limits the usefulness outside of AMD, but also gives
>>>> you
>>>> the exact state of the hardware when it's hung so the hardware teams
>>>> prefer it.
>>>>
>>> How does this approach scale? It's not something we can ask users to
>>> do, and even if all of us in the radv team had a JTAG device, we
>>> wouldn't be able to play every game that users experience random hangs
>>> with.
>> It doesn't scale or lend itself particularly well to external
>> development, but that's the current state of affairs.
>
> The usual approach seems to be to reproduce a problem in a lab and 
> have a JTAG attached to give the hw guys a scan dump and they can then 
> tell you why something didn't worked as expected.

That's the worst-case scenario where you're debugging HW or FW issues. 
Those should be pretty rare post-bringup. But are there hangs caused by 
user mode driver or application bugs that are easier to debug and 
probably don't even require a GPU reset? For example most VM faults can 
be handled without hanging the GPU. Similarly, a shader in an endless 
loop should not require a full GPU reset. In the KFD compute case, 
that's still preemptible and the offending process can be killed with 
Ctrl-C or debugged with rocm-gdb.

It's more complicated for graphics because of the more complex pipeline 
and the lack of CWSR. But it should still be possible to do some 
debugging without JTAG if the problem is in SW and not HW or FW. It's 
probably worth improving that debugability without getting hung-up on 
the worst case.

Maybe user mode graphics queues will offer a better way of recovering 
from these kinds of bugs, if the graphics pipeline can be unstuck 
without a GPU reset, just by killing the offending user mode queue.

Regards,
   Felix


>
> And yes that absolutely doesn't scale.
>
> Christian.
>
>>
>> Alex
>
