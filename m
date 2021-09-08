Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1205403BCE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 16:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD696E10B;
	Wed,  8 Sep 2021 14:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA38E6E10B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 14:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0bHihxhe95QyyvP9by4YOQjIZ8LhMYnofkxJva5clesqW4KGBnRurTViGIKUKoY5unH90QYYBKP5E0KGzGJCYVjfKqbN5Z+tFzXMadyV+h+0zpwuRF/kqeIBE0xPRZt+GTMh21qxjmlFhOjITRPjzymqTKyWSd73wG1ukIePSYl+SBll9W77A5Nl3hY410F3xuCYWlsewwIgmnSe9lj9h7cxCTpGJzLXoPBPuEj12ceQ0G5vFy33KZc2mwdYig9fohpqIqy0oHl2nVJ+NXf/kiqfHTaYJ5jI6aFcz7Z0Cilljix+JeZMezBH87tu2uK0EOX5o3xNW1rJA8j4ZPEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LbvPsBKDnZrwccxiyKkDL2V5bGzrxmX8oPLISgkkVyo=;
 b=itt0LMty7lpwUg74FQEGrTB3MQZBL7GhAXGuPkElphHZ63FBcQyfQzPJL2cd2yo1AJ/jVZWj1Bh8yDKBHtHLNr/OyV+GZHy2Q5ac4CqyNxBiMVPO6hIH5pbyLMLW98OYsW2QIMVO5uoH40X/63flv4gTv1t4unaKdT4DdPmjgR6XgeG6SWcYrF8oh3n4sj0XF99xDWs43kp5PfTSI645hFrsIAmGqbaLQOpk4LjbVSJvp/UhJa+0G918PK/hpNYaXYt4FWWLEN8BC020LFGlnYwYwlFbc7qizbaJPtmqFMWraLog2V/v8yD+p6u6OOfpeU80bLrNQ+K524wcyB6OpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbvPsBKDnZrwccxiyKkDL2V5bGzrxmX8oPLISgkkVyo=;
 b=4INpmyjtG+t3Du6D6iHAFS7Q3vhfdZFnmRIC7lYmSVLBLdByMANpQD7VPeDf2KJoKksVwPbbeEKmwMzH01IzrKnxvOxP19+6bx84pNcolkFz/naLXxXNt7JDGzMSTG5i9L5u+mayhD/NStBtqflQbpZcro1hqb+fsU5w9ZcXzbU=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 14:53:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4500.016; Wed, 8 Sep 2021
 14:53:23 +0000
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue for
 the timeout/fault tdr
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
 <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
 <eaaad39f-832b-0c43-5043-061dc717a756@amd.com>
 <20210908085038.0feeda7c@collabora.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f53270a6-bb98-3010-49db-edd10d12902c@amd.com>
Date: Wed, 8 Sep 2021 10:53:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908085038.0feeda7c@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:c88d:e1a5:e87b:51ee]
 (2607:fea8:3edf:49b0:c88d:e1a5:e87b:51ee) by
 YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 14:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c83e53e2-2879-417c-d14b-08d972d86836
