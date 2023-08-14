Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DA77BC35
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECDC10E214;
	Mon, 14 Aug 2023 14:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FFC10E214;
 Mon, 14 Aug 2023 14:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=freCuS9rgTvZJiwxfinot0jCh09akK7R78piKdQMvA6/deU0qL5P3IMlBATkd3KNlnMuoZSxxUCZRo7+TEd9KnVilEZ4158/upO29g1slcxxFIgN3VCBHtNhEOZCht0MQwEZkfqtWwYsrxxXFFv6CO11k7vL0sZ6hvOVYyZVmMgQL2qBiRCCnoWPp28lfgMKbkmAm0Q0VlSfSQyarHtMb9eoaRIE73rttVdhAN4xAwRp7E+61FRJRKUwX3kBrtbgYm8ceoGEY0XwDpnpitYMaDopaVZ8RsCNPXLtejzdc6GEASpg38RWZ0/SBTjG0Yo+dOtAcyvabtmOGcfEdI71yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RelK/38DCltRLdM5oYWZ/GsBBFGlucDXav8Oq13C42E=;
 b=JD0NeZkEzAU8p42PKUB/39PZ0bc/oH9haJ7ohRpfVMPRCRsc2X4+xG7ns8EDIwY/NkkNzYZoeIvnn044HV0egGvj8bXvEFL9xrOeE7K40MW8WA8uV/63mnn38tE5e7YYmVetJU9mHD36JCrzm7vdKs37LScHi35xOv6eZ3ahNUWf81MDVrXAYouyqd3daLKYO8hcy4bzPqTquIZBCY3VDkvvQqXsSMsx72196IU6bm0nsIJ6a8fLtPW9f5Hi2oob8ZKfK0TLI1znJu0yZebXsiys8cEltvSgqFlYimi7tal1KbSjdsqLoiBfNwrel459wiF22LcNk2ynZj9bABuOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RelK/38DCltRLdM5oYWZ/GsBBFGlucDXav8Oq13C42E=;
 b=Z7xgpfYiWRThDqcIOu7HUuxmOSDxNrVMp2UUA0nP16FcYlYgatVgdY+eCkKLGJQVM1z7DSy4WjAsvbZagqJW3iuEL7bcw+TOU6R1n60w9Z0Ts38JLztQuSSLEbW38r/BMmNouxHKqPON70ePItA+nuCKz/r74mFw1GbzyeD6GDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Mon, 14 Aug
 2023 14:58:28 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 14:58:28 +0000
