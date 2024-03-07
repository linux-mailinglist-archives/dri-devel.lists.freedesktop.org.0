Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36F7874F45
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663710EB86;
	Thu,  7 Mar 2024 12:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Cwgq6cIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F114110EA82;
 Thu,  7 Mar 2024 12:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNrrwQ6n3ZitKb32MeirH9Nx1M+2zZksCI5tEMkVBSKwDLXerOIVzU17ZK/7qrn/jkW49P2hXUEDjmOcPV3DskADYzOH+aUShlGRoskvlH0ZLX+nlQ/O8q6RojVi6NckxlANh4p7v1Vu2X+QZSUVV26DoJ3v5bndRef4AUiug4w9TUkDuDzWFRCA98tZ1gCdHE9/EizHAolrNA8bOLg08/fFV5wksgPNj5TJ4NpbRhEmr0rECxDS7eHKE8PSM8CtVSUC0ZfgK1iLPpr/OvNhQOtVrBRm93VoPZjgXe4kP94/ucQAPmN3lUgBoaMkKeMQYL+Tt4GJJoRcgwPMsJjIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QV224vylZ8NAdxQexH0oWSVMOhUUr8y+nRWKK1xefMY=;
 b=mE5y+qHY7BWPjI9pdsdeGnT+TZrkCSFB+2HewZ+AdjOQ3QLXu7CZ7jdfXrCDLQYwmTaujZk8RkTstBB18JtcoBPQiTNHa+PfMYHgcw2X1vMyAYlqs3IlEV0C0GAVTi1xI9qeJ3G4vcAoIXS4Vvf8RCh+iH4Ia/5dDzhobn6lshpfcoPv11zjPSOmGIr2s9UpCXN5XPmQ26whBUvQOnCb0FfUE/EcST0dd5n9EwtnLZ/12Xj1RvR4JvxAscG81g4rYW/cs3gmEzrqjSrP9/Qi1wBTywAQhHGWHHIjdil2p8g1VR1S3ITs8dwXVCIOM4A0Xhd9kq1xGTqq5KgwZJ8XLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV224vylZ8NAdxQexH0oWSVMOhUUr8y+nRWKK1xefMY=;
 b=Cwgq6cIHOiDTzT5KWnhmd87lByrT7siOlTDfDqTOGNEcYtKfz0ycGdPq/rwrAxxuE3+LuPpGc0TIhoVkod4Fx8q9i8qRw3vVKKdtbhU0Z04c5uGsb+QD2e1FiR5RYCjpG4MGkUj1FfFxoiUaXv0L49v6J5j9P5sGgmOXb1F9Hto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 12:40:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 12:40:16 +0000
