Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73669A292
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A147A10E3AE;
	Thu, 16 Feb 2023 23:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761B10E091;
 Thu, 16 Feb 2023 23:45:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kchi8aiYsWaiMF+oS4laanjHPj8yeKDEkSDOfG8veqiRum8CGCZFgXfzX01sCZhQrEljSCfwsaMJ37hv9kI3hriC3NM32yrccVrrWnGHWOiDzBjQ6tG9/ukr7B76vs2r9bh+BUkMOW61BMIVolKjNWZa12FPLPiqrJvrN+tkcigRKgAqFtylw02gKygrsPV54rDDZ2i2Is1DvPuqcwO6Px3fMXlNu+FNQnOBC0OTygu9OgiZTI9NZPsB20A1PvH5s09+b12f10j0b2ahMbwcWc7hM/Q3wTaSQ7Uw8GRbsvTaFznf7K0gARiyXzS8kkYHXjpNSoN4IhYYoidH8/1oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD6J0jKrzmqiK9r414jwPNZaEXv96GElnZ0TRqIhqvw=;
 b=W36H1l4odQBGfFzDx7jY+DY66uGfXjO306CX6DOqZXV29MSOQaOR+5jgySzI9QDqecBVrIyKR0fq6gEoM6awp3QkNFNNbCtAndMYlE1JISDDeiwGK0YkchETUPdSY48yNj3EMX76PxUwEVyURzn11BQjZ52NPImfPMfMKy9CAq+w3SdON4tePBREfO9FiaBL4Rg1Rj98cYMTSoF3QCHDJC4hBxQcTV3zfqyHFkNIXP+yueETOGLg3hB2DZix+L3eokOwLrEGAVWwWUmkIERx/nPLFb7C2CyOfJ8Qc/8uO0IjJnwDC5KfIoZ1n/UKa7oTOhNBYeq7k5/ZVKqqi3LLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD6J0jKrzmqiK9r414jwPNZaEXv96GElnZ0TRqIhqvw=;
 b=hpL7Gq98xAYSFYDe6Z0NUqQC+RyRKYzk2PxnDZ/Lr1tYlISMb8zWSqhRQy9GfgSBPd9qnuleKjopzbegvTkHd6zOlACBxvnrqnaEyfcy58Sa/3zgA3j2S8gSHGlQB6o76DNXCJBk+z9ynrht7+6lMuObF9eg4IpqNyYD0k7nlgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:45:08 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:45:08 +0000
