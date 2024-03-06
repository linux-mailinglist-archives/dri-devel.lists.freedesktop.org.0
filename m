Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7D873C73
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46629113337;
	Wed,  6 Mar 2024 16:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SUEDYfnl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D28A113335;
 Wed,  6 Mar 2024 16:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjI3lvBHkJ0eJnsIZYHEPGYZL/n6O0JhUJ878FwiNqdn/xqA/HzLcX6/be48toB9wWccRsQx9YhZsqhIE6DJbvV1nyvUniCAw0SHmiVXWXWERplkuKZYxcXzTv6utznHeK1zBPip4bBlnSoA29rO/S3sq2+Xmg90PxOomgrkHIxwYhDEhJuMl1/7nRwu3okZMf/SvdU20gE2PPM7z6I9wMa8+FVYvltHlE0g0/j27E2z50vRbR8yS1jYhyhSpkRBs2TYxnXE8BKDp1HTAAGMc5qQimoHW1v8Cvqyaq/6poAnJY1fA1EHptg9fidu51csI2/O+cxX1s+hHgMwCdA18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLFyoJCcg2QAg+5svbW0mUwp/w91gb3c/MQ3qrGzsrI=;
 b=gNVb5470LwlzVNRE+lQ+4bo4QUKTWX8YZmzKooNflov8It61yIwIK4iGyIW29WRfLpfoqCLJzzlCxGHVpcMGkKz3zooa/MAgFyNFrEZ6++k7x7x4KkXVBqDL8QXjUDZxz/qcX0+pl6I4T88mEE53VIxsJXGiW+fp4m6YZAeWj/XfEQeup0sVemrHwRlGtYgvAvg/blEEEGvRDd1TkZb2GaLSAamJg8K8vl+XkJ1BXlI5bHlnrl+Mi96pYHE15NzUg4Z5yRaIxHvW+3Xzkp6zMGGNcjVKXjzoV9XTPHHU9qvSmIc50cJbjMCqNs5rB0K1yF9b6RpqhfyYSNDbXvt2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLFyoJCcg2QAg+5svbW0mUwp/w91gb3c/MQ3qrGzsrI=;
 b=SUEDYfnlCltS2uGOnvyCzxpTQdje4F4vUFD0oSThMZhBfLxD9qdYn4W+g1Rd2n8Tm46qlG5uo+SHrZ1HshlvTb06ozF4ZdH/wSrxWlZIgGXrIj18FCBWHXbekNqym0FAF+/t7spWgTvQuaSOWUrvd3JZUUNwR0oZvMLlI+SOPbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 16:42:03 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:42:03 +0000
