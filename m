Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E544D871FF3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09445112AC9;
	Tue,  5 Mar 2024 13:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J+wy3xGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E5F112AC9;
 Tue,  5 Mar 2024 13:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC8rC5FqjaNtslXouzgK2rVaWLIe5Ryx6HCmZzvw7qttq/iQseyvnayQt/Qpj/t8jHZ8RXMK7qaNO6mRFGmcDlZpfimm7U0npdUfqcBOxzE8iWA6QbFKHdPa1484NiHzz25QQZ5BrbRe6Ibd94dND4HPqbeLQpYjJT4SprhNDzQQFd5sLuPuZxrfH720L+ZZ5eQ+04WDbCAQ92QLVd/DIhfV6r82IQj8IN4Ft/wFh/jmbfy/uxblH18FjzfBibrmHOLtLC6j7NNZ8O2kq54izeJgil+Xi+RTBlXoILR+auABff/R4feRGWufK6tA8WAPibyfXGkagAsfHM7jIu9mUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECmRjoCYtgPVjCPvI4GfvAXoAj0kEddcNcW0Hvbf6mg=;
 b=h5NdZLjfm85QweOmStI5Uql9UWd35X4jQJKpQ6qM/zT7VigYgwU0PXkPcXw1w4yExfqrbUhc5JroLX/vdi3OwB4UYOgS6NJEj7Usdx4sf0ERzT9+SU9DWZrg3uYBXUR8B/w3W1Q9Fr8YytyLbV01yXVvMxS3+8fs3Gs95NdS8cg46JiGak2GA+2lHAt7r6ko/IGL4FuWd4zctmqqbe9RNK3El8mQRRrHe1m/DpUAbMkSMGbX40lX6DR77Mlfb8Hg0AXXVQ4NilaxNOkCssqlc8h/Phpp/pl5w94Ak36BDwsVKHGo9fyrNcbMSeOGOSlBf6HCCzYlaFayivq/UaKZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECmRjoCYtgPVjCPvI4GfvAXoAj0kEddcNcW0Hvbf6mg=;
 b=J+wy3xGhGYIK+9n9xEgZ0N7CgmhvN+3xPjyc6mzU+6OaxbivbZvHLmYItR8V408d+A7Bpz3KQwloAbRhPA9rf2zStBUPvR9+LVlIfQ5qTFvFs67r4AakxzS/41inkIwe3AYvnuOghrwJs4ZlbMN1jKLNTvKdIWV2HTdcz5989NM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 13:20:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Tue, 5 Mar 2024
 13:20:41 +0000
