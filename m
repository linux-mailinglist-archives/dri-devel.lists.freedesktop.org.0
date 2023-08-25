Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C109788095
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 09:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CBA10E614;
	Fri, 25 Aug 2023 07:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D706A10E614
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWNmJ2gnmY57Euuf1jNvn6QAMr8JYxym2cjWC6rtVAarRjhjqrPU9Br2IXusmUv4Wn4/XuS/fxJVyT/eE53zqGOgic8ECY7uzvBg8OBQjtMqN9g4ZQhYTjm9mJY9vq6uc3odIsRNUkv1/jMiDjNPRpomM3nP8ZiXATVWAcfSn288fkEnB75eGhTegXzoW8pxTeb10m5FUmrunzzXg+IJQF1Ka9H6DEZsikPPYeBl5UIOzNLNbjGxGxJWvAUC0+1769Wi1QLQkZGwZGXouB6Eiy5QdTA3vtqT77ju8J/cO10kF8kweHZ/Lwt/HsVgvCo/2m8hmsxgzJT1IkoV4EnRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JcPVN51sCRdjh7XUkMRQXRAdJDq4AX4Roiowi/Gp9g=;
 b=D+XhGmgdUa2uAtZTB1X8QjK2Zbjx/usp0+H2OmSgOBHWdiYWzJggkJwoiGCgPnLZEwViX5HvyRZsZQ5alRnWgywFwnAgdOtx3h74uulCGAfF3DSoECK5IhB1vBReR+xn4CXq2S8bOWlL48FTH2TZkN8Xav6lRYMb4d+j5flQ1UdvPvT6qNiV9q39yKXA4Hxoar7Euk02ugWWRkEgwyesXPENoCfs5LxGJQcLQTWHm8eq7+xjaT1817L2gO+a570pgmk8ir0e3mI97Mmn6iPfM6NM0B10CJPaa8Q2qbKiQK5grOs6XcnRfKBIiE7eIu1H89HhbDaUYTdedS6ECmswxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JcPVN51sCRdjh7XUkMRQXRAdJDq4AX4Roiowi/Gp9g=;
 b=weOZ0mO87fokkuFkYkP7bvK5/ApNj9BjjgDtiSNhosQ5BUBqZHADoc3WbHQwiP5CV+m7EMHfewEXaej2cRGiAUXHZMpeiOvFjKjZnhUOA2mZbPRA79eSHwPT+ten9aoKQMbauOzOwGtcAO7lHvZG1/j/sJwrLLTdVc19GGdOhUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.29; Fri, 25 Aug 2023 07:05:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 07:05:43 +0000
Message-ID: <fa90b3dc-0de7-ee10-b448-bab543074096@amd.com>
Date: Fri, 25 Aug 2023 09:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [BUG] KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] /
 drm_sched_entity_push_job [gpu_sched]