X-MS-TrafficTypeDiagnostic: SA0PR12MB4448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4448FC4389053CA82D81E78DEAD49@SA0PR12MB4448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v18SuY2+ZoPRarS3uNWXVTX4bOnJRqbzhrZQVvNIYQ5t5ouDIDcNz/V2UujsRYP0UONuAa9LqsXkoGSi28DcmUlcqj2UAfgswv5P45kyn10lQM3W3WGVnHJswlDwyf/6dkhJNVhiAkFHDSIirlilc9mRTlFHMQhk/NTKT8vMl1UldyR2qIDSPZ4v6RSQoBl2apKMZKcRY3I7qSgFgIc2YsDfCDfybdQUwj693RNf1UvMjDHs9FiLQrpcSKy/EHFCwplzrHoHu3k/UYC+0riu4fMIoewjWBoUX55WUj6hMD2FNPbyBwwS2HORK3BOVBJtV0z3UDVc84TQrj/+JW4DEyCj4PKtJr+s5DA/LuRLauhUs27Vkxsvw+O/xWfumYGoG2lkyuMGm2LRAbR1jGsWYPJwNvaGSr2PUQX3nvvZkTb0ST56cnoKokKiK/FDTdSapwzRP3iBnwdeeBK80Ttm1WMn78wWPXiK5FR3Sy7MJrfMydzp710t+tyWO9yJ2x2JMXtbZOgk0u8+ebItvdM2nt58lgqMnBwDJvObDmlbKXY/vbnGhvndaLggGX6zyFBZX8s+lyKZY/91sXd4wDavb5VbCsBTyYQYo1y60TVTkQ/WJc3cvnXSZjw/Fi1rtVZzOjFw+FFcSiqa7UoVnlUZgdhn27Q4H3Vy5ZN3SHmySor7wHouaKJ8vNq6IkBLVlNMo7OVUOrs7zK9wz2XcTkRkP0dlcRNYqdlXndL+y4wWjM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(8676002)(2906002)(31696002)(478600001)(66476007)(8936002)(316002)(53546011)(31686004)(38100700002)(54906003)(6486002)(36756003)(2616005)(66556008)(66574015)(4326008)(6916009)(44832011)(186003)(83380400001)(5660300002)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlk3V3ZyZEU1eG5pcEpOYjJIWnpvdFhuY0w5UU9jRlJUamMvQ0syYzlYRUNo?=
 =?utf-8?B?RldqZWxtY1pVUFZlVEFkRFEzdjIrSENxZ1Y5aHlhYUxnckhrR2ZzalhxUHh2?=
 =?utf-8?B?ejlReG55Q21pSFMyL2E4V0xya0tSYlZScCtOMHZSdUFxNmJWdmIyMzh1alRo?=
 =?utf-8?B?NDlBNXN6UU9EUXV0di9kcmQxeXVNQ1c1V2owczVRZGhGUHRMemlnaFZ3a3FG?=
 =?utf-8?B?NTJqR0tUNWZMSWpDK2J2aGJ3K1NFVHcydU5BSXVNdTQ5aXkwL1kyS3YwY0dK?=
 =?utf-8?B?ZEZrc2RQRHBSWXNHd0RhMTl2NjdxWFkzd0x6cHlVV3BsMlA3SXM4Yi83Tllr?=
 =?utf-8?B?YlBsOWxOMlVOWCtScFd5VERCYmFmMy90SlNpZG1ab3lrcnhLbE93WGxtcm11?=
 =?utf-8?B?dGpwMCtEMGRhaTdKaU5MZ25CUTBSSE9tTmUyaDhLaGt2Qkw1M3JNNnltVmpw?=
 =?utf-8?B?NUpVQjA1b0VLNzVtR0xWVmhJZUNkQXFqQ3lkWVd1VGJsMWlSOWFzN05YdFlH?=
 =?utf-8?B?dnpvdUU3ZEFFcGZvOEEvY2JkWVN6WFFLR3J5RXdMcXJhci9QR2dFL0t5aEtx?=
 =?utf-8?B?ZldMMmFCOFdUdERpVjdhOHBsVHh5OXFQMCt3NDI5S25jRHZFeDVOWW50aEFo?=
 =?utf-8?B?Z0JUV0tDb1MvWlZueWx6dlBPSit1VjUveEpROWxkRkFLRmkxMEhlelJIZyth?=
 =?utf-8?B?T1pTb2lxVnNHem8zNXpLR0xXQk1mYXYwUXZWNzZZbVNMcFRVaVRqRG9OZlhi?=
 =?utf-8?B?MUNVWTY4blFsd1NvV1h1SUhPdWk4VlF6YU8xcnh3ZWpzU3RqclNmdmdpbG5k?=
 =?utf-8?B?NTJhN0E1YXBaWGlDdXJBNUllcW1BTUEza3ZXTTgvS1g0clgzRGgxUWFFY0Ji?=
 =?utf-8?B?cjNuNWc0bFRJMDFtQm0rZ28ycGJLM2xPeTh2ZzF0K1k0OWVOVml4ZVZRaTUy?=
 =?utf-8?B?cG9scXYvTW1QS2lQR0o2NldJTG1oczZwUXRHMi9NcWNUSHFDd0FTVWFhU3VP?=
 =?utf-8?B?eHZBUUc1UE1McFVOSitCb0JwNWloTEc0djRMRi9WMUtUZGJoaW1pclpIaDBr?=
 =?utf-8?B?dmhOeUFmQWV5d0Q1ZU45bkhHMXh5TXlVbmNWbkZ2MVZGQlVQc3hMRW1TVGVB?=
 =?utf-8?B?VVFka2ZMYVpES09zNkdqRHVpb3owZFI3c1U4TStTWmRvQlo3aFdTZk1TUElW?=
 =?utf-8?B?Mkk2d2JhUkw0a2FUVGpvbFBaYTEvK0k1RTYxcG1UeTM5aFNTYlFPZG9Lb2dH?=
 =?utf-8?B?VkF3M1g1eG5oVzZtVld2VzVMVWZONTI0eFdoQmJsS29mVHYzUEoxdTV5TENL?=
 =?utf-8?B?Vnk2WjlCT2lGeXdqMW93SThDYmZoVDd6OHNVVEN1TkxTemxlOVNZd3NqUHBS?=
 =?utf-8?B?ZklWMWVialBWSmtJMHlGMXRpTitFaWs2RXFleWtQZlZhSkdXUkdQY0ZnM0tj?=
 =?utf-8?B?TmdvTnFjSDdzZTUyY0lYUTh3dEFsMEFoRHAreFdIaHVTTUJPcHZORHpiNFZq?=
 =?utf-8?B?RVFiWG42NmppYXNUelBDdDUxckN6bjFQZytpYXVYZmJ4UmN5QmxTTDV0WE9F?=
 =?utf-8?B?THZXVUNqOU9uSzNBYnBLQkFvczhmV2NNa3RCOHdrd25lS09YTVVLTXVzTHJP?=
 =?utf-8?B?WUpDeXowL3VQNEpsdkFjbGdUbjlOV283NGtzNkZFejlsaTFTUWxLQmNQbGN6?=
 =?utf-8?B?RzI5T2VnSmNBMHJQV2xBWllsemgvS24rVHZBT3FJRDBoNCtiZWhaUWxiejNs?=
 =?utf-8?B?ZUUyVkFaT1I0aUUxS2NXc0dUNXVtQlRKYUFCNlM2V3NrQjZ1NVFoWDJQeWtE?=
 =?utf-8?B?YXJldzFLWGtyRS8yQ0JJeVVjQ1ZmeEpMa2VRNGtnYldUZ2VSS1ZuRXlNaVRa?=
 =?utf-8?Q?cyqhvrn4Yy/kb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83e53e2-2879-417c-d14b-08d972d86836
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 14:53:23.7650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+J1h/ee85wGk66IEv12VPqeifBNL5YiWTYWm2/MD3YSPuVuJHNUhNh4j/J1zn+e2IHFjD1vuCd7HlqHCQGKQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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


