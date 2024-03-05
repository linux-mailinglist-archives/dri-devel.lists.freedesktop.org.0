Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82A871FE5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E70112AC3;
	Tue,  5 Mar 2024 13:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lf+4cuLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34F112AC3;
 Tue,  5 Mar 2024 13:17:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+azJBLneArhUdyGwpYiH1BF69rjNqj1VYINztLsZqYH9RLUHy38wEJyIk/ldyKRBCpOBOwZqI/krMck32sTfQzwmICtRZMDUu4Wtn5J7xvsWSpw8fbMvvK9BHltKLahmJCZNqFRNDiLgacDmbdg87LOEqKhK38tdgdk+kfZpgovSsfrtt/KUQUcFgl9f4ieGOZv/5TbfQ38iKge3v9Z3Xi5aCK9MncaiL4twyD/xXkHQxMIXYQDLbJGp+2wWpeabtBoMVSkPibOJflSjoW1Am3ERiyM/yAdlVdRjXEc9r54rpXj+XZhP/r1aRPHBy8eZJS3K+bQ3WcmKTLnrNO8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jdwt+lJe+ILvwOHEkeOtsSw/4Fro4nhv62J14SIbq4=;
 b=Q8VyeFWdUW7UlcpjopjLYR6MuisQq7vf0BA0gnCO3p0ki/M+usHWx1Mr8w+cuPnbpBb/8TZGgUnL9UXZrrhzJoFI+tlKI7d9aAWY2OzTMDGpujUNhUEXnZwt53ECOkRokxr5gCs0ej+lj9LHhpv4T2tQ57Ej+zpuMQy0A5QpnJpI2Y3T5fktkAAjKdHVtxNJ5PFayq/KcLRo3nkcz3Th5KYmHaVmJHOFNlmq3WQcmD5DBdIm+XGqUnS7nCQ9GlKW2Xu2tGfdZmPQToyetszcUZi5g0BZ4YRxRIoLoompI/2DJVMleq9dQwcTovmFbFp3KL3Ofqx5wAvlYmENAV7Rvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jdwt+lJe+ILvwOHEkeOtsSw/4Fro4nhv62J14SIbq4=;
 b=Lf+4cuLxMmDUsYtvGuSn5PE8RpIqP1/C8JV//YqSE2vl76UllvMJGAHnixKUvqEpPLOASKK/cBwVAUXNcYRjimraLptFGIh54L2lBbKz7+tZZyU6Dm548nGrV3xOhpuzsS3IiWBOWN6zhihEoqBygHm+TSJuYVMwPQ7DA/9OUEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 13:17:38 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::b582:10d1:a1e4:6035]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::b582:10d1:a1e4:6035%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 13:17:38 +0000