Message-ID: <02c1b698-b5ff-4372-b38f-711a2a9b30e8@amd.com>
Date: Thu, 16 Feb 2023 18:19:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/32] drm/amdgpu: add gfx11 hw debug mode enable and
 disable calls
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-11-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-11-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0202.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: b508ddc8-562c-4e29-ebaa-08db1077d646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /oDUyKWgjx9gMRCF1dKgRWYRtRRNS9lo4ec6nUTNKznsDvfzmfRMVNgWckSMKLBvohLNcVTj/gnJPmJFnDdyfc1spTh9WAwVGNV0J3j0XM0PZLLPd40/5wcMX6/D68Ugx/LwpM7TKLTK4Jo7al6duFyS7lwzHTuVtYao5cEgeLdBCqAizReXLDLSjOF0k0iqBuymGzUWbL+EveSxCzvIfLbSB6wZguPvFfSSP7eIPhvjvGFMMjgZNZm1NacxXIiYczhik2ZcmhKXnEUSxJ5dHNjTKHXdlYO16cQsvrvEvZUAj6qYjAa04BDdj45Y6KPX3hsnckM59/6xbD7iEO7Y07FDcw713s74RXQVXZz2as0ChO6utJXQ94yDesc8SLX0lxyttVBXjEdIr3PkbY7l4LSxymfmOzw+Sef113zParwC/PnuFw2eFp4yJ3PDJ6bxUQr8QaOSykSdvQniRTOzJdV8lKXi6ts9Ugwh1NhcuqHhf9S/ETmD462f9Q3b6fb4kW63siRqse1W8Ihr7mzP1JfYVsd0kZgCsbgmHMhpUSt0+bLGEM3H7aTMf1AKZnvsNb3BzOuHaIYJO1S4+UO23OroO32RwTchm/71Cd3N4oQei5U0+j142a2km5vfNj8ltbkwU7FDnxv5Lig4lOQP2jir4hdhWiztKDX1dsXR1bf4D47HLhB5dsD69niS9nhhrS7BNmjJGD/9qw2ZxzNeJ2PxxtenTkOxpkSQIFH3z5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9Wa3pjcnhFVncxYURFVWhOZERMTG5DRXZtTjVEaldLVVVoS3IwQWdNNGtn?=
 =?utf-8?B?cFk5QUwweVFCR2RDUXVZWTlRQ2daaTg3ejZ4Rjhwa1hCL1d1eE85SHFDSExV?=
 =?utf-8?B?dG1jSlRPNHFZMDVCOUN0Z2NzNGRGMTlWS0RMb2JLakpJZEJDd1dTYThFRWFO?=
 =?utf-8?B?T3dHdXFQdExFTkJXTUtObzhURDNidFlyZFhST1JaRGo4OG4xVmJ1elBocVJD?=
 =?utf-8?B?SjJJTEZTRW1vcUJsQm9xTG9YQVBvUEpRWXpZWk02ZG1lT2dLUWJBblJUcW5k?=
 =?utf-8?B?VzlJZGVuL2xyZXVBdzVYbVlNSlRLdmhpSEY5aGlNbTNDZWw4RDY0UXN2MUVx?=
 =?utf-8?B?d1huK0dDNjg5dzFwU2JOZmRXRnF2aWJCOGg5cjdoZjh6Y1lEYXNoTTZUc1c2?=
 =?utf-8?B?K3c5cmtrTmcvOUtFaVJqZEtpbEZFQmJhMGpEY1ZSNjhNTkowWU04R2dVUmh0?=
 =?utf-8?B?enkySnNjYVlTQ21GbDh1OVNuM0J0SFZ0ZEZnb1NVWTN1UGV2c3VaWWJnWTRD?=
 =?utf-8?B?TzVReVU2bHFvTE4zL2tjNWhxbTEyRkdqeXpXalVCQ2N1U2x4VjIrSVprMkJr?=
 =?utf-8?B?cWUwZ0tvRHdxdjBzNHRqdG9xUjFZcXBSVXpBTFYzcmg1OWI0NHlkZ0dPeUZs?=
 =?utf-8?B?Y2grRWpZeEFwK1FxT0ZZQUdoRzhySE5wWHRVT1NJdVFKbHJvVXBtOGI4Vlpr?=
 =?utf-8?B?QWRKbFdmRXZWM1ZIVGg0QWdJdnZteGpodGVFWFdYYXpKMkc5aEdRWGsxcUxx?=
 =?utf-8?B?OWV2UmowNWlXaHBvQngvTEhSME8rTUJ3Ykpjd21ENkgrRS9uQ0t2UFhJRmhD?=
 =?utf-8?B?V2JXYmV4ak9UWWxGLzZ5WlRUNzdBVHR5STRMWWpwd3JnNnpzb3R4ZHNnVzlG?=
 =?utf-8?B?aVVRYnR6MGh3NFduVlFIMmVVSUoyM3hnUXJnRHpYSFZJMStidHFSYUNEYjRR?=
 =?utf-8?B?cFptMklOM25WTG85WEpYK3Q5ZURQSlprVkJhQllwU1JSRElSalU0ckh5OUtm?=
 =?utf-8?B?elE2b0RUT3QzU3NmV2txTnFkUEp0ZjEza0FwdmZEWmJkcjRWQVFVY2laRitz?=
 =?utf-8?B?MHVmc0VEWmNHOXEwTjlLTWZoN1BPb1dhMWlBdy9vUENJS0VLWDN5bi90MU1t?=
 =?utf-8?B?ZXRlM0x0Ny9XVEJGZHQxS21kSnZLV0RZZGhHamVUZ3o3cDQyN05xSkVzTi83?=
 =?utf-8?B?MkZ0d2xwb0F5T1BVT095aVRPSzFKd3NBTkpjUmxLWEJ0RWZlNGhCNTgvWVlU?=
 =?utf-8?B?TkE2WndqNnBwTWNybjl3VEFxYUZUN0NoSE82dWFIQUJXTDlXV2VMT0ticjhS?=
 =?utf-8?B?T2pnejF2d0pWZDZxdXRlV3l2aDNlc3FJa0tLQ1JZSnc4Um8wcHJoVzZGakJz?=
 =?utf-8?B?d3l6YnJFWTFIcGVYRUNad29nTDd5c0dwbmRUV1FGeXdER1RmNmgwck9rSU44?=
 =?utf-8?B?K3lBMjcweHR2NVBvb255cDIyOW1reWY3MjJpeFhWVnBaOGlHUy91UGFieTE5?=
 =?utf-8?B?QmpGWlF6TVY1cUVLbktvTG1wWWFtTm5sWWpYMGlRdjBvbHk1aGRyRnc3ak8x?=
 =?utf-8?B?MXBDY1NaSzZYR21oei85SVBrV2F4Q2tRVDdOczU4WHJEMHVCT1p5RHpCaWh0?=
 =?utf-8?B?N1k4aWZpNnVKeXoxZWFaN085QXpldWo5aG5vUDMrTkE4UkN1RFNhYit1SHRS?=
 =?utf-8?B?WUtJbmFXdHpNVzBEZUJpenFyVkZkMmZtdFlGb0ljeENVd3EyZlBjQWZVZ2E4?=
 =?utf-8?B?aC9FWFVvaXJwR0l1MWxJL3dhRllaMStOeFFLeExPcXNYQzBrN2NUSDN4azQr?=
 =?utf-8?B?SmtEd0FyZ0tOZWg2bzJvR1dhOHBZTFE0MWIvcW5oNzNRYzlaM1Q1dmdieGw1?=
 =?utf-8?B?NjMrM3hmS21XUnJSeTJqMGZXV3dOSXpaSHFEeE8xd0VBQkZXdlBRc1VNdmZt?=
 =?utf-8?B?UEZrSkcvVEdya0xROTBXeGVEaXkrT3M3dlh3T2ttRnZuT1VUNWE2bkUxa2tx?=
 =?utf-8?B?QzdYUWpEOU9MaHdVVGEvNUFLdVFmK1RhRW82UWI3R0ZydjBvVTBrdXN0S3RQ?=
 =?utf-8?B?VFZmTDJML0Q1eTJoVFFHK3p1SFBNZ2Nma0JodkladWZQa2tNOHBGSU4xS0Y2?=
 =?utf-8?Q?TfUPL7i6WF7kjXFM6w6evGy+r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b508ddc8-562c-4e29-ebaa-08db1077d646
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:45:08.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rw5u1SMKGpvfJoHpSy0SFN7h97gW3tHfa91r22ee+1D/5W7Gazj7wd5fWZr4tCcm/sXbEEzf4O1ErWGnTQcAGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> Implement the per-device calls to enable or disable HW debug mode
> for GFX11.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index 7e80caa05060..34aeff692eba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -30,6 +30,7 @@
>   #include "soc15d.h"
>   #include "v11_structs.h"
>   #include "soc21.h"
> +#include <uapi/linux/kfd_ioctl.h>