Message-ID: <85027e94-9741-4bf8-ba5c-2937fc27d2d3@amd.com>
Date: Tue, 5 Mar 2024 14:20:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add ring timeout information in devcoredump
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240305115843.3119708-1-sunil.khatri@amd.com>
 <209b7e69-594d-4e40-8173-42643f94f2ba@amd.com>
 <d517ae14-4668-4782-9a96-d5482ca5c81d@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d517ae14-4668-4782-9a96-d5482ca5c81d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0146.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcaf613-d285-49a4-ef8d-08dc3d170e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvRBHt/0hHGcXnEbeYeBK2ypfm+zvtDLVthMePqBC8hcmPOg8Igy5tIwTmbjo/DWqpGQ2OD08jgj6r3jQgtD1EZ4Hl7bKWYD5vExCAgvhM6Yocl3GjQwB1J7WBkGqOvG8cpnU04IiGw0l631mmbU8gAzgSk+rR56faPem2JItBjvXNxgDkbdlfj5ASNFVH2QUS7wiouA6ohCUthbhNGxL0xQzunSEogSseXm9+G15LgS8hhY1rEwp/ibw5R7sUYnIBKkG0VmH4h/0TgeTgOO8KYyx0X3vHnSkDpJCY3+kPNLSI3gjA1cSY8IA/o3VNaMziUUGyNliT6HV98bz+WcRVLQZvNV+RKqJIrGltg321Z60u9HSFZT/qIHztd4BWibJ9e8aiB6Kut/hiT6HGlEFRwknQWjaCr6xG6Us85siPzHnFLoZQY4/zcoay2tKO/qnno+WMoig5Q9t5Bg0SXbkzv6Z35inUh6K49g1kzDPRWbFuIBZJ8Unlt4bi92Kc+nLoL5yrvEsVTaL97YRp/cqRGU0EgchPpHfzOsl9R66jyGCujZnB/jNyORikCbIOwV2TcqH8U7Kfw422f/IyP9Ap9f8YGlqvXTrXtdi9KnysMmMAiq+xGZyIx4UsZBZvYIwBYnabtpCm5oQ+DKdWV57bVeiGD0/aXztQa9+/2IA8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTVFYmFsK2duaG1UUkQvdWphZ0N4QThrVlNscmVIWG1PbllVcndlVFdyY3Fu?=
 =?utf-8?B?cmVvaVlqWUxVbHMxY0tWZWtlMmNNTmFTMnFnNGI5c1lhWTJRSzFtbkUySm9H?=
 =?utf-8?B?U0Y1a1orcjkwM2ljaUtVMWhzSk9yWTIwVXMyRm55akdmemNPcUN3Qkwrc292?=
 =?utf-8?B?czR6Zkl3TnN0ekc5UHZnL0NGZzI5bXRHaS9hZGFuQ2NJb3Q2VTB1UThLWUMx?=
 =?utf-8?B?UHppUnNDVzJ2Q3dYU1V2MFVCUmRvZU1LcWpHT1VaSk96QjRtZ1YrVGhMb3pa?=
 =?utf-8?B?QllpRWp3RXphQUN2UXhJUG4ramFUY21pVDdHZEJ4QmhMRXowSXBEYjRaZWZK?=
 =?utf-8?B?R0JnOHdxV0ZNWEpQUVVPM3Z0TjdlcElCTFJ3VzliVHVYY2xlMzY2ak1ra2di?=
 =?utf-8?B?SnJzVXJJa2phbDJiWlg0Q3YxUmFEWDNFUEc0UlBXUzByZ0lmSHlPWkM1QlVO?=
 =?utf-8?B?Y0orS0dKdEloMXM2M3hXSk5yTWR5SEhMUlBHWFArTWM4dUIvWXhiVVlzT2ZM?=
 =?utf-8?B?TDAzWVROTmxWUTdVNG5QazhYMU9nb3RtamhyMWhMSU54ODIyNGkzZGpxUGtX?=
 =?utf-8?B?dnRPM3JRZkJ5ZzAwUVZSVWZPVmllWUhTQ0NtTFYrQnhlTE4yNHBodXYyR0F6?=
 =?utf-8?B?Mko0NjVmdi9Sc0NCRGNQeHdsZHc1Sk1YZU9ieWR6NnloTmdwS0FuYmlIOS9B?=
 =?utf-8?B?TzRvOW5GZmI3LzZjYVEzbTNacmJpczJHZUo1a3NXVVkzS3phRDdsSm9zck1i?=
 =?utf-8?B?eWdoZnhZQnhJQVNCZkx4WEFOSFJueVBJdDNreHBXVVRReXBNdkdZUFZlakRm?=
 =?utf-8?B?Rk1obFFQZUxXYjVuRUVFUVdjSFk1alIwbEhVWkhhMkhHdDVyRllqWkh1c21l?=
 =?utf-8?B?dGlINHpZSFh1VVExNEtWd3ZYRzAxWm9Uc0ZEVlB0VnpUeHptZU9vcGwwSXRz?=
 =?utf-8?B?dFl3WVNJNkNjcHkrczVwTEZ0bWh2cnFlR0NCQmV1bjRISzVjeDFMQ1FtOWd3?=
 =?utf-8?B?Vkh4dlM4VW9Na0xYUzJmOGQ2aHhUb1VNVExxeFJzbGpqY1NvTlVFdkZ6QXJM?=
 =?utf-8?B?MjN6TXV3UGpmU2lERXZiMlMyQ2tkWjE0ZWxzT0VqbVZvTlcvdmlMQTQ0V0Vz?=
 =?utf-8?B?elc2QUorSVNrZ3JGRmxCVUhvNys0cDdCU3ZXVkZRWTR6aG1VZlpPSWl3WmFS?=
 =?utf-8?B?d1IrTzhUaTFkZDJBMHVuSFlXNUNJNjNuVUZyeWpyQmNoSmROSkdUeEtBcGhF?=
 =?utf-8?B?SitpMEhGR3VUYXhvVTRBQ3VsMGdPNnF2QXl3a2N2SGhIL08rL1ZxbGhXbzlY?=
 =?utf-8?B?SXh2NEFYWG4ySVF1Ryt3VE9tNUY4TFhzSmFGU3hTdHUxaDNBWXd0QmpMSk5S?=
 =?utf-8?B?RTU1SXBUdlVQVW12Rmhrc3l2OHRMQzZ4cTVEYjFzbXZqZDJ2NW5XUUFhRG9V?=
 =?utf-8?B?V3JnbmQ0WVVmYUFuUHFRVklhYUlwYWM3UW9xQlF1SDVra0MxSGprTkJnOGR0?=
 =?utf-8?B?VXNGMjR6YUk2cDl6endiNmFiK3VEUUZORWZvNE9DL2NQVHdOQlB1SzB4WXVR?=
 =?utf-8?B?cVV3N3VxVDVZaVVOWjlIRUZIUU9UQnFUVWM1OERGeXQzWE9mRmJPOFJMUVhC?=
 =?utf-8?B?TFJjZGRQd0d0V0dFSlNTMTVoNWtLUzlMeDFvME5RWGptUDJZWDVLbmUyL043?=
 =?utf-8?B?ek5PclA1cGJrMkw3dUgwOU9VK0ZwVVJXL1ZySENhYzNuUUFEWWloTnFwdkU3?=
 =?utf-8?B?clg4R084U25FWVNWL0hxc3MrU3dFSC96ZURFQTY4VUJXbEpTMXlHaXBDMjRX?=
 =?utf-8?B?WnpMRThqSUJqd3JlL2U3UXYyQS9BbDN1am4ybm5HRnV6aFlXckFWMmNEcCsz?=
 =?utf-8?B?cHBueU1INFY4djFncGpmb3FwamFSdS85VFVDRWtTY1p0K1FhbDRoYnVmS0I4?=
 =?utf-8?B?NzRUN1Bsa2JWU1Q5UG9pZ2gvbHlrcDBFWTU1NHE5Z3JCN1NsbHA0bHVIWVRj?=
 =?utf-8?B?cVJpV3g3a2xJRndRWVVIZVZYTEh6ZTk5QmhtNkFmcXh0TzR4bFMrQ0ZpK21z?=
 =?utf-8?B?RFFFRjVPK2V6SlppdGp3Q2cxSmd5aUlWdS9qM3dCUWhpaWZoNnVQT3BjVGZW?=
 =?utf-8?Q?X5vJxZsRt9g491ompfLBF/cRR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcaf613-d285-49a4-ef8d-08dc3d170e1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 13:20:41.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkwZP36W0Cvh9m12u+QdPD74aWgHa19wcFplImn3CBmJBh1UlYLzSwOXTUVVRQdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
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