Message-ID: <4cbc93e2-ae53-4296-84eb-7f0442b810e6@amd.com>
Date: Wed, 6 Mar 2024 22:11:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
 <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
 <CADnq5_OkeH1x4YgSv6uw0HLb5c-5NOXnzQPJHsDvb=NmEePB-A@mail.gmail.com>
 <e5781df5-5244-465e-b986-c1802e1262db@gmail.com>
 <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
 <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
 <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
 <CADnq5_MzPxxGHEUuZBv9AWZ0cfdurPxf6jvXxuTPfTkJ5he3yQ@mail.gmail.com>
 <81f2c1bf-6c44-4d7c-aab5-83fa097a21ff@amd.com>
 <CADnq5_MRZSJ3uzfyaHvzt63pEvoXki3K-UoLrNVKV2wAcB2J_g@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_MRZSJ3uzfyaHvzt63pEvoXki3K-UoLrNVKV2wAcB2J_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|PH8PR12MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb9575a-ec37-441f-a40a-08dc3dfc59f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1V7he5yeEvFz1d007vetBjkpSDt4t9FanjinYYuTJL8/so8/2uc6yLyDEgfA7uj5RGeNiS6K9Tmq10UjNS8bx/fYSh8g+Q4hWfiRtcNMEG2AgjRfq7qLllVmtXs3BpOpuXDHoHjZXI2Ut9gMFVKIFvbMpqgKkqRY/KA6SMf4Tb2G1M14J35/rIlDejJipQE/uGEQJX2C+ZfBq5sF/txJ041MzGcZvx5r7afQnOx3DoNUQNYf+4w0Xe5PbQoCXh7vs6KuddfPVeKGDmNfhI8xbHcNx0IRxfrpOV2OjSN4wGM6aI8Cd6ZdxCfAKjb5jNbU3gbOZEsJr9VwgMq0+TYbEEwZzEqWI0wdWD62ouqbAnLXh22jIm/+iKzOWtUIFz0Y3Y5rjW/bd3tnKVUUVLJUDDur4MBdBp1vYhZML9qC1OKIA1pfOxgbh/FoIPtqqxF4SjGYNFBk58WsOEfGg54Rla0bZcKkEp5MT/xGNTLcKS41S2I6h0wZk4VcX76sEw3cepWKnJQR4Ix/mLmdSVh68l6tcWNH0ejnpvLnoKJDToLrHujbRJ3PzhJXmrhzmlLn4nOocf3h5CA5PR+GEw7tOx+4pSjDq7UiK2WkC4mnvO4JVs7p0Epsyq3aCg0MSWP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFNwRWR5aTREUnd0aTVtcnFLNjkzVlE4ZGlGVzk0VGlCVy91R25kNWM2bzcx?=
 =?utf-8?B?NnI5ZjZ5bWtZVzlSMDdxdTQ4eHZ1aXdHL2czaUZXdVlVK0N5SjhWaGJ6Vys1?=
 =?utf-8?B?eFdsVzhRdVgrdktkWHZoMTJwRjVsNk9jYWdpOW1SdWRCbHlWZUJtOFZVRW5F?=
 =?utf-8?B?WDRtYzR0enJINkZld2dBeWpXb1k0NjJ6SDQ1aElLaTA0QzFZSFV1b080RVNo?=
 =?utf-8?B?d3JoUUU0NEE0UGxGakIyMkdQMFRqMTJncHVaYmUxTWpzZ2oxYUcwbHVHVHlo?=
 =?utf-8?B?WTBBNjdZY01sVE4xbEFPcTF4L0lhNFJqTlQ1OFIyWkJXOFFmbDliUXFtbnlD?=
 =?utf-8?B?Y1FZN3FqMm1YQStuVEdBdHJLaFIzbnY5ZHRWY05Odk9JSW9uNklNcUYyMU0w?=
 =?utf-8?B?M1F1QjNMNVZsb1cyT3gxbDdZZVNrZzQ1eDZNUWRxR3FXaXdzUEt1a2tudUYz?=
 =?utf-8?B?WjNoUUJQRFNkMUNSOGlhWnFHemZ0Z3BPaVFrRmRuRkRMRWVKd0hueFNLbDVx?=
 =?utf-8?B?Yk9sa1dMNXFTWXZqSTRMdGEyMEIrK0MrT0ozNTMzeVlhVXFoamZTbmNGLzlU?=
 =?utf-8?B?Zi9WdDBMbmd4Y3QrQTRXb2kzdTZlbkFwQ25wWlZ1a053bmFGekFBOWRNS3U4?=
 =?utf-8?B?RUNOU3JzVDc4Z2EyNWRvVitkaXBqQlZjalA4a2prb3E1cVZRSUhHR091VVRq?=
 =?utf-8?B?RWZyWFJMZkpweFpHYWF0UnBMbWtuZnhuSFNoQlVOeXBIcUMra2YyMStYcEJ0?=
 =?utf-8?B?aUVkWmpXYmx0aFJVQnFBT1c0QlFtb0FsWGIvR0FIRVhLOEJpdFVKZ3hrQkc3?=
 =?utf-8?B?SnBRZm5hQVVrMXBvYUY3bWEvamZ0OVYwRFVaNGZnRGw4THEyZEh1ekZiSTZM?=
 =?utf-8?B?a0w2QkRGeTc2S291Mk02VURsREFic1M5RTJYN0g5SHdwbDN5VmNKOGIxdXEx?=
 =?utf-8?B?bGs2a1lxMkUwN0dTZFhuUEhpYTJBeTR2RktkVlU4WHBjM0c3QXdZZWRvL0FR?=
 =?utf-8?B?a1hTbjN3K0JpVE5VQUlEUlA4VituQm10ZHpudnhRaC8xRWtyYys3cnVtMWtt?=
 =?utf-8?B?OVN0Z2dWOUV3V1BBcnUrL09OTWhHb0lPTWNCSis1cXl6ODBiSHgwWXp6ZjNU?=
 =?utf-8?B?c21tY0Exb2lLVmozd2VUbEFtVUtIMnRYdzg1VHNJSGNlMTRQcytKN1Fsck9J?=
 =?utf-8?B?STE2d3gzclk4ZmVyemZQZEh1ZjRscHo0YnNmaWw3RGZaTXNSTTdVcVN0Q0VV?=
 =?utf-8?B?am8rOWs2bkxJZWhDNU9DdGw2VzNtSDRPTndlbWRBZTNJKy8wQzNwZWVZcjQ1?=
 =?utf-8?B?czZLeGxzRXdsMHBsRE42QUM5d3dIVVpwY2FpRlVuZnlINWNXdjlXaC94U2Yw?=
 =?utf-8?B?WllrZ1FqMVAycVJaTUgzVWZ0ODkyTzNKbHkwU1Y1VUlmaWc5eEkvK1ZoRmRx?=
 =?utf-8?B?V0ZwcXBZanlLTEZSNUF5Tk1CMStFbVladElPeVN5NXZUM3F3MWwxSXlNNi9R?=
 =?utf-8?B?SHpXME9HT0J1c1M5NmZBbGR5WVdZamdnMWV4NVZjUThqZ3NUeEh3eXFUclE4?=
 =?utf-8?B?Z25pWFhlYXZrNVdtdjA4dHRlbzZYVlVkbWhsaGdjS0VqQ0RqVCtJeFBoU2dL?=
 =?utf-8?B?K2ZpMFU1ZVorVGhMUFNLZTJ1d25YQkdaRHNGOUt4Uy95UXNsZENCL3RLK2Z0?=
 =?utf-8?B?S0FWNWxEZU5OT05vdHRNL0tUZWliallMYXUwbU1RVXdaZVEwYllTTWJXWVkw?=
 =?utf-8?B?V0xFWVVBTGRic0l3RFhEUzIyMEo2d1BFSmNSYVJhTDJmRjA0Rll0bnFHeGVI?=
 =?utf-8?B?bXNocEpOTHJBdTd0bDRSZms0NktqVy8vU08vZi9ZU3NWRTA0V09sd3ZOY1N3?=
 =?utf-8?B?T2hUazRUYzZvZDNBb21JNUdlUm9FVHAwZkJaNHV3SXR4VnZuU2Y1aHA3RkpD?=
 =?utf-8?B?b2xFdlFMSXdnRVUya0x5bzc0THhZV1o1NUNjL0RZU3J2czQxSWJ1VzYyV1Bu?=
 =?utf-8?B?SjM5dW5jTkU3YzcyZFU5bjZOMmM2cXltalVXK1lxMkNmVnRlTTFtdUl0anUy?=
 =?utf-8?B?Y3RmUHBjL1BnRHVYU0FHNTNWUmFBM2E0MUdPNUxxVkhPTVIxRWV6cjBJVDNq?=
 =?utf-8?Q?x6jAA/ogXM5XiihVKpIQaEjOU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb9575a-ec37-441f-a40a-08dc3dfc59f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:42:03.1178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0aOv1rEJdt4UgfRY05BVj+rvblw3CdNnwQzB/hFgUkGqgMYj3eN87UfSWdS+bsVDZipyccDxhpgdFOEpv4BZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868
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