Message-ID: <d517ae14-4668-4782-9a96-d5482ca5c81d@amd.com>
Date: Tue, 5 Mar 2024 18:47:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add ring timeout information in devcoredump
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240305115843.3119708-1-sunil.khatri@amd.com>
 <209b7e69-594d-4e40-8173-42643f94f2ba@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <209b7e69-594d-4e40-8173-42643f94f2ba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: cf014751-be81-4ca9-d6bf-08dc3d16a12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWiEM3FtltIdCy8+CjZGO3Jerwq2BuT625ePgaRqLnJTiGOMrIFEFDCi9zvYRenHKhJ2t8pREFG1/YOTsmokb8YccgcOYBOOkT8mrOCeYyPDZGsxvrQfTcKuUCklGdnDe49GblQv2lDesp+4PtT9wQL2CgGrbe3/p9p6vURhavPojzrpkg4Orm61laJyiHIT0gAD1V7BCQDrhAH+LL0Ir/DNQqW2UF3JGOsPxPusUz/XtzwWgUF3fjcYKDSE8GP6/7JMILNmLa10/Ql03PlwVvaL7/VNdDtIL9zX6eVGqTcVdExTsUir/533viwnpgNK92JBmW5bMd43jpXrVy7X7ujHuhX/4/hABXMxL4JZieoyrhSGxY1HeTbEp6FhdPNx61moZ/fkMbcXwdP0CCXKp+f09MtpLJDeGB/Lj/rHZV7nG8hz660IyPc/Yaw6PhgxYSqAI3fku7IuIajI7sMyIecVsaD4uQ+HztU5Mdp1oUXP69cJ1hN1VlZty29m5tQsU3ZY8wat0V3mZW4YwioJ7qqAd4rqtLvh2ZIxts+b/rGGKO+zo2Qo5jvDawwQmanbOAo4QT64enZ5hu2FiMX75R/eK+Fua1hE6cqFyn0o7mgYWIE4pvi3OBSXqXMOLBDFI7UJCUSaa4mW4Vn1PUEZfYKA/FEIZNvtk0PLP2oZ3Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RRMmJuN3dqUW5MbFdvVWI0MVhTRkcra0krNE1MUEE2TlA1eDRDVU5KaXNv?=
 =?utf-8?B?WktFb2tVQXQrdlJram5uTEQ3SXZjck95UU9EQVBPcnEvMlhNZFNHcjlTZ0cx?=
 =?utf-8?B?NmdMTXR3U1BYeVpRVmtVZGQzVzFFZnVRdE8xOE9iYlBuTHlLUU1KUVoyWndD?=
 =?utf-8?B?N2hCUzRtaGlnK2x5SmZnUjh0Q1VmL2RvNlptWWEyWkVqTzJqZTZhaUUzMEZZ?=
 =?utf-8?B?NVMyaXorbTJBSXJGNjR0ZTl1QlhMY0xvaTR3cHZSU2FheTB5SEZMdFd2aTBM?=
 =?utf-8?B?V2tkelJvT2NvSnFQU1hWa2ZqeTVTdzVycFlNR3diVjU4aG5Yck5TOTZnNDJp?=
 =?utf-8?B?eFN0TW9oKzRmOGpHRWczRXJlK0hvTWhWenE0R09QTk1WY01JRTdVSjFwdW5a?=
 =?utf-8?B?L2VDQzg1VFQ5WXMyM2ZzYVBNQ2dBUVpycVNQNXI0OFhCR3NxWVdzQ0swVDMv?=
 =?utf-8?B?cmw3TEhUanRINnp6L2VtSHFBd2I0cG5qcmF0NDhjeHdMUjJXaXFPdzR1R1Jz?=
 =?utf-8?B?aUkwTkM2SUFTTlFDK3Z0NktIWFdLU1Y1cDhIMUJCV21xalpoanFDM2JTbTNN?=
 =?utf-8?B?aGRpTkg4cUlaYmxJUW9nOS9hSjhsRVJUUGVVSHRzZ1JSM0NpVHFhSXo0U0FN?=
 =?utf-8?B?ZFVRVUhwQ3RNMDI1TTdhTHRCMFZSMW9TUjYySk0vY1ZtbjZuK3M3V0l6aEd2?=
 =?utf-8?B?dWhmOFRlUm5LbEwvcnBDSWoxVDNYN1cyZExxaHQ5Nmx3UVJwTlY1OVNEVkRI?=
 =?utf-8?B?b09ETjMwZFVHNDQwR2puTGhwU1JuQTlmV0I4NDZINTVWWG9Vd3J5TWMwT25z?=
 =?utf-8?B?bEZIY0xzQ21YTjJEaWpjUVVJSm9zWFJzRVdIaW52bHUraW5TRk5WY3A5eVJH?=
 =?utf-8?B?Mm1ZcGJxS1doUGhITE9ZSERzSWQvRjIyb3lNTGsvZFNCcHlxOUZnOXZobzB2?=
 =?utf-8?B?c2tZaEV1bTRwQlhhWGJDMTB4cVM2aDByN0tXcGVhY1krUjZxTEJuV29Nc0d4?=
 =?utf-8?B?KzE5WWlOUi9HSVhqU0dNSEpvRDFGYlpjbm5QTE51NHA2NjFnM3BPT0JrV243?=
 =?utf-8?B?Sjg4QjcwRXBGeFFCRXdwU0VYQW0zZDFaTE1XdlhGanVOTk0ya1lqR2lNZ3Bp?=
 =?utf-8?B?UnhUUENSTzBWQkliMGtORlUwUFp6Q3g3OWE4c3gxN1ZnckEyQzA3RVBrTEdk?=
 =?utf-8?B?ZmRlTWwzQS92cmQxdndnZVRuK2FwSytWYXBkamNjYVM3ZDR1U0NRRldMYnZr?=
 =?utf-8?B?WHZvemlHV0pDa0JOZXVxUW11bFJTQlk5eTRwWVJHWEpvVm9ZN0w5SWxXSUFn?=
 =?utf-8?B?S05rOEswNVBlaG1yNFJZRi83U3EzMjVLRmNRb3ovTjhIVGd5YTUvNEs0RkV1?=
 =?utf-8?B?MWdlTVR4ci9oeHMrWjJxWFFmTXhkTDBhU0xJWTdMcE5iN0NTUjNMTDVOZTAz?=
 =?utf-8?B?NkFJTzRDNTlFVmtpaFJpdks1d1J5SVhyam1VN2JUS3FsdXRDZXhjenU1bXg5?=
 =?utf-8?B?cnJxNUN6RjZZMFBucTRSeTIwa1FiUmp2N01TSFBncEQyRnpiLzZKcEo1NVg1?=
 =?utf-8?B?dExtWGNmVllPTGtKbmFUeGpLaitzcEpkVVg2cXlYMmpYY3IzZVdnZUcwK0pD?=
 =?utf-8?B?RG42RXpJNWsrS2ZSSVlBSE12TWlid2pVbnpXM3NFb3pZVm00RkhuazNEdzJF?=
 =?utf-8?B?NUZVL3pDZU9TbExkTkFtbmZpUDdUOXRLbHAzYzEycTZJL05heG1TdUpQV2dU?=
 =?utf-8?B?aVNCUnIvSHJxTllScldpcjlib3FrcWxINE9KQ3FVTkI1bGNMeHFkbFZMWlJM?=
 =?utf-8?B?OWJPMFczMmNIU0doOFdobm9UV2hleUplNjlXR2ptTVU5MHVhN24vOWl6K0lE?=
 =?utf-8?B?ZjFabnpLc29WTEprYTJrTHIwZktlWThEMHhHMmNKTTA4VXhUbVlmbTdBb25P?=
 =?utf-8?B?cHZqRFNnSFB3N2VuOEFaMFBTY0k4OXNER0RFRWt3SnpZdWJKeHZ3Y0dnbHlm?=
 =?utf-8?B?a2M4bDVBNkp6NGZkcmV3Uy9PcW4rcXFwMXcrTWI5TGVKT2VrREdDaHdaakVN?=
 =?utf-8?B?QWF1T1A0cFMveGJMano5ZEFoRlE2Qm15eEhjNEtnSDlSOVRUaktaRDVob2xM?=
 =?utf-8?Q?7w10ZfUQHH5m+otzrxenOajET?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf014751-be81-4ca9-d6bf-08dc3d16a12b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 13:17:38.5426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhrhszB+GH2yU8GLJybiVD91I98iP45CTj0Ku6e271yHrSXDlxWQhrUu7SEQUDHnMM/qiE+c/fGokqCMQpK7fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
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


