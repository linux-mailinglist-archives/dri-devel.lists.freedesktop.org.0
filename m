Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A0783034
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 20:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD8310E104;
	Mon, 21 Aug 2023 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441410E104
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 18:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn6NZEsgSlwemVJV1m8W8K3+Hx5NrdWgxxysyYOEHbiw8ndg/jOAenV6KA9RGsbApJ4eW51aw2a+yZdhqNwansv8P9F540HWxNevl0Rd1uiiDEfrle0SjXZcYKqLT6sNVc/Q1kOcnJ5ilT0U3NXToJEbf3ZPzDfYb22osa1z1F4NwcA68yx1kQuJqWPtjuYiwSUebxx25d5mb1NDTA57IctH5hUvvTGYSvY+AOKsAHcqzOWWHChgWfcjZ+0vt+5FYXcAcd0NurKmpYnd8ywh1qV46y3LPaCBlVoJR+mTst7cWI/n/GrbkSbxsBfandb84PYuW7cKIElrZxsxeK6CJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaFNWz/aAyeG1dDukOxCeSdR2IGQE/FxnlLNT0zRJ0Q=;
 b=ISXN1KkVZzY3i7dWsOLtWKULaRiSk/HuC6hNKX5/FpB0DAPjrpH/NKXVgABnGygd22hlpe9rp2tfrSid/FImSFh2osnAj8ZyCLOsAeXBlqNMLmfwsCmx9a8PyI/GiC/xiBDsAciBtJB9A4FPO8AxpxJnj/wK06Z1pdNoYpclS0Ipo2SotTQGSVsOEgYRdbERRldBU0LIm12PmsHogiJO40qUs8VZcfQpxZLuovHEXEF1RNpXgYTASIAeoGC46Qoyv6M01kAyXZcO8y0LsqCh2GuKhcmvr/Mqp2LJiERAan1o4KMFoUzTicYMZVtapLWbxQNlBZuNiVPVvRwemghIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaFNWz/aAyeG1dDukOxCeSdR2IGQE/FxnlLNT0zRJ0Q=;
 b=td5wsx59JG+wZ9PtANchVsTEQcQcqCPYyuZwvHUVLSq8RXizXAFtF1c9sN5tIrZPbKtzMQFNx3XW7ER2HAZjSecAZXGVqHSbbW54Roq0cB5MM6hC9+7P9IBwHqQs8l90ythQPUMdeBbQyqq0SQ0UHDOJSubTFjgTU4A5Y5vg5X8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:22:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:22:18 +0000
