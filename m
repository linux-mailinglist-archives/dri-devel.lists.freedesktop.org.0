Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDF87495F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512710F1C9;
	Thu,  7 Mar 2024 08:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OxTdZTpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D079010F1CA;
 Thu,  7 Mar 2024 08:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc2Jj44QOVLgjjAG7Yj1kFs5zCufvNE8uUW8PqLOVz4gZENOHW3SUMVNqVyJ9mT0MkiechC8OZQpggDmZiVLZRtYOOHAbK0Cl2hjqFZb4405OpG4RCsvhGu61GgGqOhZpPOQGcOzLHZDmX1edYUWHLogTCLJgt6X+jKE6mAwHo4iTJBaa/s30ns4Dc2Y4S6lrFevx85CmNIJTMHWhUgYSowb2lAztV6ky414qoUhGBChu6K0QJrxEFg4ImaFNl08E6KsABNMJ4LOayCBSybaZFgYZ3fjtU34vefu/FQP4opyPN5ZEfp52IPg43I8hgwux2ABx/tFX9U8MJuOl9ooVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR50PsoOi2PbM5kM/PJCN1MOh9r22Kd8jvX3WPgp/5A=;
 b=Ft2U+zX1IUlT14EoODSi/jNpavJOTlfOBfaVgFhxqhvMMGO7q/ohy+qC1DS1b/EWJAtqJoNyUjEoj55F8UIwjoEXWz4CjkDWDfYQXxKo+TFWpxspsyXPLztM9wFuObZCOZ0Pj+QBXTfxH5+V3ZWEzU90JI0LtgC6ZZuNhlnB/1rMs33Zx0ToNxsw7V4LTbwd6yM+VKRpbqTXTa/MW08nr+GcXUW6ea8N46M65xUZmdK8LMuz/lp9LOwoEF0Xtq/TD3UDLyOiMykdhfmAN+B4PPKeCilZa/eaWcaUqYek76hWPBT8YHvav4VezZ2h5l0DXkPjNG7Z5LLZZEQPLz7inA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR50PsoOi2PbM5kM/PJCN1MOh9r22Kd8jvX3WPgp/5A=;
 b=OxTdZTpjarhH67resyydbhBXJ9cO+6IDeV3kj2/HNk+BnMyxZETyrm6q3ITm0TfSj7snUsmS9ekRMcy3I77B9KNqu/lrOeVeivwIJiKYVMTp2B926+22phfglhYqc4CJjbCmvI17of69MGd4MDcGA9RgkzEptLJcrWm1lucyLWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7414.namprd12.prod.outlook.com (2603:10b6:930:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 08:17:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 08:17:11 +0000
Message-ID: <f61edcbe-938f-4c48-920e-64c8352e87f4@amd.com>
Date: Thu, 7 Mar 2024 09:17:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
 <20240306181937.3551648-2-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240306181937.3551648-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c0fe2d-fd06-476b-3d98-08dc3e7efce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZIuUZ+fcXVrhDFYotfXvbvoMCrvoW/VnHbiJdtHFB96GupHdInP0d7EPt8Uj1XIEO8FsBGeOG6F0DHIW0t0klVhvymGd5wp6I/WOQQaRo1svxrfIsGVeL99qWecUmVbEX2AkQUloSBc9BTw7s9nO7JPR/eKcy14XZfBgoeZJ6XDUOoo/6/3gQtlwD8NRjjOzER8ZjC3IGnwRvNPp0nQ7ge6ebxf8c9pyw6uKc44lmIsif6e/RLCMIFJuy3dU76rx57+pAf0N8EIWc3aLSUMMRrWgR72Pnq2HW8zi1SsJlnoeBjJ9wv7R+zTPpk79atXBAzKe7dKKyektmJ6YluxwjUHV7hyfPtlPitrSPhakBT5Pb4K6CrWXxM890KQGv+OnOtK5S+2EkAFRxChKEcggYL58LlvAUGOCUMp4F2lbONXKmTKgqVxmboouRi9W7R8hrfthePuuthE8jVHyIST68jSQxKtNlS6cVc/l+//oCZrDKqNGPC+3iqtKUjgcmtRBZdPrncN7avem9mUW4hjiFgGY/7v0/6lnGNyPypHmfTOekCqKoHcDSLVmBe3qz08qNhE+92RgoEDvfyayNb6mTZgsHIM/EkJb9Ax//i81BAjZx3cB6wyiVidIY9vzlbkJ4NQUClVSMGep6iYInBg4N4Iki4Q1TIZQxHF88lWcsbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFtOWw2b0JMeWNiUGxlZTNkQjl2aU5ld3JSTE9oNGdWR05QWW9VTjBWdUg1?=
 =?utf-8?B?TzFzNTUvcmkxbDF5QVRFczJyTVRxVHJmUTNYQzVrZlByK212Q0FHQWVWQkEr?=
 =?utf-8?B?Z3dNSHVhdXlPUGZmUDZsYytlL2xQMnhKTmFySmp2cjZWVmxKU1I0UFZodmNl?=
 =?utf-8?B?alVpN0oyc3JCaTM4RTMydUNxb3NaZ1o0SzIrSTlaanpteW5iT2VIaklIQWg1?=
 =?utf-8?B?VXdZSEhETG1lTGFKSTlwNVBrU3NZYzlVS1Rid3V1ZUI2b2JkL2licmpmTGFy?=
 =?utf-8?B?eVc0V0FvVEdwWm5kakVFREt0V3h6M0dzbkI3eDlKOThWRHFjcXdydnIvK3VD?=
 =?utf-8?B?UVI0eEtnLzJ5SjlmNWl1aENIbUVoRGtYcG5nd05GS08rUFlOTE1uV3FSZ0Nj?=
 =?utf-8?B?NndvblZLbllUdElkZyt3YTR6V21BcHZlM3oxbEZ4REpPaE9jZzBwaml0Q1ky?=
 =?utf-8?B?M2dlSkRnTnVsZ055bTdYb2JKMWpvU08rSVVob0VtN2NuMk9GUllONHlGcE5X?=
 =?utf-8?B?SlFaQWdVNVZQanpEVzhTZVl2V1lYK1B4bk9sWjZhVVY1NnlqVVdMajY4WkZw?=
 =?utf-8?B?ZzdSaFFWeldDQmFLc3JzTFhyZHNNNUtaaFBpdjMxbC84VWFJVHpqVHByd0hV?=
 =?utf-8?B?b09kVFREc1JNZjgzanRWeG0xTWYzYzhzUGtuVjlsdmdVNXBUd3ZnUk1vZUNv?=
 =?utf-8?B?enZibGRYaThIeEQveWpXV0V0eVRjOGNpVHk2cTQwYnRGL2Z5aEVMRk9rRkQ5?=
 =?utf-8?B?NlV4SGVwTG5TNjE1T2RrRnE3TGhuRkliQlBSQ21DUkVkd28zcFppeW1LUDRq?=
 =?utf-8?B?emg2LzhOd3Jzb2JjNitnQTBVSzVxRVAvUzZ1Y0Rtcm5zdlJKQS9JaFNKS0V4?=
 =?utf-8?B?NDdlR2tmTjgrdlNiY1ZBNDBFeUM5bzRqQXZkeUxBVVl4djNRckJOYk1kZVhR?=
 =?utf-8?B?MzVUVEFRQXo2MEV5WENCeVlPSkJLUjZkN092UTZ5Umh0VEhjZTBiaGs1NUFx?=
 =?utf-8?B?eFFUSmZjVHRQTTZFYlBveEIwSWJ0SUE0U1ZaQmZ3V0QwcmtKajlxT2tWcjE0?=
 =?utf-8?B?K21aNm9teS9veWVPT2ZvTld4K0lIaXNmV0srMmc1U0s3T3JCM0ZHTVdmWm1W?=
 =?utf-8?B?NGx3NU83bHRBSzlqRGlJcDYxYWZvUjBDNldCNlQ1aGI5QkNmSmxnRXQ2TnpY?=
 =?utf-8?B?S0Q1akVzcEdMNmNIYXE0ZTlTL3hybjdPR3B1enpaODZ5Q1NsQmdXYzlNYlpX?=
 =?utf-8?B?RlFPaVJtbHhGYVVsZzE1MTVYZEZabVdYYzN0RGpMMjB2SDJBYk1UdC9Rc3BE?=
 =?utf-8?B?QzBuY29wZ2Y4ek9zOVFCdUY5emVYdWFGUHBydEpYcnROb21NdXZreHRIa0NH?=
 =?utf-8?B?bnlKNUUzekdpelpxbmkvNU94TWVhVjRINGlUaEJ5WG1DZml4bmpsUTJMUmpI?=
 =?utf-8?B?d1R5OGRsWlpyUWpmVUtrdXp0dFQyZUZLdHprUVpSVFNTR1p4a0VqeXE5Wmow?=
 =?utf-8?B?Mjk4MkF2YndrUG5BZ2l3a01PTDdKVkFmRUhYb2pReExRaUhqQ0FXRElRcHF3?=
 =?utf-8?B?bGw1enpQMHpBWTFaS3gwVFVjTUhzMkN4MWpXd093RFp1aHNZaFF6RGlmYXFo?=
 =?utf-8?B?NS9DbXN2U2hrWkhCUmh5TmorTEw3QzFxUENybmhYalBoOXVIMzlyOEF0a2NN?=
 =?utf-8?B?ME51ckYyRmQ5cmhXS3lVUVg0NlI4QUtwTVBmZWsvZUN4ZTVYZFpFTWhJam1w?=
 =?utf-8?B?dG5wKzZpbnJiOXFzNUpSdTAxT21SNkdhNThjd2x6aW9aZjJrWCtrdUdQN3dP?=
 =?utf-8?B?M1BNdllWMjlkamN2Vm1PWUhIeHdoRDlOaUFoOTJ1TFVEakozZ2s4OE5OWkV6?=
 =?utf-8?B?OTFyZ3VNSmplbWpSK25qSFZ1Zm9DSkczSTBrVkc3V0RWcllBM040cFdYM1RT?=
 =?utf-8?B?SU9OTzh1YnhaQ2tXVmZQOEJObnFDOHUrbW91Z1NKRzZRVnBxMDYyMytwVEZF?=
 =?utf-8?B?Qm5OemxCNmY3ckhhMVpGRE1ub0xQVVB5bUh3Z3lNSmZsNytBOGZldGpWUzBp?=
 =?utf-8?B?WHR6RWJoT1ozclFIYzM5cEg1WUkwd0VFbEwyWUZhUk8xWGRySExJaVovL1BG?=
 =?utf-8?Q?yDjMHkEhQH6DROh/Hk+RMoIKq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c0fe2d-fd06-476b-3d98-08dc3e7efce2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 08:17:11.1579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgpvHIEgRX+ubcS8LJ9tM06HGL1/cqP8csMOskXoI39eb29g0ju1GxB+PAXQSdhC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7414
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

Am 06.03.24 um 19:19 schrieb Sunil Khatri:
> Add page fault information to the devcoredump.
>
> Output of devcoredump:
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 29.725011811
> process_name: soft_recovery_p PID: 1720
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> [gfxhub] Page fault observed for GPU family:143
> Faulty page starting at address 0x0000000000000000
> Protection fault status register:0x301031
>
> VRAM is lost due to GPU reset!
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 147100c27c2d..d7fea6cdf2f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->ring->name);
>   	}
>   
> +	if (coredump->fault_info.status) {
> +		struct amdgpu_vm_fault_info *fault_info = &coredump->fault_info;
> +
> +		drm_printf(&p, "\n[%s] Page fault observed for GPU family:%d\n",
> +			   fault_info->vmhub ? "mmhub" : "gfxhub",
> +			   coredump->adev->family);
> +		drm_printf(&p, "Faulty page starting at address 0x%016llx\n",
> +			   fault_info->addr);
> +		drm_printf(&p, "Protection fault status register:0x%x\n",
> +			   fault_info->status);
> +	}
> +
>   	if (coredump->reset_vram_lost)
> -		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> +		drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>   	if (coredump->adev->reset_info.num_regs) {
>   		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>   
> @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>   	if (job) {
>   		s_job = &job->base;
>   		coredump->ring = to_amdgpu_ring(s_job->sched);
> +		coredump->fault_info = job->vm->fault_info;

That's illegal. The VM pointer might already be stale at this point.

I think you need to add the fault info of the last fault globally in the 
VRAM manager or move this to the process info Shashank is working on.

Regards,
Christian.

>   	}
>   
>   	coredump->adev = adev;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 60522963aaca..3197955264f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>   	struct timespec64               reset_time;
>   	bool                            reset_vram_lost;
>   	struct amdgpu_ring			*ring;
> +	struct amdgpu_vm_fault_info	fault_info;
>   };
>   #endif
>   