Message-ID: <0713c5eb-0f24-20b7-f045-e1cb1e92f84d@amd.com>
Date: Mon, 14 Aug 2023 16:58:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
Content-Language: en-US
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230814073438.10682-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0390.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::24) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: c21f0237-c11d-45a9-972d-08db9cd6ead7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yt0WY+GwGbgRiF5Cn86s9vHe8v7oK+S6FNr06lgORE16kguRsVoO1m3mS+giU5/3Ogk3yuu83nXJCAJ/piX4cSuf9VbnjdS97cGWZDgTwZWFUwguZR49nsaqLS9Ub5FPsueRW28GpXwdVcOUB/6NrOMEDInJ3PZQB1+6ExgY5NfAHX/VOrFCVi724josqwsiJ0JkajtaLWh98itQhwC2bMpKhtVDKBR80lUTImbQPsIBwitCusa0lMxwu/fyjGVv6jh3kgOPM6m317aWg0gizON5jTY5i4Z3lv0ZjgtIeFYq+zf9LzvfsCndpJi7F8QUqpt4aeSHghsjRyEfvgco4xltZKplV2sKskLMh5qiVPQh8fN72T8pDohivp6sGB3uVT3bWOapG7BPInjZa1uhs6eCbV1oVvFVVUsGCSBJ5Ua17SYLKX5VdduTuBrmCR/SYkwQ2JfItOaFUzdlMPZeA2lu9KrqkckNNVG90HWblUQ9SxmA5w2V5WQiJzz/C3E5nJKiC7Pk40CPeoRAdqpiVLj910kfEVDusz0SSyAvpWXCEZ98MHITiNZk5fBd3p1rXlzPDxPa2igtlMiCbGi7b3ESWvPIIrT+oBfIws4mguJINp81+28cZA7+RiW7rYldgXg1VAPHkwPh5uz/WzbzoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(1800799006)(186006)(30864003)(8936002)(6666004)(6486002)(6512007)(83380400001)(53546011)(2616005)(44832011)(6506007)(26005)(5660300002)(2906002)(478600001)(66556008)(316002)(66946007)(66476007)(41300700001)(31696002)(86362001)(8676002)(36756003)(38100700002)(66899021)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRXSkdtR1ZaU3NwV0xqK0JTb3lZWWpCSlhXVVFlVHI0WHYzcmF1SFdJVUVI?=
 =?utf-8?B?SFJraTJha3hCemV3Q2w4NlZBbEJXN0QxWjVjNWloMGxtWStMS1FRTGNVdS9q?=
 =?utf-8?B?SS9XbU1KOUIwV0xhYjRmaXhBTURmcTUxR0I2elRzTmR1Z2tFVVhSM0pJNmVi?=
 =?utf-8?B?YUEzZnN0RVlwL3E1MlNiV2JWbGtzQzl2Z2JrOHFKU3c2U0k0MUo1aTBpenQ0?=
 =?utf-8?B?bmxWK1VMdDZybFR5Zkg1d1lGei9tamZiZTVSL0Npb2xHWGVkVzAvYVdOOXg4?=
 =?utf-8?B?WDNCZUEzdXRRMmI2UEZrUHNMajlVaWVKd2gvNG03OG1tSlhQUm4vcjIxMW8r?=
 =?utf-8?B?OFlaMWphZG9XZG4zbVRweGYyb1E2UXVBRExiN0tJSEt1MVY5TmZkWUtJeGdz?=
 =?utf-8?B?eXlBSElkenJqMS9Gdi9RYS9NZ2FsSGtqVUxPQVYxNTN2SW5ldWxQdS9pS2Q0?=
 =?utf-8?B?Qk9QODdscFBCZEx5OVdXQ3RkMUI2N1RHSDNaWDUxNmhQZENYcUduYzVCanBB?=
 =?utf-8?B?WDh5Q1IzVnJIOFk2cXhRbHF4d0gwT3pnYkdQM0wwdVIzc3FoSXZJZG9LS3ZT?=
 =?utf-8?B?NVFWWjhyZStleDdFbjZPZkJPRitpV1BPVEMyN0hDNDB1T016ZkptbjJOUnR1?=
 =?utf-8?B?RzFsSVE0OTg5V3lhSTh6YkZTZDd4ZXY4QjlXUXUyOUh6T1h0eWphZWFQWWxy?=
 =?utf-8?B?MXV1Q2c0R3dDWEVjMGVTdDMxczdVNGhHd0xZV29vNDRmcEZxb0xjM0lhYlhz?=
 =?utf-8?B?RUlQSDZTdVYzT3g2Sy9PS1dqUjAzbUw3Ym5tZ3BhN3pSUDRUWHJLdEcrRWtQ?=
 =?utf-8?B?R2VaMzV1VlB6SVQ3SUU5TW1ReVN2TFh3d3R4UDRObHRBVUdlOXRIVDB0a3du?=
 =?utf-8?B?TXR3ZkxDd2FZOGE1SWV6aHpGd2F3cmVaR1ZiNWg5TW9KZVNpSVFiUmttdmZw?=
 =?utf-8?B?QkM3RmhnMCt6YWEvVGx2ZzJiRjFtKzFrNUZPWUVnT0RrR1BzRVFoU2JualQ3?=
 =?utf-8?B?WFNXZGFpMFZvejRscCtLVDU5VXJaaGF5K0ZhTFdUVFhxUDMzUmRIWGYyMUpZ?=
 =?utf-8?B?cmdWQ1BRZnpvL2FTVy9uSWtmRjNPV3VHNE1PTW1MenZYY3duVUJYd0w2Qnln?=
 =?utf-8?B?cG1QbEgvcDE1ZDQvU1NLUWNDbnVUNnZySVkreFpaSDBlOEx4blJYS1hQajgx?=
 =?utf-8?B?bUlhOCtHSHc0WTR5RUdaRHhsS2R3a2c3a3ZtYUwxR1RudUc4MGk0ZTA5V2Y0?=
 =?utf-8?B?TnhDWEdaVDlPaFlGaGxmbHpVa0dPbjgyMkJVR2FCRHJtUlBQejFpWVFvWjc4?=
 =?utf-8?B?aUUvVHVTaHBLOWQ5OThkbCtmNEZLZjNRY3lsVFBuazFBbjhzNmhjOXVDclA0?=
 =?utf-8?B?N2pwU05ISzhERUYzZ3paYThnREVvVzhDbWNYRnlZT2g3RDFDYVozRXVoRmMx?=
 =?utf-8?B?bithenJjanl0OWVDQURYcGRRY0lDVWg0TDR2TTFsYVZlVXZ3RVkraGFKRnJk?=
 =?utf-8?B?MmZUV2E3MGxVR0pDNWRaWnpleE5sb0hSTkUvRmxXdFd4Y0pZNE1yNTJ1czRi?=
 =?utf-8?B?bFBENGdPdERnQ3BRVjJBVTdodDFORUdKUkE4eHFNV2xKZ3RYSWhaaGtldXJw?=
 =?utf-8?B?VjZWb0QzZ2t5aXF1UEpyZWhFMXZicFV4RzF0TXZETEZZQ05uYzJMMkJvMDZS?=
 =?utf-8?B?ZmFqSjlSRGlDMFVWNVAzZ2ZVYlZybUJwNHJOZ0tHbGNrVzRjcUdIZytPZ3Zm?=
 =?utf-8?B?UzVjOEF1dXhqdWVBdXVCTlM2Rk14OWd5TDVzd3VhWkVzL3VlYUgzMk9VR0FW?=
 =?utf-8?B?MUlXSkZoczQ1UWdBVXUvWUMza3lMcDZhcXdIZ1hXeU5EbkZGTkdmSnRpWDJh?=
 =?utf-8?B?T3pOSG9NNmdTcENtMFhDQkt5WDl2K25oUjhtTUhabDRjM0Y3Y2h5Q3daS21k?=
 =?utf-8?B?b0ZYVHdUeFR0MEtiTVRFK1Npc01NWXZKbE1JYWRHNklHYnpLVHprVHF3MzYw?=
 =?utf-8?B?czM3T1VIbTM0RGR3KzlmWHUyQTVab0prelB0YWY3Mll3VGRGdFJ4NW9saGtX?=
 =?utf-8?B?TW1FVTlqa2hkaTliYk9EZXRPQldMbXByTmRtakpESUlVU1VGRGNVc1ZUOHU2?=
 =?utf-8?Q?H5ltfzHZVknsHkxiLA0J7w0Pj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21f0237-c11d-45a9-972d-08db9cd6ead7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:58:28.3474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCXTrSo+hm1LAlKyGwYvg7wcD0z8UZx7zTBHWO6Uz8WEuyvjw7piNGJDks09bXr9h62WA1d5upiuQ01JvHX1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
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