Message-ID: <d321918e-6f3b-4984-9163-427b579dc57e@amd.com>
Date: Mon, 21 Aug 2023 20:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [BUG] KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] /
 drm_sched_entity_push_job [gpu_sched]
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org
References: <43668e49-c2c0-9979-9de3-b4904c2a8f82@alu.unizg.hr>
 <36b4e667-c287-1614-fe1f-5e772850d1fb@alu.unizg.hr>
 <b74a5cc3-8174-67f3-17ab-2e8a7d8fa1a6@amd.com>
 <5d83d59a-3c49-aae7-61ca-de9c2f3ba9c9@alu.unizg.hr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5d83d59a-3c49-aae7-61ca-de9c2f3ba9c9@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c341d8f-ef08-4d36-3d22-08dba2738cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d0fVBhzD/NSz4ycugjPswXih/cXHVwgjJBoa8RU+6/JrAaUd676gLVumJLWdQPLJhWHh94DQLCJb+s9Y/EkplXxFXMlHGRP/DPqPue/bxsQ8ZFdRnvcOlnxNDxhrOUbdf1v82+VsviiMSt+fLiJRAb6V7HtDmhkdwmZCl0wqaH08a25V95TU9J9HeoX+vrVNqPzRv0ejUDMyNhLCmq5b5zxKRrpANowpEbdRiy59SS727KCStcIwHD5gow1nIxZ0RR0DQdS/EBv5S1umEq7xVQ9K4C96JdQOvQzvn8UpGdfD9BKJo8+DwtypKZJStQ/sGlt/oqaPgFBqJ7nzxjo1jv8+Mu04WjruRsUvlaS2snHs654S3qxePUhts4r2XdeJQ92qhQgqls3zeqnfH2vzD1jtvrnoZmkgCDBXvOwMrGorooTXfXLJ5CBdhrJ/+IOfnUwc7VZuXcpSI80qAB13AmZYWY68d0Q2yxoPnEzmIPmOTIkBJpfmCek7NKypeXv5M90inqpaqbILwHt4ibOud7L01W/AAxn1i2u8YnsGlhVbH7z+D016senbMNhBHGtOGvaLwV1XH9clZrLCj3fU7vHU0GlBtSP3JakeaIa4oFJ41vqy0iQaQvT5yKoh/a34cYrrI6KfhBFKs9rD8bhICA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(54906003)(66946007)(66556008)(6512007)(66476007)(316002)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djNWdzVrVytCSStLcWJ5TDJoWHBzVHhCZmtub3RKeGU0ZFRUSHEvTFpsOGVq?=
 =?utf-8?B?THBMNDVIRjNkbjYwNkF6cGV6b1dSa1F6RWkxZFcxZW9Sb05KV3N4WlZKOGVQ?=
 =?utf-8?B?MzkzYmpkWEh2MnBGVnVLYXpzMHdSUlFYREZodUF5R2JoSlN6bWUwL0M4UjVZ?=
 =?utf-8?B?K3k2aWJaQ1c0MGxhVGNkZUt4aXRMRXpwbWROQXFyODAveGZXdVRlMm4yeEcz?=
 =?utf-8?B?RVR5TWE5VXNNLy9LTmRqczJWZmJXUGVVblVjS3BvRll1a1lEZ1ZkYWxERDhN?=
 =?utf-8?B?OGN1QjYrWVRabTdCeGgzc0hFb2lpQy85THlIN1E0NGNNMFlPV3R3L2l3ZXFJ?=
 =?utf-8?B?L1QwNU1jcXJXOGdOVTJCZ2V1VWJhd2x3Mm1FOGZobFdsaEJGV0daNHdwTk1T?=
 =?utf-8?B?NGVMdjcwVDBaMUdyNkVFMG5HYUxycVR2VERyNjNBWVBYaGxVdjBySnVZVkJj?=
 =?utf-8?B?M3dTQVBzQTdFaVdvZHJOQi8yUXYxQS8yNnZBSVdoY0VNeng3eTBXdzNacHo0?=
 =?utf-8?B?Nm1jQzRId3l1Y25xUExRUTFwa3FCREp3WmU5TGIyUlVBOHFvQVhCNGVMbVpo?=
 =?utf-8?B?OGxKbitHbDUwQjBmbU1qZjJXU1RSRjgvRk14K1RLZlZOSGgzOFJ6dGtqT0dX?=
 =?utf-8?B?bkdGbzU3WkNhWHh2eHBVWFNSVG1pRk9WcmdLd2tocmJ5ZU9keDQ4aHdVQnFS?=
 =?utf-8?B?bGMyNDlXZ2hNMHpnUzV6YzhtcFFuUjJmbE0vMU51Y3FEV3E5b0U4RysweUJs?=
 =?utf-8?B?eUMzcjJPb0J2TVU0YW1Eb3lyT2VhbVlCTHJmWkV1N21QRVVqWXpYVGRLcXYv?=
 =?utf-8?B?Njh2eWhaaUdSRnpVVHJ0cG1BN1JNZUtNNnIzYkx5ZHpodGNoc0RnbFB3eEF2?=
 =?utf-8?B?eGtJZWg3ZE11eG9lQmhid2VBbSs3MjRUdVFGVFVydlF4SVBUS2NSbkxxVzJN?=
 =?utf-8?B?T3hWaUtoRnN4YlBRdG04M2xQTFZoVWV3aVdVWkRScEUzakZRY2FSWU45Z1ps?=
 =?utf-8?B?dEl2bmpqSVgrQjJpZ01mKzgzbVo4UGtJaHR1cHg1SkIxNHNOM2FDcitwUTFP?=
 =?utf-8?B?R2h4RUgyUkY0R01tV1dRV2lOdVNSTXlmRzdNdnVoeEozR1lYSU81OTdXV1FK?=
 =?utf-8?B?RGhQY1BzZ2RjcmQvTjZlSkR5b2kxV3hMK0FQa2hPNGJGS3BaQWJzZERWVU1I?=
 =?utf-8?B?dklLRTZid2R1T2RXZ3VSb20ySU9RYXdCdWRRVW5VYjdDaERocHJoSytMeS91?=
 =?utf-8?B?L0w1TDM3QnlUT1MwSjFkdmRoYWFoalNiRXRlQ29nblk3Y1pGZXkvSmtMY0R6?=
 =?utf-8?B?NHRtWGxJd0RrRjlPZURuenI0alZZd2ZYUW02U1QyZlZkaGN0ZU1OcEdWakN4?=
 =?utf-8?B?aFMyRHd2OEprUmtDdkZnOG5hQ0U1eDc2Qmo2alJhSkRsb0sza2U0ZzFOMm9m?=
 =?utf-8?B?WDRWWHBySFVkcEpKL01YR0FnSHUxUkZJOC9OeHpiNTk4T3p4T2JjdzlFTmVZ?=
 =?utf-8?B?TE5oV2JwYW9mZWNTc0YwVGZWdSs3anVHcHpKN0VsNUtmdUlxa3gxZStqOU5y?=
 =?utf-8?B?OUFUQmRjNXlMQjIvdFB1Q0lpYUtVL1FaZVhyK0l4YkxhS2xnQmxvcjYrTzVP?=
 =?utf-8?B?S25NMnZmd1Z3NWFiWjlzTXZURXo0WExpUFNueTNQeFhpTFd2Z08yVTk1SHlE?=
 =?utf-8?B?LzlEMHB6eTdhWHFHS2t4eEdudkFmUG9PWEhzM1oxTXNUd25FcHpRRFBwQW5Y?=
 =?utf-8?B?aEQxdVN4eEdZSHJvUmk5WG96ZGg2SnNQYXVKYVhQVjRhUVVWSWJlazNKd3hv?=
 =?utf-8?B?cXR0YzBaS2RYTW1YSXZURUk1L1FOaUs2cU1CTG5SVjlsU1EvblpNN01Ka0JB?=
 =?utf-8?B?STYzdEVuSW1tcDNmcDU5L2tHQXh4bXlYamZtcU0xa1VJblVlNXQxZjVmeGlM?=
 =?utf-8?B?OGJSbkxic3k0V3lZTmlvNm4wY29DYjIvc3poU29GMjlpUkN4RUVOYVAreVFl?=
 =?utf-8?B?QVF0NjNPTUxMaXRQU3VEdHFGSnJuOG5SNUJXdDg2d2RTdDZpZDl3RThrbU54?=
 =?utf-8?B?c0tjd2VBZ1ZENzRkQ0tIZTY4NHdMd0J2TDVna2owbGY4WTVsUjZuLzJtQ3kx?=
 =?utf-8?Q?gg4zIdk8TBKMzdWq9BwFR1Gif?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c341d8f-ef08-4d36-3d22-08dba2738cf7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:22:18.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMYVtrZp7+SJcL986NhL2Z4G/WK38Uu5hxUJ+axSVT027cNIvtKzK1lCozm2pzRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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