Message-ID: <f3b6d600-e8f2-48cf-b19b-ddb28e9bcbee@amd.com>
Date: Thu, 7 Mar 2024 13:40:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
 <20240306181937.3551648-2-sunil.khatri@amd.com>
 <f61edcbe-938f-4c48-920e-64c8352e87f4@amd.com>
 <bd6a70dc-d710-498e-b4ed-35c6106cd898@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bd6a70dc-d710-498e-b4ed-35c6106cd898@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c0acb3-2ef0-4b26-5296-08dc3ea3bd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vqMFv9q2pyUG1tylF+obXhhK2Z70ta0ty659JBL2aydJZntoxiCLbphJepzckIqccB9rZ0GuYUAFd84e/33eAJoEBnwvpM95AQ+tgrNKxv2GNnTyDxMBmX6kQdOmvj6qKmfVP+qLlnJa60UNjp/tvXDArfXv6q27cS+owXEhhjNiQuF8CJpvXsMdNQuBLN5iliSJNWL76zUAY6inGdkPYNeghTP/y/h4xwUuDnQ1vpYOuHq1NlkO5YYOHCliBHX7wsxMLCVIbPXFbz3pe2StGnR4RSOsu9faJrPsY7ex2ZJ2ahf4KT+DuCJnfEPAxMKYMVBVhA2+sInjYXF7q7Dxuv0P4SGvzhD/46ZB+CfPWI1bdbzpVMUq399BPDgQ9H3NfCrXQLfufNgzGqim+PhFKpZiNhfs9ZqDK9UmXRFXtoqFvJDDx7DZeKWb9pNDpSytfvDGWQG/zqhtA8h07Vckl/GUnd7x/BvTrjVejXUGLocILGFSj5TpyE9JiplbR0H+HG29KWaZ0mAdhmsnADuzIgtn0gkPrwYy2qrYrsojVF2+2Zz+LI8VdktFWqowfmX77kanC4dHwYp5OxellV75LA+YN+U8tMmN36MRs05CXgJ+8sPaFONTylvVJ8MmXnZLsOCWCSwASpk91TVcV05ISlbM7tgr780nlYRWWpw5Ec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExQVEFUalY3dUtjUW9wd2xsaWZFZ1Q5VEVPT1c2YnRZVHRXUWlPNVpRU0pO?=
 =?utf-8?B?MVB1ZjRCRi9KNDFBQmlVMm00T2JjS1VIWXhKWEpIZ016anU4dXJvUTJMZ3ow?=
 =?utf-8?B?NmRHTUJCUGo0NnhsdWxJNDlLc3lVaFpONWdaYTlTbGRGR3l2T1dxTk9uQ2Qy?=
 =?utf-8?B?dWZpRzliSWMzN2kvazlleTNCaEZGZGc2cFFxQnNyYTcvQUFKZGR6Z0txTUFP?=
 =?utf-8?B?SjFURmF0TEVaeGNjS0c3N0pnVUFoNkRnUXRkb1RSZlk4Qko4LzcvWGlRTTJr?=
 =?utf-8?B?aFRsUnJGTjM1c3pGeGxYVnllVWxBV1RJWUthdmt1RnlKM254UlozY3I5MGRF?=
 =?utf-8?B?VkZabUxNa0JxUXlYR0luaHoyMG1lRzBzcURud1ZXZjMvZ0ZTZFhWNFpaZW1q?=
 =?utf-8?B?UTJQTFJaZ1Rmdzg3UlhhcXVGWUZxdjhmb1BqUURKTGdJd29sbGJYTmk1dUNi?=
 =?utf-8?B?MmpoSC9QQzExUHFnNDJvcVlGVnY5TnorSnJsRjZlUnRPT2Z1dk9Sa25rRXBO?=
 =?utf-8?B?cWtwZ3ZIMXVRd0VTbStYb2RIdWt6U2FQWEpUc2dCWm10R2RwZ2JJejVZMXhK?=
 =?utf-8?B?dUtTek9pdG1qT3I3S1BTN1Z4Yk9XbGNvN29XRjBNVFFsMXUyQTRHazhCT1Ra?=
 =?utf-8?B?QXlpbGZGRS8xSWRwYnNCUTFWV1ArMXNMYjlQOWdSb2hFNG9KLzJxbXp5b2cv?=
 =?utf-8?B?dU5UNDB1YlNJSCtncXFjYzNaYXp5bzVzRktQNm5Qa3ZSV1A2Q0hhWVlaZFpK?=
 =?utf-8?B?QWkwRTV2UkpnbUthYVBzUUNQTmQ2UjN4NEJqTjdhZHl1WDFqdEhtN0tlNWhL?=
 =?utf-8?B?ZE02K3lybHF3ek1LbVlSc0M5aG1Dd21NWXpxN0ZjV3RrekNJeFNiLzFEdTN0?=
 =?utf-8?B?KzNndStXTUp5MDk1UTdOdU13T2xIbzZHVGw4QlYyT3NUM3ltRE1QVDQreDda?=
 =?utf-8?B?SFpsK1Vnd0VLSnRRVDVHNEFEN25pVXhZbk5acW5YcjE2R0FkTWswOE51aDQ5?=
 =?utf-8?B?SjArZWJ3WmdkSXAyYUIwSEhhMFM3U2F0aWFXNFBuVG5kdVF2b2xicU9UQ3FX?=
 =?utf-8?B?ak53TnhZMG96RFZRUUo0R21ySGY2Q0hoT25RaTNwK0lWSFlGZkxhS1RCS3Uw?=
 =?utf-8?B?SURPUDBkclJhV2hjVGVlQ0Z0a2Ztd05kSTJ1V2Vhd0ZxeWpib05zL0hyajVI?=
 =?utf-8?B?b2F2UjBWMUNXTkdjbWp6bXBCMFdXbXBhcS85Q3UwL3JENVRHNlltQnJxQ0Qy?=
 =?utf-8?B?WGNyM2RCQWJvMmJrZUVXZGV6RGJVekluNFFPeW5hTSt2WE93dml2dVZrQmkw?=
 =?utf-8?B?S3d0Nmp6VHNtSkIrN0dJVnd3bG5PZ0xQcWxYV3Z3S2ZKSGZsa3dNUTBLYzYy?=
 =?utf-8?B?ZU9NenZaR3RmWGl6OTNXNnVsR01GOERqQmhvR2FndG9mMGhZSmhZaUNIaWVW?=
 =?utf-8?B?TStsOTZ3czVuMjNMNmZNMzRqV2trRHkzQ3dWN1pLaU54amdlN0lURTd3NHlP?=
 =?utf-8?B?M0ZyTjNqS0dUNVNPOUUxZzlTbFk5NXQ1WUwzdTdnTldhclp4cHdVMHRRVC80?=
 =?utf-8?B?NVpnOGtkak15aVI4ODFBeEtHTm5tU1RaZHMwNkU3M241bHJqdGNxbHFqeDdp?=
 =?utf-8?B?R09iWmh3SGRwV3Jpc1FrZ3BQdUtXVGZlbDRrTDZyWTVBUnRYTHZONmxnMTZX?=
 =?utf-8?B?WjhwSEtpbDJVWm5jT2R3SmJweVZkRzVoOWp1dkJkbEZ0M2g5RXhCRkcvQkZh?=
 =?utf-8?B?SEMrSXUvRS9OK3g2VlhCT2JFdzJqZVM2czFaTHJEYTBscThmMHVlSjJVR21E?=
 =?utf-8?B?blpTb1BKazV1ZTV2YzFuYkNYQnFHNGxONkFNaDYxbEFFcEYyd0JBcCtvSklw?=
 =?utf-8?B?Ymt4U2Nla1pqVTdQNmV5cUptN1JRYS9zN0pGeG5rS0kzcWJMOVZhTWU1NUl2?=
 =?utf-8?B?M0FrRUFBMDR6VEpxMFFET1RNUDFMS0lVeHQzZEtLd21XdEgrd2RjbUJQdnd0?=
 =?utf-8?B?NkExWUtxMGpWTGJUTWtpMTgvY3ZFWDlKZDBmVE95NTRvSko0dkNsVGc2ckxk?=
 =?utf-8?B?RFN5Y3RtZzlCVlRPbTR3QUhRakx5bVA2WS85MFprREp2aVEyQ3JGLzlqSkVt?=
 =?utf-8?Q?Ntbo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c0acb3-2ef0-4b26-5296-08dc3ea3bd7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:40:16.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7iTFZkV59ZI8/G3dmWlUoTOQz/YK9SPkDBtecc/2W/G/svIkXm/a0rokOm/GsBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316
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