Hey Arvind,

On 14/08/2023 09:34, Arvind Yadav wrote:
> This patch adds a function which will allow to
> change the GPU power profile based on a submitted job.
> This can optimize the power performance when the
> workload is on.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
>   5 files changed, 206 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 415a7fa395c4..6a9e187d61e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -60,7 +60,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>   	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>   	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>   	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -	amdgpu_ring_mux.o
> +	amdgpu_ring_mux.o amdgpu_workload.o
>   
>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 02b827785e39..1939fa1af8a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -107,6 +107,7 @@
>   #include "amdgpu_fdinfo.h"
>   #include "amdgpu_mca.h"
>   #include "amdgpu_ras.h"
> +#include "amdgpu_workload.h"
>   
>   #define MAX_GPU_INSTANCE		16
>   
> @@ -1050,6 +1051,8 @@ struct amdgpu_device {
>   
>   	bool                            job_hang;
>   	bool                            dc_enabled;
> +
> +	struct amdgpu_smu_workload	smu_workload;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5c7d40873ee2..0ec18b8fe29f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3672,6 +3672,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   
>   	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>   
> +	amdgpu_smu_workload_init(adev);
> +
>   	adev->gfx.gfx_off_req_count = 1;
>   	adev->gfx.gfx_off_residency = 0;
>   	adev->gfx.gfx_off_entrycount = 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> new file mode 100644
> index 000000000000..ce0339d75c12
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
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
> +#include "amdgpu.h"
> +
> +/* 100 millsecond timeout */
> +#define SMU_IDLE_TIMEOUT	msecs_to_jiffies(100)
> +
> +static enum PP_SMC_POWER_PROFILE
> +ring_to_power_profile(uint32_t ring_type)
> +{
> +	switch (ring_type) {
> +	case AMDGPU_RING_TYPE_GFX:
> +		return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> +	case AMDGPU_RING_TYPE_COMPUTE:
> +		return PP_SMC_POWER_PROFILE_COMPUTE;
> +	case AMDGPU_RING_TYPE_UVD:
> +	case AMDGPU_RING_TYPE_VCE:
> +	case AMDGPU_RING_TYPE_UVD_ENC:
> +	case AMDGPU_RING_TYPE_VCN_DEC:
> +	case AMDGPU_RING_TYPE_VCN_ENC:
> +	case AMDGPU_RING_TYPE_VCN_JPEG:
> +		return PP_SMC_POWER_PROFILE_VIDEO;
> +	default:
> +		return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> +	}
> +}
> +
> +static void
> +amdgpu_power_profile_set(struct amdgpu_device *adev,
> +			 enum PP_SMC_POWER_PROFILE profile)
This function expects the caller to hold the smu_workload_mutex, may be 
we should document it.
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
I think we should pass this return value to caller instead of keeping 
the function void.
> +
> +	if (ret == 0) {
> +		/* Set the bit for the submitted workload profile */
> +		adev->smu_workload.submit_workload_status |= (1 << profile);
> +		atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
> +	} else {
> +		DRM_ERROR("Failed to set power profile, error %d\n", ret);
This can be a warning instead of error.
> +	}
> +
> +}
> +
> +static void
> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
> +			   enum PP_SMC_POWER_PROFILE profile)
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
same for return value here as well.
> +
> +	if (ret == 0) {
> +		 /* Clear the bit for the submitted workload profile */
> +		adev->smu_workload.submit_workload_status &= ~(1 << profile);
> +	} else
> +		DRM_ERROR("Failed to clear power profile, error %d\n", ret);
> +
> +}
> +
> +static void amdgpu_smu_idle_work_handler(struct work_struct *work)
> +{
> +
> +	struct amdgpu_smu_workload *wl = container_of(work,
> +						      struct amdgpu_smu_workload,
> +						      smu_delayed_work.work);
> +	struct amdgpu_device *adev = wl->adev;
> +	bool reschedule = false;
> +
> +	mutex_lock(&adev->smu_workload.workload_lock);
> +	for (int index  = fls(adev->smu_workload.submit_workload_status);
This can be kept outside the for() for better readability and alignment.
> +	     index >= 0; index--) {
> +		if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
> +		    adev->smu_workload.submit_workload_status & (1 << index)) {
> +			amdgpu_power_profile_clear(adev, index);
> +		} else if (atomic_read(&adev->smu_workload.power_profile_ref[index]))
> +			reschedule = true;
> +	}
> +