I'm not sure about that.

On the one hand it might generate some noise. I know tons of cases where 
logic is: Ok if we see the updated value immediately it will optimize 
things, but if not it's unproblematic because there is another check 
after the next memory barrier.

On the other hand we probably have cases where this is not correctly 
implemented. So double checking those would most like be good idea.

Regards,
Christian.

Am 21.08.23 um 16:28 schrieb Mirsad Todorovac:
> Hi Christian,
>
> Thank you for the update.
>
> Should I continue reporting what KCSAN gives? I will try to filter 
> these to save your time for
> evaluation ...
>
> Kind regards,
> Mirsad
>
> On 8/21/23 15:20, Christian König wrote:
>> Hi Mirsad,
>>
>> well this is a false positive.
>>
>> That drm_sched_entity_is_ready() doesn't see the data written by 
>> drm_sched_entity_push_job() is part of the logic here.
>>
>> Regards,
>> Christian.
>>
>> Am 18.08.23 um 15:44 schrieb Mirsad Todorovac:
>>> On 8/17/23 21:54, Mirsad Todorovac wrote:
>>>> Hi,
>>>>
>>>> This is your friendly bug reporter.
>>>>
>>>> The environment is vanilla torvalds tree kernel on Ubuntu 22.04 LTS 
>>>> and a Ryzen 7950X box.
>>>>
>>>> Please find attached the complete dmesg output from the ring buffer 
>>>> and lshw output.
>>>>
>>>> NOTE: The kernel reports tainted kernel, but to my knowledge there 
>>>> are no proprietary (G) modules,
>>>>        but this taint is turned on by the previous bugs.
>>>>
>>>> dmesg excerpt:
>>>>
>>>> [ 8791.864576] 
>>>> ==================================================================
>>>> [ 8791.864648] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
>>>> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>>>
>>>> [ 8791.864776] write (marked) to 0xffff9b74491b7c40 of 8 bytes by 
>>>> task 3807 on cpu 18:
>>>> [ 8791.864788]  drm_sched_entity_push_job+0xf4/0x2a0 [gpu_sched]
>>>> [ 8791.864852]  amdgpu_cs_ioctl+0x3888/0x3de0 [amdgpu]
>>>> [ 8791.868731]  drm_ioctl_kernel+0x127/0x210 [drm]
>>>> [ 8791.869222]  drm_ioctl+0x38f/0x6f0 [drm]
>>>> [ 8791.869711]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
>>>> [ 8791.873660]  __x64_sys_ioctl+0xd2/0x120
>>>> [ 8791.873676]  do_syscall_64+0x58/0x90
>>>> [ 8791.873688]  entry_SYSCALL_64_after_hwframe+0x73/0xdd
>>>>
>>>> [ 8791.873710] read to 0xffff9b74491b7c40 of 8 bytes by task 1119 
>>>> on cpu 27:
>>>> [ 8791.873722]  drm_sched_entity_is_ready+0x16/0x50 [gpu_sched]
>>>> [ 8791.873786]  drm_sched_select_entity+0x1c7/0x220 [gpu_sched]
>>>> [ 8791.873849]  drm_sched_main+0xd2/0x500 [gpu_sched]
>>>> [ 8791.873912]  kthread+0x18b/0x1d0
>>>> [ 8791.873924]  ret_from_fork+0x43/0x70
>>>> [ 8791.873939]  ret_from_fork_asm+0x1b/0x30
>>>>
>>>> [ 8791.873955] value changed: 0x0000000000000000 -> 0xffff9b750ebcfc00
>>>>
>>>> [ 8791.873971] Reported by Kernel Concurrency Sanitizer on:
>>>> [ 8791.873980] CPU: 27 PID: 1119 Comm: gfx_0.0.0 Tainted: 
>>>> G             L 6.5.0-rc6-net-cfg-kcsan-00038-g16931859a650 #35
>>>> [ 8791.873994] Hardware name: ASRock X670E PG Lightning/X670E PG 
>>>> Lightning, BIOS 1.21 04/26/2023
>>>> [ 8791.874002] 
>>>> ==================================================================
>>>
>>> P.S.
>>>
>>> According to Mr. Heo's instructions, I am adding the unwound trace 
>>> here:
>>>
>>> [ 1879.706518] 
>>> ==================================================================
>>> [ 1879.706616] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
>>> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>>
>>> [ 1879.706737] write (marked) to 0xffff8f3672748c40 of 8 bytes by 
>>> task 4087 on cpu 10:
>>> [ 1879.706748] drm_sched_entity_push_job 
>>> (./include/drm/spsc_queue.h:74 
>>> drivers/gpu/drm/scheduler/sched_entity.c:574) gpu_sched
>>> [ 1879.706808] amdgpu_cs_ioctl 
>>> (drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1375 
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1469) amdgpu
>>> [ 1879.710589] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:788) drm
>>> [ 1879.711068] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:892) drm
>>> [ 1879.711551] amdgpu_drm_ioctl 
>>> (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2748) amdgpu
>>> [ 1879.715319] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 
>>> fs/ioctl.c:856 fs/ioctl.c:856)
>>> [ 1879.715334] do_syscall_64 (arch/x86/entry/common.c:50 
>>> arch/x86/entry/common.c:80)
>>> [ 1879.715345] entry_SYSCALL_64_after_hwframe 
>>> (arch/x86/entry/entry_64.S:120)
>>>
>>> [ 1879.715365] read to 0xffff8f3672748c40 of 8 bytes by task 1098 on 
>>> cpu 11:
>>> [ 1879.715376] drm_sched_entity_is_ready 
>>> (drivers/gpu/drm/scheduler/sched_entity.c:134) gpu_sched
>>> [ 1879.715435] drm_sched_select_entity 
>>> (drivers/gpu/drm/scheduler/sched_main.c:248 
>>> drivers/gpu/drm/scheduler/sched_main.c:893) gpu_sched
>>> [ 1879.715495] drm_sched_main 
>>> (drivers/gpu/drm/scheduler/sched_main.c:1019) gpu_sched
>>> [ 1879.715554] kthread (kernel/kthread.c:389)
>>> [ 1879.715563] ret_from_fork (arch/x86/kernel/process.c:145)
>>> [ 1879.715575] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)
>>>
>>> [ 1879.715590] value changed: 0x0000000000000000 -> 0xffff8f360663dc00
>>>
>>> [ 1879.715604] Reported by Kernel Concurrency Sanitizer on:
>>> [ 1879.715612] CPU: 11 PID: 1098 Comm: gfx_0.0.0 Tainted: 
>>> G             L     6.5.0-rc6+ #47
>>> [ 1879.715624] Hardware name: ASRock X670E PG Lightning/X670E PG 
>>> Lightning, BIOS 1.21 04/26/2023
>>> [ 1879.715631] 
>>> ==================================================================
>>>
>>> It seems that the line in question might be:
>>>
>>>     first = spsc_queue_push(&entity->job_queue, 
>>> &sched_job->queue_node);
>>>
>>> which expands to:
>>>
>>> static inline bool spsc_queue_push(struct spsc_queue *queue, struct 
>>> spsc_node *node)
>>> {
>>>     struct spsc_node **tail;
>>>
>>>     node->next = NULL;
>>>
>>>     preempt_disable();
>>>
>>>     tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, 
>>> (long)&node->next);
>>>     WRITE_ONCE(*tail, node);
>>>     atomic_inc(&queue->job_count);
>>>
>>>     /*
>>>      * In case of first element verify new node will be visible to 
>>> the consumer
>>>      * thread when we ping the kernel thread that there is new work 
>>> to do.
>>>      */
>>>     smp_wmb();
>>>
>>>     preempt_enable();
>>>
>>>     return tail == &queue->head;
>>> }
>>>
>>> According to the manual, preempt_disable() only guaranteed exclusion 
>>> on a single CPU/core/thread, so
>>> we might be plagued with the slow, old fashioned locking unless 
>>> anyone had a better idea.
>>>
>>> Best regards,
>>> Mirsad Todorovac