On 3/6/2024 9:59 PM, Alex Deucher wrote:
> On Wed, Mar 6, 2024 at 11:21 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>
>> On 3/6/2024 9:45 PM, Alex Deucher wrote:
>>> On Wed, Mar 6, 2024 at 11:06 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>> On 3/6/2024 9:07 PM, Christian König wrote:
>>>>> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>>>>>> On 3/6/2024 8:34 PM, Christian König wrote:
>>>>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>>>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>>>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>>>>>> is a lot more information that is useful for
>>>>>>>>>>>>> developers to analyse the pagefault.
>>>>>>>>>>>> Well actually those information are not that interesting because
>>>>>>>>>>>> they are hw generation specific.
>>>>>>>>>>>>
>>>>>>>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>>>>>
>>>>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>>>>>>> provide like node_id and fault from which die but thats again very
>>>>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>>>>>>>> is not there in v10 and v11.
>>>>>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>>>>>> dumping this information which is useful like which client
>>>>>>>>>>> has generated an interrupt and for which src and other information
>>>>>>>>>>> like address. So i think to provide the similar information in the
>>>>>>>>>>> devcoredump.
>>>>>>>>>>>
>>>>>>>>>>> Currently we do not have all this information from either job or vm
>>>>>>>>>>> being derived from the job during a reset. We surely could add more
>>>>>>>>>>> relevant information later on as per request but this
>>>>>>>>>>> information is
>>>>>>>>>>> useful as
>>>>>>>>>>> eventually its developers only who would use the dump file provided
>>>>>>>>>>> by customer to debug.
>>>>>>>>>>>
>>>>>>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>>>>>>> good information but new information could be added which could be
>>>>>>>>>>> picked later.
>>>>>>>>>>>
>>>>>>>>>>>> Page fault information
>>>>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b
>>>>>>>>>>>> (UTCL2)
>>>>>>>>>> This is a perfect example what I mean. You record in the patch is
>>>>>>>>>> the
>>>>>>>>>> client_id, but this is is basically meaningless unless you have
>>>>>>>>>> access
>>>>>>>>>> to the AMD internal hw documentation.
>>>>>>>>>>
>>>>>>>>>> What you really need is the client in decoded form, in this case
>>>>>>>>>> UTCL2. You can keep the client_id additionally, but the decoded
>>>>>>>>>> client
>>>>>>>>>> string is mandatory to have I think.
>>>>>>>>>>
>>>>>>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>>>>>>> memory interaction to minimum as we are still in interrupt context
>>>>>>>>>> here that why i recorded the integer information compared to
>>>>>>>>>> decoding
>>>>>>>>> and writing strings there itself but to postpone till we dump.
>>>>>>>>>
>>>>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>>>>>>> string from client id. So are we good to go with the information with
>>>>>>>>> the above information of sharing details in devcoredump using the
>>>>>>>>> additional information from pagefault cached.
>>>>>>>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>>>>>>>> status, and addr).  client_id and src_id are just tokens in the
>>>>>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>>>>>> know what they will be because otherwise we'd be in the interrupt
>>>>>>>> handler for a different IP.  I don't think ring_id has any useful
>>>>>>>> information in this context and vmid and pasid are probably not too
>>>>>>>> useful because they are just tokens to associate the fault with a
>>>>>>>> process.  It would be better to have the process name.
>>>>>> Just to share context here Alex, i am preparing this for devcoredump,
>>>>>> my intention was to replicate the information which in KMD we are
>>>>>> sharing in Dmesg for page faults. If assuming we do not add client id
>>>>>> specially we would not be able to share enough information in
>>>>>> devcoredump.
>>>>>> It would be just address and hub(gfxhub/mmhub) and i think that is
>>>>>> partial information as src id and client id and ip block shares good
>>>>>> information.
>>>>>>
>>>>>> For process related information we are capturing that information
>>>>>> part of dump from existing functionality.
>>>>>> **** AMDGPU Device Coredump ****
>>>>>> version: 1
>>>>>> kernel: 6.7.0-amd-staging-drm-next
>>>>>> module: amdgpu
>>>>>> time: 45.084775181
>>>>>> process_name: soft_recovery_p PID: 1780
>>>>>>
>>>>>> Ring timed out details
>>>>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>>>>
>>>>>> Page fault information
>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
>>>>>> VRAM is lost due to GPU reset!
>>>>>>
>>>>>> Regards
>>>>>> Sunil
>>>>>>
>>>>>>> The decoded client name would be really useful I think since the
>>>>>>> fault handled is a catch all and handles a whole bunch of different
>>>>>>> clients.
>>>>>>>
>>>>>>> But that should be ideally passed in as const string instead of the
>>>>>>> hw generation specific client_id.
>>>>>>>
>>>>>>> As long as it's only a pointer we also don't run into the trouble
>>>>>>> that we need to allocate memory for it.
>>>>>> I agree but i prefer adding the client id and decoding it in
>>>>>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is
>>>>>> better else we have to do an sprintf this string to fault_info in irq
>>>>>> context which is writing more bytes to memory i guess compared to an
>>>>>> integer:)
>>>>> Well I totally agree that we shouldn't fiddle to much in the interrupt
>>>>> handler, but exactly what you suggest here won't work.
>>>>>
>>>>> The client_id is hw generation specific, so the only one who has that
>>>>> is the hw generation specific fault handler. Just compare the defines
>>>>> here:
>>>>>
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83
>>>>>
>>>>>
>>>>> and here:
>>>>>
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38
>>>>>
>>>>>
>>>> Got your point. Let me see but this is a lot of work in irq context.
>>>> Either we can drop totally the client id thing as alex is suggesting
>>>> here as its always be same client and src id or let me come up with a
>>>> patch and see if its acceptable.
>>>>
>>>> Also as Alex pointed we need to decode from status register which kind
>>>> of page fault it is (permission, read, write etc) this all is again
>>>> family specific and thats all in IRQ context. Not feeling good about it
>>>> but let me try to share all that in a new patch.
>>>>
>>> I don't think you need to decode it.  As long as you have a way to
>>> identify the chip, we can just include the raw status register and the
>>> developer can decode it when they look at the devcoredump.
>> Got it Alex.
>> I will try to add chip information along with status register value
>> only. We have below two values in adev, i think this along with status
>> register should suffice.
>> enum amd_asic_type        asic_type;
> You can skip asic_type.  It's not really used anymore.
>
>> uint32_t            family;
Ok then only the above family id  is fine. Do we need a string to say 
the family name or the integer value is good enough and developer would 
decode based on it.
> Please also include the PCI DID, VID and RID and
> amdgpu_ip_version(adev, GC_HWIP, 0).  You can include all of the IP
> versions if you want for completeness, but GC should be enough.

