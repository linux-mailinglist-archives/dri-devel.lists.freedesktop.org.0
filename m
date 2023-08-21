Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC2D782A5B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E810E251;
	Mon, 21 Aug 2023 13:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6FF10E251
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 13:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcJcXCaECjE3teyhM/lTUi3M216Yfwy/QwdBdDU6tRGI3iD3uoDAPXxyPJU+JDTrLbhx2a5LU1qkr/YVRM4Hi8bwWdyqc+y3/V7v5wifbDd/SFtRKsc8FC2MJN1PYgyMu+Y2cagSRw7uHcVirDmoCcbQ1EIMZLCVupSD0qYGZ5vYogkYtWY06zaOtLsvK7lMfUGNgHuLAQm16HiNY8FRHzJH8Ftd8dNIKmzS43g3mt/gGgBIvUgdwC4KRtjdkheB2tuNIVSKQvJq71clFKVhlLpIaHp8WYJZdBkzvdoHDbpcbRZT52pCbvcqVI2hWAYmky/5FH2Xs1dlxHgjssUkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NaH/Yy7wU8L8b1kcl187ouhYT2KU/G5D157CVusWrA=;
 b=FXqGS7zDaseIW2omCW4EsL7g47JrxL+2y2w4u2HkQ86gpJ/eY6Zv/7xMpfdivKhoGxD0tqoj8de1exp8MhHFF3SrtARMiQJTUfRtNH9gr0uJYZvTBiea5FrFNDnRrwPGkgl3Vu18aS5Z9i3iLbWr8bIEpHY5tsPpfpcf8iXUCyWr1Zs8AMtfLebFgxCkyZe2PUWOrpHmcsLy1ZD2JmojDX9cFZP4R8xaJ9eKOW/SWTp9twrgEuzmUwa8ZZPq9A68KjlvJn9IAkSqMIqN8R1zAQ2rni1xUgbWu16lQ3+MYTlKr1SFpmOVe9RV6jl6VW3ghQBAoHnrq+p0VCnkjra8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NaH/Yy7wU8L8b1kcl187ouhYT2KU/G5D157CVusWrA=;
 b=vPRHOtyFkTm4HmG/Nr2emjEbRy/HAhiRe71LdGLXdalGVR6/oI/LM6iyvObvvkYkQQ28HOirnezfRuJLpp5BvonwOzQooqTbP0cJ8e35485QNx20f74mB/qCvk2VYwvsAwz2Hygb9+n1mJ/OdHCY/RUqYS+Wxxqz01FHUPxbVGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 13:20:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:20:59 +0000
Message-ID: <b74a5cc3-8174-67f3-17ab-2e8a7d8fa1a6@amd.com>
Date: Mon, 21 Aug 2023 15:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [BUG] KCSAN: data-race in drm_sched_entity_is_ready [gpu_sched] /
 drm_sched_entity_push_job [gpu_sched]