What is this needed for? Maybe for a later patch?


>   
>   enum hqd_dequeue_request_type {
>   	NO_ACTION = 0,
> @@ -606,6 +607,42 @@ static void set_vm_context_page_table_base_v11(struct amdgpu_device *adev,
>   	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
>   }
>   
> +/**
Use /* here.
> + * Returns TRAP_EN, EXCP_EN and EXCP_REPLACE.
> + *
> + * restore_dbg_reisters is ignored here but is a general interface requirement

Typo: registers

With those fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> + * for devices that support GFXOFF and where the RLC save/restore list
> + * does not support hw registers for debugging i.e. the driver has to manually
> + * initialize the debug mode registers after it has disabled GFX off during the
> + * debug session.
> + */
> +static uint32_t kgd_gfx_v11_enable_debug_trap(struct amdgpu_device *adev,
> +					    bool restore_dbg_registers,
> +					    uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
> +
> +	return data;
> +}
> +
> +/* Returns TRAP_EN, EXCP_EN and EXCP_REPLACE. */
> +static uint32_t kgd_gfx_v11_disable_debug_trap(struct amdgpu_device *adev,
> +						bool keep_trap_enabled,
> +						uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, keep_trap_enabled);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_EN, 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, EXCP_REPLACE, 0);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -622,4 +659,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.wave_control_execute = wave_control_execute_v11,
>   	.get_atc_vmid_pasid_mapping_info = NULL,
>   	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
> +	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
> +	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap
>   };