On 3/5/2024 6:40 PM, Christian König wrote:
> Am 05.03.24 um 12:58 schrieb Sunil Khatri:
>> Add ring timeout related information in the amdgpu
>> devcoredump file for debugging purposes.
>>
>> During the gpu recovery process the registered call
>> is triggered and add the debug information in data
>> file created by devcoredump framework under the
>> directory /sys/class/devcoredump/devcdx/
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 +++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index a59364e9b6ed..aa7fed59a0d5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -196,6 +196,13 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>> offset, size_t count,
>>                  coredump->reset_task_info.process_name,
>>                  coredump->reset_task_info.pid);
>>   +    if (coredump->ring_timeout) {
>> +        drm_printf(&p, "\nRing timed out details\n");
>> +        drm_printf(&p, "IP Type: %d Ring Name: %s \n",
>> +                coredump->ring->funcs->type,
>> +                coredump->ring->name);
>> +    }
>> +
>>       if (coredump->reset_vram_lost)
>>           drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>       if (coredump->adev->reset_info.num_regs) {
>> @@ -220,6 +227,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, 
>> bool vram_lost,
>>   {
>>       struct amdgpu_coredump_info *coredump;
>>       struct drm_device *dev = adev_to_drm(adev);
>> +    struct amdgpu_job *job = reset_context->job;
>> +    struct drm_sched_job *s_job;
>>         coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>>   @@ -228,6 +237,12 @@ void amdgpu_coredump(struct amdgpu_device 
>> *adev, bool vram_lost,
>>           return;
>>       }
>>   +    if (job) {
>> +        s_job = &job->base;
>> +        coredump->ring = to_amdgpu_ring(s_job->sched);
>> +        coredump->ring_timeout = TRUE;
>> +    }
>> +
>>       coredump->reset_vram_lost = vram_lost;
>>         if (reset_context->job && reset_context->job->vm) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index 19899f6b9b2b..6d67001a1057 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -97,6 +97,8 @@ struct amdgpu_coredump_info {
>>       struct amdgpu_task_info         reset_task_info;
>>       struct timespec64               reset_time;
>>       bool                            reset_vram_lost;
>> +    struct amdgpu_ring          *ring;
>> +    bool                            ring_timeout;
>
> I think you can drop ring_timeout, just having ring as optional 
> information should be enough.
>
> Apart from that looks pretty good I think.
>
- GPU reset could happen due to two possibilities atleast: 1. via sysfs 
cat /sys/kernel/debug/dri/0/amdgpu_gpu_recover there is no timeout or 
page fault here. In this case we need information if ringtimeout 
happened or not else it will try to print empty information in 
devcoredump. Same goes for pagefault also in that case also we need to 
see if recovery ran due to pagefault and then only add that information.

So to cover all use cases i added this parameter.


Thanks
Sunil

> Regards,
> Christian.
>
>>   };
>>   #endif
>
