Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A558856DF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF71810E519;
	Thu, 21 Mar 2024 09:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SVEMo+Pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB110E519;
 Thu, 21 Mar 2024 09:56:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7Z/QSxFewSw+o4KYZlJ7UsTXkryJsywx1xUjqOkU1Tcg1VTFkHSDj/VPfwZLAasgaExWxmNTtPUmHL+0k00OjgLRjLpo+NZg3eTJ9mqxn2o84sZhJ+HSPFELerz/627uXrMlaoOFUnt+JlJuo03go8FluIlQZryd6KrEB5BWchkqE0pdyhK3CvsX2rzQlTP3+rXH33ds+OKyia1YLj8JMWvv3VKCBiN0nER1C510lfWVBPkpF8Or2VsKitTepw5juoLjd1FsQSu+KCFCC6gtUmRLY0Tq0znH3RowoeP5HjrvsfvkJTY+kRcUEmOYqjGZLIPf1rkkYs5CL3wH4ZiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDe6Ci1fyRGFej4x0TXtZSMmrGwyKjR16WSmJFOua/c=;
 b=nDJsYQU3cPlkADzfBQ72mew1PHxidsCxd/6h8OWImnUoxyh1Q9JUjDgEwoYfx+XXiuokeuVm659UMFKD5ADClwxPwtncQuRLo5AOhBh/UgLjRumi6VmikdAOHGpHGFrN1CSGd6+0r6LgU6htBreCvIXKhYRkkwYX1O6SiGomZVPEiC5l3anTJsS1yRm5wUmx8ugWiaSMDW13VXsM39ClNmmESniiQnlyU+HEB4wW+LJY6S5eS9lzB9Sl9fELJMDCDWp0SeA8SaH8440E1H3k5iha14Gq3R93NSPKHTYhUpTy+GxD8QlfzetHmAo0c3UdN2KtL+RSvt+wF/vISHJxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDe6Ci1fyRGFej4x0TXtZSMmrGwyKjR16WSmJFOua/c=;
 b=SVEMo+PwUYhH170cU1bKqWrHD5BqxjAdgeRIR4dGEwPS66nRoXOoXu3KkjLCL/dB/jJOtp5rIEBDhyK36iisi5AIZFgd2vwkY6BQ8jeqhzNX4XI8FVYBdslY7eqwpr/E1nuTAjpam/SiriPYwdQprGxInTjwh9OuHR0SpueF+FU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 09:55:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 09:55:55 +0000
