Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6366B1D4B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 09:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8110E7A8;
	Thu,  9 Mar 2023 08:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EB510E7A6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 08:06:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOz8R6LWeAuv0U+Di+X1aoYSorF1vwF9QtqqZd75ZrIO/BinBD4LaeixyAXrxvUAWWg470NfbvV2XPPkKGS0z2/WvZNw/y20LrUMpgWHg87Wm1S42gKeH5aPdYFk/lUu5yLUE4T4OLzUtZEtyeNFeC4HXkQwHhvHAarYGRTZi/J5mSb4y8paO8wOubgMb4/gwv1mX6dnYufg40EupI8bX2uHyPW8EIeAa8f9TM25AyJpKq67YaEhqRUDAfZ+fU8IlsYO9kcc3lV29H32NF3POWTbnWsWSzq+MARXKWLv0v052rgQQMFk6LeMNM67kYGX6cEFIdZCCtCvgKFFb16aHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7Zsip1WQpEb5AxlIi9nL3EM+jx/pA438H0eFny95q0=;
 b=ZrUAAGy3OZWi44uxKGU9SdZLz36FV79Id2W6ydEnyx4IAjya1nH0cXJCc0LsT4EDg0rxDTN02zBwMh5KWt6rcEWdB1oRLoHlgUTr5dLW+JRCKhhK9coEk9B3gAm/O0fs7mc30eR1qrXOzZ1uKsioi3qkHVaVnQtceGEH8TjhcxF64RNVAl8cQG13IKakl7ECih0gSxmycdJf1+5ltxS/bT3h31mCQQbmk71sllTiniclm8jft4a0lJmtukc3Txzx/iIiXwk11HadaMXwBelKac/jFutBQETRz0+vyvttxnLP7ErmdJmAlxnA9kjGcXnuGg5I6nBDdHp2urC+T0Vu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7Zsip1WQpEb5AxlIi9nL3EM+jx/pA438H0eFny95q0=;
 b=DyUf4QUtP/6ZT38+uzgvqdpM2gTLtlOMYNC7IA1gtzP//U78eXopCtPDHBr+LP+qbh9YuqEFJGCzoQIFABWMOZj5dJ8OgUFOFHOnhChtc9F7VJOeh4EwVCnJBZxZSmo76olT55i3dB1fwJacIHhpxSOC/Ra52oEjYXN4/zHF11o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5328.namprd12.prod.outlook.com (2603:10b6:5:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 08:06:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 08:06:05 +0000