This block can be re-arranged a bit for better readability, pls consider:

for () {

     atomic_t val = 
atomic_read(&adev->smu_workload.power_profile_ref[index];

     if (val) {

         reschedule = true;

         break;

     } else {

         if (adev->smu_workload.submit_workload_status & (1 << index))

             amdgpu_power_profile_clear(adev, index);

     }

}

> +	if (reschedule)
> +		schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
> +				      SMU_IDLE_TIMEOUT);
pls check the return value of work
> +
> +	mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
> +				 uint32_t ring_type)
> +{
> +
> +	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
> +
> +	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +		return;
> +
> +	mutex_lock(&adev->smu_workload.workload_lock);
> +	atomic_dec(&adev->smu_workload.power_profile_ref[profile]);
> +	schedule_delayed_work(&adev->smu_workload.smu_delayed_work, SMU_IDLE_TIMEOUT);
> +	mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
> +				 uint32_t ring_type)
I would prefer if you can split this patch into two, one just to set 
profile, other to clear profile and schedule work.
> +{
> +	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
> +
> +	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +		return;
> +
> +	mutex_lock(&adev->smu_workload.workload_lock);
> +	cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
Please check the return value here and proceed only when we were able to 
cancel successfully.
> +
> +	amdgpu_power_profile_set(adev, profile);
> +
> +	/* Clear the already finished jobs of higher power profile*/
> +	for (int index = fls(adev->smu_workload.submit_workload_status);
> +	     index > profile; index--) {
> +		if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
> +		    adev->smu_workload.submit_workload_status & (1 << index)) {
> +			amdgpu_power_profile_clear(adev, index);
> +		}
> +	}
> +
> +	mutex_unlock(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_smu_workload_init(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_smu_workload wl;
> +
> +	wl.adev = adev;
> +	wl.submit_workload_status = 0;
> +	adev->smu_workload = wl;

Why do we need variable wl at all, which is a local variable of the 
stack ? You can just do:

adev->smu_workload.adev = adev;
adev->smu_workload.submit_workload_status = 0;

> +
> +	mutex_init(&adev->smu_workload.workload_lock);
> +	INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, amdgpu_smu_idle_work_handler);

Are we missing the respective amdgpu_smu_workload_fini which will 
destroy the mutex ?

- Shashank

> +}
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> new file mode 100644
> index 000000000000..09804c3d2869
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
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
> +#ifndef _AMDGPU_WORKLOAD_H_
> +#define _AMDGPU_WORKLOAD_H_
> +
> +struct amdgpu_smu_workload {
> +	struct amdgpu_device	*adev;
> +	struct mutex		workload_lock;
> +	struct delayed_work	smu_delayed_work;
> +	uint32_t		submit_workload_status;
> +	atomic_t		power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
> +};
> +
> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
> +				 uint32_t ring_type);
> +
> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
> +				 uint32_t ring_type);
> +
> +void amdgpu_smu_workload_init(struct amdgpu_device *adev);
> +
> +#endif
