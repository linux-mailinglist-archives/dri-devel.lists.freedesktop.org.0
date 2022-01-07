Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B91487456
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8002F11AF75;
	Fri,  7 Jan 2022 08:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7E111AF71;
 Fri,  7 Jan 2022 08:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAQCd5u9zlnT1+4BZJ3/oGgtihoXVo/l0D4JqYa9ifydHq7KJKK8D5MtaT+R+sFLNscFOLVsQRXPr+Dxw2Gz87xM8J3BYB/gqlKdxLPpf1bmGPpMvA/D4OLFsLDTTP4wPcrOw3JoBYmwJgr/ziOlKDMvTREBCz6Z1wLlFnbFj045H7RBWRshgaOZpHo8CniAA55u/c1cG7hip7ya+tbbv+/IinLHQRg3jYv2jaUN9JaCj4TW2bo2I28VVU5iapwhpPtQlPdGLt+ZFc45BxHzKndFG3Y04ytus+ORAXbW2E+L8l/rmntbf6MM7flKBAUEogXBfZP9ixjxfzyGnEN42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maYhnf7XfCY/klm6c7XBErmI0/S7aSUBlOZ44/Iz1CM=;
 b=Fk6Q7QmaGL/5Dd7V5wpurfjSxZp3rUVnA2Dy3F3iUnWcEYpi9NcTOosKvj2v8x9+hjLw5E/aI1wrlvccaJI3BkW+Ih4ECKOzWPGfP7MbTKcIVK8qUYwPaGdm9U6W5kwwPHFTBpCzBTILWsxfbFqDC+0pyIVgGmRcdgFy2sl+kVQPazdZ60KSAdDvr1Q4Q1RafEbFy6eO/hxTZ4OBBy0n0P92UDTZXJDojDCO2Rc1qvkpEEg/Ym3aa8M3hlTo6etXR6jl2xA64yG911HnHtQjg+iCdzKwhwsQIUB4R9teGckZR18hCAleJAVQIkLCNorBC/SAKmEJuUo64rgYeQLk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maYhnf7XfCY/klm6c7XBErmI0/S7aSUBlOZ44/Iz1CM=;
 b=dbaduu0C8i5/4CxUN+aq4p43zf28d5EBMRHdIkaZd2M8N7sr8RfiMeCK0UrJBAjN4cjyc/JFqHVEwFCf/mVK85r9utkZM5ZB1DD9aNYlHcxbtPbIXT7xPWnIKAlI91QMVy0C4jVIR20iHGWvZy3f52vV1WgKQc4fFeZbG2d8nIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 7 Jan
 2022 08:56:56 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 08:56:56 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
 <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <386142cc-1df5-228c-af24-2187998d9307@amd.com>