Message-ID: <f93448e6-4133-8a49-a12e-7a7012cb5409@amd.com>
Date: Thu, 9 Mar 2023 09:05:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
 <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
 <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
 <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
 <3e5e0120-50fd-51c0-d817-5b1dc4c14e97@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <3e5e0120-50fd-51c0-d817-5b1dc4c14e97@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae74c51-6a11-40e2-9080-08db207521fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgFdnB5iYuuMzG4JjUA0NRNwMBHsXasK9slfyi0G6sJ5PV2XYGgVVIDUN3FTeOO9d+krRx4moMhoIAIwfquGXSF3lZAPtLifvnCP8e89UwKp1rcDXFnXHHaJZBhJ558sB6Lt+haEv+qX1UZ/LeSqatSfBHSncG6J01LQLxMb9zRAy62wsUVrt14zYeonGptqaQVgF3p773AZ5FtYwWBpj5OGgHMXAErH+55lYk93n+qoL2ndpRHQxVAnawAF2t1k4K8HLZiZoCAWxEXthWnU3w2X+5BCylhp6o3XyiM2LK0jSf/lcEcug+jvyoEvkisPZFcySODsHeqasQiyohkCrAfOYQVfI9CeLhoNDbqok54aPuU8pKfpuPVXDbLfLG/0SIAPNSMqU21LHHLUnw590wicuXgVMC8ma3tRP7uV+Oqk7YBx0sJQH/6f8mz/WOM5vdJl6yvnJsWpoSVtSGjp8uh+H0zX4hhWVNQmNFEM2hJe1FbPY8ZiUNIrduDNzJyvJ97EpdLtaoZrTLcdVOmEThjqeaqP/GtmOAxQpw8Pfh8rt+xoMSphY6CR/xqEvGWT8pKYBM64s2KpA01WCDYoCAUJXnmRKfITKDFSkF9WrsDAlQEuobNTzh5ELYelleH/0gigGP7e1YDPdH6KqmUKerUv23PwFPzMWYEFWf2Dl0jvcmf+x5YNUqHkJSD4mTg3jDb1DeHOmJOajFu8QbjAp+K6opkN0uDjKkceg7nlXkzvfVzBd/57zah/1anaYqaz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(66476007)(66946007)(66556008)(316002)(66574015)(41300700001)(83380400001)(8676002)(4326008)(31686004)(54906003)(36756003)(110136005)(7416002)(8936002)(38100700002)(2906002)(2616005)(921005)(5660300002)(186003)(478600001)(86362001)(6666004)(31696002)(6486002)(26005)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXhTejdqVlpKZ1c4TlFoanorTW1GWDBSWTZQVVV4UE5lcFpHVFAwdHVyZ2Qx?=
 =?utf-8?B?MXZFaWNBQ2tMeWs2ME96enRWSU1tQzZkcTdGeVN4N3ovUDFESm1LWUNzK0VH?=
 =?utf-8?B?cStEUzlJSnpXWENnNFQyY2F6UlNtakdHcEdYY1BSL3hORDdCTnpacGRHSUlU?=
 =?utf-8?B?dXNtbnJBTFZXdklQOG1DQ2YvUXp4NnJ5UUxMZ2VtODNaaHhXVWFnMitjVXZO?=
 =?utf-8?B?KzB4a2Fad2ZWN05hV0VEck8vaG5TaWMyNUVCWWxRb2R2UWVnVEN4SHREalRj?=
 =?utf-8?B?UzJ1VnhSL1EwSmZOcktRb1Z1bGZGNHRYZ05nK28wMGU5MEZ1M0tBc1FKb1lM?=
 =?utf-8?B?anFaa3A0R2M2Qm9CcXhOTnY5RTNJbU5COWxCdmJKa0FneUpYYWlobFdmc3kz?=
 =?utf-8?B?dmZZOUpIWkxRRnBXTGMxUVczbUFOQk1wZGpkUUxrUEVOVHdsT0RQbGJVWkp5?=
 =?utf-8?B?R1Z4MlJEemRxN0k1cW9JVlFTY0Q1TDQxT3cwN2FGWUsrbXNGemltVEVLZTJz?=
 =?utf-8?B?S1FiYnBFY2ViM2c2UHBtYlBMYmYwWG5LSk1Ya3Zid09vUjVobkY0OUVPdEhr?=
 =?utf-8?B?bkljYWFMMlJIWXE0akNvUFJSTitCazVMUU9qSUR1TExITkN5WlNFWEtWdWVI?=
 =?utf-8?B?YkpTRFFsTGtkNjNITVI2SC9ZKzVVV2dDZzVvZE4ySTVRanJva3J4Vk0yVnRQ?=
 =?utf-8?B?SnIyVmZybmU2ZXBuV3d2U3VsL3h2WEZOMUNxYWlHNlN6UjMyUGx4TzRmcWt4?=
 =?utf-8?B?M3RwRlRBTDIwdG1nTzlIQzVHWHJPRXRLa2FISlRic3Brb0YvZlhQemZKV1c4?=
 =?utf-8?B?UDNydzVpTEttUVd6MXlnTi9TdjJQYmw4UzM2SXpHekN5N2VrMmc1aW5PV1ZH?=
 =?utf-8?B?ZUlHSTRFR24wNnJSK3pqZjVWNE9CcjA4WDJGYVJDVzJwQnZNblA1aGx3NzA3?=
 =?utf-8?B?dXU2eEd1TFVKZG4yQ1R3eWNHc1ZZVDg1N3ZFQkM3YzBYMkJ6VWdGS0xPV2lM?=
 =?utf-8?B?am5KNHR3NUxsNlpic2hvVzc0U0R2Q2l3OXpyN3JhaGlWQVNjb2szSVdrMHhH?=
 =?utf-8?B?RUVnV3JhS0ZxWmgxZkhkRm5OTjBON0V6T255bnhieU5IVnBadXdzalRSdkJZ?=
 =?utf-8?B?amJYeXpLbDF4WlIwYlZYOWtWdStlbGJxZTZBZ2xlbmsxKzJwVjVPcEEwZklV?=
 =?utf-8?B?ekZmcjkrS0lKY1RnanVSZW81eTY4WDhXMDRvRTljc1F3ajJUZmVidy9qTEEr?=
 =?utf-8?B?UnRuTW9hOWhJTlRJZGhFam52T1dWcFhnMG5oamd2aUtwMVBsL3pKc1NmRytx?=
 =?utf-8?B?c2N1L1g4L1VEQzV1MGllVHlpaGYvcjN6dWgzTm5KVmhTVlA5b0M4YXRvUlhI?=
 =?utf-8?B?c0Y1UTF4L2h1bVNxU1NlcmZ0R1E3YVBpUDRra0NOZWoxM2dUVGRDc1VPb2xw?=
 =?utf-8?B?V0hFYkZZWjV5Qkx2dkdEL05NZnhGNFVyckVFYzZtOURhTDFWdjZ0WHJHRGY0?=
 =?utf-8?B?UEtmeEFaakNTb2JhcENqN1lvSUd0S2R4VEdkeUJsUXF6RVdQd3dLTTRGeGc4?=
 =?utf-8?B?RWE3bVR0cnBFZk1JL05GZGJWSnMrNWdSSUYzTEdBUUZSZ1c0aXE0MG4wS3FY?=
 =?utf-8?B?ZnpubXUxZ3dqU3huVVRzWWJLS3JLNE1rd21NY0txUy9ESjRIdkJ2cENYY0Zz?=
 =?utf-8?B?SlNibjRaSjNFZG5vY2NJN1BVVXhCRUJjSzcrREJ6ZUROM0k0Um9iRXc2NDZj?=
 =?utf-8?B?bzB6SWxGdkxaWHZWMitpQU1mVHM2WmQ4YU9oWUF0eXhacFp2M0w2NFh2RHhl?=
 =?utf-8?B?SXNmL0p1bDR2UU5qZzhVZ0N4NkR6aU1XcHQ4WGNCNjNBWUxVbzh0OEd3b0hz?=
 =?utf-8?B?Rm5GOWJ2RW1ibDVoT1ZDOUg4bldMTHM4cnVSSHI5cmp2M1NFcU1KODZ2SWtO?=
 =?utf-8?B?NSswQkx1TysyV0t3a01mbUt0WjFhbWhReGtQcGdCUEE1OEdLTjdqWFdxQ2hW?=
 =?utf-8?B?V0NXWFZXZXZJQ2ZyTTQ5a3V3VWVmdm9lQUttaXA4b09Salphbng3ZzBvTkww?=
 =?utf-8?B?RUlSOEFSUXlBS3dYamQ4aUw1bWxPQlAyZzZHN3BIdlJDeWZtUkVqTFErZGgz?=
 =?utf-8?Q?1PhrdaGUY0pvL5oF6rtO477+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae74c51-6a11-40e2-9080-08db207521fb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:06:05.8172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEsDZJ+Mj0HcqTIWT9xZfIOEqaOrJIttAGsVMuu5mrplSrOUf2VdlzQZzIftB8R2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5328
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.03.23 um 07:30 schrieb Asahi Lina:
> On 09/03/2023 05.14, Christian König wrote:
>>> I think you mean wake_up_interruptible(). That would be
>>> drm_sched_job_done(), on the fence callback when a job completes, which
>>> as I keep saying is the same logic used for
>>> hw_rq_count/hw_submission_limit tracking.
>> As the documentation to wait_event says:
>>
>>    * wake_up() has to be called after changing any variable that could
>>    * change the result of the wait condition.
>>
>> So what you essentially try to do here is to skip that and say
>> drm_sched_job_done() would call that anyway, but when you read any
>> variable to determine that state then as far as I can see nothing is
>> guarantying that order.
> The driver needs to guarantee that any changes to that state precede a
> job completion fence signal of course, that's the entire idea of the
> API. It's supposed to represent a check for per-scheduler (or more
> specific, but not more global) resources that are released on job
> completion. Of course if you misuse the API you could cause a problem,
> but what I'm trying to say is that the API as designed and when used as
> intended does work properly.
>
> Put another way: job completions always need to cause the sched main
> loop to run an iteration anyway (otherwise we wouldn't make forward
> progress), and job completions are exactly the signal that the
> can_run_job() condition may have changed.
>
>> The only other possibility how you could use the callback correctly
>> would be to call drm_fence_is_signaled() to query the state of your hw
>> submission from the same fence which is then signaled. But then the
>> question is once more why you don't give that fence directly to the
>> scheduler?
> But the driver is supposed to guarantee that the ordering is always 1.
> resources freed, 2. fence signaled. So you don't need to check for the
> fence, you can just check for the resource state.