Message-ID: <659a2bf0-87e5-472e-9768-3c12216685e1@amd.com>
Date: Thu, 21 Mar 2024 10:55:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to split devcoredump code
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240320194413.1003336-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240320194413.1003336-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b4e8bc-fe9a-4ca1-cd72-08dc498d19e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQlOwPr7Y0Hg5mg2Jl5HkstcTydp39MNwTTEHdLgF+EPH5oW1XTP7fR7cUh74/TpwK9kisyNyjtLzi9SF1J45IOrXzd+4T+26Npqj7vBHpduhd0+tXVxydEwzMs6Ti01GgZLZ9hh4EmB+Chsfp97IQykTocrLOV+zpbW0XqtA5dDQwdJQnxbDfBx4JV2LJc1vhl+9kLAcEaRpUAA2EzdjOausjFXc4dhq8lK27bDCrT0TbLpZElqfrh+hGqEGJU5o6RL/SKA5Wbxbj+rsQIddYepYEjbN274/uhT10afWHgDBOvxSwzvDOgLI0Y86CGXE970anaD38Cwyh4V4OHRwZYl7wuNYCrHtWulUVUncVNVEnSdjXOsUgQO6EwalCfYQoDrlYiN6J1gBlrOvoEJQ5iRzEfVWQZRlo+NO0a/DsCqks/X9zCNt7+rKe6U8D1lHGsrtKNrH86aFeaBACP0hYKxvpB5ogjkrpi9UkaHY1vdAsFaoPmjyXrxfR5cCKx8xUsfoC2+eYk3gkXNSjIyEGGx1Yw/vBq2RAlsVZOlcY8C/DqvAS3PVLxhKrpR7be/uupSN8OgXnjEitBy4/qWteb0FXlwbxb5hqZaIjzDs0verOkRU/JALU72IBQJz2WbuPujm4jTlN2VXRRnYLYwECe566XLB5KzEVDbG2ONl5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1hEdzV6dHN3ZW9rME1ORjZxMHMwTjZ6OGdjbVpuVmdqN29yRWtyRmp1WDdE?=
 =?utf-8?B?TFNyeXhMbThYMzFCNVpQSUhZNldGcnpQL3UzeVJ0UHY0THRzV0VNa1lueVd3?=
 =?utf-8?B?K3d0cUU2VTdmdm04L3Z3T25ObStqVGsyQW4zYzV6S1c5ZXM4WEJUQ3pjRGdv?=
 =?utf-8?B?WkpVMk1MNSt2KzFYSmZwZUxIMTJaSkx2a0UxTTZBQmhkSjJheU0vN2o0aDhO?=
 =?utf-8?B?dnhNV1NVMks5WXpnd3gwYVNtM2NtNExVZmxyd1YrbzU3eGVvdXFHc1h3REV6?=
 =?utf-8?B?M3FkQmpURmR5d1hHTlJBSU0zN0JnNjh0d3ZLaXdYc0x3Q1VmbTNVTDFZbk9H?=
 =?utf-8?B?S3VLaVVIbnVIM1kvTkpXdVFJS2xzZlI1TmR6RFlid3lpbFgyZGNoS2V1SnFR?=
 =?utf-8?B?TlhJNDhScWMwYmdvdU9MUmdxMEVDNEVteFVrNFh5L0Y2RnlMSkdLN1JsYlVS?=
 =?utf-8?B?M2xMSmM2bEFBWXB5aWlJa3luVDM4UklnSFlacFRjOUxQN05jSjhKaWl0QUxv?=
 =?utf-8?B?NHdGRXJmbFhFZmE0RFBtejJBbzFHRG9JTUlmRmdlR2dUMWsrbVFReFd5MHRx?=
 =?utf-8?B?Q25Tc2FabCtFUzZ0emUwZUoxdmF4clo5cDZmYjJtTS9aN0ErZ0Z0VzNwNzNu?=
 =?utf-8?B?QWl2ck1XNUZXVnFWaklWOTBXQ08ybW1xTU9pN1lLQ3ViUDF6d2hqMlpNVG9m?=
 =?utf-8?B?VmZsV2dNelpLS05NVk5UbmZJSDAxakY1QkdyVVlIdno0bjZDeHBYWklSNitK?=
 =?utf-8?B?dGJaTGN2RitTZXRRRlJvaGVFTEI3d09saTEvNjFQOU5HZ1NkVzhtanc3dW1u?=
 =?utf-8?B?VGF4OFlVSS9XRlVvUFROTU5FTWN2NU5aZmRvenl6bnBGeUdOZWFLcjFqc1BO?=
 =?utf-8?B?WHlEVE9FNCtCMWxqYmFuTnlxbTR5Ulp3bXpRYUtQZE1SWkhuM0NydS9vTnNT?=
 =?utf-8?B?emN5SE9YUWVQclg3SXNNOGMrRkZyT21IU09kaXgwR21hVytxcTFyR09XY2Mx?=
 =?utf-8?B?dFJMZGR3TVdMMThZZzFGYSsxeVhPOE90WDRoU0lDdGdnY0pjRHBVbW50R0Jx?=
 =?utf-8?B?ckw0MG9oS0RYdFdhWjNKUmxnUW5WWDFLMDVMVk1DSFNCajFObE1vMndNNjNH?=
 =?utf-8?B?YjF6TE5ieW1WR25UU1BjN0pTQytNZE5Ta0FOOS9UaWtVNGo2bE1MUGs0WFhE?=
 =?utf-8?B?cG9BNHlMYlJ4NVhuNVB1U0JvM3BtQURGazVucU9heExISVpxY1JxRWVoQ2FN?=
 =?utf-8?B?aWtONVA3dU0rRHhXcndNOXY5Vk5SRW9yKzN5Wi9QWEVnWklkSjMxWXNwL2Zy?=
 =?utf-8?B?YW5Ma3NyU1M0Q0dwRCtWR09mQW9xcjlXS1Z6UWxjby8zK0tiWk9RemdyZUIr?=
 =?utf-8?B?azE2L1pHendNWFBtQ0Y3MnRZdVVQd2k2SU1oVWludnRlWEMyT2dRRXhoMGNu?=
 =?utf-8?B?Q2hFNU52Sk1jWTJoSmdGZlZGWXdXKzEwSEhUU3ljQ0pabitSVWdPL3hLZGJH?=
 =?utf-8?B?T2Q1dGZXUWptUVFTNG9zMEtPRERaMjdGOFRKZm54b3U2b1NzTURyVldOdS9H?=
 =?utf-8?B?ZHBiK0p6TThILzhGRTRPZkhOcE5vSzVJUWZkS3UrUFNjc2YvYWM3Rzl3bDFj?=
 =?utf-8?B?Sm5RTXNhUjlsUElacVVXSnY4V0JQOW1aSFBXZnlRSlB0aW4zUm0rVFNJbmJZ?=
 =?utf-8?B?aTFlbTN4anFvbk1JK0dMS0Fyb1oxcERjYTA4b0NrbXBtc052VkpFMUpFV1hL?=
 =?utf-8?B?bWlZZllXblZ0ZW5yWlVXOEhNbmxZNVFORFQyODJuTXpiR0I1bFk5T0M5dFNU?=
 =?utf-8?B?ZERUWUw2dmZUMnBIUHBoZmtCMThybHFuYjRyTnQ2NWFibjNwTDZwbFNpOTFR?=
 =?utf-8?B?bnFxSmNXZnVFUVYwMnJUSllZMDNtd1hHTUkweVVxMGpDNk1NOTErMjFyTDZU?=
 =?utf-8?B?ZGFiYWRCeWJmMHZvMnJiYllQa0tWRStIejdRR2tCMlRGREVIV3pqcklMR1Qw?=
 =?utf-8?B?T3oremhpeUMzcEJzRU05enl5RTZMS21HSWIwT010VTVjZ2sxUjRWWVBaTWJq?=
 =?utf-8?B?YWtHYVo1VWR4UnZSSFFMeFVMT0M2Nmx0b3FQU1ZIVVZLWXZZUzUzZncyb1Zn?=
 =?utf-8?Q?2+lQo0mOvq5OINSCh2EG/AndJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b4e8bc-fe9a-4ca1-cd72-08dc498d19e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 09:55:55.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK5ygGJlU5fcelhP+uYl5EIs8A0FCkUTG9/oU1VKdpJ8oQq4c7QoVeJpy15VF4W4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
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