Am 05.03.24 um 14:17 schrieb Khatri, Sunil:
>
> On 3/5/2024 6:40 PM, Christian König wrote:
>> Am 05.03.24 um 12:58 schrieb Sunil Khatri:
>>> Add ring timeout related information in the amdgpu
>>> devcoredump file for debugging purposes.
>>>
>>> During the gpu recovery process the registered call
>>> is triggered and add the debug information in data
>>> file created by devcoredump framework under the
>>> directory /sys/class/devcoredump/devcdx/
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 +++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  2 ++
>>>   2 files changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index a59364e9b6ed..aa7fed59a0d5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -196,6 +196,13 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>> offset, size_t count,
>>>                  coredump->reset_task_info.process_name,
>>>                  coredump->reset_task_info.pid);
>>>   +    if (coredump->ring_timeout) {
>>> +        drm_printf(&p, "\nRing timed out details\n");
>>> +        drm_printf(&p, "IP Type: %d Ring Name: %s \n",
>>> +                coredump->ring->funcs->type,
>>> +                coredump->ring->name);
>>> +    }
>>> +
>>>       if (coredump->reset_vram_lost)
>>>           drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>>       if (coredump->adev->reset_info.num_regs) {
>>> @@ -220,6 +227,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, 
>>> bool vram_lost,
>>>   {
>>>       struct amdgpu_coredump_info *coredump;
>>>       struct drm_device *dev = adev_to_drm(adev);
>>> +    struct amdgpu_job *job = reset_context->job;
>>> +    struct drm_sched_job *s_job;
>>>         coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>>>   @@ -228,6 +237,12 @@ void amdgpu_coredump(struct amdgpu_device 
>>> *adev, bool vram_lost,
>>>           return;
>>>       }
>>>   +    if (job) {
>>> +        s_job = &job->base;
>>> +        coredump->ring = to_amdgpu_ring(s_job->sched);
>>> +        coredump->ring_timeout = TRUE;
>>> +    }
>>> +
>>>       coredump->reset_vram_lost = vram_lost;
>>>         if (reset_context->job && reset_context->job->vm) {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> index 19899f6b9b2b..6d67001a1057 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> @@ -97,6 +97,8 @@ struct amdgpu_coredump_info {
>>>       struct amdgpu_task_info         reset_task_info;
>>>       struct timespec64               reset_time;
>>>       bool                            reset_vram_lost;
>>> +    struct amdgpu_ring          *ring;
>>> +    bool                            ring_timeout;
>>
>> I think you can drop ring_timeout, just having ring as optional 
>> information should be enough.
>>
>> Apart from that looks pretty good I think.
>>
> - GPU reset could happen due to two possibilities atleast: 1. via 
> sysfs cat /sys/kernel/debug/dri/0/amdgpu_gpu_recover there is no 
> timeout or page fault here. In this case we need information if 
> ringtimeout happened or not else it will try to print empty 
> information in devcoredump. Same goes for pagefault also in that case 
> also we need to see if recovery ran due to pagefault and then only add 
> that information.
>
> So to cover all use cases i added this parameter.

Yeah, but you don't need that parameter.

If a GPU reset is triggered by a ring timeout we note the ring causing 
this, otherwise the ring is simply NULL.

There is no need for a separate variable to note that a timeout happened.

Regards,
Christian.

>
>
> Thanks
> Sunil
>
>> Regards,
>> Christian.
>>
>>>   };
>>>   #endif
>>