Date: Fri, 7 Jan 2022 09:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be1ff76-4b9a-4873-bdfd-08d9d1bba785
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2478:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB247826FDF2E6DCC3CEEA0316834D9@MWHPR1201MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lm7C+0rRWqcAhgk+yMYAB3FxlMr57LxPG25i8jDTClBLADFomNlj78nwlH9qoM/sKxST6SwY5z8/zdUeDa8vIZa59CjsHlsA0Ub3mD8iKdSXezw9kbUsBRSRiBu7ZXZ04KlWYzOMTNVIE52F4XjcM+DfuZNqHifw9FOhevc5uqOaFmbeRiNDNRdiqD6/NnJwj0SWJgrF3D00WpJ9nWnQ4qxXBDa9Y9AeiXyo/hBwuipTGtv2+f9C/9VmV0PJis6gmghPfLkxib1LFzQphW/ABOmG9hQSh8jMt3JVwqRuAA4VXztqxL7lG0Pc5PItZr7Zl17/WquKkk/R0Ra2YEGuImGpWD/3z1Pjwwl8k4JIRA4NIjHbLiSJLxbEEUZR9KswAuXZjk6M3r+VAAqeC2rH3UasRczlZ0nNKRvgzmo6t4QCbJpCo33A7hgSdttI0l0guGDWAMtikQmhRfCIyl/rw9aBMvopcXix4XsYq9MIyrK1UBDcp4GjLiASmbDmn29+t4LZQMvFwlNxxbbF9OWDGVspIr9B1OcZu8/zVi9WzNCrowg4LVBSwsfqsGYMaG5BYPmOOqp4LAq1B1+T/QCkteNOiu3XKwRiCdAJJ5tTTATluBlfFvi6VbT4nGnFF5EgQdkmrIs6BqXo1SGTjJgruR2zNj0JWKCZ3ze6l+PkMbRxX4k+U4US9ByjQq8Uhrj2y1KXVYnB8XzBtsNyDVlpj5VinzQzMg7I1CxIiTZu9OCqCE+jWpsKZB3VXr1eH+FV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(110136005)(186003)(316002)(4326008)(38100700002)(66476007)(66556008)(66946007)(8936002)(508600001)(5660300002)(6666004)(2906002)(6512007)(8676002)(36756003)(86362001)(6486002)(31686004)(31696002)(83380400001)(2616005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZhS1JMcG9JMVprUUNtZVo0b1VVbHVNbnQrRUsrdmNOZlZveHNUSTdBRk9X?=
 =?utf-8?B?V3BXRFczSG9sTmFnYkVPaDNXMVBiMno1enJYM3pTL0dzOWV6ZjJzUStNVFJS?=
 =?utf-8?B?L2lUakZ3OGZMbmg4NTJYcVV5RXd0YktuOGNScjlYRXRtR0M5bC9jMEdxcVF4?=
 =?utf-8?B?SThrVEtCa2JBNzMyaldqc1lmckdkMDVRZ1NQTEtRb3k2V1prTHBMZDFxeUZF?=
 =?utf-8?B?VlhPWGlJQVozRFN6NmFLY2cyUFZVelpBbW5ZOXZRSXFiakZLNlJNMW9sVzlm?=
 =?utf-8?B?eWt3eXlZN0t0elhLS3hTdG1KUlFESDM0VzZCdGkxNmp2V0tLMkVWYklSVFJh?=
 =?utf-8?B?eFlqYlE4dDFoWWx6amRvR2RycDNBN095ZnBmVGwrMURsUVgrT3k1cnZ4a0hV?=
 =?utf-8?B?eWZXQUpEQkozaDQzQUZZcnFwTjBzclF5N0V1WUs0bU9BZ3FQQURyejlJNmx4?=
 =?utf-8?B?azI1cmd4Ry9yUzJkdkkrcHY4bm5ycGdCS3d3dE1WaW1WQUxWVmUrbTJ1Ykdp?=
 =?utf-8?B?VVVLUTNQNUM3M0tRTzMvYmxwV3BWMnUzaGw4Z3ZPN3BWRDdYRkFiUmpLOUhy?=
 =?utf-8?B?UmNjbzhKdFgwcjdyaExnWEpmR0E0aUdyazRGZDJiZnpwYmpESEk5anRhZzdI?=
 =?utf-8?B?WUVXK0lsWEtCVVY5MnlSMnJYTWdLZlNJMVZwVGpXZm5JMTNmTHBwYTQzZzhJ?=
 =?utf-8?B?NFdnVnAyU2MxSkg1ODhlWUthRldnZjNXcVdxa2VWSE5nS2V5VE8zYzhINGl6?=
 =?utf-8?B?bFh1NWcyVVVBUGNTTlh5K3dveVMwc1g2dWJvNlpXbENqTkl0Y0FpT0xzWnRQ?=
 =?utf-8?B?RW9kdlV5bWZ3c3hmQXdqT0RVc0lSOFdjZnFsOCtqNVBqU243SXZuL0hIaEM0?=
 =?utf-8?B?SGltT3JQSDA2MldWODJ3UHZLek5Ec0xYOTZkdlE3RzdwQmVtYWFaR25DeWhv?=
 =?utf-8?B?cG9GNW13dXJSSXVJT2IyNWM2WWVkWU5pbmVWUTBYQ2NuQlV2REw3ejhvTllZ?=
 =?utf-8?B?V2tTcXEydFBpdEJnOGxmazkwamd3am5SV2w5SzRZTVFPamdKVGV4L1NXZWcx?=
 =?utf-8?B?TzA2QzZleFZ3RmVZSjRiYWhEb0hia1BPbm1mMy9ma1QxWGkxRFRmZDArQkNC?=
 =?utf-8?B?d0dHNXpoejE3Rmwwenp6OS9jNUlkczdHSGtsYWVSWlVQNllxbi91K0RBMWFT?=
 =?utf-8?B?Y3FnSjhVaHlxUmU3SXlUaWhjZnJLSGFQa05aS2RiTXIwNkcvdnlHZnJkTSt1?=
 =?utf-8?B?a2V1cjBrSlBmUGxJRkZEU1NJMTQyTnkyNjNrbHJkTE0rSjF4bEJzUDVldE5Y?=
 =?utf-8?B?QU1CR3Q1Y3lmRy9abm50cExIUnp0Um96Qzk4V0pVYWx0bXFUSWw4SmJlK1B5?=
 =?utf-8?B?MG9remtGOWxCWUFVUHVSanF3cDlzN29tTTVTOUV6ZmZhR1dScUs5OGQwbDlH?=
 =?utf-8?B?WUtLNFRveGdmUXZMcGRqZFllKys0ZzgxVHR4SUdFaldQK3lkZ1o5SURydzdG?=
 =?utf-8?B?V1lmR1Z3R1dRZ09kWW9DUi9PcUM1OWFvVlRlSk91dGlUZFpFUmdxRERDM2Vs?=
 =?utf-8?B?eENNdldyM0RxSUg4bTdNcUNOVURVYjRQTzlnUmtKT3Q0UHN6SDRzeWpGOWFr?=
 =?utf-8?B?bHMzckF5Tjg5clB5MWJVZUlDZkZYNjhMTzYwSW5NaDhWa3JHSVcvYzJzQ241?=
 =?utf-8?B?TmFCSFpMd3J1eFUvMjk5bUYxY1NLaG42bVVsUXpjMG96Uk04RE5zdnJEWmQ2?=
 =?utf-8?B?RVJqT0VYTVBZbWl4ODZseUtpSCt4TEhXWDRkOHBnQjlzMVJ6RzU0cjBNYlBq?=
 =?utf-8?B?OWdMMXlvZVd5OWdiYVY1dzAvK3ZwdjNIVWZQYm1ad0VjTWN1RHFyYnk0bWM4?=
 =?utf-8?B?dE0ybnRZZjY5NnF3TFlHSXdRQnl2SFNpd0NRYkluVWptT2tVYkRHRmFKaGpv?=
 =?utf-8?B?UFZ0NndYYkoyUVd5cDhmZk5CblZVZ2J4cmdpekNQMFFMb1dIN0h2dXgyRlJQ?=
 =?utf-8?B?WU1TZGkvc3RnSXBTTmtPMTBmRGVTUDV3eG4yU3pvZGx6WW0rNThZSEEwT2JE?=
 =?utf-8?B?QnFLUlJLWUZFWVcvcGk0aWhmclFWczVqZ1ZjakcybVNOM2xTQXJKNExmdWFm?=
 =?utf-8?B?RUZscEZ0azF6eWNaL1BrdVluejVLeEROMDA1OFpZbU1KdGVkRVBEVG03NmJJ?=
 =?utf-8?Q?YKS87GYXYTDuMvRby2giukY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be1ff76-4b9a-4873-bdfd-08d9d1bba785
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 08:56:55.4909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iNEoa0yujne97aF6Ru11O1ckxEZ2t1DrJG7vNam00/ZpGmv9D3He0ta50Hvb0/WB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2478
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.01.22 um 17:51 schrieb Felix Kuehling:
> Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
>> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
>>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>>> [SNIP]
>>> Also, why does your ACK or NAK depend on this at all. If it's the right
>>> thing to do, it's the right thing to do regardless of who benefits from
>>> it. In addition, how can a child process that doesn't even use the GPU
>>> be in violation of any GPU-driver related specifications.
>> The argument is that the application is broken and needs to be fixed
>> instead of worked around inside the kernel.
> I still don't get how they the application is broken. Like I said, the
> child process is not using the GPU. How can the application be fixed in
> this case?

Sounds like I'm still missing some important puzzle pieces for the full 
picture to figure out why this doesn't work.

> Are you saying, any application that forks and doesn't immediately call
> exec is broken?

More or less yes. We essentially have three possible cases here:

1. Application is already using (for example) OpenGL or OpenCL to do 
some rendering on the GPU and then calls fork() and expects to use 
OpenGL both in the parent and the child at the same time.
     As far as I know that's illegal from the Khronos specification 
point of view and working around inside the kernel for something not 
allowed in the first place is seen as futile effort.

2. Application opened the file descriptor, forks and then initializes 
OpenGL/Vulkan/OpenCL.
     That's what some compositors are doing to drop into the backround 
and is explicitly legal.

3. Application calls fork() and then doesn't use the GPU in the child. 
Either by not using it or calling exec.
     That should be legal and not cause any problems in the first place.

But from your description I still don't get why we are running into 
problems here.

I was assuming that you have case #1 because we previously had some 
examples of this with this python library, but from your description it 
seems to be case #3.

> Or does an application that forks need to be aware that some other part
> of the application used the GPU and explicitly free any GPU resources?

Others might fill that information in, but I think that was the plan for 
newer APIs like Vulkan.

Regards,
Christian.

>
> Thanks,
>    Felix
>
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>     Felix
>>>
>>>
>>>> Let's talk about this on Mondays call. Thanks for giving the whole
>>>> context.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>>      Felix
>>>>>

