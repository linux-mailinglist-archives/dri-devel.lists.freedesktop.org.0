Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D78547CBCE1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD2C10E286;
	Tue, 17 Oct 2023 07:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8A710E283
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOsAK4225282S0l4gO9ggmUlaX1Xgqw8UQqQKq206/N6AcjuL7108tzaA76IU744TuRUXskH4zm/c7x260IBdHvF4ZMXaZVpCyLqKWRWhaQNlnD1P+2dChjeRVkaw7z1gQDm6bAcvyHRnfUQ/eWNdrrH2NYcM/JqSAcgZs1qTglWvtUA29vMOQvBxtkecc48f1rIDUyUbjcLCBNMeAm6ZdAGI467n1v1kBhRWX8dKiEu8qy2pocbF+YPJlAqLXU2VfMfn0kmWNY0B45qHWMiDs+Z7JGRxUv+LgIb3uvWiUoOKuVQd4BAvmntUAHlCAoFcY9hMAZx8IanL35v9nijcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llD2ogoCGJQSjqKDF8C9uioEX+pPIhEKNQELQJpTV0Y=;
 b=k+th+aoZ03N8w+pPXa+HFGn6qME1P8dQqzKjbUYWLUpJpM/NU+eoGyjN6S5FAzmBNKNqeu0WFBjU57IJiHWqaTEhgkR0UBmJgQJSiz5N4TK7wZXaF67G6k1z/DTVjcQHg+nrUJmNAF/fiUjwAAjJYdD+3vDdTnq6NI7H16ajjpg1EHvwPX7mcQ8ur2suBlOX8pcdhfaUnCKeLpzApUVSkZMrZRqnJX1sAjQCHzTsRzssvGaJSNrPMdq8+UcAAg5k8rC+oWuensRPmcxP1GCU347V5ApDhMh7MJE6JvHd1riEsZ7s1zyFv9JVxWjLMYgh+zuUnGZgUJgye5lXKG4pTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llD2ogoCGJQSjqKDF8C9uioEX+pPIhEKNQELQJpTV0Y=;
 b=neg0znLuYnZVFSs5V03H5oKXVK5s70SY1mZmBdTt8+zgfKw8EQyGF319mxbOYjQSbLSfK/kzkdQpF+bWN/JxeZrEV5SEF3AdXOsbybMQThDqHJ2jfcm780axSX7tmE2hmwEU7fA51vXHxUqjw9YyHF4+HecKamhV2kF4j/1h5xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5992.namprd12.prod.outlook.com (2603:10b6:408:14e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 07:55:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 07:55:16 +0000
Message-ID: <9cf04f0f-0273-41e5-91a0-1595be21399f@amd.com>
Date: Tue, 17 Oct 2023 09:55:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com> <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
 <ZSkQxEL4596_pQW1@phenom.ffwll.local>
 <a4a5dc87-001b-2948-e74f-8c51d170b9b2@mailbox.org>
 <ZS44j1dIkurL4ExN@dvetter-linux.ger.corp.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZS44j1dIkurL4ExN@dvetter-linux.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 454997cf-b97e-4e3c-2249-08dbcee666c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMYmOvVstpKdk+2hEeU370VzsZBwhhsw/L3LSBmIMunTPzEGLVg3rM6ndQa+nDu0DAKqIwFkhggu3KBUcdYd02m0tSd6e2U5N5jMObpjyozL9jPjAkkn5v2TI0EDmjM/VSNSO+EeUPLzRK06XbYSCLw1L8zA/cu7SR6sQTxkFJFCHFYjgtluTW4JG5hkFs85IB09oitXYIKrMmv7hGPOE5VF3qsQelg3V1NRpyKpQFJAC5Xo1atB1F5NmX75LWIKLJTWKSAtodtabNMC25aNHGbBHN44Y36JXPOsdF1KAyrKrc2TKsu5IcBFJeo6OhXZk3MksmAYfLRYlrJY8wxt5L0iY8SG0QZf+qDwH+DSt9OAWTyGEEgt2CDyUUEI3xJFfNpcYfqZls9qDwCto9NdPyv5c50yK8jOze9sm7y68QH6rf5m658pFJQaDHpupkc4MMXjYuUpvGtlUI5ZpmSbCI62NOmYTMxo0UzV8VOwHneCg1ifr2bD0VatqG08NTLDtuN101xZUZ0SSkXlV+SsrnJWb23Qnjx444QS4r4AicLCwoZyBHyHLHK1pxNrp/m48B49tklVjgjViVqEP+S/SMbmE9h12a80+52dmfw5lbDiSxYWx4paiy+4+QSBciLfLAdfvNOLUR0nZgAPWkrc9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(110136005)(6486002)(36756003)(38100700002)(83380400001)(66574015)(26005)(6506007)(6666004)(66946007)(2616005)(478600001)(66556008)(66476007)(53546011)(316002)(41300700001)(31696002)(86362001)(8676002)(4326008)(6512007)(2906002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXZKQys0TnF6bFVxQ1pJYWxzOU15UUE4bkE3UU5sT3hxWEpIeFlMSCtQVnc1?=
 =?utf-8?B?UXU1VWFRdUVzK2RNUmJtQzNUM05XalBDU3pGQWtMSGZheTl1UW4wb0ovNi9X?=
 =?utf-8?B?TUp1UlU2cG9saFZ4TzZid0d1TE9vajZDaWxsNHpXaDhkNWR5NThKbk1yNjZr?=
 =?utf-8?B?U0V4cXVOU1BjbDA3ai91NGhZazhtMG9aWGlRNVNwU2FZT2V1bTV4NlpFVWdD?=
 =?utf-8?B?dkZNSkhZWFlaNU5vQlV2cXIrK2Q2Uk10RGJmbjhMRXJlOVZhWUNHZVAvZ0p1?=
 =?utf-8?B?VkZLNzFLb2lGZFBBTy9EaVFROHQ2QVpPbTBINmQ3TEZlUzVSeElOWDB6S05k?=
 =?utf-8?B?OERBcnA3aU9wVC9TVFZkTXl4c05pL1dCc2ZuVkJTYkwxWXdWQ1A0YW5rcjEr?=
 =?utf-8?B?RTIzcXhZdHNSQzhIR09UQXJvY05JMmZtcEtpN3pRVTU1TmlPZHY3VnVCSitO?=
 =?utf-8?B?QmdIVTY0SDhBQXlIcGlnbjZOZ2RFWG9RQnd6R1B3d05hTzRHN0UvU2dESTIx?=
 =?utf-8?B?S2pBUHRoSXF2SWY4ZjJkZmVTQ2dHRkJEeU05SGNvQ1ZJMlE5NnFyS2ovdkd3?=
 =?utf-8?B?UHFmNWsvT2s1RWtZQno4R3Vkd0JPU2o0SllIWnpSYVAyME92ck1BZSsrdXk3?=
 =?utf-8?B?RGxlMzZPV3ZZV2tub2pSWUo2czNsd1h2ZWRhdWZpejdnN21FbzZMdUFpR3pv?=
 =?utf-8?B?UXpuT0lQZHNXdllXQmZJanVsa1g2RFVXbThnNWtFRmdCOUVvVTFGT1EySjdI?=
 =?utf-8?B?dWJjdUZSaFF0MTd3VWJCcEUxcjRQUUtvd1Z2RENPaWdxMEhmUFJqTE8wVnpT?=
 =?utf-8?B?WFFhU3NjTVk1dmNVbThBT1RUUHdHcUxnelFTVjE1eHBkYWV3MXliNkE1K3Nw?=
 =?utf-8?B?ZExzSTNNM0FXeGppeTF3aWhjRXIvVmNrSEpwTngrcTVZTnRxV3FLREUraWd5?=
 =?utf-8?B?YVppZjdCRmRKM0l4T1BKUjh2aXMrYmc4T3lSd3FUK2hJSGd6MlhSak8zZDN1?=
 =?utf-8?B?N2ZnNzdkZC9LQnFMMFF0T2RVRXFYbTFmWDlhc0tKc0FKVUZqNUNnUVZKbEM3?=
 =?utf-8?B?S3dzczNNY3dSNTNvWjZvYmlUZWI4U3doQmgzQVdBRFBob1hreGFSdzJCdFZZ?=
 =?utf-8?B?QVRiS2pSOWNDMnVVYmJJWEJUTEhxKytUbkMyWmdqSGtwbWNxaEJSUjh1QlY3?=
 =?utf-8?B?N0JITUoza3pMSHZoamsvbDBJcVVScllheFBXdzJtcUlrd0pEcW8wc256T1pm?=
 =?utf-8?B?UmFzNml4MzNwU3JhSVRTVlJJQ3NYck9EM1VvMlB1ejd2Nk9nVTNHQ084Wng1?=
 =?utf-8?B?WC9USWpoZGI2aUk2c3NqR0kwKzNtWFpVMkFsR3dBVzNLaGNQNTdwOHdFajJ2?=
 =?utf-8?B?eHVONnJ3UDI0aUlzWDB4NnhoY3lOcHNkUUVNc2RVZmxXT1cybis2eC9nN3kr?=
 =?utf-8?B?OWd6V29rT1BjajhDdzBNUXB5Rk5NUWZhenVzTHhudUNJdEFtMnRYUE03cCt5?=
 =?utf-8?B?M2xoOWFYdSsyTmxwLzhseHZJMUdoVFpaL3JnNUZVYnN4R1l5RUFxOWkzREhG?=
 =?utf-8?B?M2lIejNCeVc1Qks1K0dSK0VCTEVNYzBlY2NiSk8wSFR1QndHQnBPMGw0SG1X?=
 =?utf-8?B?dVc2UUw1ZThkSEh4VnBuNS9oVXVKSWpwMlB6VFFuWnBYRHJNQ1JodnVSKzZq?=
 =?utf-8?B?NFl4MkJsZzJtTHh4dE5VZWw0Q0lFd2hzS2haSFozTVdnN0N1WVVaR2VXZG1a?=
 =?utf-8?B?WFBEbjROdGwzdUNCYzZPRHlMMDBiSzd1aW8yc2tOamZDS2Era1pYKzNrcTRY?=
 =?utf-8?B?TVFrZEhRbkRlNlAyR2xYZWdxOCtlM0tHSDRZUUtuOW9OY013UEZ2YjJlUEx6?=
 =?utf-8?B?blRRdEdML0J1UTROTWxmWWhUL0NMT2tDc3NYaVN4YWNPM1F4dmpWUEI5V3Bk?=
 =?utf-8?B?RzRWVWRYc0I1d1BmVVdsNFlmWjZ3bG82ZnRETWRZSFBJSzBDb1h0d2lzL2FE?=
 =?utf-8?B?Tm81MzkzUStHRDAzQ3RtMTJ4N01EcFRNeE8xdVI1RHJFeTJ3QnBaMjArMGlp?=
 =?utf-8?B?TmpPd3hma282UHJmUXl2NGFock92YUpWVVJwa3o4ek0xdUJUeGp3WkpoVVFt?=
 =?utf-8?Q?j6oUqMug8EHz81LSwLoakKwK0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454997cf-b97e-4e3c-2249-08dbcee666c1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:55:16.6141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAOv0rb6sikVyYqrgOK/y5rk0+pJmjxyl8cXRl1jFLFzyyiJxHUf2QdQJaAReACg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5992
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
Cc: Ray Strode <halfline@gmail.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.10.23 um 09:32 schrieb Daniel Vetter:
> On Fri, Oct 13, 2023 at 12:22:52PM +0200, Michel Dänzer wrote:
>> On 10/13/23 11:41, Daniel Vetter wrote:
>>> On Thu, Oct 12, 2023 at 02:19:41PM -0400, Ray Strode wrote:
>>>> On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian König wrote:
>>>>>>>> To be clear, my take is, if driver code is running in process context
>>>>>>>> and needs to wait for periods of time on the order of or in excess of
>>>>>>>> a typical process time slice it should be sleeping during the waiting.
>>>>>>>> If the operation is at a point where it can be cancelled without side
>>>>>>>> effects, the sleeping should be INTERRUPTIBLE. If it's past the point
>>>>>>>> of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
>>>>>>>> opinion, should kernel code busy block a typical process for dozens of
>>>>>>>> milliseconds while keeping the process RUNNING. I don't think this is
>>>>>>>> a controversial take.
>>>>>>> Exactly that's what I completely disagree on.
>>>> Okay if we can't agree that it's not okay for user space (or the
>>>> kernel running in the context of user space) to busy loop a cpu core
>>>> at 100% utilization throughout and beyond the process's entire
>>>> scheduled time slice then we really are at an impasse. I gotta say i'm
>>>> astonished that this seemingly indefensible behavior is somehow a
>>>> point of contention, but I'm not going to keep arguing about it beyond
>>>> this email.
>>>>
>>>> I mean we're not talking about scientific computing, or code
>>>> compilation, or seti@home. We're talking about nearly the equivalent
>>>> of `while (1) __asm__ ("nop");`
>>> I don't think anyone said this shouldn't be fixed or improved.
>>>
>>> What I'm saying is that the atomic ioctl is not going to make guarantees
>>> that it will not take up to much cpu time (for some extremely vague value
>>> of "too much") to the point that userspace can configure it's compositor
>>> in a way that it _will_ get killed if we _ever_ violate this rule.
>>>
>>> We should of course try to do as good as job as possible, but that's not
>>> what you're asking for. You're asking for a hard real-time guarantee with
>>> the implication if we ever break it, it's a regression, and the kernel has
>>> to bend over backwards with tricks like in your patch to make it work.
>> I don't think mutter really needs or wants such a hard real-time
>> guarantee. What it needs is a fighting chance to react before the kernel
>> kills its process.
>>
>> The intended mechanism for this is SIGXCPU, but that can't work if the
>> kernel is stuck in a busy-loop. Ray's patch seems like one way to avoid
>> that.
> I don't think signals will get us out of this either, or at least still
> has risk. We are trying to make everything interruptible and bail out
> asap, but those checks are when we're blocking, not when the cpu is busy.
>
> So this also wont guarantee that you expire your timeslice when a driver
> is doing a silly expensive atomic_check computation. Much less likely, but
> definitely not a zero chance.
>
>> That said, as long as SIGXCPU can work as intended with the non-blocking
>> commits mutter uses for everything except modesets, mutter's workaround
>> of dropping RT priority for the blocking commits seems acceptable for
>> the time being.
> Is there no rt setup where the kernel just auto-demotes when you've used
> up your slice? That's the only setup I see that guarantees you're not
> getting killed here.
>
> I think dropping rt priority around full modesets is still good since
> modests really shouldn't ever run as rt, that makes no sense to me.

Completely agree.

One more data point not mentioned before: While amdgpu could be improved 
we do have devices which (for example) have to do I2C by bit banging 
because they lack the necessary functionality in the hardware.

And IIRC transmitting the 256 bytes EDID takes something like ~5ms (fast 
mode) or ~20ms (standard mode) in which the CPU usually just busy loops 
most of the time. Not saying that we should do a full EDID transmit with 
every modeset, but just to give an example of what might be necessary here.

Christian.

> -Sima