On 2021-09-08 2:50 a.m., Boris Brezillon wrote:
> On Tue, 7 Sep 2021 14:53:58 -0400
> Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:
>
>> On 2021-06-29 7:24 a.m., Christian König wrote:
>>
>>> Am 29.06.21 um 13:18 schrieb Boris Brezillon:
>>>> Hi Christian,
>>>>
>>>> On Tue, 29 Jun 2021 13:03:58 +0200
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>   
>>>>> Am 29.06.21 um 09:34 schrieb Boris Brezillon:
>>>>>> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
>>>>>> reset. This leads to extra complexity when we need to synchronize
>>>>>> timeout
>>>>>> works with the reset work. One solution to address that is to have an
>>>>>> ordered workqueue at the driver level that will be used by the
>>>>>> different
>>>>>> schedulers to queue their timeout work. Thanks to the serialization
>>>>>> provided by the ordered workqueue we are guaranteed that timeout
>>>>>> handlers are executed sequentially, and can thus easily reset the GPU
>>>>>> from the timeout handler without extra synchronization.
>>>>> Well, we had already tried this and it didn't worked the way it is
>>>>> expected.
>>>>>
>>>>> The major problem is that you not only want to serialize the queue, but
>>>>> rather have a single reset for all queues.
>>>>>
>>>>> Otherwise you schedule multiple resets for each hardware queue. E.g.
>>>>> for
>>>>> your 3 hardware queues you would reset the GPU 3 times if all of them
>>>>> time out at the same time (which is rather likely).
>>>>>
>>>>> Using a single delayed work item doesn't work either because you then
>>>>> only have one timeout.
>>>>>
>>>>> What could be done is to cancel all delayed work items from all stopped
>>>>> schedulers.
>>>> drm_sched_stop() does that already, and since we call drm_sched_stop()
>>>> on all queues in the timeout handler, we end up with only one global
>>>> reset happening even if several queues report a timeout at the same
>>>> time.
>>> Ah, nice. Yeah, in this case it should indeed work as expected.
>>>
>>> Feel free to add an Acked-by: Christian König
>>> <christian.koenig@amd.com> to it.
>>>
>>> Regards,
>>> Christian.
>>
>> Seems to me that for this to work we need to change cancel_delayed_work
>> to cancel_delayed_work_sync
>> so not only pending TO handlers  are cancelled but also any in progress
>> are waited for and to to prevent rearming.
>> Also move it right after kthread_park - before we start touching pending
>> list.
> I'm probably missing something, but I don't really see why this
> specific change would require replacing cancel_delayed_work() calls by
> the sync variant.


I see, I missed the point that since now we have a single threaded 
processing and
only one TDR handler runs at given time there is no need to wait for 
other parallel in flight TDR handlers.


> I mean, if there's a situation where we need to wait
> for in-flight timeout handler to return, it was already the case before
> that patch.


In amdgpu case we avoided that by trylock on a common lock
and returning early in case it was already taken by another TDR handler


> Note that we need to be careful to not call the sync
> variant in helpers that are called from the interrupt handler itself
> to avoid deadlocks (i.e. drm_sched_stop()).


I am not clear here - which interrupt handler is drm_sched_stop
called from ? It's called from TDR work as far as I see in the code.

Andrey