Content-Language: en-US
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org
References: <43668e49-c2c0-9979-9de3-b4904c2a8f82@alu.unizg.hr>
 <36b4e667-c287-1614-fe1f-5e772850d1fb@alu.unizg.hr>
 <b74a5cc3-8174-67f3-17ab-2e8a7d8fa1a6@amd.com>
 <5d83d59a-3c49-aae7-61ca-de9c2f3ba9c9@alu.unizg.hr>
 <d321918e-6f3b-4984-9163-427b579dc57e@amd.com>
 <52eb519d-2cb1-2036-65af-0737714967f0@alu.unizg.hr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <52eb519d-2cb1-2036-65af-0737714967f0@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5289802b-3ab8-48e2-3a9a-08dba539b2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNDCiaSuIXmuIR4tA/tLgsuiAGyvRB07x/EIBreNkC61a/9U5wg9RWOtN/FozYZbuG0ht4PejDzWdMBv/dko+ZMf1Ul1EIxjgBS4b41jGUOGJXVT62V+089fohsgS5huSAC/Z5VKiX4xTViDU7YT/vlT9EYKAM+K0l+gn795ba+jG6bNgaujcqvM3pE530Pp6dhowZ0LOWJ32b7UhNlWRfsmRMC/rSBZVSAFJegThzFp63o1lrwOtVR3snfZCd7IBBcZaOjkXS1rJpOlC41aGu7cHXpGVVWw7ccnNwt3zfoJ+AABRmPtNq8MraDpFiEEj/Ow8K8kgL1eUcfZvwsOpbMD2Ziv9jaQA11nPpdv+ghWzkbv4mivsA/gWad97AxBU06CL0MSQ+38cC9Sr0ys04IpoCUpFFmo2AWT0AGgeR2gzT29+PJd7scB/swvIRIQKvOB4HReDNYFUhVRPkQ3kDHf6lZNz8KCqr9l3U1hzhdbhafzFBf01qF2biWx1z/8Dsbd116jlV3x6eZS//b39Nc4fLR7xsKj+Px8pfcHTpQk+BMG2w7BV+xFl4ZDtp0nf+fKKU8R05C2v4UFUco5E3kAml1HZtDXPyoo1JgKo6+oNF2kQ0zQn2XGxz6v50a5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(1800799009)(451199024)(186009)(83380400001)(6512007)(26005)(66574015)(478600001)(2616005)(5660300002)(31686004)(966005)(2906002)(8936002)(4326008)(8676002)(38100700002)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(54906003)(6506007)(53546011)(6486002)(36756003)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um5VVTBSZ0tUUGdEcjZnZzdaNVpZSTdLdXBqSkNxL3JzcU56L1FMd2l1MVU0?=
 =?utf-8?B?bHRnaENqdzRwc3U5NjdYaUR1aHJ1ZFFPU0xSNEtsRHNPYTFBcDh3RFNmWUlU?=
 =?utf-8?B?ZkZzUjdBbUREY25OZlc4V2M0bFB4RWk2Y0kyUm5Pc2N4c0NhYWJVRXJyU2Ju?=
 =?utf-8?B?YUxPUnZCQlFmS0swOHEzTEpBWjZHVXZJNDhKa2d3OEdmSXovZWsxelVUMWVy?=
 =?utf-8?B?bmJ5Qy9sSWFzVzBQK1dFVlgwOGRhek1MQ2xxYWxnNUhuYndqNXE0MG1QNy8r?=
 =?utf-8?B?MzJPMVRhZEF0bzREcFlleHRQOG9xenBmK1FBdkxGdm1NcG9aY2ExRmNqWVhJ?=
 =?utf-8?B?SU0zY2VMZDdsbHNwRnE2K1M4SkRleW5IeUNEOHhFd05FaUpPc2pzZWFGQWY2?=
 =?utf-8?B?UlYyQWgxa0o3SHJCTGZQVk8rZE9GT3VrTW95M3JzQWxSbHdXL2NDa3JuWXdY?=
 =?utf-8?B?QlQxUnhxSDV4SXBJNlFNczVGMnZpVmUzR2NLQUU5N1BtclcrWkVBT3ZlQkd2?=
 =?utf-8?B?VS9DR0pGUW9wRVNTMlhXdDQvS0xzUXh0U2tIVkl5WW52QzFKWFZkVE5wWm1l?=
 =?utf-8?B?VFhkMXpmZWMyNGVyQWs0S1UyR2RqK2ZaTWJVRTdmcGVMYWZGV1VrbEpmZGdo?=
 =?utf-8?B?dzZrVmdkRC9TVGFlS3o4VFk5R3dKTVF6Z3JYLzYrMkk3YXNwTzJnTlRKMGhT?=
 =?utf-8?B?ZURsVWt0WTRySWIwaXE0UWdlZ2thdDc0cC96bk93cnpuRFhDMHQ2cVFqQ1Ex?=
 =?utf-8?B?c1Z1T29sNHViYXYramNhM0dza0Nzb0ZVSkVqRWxKbGs2SzNZb0ZiTUJvdWxR?=
 =?utf-8?B?Ui9rL1gzcnVwczlpZzZJRVJkTnZON2ZXMGhvL3E5bGo1SEkxRVdKeHBpckIr?=
 =?utf-8?B?d2krMnEwSlJsRnN4bGdnb3RZemJQQmlza2xqN082K0xEdDRCcHp3UVpQbC9Q?=
 =?utf-8?B?Tm40b1dhK25LVldDYWlGRmpVUEh5cklMcEs3M3lvNVhndUxrenBDNVlLRi9n?=
 =?utf-8?B?Smo1d1lYU1JiM3BvWmhHUVh6dmZqek42cEFsMFhrUmpKR3NTc1ZkZ0FlS1cy?=
 =?utf-8?B?SjVOSHU3ZWtScGI4a1A0ZTBWSVkvc1NwQU9oZ0UzL0hvaDNXRmdGUGxJbnJk?=
 =?utf-8?B?M1E2eENtc3lwaWFnWVFhL2JxUlZNcmlzQUtkTDBxMVFUaWV2d1JHNDl1c0l5?=
 =?utf-8?B?REJkK3dOejFlOVdvOUxuQzdwM0Z1dTVaRUZnMVdWQmpoZDgvZDIwWlROTjZL?=
 =?utf-8?B?Q0Z1aEtCbG9TRFNtVUdLMHpyYzMvUDU2K3RCb0FLNVMyS3dtS1lyMTJkMno3?=
 =?utf-8?B?U2FFUHBTWjN2S0FYM3F4WC8zbUhEWExONWovQkpZMlZUbENmcjkxKy9LTDNp?=
 =?utf-8?B?cjlIUldUNkhrbEF6MWthYVJYTFRiZHRlaEl0SWVqNnZaOVB5d1JaN3VxeUNk?=
 =?utf-8?B?N2hNbWJDelJqNHBmODV5MndmVUUzbzEvb3o5OUw2QVpqWVM3R2NGRFM5cXl6?=
 =?utf-8?B?Szc0citpYjJOMWgyQ0pTc0FtZGgwTXIxNm92eU5CNWNrdXRMVmNtMjdkU3B5?=
 =?utf-8?B?VDdjUjhkNVBQYzY0L3Y0UHBXeVBNbTNjdHVGYzRUSTFDbkdkZ0QzRmFKN2t6?=
 =?utf-8?B?b2VhVzJ2MFZFUm5qS3Jtcmd2dE9wNGdtWmY4VUxqL2duSjlPcVJWUnZLY1RV?=
 =?utf-8?B?QjMwQkZ5WWhpR0NJb2R0dE1nRklpZTdPT2dNWUVEWGNEaVBISVhieDlvQzk5?=
 =?utf-8?B?Z0dQc1pleHBTaUh5Smtvb2puOU5HWmh1SmhvM2U3K1VsV0ZGbUltVm9aRFNn?=
 =?utf-8?B?RFVyZ0VlOGZ6QVZRdWM4cWVyOGFkVFZOaXRqZ05Ka3BnamxWeHRnRmFzTFZ1?=
 =?utf-8?B?K0ZYUHc2V2Q5c3NZbk0zSDRRcVRPZFRPRFEzNkJRaTlaaUhrRHA1Qm9kWGk1?=
 =?utf-8?B?OUJPT0Zpamp3OUJYS1FHYUU0NzRqOUtJdEd5MlZVSFFQNDJjNTViVWZYb2F5?=
 =?utf-8?B?dXpuczJ4N1N4TkdSdGgwS1pHRXc1QUdtN1MwdTdEVVN4L2NsK2dqWU9VM3VF?=
 =?utf-8?B?WFg1c2tLR2Z0UWt5Vy9qT1hhTnJrWldpQTNsSC95cVJWZnkwSnliMWVFdHdi?=
 =?utf-8?Q?6dqHhvjj3UT9j5pwA8gnsxeo9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5289802b-3ab8-48e2-3a9a-08dba539b2b6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 07:05:43.5795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZNF7CMzWsZsNHkdasTSjFrE8NfSSvP9EC8wVIinzbBmO4/Aocsq+jVA+YyIAQLm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962
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
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mirsad,

