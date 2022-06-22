Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E255526D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E206113637;
	Wed, 22 Jun 2022 17:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B2611248E;
 Wed, 22 Jun 2022 17:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1e+IHbRyDqkxWguWtfChnWcaqAb0pP7sIEZ+FtjENyBjZOPWvX5n28210/UZnJzHreTuKXmHftQ28wmBHE1qXJKNafJzPRkZOTJNBc2ZPZSALGuGKyXkEXci6vP9MNS4lVUwbMjm+pVURNK/xmAYO7mKLwng/8vNpwco8iceqKgXiAeqBYFjLpPW8yTR7uZdfmbbYBRFKwe3KdZw/UEoQ+sB5ZcGF3T8UiT6pov9p9Q3JZPzJEnOil8QIfjbTa3W41ve+8v9oj3Pg2lh6nPfQjw1rinHpZoRPsrbHxoHq5DpZdaIgVBRJTDcSxqMsAAvZw9eBgCmmtdA9sVWdE+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuO/x7mFhp68UrrWEOcvXfIwXx4CBOUZBvjpMpPITnk=;
 b=VebJCSuKAg1saybNSI6OXy3Rq21DMHsDrL3QFILWNmFMfH5VuGI3S0uff+CHuK3Q33Y/Vf9P1uY+sFtiBTl7TOWdGAH/DC/Xiq3qCaNP7wiTXSR94yApOEX272O7cm5+/JjU2/I0Tfyga9FyY7R0FRV+OmeCvQy2e1vSsvNy8BQDmZHE2g/WAjiMaMvm4gHDKjdIZkwm6dgFaP2/49i/dTSbAOadndKKZvI1bejYk7KU1y7xGwz3tGnM73KxDXnZolAPCeRVrFXmRRyms04LDqB8n54JS3x07lQlfYRgiTUqlS2kMAQrgS9Nnr39AOuYea6Lqn36qvc384zyACUaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuO/x7mFhp68UrrWEOcvXfIwXx4CBOUZBvjpMpPITnk=;
 b=CJFDfgfBwAqRVW3aTQMCMMIOrOsNWZi8YfPVpnJWvAqEG2IlY7cb008TcUHZOhl2D0gufi+pDkm9hwFM3kSjWvPujEomZ+vWO/PvZe4XFO55XGR9FEGqdmcCUBJHYWG6Hxut7gaIQOiN7CZ/4KY7P6wLkyTKWHZOSadm4VjLO3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB2727.namprd12.prod.outlook.com (2603:10b6:a03:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 17:31:34 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 17:31:34 +0000
Message-ID: <d87567d3-b6a6-6f10-fa24-222a96525e36@amd.com>
Date: Wed, 22 Jun 2022 13:31:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Content-Language: en-US
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
 <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
 <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
In-Reply-To: <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 848eb66f-53bd-4112-e7cc-08da54750dbd
X-MS-TrafficTypeDiagnostic: BYAPR12MB2727:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2727EBE6DF9E7D32AAD49EADEAB29@BYAPR12MB2727.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kg/t9MSxYLyYZLWe/1489R0JQGX3+ljrcgjOK4CU2CrQJ4tJ6ANoYSryLa+WHmo9d/OsM392ZceHJZG90DGewJ0x8bW/AHRaok+EAgATvn0JyHtgVmuvzwugRYVaflHSLG/WzTe6n8dSKyt6sS/5hD0hkWEhNLamMmItqtnnZ3oI6V08yaQx8Dx1KvwNq0XjFKMYtKsIklQQ8IihwLeS1EbGnRGHj4sfV2NIfWQiyhekodKAygh5JR7K5oD37tnvuQuwpDG59i7DxgQPo/qDqnzEl0xb2mdJwrJI3CaIle24+YwqtTXn3z8PrY/d8wab1UQ9um1vi7z2o6rYqWik8bwYMSAJ8p6PWc8PN4rwW9hg0qbFRWEbaY4NbLF3HhAZpaY96JsG0dFZ8jeJwxWoOo+173DfwWJf8SpHB4YQ6VhcUVEYsBPX1jUhtqfSRXywNJ7GhpyfKzyXef70b/R8MHghEREo7x80MCmIee16wwnsoRORWQTydsgL0zngAN8MUeeJIFTz8nCVcW+Y3NRPcTkrie03tWeTYzx9lIx8U9yzb52VqvRgtYkkkQaIUiiYQE3DQ24FcQqARW0drV/qAKBNMYTIb4IXqcKZ/OCbV6kvy9BkTIBWzrqvgwXRWDCTfUOIVzRIcSvA+w/BBnkLmLTa+5U6A5TtGe5I2S+ZzYTWBCtQ+yo9l7m4NMJCm7xbf8UMUjJ9OSjay3BVQFzpetYNID9k0Za0SU6jawFaYMHoBcvy3yI9OCemLPgXaX6DyT7wnwpaeGZqcz9/hAzmqik0jxlJoUEWOvoC8mD7WaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(44832011)(2906002)(6666004)(66574015)(66946007)(31696002)(8676002)(316002)(36756003)(53546011)(4326008)(38100700002)(6486002)(31686004)(186003)(66476007)(83380400001)(2616005)(6512007)(86362001)(66556008)(5660300002)(41300700001)(8936002)(6506007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9DYzQ3RVZTdGRSbS9yL3JBa0drOFpDbXIvU21xaXNuUWVGM1lBMDdvSmd5?=
 =?utf-8?B?WUEvWXBFaVd4SlFyQ1E2ZGM3WmtVT0h0MDU5MUFsb2NVb3A1WGllMzRmekti?=
 =?utf-8?B?czNDWk9kaDNIQ3V1MlZIajZJZ3licFB2TmdWKzNsMUIrbExjN0lKaVpid2JL?=
 =?utf-8?B?Rlk4WGlLRSsxOHBZam9ZaHgwTGYxbTNmWFgvVzdnVGNEbFkxRW9vSlJkZUFB?=
 =?utf-8?B?S1JCNFY4Nk5yZ2FhU1lORTRTRDd4WDg5TTJoeHdSU1MxUEdPcVhQSnEzWW9z?=
 =?utf-8?B?ZHRCVU9BZGpTWVFtR0Q3WHdNYlIvbWg3OTVQdHhBd3ZMOW5kKytyUndVZ2kr?=
 =?utf-8?B?bEwyOW5tOTJZTSs3NFoyWHUzdzE5UmhpdFpUb2hMQnFDb09MdW5ydE96WnpJ?=
 =?utf-8?B?bUpoOEhjR3VrckFSb004bk9WL2NYWTl4UllMTnptMFN6U1BLTjNJOE5ESmxx?=
 =?utf-8?B?c0NlSWhhWkZIelFJL1lCOVNxaGRwTm1KK2tCa0dUaURaUmdxbXFEWTFydnZs?=
 =?utf-8?B?cFRLYzNKa0xLSmFyMXhDd01vNm1BSUx6NVhNdDNiK3Z0Tndrak92WjJBa2pY?=
 =?utf-8?B?Y0VNRGRYT0h1bnNrQ0JnQlpJU0Z2b2hSQWp0alRTL21tZGJ4M1hIUDNwcFFh?=
 =?utf-8?B?V2VvaUpjRER0WGpwU3Z3ZmY2NGUyZXkvUlJYdFk2RXdnL2svNEZQMkZtTEty?=
 =?utf-8?B?MVdxNUY0RmpiU0Uzbk90eVd3K3BvQmpDK3pubElFS0Y1b1FTcnJYbWVkTWE3?=
 =?utf-8?B?RGZrSUQyaURRRGVqbC9Fak8va1JRUWZVdjFIS0ppWVJscnBmcm8wOFV1SE9l?=
 =?utf-8?B?Y21vaGt5UkZKeFM1VUNtRDFIT2JNdTJ2b3lpbXUrL3FXVzNiTkQwbnlsUjBJ?=
 =?utf-8?B?N1B6cGdRREJzdGNrdFdkL0w2SnRtVy9MejI3MGZlUjFwQmR4cFFqaDIveStY?=
 =?utf-8?B?cTlIblcyOGdmeXhrSUgreXo4SzA0S20vL3d0L2ZCazRkNVFIei9qNGJHU3BR?=
 =?utf-8?B?NWM4dC90Unh5elNwK2hnSTBNbkpWTFdLMlFHWXBYaGluWW5WaHdsK3JFK2Nw?=
 =?utf-8?B?Wm94cVloUDZxYjBFY2FsNmdoOTJjd05GY01xQ2RVbHFEeFdPaklHaENaTnNY?=
 =?utf-8?B?OG1YM0MzNTJKQzJBekFNbDJIelZwb0Z6aDIyUE1rZWd2eVZMUk9YN2pWZlZ4?=
 =?utf-8?B?NEpRQ3BTQlg4UTRxdm5uUXpUNXhDbGQyVy9BTFhaUzlxNGlOeGRNLzlLTC8y?=
 =?utf-8?B?UjFiN3IrSit0aHI3eVgwMlQzdTRxVXJac2FCN2RvSHF5VnM2c0M3dW1DVWgv?=
 =?utf-8?B?blcyQmRNeGtoR2dSOHU5Y0lKb1UzRTJSYzZ5QjVzRXNoRGpuaCtFOExWZXBB?=
 =?utf-8?B?WVNxVCtmb09KTW53MG55MVg4TXh4YXZuby83OWlCV1BJdUNZWWdOOTF5QnRp?=
 =?utf-8?B?bExOakhXRkdVVGdkWmNxNmczZ25HNkwwa3FpM0VpWk9FTU55UTV5YzRBL3ZD?=
 =?utf-8?B?QnVoN0kzeno0cGFDQ21wMnVSKzFOMytZbEpTNGx3elpDOGlQNW9WZWtoWVlS?=
 =?utf-8?B?U1NYd2gvV0dwQjAwVWhsNTlXNTYyWk1NcDEwTWRwaVVBR2ZaNmZmOUsyOWFY?=
 =?utf-8?B?T2UwWUN6TU92by9KZzlMNHAxbnNwTkl1SGNTdENCOFAyeEVTU3pDT0RFMEJE?=
 =?utf-8?B?VGh3Mlo4Z3lIQjl6UDlKTFB2LzV0VmJObDJ6emZJblpxT1hWRFc2aFFPY1o4?=
 =?utf-8?B?cythOU5EenB1bDNyT2dKY25MTitSQmZvc0RjWkoxaGhybi9md3g0cmhRLzAw?=
 =?utf-8?B?K29IaG5iTXBkcFNiY1prV2ZOUVZ0cU5aeHN1T01DR1h2RW1XRnhWSXRKSlcr?=
 =?utf-8?B?N0Y2YXpoUjhIUlVxUG0vQS9LOUNJNVJBQ0NRc0F6Y1JYcEs2TExPZTc0eEMz?=
 =?utf-8?B?dEZrcEZSc010c3YzOXIvWVlKSXpDbU1OOFc4SGtyaytNa1FSUS9XTTZ3RDlJ?=
 =?utf-8?B?SklwN1dPMWxHRHpVZ3dFK0haM0JETHVqaWRIeGNQcDd6QVJzRlFkQmFNOE1Y?=
 =?utf-8?B?NWxFa3hVL0lPYjd4bis4QzcxeTMreTQ2RXA2YTY4SWZMbjd2OEJWMXVVcS9U?=
 =?utf-8?B?ejZkN1haS1IwWFBLR0V1d3hUYVpmb0FHbGdRZFRQbjZEdnNINzM1cVVTSmt6?=
 =?utf-8?B?WnZtZXpNYk5KT0JFemdNU1U4MEE5WkhPSGdscGxQbDY1b1dIYUJNRitPR2Mx?=
 =?utf-8?B?RVIyeFgxbmpFMUdPNHBrY1hLRno5YlEvdXl6U0dzMzFxc1FrYVowKzlqNnNZ?=
 =?utf-8?B?TkhPNWZ0RHZDcGpDdmZ6K1I0bmNXNlZFS3UrSUE4SzYyUjZoTGdtekY2WldI?=
 =?utf-8?Q?Euz/neWXK0ofjyU+f85+oGe5ITGcGPEVygYMLy1ruTHxN?=
X-MS-Exchange-AntiSpam-MessageData-1: 0Gnv9yR4679OzQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848eb66f-53bd-4112-e7cc-08da54750dbd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 17:31:34.7146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XMV5DDntjPB2ERBxMVZbhjH+FG7easga2rxybvKTg281hQwdRmaH1fBq6bwZLHNCr1A+wZ9Cyyi9wPWMGDodA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2727
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a ping

Andrey

On 2022-06-21 15:45, Andrey Grodzovsky wrote:
>
> On 2022-06-21 03:25, Christian König wrote:
>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>> Problem:
>>> After we start handling timed out jobs we assume there fences won't be
>>> signaled but we cannot be sure and sometimes they fire late. We need
>>> to prevent concurrent accesses to fence array from
>>> amdgpu_fence_driver_clear_job_fences during GPU reset and 
>>> amdgpu_fence_process
>>> from a late EOP interrupt.
>>>
>>> Fix:
>>> Before accessing fence array in GPU disable EOP interrupt and flush
>>> all pending interrupt handlers for amdgpu device's interrupt line.
>>
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26 
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
>>>   3 files changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 2b92281dd0c1..c99541685804 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct 
>>> amdgpu_device *adev,
>>>           amdgpu_virt_fini_data_exchange(adev);
>>>       }
>>>   +    amdgpu_fence_driver_isr_toggle(adev, true);
>>> +
>>>       /* block all schedulers and reset given job's ring */
>>>       for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>           struct amdgpu_ring *ring = adev->rings[i];
>>> @@ -4620,6 +4622,8 @@ int amdgpu_device_pre_asic_reset(struct 
>>> amdgpu_device *adev,
>>>           amdgpu_fence_driver_force_completion(ring);
>>>       }
>>>   +    amdgpu_fence_driver_isr_toggle(adev, false);
>>> +
>>>       if (job && job->vm)
>>>           drm_sched_increase_karma(&job->base);
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index a9ae3beaa1d3..d6d54ba4c185 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct 
>>> amdgpu_device *adev)
>>>       }
>>>   }
>>>   +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, 
>>> bool stop)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>> +
>>> +        if (!ring || !ring->fence_drv.initialized || 
>>> !ring->fence_drv.irq_src)
>>> +            continue;
>>> +
>>> +        if (stop)
>>> +            amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>>> +                           ring->fence_drv.irq_type);
>>> +        else
>>> +            amdgpu_irq_get(adev, ring->fence_drv.irq_src,
>>> +                    ring->fence_drv.irq_type);
>>
>> That won't work like this. This increments/decrements the reference 
>> count for the IRQ, but doesn't guarantee in any way that they are 
>> stopped/started.
>
>
> I understand that, i just assumed that the fence driver is the only 
> holder of this interrupt source (e.g. regCP_INT_CNTL_RING0) ?
> I can disable amdgpu interrupt line totally using disable_irq - would 
> this be better ?
>
>
>>
>>
>>> +    }
>>> +
>>> +    /* TODO Only waits for irq handlers on other CPUs, maybe 
>>> local_irq_save
>>> +     * local_irq_local_irq_restore are needed here for local 
>>> interrupts ?
>>> +     *
>>> +     */
>>
>> Well that comment made me smile. Think for a moment what the local 
>> CPU would be doing if an interrupt would run :)
>
>
> No, I understand this of course, I am ok to be interrupted by 
> interrupt handler at this point, what i am trying to do
> is to prevent amdgpu_fence_process to run concurrently with 
> amdgpu_fence_driver_clear_job_fences - that is what this
> function is trying to prevent - i disable and flush pending EOP ISR 
> handlers before the call to clear fences and re-enable after.
> I guess we can also introduce a spinlock to serialize them ? Yiqing 
> reported seeing a race between them so we have to do something.
>
> Andrey
>
>
>>
>> Cheers,
>> Christian.
>>
>>> +    if (stop)
>>> +        synchronize_irq(adev->irq.irq);
>>> +}
>>> +
>>>   void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>   {
>>>       unsigned int i, j;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> index 7d89a52091c0..82c178a9033a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> @@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct 
>>> amdgpu_ring *ring,
>>>                         uint32_t wait_seq,
>>>                         signed long timeout);
>>>   unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
>>> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, 
>>> bool stop);
>>>     /*
>>>    * Rings.
>>