Content-Language: en-US
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 linux-kernel@vger.kernel.org
References: <43668e49-c2c0-9979-9de3-b4904c2a8f82@alu.unizg.hr>
 <36b4e667-c287-1614-fe1f-5e772850d1fb@alu.unizg.hr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <36b4e667-c287-1614-fe1f-5e772850d1fb@alu.unizg.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f72d68-6d2c-4b66-359e-08dba24975c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xshn3j28xDuH0DkyFNeuPLBddYxR3MN+P944xt16h5Zd0AEgl3D8eHi57XW/hcr8bbtqzCpYAOxIgsw952Ik0Kc8hScN7OI6VtVK95k+Io9zO1kVDIvbK+mls5rDksp/rrpCRS1w3Lq0H86KRzot8vVos1Uknv78i6U0ReH1mqtQwJoVoj5QdiWC1Z+j3ei5OFDt0UrttNXLm2ZvbXcMJGOU91Tn23MMgWK93RCPuWtmmnM6jMB6ID/0NF6avzGo0QdRbKc6XZnFScVFt8/+tge9GQoRt4KaA1NFBV3hi9II1g+aJu0Avujc1veRe0oY2ykIi/UPeNLHtnlaeGnQoUdjSjJ+v4eZvAfHDOF/f4JPk7RrExHGL/QHA3qaDfSBzcBX89qazs8dCiVe5vpv2WbvM22D9bpoy/RBvn1A5Nw1SaHdFDntnLhBkg3luxCmS6puQaSHSVo0Vr4yffOrgn0qkeDaqCm4ZnbaTTJxsdMQMks4lsxEpepKKDbN815jvw05XMAiU+q9OJJVbwd6rCJSreNVt1dYEVNs5dx74ANrh0MRtBFTpDV2ajXCzdQ1StXlFfcK2XoeXq2171s+zAjsgjaO753nM6mvZ5zt0k+MV8Hkp0G+s9HzKWfEECo4tKnlpuKdYaP8Tdyjt+saIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(1800799009)(186009)(451199024)(6666004)(6486002)(6506007)(38100700002)(6512007)(53546011)(31696002)(83380400001)(36756003)(26005)(2616005)(41300700001)(66556008)(316002)(2906002)(66946007)(54906003)(66476007)(86362001)(5660300002)(8676002)(478600001)(4326008)(8936002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blNBOGdCOEtpNS9VRmJDdTg1Q2ZPZ2FUQWphRUJlN0VIeGI1Y3lYMnoyWWxG?=
 =?utf-8?B?TmJya0NvVGJtMlBqd1p6QzJkRlQ1M2V6UVVMbVNYQ3I3NENBODBsb29WbTZW?=
 =?utf-8?B?all1bUEzbEhveGQvVU1HbkN5NmVLT3NJMnNOUUsveTArZjBTZDF1QzRDb1hh?=
 =?utf-8?B?ck90S0hPS3RoZkE0RmVRMGpGZHVPamJBUFA3cDhvNEU4TnRtNlRmUkJtOEU1?=
 =?utf-8?B?RFZQZW00K2toWWdOOEdzM2RNMlcySmZGMXc5ZDFCUEtrT0FqeFVDb2NPV2pG?=
 =?utf-8?B?RytHZVlZZ1NZTkUxY05Ga0NsQmV4dm9WZ3htbi82SzBZN0lQVHFLamUvZVpX?=
 =?utf-8?B?eWZsM1BOMHN3VHUvbWpwZEd3cFVlbHpYbmRSZ0htVUNTclYzZW84NVhTWHlu?=
 =?utf-8?B?ZVV3KzhscG5TdVBlWXQ4dm0zVTg1TmFZTnRNN0RxOGRxU0dnTktxejZpNEl1?=
 =?utf-8?B?QnY1Q2FZakxrOXRaWUhyejhGWXJJOERyVXQySktudXFVa2t2OXYrKzBEeFJq?=
 =?utf-8?B?d2ZRUjdubjlSaW5ycFEwenZZV3JFUVhWclliYVJMbDdXWW9IZFE3cWFHQ2FS?=
 =?utf-8?B?M3M1VWhHK3N6cXhNY0RrQ1B3WG84T0lwb0VOV1dINGorQVhXR0FWVmtYREN3?=
 =?utf-8?B?Uk0yWktlaC8vUElIOEJiZHE5N0N0RGRIQmQzK3ZNOU1QL2ZHNm1NaFFVNTg1?=
 =?utf-8?B?MXZST3hwL1g0TER6L2c3dGZSYVljWDRSNjFiWFV1MC9nRFJZODdnTVBoK082?=
 =?utf-8?B?eWo3QXVQK21mcmg5OHVkTStocTdlNkE2V0pqQWlLbm42d1EzcFArT1pGSEJX?=
 =?utf-8?B?d01OVm5LZXIzcGsxcngrK2dmU2x5S0pTVEZBTmtWemRoN1crOEM3TGd0SFY0?=
 =?utf-8?B?UTY1TDVONFNwK0NJZEJkdTc1QVQ1Y3Z4eHdxdEdGMnFkalJuc3JXS0RzRUkr?=
 =?utf-8?B?U25TSUxCVHVsNW40MFFmTDQvOEozM29sWVQyNFBFektwTTJJNVRKVkl5bmtO?=
 =?utf-8?B?Ym5OMk1idWl4OTlpVjhxM3hSQmlHNFFHQ2Rka1Y5ZlV2OG5PakcxeDlEbjNk?=
 =?utf-8?B?emc2Z1Avamo2UHJkRGsxa0FzZWVKMS9vNSt2dFpQVEEvdkZjUlRPS0htcVUx?=
 =?utf-8?B?OFlQdWpCOFUzbmdoS0c5V0EzM2o3NUgxeUlEZURmNkQxQnBMQnJnamhITWxn?=
 =?utf-8?B?aXZhWTZoRitpbFVmSEM0TjloZm9oRTlpTC8xQU41Qk4yMmozc0M2MStXZTJV?=
 =?utf-8?B?ZmpLWW1EZ3RVUnJreHlGd3NJcytkODlqdXBobytFWnNuZ3lMczE4UzR6QWNS?=
 =?utf-8?B?QWFva1RXTDVXeFJrbkNqMEhoTXlqb1F3bFhRSmNhZSt4WDVDcy9ubUE1QVBM?=
 =?utf-8?B?ZlVtVTlwaTAyR2ZDSjQxT3IrUGZNM3FoVnE5cUcrYll1bEZQL0N4a1dPbnY2?=
 =?utf-8?B?Yy9Zc2tvOGdwVEtWbHZXWnkzbXBNVDllenNiaGVDUGcvdGk2akxKUlFVVTVD?=
 =?utf-8?B?MklidXh5bUgyWDZvdVZ0Sm0vQUJBYTI3aTN5dkRFcHJ5eDN6d1FINmU5TFVj?=
 =?utf-8?B?Q1lkMSs4ck0rT0VRMGJUVllTeDJmSCs2b1BidjVHOHB1VlB0Zll0d3Z4b1BD?=
 =?utf-8?B?V0d3clpzcUtobTNTSUg0SytwNE81dXZsZlBvbHZTbkZtMjNjQUlxd1F5cCtD?=
 =?utf-8?B?cEVhQ2dPcEVlV2hETVVVYVl2cXFFUzQ1TVdxUFErSDFxZVYrdWQyR3FGUm85?=
 =?utf-8?B?SVhBb0FEQ3p3VWJUUUd6bTB3Y3gvTWx0czRzM0o0aHZRUSt1MHh4Qlc5ZXRJ?=
 =?utf-8?B?bGRNVnpDd2xlZ2crNG1DYUNObWNxOWFhUDBkclVOUDQwUDhrNzJDK0VhRnlV?=
 =?utf-8?B?alowa0hpVXRRQjc5YS91MGFhWXIrTmgxRFFxeFV0Y3l5S2l3UkliV0pjNjdw?=
 =?utf-8?B?WFdzRDE1akpHbWRBM0R4TkVwVmlNczRia0p2emIrSnoxOFhreEluWDBKRzlL?=
 =?utf-8?B?M2VMTks2RUJLOFIwaE8wSzRyUWdTcnpSYXZPTHR3Z2x0eDU0eXE1R1ZuZ3hu?=
 =?utf-8?B?RnhmVEZoSEMxak1FZkxrRGlMdjJsOUNmY2RhRzJnNWdrMmtmTGJOeEJ4REdQ?=
 =?utf-8?Q?V3dFnCoMbUV3MqC5ICQJkZQ0M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f72d68-6d2c-4b66-359e-08dba24975c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:20:59.6703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9hvEbqiNkIIYSyiomY6Hemzhg/LM2eskO/iqEUyVh0sSQzyHNv38BSZ/yxZKs+S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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

well this is a false positive.

That drm_sched_entity_is_ready() doesn't see the data written by 
drm_sched_entity_push_job() is part of the logic here.

Regards,
Christian.

Am 18.08.23 um 15:44 schrieb Mirsad Todorovac:
> On 8/17/23 21:54, Mirsad Todorovac wrote:
>> Hi,
>>
>> This is your friendly bug reporter.
>>
>> The environment is vanilla torvalds tree kernel on Ubuntu 22.04 LTS 
>> and a Ryzen 7950X box.
>>
>> Please find attached the complete dmesg output from the ring buffer 
>> and lshw output.
>>
>> NOTE: The kernel reports tainted kernel, but to my knowledge there 
>> are no proprietary (G) modules,
>>        but this taint is turned on by the previous bugs.
>>
>> dmesg excerpt:
>>
>> [ 8791.864576] 
>> ==================================================================
>> [ 8791.864648] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
>> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>>
>> [ 8791.864776] write (marked) to 0xffff9b74491b7c40 of 8 bytes by 
>> task 3807 on cpu 18:
>> [ 8791.864788]  drm_sched_entity_push_job+0xf4/0x2a0 [gpu_sched]
>> [ 8791.864852]  amdgpu_cs_ioctl+0x3888/0x3de0 [amdgpu]
>> [ 8791.868731]  drm_ioctl_kernel+0x127/0x210 [drm]
>> [ 8791.869222]  drm_ioctl+0x38f/0x6f0 [drm]
>> [ 8791.869711]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
>> [ 8791.873660]  __x64_sys_ioctl+0xd2/0x120
>> [ 8791.873676]  do_syscall_64+0x58/0x90
>> [ 8791.873688]  entry_SYSCALL_64_after_hwframe+0x73/0xdd
>>
>> [ 8791.873710] read to 0xffff9b74491b7c40 of 8 bytes by task 1119 on 
>> cpu 27:
>> [ 8791.873722]  drm_sched_entity_is_ready+0x16/0x50 [gpu_sched]
>> [ 8791.873786]  drm_sched_select_entity+0x1c7/0x220 [gpu_sched]
>> [ 8791.873849]  drm_sched_main+0xd2/0x500 [gpu_sched]
>> [ 8791.873912]  kthread+0x18b/0x1d0
>> [ 8791.873924]  ret_from_fork+0x43/0x70
>> [ 8791.873939]  ret_from_fork_asm+0x1b/0x30
>>
>> [ 8791.873955] value changed: 0x0000000000000000 -> 0xffff9b750ebcfc00
>>
>> [ 8791.873971] Reported by Kernel Concurrency Sanitizer on:
>> [ 8791.873980] CPU: 27 PID: 1119 Comm: gfx_0.0.0 Tainted: 
>> G             L     6.5.0-rc6-net-cfg-kcsan-00038-g16931859a650 #35
>> [ 8791.873994] Hardware name: ASRock X670E PG Lightning/X670E PG 
>> Lightning, BIOS 1.21 04/26/2023
>> [ 8791.874002] 
>> ==================================================================
>
> P.S.
>
> According to Mr. Heo's instructions, I am adding the unwound trace here:
>
> [ 1879.706518] 
> ==================================================================
> [ 1879.706616] BUG: KCSAN: data-race in drm_sched_entity_is_ready 
> [gpu_sched] / drm_sched_entity_push_job [gpu_sched]
>
> [ 1879.706737] write (marked) to 0xffff8f3672748c40 of 8 bytes by task 
> 4087 on cpu 10:
> [ 1879.706748] drm_sched_entity_push_job 
> (./include/drm/spsc_queue.h:74 
> drivers/gpu/drm/scheduler/sched_entity.c:574) gpu_sched
> [ 1879.706808] amdgpu_cs_ioctl 
> (drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1375 
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1469) amdgpu
> [ 1879.710589] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:788) drm
> [ 1879.711068] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:892) drm
> [ 1879.711551] amdgpu_drm_ioctl 
> (drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:2748) amdgpu
> [ 1879.715319] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870 
> fs/ioctl.c:856 fs/ioctl.c:856)
> [ 1879.715334] do_syscall_64 (arch/x86/entry/common.c:50 
> arch/x86/entry/common.c:80)
> [ 1879.715345] entry_SYSCALL_64_after_hwframe 
> (arch/x86/entry/entry_64.S:120)
>
> [ 1879.715365] read to 0xffff8f3672748c40 of 8 bytes by task 1098 on 
> cpu 11:
> [ 1879.715376] drm_sched_entity_is_ready 
> (drivers/gpu/drm/scheduler/sched_entity.c:134) gpu_sched
> [ 1879.715435] drm_sched_select_entity 
> (drivers/gpu/drm/scheduler/sched_main.c:248 
> drivers/gpu/drm/scheduler/sched_main.c:893) gpu_sched
> [ 1879.715495] drm_sched_main 
> (drivers/gpu/drm/scheduler/sched_main.c:1019) gpu_sched
> [ 1879.715554] kthread (kernel/kthread.c:389)
> [ 1879.715563] ret_from_fork (arch/x86/kernel/process.c:145)
> [ 1879.715575] ret_from_fork_asm (arch/x86/entry/entry_64.S:312)
>
> [ 1879.715590] value changed: 0x0000000000000000 -> 0xffff8f360663dc00
>
> [ 1879.715604] Reported by Kernel Concurrency Sanitizer on:
> [ 1879.715612] CPU: 11 PID: 1098 Comm: gfx_0.0.0 Tainted: 
> G             L     6.5.0-rc6+ #47
> [ 1879.715624] Hardware name: ASRock X670E PG Lightning/X670E PG 
> Lightning, BIOS 1.21 04/26/2023
> [ 1879.715631] 
> ==================================================================
>
> It seems that the line in question might be:
>
>     first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>
> which expands to:
>
> static inline bool spsc_queue_push(struct spsc_queue *queue, struct 
> spsc_node *node)
> {
>     struct spsc_node **tail;
>
>     node->next = NULL;
>
>     preempt_disable();
>
>     tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, 
> (long)&node->next);
>     WRITE_ONCE(*tail, node);
>     atomic_inc(&queue->job_count);
>
>     /*
>      * In case of first element verify new node will be visible to the 
> consumer
>      * thread when we ping the kernel thread that there is new work to 
> do.
>      */
>     smp_wmb();
>
>     preempt_enable();
>
>     return tail == &queue->head;
> }
>
> According to the manual, preempt_disable() only guaranteed exclusion 
> on a single CPU/core/thread, so
> we might be plagued with the slow, old fashioned locking unless anyone 
> had a better idea.
>
> Best regards,
> Mirsad Todorovac