the name SPSC stands for SingleProducerSingleConsumer, so yes even by 
the name of the component we make it clear that this can only be used by 
one producer and one consumer thread at the same time.

Here disabling preemption is just done so that the consumer thread 
doesn't busy loop for the producer thread to be scheduled in again.

Regards,
Christian.

Am 24.08.23 um 19:46 schrieb Mirsad Goran Todorovac:
> Thank you, Christian.
>
> Glad to hear about that.
>
> However, I guess this assumes that this piece of code between
>
> -----<>-----
>      preempt_disable();
>
>      tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, 
> (long)&node->next);
>      WRITE_ONCE(*tail, node);
>      atomic_inc(&queue->job_count);
>
>      /*
>       * In case of first element verify new node will be visible to 
> the consumer
>       * thread when we ping the kernel thread that there is new work 
> to do.
>       */
>      smp_wmb();
>
>      preempt_enable();
> -----<>-----
>
> ... executes only on one CPU/core/thread?
>
> I understood that preempt_disable() disables only interrupts on one 
> core/CPU:
>
> https://kernelnewbies.kernelnewbies.narkive.com/6LTlgsAe/preempt-disable-disables-preemption-on-all-processors 
>
>
> So, we might have a race in theory between WRITE_ONCE() and atomic_inc().
>
> Kind regards,
> Mirsad
>
>
> On 8/21/2023 8:22 PM, Christian König wrote:
>> I'm not sure about that.
>>
>> On the one hand it might generate some noise. I know tons of cases 
>> where logic is: Ok if we see the updated value immediately it will 
>> optimize things, but if not it's unproblematic because there is 
>> another check after the next memory barrier.
>>
>> On the other hand we probably have cases where this is not correctly 
>> implemented. So double checking those would most like be good idea.
>>
>> Regards,
>> Christian.
>>
>> Am 21.08.23 um 16:28 schrieb Mirsad Todorovac:
>>> Hi Christian,
>>>
>>> Thank you for the update.
>>>
>>> Should I continue reporting what KCSAN gives? I will try to filter 
>>> these to save your time for
>>> evaluation ...
>>>
>>> Kind regards,
>>> Mirsad
>>>
>>> On 8/21/23 15:20, Christian König wrote:
>>>> Hi Mirsad,
>>>>
>>>> well this is a false positive.
>>>>
>>>> That drm_sched_entity_is_ready() doesn't see the data written by 
>>>> drm_sched_entity_push_job() is part of the logic here.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 18.08.23 um 15:44 schrieb Mirsad Todorovac:
>>>>> On 8/17/23 21:54, Mirsad Todorovac wrote:
>>>>>> Hi,
>>>>>>
>>>>>> This is your friendly bug reporter.
>>>>>>
>>>>>> The environment is vanilla torvalds tree kernel on Ubuntu 22.04 
>>>>>> LTS and a Ryzen 7950X box.
>>>>>>
>>>>>> Please find attached the complete dmesg output from the ring 
>>>>>> buffer and lshw output.
>>>>>>
>>>>>> NOTE: The kernel reports tainted kernel, but to my knowledge 
>>>>>> there are no proprietary (G) modules,
>>>>>>        but this taint is turned on by the previous bugs.
>>>>>>
>>>>>> dmesg excerpt:
>>>>>>
>>>>>> [ 8791.864576] 
>>>>>> ==================================================================
>>>>>> [ 8791.864648] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
>>>>>> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>>>>>
>>>>>> [ 8791.864776] write (marked) to 0xffff9b74491b7c40 of 8 bytes by 
>>>>>> task 3807 on cpu 18:
>>>>>> [ 8791.864788]  drm_sched_entity_push_job+0xf4/0x2a0 [gpu_sched]
>>>>>> [ 8791.864852]  amdgpu_cs_ioctl+0x3888/0x3de0 [amdgpu]
>>>>>> [ 8791.868731]  drm_ioctl_kernel+0x127/0x210 [drm]
>>>>>> [ 8791.869222]  drm_ioctl+0x38f/0x6f0 [drm]
>>>>>> [ 8791.869711]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
>>>>>> [ 8791.873660]  __x64_sys_ioctl+0xd2/0x120
>>>>>> [ 8791.873676]  do_syscall_64+0x58/0x90
>>>>>> [ 8791.873688]  entry_SYSCALL_64_after_hwframe+0x73/0xdd
>>>>>>
>>>>>> [ 8791.873710] read to 0xffff9b74491b7c40 of 8 bytes by task 1119 
>>>>>> on cpu 27:
>>>>>> [ 8791.873722]  drm_sched_entity_is_ready+0x16/0x50 [gpu_sched]
>>>>>> [ 8791.873786]  drm_sched_select_entity+0x1c7/0x220 [gpu_sched]
>>>>>> [ 8791.873849]  drm_sched_main+0xd2/0x500 [gpu_sched]
>>>>>> [ 8791.873912]  kthread+0x18b/0x1d0
>>>>>> [ 8791.873924]  ret_from_fork+0x43/0x70
>>>>>> [ 8791.873939]  ret_from_fork_asm+0x1b/0x30
>>>>>>
>>>>>> [ 8791.873955] value changed: 0x0000000000000000 -> 
>>>>>> 0xffff9b750ebcfc00
>>>>>>
>>>>>> [ 8791.873971] Reported by Kernel Concurrency Sanitizer on:
>>>>>> [ 8791.873980] CPU: 27 PID: 1119 Comm: gfx_0.0.0 Tainted: 
>>>>>> G             L 6.5.0-rc6-net-cfg-kcsan-00038-g16931859a650 #35
>>>>>> [ 8791.873994] Hardware name: ASRock X670E PG Lightning/X670E PG 
>>>>>> Lightning, BIOS 1.21 04/26/2023
>>>>>> [ 8791.874002] 
>>>>>> ==================================================================
>>>>>
>>>>> P.S.
>>>>>
>>>>> According to Mr. Heo's instructions, I am adding the unwound trace 
>>>>> here:
>>>>>
>>>>> [ 1879.706518] 
>>>>> ==================================================================
>>>>> [ 1879.706616] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
>>>>> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>>>>
>>>>> [ 1879.706737] write (marked) to 0xffff8f3672748c40 of 8 bytes by 
>>>>> task 4087 on cpu 10:
>>>>> [ 1879.706748] drm_sched_entity_push_job 
>>>>> (./include/drm/spsc_queue.h:74 
>>>>> drivers/gpu/drm/scheduler/sched_entity.c:574) gpu_sched
>>>>> [ 1879.706808] amdgpu_cs_ioctl 
>>>>> (drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1375 
>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1469) amdgpu
>>>>> [ 1879.710589] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:788) drm
>>>>> [ 1879.711068] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:892) drm
>>>>> [ 1879.711551] amdgpu_drm_ioctl 
>>>>> (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2748) amdgpu
>>>>> [ 1879.715319] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 
>>>>> fs/ioctl.c:856 fs/ioctl.c:856)
>>>>> [ 1879.715334] do_syscall_64 (arch/x86/entry/common.c:50 
>>>>> arch/x86/entry/common.c:80)
>>>>> [ 1879.715345] entry_SYSCALL_64_after_hwframe 
>>>>> (arch/x86/entry/entry_64.S:120)
>>>>>
>>>>> [ 1879.715365] read to 0xffff8f3672748c40 of 8 bytes by task 1098 
>>>>> on cpu 11:
>>>>> [ 1879.715376] drm_sched_entity_is_ready 
>>>>> (drivers/gpu/drm/scheduler/sched_entity.c:134) gpu_sched
>>>>> [ 1879.715435] drm_sched_select_entity 
>>>>> (drivers/gpu/drm/scheduler/sched_main.c:248 
>>>>> drivers/gpu/drm/scheduler/sched_main.c:893) gpu_sched
>>>>> [ 1879.715495] drm_sched_main 
>>>>> (drivers/gpu/drm/scheduler/sched_main.c:1019) gpu_sched
>>>>> [ 1879.715554] kthread (kernel/kthread.c:389)
>>>>> [ 1879.715563] ret_from_fork (arch/x86/kernel/process.c:145)
>>>>> [ 1879.715575] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)
>>>>>
>>>>> [ 1879.715590] value changed: 0x0000000000000000 -> 
>>>>> 0xffff8f360663dc00
>>>>>
>>>>> [ 1879.715604] Reported by Kernel Concurrency Sanitizer on:
>>>>> [ 1879.715612] CPU: 11 PID: 1098 Comm: gfx_0.0.0 Tainted: 
>>>>> G             L     6.5.0-rc6+ #47
>>>>> [ 1879.715624] Hardware name: ASRock X670E PG Lightning/X670E PG 
>>>>> Lightning, BIOS 1.21 04/26/2023
>>>>> [ 1879.715631] 
>>>>> ==================================================================
>>>>>
>>>>> It seems that the line in question might be:
>>>>>
>>>>>     first = spsc_queue_push(&entity->job_queue, 
>>>>> &sched_job->queue_node);
>>>>>
>>>>> which expands to:
>>>>>
>>>>> static inline bool spsc_queue_push(struct spsc_queue *queue, 
>>>>> struct spsc_node *node)
>>>>> {
>>>>>     struct spsc_node **tail;
>>>>>
>>>>>     node->next = NULL;
>>>>>
>>>>>     preempt_disable();
>>>>>
>>>>>     tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, 
>>>>> (long)&node->next);
>>>>>     WRITE_ONCE(*tail, node);
>>>>>     atomic_inc(&queue->job_count);
>>>>>
>>>>>     /*
>>>>>      * In case of first element verify new node will be visible to 
>>>>> the consumer
>>>>>      * thread when we ping the kernel thread that there is new 
>>>>> work to do.
>>>>>      */
>>>>>     smp_wmb();
>>>>>
>>>>>     preempt_enable();
>>>>>
>>>>>     return tail == &queue->head;
>>>>> }
>>>>>
>>>>> According to the manual, preempt_disable() only guaranteed 
>>>>> exclusion on a single CPU/core/thread, so
>>>>> we might be plagued with the slow, old fashioned locking unless 
>>>>> anyone had a better idea.
>>>>>
>>>>> Best regards,
>>>>> Mirsad Todorovac
>

