Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07B87FF12
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF310FAE0;
	Tue, 19 Mar 2024 13:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UYrvhi4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2106.outbound.protection.outlook.com [40.107.243.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C352A10FAE0;
 Tue, 19 Mar 2024 13:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9VxflPkOj55OAmWIbwrH0U7ELCUrgWPxqfmv3Pc2509n0xhR4qD4tZQSfl7EBDSoPEmLeTEOsTGJJ+DttlAWr2zH/rkJZKXLLg31uwXBTZ2skeHODIXjacz7OhFSD0EceB3IFX90pstkLPkMgD2fiWrtUDR/Vb9AbCU+pA6pmy71Hrp4ANcoLLqDZlqZ0evGvbinFKbXtH8/9th+D1CxQvJ18BQx0wzxjyIp+mSYWRz3Nc3XERERrytevBXQ/A+1ELqykH1qCsb2BwlC4zSFRqlQ3Q+YXeWMQNEv1XkW+KPIkI3I0S4U2aagA2ycOq8In78wFCwHFUK2LX/f3Uusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNk88maXo4199jHeaFfIF+2Q7ptLezhselaFoMiJQwA=;
 b=NXVggiKsEDXORWj/pdsbITlCV8KAp1S2JA60T7b0DcNhaBWgG/hdols7iRlOu+DDuokfAAdF2/OlW5j0pEkwAq8CyhSZ6BdhQFTiQ7MafowFFUTD3LU7OpakgOyS+dTvLtg/DK2e/L9q28rJQRIKCtr8Jyds22qQz5Cg4ULBD8ZskvNoAKaJETCkBEb+KNAOhiSBdWMVWM4mNswh3nukP4gxr65GyAyqIUPudZgTaRpK1pDLEGzDAHwCHo9dE/RncA5JcqQ/JXgOzjgNFjS9kxoK7Dmg/ewD879nJnwii5CUgHk/7jW94l6LyDawDep5YzxdNX/hRtdP5+rdct1YkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNk88maXo4199jHeaFfIF+2Q7ptLezhselaFoMiJQwA=;
 b=UYrvhi4HXvsM9G2CRTMKVDp36tiDUo15Ne+QH+MZtExZq9KrTib0PmOZA71B9qVtSLwXskVkpzmjfmT4DjHTf5wL39OTSAdOPRG1Asw9OIB29632WSUua1PZrhifeFrUZmF3cNqVTro+Yqyz4bCZ4nPTps5rGyOK01pD7wmsa6k=
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 CH3PR12MB8356.namprd12.prod.outlook.com (2603:10b6:610:130::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Tue, 19 Mar 2024 13:49:14 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::f349:addf:ae3e:814]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::f349:addf:ae3e:814%5]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 13:49:14 +0000
Message-ID: <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
Date: Tue, 19 Mar 2024 19:19:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20240319123208.851901-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::31) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|CH3PR12MB8356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6Ci0U2y3FCO9uOuEPNe+p8E/uigyugUS2UsSxhJdEnGNixGffeGgHsv1m+bwZ7rKGnxq8gA1KXG8JHuF3u10chxAL9OzIpz3rd04CxF4AtXkmtMcWAY3JO2W6pfqrficj+rvVzOHXht++epM3mgfQL7m6e0RZ3XuhSBgWY0QJ87KFomGWLacatOpmdLv0+L78n9NGZ7aMIellIHUdzSzRapTMya5bciVtyHZxNdkSbu1aSPy6tBxPWV8ipAf/jEMbPMh1ReWrXx1tfgDGjV+Y+ICsk83i/MCliw4gTapVVezR1jVwe16UlgkQ+w9ECJpZx+qxfroph/ev8xECIOaxbImQnB4GQEeLjVRR6Yyw+lTRPMS7jONsex3K+/Yk2L8RujrtZ2n84hUkzqkWqzLhAp+ljgatY5AWj5j36hx+gknaV33v1pErRN7DhY6V8IwJJZDAT/LDTzjGezkGXKbylIm/YZLbMTj9aMGn4YkcnqQGeEZqLAL3QDeKRuMISzXcRCcm1kdn+JMvvt15zYmUZn0kNHkC/8QA4M2zMz2bx0A28J/bqtnrRY3wb7n0lXvcVqbpl7aqXTLnTdUq40JNuDIRNnfU/AuaHCTxJ9Z9TnitHsi+Cxj7HEb/Hfyq5H4z7hAg3EIFzYCbC82YSg5AHowyJi/bBmfq3EVY9Y638=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REltbFpKdDl0MWRNSzVva0FTQ2U4RjVnd1dpMFNNMVl3MmdWVmdWZDNkVzBs?=
 =?utf-8?B?aUl2dEVXOENIQTNXUW5vT0FsWDBYTjRGMGdoWG4rWWltN1BGY1V3WlNObHFG?=
 =?utf-8?B?UTlLOTI2eGV5MkVLUDdhU2llQVpMZ1lBYzV3ZHlPTmVBZTR5aEpKTVBIQ1Ey?=
 =?utf-8?B?N3h6eGRkQ2srYzNEejZydTZBNW04a2pLMlEzZndWQXFzb1BvNTNyU204c2kw?=
 =?utf-8?B?aFgrck95cXZUYy9RK1BRcW4zTU0vSzJkdmpTcEM5MHgraUd6cnUrREFaRWhu?=
 =?utf-8?B?TVQxVUptbjJMVTFFbHI3ZGExTlB3YTV5bVBjYUlzZmVDNUxrME13Z1I5YU5C?=
 =?utf-8?B?WUJiK205clFyNmE1SS9YZFZyMERZUXJJdzJVZXlrMzNjckU3dEY2L2hSYk9T?=
 =?utf-8?B?WkZQRjcwcGFBOFRENHhYbGpwVlluTWtpQUhBOHljQlNOT2JIbG5mN2FZWmJ4?=
 =?utf-8?B?ckowWFBlb0drVm9uUThYLzAzOGp4WTJIVSs2ZUI3T0VZdGJoemttdEZQTnZt?=
 =?utf-8?B?MDFVQlRSeU00dkZqbGZLUk1YRVhVeWtkSWsweVArMWdTbGtmdTU0WnJnV3pJ?=
 =?utf-8?B?MTlQS1RwTHFMSGZQNC8zd2tWSlFBbUxCN05IVFhsdGY4Tk03dmsyenE0UmZ6?=
 =?utf-8?B?Uk9HZThCdUJ2Ymgxb1E3TkkxaVFxclAyQkFocUlkZit2U3pSL1ArRmUrZFZ2?=
 =?utf-8?B?NlNFRm1OQnBtMmxpWk96YzgvV2VaemYyZ0FyTmRsODFVNmlyUGh5enlKaDZB?=
 =?utf-8?B?OG5ieU92UDhPR09oOUlEc1V4bGlBeGhDTlJNbVhhOXp3NDY1TlJ4anZJWGph?=
 =?utf-8?B?ZkU1NndROVdRcjBFcVJCUUJ2MVkwdnd6Y0NWWFJNemlHSlpidnJjbEg0RUha?=
 =?utf-8?B?Zzk3OGp4K3lzNHBzQ2FDQlVXOHFjN3hVSzdMSnRpRlBWWVJjT3ppYUo5c2Iv?=
 =?utf-8?B?emRXSG8wZkpJMGg2aGQ3TldTN1MydVBXNjNvdURsNVREZStkUFNVeHppUkFX?=
 =?utf-8?B?eEQ0Yi9xdE0vMEJpRnRqRHo5aUhzbXdERmZnL01iOHJYS0d4OXNrczltNFRJ?=
 =?utf-8?B?MnZpVzJSWjBZdWFrYnJwU2lScmluSnBzQi8zS3lWSk1nQmd6QjRwQmk3MURr?=
 =?utf-8?B?aWNPNU53YnB1TjNrQ2pZcWVYU2VYQXBkeUVVM0doRk9XeDBYUlN6V1p4enFT?=
 =?utf-8?B?M1RZUGI4eVVNVUNWWGJ2ZmdLMW9jbFRLTEs4aEtnRTN0ZUNKS0RNWS9MY1Ax?=
 =?utf-8?B?OGZrWHM5aFJyM25LLzhFWUVRREpLaGVEc3lXSnZRSCtETFdnUy9SQ2Q3SjlG?=
 =?utf-8?B?ZkJkWk0vdGtwUDB5SUpDMlV5RWQvQkliUkpuZ0VwM3BudUFYVW4xb2l4WlM5?=
 =?utf-8?B?cnU1TUp6OE14QXVCSlpreW9nbFJIazJEZFlDRTh1c2NLQzdoNyt3ckpVSzFt?=
 =?utf-8?B?QUJIR2NjSlZqVkFFWnJwWURQNUVMZFVLeFN4MUxYL0d3NmRQSG9nNkE2NWFQ?=
 =?utf-8?B?MStROFZ6OGdCUVpLNUhhSlI5NVlmTFdnSzRCdWNVTTJ6ckxLNHZCNjZNbENx?=
 =?utf-8?B?bEFWTHd3WEtYTThUYkpDdDJ1WHhBQ0FXczFXQ2ZtaFdSMGNTcjNlRzdFck9H?=
 =?utf-8?B?Z0N0cEYrekRIQnZhMmNEQ3lYSnZGS2s0UmN5SzJTaDRJMktYUlgycGtaRkY5?=
 =?utf-8?B?TTdwSW15YnB1WGVXQXdvdnFJR1hlOGhZQm5jVG0xT2FkRlZwWWFFTTJFZDJP?=
 =?utf-8?B?ZmJZblYwV0UxMjlJeFhoUUd0dFhlZ2lpc3VOdlIxN3NmQnZWdFQ1M0kyUHdN?=
 =?utf-8?B?dFhIUk94RTRoa3pNN3kzeG5TUkIrZjd5SWZ0SFM0M0RNTnpUT1hrcHRYdGdh?=
 =?utf-8?B?SHhyWXRaVDlaM0VvRHFoTCtzc1hRUFlPcWpNZ3ZlVkZmWE5KS1Fpb2ZWQXA5?=
 =?utf-8?B?NzdTMnQrcXltRVRTMVMzNVd2aUdsWXo2VCtZemFRQ0tnNkNhWjN4UnJzdHBa?=
 =?utf-8?B?b25lVTJJUFpjZXJkUU1MNGRVL29YYzEzZHBzbGZvL2RRRjV1a3M3dEVLN2xM?=
 =?utf-8?B?U2ttWmxrdzBDNHlEOURVNVJkY0RxdHZEZk1lVVo2NDkwL2swUXhSSUd3Y3Vz?=
 =?utf-8?Q?Xu4noOfM4ZzlKSbbu6lh2YCvn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ca2051-aa67-41ac-8013-08dc481b5cfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:49:14.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBGu3YiaEVc7VskWph7SsWuk0+HUcxtTV5vmrhd3Ya3QU15BJeg4H+vEXXYX0cvw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8356
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



