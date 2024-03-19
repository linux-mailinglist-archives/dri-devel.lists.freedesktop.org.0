Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E702287FDA6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 13:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D670B10FA65;
	Tue, 19 Mar 2024 12:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HX9GI8H7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2134.outbound.protection.outlook.com [40.107.94.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282410FA5A;
 Tue, 19 Mar 2024 12:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM8zuCZuvbhrOO1MCowau85xqiwQDzcTR8Dn2jz5j1GWsQH8hbUK6mqrt25U2mOjCdfsEiGEQc+A/h3LvIk/V41TSahjKmJCGtTn3ohjHQoZvSU73I+BBAL8rkIBd7FW3/T6KFTpVL3UHiA8D4eEMHEWGVTGTXRKszxiiRC5pi9xdLaadCjWQf4Mg/Ycng2Mov07AKubmO+U90/djkalo8HnoQW2Ams5/jXBgJZvxyg+i0eVc79pYyJdGK64C+JJ1nCsFTu+kg7YiTt4vm47VJ7q/4AN+IVl6SZnIYasENQ71qzpMRJY8zwsJemOmigaBRGsqN5YzxrtsYZU9YWc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hpcd8jzUYZwSWdO9aZRk6ZMM7WcB4d5eLijmcMTxGI=;
 b=XrnbHT6sN33n5Vj7MQZYarHhILUEwv0QgxxREbFuT60lI86VY+kwT+qCAHWcoCcD1qLZHanYeuDos5547Izp7JzALaH1c3/kw2+Xu0FRCHk6kB0FWe2xDGekbRsiysnZyZ7Hgwm636m8Woqe/Jzy++6glg6uEnsqGa4g2Wd//3vRO/KWaqdIXZ9dL73DqjlLNlBDNhxebIJtB/8NXNvwd/nlhviNulZQuXIzCzwPbrRNWSwFodL2NHrLScSnYrpSrei99Ol5vozPii7V4OsdeVL3dnEg8IZ0bPN4u59k3uqg90soyL8+VB9ymyd11jBU+369GalgQDgyTsS52IBKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hpcd8jzUYZwSWdO9aZRk6ZMM7WcB4d5eLijmcMTxGI=;
 b=HX9GI8H7BrCQA2geBGrHHlOdNgr7LNkeLBDOJ+t5GGHnf57nQOSGUPtGVi8DzvKskjsgn5PuIIFmdULpM7OCvU0MNZSLR8ccaokbmVz4BQgSd3V3/aftCDy3g7r8H71GNdD2jX2PVy0Dqu6ACHVJg0WVv6jnbWsKoJDBX1N85x0=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Tue, 19 Mar
 2024 12:35:58 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 12:35:58 +0000
Message-ID: <8802c91e-e852-4c6a-a02d-8c3c9a409051@amd.com>
Date: Tue, 19 Mar 2024 18:05:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <20240319123208.851901-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::31) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|DS0PR12MB7747:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ad64mVUGRUhRlTLvpRDEiUg9WZ1GV0m5bnNQucd/KwuCb74T/YM5Ba8SZLRiItfhdr9e3tRva8MtO7OKGz7ddVW/JQCqhFEvzPcv8me9+G3pmAYIubwcOxW0DGC+czazI9CRdBMJMHGjJbp2gmL7xOa4UqH5k86CBBTx6LLPhFrQpnCAHlfF/uQGeS1xv5VCUxg3E9k+hCOJYzGQxBsBtS9Ynsr7rRxi6flQBIpWN3ghKLiNi2v0Yu70+t+56Fh91qIIHcLNeY7tSRyrNK0H0kuiV7CfW7x94FAWyQ5xPEtj4r7PJ1pH9BIgE34z99ZFHL9c6ko2jk6XYMdHrmvLdUPo1h8xd/W24lmfEL/XdiBja2vzVvOegmlkLlhSLs2BkBYFMscO7xjMvKAn1EmvMo8l9oEEWE2FMNyLFOir9rec7YDGJdMLJSs7quDukd59kRT+BNU6jtncDuFPWcCWz1eO/AlsTNqoixb+Hp4HKm28gShoPuFt3tb1gqmqJ302zg50j+KSECgcLOuXzZbomTsOPXTMKf4hLQ2k/ZemnWgTDOUucL3DsWgMwjYAl5QFltaK8pAym5hv2pQZL5ThqxjcuMlu3yHLHZnaOrvAxDtmNNOoN4e2PoyuPzpET77aYH8PWClM26ueioxdgpbq7QgGlpwsG7gVBSrGVf8Zb8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk5rcnJIWFdSOHhjUTJ4SkFtejZMcGdQUUpMVzU4RnlQYTlOVmpWeXdUT0Vq?=
 =?utf-8?B?ZVN2YTRjSDRpOUJKc2EzaEI4NFBsR0VVNmQwMGhjR082N1R1V3Z2U3dOUVFi?=
 =?utf-8?B?Z1Y1OGVNQ3h5bmtZZXR3c1ZuSUg1dFgwMG5ubzZYd3FlTU13cnoxbEkyTEVC?=
 =?utf-8?B?RG1Ud1VKUW13L0hDK2VaRFdtd3NJVTNqQ1Zzdlh3aTBSbVZEeHU4RUpHRUZ1?=
 =?utf-8?B?Nkp5WGY4ejRsa2c0Y3VWQ25EbXNJZmZxUHc1UWFMVU9iSVlmYXRPUDFWdjlS?=
 =?utf-8?B?REtwd0xkSGxtYkxsbkd6SVBuZ3BDWG9nYS9mU3VkNGxSV0duZkFabytLY1ZO?=
 =?utf-8?B?RHlDeDMrcUNPTFNGcDVYTEQyaFFLWWQvK09UTndTc3Jsb0FNeGh1Ui9hbzl1?=
 =?utf-8?B?aGsvdWFRbjhvUzJYQU41NEJzMm9sRGs0c0srZG9QVjgrUTl3aHZsWDdWYzA0?=
 =?utf-8?B?WDI0QVV4ZDlTMTZXSHN6VU5kQVc4WU13bTV0WEY0cTd2SG5EMW9sWENHdFZD?=
 =?utf-8?B?Y2N2bC9GaW8wdGhtaTlSeFk1aHRhU0tUZzhSeTltZDk1Zi9SVUFETnhJSWJN?=
 =?utf-8?B?bm9mT0wwaEpRVVhTbWtuUnExeEhPQ0l0dldCRUxjRnNyQy9DRGpFWTJtQUxB?=
 =?utf-8?B?OFovN1RSV2dueDQvRDBSWXUzc3NCY0dZOHQ5L0JyY21RTXd3b1RsbDRGcVFk?=
 =?utf-8?B?bTBPUkdNNDNqQ3FZU09ZYWlmbk9CR3hzZ3NROXZISitKZEpWVnFSTiticXow?=
 =?utf-8?B?WGRiTERKcmZZSjA2UXNvOVFPd01yYk9TMjR2aUwvZG1pQVlyYU1iMUc4Y3JQ?=
 =?utf-8?B?Z1RkTXN1Z25oNTd3TWJoV21ZZFh0dWM5SE9ReWhZckN0K1pMVGlRR051TDFi?=
 =?utf-8?B?K3U2VlFjMXFKRWcxUjczeTlYNHNPZ0RDWWp5b2NWV3RHTHZra25saWpXNzJh?=
 =?utf-8?B?QzNUMWdqS1FKME11UEc3d1JVNWVSVkdETHN2dys5VUpkU1FHdzJsTUd3Wi9J?=
 =?utf-8?B?dC9GM2lXdUNndDJaemVJeFhBb096SmFHUEE3a1VCQVhudk5adUx5VEZ0cXc3?=
 =?utf-8?B?cGVqN2ZVaHIxdGdjd1JGQjZmRDg2SEFaK1BlSHFEeFdGVG5pQXFENWxLSVNs?=
 =?utf-8?B?M2ZUTVVEMVZvNVZjSGRzREZCZjlFUlcxQ0NvUmZxL1ZxdXY0VGpzUjFlT1R0?=
 =?utf-8?B?Mk42YVc2aTdyS2xCUEtqeUJOMm5wSEZPSHpNZkxKaXN6amdlYmFGZU5mNHlQ?=
 =?utf-8?B?dklnSEdqdzJJSkJLWElJM3lJS1lLdGFhcXlXVEluTFdBOFV3cDZTb3Y3UDdh?=
 =?utf-8?B?enVnQUNwMUhTem1IeGRVZ2VlZ09WYmVFU2JJL1F5Zk1JTDl3Z3NMUTlLQTJR?=
 =?utf-8?B?ZkxEcUl2VEd0K3BVMWVkWFFxcjR1N3FCT0VLcjd6QnF4L2ZGcjd6dmFQRzEz?=
 =?utf-8?B?MEdJRUdSSzc1MFZLRk93dXlsa0l5Mjk1dTU2Q2NKTFNkQWF5ZDBJbVdRd25B?=
 =?utf-8?B?VlN0RWdPVW9mUTA2TXQzei9VZDlPcXFucjY2YlA3RVpZRzNyd3JtN04xVkd5?=
 =?utf-8?B?bEZQVVhlWGlSbEtZRDEwZDRHR2Q3RnZ6bktsOE16UHdOS2c4cTBaaE8rNVN3?=
 =?utf-8?B?WVZIWWxoeksvSVN5aDA3RFNkaFlwdnd4Vmdkc2ZkelB5WDB3eitldGxLQ2dK?=
 =?utf-8?B?eHVvcGtHT0tCU1M4SjNHOWM2UFVQNE12N1AralFVTnZNWU05T3EwMmgvajZ1?=
 =?utf-8?B?UzRkV1dnUUlCTHVZVlFVKytvU3p6T1NyU0hURWduWHBEbnFlaVhidGtRcUpr?=
 =?utf-8?B?ZUt6VjMvQUd1K0xYRVlUSUg4U3dpSkZvYUljNlRESVVUSzlVVklvczVMVHRH?=
 =?utf-8?B?b2VacmtHa3BRd0Vxd0R5MVFCOXhyMXFDandWbmVyMG1rSk9tSXc2dUV4TCta?=
 =?utf-8?B?Wm1HeDhpM05NelBGc2lmSG9veUc1aDhPckQ2TzV3UU5NQ3pzMGp5eG03M2p1?=
 =?utf-8?B?OG1TK04yK3Q5YnRnazVnWkdrOXFpWjN6aVFyRlNPcWdiZWhSRjFESElwZ0ta?=
 =?utf-8?B?eTBEREhyT1h1SlBCejRadzFrTFY2UU9INWFiM0NhcWNIRVc5N01Ud2hObnZR?=
 =?utf-8?Q?Kyrwq6FKK9Wd51g/H8gGWDWIW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cc5632-9856-4890-2637-08dc481120e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 12:35:58.6603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoeSZcUI/fMrT+/gwqDPUu9fFajKNlCjpZ3vTfiBrxVni+w2oLeW83n/VlbAE3nfg/4fem9wRxlm6yiKaZIHDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7747
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

Validated the code by using the function in same way as ioctl would use 
in devcoredump and getting the valid values.

Also this would be the container of the information that we need to 
share between ioctl, debugfs and devcoredump and keep updating this 
based on information needed.


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
>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>   4 files changed, 157 insertions(+), 115 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 4536c8ad0e11..05d34f4b18f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>   	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>   	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>   	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> +	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_devinfo.o
>   
>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c62552bec34..0267870aa9b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>   extern const struct attribute_group amdgpu_flash_attr_group;
>   
> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info);
>   #endif
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
>   	}
>   	case AMDGPU_INFO_DEV_INFO: {
>   		struct drm_amdgpu_info_device *dev_info;
> -		uint64_t vm_size;
> -		uint32_t pcie_gen_mask;
>   
>   		dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>   		if (!dev_info)
>   			return -ENOMEM;
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
>   		}
>   
>   		ret = copy_to_user(out, dev_info,