Am 07.03.24 um 09:37 schrieb Khatri, Sunil:
>
> On 3/7/2024 1:47 PM, Christian König wrote:
>> Am 06.03.24 um 19:19 schrieb Sunil Khatri:
>>> Add page fault information to the devcoredump.
>>>
>>> Output of devcoredump:
>>> **** AMDGPU Device Coredump ****
>>> version: 1
>>> kernel: 6.7.0-amd-staging-drm-next
>>> module: amdgpu
>>> time: 29.725011811
>>> process_name: soft_recovery_p PID: 1720
>>>
>>> Ring timed out details
>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>
>>> [gfxhub] Page fault observed for GPU family:143
>>> Faulty page starting at address 0x0000000000000000
>>> Protection fault status register:0x301031
>>>
>>> VRAM is lost due to GPU reset!
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index 147100c27c2d..d7fea6cdf2f9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>> offset, size_t count,
>>>                  coredump->ring->name);
>>>       }
>>>   +    if (coredump->fault_info.status) {
>>> +        struct amdgpu_vm_fault_info *fault_info = 
>>> &coredump->fault_info;
>>> +
>>> +        drm_printf(&p, "\n[%s] Page fault observed for GPU 
>>> family:%d\n",
>>> +               fault_info->vmhub ? "mmhub" : "gfxhub",
>>> +               coredump->adev->family);
>>> +        drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
>>> +               fault_info->addr);
>>> +        drm_printf(&p, "Protection fault status register:0x%x\n",
>>> +               fault_info->status);
>>> +    }
>>> +
>>>       if (coredump->reset_vram_lost)
>>> -        drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>> +        drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>>       if (coredump->adev->reset_info.num_regs) {
>>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>>> Value:\n");
>>>   @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device 
>>> *adev, bool vram_lost,
>>>       if (job) {
>>>           s_job = &job->base;
>>>           coredump->ring = to_amdgpu_ring(s_job->sched);
>>> +        coredump->fault_info = job->vm->fault_info;
>>
>> That's illegal. The VM pointer might already be stale at this point.
>>
>> I think you need to add the fault info of the last fault globally in 
>> the VRAM manager or move this to the process info Shashank is working 
>> on.
>> Are you saying that during the reset or otherwise a vm which is part 
>> of this job could have been freed  and we might have a NULL 
>> dereference or invalid reference? Till now based on the resets and 
>> pagefaults that i have created till now using the same app which we 
>> are using for IH overflow i am able to get the valid vm only.
>>
>> Assuming  amdgpu_vm is freed for this job or stale, are you 
>> suggesting to update this information in adev-> vm_manager along with 
>> existing per vm fault_info or only in vm_manager ?

Good question. having it both in the VM as well as the VM manager sounds 
like the simplest option for now.

Regards,
Christian.

>>
>> Regards,
>> Christian.
>>
>>>       }
>>>         coredump->adev = adev;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> index 60522963aaca..3197955264f9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>>>       struct timespec64               reset_time;
>>>       bool                            reset_vram_lost;
>>>       struct amdgpu_ring            *ring;
>>> +    struct amdgpu_vm_fault_info    fault_info;
>>>   };
>>>   #endif
>>

