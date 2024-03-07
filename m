Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353E88749D1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C451136FA;
	Thu,  7 Mar 2024 08:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SpEf1iU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE581136F9;
 Thu,  7 Mar 2024 08:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfaoz6MS5M0YoAU62gz6D5/4OsL5VrFbQqopfJuC4beUvkQJJYKoQxo3exqDSpYr1QY72NHG/T7WKjdmYPiTfkouPExpDUD/q+wrX2o8Jn1yiM0a4tU6Ner7d8a4t4TylQztdzR2N6x1uaWBIoETndHUDmHd+4m2x4tfQuz7XIrt5+rHPK5drmCKSIuyjXXHwwLQ+kIpXTLFzuosbxDgi0YCswOAYjlDCpvlQDym8lnCNi73NaIfemaLpPxzGaL+juXmyiBJqHk1/gDDcXTvnFFKVev7gCil4tTYzBR4cyiZRb3JEg5Rj+kDytH3Avv1Xg6R7ZXel/vWXDm+/nacYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyCL76XI5afMc/IM4xl/LWdPQMfSah03MlY+b5mbUtM=;
 b=lifJoLBD+xyVsT8CjrGqLzHC7zj16CvZnvgYbfqjKC4npaGFr/f6NG7F9/sjXI+dMBXG6bVOdTWvany49IQjnSOwL4w9+fkv0YAiNBdHptBRt7+wUAg0e4Rwuw+TvzYRYfONyqk5dHTVD9GaybZkYRCH9VWYwiIjTA8jTYEvooRMdpQXK5geoTXkNBDc5Zk41t6CuFjUvy5y/YYjfEtcVQKi8jyuUQQoYw2/xiyXQ+mPWKPsAyd5ZHGLSuqgcZgjYqNDfmmEqDsy6IUZt0BZ80FFtsIypYKxss0nikglstLWsTOagn6kDeP3SALhedvQ8ObsdsSUMJAe8w56gSWqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyCL76XI5afMc/IM4xl/LWdPQMfSah03MlY+b5mbUtM=;
 b=SpEf1iU5LC4dc7NjU7wI7007LdbcCEKA0k4JN4X3l2FV2oZayvhTXwOaZFJetRZSSErFlugAiAVsh28xL/RAOsyswIVoLxxHxzkoYRuauYn3++Qjpwl8z8fcx68Y/N/FySxa8u05XKLeGmd6pHNl79xm1nL9pIgd6L31YyGD8D4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 08:37:24 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 08:37:24 +0000
