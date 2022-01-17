Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C41490A32
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5337E10E2C2;
	Mon, 17 Jan 2022 14:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2077.outbound.protection.outlook.com [40.107.101.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AA110E2C2;
 Mon, 17 Jan 2022 14:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwvsaMW3KQCyUHBHQyuwJd2g69czxELZE8xOD2z6u2mI79iUUxFBvilwTJ3mBLOzWmG40flXHRLNlZEIxZvbRSJFRgcpEr9o2paE/6rYckJO3fmfvyNpMlMHI7RyV1BLlGOPJYUDiLYA1H6LWEN+wsWl/ACW75kUuyxvdNLpByuqYJMj6iYoLQPF5wgOkYi78wWifiEb1keDfKgD4GpDdkcO3jZAHQmw/vDOz5JhgU3dmsgykWJqYIyYF3C3EtoZemRB2uYRc7CDcF2kZGvHVjkHvOUanz1PVl5Ru1o+yeYsQMpYYYt1NXLVoE2des3kHBnZaKxNmmZOjX5YbDJ4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsCtiVQtmM50fYH/TW7+OE9h9+vTIFIovaY08bD/914=;
 b=kMBDZAxcADL2dJ1RDPZpmK1aevgb8BSydeP4FkA5Ocek7uFoKe6FCTcKqBS7uo28I+Z0KbYUibkE+y2okEky0e6ly21l3sS4m+u9kL+ZayAwuHc3eJZBIiyDx/FwB0rWknz2OqFDn1iVSk4CQFuiiAhr+VpBWxCmBPBoKxATI6EzqHISHRzEIibhM7uInAD/ORuc+pfebV6qH7/YliBGGi6RY9sC63bzVjMdhoybuNmYlqDguUEeYybYY93Ym2yOlMpfsY5fyL5GkeBkylU5gkzTrQCPA9yr81fRnqShbtXHJ+32Jtn6vHX9LGSxCbJahWoAaEsJ8wLVF7sgP/X9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsCtiVQtmM50fYH/TW7+OE9h9+vTIFIovaY08bD/914=;
 b=0IBwj+OlPMSiQxxZrsSE9ucR6lQkDAFvBI8vdYbUZl1bUOeJ5zNsrjcDgWcD44LDN2kd0hFal30QSqEXoQven5UvKi4Jq/8o7wFInR6cplIAoZ+woW1lo+7slmVdXGNdLq4/OnP4rdpdWMfbPN9+Z/hPRc8vfCUG9Gog0UiejIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by SA0PR12MB4445.namprd12.prod.outlook.com
 (2603:10b6:806:95::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 14:22:09 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 14:22:09 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d0e694a7-4a16-7e9f-7058-beec32ab1717@amd.com>
Date: Mon, 17 Jan 2022 15:21:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0210e651-cc71-c1d2-5166-7473f664f405@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::19) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ccc1002-d25c-4e05-76ee-08d9d9c4bf0f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB44453AD08DE024CF3E63C53683579@SA0PR12MB4445.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CJXPeRxJPM+lGx5nxosvVCPu+5FSNqOyPIqwFsHov2qfBAC/ZCTN8ZMMTzSUUI2lz1A23eE0AHsLinkvUihP0j3ER4j3wSBO3STAhGu3JSPuXhUhBDN1XNxdjQm/ZpOPUw9iE6kMCLdAQsW7LPj/v6eXLerFuTtvze01v0yhspvWoyeRqmBJaBEizF7O1QGhLPMepQyp2PLITMU7GEJ5Mjb0YilF9KX6cUARaCsYBYG7KLf22PlwbhqBw7rbjOh7/zi8Xu+nWKeN7LWh7j0bFcZYyeUtZaag9MaPO8K0/65EwGjGv9P9uDUbQkBQig4UsMFi1MllYSi/lw3iszk8x0KW9ggkh4aer+gU3J2YcHG9IVuMwXBnAQBGvkH17QsDzjdm7AILO0S94qmMgs8mjEKq4OAj4/ThVRetYrnbG1k/4Gl+63COLnhq5Hs/tAv13xe+0kU2CmmggwUmqBdPtwwbcb9PFC+dGk/sQuP6UZXehPm1rs1bj4hQHiQYgJM5AdG9g7akdd/T6gH9bWw9GL8RgoLJGrXg4lz5ipPsqlVrx+RpJXGsbL+u1LzOLhgqNkB7JoRRG51ZMv8FTVA/pV4P7saSzYVEvVjD3x09xPI5DkHbBX3pRp2HPG5Gi+6BAuIUodrxOsB6xrYmbyYw162vvkka2acCiTW4zyzNFNQcTTsX7vje2yQpIgRSl0Sogfum39AuABTK7DnWlz4Nwu1yk2WzBXkZy7e6FDGgKYPDWiTqxhvMDPf+zh5JKIY8/BBMHrv3eDkVaaM7CEm9TRXiHEVhS/1UCLyTnHB2y1hFy/13sPGlCHADjI/kIc7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(83380400001)(6512007)(186003)(26005)(66556008)(4326008)(6506007)(5660300002)(66946007)(66476007)(2616005)(2906002)(6666004)(38100700002)(966005)(31696002)(31686004)(36756003)(508600001)(66574015)(316002)(8936002)(54906003)(8676002)(110136005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUlCcTgxd3IrWXlNbzZYd2JaQnd5TU8rSFpvTTJMWWx2M2ZFT2s0TXZhWWdr?=
 =?utf-8?B?cW9vR0w5SU95RmxsSDRTQ1VaNWxaMEVnYVc4TVZMQjl1NjRoUS9oZVRuNzU4?=
 =?utf-8?B?QlNTQ0g1YzdBc1BJdDVRdVhPa0MzSmdReVFYNHYzZGltYmVycGVhOEg0Q3lh?=
 =?utf-8?B?dkpoUzVHdDNLWVB2VndDWTJZY3JXMU1HWG0xMjV4OUNvdXNOc1JLMGhKUkhZ?=
 =?utf-8?B?Wlo3c1FOTGJhZHVxYlp4MWw1akRaZFhhNkxxQTcxdXRBSDg1UCtxNlRiNHlT?=
 =?utf-8?B?TC9DYzV2RUI1dVRJaTB0WEhlTjVyUXdlSExYOWVHS28xVFZsWHN1a0QyRzkr?=
 =?utf-8?B?ZFM5VE5YK3o5bExhMjVJVzJ0aGdxeno5SmQxa0dMZ25aYlRCWUJVZSthNkhj?=
 =?utf-8?B?cjV2N0ZmZXV0ZXZjLzk5YytmeVdnRGxxY0tnbVlwZlRmaGNDZDVpR0c1Smpu?=
 =?utf-8?B?NUQ1U1g1elNPRzhPVzRKcGVIVHVvTEZ1RnM0c1ZvRWNVd2RJZlhuS05vSFZX?=
 =?utf-8?B?OUJpUVpoUm9ZQ1ZMeWJKelBMemRVVDdKQlh5TjRzS2NXSEdjRVJsN0Q5Q3Vh?=
 =?utf-8?B?RVRBZjlRUlVnZEVXME9wWGVXOFE5V3MrTDdQSkNEN05rVTgxS0ltY1o1OGpP?=
 =?utf-8?B?dllYVmFSWngvcFRZbVBPSG5OeHY4dnRrY0tSVWJyRk55dnJodnVLazFmcGds?=
 =?utf-8?B?eGNJM2RmU0ZhNGR2MXhmS3RRblQ1d0dyK09LNGN1UkhoVy83Y3lKTTZGTVdQ?=
 =?utf-8?B?RkljamVEaXQ4c2lQcG9sbzVtTkdtUks3SnJqeExxaW1Na1ljMGpyT1F0T2tY?=
 =?utf-8?B?K3E1dGdyckRBQVkrenIrWGN5Ykp0T2tzRWdLMVhkV2NuWnZlMU5kZjFIUTBM?=
 =?utf-8?B?V0RVM1lGZ0tjeTI5TkF6ejZXU3BkUUtJTExaZ2dtbWFmYzFyNWNIYWYzd0sv?=
 =?utf-8?B?LzY2UlZaVDdEWEsxclBWQjFLVlhQa1dOY09PaGREMU1iS0Y4NzhNUjU5YkEr?=
 =?utf-8?B?U1Y4Qm1XYkJYS1hEOUlHOXRHaG9HVVd3enQ2WWJsZG1xcjZ1ZkdCVGd2WEtC?=
 =?utf-8?B?bkpSd056VlpnVVJ3N0RRY29OMlJpL0ZRR0luMGtrT0tQbzJseVp2Q2JqeVZn?=
 =?utf-8?B?elFEZHVGbXp6aldNTjVPejhTOExzOXgxTmFYTDhKWVZ1Y25UMzdiN1VsUEZt?=
 =?utf-8?B?Tk9vZklNYVVXUTZJYzhwU1libW12RU1yMzdEY3ZMblJIaVU0eWJueWRBSDZN?=
 =?utf-8?B?bnNWT3ZEUmlFNVRUa01FTkp2VU1pL29PYnNyL3ZpMDBOWmdiM1ZDK0pLemhY?=
 =?utf-8?B?cFEyZ3FGS205ZytJQVVqWUNabml1emVYM24wUWhSQ3NuVTNmT0k0cWRCZ2Qv?=
 =?utf-8?B?eVYwbGpkNXNKMUtxUkJZSTlVWmxtdFNoNCtFaDE1U2YxTU9OZmJXdHNqSlQ2?=
 =?utf-8?B?RWRhQ1JaREJoVGhURjRrYnR3UVdKYVlaN1RoQmpUcmt4c0h1WHZhc0JKQlJB?=
 =?utf-8?B?d0lWVHFpWktnS1FWVWxtdkNUNkRIMXhUUy82Yms3NVZGdUxJU0hRV1NtQzht?=
 =?utf-8?B?Q1ZQckRYdUlSY3JDQXNPcFRSQ0x0R0NjTWRpc2NmTTcvK3FCeURnU2JqWGhC?=
 =?utf-8?B?aE50TjNEQU5qd2pEYkRrclhOQTNwM2pNOCtiYWhZN0VNMFN1d0duR3ErbTJi?=
 =?utf-8?B?cVdESUZZS05IaFkwcmZjTnpnamdsM1lRanFWcTQraGV5RjQ4WkdEdDZlclJW?=
 =?utf-8?B?Qk9QdFAwWDQvcjlHWWx3YmV1Rm5MZWc3bDc4OThDWkIyaDR5aWZQZWpNTXpQ?=
 =?utf-8?B?cERRNzJnMjVIcHdPUnBudjVnOG9IL0ZiQUhyWlp4Vmg2QkcxMUlJNXJCalBL?=
 =?utf-8?B?SmZmQ0Z6QTE1NTlxdHR6TitsaVpkNUJ1QndJT1JJeEM5UVI0NjZRVFRDMTV6?=
 =?utf-8?B?RjNxY0JETFNmRDhJcWk5Ym1rcTRBM1BTTTVFcWFCeGh0UWFwRzRKdWFtTVQ2?=
 =?utf-8?B?eDBKenJNaUN2K1F2MFloSHBaa0dlZngyQnFFeTRQUUt6Y25NblhTV0R4N0tq?=
 =?utf-8?B?VmppR3ZkcTgrNE9qZjhhdTNJNEpoSmZMNGIrNmUxUGNEODNWdkdQaVc0UGlt?=
 =?utf-8?Q?jupU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccc1002-d25c-4e05-76ee-08d9d9c4bf0f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 14:22:09.4258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvgclQeUQQikW1wHgasDoj7z77d7qcQQ5HGo3CBgX0G2kdJw/9AMwmdmqYwBWDAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
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

Am 17.01.22 um 15:17 schrieb Felix Kuehling:
> Am 2022-01-17 um 6:44 a.m. schrieb Christian König:
>> Am 14.01.22 um 18:40 schrieb Felix Kuehling:
>>> Am 2022-01-14 um 12:26 p.m. schrieb Christian König:
>>>> Am 14.01.22 um 17:44 schrieb Daniel Vetter:
>>>>> Top post because I tried to catch up on the entire discussion here.
>>>>>
>>>>> So fundamentally I'm not opposed to just close this fork() hole
>>>>> once and
>>>>> for all. The thing that worries me from a upstream/platform pov is
>>>>> really
>>>>> only if we don't do it consistently across all drivers.
>>>>>
>>>>> So maybe as an idea:
>>>>> - Do the original patch, but not just for ttm but all gem rendernode
>>>>>      drivers at least (or maybe even all gem drivers, no idea), with
>>>>> the
>>>>>      below discussion cleaned up as justification.
>>>> I know of at least one use case which this will break.
>>>>
>>>> A couple of years back we had a discussion on the Mesa mailing list
>>>> because (IIRC) Marek introduced a background thread to push command
>>>> submissions to the kernel.
>>>>
>>>> That broke because some compositor used to initialize OpenGL and then
>>>> do a fork(). This indeed worked previously (no GPUVM at that time),
>>>> but with the addition of the backround thread obviously broke.
>>>>
>>>> The conclusion back then was that the compositor is broken and needs
>>>> fixing, but it still essentially means that there could be people out
>>>> there with really old userspace where this setting would just break
>>>> the desktop.
>>>>
>>>> I'm not really against that change either, but at least in theory we
>>>> could make fork() work perfectly fine even with VMs and background
>>>> threads.
>>> You may regret this if you ever try to build a shared virtual address
>>> space between GPU and CPU. Then you have two processes (parent and
>>> child) sharing the same render context and GPU VM address space. But the
>>> CPU address spaces are different. You can't maintain consistent shared
>>> virtual address spaces for both processes when the GPU address space is
>>> shared between them.
>> That's actually not much of a problem.
>>
>> All you need to do is to use pthread_atfork() and do the appropriate
>> action in parent/child to clean up your context:
>> https://man7.org/linux/man-pages/man3/pthread_atfork.3.html
> Thunk already does that. However, it's not foolproof. pthread_atfork
> hanlders aren't called when the process is forked with a clone call.

Yeah, but that's perfectly intentional. clone() is usually used to 
create threads.

>> The rest is just to make sure that all shared and all private data are
>> kept separate all the time. Sharing virtual memory is already done for
>> decades this way, it's just that nobody ever did it with a statefull
>> device like GPUs.
> My concern is not with sharing or not sharing data. It's with sharing
> the address space itself. If you share the render node, you share GPU
> virtual address space. However CPU address space is not shared between
> parent and child. That's a fundamental mismatch between the CPU world
> and current GPU driver implementation.

Correct, but even that is easily solvable. As I said before you can hang 
this state on a VMA and let it be cloned together with the CPU address 
space.

Since VMAs are informed about their cloning (in opposite to file 
descriptors) it's trivial to even just clone kernel data on first access.

Regards,
Christian.

>
> Regards,
>    Felix
>
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>     Felix
>>>

