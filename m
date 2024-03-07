Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76495874F56
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5601135B7;
	Thu,  7 Mar 2024 12:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3MPza5Lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036C010F0EF;
 Thu,  7 Mar 2024 12:43:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxFtIxIycDYzKB6dKKzm+PATRfzTetR0E2M5kPV7Id8cGhUtJgR41vRwg4CN8Vv/BscK5TCMVOBaPdQMIk2ZmcrNEL7Q7CYnFZ9EGR+cohyF2TIHE/xEbiyzlU6VVMeediYCLKRDIDy/hfs1VvRLEBGnxnOomOKgaXKDv54YNXRFJj/R4HQCUrgQYV+PtHhzskLICGgSsnv3kyR/6p03dZEyknLjZYiGjnSMfkEi4SzbV/BsM4FXm1f5o72PpwS+lv+O/DZL9jeI7KJbEPOaUDDQwrhZSnfzq/q0reONn9DGNBuRMi7JtCQqiprxx49+MhQo4c9Z3eQu8/Uonknlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwkyCC2IS4NAVWNpbpK0rh2Eb920REVMuZPQ9JlnIyU=;
 b=m2nKshv1WORsMDcjB7dnUVkbsaP3Ly6cQOSCJg/skcOAyyCz6QyX1HSCohrn+nFH6yqRYNYT2xvgOUpS9yeTxE9MG7LGwHY0MIDdO5XZ7s8+g3L8I07GFJo1yQiZgsabcHbiTtOfWOg43JWq3Zv1s2JrUvUvCUFCjjNxnalT3Rujef+mMW/AyQrONX3i0vGD3uOXvxEnTgSmMKO+MuTQ2vDRuIBtJTm+Bmz0CasDzQQQYBEWFZi7WXFghf/sKvePUkyynmu3w7CyBXuLcatdVrH4VglWjGx6kQUR5O0YONVq8oovDGM4sljPX5y+Gjg5k2zeJeOfriLpg3CeayYa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwkyCC2IS4NAVWNpbpK0rh2Eb920REVMuZPQ9JlnIyU=;
 b=3MPza5LgvUkSTXJghJdMcj3uByi49mofsZRXZKH9Dt/lvsUCAh9xknLToBQTB1emry8E7terbQspLeIxdr2WMCbtLMFONDH6A906CRjB8MOOFEkpW+jtK0LWRDsHQ4Awi23t2aF6udbga9AmnhfkTviUoNYpDoO+Zf3+o5+WaJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by CYXPR12MB9443.namprd12.prod.outlook.com (2603:10b6:930:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 12:43:18 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 12:43:18 +0000
Message-ID: <3ff55fef-efd7-4de6-b81f-a5a57021e4bb@amd.com>
Date: Thu, 7 Mar 2024 18:13:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
 <20240306181937.3551648-2-sunil.khatri@amd.com>
 <f61edcbe-938f-4c48-920e-64c8352e87f4@amd.com>
 <bd6a70dc-d710-498e-b4ed-35c6106cd898@amd.com>
 <f3b6d600-e8f2-48cf-b19b-ddb28e9bcbee@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <f3b6d600-e8f2-48cf-b19b-ddb28e9bcbee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::11) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: e29ed19e-edd7-4786-aeef-08dc3ea42a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ToiykIUWuLf/47xb/F1b8ZxOEZAnUY9RycxUQkNQXAu4zXai3pUuyQmecJVy8iiRTzvvcpJC48vsm46KfxZh1QS+4kQNklFxUmmV+vJqsh0z1Ol+bNzdGAZRVHGqO4KssFPEAGcgpOKHMJjrE/Mi5iGFngtfy1JezuaXHKr39+iq63SNyYEFGsQ8gPgM+inq53eutU6zXq6efqt5YY5Qgn8VGbho6xw/+TllARQOOSUTnXyY2tVYY8n9W03SeczaFewTfSWfTZPlgn1L6/P1lPt5Afp4AnM1Z/nukS+imSPgNpkzg41fafyblkrDfCUJpUpPqPF3fG4bej0cl4EM4G7EAKUMnYpWG0/hZ2sQE9xoyFyYIYf/P2TkVtyyOXpKx21utnUAY6uZOSfmKaP26NtKdQEkduZqMP5dZMvrwKqz+l60QQmVETSaWJP5X6/JkRXkfG1AtTPq01LxIATD63zTMzaE2AXff2+wkh3v9hdHKROnKjsn/ABittBFBOn7Wk+Bzvwap9TJ0tcLiWhYtUwTAYxXZxP6cXwYkdYtlc+pH1epI8xc1npA/1t6MpDi7MYC2nclNp1Y8uTWahm/+VxLWsX35sGS4yqnwCNDWmoNeVO10Bynh0jKdmVUTtXbvLdNVkfhmOGRHnHb3OJDI1K2Ec2aeEYrF5lIGeITkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnllejZkUGNDRmJRR2hsSk5RMDcvZHgweHdldjJaNnJwYkE5S3pJWTJnUGFS?=
 =?utf-8?B?ZU1mMXpta3IyQnIwT1hlcWVva1JqYTdwUDNpQjF1R2hEdWppcmF6U0l2UEdv?=
 =?utf-8?B?bjhYVVMrcEF4bk1xY01KSjE1NUNMZmpBMGhGMHBUcnlwemZFcVRFVktYVWFM?=
 =?utf-8?B?NHorWEdKc2dod0NGbk41S2E0aTZWbS8zeXI3NHBwWEZ3Wk5wMjdubC9xOVp6?=
 =?utf-8?B?dlpwU1AxNHQ5MXRncjFwWC8wMERpUE1nNTQyS0JGTmtYbGtuODhYZVY2bVhM?=
 =?utf-8?B?eHZMblkwbWR4OFp2cU0xazVtZVd1bFFjNktucjVYQ0VoZHY3UWV3VzVaMTlL?=
 =?utf-8?B?b2tjbUFsbkRkR3JNZTZuWmJXNzhvQUtNUXVhMFVIdEEzaUdnNmo4dE5PQy9U?=
 =?utf-8?B?RnhkMVJDOTVOTitleUYyRGN5VGJDZmc3ZWdVOHg5dW91UHl1clVDemxvQVNk?=
 =?utf-8?B?aHpzallHaDEwcmc5K2RnVW1VZG15a2g5MjdXdUp0UExxUzFnOGJGUC9uZjla?=
 =?utf-8?B?MHU1OFZXNmZ4TFpCa1NPUC9wL0dtRm5GQklvY09XYXRMb1AyK2hicU53Tmxo?=
 =?utf-8?B?M3lNQzZkekxTUWtOTVN0WHdKa1RuSk54ekhZU0I3L1lkQXJiQ3I5RThLNWZ6?=
 =?utf-8?B?K0tRK3hvYW5ydk1zdGhxSnhpb05aWE0weVhJRlhkTkxkMjF3SHo5Y1JGRW5W?=
 =?utf-8?B?c2VNRVNYaTVuRlp1OGdtSmVtbU1HWjVoVzFUL2dRN2pTdHhYTmpsMU5jUGtp?=
 =?utf-8?B?WWlCSzluajhaT292bXA5WDZIZU1OS1NPRGZvRkV5eDhmL1N0VGtoTFNFRFlj?=
 =?utf-8?B?SlUyWTJvTkpIS0RYajFnTEtWY0FqNHUvOWZJeWM3Q0RaRlhCSFlBaEZDNUhk?=
 =?utf-8?B?KzdMd0U0RDNCTjMzQ2Y1Mk1ZNWVaVHVYTXdWSUlnMzQva1RWTHRnaTlEcUY1?=
 =?utf-8?B?bnREeEdqNzhyOFc2dHVRTGJLU215R1Y3YTJkWVdxUFlyWEFCVXVxTTg3eDJ5?=
 =?utf-8?B?Y0VIWXZxQ1RlSUVReWZJVGhKK2VTeU1yTnVJamdvRjd4SGk5UnA1eEFzUHdH?=
 =?utf-8?B?NmxVMWVzditqY29ySUdHZkVkM3lBc1FsSDNQR1k4b1lWTTMzNHllME9CMWp2?=
 =?utf-8?B?SjdzR1p4b3VPRGU3Ym56cWsvU2pTQ3BCUlQ4ZXFUQ3JONkFIT2hFdm5Zakc3?=
 =?utf-8?B?UlZhaFZoRjlMUUFNenlzYXd4SzNFOWF2R2JtS2VxUElYVTkvVUZhQTZ4UDlI?=
 =?utf-8?B?OTVsNjFBaWMrdm9LeXhtRmFhT2xFVHpuQmErRi9yZlRwMlNWVnI0bEY0UEg5?=
 =?utf-8?B?b0twclBQL3BXc1dmMGUwejgrK2ovVG40RC9PNm0zeXc3aUd5ajA0V1Ivbm1W?=
 =?utf-8?B?cXZYVVFsZHhERGljZ213OFQxdlVJbVk5aE5hQ3kzNlUyVjVHNmRwVVR3dWN3?=
 =?utf-8?B?R1JqbjhNemNINWpUM1g2N0c4ejB0YU1QUjJWeXpCZUNBZTFYcVQ5L1ZhOEpl?=
 =?utf-8?B?RWNCOVlXS2lnTVcxTEZ3bGlhMkRUNVhSa2ZPT0RoYUQ1ck1yVWQ0amJLbGdu?=
 =?utf-8?B?dnFjdUdIU3NncUNGV1NMUmlobWtnRDVwb2UzaXlEdWJ2SEh4M2xTYnU3TW15?=
 =?utf-8?B?WVdpb1QxL0xLN0YwVFA2MS9sZmFtM0Fqb1Btc1lzcGtZQXBVZnVmV3JpNGg5?=
 =?utf-8?B?OENRUXJrV3VvOVRBaDRwTHdKNGEzb0Nvby9ldzFXNXJTSW55Vk9IOU9tQjl4?=
 =?utf-8?B?Qk8zTU5LUE9ya2MwTlRzSEo5UjdmenZVZTlOdU5NUEZzVFBRazJURTFUL29B?=
 =?utf-8?B?SHVyMStSOWFxdzZoMnZTZkoySHJUdWZsM0pCdDlmNHZnYWNMejljKzBpNjZ0?=
 =?utf-8?B?MjhmN3ZBYmFvVDBiQlhTOEltNnlzcDBKMWNkTHU4LzF0czRDdE1IMFNUbkpi?=
 =?utf-8?B?SUdlakZiSVNqS094RSsyWXh6ZVYxbTdQaFJVRUJ1NFVtUzBHcEJFYVo1NFdK?=
 =?utf-8?B?NkVZQ1JIQ0UxMi9WQlBoK25oQnFlVVhLaXJlR2wvS2ZnMzRGa3pIS2Vtdkh0?=
 =?utf-8?B?NUJQSElMSHhNeDhDQ0FFc0d1RzNKNU1URkJZR016L3RLRDJxZEVPYXBSMEtZ?=
 =?utf-8?Q?poMW/H8x5YhQc1GgYgVnQ4I2k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29ed19e-edd7-4786-aeef-08dc3ea42a18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:43:18.4895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQFssrT10jR2UVE8BpLt5gr4/s/VmZc64dRqQbyK3IPR+6Jh2H+XGqGG5xQxe9oWuR1PydTgQSXK2TQB6TCj5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
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