Message-ID: <bd6a70dc-d710-498e-b4ed-35c6106cd898@amd.com>
Date: Thu, 7 Mar 2024 14:07:15 +0530
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
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <f61edcbe-938f-4c48-920e-64c8352e87f4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::17) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 20973e5d-50b8-48d6-57dc-08dc3e81d010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIkTBd9yFVFyCAdwYU5w8CfbLtd9WSaXqxwBSq+Hs9sbAvJbOCUKdWEBDRRNAxm54c+y0M5IZyWGiIVbSkgE2Ub3ON5/sFQ0oHovQgfjUsKzRsKcVA5WM1MWpNhlHO2gG3LqMJE/vO1+MPtgZb0hoD6Euv5uaCSEQ+DElnx/5GbMr44yYnRwSqW4rR1W19KbOgoRYh/lFhgQCmOe9pGiTz6szDGCHJBdrtglhIYuH36x2Z2DBCLhX/3PNUtKnQousuIrswREKGKsgTDiM64sUzjKF1MBgHEcFNq5ITVMKzjwyukJd0dtOzffJxoI+L3bmMWnqbo0Jo1lBYcgqMjAKaUPXMFtXZhgvPqP6b6XkZIwu2OI9QSS6AYCILK5sE4LVVVp7px9BEkaPNzEufXo7aXsvlmFEbOi9CAF2/gBPs+7RMcFeaYIZuHyNW0aXSt3RYVa5NF1xevwH7YBdwBL4kEZNx3sRYNJVgE7rIGeWjQEqW+jyC5Q7EseH/d83i9S7kykhhtLAFSEpHArVZtAQKi4EL8zTesXHEm7hxlbHqmiAmbDCJeaBw4n33boaLH7uwIaS/vi3QsYDCDDaehsA7BNOIV4tRN3yXM5AoSorc8HM1ZoGoTjAki3cn9EkAIbRuaZkUUSgad/SDGmJPVIIZylSyjHT7qEPDPf++818cA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjY3eGt5Wmo4ZHh3UEhrejJtRlFQMVdJTnlaUktrRmxaVDl3TEQvR21pRUVI?=
 =?utf-8?B?aVcrV2xUcm9UTmZkbUcwbUlOUVRPaWsrckJXRWZRZE1haGVFV0p3Ykd3REYv?=
 =?utf-8?B?d0FiQXJvT01naW5MNnVZZ0x0VDRyb25LMVdnQTVXSnRJZ1pRekprTG16eFBF?=
 =?utf-8?B?OThrQUI5L3BDdyt5dEtEQU5MTkJna3d0bkhCbG54ZUpSTnhkYnJZM2t3bTZL?=
 =?utf-8?B?YlcrM3hqMlY1NVhQeHZ0UVc3ME96Q0lVN3o3NGo3andCNXovZkdZQTJ3NU16?=
 =?utf-8?B?Y3EvOVlhSi9ST1NJOEh6c0pHZ1lOblN1UEZrWGZBVzRUTGN5N3BvNFNXWll3?=
 =?utf-8?B?Nms5aG83WTRHMUo4TDN5TW8rcE4rVmhlSzV4YkFzc3ZMR0YrTmM2RVk4YTFG?=
 =?utf-8?B?Rkxwcm5JUEZNUlpTRnVhT1NQQTJhOGgrM1c0TCs5MVlvUW1FakR2dmJaQnkz?=
 =?utf-8?B?VlVNcGp4ZTR6QjlKcmZyM2R5WXpzVUpFS2ZjUXZ3ZzJoaXFESndFRWMzbU1z?=
 =?utf-8?B?dCtwM3J1aUJjSmE1V25TOGpRdkFUUEhLdlJQSDZLWVVCUlV5RzBnKzJsRUhm?=
 =?utf-8?B?R3R4ZnloZXhab1A2aEF4YVBXRXcwWm9WYWg1cUIwSlpUdWRWZmh1cUZrbjFj?=
 =?utf-8?B?UHk3eDVjZXF2RWs5d0Nqb01BbnZpaS9LREx3bURoTHdNWklLSWg0MWpUd0h0?=
 =?utf-8?B?d3J2NnkxQ1BTcEtieVRaa2RjZVYzQ3pXcmZIRlNhckFMK0crU0ppTlZ5WVBC?=
 =?utf-8?B?ZUJnWjhrc2tSQ1JOanZZME1pMW5vOGdLVFBSVjByQWlsaU5hQVp2RTJINnU4?=
 =?utf-8?B?VmtCYXpSaUJ3KzFKRzBGNWc5b2ZzQjF5NnRoZXNMRVZFSTRmS3ZxeHFPSXRJ?=
 =?utf-8?B?T3VKYmxjUnh5SzhFMmt6RUdWaG1Sb3E5N1RLcDRobXQzbGFXNzQ3L2Q3b0Rv?=
 =?utf-8?B?ZWUvSG1ROUZCUmxpVXArazlnek51YWhWcVRJeEJ4WWtVa3RqazFzYnh3Mzha?=
 =?utf-8?B?VlVqZHNGLzNyOVJvenJ2REd5bFY0WDRZa014MWZsMUh1aU9Cb0t3cnkrQWZ1?=
 =?utf-8?B?b2pUMGtLZVkyNzJQVDRsV2dHRkg4Ly82ajZzdFJkL2ZVeWQxYUJlZ0Y0djdT?=
 =?utf-8?B?TkJCd3g0M01JZWpjSVNSNEQ3WFdTdUdGMjRxQTM3enFaOFZPczltY29lUFV0?=
 =?utf-8?B?a0UrZlBGWC9qMGVOMWxFN1RLWmtyby9rc1dLdVZCckQwVVg0c3FjL0NFb08w?=
 =?utf-8?B?cXB6alJkUThYRWlpRy9WcWlOVmY0aExvSkFvbWhhSmNDeGdDaHJkc2lyeExo?=
 =?utf-8?B?YS83OWR0TXhDbG5jWjBQMEdSTlRWUkFlRGIrYjJDTGRmRDROMmNQL05rNldZ?=
 =?utf-8?B?U0Znb2dENWVCeks1Y3RZcVpnOTdRcmE2QmdxOGU3QkhMNDZYTFoyS29Vd2pH?=
 =?utf-8?B?WHJzalNKUlJPWTZhMHY5b3IxK2FhYlhmTHR1UEI1MkFSS1o3VUwrYkI4V0U4?=
 =?utf-8?B?dTZwSExsUjZyMEVuOTgrTXNxVDRCNWZ5QUNtZWdkWGkxZm81cUp1cDRLTzRL?=
 =?utf-8?B?WktiU0hhWFo4aks3UGVnUlpnaTlrckw3d0pVbmt6SDlKa1cyRmoxRDNONktH?=
 =?utf-8?B?Sy9tKzJKTk9BOHZseEExUXp2K1pnTjVhaFU2bk4vd3oyS09xZDJlcFJIU0Nl?=
 =?utf-8?B?TFo5Qy84Zzh1cUZBWWlPaHpzanBIdDk2dWtNNTRqQTdvSjIzWTRzNVJHZDdx?=
 =?utf-8?B?UXBySkp1VGl4dzcxK0xWbjZ1NXpNMUZuUDZsc1M1SnJwWkJGdDJleW8rajZh?=
 =?utf-8?B?bGZwNjR3TnN5VHRVZkZLQ0J2K2lVUkRUaXZrc1k2M3lDd1RmSWJBYmhsSlpT?=
 =?utf-8?B?N01TUGdUMjUzbmFTQjh3amN0UUtOS1B0ZW9XUXdLc05mZ2M5WHgxQlcreWpW?=
 =?utf-8?B?RXk0Z0NEWGU5VWxOTXhxYmJWYVBLcnhsNTZ1ZWxTQmxHWldUeTIzSGVFc0hv?=
 =?utf-8?B?WE5Va1dleEZhSWtPSHJEWkRMeGhPV0k3SU5hQzdLaDZka0JZeTY3U2E1RzlB?=
 =?utf-8?B?LzNlS1BOY2NHV3pHbjYxc2VGdVBmbHRwamp5cFBsYkNJMEdRbGVPcVU3STNL?=
 =?utf-8?Q?HgYIk4mBZI0mE/SM8PpESZYU4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20973e5d-50b8-48d6-57dc-08dc3e81d010
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 08:37:24.5854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRCwWpl8vnOAAYn+fkxEhd3vyVzHxFGyYMruOQzVBlPAjnOVuTCCk+MHJVgf9PJ6ymdBTTwTy5x4WFJ7LDaX7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
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