Am 20.03.24 um 20:44 schrieb Sunil Khatri:
> Refractor devcoredump code into new files since its
> functionality is expanded further and better to slit
> and devcoredump to have its own file.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 218 ++++++++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h  |  46 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   4 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     | 191 ---------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  16 --
>   6 files changed, 269 insertions(+), 208 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 535e3936cfe0..1f6b56ec99f6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -81,7 +81,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>   	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>   	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>   	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> +	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o
>   
>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> new file mode 100644
> index 000000000000..f3a0f5857598
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include <generated/utsrelease.h>
> +
> +#ifndef CONFIG_DEV_COREDUMP
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +		     struct amdgpu_reset_context *reset_context)
> +{
> +}
> +#else
> +
> +#include <linux/devcoredump.h>
> +#include "amdgpu_dev_coredump.h"
> +
> +const char *hw_ip_names[MAX_HWIP] = {
> +	[GC_HWIP]		= "GC",
> +	[HDP_HWIP]		= "HDP",
> +	[SDMA0_HWIP]		= "SDMA0",
> +	[SDMA1_HWIP]		= "SDMA1",
> +	[SDMA2_HWIP]		= "SDMA2",
> +	[SDMA3_HWIP]		= "SDMA3",
> +	[SDMA4_HWIP]		= "SDMA4",
> +	[SDMA5_HWIP]		= "SDMA5",
> +	[SDMA6_HWIP]		= "SDMA6",
> +	[SDMA7_HWIP]		= "SDMA7",
> +	[LSDMA_HWIP]		= "LSDMA",
> +	[MMHUB_HWIP]		= "MMHUB",
> +	[ATHUB_HWIP]		= "ATHUB",
> +	[NBIO_HWIP]		= "NBIO",
> +	[MP0_HWIP]		= "MP0",
> +	[MP1_HWIP]		= "MP1",
> +	[UVD_HWIP]		= "UVD/JPEG/VCN",
> +	[VCN1_HWIP]		= "VCN1",
> +	[VCE_HWIP]		= "VCE",
> +	[VPE_HWIP]		= "VPE",
> +	[DF_HWIP]		= "DF",
> +	[DCE_HWIP]		= "DCE",
> +	[OSSSYS_HWIP]		= "OSSSYS",
> +	[SMUIO_HWIP]		= "SMUIO",
> +	[PWR_HWIP]		= "PWR",
> +	[NBIF_HWIP]		= "NBIF",
> +	[THM_HWIP]		= "THM",
> +	[CLK_HWIP]		= "CLK",
> +	[UMC_HWIP]		= "UMC",
> +	[RSMU_HWIP]		= "RSMU",
> +	[XGMI_HWIP]		= "XGMI",
> +	[DCI_HWIP]		= "DCI",
> +	[PCIE_HWIP]		= "PCIE",
> +};
> +
> +static ssize_t
> +amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> +			void *data, size_t datalen)
> +{
> +	struct drm_printer p;
> +	struct amdgpu_coredump_info *coredump = data;
> +	struct drm_print_iterator iter;
> +	struct amdgpu_vm_fault_info *fault_info;
> +	int i, ver;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	p = drm_coredump_printer(&iter);
> +
> +	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> +	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
> +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
> +			coredump->reset_time.tv_nsec);
> +
> +	if (coredump->reset_task_info.pid)
> +		drm_printf(&p, "process_name: %s PID: %d\n",
> +			   coredump->reset_task_info.process_name,
> +			   coredump->reset_task_info.pid);
> +
> +	/* GPU IP's information of the SOC */
> +	drm_printf(&p, "\nIP Information\n");
> +	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
> +	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
> +	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
> +
> +	for (int i = 1; i < MAX_HWIP; i++) {
> +		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
> +			ver = coredump->adev->ip_versions[i][j];
> +			if (ver)
> +				drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
> +					   hw_ip_names[i], i, j,
> +					   IP_VERSION_MAJ(ver),
> +					   IP_VERSION_MIN(ver),
> +					   IP_VERSION_REV(ver),
> +					   IP_VERSION_VARIANT(ver),
> +					   IP_VERSION_SUBREV(ver));
> +		}
> +	}
> +
> +	if (coredump->ring) {
> +		drm_printf(&p, "\nRing timed out details\n");
> +		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> +			   coredump->ring->funcs->type,
> +			   coredump->ring->name);
> +	}
> +
> +	/* Add page fault information */
> +	fault_info = &coredump->adev->vm_manager.fault_info;
> +	drm_printf(&p, "\n[%s] Page fault observed\n",
> +		   fault_info->vmhub ? "mmhub" : "gfxhub");
> +	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
> +	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
> +
> +	/* Add ring buffer information */
> +	drm_printf(&p, "Ring buffer information\n");
> +	for (int i = 0; i < coredump->adev->num_rings; i++) {
> +		int j = 0;
> +		struct amdgpu_ring *ring = coredump->adev->rings[i];
> +
> +		drm_printf(&p, "ring name: %s\n", ring->name);
> +		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
> +			   amdgpu_ring_get_rptr(ring),
> +			   amdgpu_ring_get_wptr(ring),
> +			   ring->buf_mask);
> +		drm_printf(&p, "Ring size in dwords: %d\n",
> +			   ring->ring_size / 4);
> +		drm_printf(&p, "Ring contents\n");
> +		drm_printf(&p, "Offset \t Value\n");
> +
> +		while (j < ring->ring_size) {
> +			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
> +			j += 4;
> +		}
> +	}
> +
> +	if (coredump->reset_vram_lost)
> +		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> +	if (coredump->adev->reset_info.num_regs) {
> +		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
> +
> +		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
> +			drm_printf(&p, "0x%08x: 0x%08x\n",
> +				   coredump->adev->reset_info.reset_dump_reg_list[i],
> +				   coredump->adev->reset_info.reset_dump_reg_value[i]);
> +	}
> +
> +	return count - iter.remain;
> +}
> +
> +static void amdgpu_devcoredump_free(void *data)
> +{
> +	kfree(data);
> +}
> +
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +		     struct amdgpu_reset_context *reset_context)
> +{
> +	struct amdgpu_coredump_info *coredump;
> +	struct drm_device *dev = adev_to_drm(adev);
> +	struct amdgpu_job *job = reset_context->job;
> +	struct drm_sched_job *s_job;
> +
> +	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
> +
> +	if (!coredump) {
> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> +		return;
> +	}
> +
> +	coredump->reset_vram_lost = vram_lost;
> +
> +	if (reset_context->job && reset_context->job->vm) {
> +		struct amdgpu_task_info *ti;
> +		struct amdgpu_vm *vm = reset_context->job->vm;
> +
> +		ti = amdgpu_vm_get_task_info_vm(vm);
> +		if (ti) {
> +			coredump->reset_task_info = *ti;
> +			amdgpu_vm_put_task_info(ti);
> +		}
> +	}
> +
> +	if (job) {
> +		s_job = &job->base;
> +		coredump->ring = to_amdgpu_ring(s_job->sched);
> +	}
> +
> +	coredump->adev = adev;
> +
> +	ktime_get_ts64(&coredump->reset_time);
> +
> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> +		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +}
> +#endif
> +
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> new file mode 100644
> index 000000000000..fdb8da73c1f2
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __AMDGPU_DEV_COREDUMP_H__
> +#define __AMDGPU_DEV_COREDUMP_H__
> +
> +#include "amdgpu.h"
> +#include "amdgpu_reset.h"
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +
> +#define AMDGPU_COREDUMP_VERSION "1"
> +
> +struct amdgpu_coredump_info {
> +	struct amdgpu_device            *adev;
> +	struct amdgpu_task_info         reset_task_info;
> +	struct timespec64               reset_time;
> +	bool                            reset_vram_lost;
> +	struct amdgpu_ring              *ring;
> +};
> +
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +		     struct amdgpu_reset_context *reset_context);
> +#endif
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 3204b8f6edeb..95028f57cb56 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -75,6 +75,10 @@
>   #include "amdgpu_reset.h"
>   #include "amdgpu_virt.h"
>   
> +#ifdef CONFIG_DEV_COREDUMP
> +#include "amdgpu_dev_coredump.h"
> +#endif
> +
>   #include <linux/suspend.h>
>   #include <drm/task_barrier.h>
>   #include <linux/pm_runtime.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 3398f2a368d5..ea4873f6ccd1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -21,50 +21,11 @@
>    *
>    */
>   
> -#include <linux/devcoredump.h>
> -#include <generated/utsrelease.h>
> -
>   #include "amdgpu_reset.h"
>   #include "aldebaran.h"
>   #include "sienna_cichlid.h"
>   #include "smu_v13_0_10.h"
>   
> -const char *hw_ip_names[MAX_HWIP] = {
> -	[GC_HWIP]		= "GC",
> -	[HDP_HWIP]		= "HDP",
> -	[SDMA0_HWIP]		= "SDMA0",
> -	[SDMA1_HWIP]		= "SDMA1",
> -	[SDMA2_HWIP]		= "SDMA2",
> -	[SDMA3_HWIP]		= "SDMA3",
> -	[SDMA4_HWIP]		= "SDMA4",
> -	[SDMA5_HWIP]		= "SDMA5",
> -	[SDMA6_HWIP]		= "SDMA6",
> -	[SDMA7_HWIP]		= "SDMA7",
> -	[LSDMA_HWIP]		= "LSDMA",
> -	[MMHUB_HWIP]		= "MMHUB",
> -	[ATHUB_HWIP]		= "ATHUB",
> -	[NBIO_HWIP]		= "NBIO",
> -	[MP0_HWIP]		= "MP0",
> -	[MP1_HWIP]		= "MP1",
> -	[UVD_HWIP]		= "UVD/JPEG/VCN",
> -	[VCN1_HWIP]		= "VCN1",
> -	[VCE_HWIP]		= "VCE",
> -	[VPE_HWIP]		= "VPE",
> -	[DF_HWIP]		= "DF",
> -	[DCE_HWIP]		= "DCE",
> -	[OSSSYS_HWIP]		= "OSSSYS",
> -	[SMUIO_HWIP]		= "SMUIO",
> -	[PWR_HWIP]		= "PWR",
> -	[NBIF_HWIP]		= "NBIF",
> -	[THM_HWIP]		= "THM",
> -	[CLK_HWIP]		= "CLK",
> -	[UMC_HWIP]		= "UMC",
> -	[RSMU_HWIP]		= "RSMU",
> -	[XGMI_HWIP]		= "XGMI",
> -	[DCI_HWIP]		= "DCI",
> -	[PCIE_HWIP]		= "PCIE",
> -};
> -
>   int amdgpu_reset_init(struct amdgpu_device *adev)
>   {
>   	int ret = 0;
> @@ -197,155 +158,3 @@ void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
>   	atomic_set(&reset_domain->in_gpu_reset, 0);
>   	up_write(&reset_domain->sem);
>   }
> -
> -#ifndef CONFIG_DEV_COREDUMP
> -void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> -		     struct amdgpu_reset_context *reset_context)
> -{
> -}
> -#else
> -static ssize_t
> -amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
> -			void *data, size_t datalen)
> -{
> -	struct drm_printer p;
> -	struct amdgpu_coredump_info *coredump = data;
> -	struct drm_print_iterator iter;
> -	struct amdgpu_vm_fault_info *fault_info;
> -	int i, ver;
> -
> -	iter.data = buffer;
> -	iter.offset = 0;
> -	iter.start = offset;
> -	iter.remain = count;
> -
> -	p = drm_coredump_printer(&iter);
> -
> -	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> -	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
> -	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> -	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
> -			coredump->reset_time.tv_nsec);
> -
> -	if (coredump->reset_task_info.pid)
> -		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   coredump->reset_task_info.process_name,
> -			   coredump->reset_task_info.pid);
> -
> -	/* GPU IP's information of the SOC */
> -	drm_printf(&p, "\nIP Information\n");
> -	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
> -	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
> -	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
> -
> -	for (int i = 1; i < MAX_HWIP; i++) {
> -		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
> -			ver = coredump->adev->ip_versions[i][j];
> -			if (ver)
> -				drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
> -					   hw_ip_names[i], i, j,
> -					   IP_VERSION_MAJ(ver),
> -					   IP_VERSION_MIN(ver),
> -					   IP_VERSION_REV(ver),
> -					   IP_VERSION_VARIANT(ver),
> -					   IP_VERSION_SUBREV(ver));
> -		}
> -	}
> -
> -	if (coredump->ring) {
> -		drm_printf(&p, "\nRing timed out details\n");
> -		drm_printf(&p, "IP Type: %d Ring Name: %s\n",
> -			   coredump->ring->funcs->type,
> -			   coredump->ring->name);
> -	}
> -
> -	/* Add page fault information */
> -	fault_info = &coredump->adev->vm_manager.fault_info;
> -	drm_printf(&p, "\n[%s] Page fault observed\n",
> -		   fault_info->vmhub ? "mmhub" : "gfxhub");
> -	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
> -	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
> -
> -	/* Add ring buffer information */
> -	drm_printf(&p, "Ring buffer information\n");
> -	for (int i = 0; i < coredump->adev->num_rings; i++) {
> -		int j = 0;
> -		struct amdgpu_ring *ring = coredump->adev->rings[i];
> -
> -		drm_printf(&p, "ring name: %s\n", ring->name);
> -		drm_printf(&p, "Rptr: 0x%llx Wptr: 0x%llx RB mask: %x\n",
> -			   amdgpu_ring_get_rptr(ring),
> -			   amdgpu_ring_get_wptr(ring),
> -			   ring->buf_mask);
> -		drm_printf(&p, "Ring size in dwords: %d\n",
> -			   ring->ring_size / 4);
> -		drm_printf(&p, "Ring contents\n");
> -		drm_printf(&p, "Offset \t Value\n");
> -
> -		while (j < ring->ring_size) {
> -			drm_printf(&p, "0x%x \t 0x%x\n", j, ring->ring[j/4]);
> -			j += 4;
> -		}
> -	}
> -
> -	if (coredump->reset_vram_lost)
> -		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (coredump->adev->reset_info.num_regs) {
> -		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
> -
> -		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
> -			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   coredump->adev->reset_info.reset_dump_reg_list[i],
> -				   coredump->adev->reset_info.reset_dump_reg_value[i]);
> -	}
> -
> -	return count - iter.remain;
> -}
> -
> -static void amdgpu_devcoredump_free(void *data)
> -{
> -	kfree(data);
> -}
> -
> -void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> -		     struct amdgpu_reset_context *reset_context)
> -{
> -	struct amdgpu_coredump_info *coredump;
> -	struct drm_device *dev = adev_to_drm(adev);
> -	struct amdgpu_job *job = reset_context->job;
> -	struct drm_sched_job *s_job;
> -
> -	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
> -
> -	if (!coredump) {
> -		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> -		return;
> -	}
> -
> -	coredump->reset_vram_lost = vram_lost;
> -
> -	if (reset_context->job && reset_context->job->vm) {
> -		struct amdgpu_task_info *ti;
> -		struct amdgpu_vm *vm = reset_context->job->vm;
> -
> -		ti = amdgpu_vm_get_task_info_vm(vm);
> -		if (ti) {
> -			coredump->reset_task_info = *ti;
> -			amdgpu_vm_put_task_info(ti);
> -		}
> -	}
> -
> -	if (job) {
> -		s_job = &job->base;
> -		coredump->ring = to_amdgpu_ring(s_job->sched);
> -	}
> -
> -	coredump->adev = adev;
> -
> -	ktime_get_ts64(&coredump->reset_time);
> -
> -	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> -		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> -}
> -#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 60522963aaca..66125d43cf21 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -88,19 +88,6 @@ struct amdgpu_reset_domain {
>   	atomic_t reset_res;
>   };
>   
> -#ifdef CONFIG_DEV_COREDUMP
> -
> -#define AMDGPU_COREDUMP_VERSION "1"
> -
> -struct amdgpu_coredump_info {
> -	struct amdgpu_device		*adev;
> -	struct amdgpu_task_info         reset_task_info;
> -	struct timespec64               reset_time;
> -	bool                            reset_vram_lost;
> -	struct amdgpu_ring			*ring;
> -};
> -#endif
> -
>   int amdgpu_reset_init(struct amdgpu_device *adev);
>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>   
> @@ -141,9 +128,6 @@ void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   
>   void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   
> -void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> -		     struct amdgpu_reset_context *reset_context);
> -
>   #define for_each_handler(i, handler, reset_ctl)                  \
>   	for (i = 0; (i < AMDGPU_RESET_MAX_HANDLERS) &&           \
>   		    (handler = (*reset_ctl->reset_handlers)[i]); \