On 3/7/2024 6:10 PM, Christian König wrote:
> Am 07.03.24 um 09:37 schrieb Khatri, Sunil:
>>
>> On 3/7/2024 1:47 PM, Christian König wrote:
>>> Am 06.03.24 um 19:19 schrieb Sunil Khatri:
>>>> Add page fault information to the devcoredump.
>>>>
>>>> Output of devcoredump:
>>>> **** AMDGPU Device Coredump ****
>>>> version: 1
>>>> kernel: 6.7.0-amd-staging-drm-next
>>>> module: amdgpu
>>>> time: 29.725011811
>>>> process_name: soft_recovery_p PID: 1720
>>>>
>>>> Ring timed out details
>>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>>
>>>> [gfxhub] Page fault observed for GPU family:143
>>>> Faulty page starting at address 0x0000000000000000
>>>> Protection fault status register:0x301031
>>>>
>>>> VRAM is lost due to GPU reset!
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> index 147100c27c2d..d7fea6cdf2f9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>>> offset, size_t count,
>>>>                  coredump->ring->name);
>>>>       }
>>>>   +    if (coredump->fault_info.status) {
>>>> +        struct amdgpu_vm_fault_info *fault_info = 
>>>> &coredump->fault_info;
>>>> +
>>>> +        drm_printf(&p, "\n[%s] Page fault observed for GPU 
>>>> family:%d\n",
>>>> +               fault_info->vmhub ? "mmhub" : "gfxhub",
>>>> +               coredump->adev->family);
>>>> +        drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
>>>> +               fault_info->addr);
>>>> +        drm_printf(&p, "Protection fault status register:0x%x\n",
>>>> +               fault_info->status);
>>>> +    }
>>>> +
>>>>       if (coredump->reset_vram_lost)
>>>> -        drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>>> +        drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>>>       if (coredump->adev->reset_info.num_regs) {
>>>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>>>> Value:\n");
>>>>   @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device 
>>>> *adev, bool vram_lost,
>>>>       if (job) {
>>>>           s_job = &job->base;
>>>>           coredump->ring = to_amdgpu_ring(s_job->sched);
>>>> +        coredump->fault_info = job->vm->fault_info;
>>>
>>> That's illegal. The VM pointer might already be stale at this point.
>>>
>>> I think you need to add the fault info of the last fault globally in 
>>> the VRAM manager or move this to the process info Shashank is 
>>> working on.
>>> Are you saying that during the reset or otherwise a vm which is part 
>>> of this job could have been freed  and we might have a NULL 
>>> dereference or invalid reference? Till now based on the resets and 
>>> pagefaults that i have created till now using the same app which we 
>>> are using for IH overflow i am able to get the valid vm only.
>>>
>>> Assuming  amdgpu_vm is freed for this job or stale, are you 
>>> suggesting to update this information in adev-> vm_manager along 
>>> with existing per vm fault_info or only in vm_manager ?
>
> Good question. having it both in the VM as well as the VM manager 
> sounds like the simplest option for now.

Let me update the patch then with information in VM manager.

Regards
Sunil

>
> Regards,
> Christian.
>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>       }
>>>>         coredump->adev = adev;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>> index 60522963aaca..3197955264f9 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>>>>       struct timespec64               reset_time;
>>>>       bool                            reset_vram_lost;
>>>>       struct amdgpu_ring            *ring;
>>>> +    struct amdgpu_vm_fault_info    fault_info;
>>>>   };
>>>>   #endif
>>>
>
