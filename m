Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147069AB79
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 13:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DDB10EFB4;
	Fri, 17 Feb 2023 12:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2078.outbound.protection.outlook.com [40.107.102.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEED10EF91;
 Fri, 17 Feb 2023 12:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaJvBZkh53deK/rykZAKWd109YVZp80WCjeaLEiJ7NLzlfmP3jXGlSqAmFkToBOwHG9s8HW8o9vSHkDeZ110N+bRjVnGQ9ZYemj3WNptcqZO5DYbzDdTlhQ2Vwet8Py5gHEa+9etpDtuuuobuJ/ieFG6jY5uW95FGmXDqMYfQE4kU3MtQQux+b+3L4sPSIVWxaTvu+lyx1Tg6eToaDtU0uuDhn/SOJyoDZlbK5wlBZIcj6YpmlUADd27J1G3Tz/68QQfkU94DhtMrT+c573ipciUqcDxhSmKYqqJQWK7KDRZBJva7MCtWNEuwhkFP7lx4HW2uCdOkekZGyQP+zUiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZvClBdXBvByKXwEQ7d2dgL6GpKXB3HsYmJ7/IjGDFc=;
 b=Xz1bBOH8Aj7ptAZq/E5nNgj2Mps8XW0cyPlWaAz+CwcItNpNyA0MEO3OpIcSsnhhcQPeqFlvTAwMpR9t1SlgCwIIIyUamtZbJBbo2En7b7VHvmya7bmJ0gDjUdCZa5T5h4Z/yXiQUsthGKmzRcta3WZyl+8VFeJEFNE28NB0auaeFePzqdG68XsNPi2oPvvEun00m69AJiqOzEMReHAgiF/3ZgimcU18mEiR1f0Ia2UFQwWoJszfiOYPNnz9NEbcuHqT2E3WJZO/ysq/ZIDEtvMfBdqRFfJOl0J7xuDg6JKINTnYLap3gGyvJO/FYZBFVq4ON5l+6D/qUpBjOnV3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZvClBdXBvByKXwEQ7d2dgL6GpKXB3HsYmJ7/IjGDFc=;
 b=iFFQRw3d4yr15ufsvHp1qyqCjsI6yoad5SxlS7nVubAXU+Z+Vy9O1tcKbtfHLv/SVBbZD3u91uh2b/axwN2eXEpMwYv08eLIvHXh8GFnPGGzVNi5L8iXvkkqeRy1T9honBon5Npor/IwuSygJUoKxz4pQbx60XoWn8s5qfO43wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 12:28:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 12:28:36 +0000
Message-ID: <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
Date: Fri, 17 Feb 2023 13:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm/suballoc: Introduce a generic suballocation
 manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5eb3ff-a1cb-4c5f-7b8e-08db10e27dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7Q4Pj4IJGnRL0uZC9r/6r98ZsSynP+vhcnCAHwb+vtDHd+pZe2D03pTzOQp3TDWjsw3jChOam3fFyBLWMQcfiO7ecOag4FCsuexIgZR1TES/JLmKmEPz8MavvdAcDAQGM5Y43jpujrAkaRnO3hRG/uOMym16vd85LtzPsxHeQU4TvgigcgCblJXQXxVr5j46xVq+uxnEZVMyonfxSzdl3P1qnTKGgENbujl0wdgf+74pAbHARLMlg/kA790IcrMZcpqZTnm79vUahQuN1kSs6dMDjAEzb1vq/MOeVw4H7NpiJJO+6waO7hsAF+vahSrMQ0RksKjmRi87P1CocPcsI9fSWdLPEMjY4Pmvn0cfoTSUdcGUpS1BPIO/0HrsY1PTwBPy9imp/Eg8JeMNycIaF7ouTrqePpXYTTPmzgdeGt+S3q1GF1IaYSboQnXkNW/35jdCdYGP2sOQFQKwxm86MdZbPknQIvhnA+uxWPu0iF4qr6oV09ou6Tb+EeYPCAzE8A5qCzhoICxeh6qSbUONo/hF3H5l/cDaQSdG6ragv+KyPjjZmzPXBlDaSSXhA73/r3MspkpTl9s95wfHoMsNO/rk8hIKyoeWVgwpa3KfTsKnJ9PK0ISn1U7Kz0+MeXYPtc4lapoFFzsv4AmzEGWoFF0YR4Fb7YZiKgR2+eCrnpjk+PTbf1+d/DIrOB8yhNDL717ZBhhU73ciARO5vj2pnOOq94+aOEPOdSO3tYlDvjBpGp5GeofQLMSI5PrET6L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(66899018)(86362001)(31696002)(2906002)(38100700002)(31686004)(6486002)(66574015)(54906003)(53546011)(6512007)(6506007)(478600001)(186003)(36756003)(66946007)(66476007)(83380400001)(8676002)(66556008)(316002)(4326008)(41300700001)(6666004)(2616005)(30864003)(8936002)(5660300002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW1iSHVIOW9XT0xqcUIwd1ZQOThMQmRKSHZhTyswUllEajk5ZjM3NkM1YmJN?=
 =?utf-8?B?S1FuNDFSVHNsNVBValljNzRycUxTWmVweVVZbkNaL2dVZDdnWjZJZENYWmhP?=
 =?utf-8?B?cDRmKzIrTjNMNExWNVU4N3BCb1lEay9SYWJlNmo2NlkwbHRFVlN1QXcyMlNM?=
 =?utf-8?B?RlVnYTJIcndZVmZQdStsOTdpeG1vZ2V6RXI4S3RaeVdsdHd3SkNURW9RL21y?=
 =?utf-8?B?MDZRL1NUMmEvbWpIYmlUREM5QXBiYlV4ODJrdXVPYTdRQVZIZXl1aG1CRDdq?=
 =?utf-8?B?ZU5USnViZTVJVExCbHpUN0x2QlQrSU1GSjhtSEVhYUFEQjk1WEV0enBpV0xF?=
 =?utf-8?B?SC8wMUp4bE45VTJLSXNoenNEelAxd3R5eGRXbWRHRHZsdDdSd2IrTTNZSklx?=
 =?utf-8?B?cVZ2ZE40RGdVMHFYUzlOQ1Z3cXR5VHdUQlA2UkFoc2UxbFBKbjA1d2FFdzZD?=
 =?utf-8?B?OVBXSHlIYy93aUw4R3UrOFBGZUVHK0FhYzk4Y0VUZEpMQ1h2VHhOcWd0QXBO?=
 =?utf-8?B?dUd3Z25Bb2ljM3FmVDJOMUxwVHp0SXN0TXVyMWlTUEVhMjd2UGlRVWxxazA0?=
 =?utf-8?B?d25LaGJienRBUVNTTDVuaHpmKzllaHZEWlpQT3I5bUNMbXdiVGxObVVlRG5O?=
 =?utf-8?B?bjBlcjk2NUluVW1ReHMxY3pNZWoxMy9CRlo3eDZuVnFJL1Y2NjlpSFRWcENs?=
 =?utf-8?B?TEk5V1BkK2FXcUlEa3ZIWHBDSG9wb1crcjJZbmM4WS9kWTF6WXZ6K1lnRDRm?=
 =?utf-8?B?Zld0NEQrVHpyK082V3pXT0xJM0c0RUxGdFI0QW5IVS9RdTdBN1ppZEZOb0Iy?=
 =?utf-8?B?VGMwZ1VkUzZWRFlYbmZlb1NsdXpJWWVMbHYyZkk1cGNCQm9Yb2pXT0NIcnkv?=
 =?utf-8?B?R0pMMjZ0dEpGeFJMSFh1S0hhWlVqYi9mb0lEcDYrREVSQ2V5VXl1VXozZXZO?=
 =?utf-8?B?QWtTN0NBbGhBT3JMYmVNTTNXajIrb1dGVGRxTldSWGlOblY4NmxYOFpvdWxX?=
 =?utf-8?B?UmsrZmt0T2YzUnJxeEdYamhPSW5HNGZxOFdhSXpHamFIQ0R2VDgrSHdWL1lu?=
 =?utf-8?B?c2dtWDBnVklCb1lOQUp2a2l0aHVVSU1xODRKSy9CWFUxbVJkR1RlbWtMUGJR?=
 =?utf-8?B?YmgwOUxuN2xpamFzdGlCeVdZY3EzYmVUY3o3blEwSGZQcjFMM2gyclBJeEpO?=
 =?utf-8?B?bExFK1VSbG9xZHJuMk9XSlBYODd2WGpOcnR1RzJMaHhZQUZ5U3BEaEJ5TVJT?=
 =?utf-8?B?cG1YVHhjbG9rVXQ0Qm1CT1VYelRYR0xaWVNSeGMzV3d5VXdNS3ZMUmZqTnd2?=
 =?utf-8?B?c01Nb01RNm9iQzRON0FiWG4ycEtiNGNRRXEyVFZpUjRZTjdLTC9FM25BMmRw?=
 =?utf-8?B?RWxMVkRHTjkvMHBaNE0rcS9VR3g0RnB1MEFGZDRPcUE1Nk9ZK1B1cVBQTXN0?=
 =?utf-8?B?NnRWQWIvdjY3dUhGZ2x3YXdXTnVVZ0g5aU92NFJyRUdyOWtLSnpobXhKendX?=
 =?utf-8?B?dlA4NnFsRm9USzZvTGVKbm13Ny9jZHptY0ZxZnI2bEk2ZHRYUWhlV1A3UXFq?=
 =?utf-8?B?RnlSV1lzOTQwWTczT2ZqZXM4WFZnQTZLVHJ1RktCbzFmRExvL2pxSDU4ZFZm?=
 =?utf-8?B?RjlWcGhicWdkTmQ2SVpYeUhpVDNCM0xXV0pTQ0ptczBtK3hKTXEvaGFJOC9m?=
 =?utf-8?B?bUlHZk9JYnBGR2puak4ydm1kRjN5bUZGVWVQZzR1amY4M0VnYW95aS9Nb0Jo?=
 =?utf-8?B?Njh6dHJQY0JXYU9Jb01hL3Vqa1ZHb21ZWnpTbzBQa0hReGhyYURVREZFbjJ2?=
 =?utf-8?B?b2ZhMHkyT2RHYnJ0bmROcWsxNjhlNXFGdUc0Z0pSdXlQVkk2U1J4R1dNTi9y?=
 =?utf-8?B?eWJHbU1Ndi9ma1kza0V6RndvNzk1bjBmYkszeFg5dG1iajJEUVNZaEgrd2ZR?=
 =?utf-8?B?azQ3eW5CNDI2ck15d2VPY1QxQXdiaUFvbTk3bTNKUHBkRm9kU3o5TWtyZlZs?=
 =?utf-8?B?N25jcEJOR29WVHJOM05Uc0Y2b3piaS9xS3JGcm02ZE5JZHBYK1BuQWZ4TFZw?=
 =?utf-8?B?amJ2dXBFZHJQYzNVNWE2emR4WDRJK1IvOVd2OWdraGdaaTlWS1IyMHdSY0Vx?=
 =?utf-8?B?dUtRcXYxZHVCR0Ntc1QwWEdXNlN0VU9rWUpvSmpBVm5zZ3I4WGsxNlBMWFQ2?=
 =?utf-8?Q?ls6XYrfq/bQn01zsM30UbwKRec938hywuLjbCR763VCA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5eb3ff-a1cb-4c5f-7b8e-08db10e27dfa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 12:28:36.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUJOagmDIcvemz8BMQaDEtyJ3xbUlRo6Hm0aSKMl74vbSKDI7Qy3U7A8ZykrFSOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 13:24 schrieb Thomas Hellström:
>
> On 2/17/23 12:28, Christian König wrote:
>> Am 17.02.23 um 12:21 schrieb Thomas Hellström:
>>>
>>> On 2/17/23 12:00, Christian König wrote:
>>>> Am 16.02.23 um 15:48 schrieb Thomas Hellström:
>>>>> Initially we tried to leverage the amdgpu suballocation manager.
>>>>> It turnes out, however, that it tries extremely hard not to enable
>>>>> signalling on the fences that hold the memory up for freeing, 
>>>>> which makes
>>>>> it hard to understand and to fix potential issues with it.
>>>>>
>>>>> So in a simplification effort, introduce a drm suballocation 
>>>>> manager as a
>>>>> wrapper around an existing allocator (drm_mm) and to avoid using 
>>>>> queues
>>>>> for freeing, thus avoiding throttling on free which is an undesired
>>>>> feature as typically the throttling needs to be done uninterruptible.
>>>>>
>>>>> This variant is probably more cpu-hungry but can be improved at 
>>>>> the cost
>>>>> of additional complexity. Ideas for that are documented in the
>>>>> drm_suballoc.c file.
>>>>>
>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Co-developed-by: Maarten Lankhorst 
>>>>> <maarten.lankhorst@linux.intel.com>
>>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/Kconfig        |   4 +
>>>>>   drivers/gpu/drm/Makefile       |   3 +
>>>>>   drivers/gpu/drm/drm_suballoc.c | 301 
>>>>> +++++++++++++++++++++++++++++++++
>>>>>   include/drm/drm_suballoc.h     | 112 ++++++++++++
>>>>>   4 files changed, 420 insertions(+)
>>>>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>>>>   create mode 100644 include/drm/drm_suballoc.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>>> index dc0f94f02a82..8fbe57407c60 100644
>>>>> --- a/drivers/gpu/drm/Kconfig
>>>>> +++ b/drivers/gpu/drm/Kconfig
>>>>> @@ -232,6 +232,10 @@ config DRM_GEM_SHMEM_HELPER
>>>>>       help
>>>>>         Choose this if you need the GEM shmem helper functions
>>>>>   +config DRM_SUBALLOC_HELPER
>>>>> +    tristate
>>>>> +    depends on DRM
>>>>> +
>>>>>   config DRM_SCHED
>>>>>       tristate
>>>>>       depends on DRM
>>>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>>> index ab4460fcd63f..1e04d135e866 100644
>>>>> --- a/drivers/gpu/drm/Makefile
>>>>> +++ b/drivers/gpu/drm/Makefile
>>>>> @@ -88,6 +88,9 @@ obj-$(CONFIG_DRM_GEM_DMA_HELPER) += 
>>>>> drm_dma_helper.o
>>>>>   drm_shmem_helper-y := drm_gem_shmem_helper.o
>>>>>   obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
>>>>>   +drm_suballoc_helper-y := drm_suballoc.o
>>>>> +obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
>>>>> +
>>>>>   drm_vram_helper-y := drm_gem_vram_helper.o
>>>>>   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>>>>>   diff --git a/drivers/gpu/drm/drm_suballoc.c 
>>>>> b/drivers/gpu/drm/drm_suballoc.c
>>>>> new file mode 100644
>>>>> index 000000000000..6e0292dea548
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/drm_suballoc.c
>>>>> @@ -0,0 +1,301 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2022 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include <drm/drm_suballoc.h>
>>>>> +
>>>>> +/**
>>>>> + * DOC:
>>>>> + * This suballocator intends to be a wrapper around a range 
>>>>> allocator
>>>>> + * that is aware also of deferred range freeing with fences. 
>>>>> Currently
>>>>> + * we hard-code the drm_mm as the range allocator.
>>>>> + * The approach, while rather simple, suffers from three performance
>>>>> + * issues that can all be fixed if needed at the tradeoff of more 
>>>>> and / or
>>>>> + * more complex code:
>>>>> + *
>>>>> + * 1) It's cpu-hungry, the drm_mm allocator is overkill. Either 
>>>>> code a
>>>>> + * much simpler range allocator, or let the caller decide by 
>>>>> providing
>>>>> + * ops that wrap any range allocator. Also could avoid waking up 
>>>>> unless
>>>>> + * there is a reasonable chance of enough space in the range 
>>>>> manager.
>>>>
>>>> That's most likely highly problematic.
>>>>
>>>> The suballocator in radeon/amdgpu was designed so that it resembles 
>>>> a ring buffer and is therefor rather CPU efficient.
>>>>
>>>> We could make the allocator much more trivial, but using drm_mm for 
>>>> this is a sledgehammer and therefore a pretty clear no-go.
>>>>
>>> I don't think the ring vs non-ring is the big problem here, because 
>>> (at least with the original implementation), if allocations are 
>>> actually made and released in a ring-like fashion, the drm_mm 
>>> free-list would consist of one or two blocks and therefore pretty 
>>> efficient even for that case, and if slightly longer that would 
>>> still not be an issue compared to the fence lists maintained in the 
>>> older allocator.
>>>
>>> The problem is more all the other stuff that was added and built on 
>>> top like the interval / rb tree.
>>>
>>> I still like the idea (originating from Gallium's helpers) to 
>>> separate whatever is allocating from the fence delayed free.
>>
>> That's actually a bad idea. See the ring like approach works because 
>> the fences used in amdgpu/radeon are used in a ring like fashion. 
>> E.g. the sub allocator mainly provides the temporary space for page 
>> table updates. Those in turn are then used by commands written into a 
>> ring buffer.
>
> Well, what I'm saying is that *even* if you have a ring-like 
> allocation algorithm, given a simpler drm_mm, I think the suggested 
> code would be performing just as well as the one in amdgpu / radeon, 
> on top of avoiding throttling on free, or do you have a particular 
> scenario in mind that you think would be particularly pathological on 
> this allocator?

What do you mean with avoiding throttling on free?

>
>>
>>>
>>> Any chance you could do a quick performance comparison? If not, 
>>> anything against merging this without the amd / radeon changes until 
>>> we can land a simpler allocator?
>>
>> Only if you can stick the allocator inside Xe and not drm, cause this 
>> seems to be for a different use case than the allocators inside 
>> radeon/amdgpu.
>
> Hmm. No It's allocating in a ring-like fashion as well.  Let me put 
> together a unit test for benchmaking. I think it would be a failure 
> for the community to end up with three separate suballocators doing 
> the exact same thing for the same problem, really.

Well exactly that's the point. Those allocators aren't the same because 
they handle different problems.

The allocator in radeon is simpler because it only had to deal with a 
limited number of fence timelines. The one in amdgpu is a bit more 
complex because of the added complexity for more fence timelines.

We could take the one from amdgpu and use it for radeon and others as 
well, but the allocator proposed here doesn't even remotely matches the 
requirements.

Regards,
Christian.

>
> /Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>>
>>> Thomas
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> + *
>>>>> + * 2) We unnecessarily install the fence callbacks too early, 
>>>>> forcing
>>>>> + * enable_signaling() too early causing extra driver effort. This 
>>>>> is likely
>>>>> + * not an issue if used with the drm_scheduler since it calls
>>>>> + * enable_signaling() early anyway.
>>>>> + *
>>>>> + * 3) Long processing in irq (disabled) context. We've mostly 
>>>>> worked around
>>>>> + * that already by using the idle_list. If that workaround is 
>>>>> deemed to
>>>>> + * complex for little gain, we can remove it and use spin_lock_irq()
>>>>> + * throughout the manager. If we want to shorten processing in 
>>>>> irq context
>>>>> + * even further, we can skip the spin_trylock in 
>>>>> __drm_suballoc_free() and
>>>>> + * avoid freeing allocations from irq context altogeher. However 
>>>>> drm_mm
>>>>> + * should be quite fast at freeing ranges.
>>>>> + *
>>>>> + * 4) Shrinker that starts processing the list items in 2) and 3) 
>>>>> to play
>>>>> + * better with the system.
>>>>> + */
>>>>> +
>>>>> +static void drm_suballoc_process_idle(struct drm_suballoc_manager 
>>>>> *sa_manager);
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_manager_init() - Initialise the drm_suballoc_manager
>>>>> + * @sa_manager: pointer to the sa_manager
>>>>> + * @size: number of bytes we want to suballocate
>>>>> + * @align: alignment for each suballocated chunk
>>>>> + *
>>>>> + * Prepares the suballocation manager for suballocations.
>>>>> + */
>>>>> +void drm_suballoc_manager_init(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                   u64 size, u64 align)
>>>>> +{
>>>>> +    spin_lock_init(&sa_manager->lock);
>>>>> +    spin_lock_init(&sa_manager->idle_list_lock);
>>>>> +    mutex_init(&sa_manager->alloc_mutex);
>>>>> +    drm_mm_init(&sa_manager->mm, 0, size);
>>>>> +    init_waitqueue_head(&sa_manager->wq);
>>>>> +    sa_manager->range_size = size;
>>>>> +    sa_manager->alignment = align;
>>>>> +    INIT_LIST_HEAD(&sa_manager->idle_list);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_suballoc_manager_init);
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
>>>>> + * @sa_manager: pointer to the sa_manager
>>>>> + *
>>>>> + * Cleans up the suballocation manager after use. All fences added
>>>>> + * with drm_suballoc_free() must be signaled, or we cannot clean up
>>>>> + * the entire manager.
>>>>> + */
>>>>> +void drm_suballoc_manager_fini(struct drm_suballoc_manager 
>>>>> *sa_manager)
>>>>> +{
>>>>> +    drm_suballoc_process_idle(sa_manager);
>>>>> +    drm_mm_takedown(&sa_manager->mm);
>>>>> +    mutex_destroy(&sa_manager->alloc_mutex);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_suballoc_manager_fini);
>>>>> +
>>>>> +static void __drm_suballoc_free(struct drm_suballoc *sa)
>>>>> +{
>>>>> +    struct drm_suballoc_manager *sa_manager = sa->manager;
>>>>> +    struct dma_fence *fence;
>>>>> +
>>>>> +    /*
>>>>> +     * In order to avoid protecting the potentially lengthy 
>>>>> drm_mm manager
>>>>> +     * *allocation* processing with an irq-disabling lock,
>>>>> +     * defer touching the drm_mm for freeing until we're in task 
>>>>> context,
>>>>> +     * with no irqs disabled, or happen to succeed in taking the 
>>>>> manager
>>>>> +     * lock.
>>>>> +     */
>>>>> +    if (!in_task() || irqs_disabled()) {
>>>>> +        unsigned long irqflags;
>>>>> +
>>>>> +        if (spin_trylock(&sa_manager->lock))
>>>>> +            goto locked;
>>>>> +
>>>>> + spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
>>>>> +        list_add_tail(&sa->idle_link, &sa_manager->idle_list);
>>>>> + spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
>>>>> +        wake_up(&sa_manager->wq);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    spin_lock(&sa_manager->lock);
>>>>> +locked:
>>>>> +    drm_mm_remove_node(&sa->node);
>>>>> +
>>>>> +    fence = sa->fence;
>>>>> +    sa->fence = NULL;
>>>>> +    spin_unlock(&sa_manager->lock);
>>>>> +    /* Maybe only wake if first mm hole is sufficiently large? */
>>>>> +    wake_up(&sa_manager->wq);
>>>>> +    dma_fence_put(fence);
>>>>> +    kfree(sa);
>>>>> +}
>>>>> +
>>>>> +/* Free all deferred idle allocations */
>>>>> +static void drm_suballoc_process_idle(struct drm_suballoc_manager 
>>>>> *sa_manager)
>>>>> +{
>>>>> +    /*
>>>>> +     * prepare_to_wait() / wake_up() semantics ensure that any list
>>>>> +     * addition that was done before wake_up() is visible when
>>>>> +     * this code is called from the wait loop.
>>>>> +     */
>>>>> +    if (!list_empty_careful(&sa_manager->idle_list)) {
>>>>> +        struct drm_suballoc *sa, *next;
>>>>> +        unsigned long irqflags;
>>>>> +        LIST_HEAD(list);
>>>>> +
>>>>> + spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
>>>>> +        list_splice_init(&sa_manager->idle_list, &list);
>>>>> + spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
>>>>> +
>>>>> +        list_for_each_entry_safe(sa, next, &list, idle_link)
>>>>> +            __drm_suballoc_free(sa);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static void
>>>>> +drm_suballoc_fence_signaled(struct dma_fence *fence, struct 
>>>>> dma_fence_cb *cb)
>>>>> +{
>>>>> +    struct drm_suballoc *sa = container_of(cb, typeof(*sa), cb);
>>>>> +
>>>>> +    __drm_suballoc_free(sa);
>>>>> +}
>>>>> +
>>>>> +static int drm_suballoc_tryalloc(struct drm_suballoc *sa, u64 size)
>>>>> +{
>>>>> +    struct drm_suballoc_manager *sa_manager = sa->manager;
>>>>> +    int err;
>>>>> +
>>>>> +    drm_suballoc_process_idle(sa_manager);
>>>>> +    spin_lock(&sa_manager->lock);
>>>>> +    err = drm_mm_insert_node_generic(&sa_manager->mm, &sa->node, 
>>>>> size,
>>>>> +                     sa_manager->alignment, 0,
>>>>> +                     DRM_MM_INSERT_EVICT);
>>>>> +    spin_unlock(&sa_manager->lock);
>>>>> +    return err;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_new() - Make a suballocation.
>>>>> + * @sa_manager: pointer to the sa_manager
>>>>> + * @size: number of bytes we want to suballocate.
>>>>> + * @gfp: Allocation context.
>>>>> + * @intr: Whether to sleep interruptibly if sleeping.
>>>>> + *
>>>>> + * Try to make a suballocation of size @size, which will be rounded
>>>>> + * up to the alignment specified in specified in 
>>>>> drm_suballoc_manager_init().
>>>>> + *
>>>>> + * Returns a new suballocated bo, or an ERR_PTR.
>>>>> + */
>>>>> +struct drm_suballoc*
>>>>> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size,
>>>>> +         gfp_t gfp, bool intr)
>>>>> +{
>>>>> +    struct drm_suballoc *sa;
>>>>> +    DEFINE_WAIT(wait);
>>>>> +    int err = 0;
>>>>> +
>>>>> +    if (size > sa_manager->range_size)
>>>>> +        return ERR_PTR(-ENOSPC);
>>>>> +
>>>>> +    sa = kzalloc(sizeof(*sa), gfp);
>>>>> +    if (!sa)
>>>>> +        return ERR_PTR(-ENOMEM);
>>>>> +
>>>>> +    /* Avoid starvation using the alloc_mutex */
>>>>> +    if (intr)
>>>>> +        err = mutex_lock_interruptible(&sa_manager->alloc_mutex);
>>>>> +    else
>>>>> +        mutex_lock(&sa_manager->alloc_mutex);
>>>>> +    if (err) {
>>>>> +        kfree(sa);
>>>>> +        return ERR_PTR(err);
>>>>> +    }
>>>>> +
>>>>> +    sa->manager = sa_manager;
>>>>> +    err = drm_suballoc_tryalloc(sa, size);
>>>>> +    if (err != -ENOSPC)
>>>>> +        goto out;
>>>>> +
>>>>> +    for (;;) {
>>>>> +        prepare_to_wait(&sa_manager->wq, &wait,
>>>>> +                intr ? TASK_INTERRUPTIBLE :
>>>>> +                TASK_UNINTERRUPTIBLE);
>>>>> +
>>>>> +        err = drm_suballoc_tryalloc(sa, size);
>>>>> +        if (err != -ENOSPC)
>>>>> +            break;
>>>>> +
>>>>> +        if (intr && signal_pending(current)) {
>>>>> +            err = -ERESTARTSYS;
>>>>> +            break;
>>>>> +        }
>>>>> +
>>>>> +        io_schedule();
>>>>> +    }
>>>>> +    finish_wait(&sa_manager->wq, &wait);
>>>>> +
>>>>> +out:
>>>>> +    mutex_unlock(&sa_manager->alloc_mutex);
>>>>> +    if (!sa->node.size) {
>>>>> +        kfree(sa);
>>>>> +        WARN_ON(!err);
>>>>> +        sa = ERR_PTR(err);
>>>>> +    }
>>>>> +
>>>>> +    return sa;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_suballoc_new);
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_free() - Free a suballocation
>>>>> + * @suballoc: pointer to the suballocation
>>>>> + * @fence: fence that signals when suballocation is idle
>>>>> + * @queue: the index to which queue the suballocation will be 
>>>>> placed on the free list.
>>>>> + *
>>>>> + * Free the suballocation. The suballocation can be re-used after 
>>>>> @fence
>>>>> + * signals.
>>>>> + */
>>>>> +void
>>>>> +drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence)
>>>>> +{
>>>>> +    if (!sa)
>>>>> +        return;
>>>>> +
>>>>> +    if (!fence || dma_fence_is_signaled(fence)) {
>>>>> +        __drm_suballoc_free(sa);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    sa->fence = dma_fence_get(fence);
>>>>> +    if (dma_fence_add_callback(fence, &sa->cb, 
>>>>> drm_suballoc_fence_signaled))
>>>>> +        __drm_suballoc_free(sa);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_suballoc_free);
>>>>> +
>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_dump_debug_info() - Dump the suballocator state
>>>>> + * @sa_manager: The suballoc manager.
>>>>> + * @p: Pointer to a drm printer for output.
>>>>> + * @suballoc_base: Constant to add to the suballocated offsets on 
>>>>> printout.
>>>>> + *
>>>>> + * This function dumps the suballocator state. Note that the 
>>>>> caller has
>>>>> + * to explicitly order frees and calls to this function in order 
>>>>> for the
>>>>> + * freed node to show up as protected by a fence.
>>>>> + */
>>>>> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                  struct drm_printer *p, u64 suballoc_base)
>>>>> +{
>>>>> +    const struct drm_mm_node *entry;
>>>>> +
>>>>> +    spin_lock(&sa_manager->lock);
>>>>> +    drm_mm_for_each_node(entry, &sa_manager->mm) {
>>>>> +        struct drm_suballoc *sa =
>>>>> +            container_of(entry, typeof(*sa), node);
>>>>> +
>>>>> +        drm_printf(p, " ");
>>>>> +        drm_printf(p, "[0x%010llx 0x%010llx] size %8lld",
>>>>> +               (unsigned long long)suballoc_base + entry->start,
>>>>> +               (unsigned long long)suballoc_base + entry->start +
>>>>> +               entry->size, (unsigned long long)entry->size);
>>>>> +
>>>>> +        if (sa->fence)
>>>>> +            drm_printf(p, " protected by 0x%016llx on context %llu",
>>>>> +                   (unsigned long long)sa->fence->seqno,
>>>>> +                   (unsigned long long)sa->fence->context);
>>>>> +
>>>>> +        drm_printf(p, "\n");
>>>>> +    }
>>>>> +    spin_unlock(&sa_manager->lock);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
>>>>> +#endif
>>>>> +
>>>>> +MODULE_AUTHOR("Intel Corporation");
>>>>> +MODULE_DESCRIPTION("Simple range suballocator helper");
>>>>> +MODULE_LICENSE("GPL and additional rights");
>>>>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>>>>> new file mode 100644
>>>>> index 000000000000..910952b3383b
>>>>> --- /dev/null
>>>>> +++ b/include/drm/drm_suballoc.h
>>>>> @@ -0,0 +1,112 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2022 Intel Corporation
>>>>> + */
>>>>> +#ifndef _DRM_SUBALLOC_H_
>>>>> +#define _DRM_SUBALLOC_H_
>>>>> +
>>>>> +#include <drm/drm_mm.h>
>>>>> +
>>>>> +#include <linux/dma-fence.h>
>>>>> +#include <linux/types.h>
>>>>> +
>>>>> +/**
>>>>> + * struct drm_suballoc_manager - Wrapper for fenced range 
>>>>> allocations
>>>>> + * @mm: The range manager. Protected by @lock.
>>>>> + * @range_size: The total size of the range.
>>>>> + * @alignment: Range alignment.
>>>>> + * @wq: Wait queue for sleeping allocations on contention.
>>>>> + * @idle_list: List of idle but not yet freed allocations. 
>>>>> Protected by
>>>>> + * @idle_list_lock.
>>>>> + * @task: Task waiting for allocation. Protected by @lock.
>>>>> + */
>>>>> +struct drm_suballoc_manager {
>>>>> +    /** @lock: Manager lock. Protects @mm. */
>>>>> +    spinlock_t lock;
>>>>> +    /**
>>>>> +     * @idle_list_lock: Lock to protect the idle_list.
>>>>> +     * Disable irqs when locking.
>>>>> +     */
>>>>> +    spinlock_t idle_list_lock;
>>>>> +    /** @alloc_mutex: Mutex to protect against stavation. */
>>>>> +    struct mutex alloc_mutex;
>>>>> +    struct drm_mm mm;
>>>>> +    u64 range_size;
>>>>> +    u64 alignment;
>>>>> +    wait_queue_head_t wq;
>>>>> +    struct list_head idle_list;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct drm_suballoc: Suballocated range.
>>>>> + * @node: The drm_mm representation of the range.
>>>>> + * @fence: dma-fence indicating whether allocation is active or 
>>>>> idle.
>>>>> + * Assigned on call to free the allocation so doesn't need 
>>>>> protection.
>>>>> + * @cb: dma-fence callback structure. Used for callbacks when the 
>>>>> fence signals.
>>>>> + * @manager: The struct drm_suballoc_manager the range belongs 
>>>>> to. Immutable.
>>>>> + * @idle_link: Link for the manager idle_list. Progected by the
>>>>> + * drm_suballoc_manager::idle_lock.
>>>>> + */
>>>>> +struct drm_suballoc {
>>>>> +    struct drm_mm_node node;
>>>>> +    struct dma_fence *fence;
>>>>> +    struct dma_fence_cb cb;
>>>>> +    struct drm_suballoc_manager *manager;
>>>>> +    struct list_head idle_link;
>>>>> +};
>>>>> +
>>>>> +void drm_suballoc_manager_init(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                   u64 size, u64 align);
>>>>> +
>>>>> +void drm_suballoc_manager_fini(struct drm_suballoc_manager 
>>>>> *sa_manager);
>>>>> +
>>>>> +struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                      u64 size, gfp_t gfp, bool intr);
>>>>> +
>>>>> +void drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence 
>>>>> *fence);
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_soffset - Range start.
>>>>> + * @sa: The struct drm_suballoc.
>>>>> + *
>>>>> + * Return: The start of the allocated range.
>>>>> + */
>>>>> +static inline u64 drm_suballoc_soffset(struct drm_suballoc *sa)
>>>>> +{
>>>>> +    return sa->node.start;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_eoffset - Range end.
>>>>> + * @sa: The struct drm_suballoc.
>>>>> + *
>>>>> + * Return: The end of the allocated range + 1.
>>>>> + */
>>>>> +static inline u64 drm_suballoc_eoffset(struct drm_suballoc *sa)
>>>>> +{
>>>>> +    return sa->node.start + sa->node.size;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_suballoc_size - Range size.
>>>>> + * @sa: The struct drm_suballoc.
>>>>> + *
>>>>> + * Return: The size of the allocated range.
>>>>> + */
>>>>> +static inline u64 drm_suballoc_size(struct drm_suballoc *sa)
>>>>> +{
>>>>> +    return sa->node.size;
>>>>> +}
>>>>> +
>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                  struct drm_printer *p, u64 suballoc_base);
>>>>> +#else
>>>>> +static inline void
>>>>> +drm_suballoc_dump_debug_info(struct drm_suballoc_manager 
>>>>> *sa_manager,
>>>>> +                 struct drm_printer *p, u64 suballoc_base)
>>>>> +{ }
>>>>> +
>>>>> +#endif
>>>>> +
>>>>> +#endif /* _DRM_SUBALLOC_H_ */
>>>>
>>