On 3/19/2024 6:02 PM, Sunil Khatri wrote:
> Refactor the code so debugfs and devcoredump can reuse
> the common information and avoid unnecessary copy of it.
> 
> created a new file which would be the right place to
> hold functions which will be used between sysfs, debugfs
> and devcoredump.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>  4 files changed, 157 insertions(+), 115 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 4536c8ad0e11..05d34f4b18f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>  	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>  	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>  	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> +	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_devinfo.o
>  
>  amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c62552bec34..0267870aa9b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>  extern const struct attribute_group amdgpu_flash_attr_group;
>  
> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info);
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> new file mode 100644
> index 000000000000..d2c15a1dcb0d
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> @@ -0,0 +1,151 @@
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
> +#include "amdgpu.h"
> +#include "amd_pcie.h"
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info)
> +{
> +	int ret;
> +	uint64_t vm_size;
> +	uint32_t pcie_gen_mask;
> +
> +	if (dev_info == NULL)
> +		return -EINVAL;
> +
> +	dev_info->device_id = adev->pdev->device;
> +	dev_info->chip_rev = adev->rev_id;
> +	dev_info->external_rev = adev->external_rev_id;
> +	dev_info->pci_rev = adev->pdev->revision;
> +	dev_info->family = adev->family;
> +	dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
> +	dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
> +	/* return all clocks in KHz */
> +	dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
> +	if (adev->pm.dpm_enabled) {
> +		dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
> +		dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
> +		dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
> +		dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
> +	} else {
> +		dev_info->max_engine_clock =
> +			dev_info->min_engine_clock =
> +				adev->clock.default_sclk * 10;
> +		dev_info->max_memory_clock =
> +			dev_info->min_memory_clock =
> +				adev->clock.default_mclk * 10;
> +		}
> +	dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
> +	dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
> +		adev->gfx.config.max_shader_engines;
> +	dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
> +	dev_info->ids_flags = 0;
> +	if (adev->flags & AMD_IS_APU)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
> +	if (adev->gfx.mcbp)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
> +	if (amdgpu_is_tmz(adev))
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
> +	if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
> +
> +	vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> +	vm_size -= AMDGPU_VA_RESERVED_TOP;
> +
> +	/* Older VCE FW versions are buggy and can handle only 40bits */
> +	if (adev->vce.fw_version && adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> +		vm_size = min(vm_size, 1ULL << 40);
> +
> +	dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
> +	dev_info->virtual_address_max = min(vm_size, AMDGPU_GMC_HOLE_START);
> +
> +	if (vm_size > AMDGPU_GMC_HOLE_START) {
> +		dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
> +		dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
> +	}
> +	dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> +	dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> +	dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> +	dev_info->cu_active_number = adev->gfx.cu_info.number;
> +	dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
> +	dev_info->ce_ram_size = adev->gfx.ce_ram_size;
> +	memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
> +	       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> +	memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> +	       sizeof(dev_info->cu_bitmap));
> +	dev_info->vram_type = adev->gmc.vram_type;
> +	dev_info->vram_bit_width = adev->gmc.vram_width;
> +	dev_info->vce_harvest_config = adev->vce.harvest_config;
> +	dev_info->gc_double_offchip_lds_buf =
> +		adev->gfx.config.double_offchip_lds_buf;
> +	dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
> +	dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
> +	dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
> +	dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
> +	dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
> +	dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
> +	dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
> +
> +	if (adev->family >= AMDGPU_FAMILY_NV)
> +		dev_info->pa_sc_tile_steering_override =
> +			adev->gfx.config.pa_sc_tile_steering_override;
> +
> +	dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
> +
> +	/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
> +	pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
> +	dev_info->pcie_gen = fls(pcie_gen_mask);
> +	dev_info->pcie_num_lanes =
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
> +
> +	dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
> +	dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
> +	dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> +	dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> +	dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
> +				    adev->gfx.config.gc_gl1c_per_sa;
> +	dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> +	dev_info->mall_size = adev->gmc.mall_size;
> +
> +
> +	if (adev->gfx.funcs->get_gfx_shadow_info) {
> +		struct amdgpu_gfx_shadow_info shadow_info;
> +
> +		ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);

This failure is ignored in the present logic and rest of the information
is filled. Probably, need to continue the same way.

Thanks,
Lijo

> +		if (!ret) {
> +			dev_info->shadow_size = shadow_info.shadow_size;
> +			dev_info->shadow_alignment = shadow_info.shadow_alignment;
> +			dev_info->csa_size = shadow_info.csa_size;
> +			dev_info->csa_alignment = shadow_info.csa_alignment;
> +		}
> +	}
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index a66d47865e3b..24f775c68a51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  	}
>  	case AMDGPU_INFO_DEV_INFO: {
>  		struct drm_amdgpu_info_device *dev_info;
> -		uint64_t vm_size;
> -		uint32_t pcie_gen_mask;
>  
>  		dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>  		if (!dev_info)
>  			return -ENOMEM;
>  
> -		dev_info->device_id = adev->pdev->device;
> -		dev_info->chip_rev = adev->rev_id;
> -		dev_info->external_rev = adev->external_rev_id;
> -		dev_info->pci_rev = adev->pdev->revision;
> -		dev_info->family = adev->family;
> -		dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
> -		dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
> -		/* return all clocks in KHz */
> -		dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
> -		if (adev->pm.dpm_enabled) {
> -			dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
> -			dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
> -			dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
> -			dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
> -		} else {
> -			dev_info->max_engine_clock =
> -				dev_info->min_engine_clock =
> -					adev->clock.default_sclk * 10;
> -			dev_info->max_memory_clock =
> -				dev_info->min_memory_clock =
> -					adev->clock.default_mclk * 10;
> -		}
> -		dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
> -		dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
> -			adev->gfx.config.max_shader_engines;
> -		dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
> -		dev_info->ids_flags = 0;
> -		if (adev->flags & AMD_IS_APU)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
> -		if (adev->gfx.mcbp)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
> -		if (amdgpu_is_tmz(adev))
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
> -		if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
> -
> -		vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> -		vm_size -= AMDGPU_VA_RESERVED_TOP;
> -
> -		/* Older VCE FW versions are buggy and can handle only 40bits */
> -		if (adev->vce.fw_version &&
> -		    adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> -			vm_size = min(vm_size, 1ULL << 40);
> -
> -		dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
> -		dev_info->virtual_address_max =
> -			min(vm_size, AMDGPU_GMC_HOLE_START);
> -
> -		if (vm_size > AMDGPU_GMC_HOLE_START) {
> -			dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
> -			dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
> -		}
> -		dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> -		dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> -		dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> -		dev_info->cu_active_number = adev->gfx.cu_info.number;
> -		dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
> -		dev_info->ce_ram_size = adev->gfx.ce_ram_size;
> -		memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
> -		       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> -		memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> -		       sizeof(dev_info->cu_bitmap));
> -		dev_info->vram_type = adev->gmc.vram_type;
> -		dev_info->vram_bit_width = adev->gmc.vram_width;
> -		dev_info->vce_harvest_config = adev->vce.harvest_config;
> -		dev_info->gc_double_offchip_lds_buf =
> -			adev->gfx.config.double_offchip_lds_buf;
> -		dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
> -		dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
> -		dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
> -		dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
> -		dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
> -		dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
> -		dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
> -
> -		if (adev->family >= AMDGPU_FAMILY_NV)
> -			dev_info->pa_sc_tile_steering_override =
> -				adev->gfx.config.pa_sc_tile_steering_override;
> -
> -		dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
> -
> -		/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
> -		pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
> -		dev_info->pcie_gen = fls(pcie_gen_mask);
> -		dev_info->pcie_num_lanes =
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
> -
> -		dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
> -		dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
> -		dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> -		dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> -		dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
> -					    adev->gfx.config.gc_gl1c_per_sa;
> -		dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> -		dev_info->mall_size = adev->gmc.mall_size;
> -
> -
> -		if (adev->gfx.funcs->get_gfx_shadow_info) {
> -			struct amdgpu_gfx_shadow_info shadow_info;
> -
> -			ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
> -			if (!ret) {
> -				dev_info->shadow_size = shadow_info.shadow_size;
> -				dev_info->shadow_alignment = shadow_info.shadow_alignment;
> -				dev_info->csa_size = shadow_info.csa_size;
> -				dev_info->csa_alignment = shadow_info.csa_alignment;
> -			}
> +		ret = amdgpu_device_info(adev, dev_info);
> +		if (!ret) {
> +			kfree(dev_info);
> +			return ret;
>  		}
>  
>  		ret = copy_to_user(out, dev_info,