Sure noted but i will add this in a new patch which is to add info of 
all IP's of the GPU.

Regards
Sunil.

> Alex
>
>> Regards
>> Sunil Khatri
>>
>>> Alex
>>>
>>>
>>>> Regards
>>>> Sunil.
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> We can argue on values like pasid and vmid and ring id to be taken
>>>>>> off if they are totally not useful.
>>>>>>
>>>>>> Regards
>>>>>> Sunil
>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Alex
>>>>>>>>
>>>>>>>>> regards
>>>>>>>>> sunil
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Regards
>>>>>>>>>>> Sunil Khatri
>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>> Add all such information in the last cached
>>>>>>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>>>>>      drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>>>>>      7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>>>>>       * Cache the fault info for later use by userspace in
>>>>>>>>>>>>> debugging.
>>>>>>>>>>>>>       */
>>>>>>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>>>                        uint64_t addr,
>>>>>>>>>>>>>                        uint32_t status,
>>>>>>>>>>>>>                        unsigned int vmhub)
>>>>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>>>>>      -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>>>>>          /* Don't update the fault cache if status is 0.  In the
>>>>>>>>>>>>> multiple
>>>>>>>>>>>>>           * fault case, subsequent faults will return a 0 status
>>>>>>>>>>>>> which is
>>>>>>>>>>>>>           * useless for userspace and replaces the useful fault
>>>>>>>>>>>>> status, so
>>>>>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>          if (vm && status) {
>>>>>>>>>>>>>              vm->fault_info.addr = addr;
>>>>>>>>>>>>>              vm->fault_info.status = status;
>>>>>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>>>>>              if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>>>>>                  vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>>>>>                  vm->fault_info.vmhub |=
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>>>>>          uint32_t    status;
>>>>>>>>>>>>>          /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>>>>>          unsigned int    vmhub;
>>>>>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>>>>>      };
>>>>>>>>>>>>>        struct amdgpu_vm {
>>>>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>>>>>      }
>>>>>>>>>>>>>        void amdgpu_vm_update_fault_cache(struct amdgpu_device
>>>>>>>>>>>>> *adev,
>>>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>>>                        uint64_t addr,
>>>>>>>>>>>>>                        uint32_t status,
>>>>>>>>>>>>>                        unsigned int vmhub);
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>              status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>>>              WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>>      -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>>> addr,
>>>>>>>>>>>>> status,
>>>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>>>>                               entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>>>          }
>>>>>>>>>>>>>      diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>              status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>>>              WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>>      -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>>> addr,
>>>>>>>>>>>>> status,
>>>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>>>>                               entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>>>          }
>>>>>>>>>>>>>      diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int
>>>>>>>>>>>>> gmc_v7_0_process_interrupt(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>          if (!addr && !status)
>>>>>>>>>>>>>              return 0;
>>>>>>>>>>>>>      -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>>>                           ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>>>            if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int
>>>>>>>>>>>>> gmc_v8_0_process_interrupt(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>          if (!addr && !status)
>>>>>>>>>>>>>              return 0;
>>>>>>>>>>>>>      -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>>>                           ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>>>            if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>          rw = REG_GET_FIELD(status,
>>>>>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>>>>>>          WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>>      -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>>>>> status, vmhub);
>>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>>>> vmhub);
>>>>>>>>>>>>>            dev_err(adev->dev,
>>>>>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