Yeah, but this is exactly what the dma_fence framework tried to prevent. 
We try very hard to avoid such side channel signaling :)

But putting that issue aside for a moment. What I don't get is when you 
have such intra queue dependencies, then why can't you check that at a 
much higher level?

In other words even userspace should be able to predict that for it's 
submissions X amount of resources are needed and when all of my 
submissions run in parallel that won't work.

Asking the firmware for a status is usually a magnitudes slower than 
just computing it before submission.

Regards,
Christian.


> If the callback
> returns false then by definition the fence wasn't yet signaled at some
> point during its execution (because the resources weren't yet freed),
> and since it would be in the wait_event_interruptible() check path, by
> definition the fence signaling at any point during or after the check
> would cause the thread to wake up again and re-check.
>
> Thread 1                                          Thread 2
> 1. wait_event_interruptible() arms wq             1. Free resources
> 2. can_run_job() checks resources                 2. Signal fence
> 3. wait_event_interruptible() sleeps on wq        3. Fence wakes up wq
> 4. loop
>
> There is no possible interleaving of those sequences that leads to a
> lost event and the thread not waking up:
> - If T2.3 happens before T1.1, that means T2.1 happened earlier and T1.2
> must return true.
> - If T2.3 happens after T1.1 but before T1.3, the wq code will ensure
> the wq does not sleep (or immediately wakes up) at T1.3 since it was
> signaled during the condition check, after the wq was armed. At the next
> check loop, T1.2 will then return true, since T2.1 already happened
> before T2.3.
> - If T2.3 happens during T1.3, the wq wakes up normally and does another
> check, and at that point T1.2 returns true.
>
> QED.
>
> ~~ Lina