On 3/7/2024 1:47 PM, Christian König wrote:
> Am 06.03.24 um 19:19 schrieb Sunil Khatri:
>> Add page fault information to the devcoredump.
>>
>> Output of devcoredump:
>> **** AMDGPU Device Coredump ****
>> version: 1
>> kernel: 6.7.0-amd-staging-drm-next
>> module: amdgpu
>> time: 29.725011811
>> process_name: soft_recovery_p PID: 1720
>>
>> Ring timed out details
>> IP Type: 0 Ring Name: gfx_0.0.0
>>
>> [gfxhub] Page fault observed for GPU family:143
>> Faulty page starting at address 0x0000000000000000
>> Protection fault status register:0x301031
>>
>> VRAM is lost due to GPU reset!
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> index 147100c27c2d..d7fea6cdf2f9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>> offset, size_t count,
>>                  coredump->ring->name);
>>       }
>>   +    if (coredump->fault_info.status) {
>> +        struct amdgpu_vm_fault_info *fault_info = 
>> &coredump->fault_info;
>> +
>> +        drm_printf(&p, "\n[%s] Page fault observed for GPU 
>> family:%d\n",
>> +               fault_info->vmhub ? "mmhub" : "gfxhub",
>> +               coredump->adev->family);
>> +        drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
>> +               fault_info->addr);
>> +        drm_printf(&p, "Protection fault status register:0x%x\n",
>> +               fault_info->status);
>> +    }
>> +
>>       if (coredump->reset_vram_lost)
>> -        drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>> +        drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>       if (coredump->adev->reset_info.num_regs) {
>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>> Value:\n");
>>   @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device 
>> *adev, bool vram_lost,
>>       if (job) {
>>           s_job = &job->base;
>>           coredump->ring = to_amdgpu_ring(s_job->sched);
>> +        coredump->fault_info = job->vm->fault_info;
>
> That's illegal. The VM pointer might already be stale at this point.
>
> I think you need to add the fault info of the last fault globally in 
> the VRAM manager or move this to the process info Shashank is working on.
> Are you saying that during the reset or otherwise a vm which is part 
> of this job could have been freed  and we might have a NULL 
> dereference or invalid reference? Till now based on the resets and 
> pagefaults that i have created till now using the same app which we 
> are using for IH overflow i am able to get the valid vm only.
>
> Assuming  amdgpu_vm is freed for this job or stale, are you suggesting 
> to update this information in adev-> vm_manager along with existing 
> per vm fault_info or only in vm_manager ?
>
> Regards,
> Christian.
>
>>       }
>>         coredump->adev = adev;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> index 60522963aaca..3197955264f9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>>       struct timespec64               reset_time;
>>       bool                            reset_vram_lost;
>>       struct amdgpu_ring            *ring;
>> +    struct amdgpu_vm_fault_info    fault_info;
>>   };
>>   #endif
>
