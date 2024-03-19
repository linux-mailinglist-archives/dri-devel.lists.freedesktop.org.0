Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E08C87FF2B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C3910F9E9;
	Tue, 19 Mar 2024 13:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SsxySMyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2092.outbound.protection.outlook.com [40.107.223.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED76F10F84E;
 Tue, 19 Mar 2024 13:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAVHHdzXFPtfVRhBg27u9gNdtcpvLUqgI/c4optPedl8pSfoc3ApXAi8h3ObjNXma0o8dJs2fdgdQunDVpwXeK88R2PoWNmZej6qOccxQk40xbWpDUc4q4Quf5SE5FBqbU+RsXSZFxHSqRkh0F+i0A4akU/Tb3fFICjD41YVqtAVVKcnwU6uNhB7b3cgbD3n42MiYOBG4mEVSyR1AJZ8ZW+k6ZorNkrt/E1sXBnHnz44l14CTKReicq4poK5kUUaZToxUY+eWoBGIfOx4gVk7eAKSSJKhiPNTVTUm5RMxM/XkLzQPsaWFR5oNNVMyNm/StzKbUNkRX1mMJqSOa9cCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZG9igYOFkqNuSL/qcV5BE3MnlyLhCrwm5xA4LzBriQ=;
 b=KwaHyOqiYMIrNxDxaJrrdU2/YwlfqD7BrzwpJoTF7KQVxNY4MtYw2xLeze/avfSVlwLyo0kKs0HFfcdbKOMjkAD0DJfg3Du+kNKzwztYm3B5ywwppC99ERnjUzgC7RGEbrQtQTe+eX9Dy8SrCdnkXWOx/SomgeZMWCe5Shj8C1k+JEXZkkkonQuUE7d5xfbD4e/y96Gh8qLGMFoq7PyGYwaqaJr9To8I1CFZSWYFhJ1ova8jkrJ6o4660uZ2LRm2UQT7z7MJXGcWpQQE03bDhop/N0oT8RodpJ5M5hBBXIV4zh3dzxIOUN1VwjtZoq/VP8N39UjEZ5GtPaLod14WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZG9igYOFkqNuSL/qcV5BE3MnlyLhCrwm5xA4LzBriQ=;
 b=SsxySMyVmbFYgXO/dTxK8xiNPf8rdEOYzNwdzjPMIiLORYufFr5/znzpG3S3OPlO5wuAirme8zVEqFwkxYFi5jmykFmvFTdX2A9hiP1j6N0YCctycqi61RHxKVeZmzopyT1cNVEWoetFBuUlFuwHEaX/X2L069WnZn+4xUkdbjY=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Tue, 19 Mar
 2024 13:57:30 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 13:57:30 +0000
Message-ID: <bcefa332-d29b-4fa0-9195-39dc77625e5b@amd.com>
Date: Tue, 19 Mar 2024 19:27:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::34) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|BL1PR12MB5827:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzTuQP+XY7uV1Z7HgU8nCGOMmsDjf3txC23zrv0LRaDzTjxSdQvXw/QdUeg2FL5iZ5TynEz8/pSbsX1XZT0f3oHyy+Z3OQ9Fi2VI8T//j8kgQzcgpGdiAEr0NG7ytupsMFfSuAvHR0mfUj+CEgyvyIffQXqtU8v9ZwIslV47fZX8Rg6vny0C4gV2cqczyIrYwsKDZOALc3risYYglLaGmmNi5BUw3zrFEbZr1PCV7OZHqW8HZ1UOLI9hwylQ/AqnTkGOdEkZf44iG9dA+8O8XxvVKJLopNTd6GwvxT206V0M1p99idBOE6dxZCzD01ercob1S6JcBEkeEz9rUW8503gN6iXu76AEUpvaOWNFocmUv4Lt6t/R5XAq4t6au+FT2HNt9zroLZSqm8sat04A78raNZEiowXGuWUt0+8cJjg3YOp0n5sMtBwujlhVjgANS8UcGqNunTzj7PKyHTN7b4s19+0hGXM/hve1Q1dPJey/FNNBAaB9LtS/m9HeDa0ViR/wv/raD5k2Kz3h8BMAIcG1sIIJrA382zWsBWDPjP2ee8r1zsyeKb2j6ZI/C1sAAeo3qZr0ocE+ZhtEfBOFWIx95WHyN4Uxs26chOVoPyrGM46krUcMz+cviRcPYXBgwHALkj5Gxt/YNhRWYemC7cLJaJo7G+wi80/sGlrB8nU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFdIOWtjOWxMQXBOQ1JVM052T1BHdWxOZDRnRENYTjFjTWVDQ0NWKzk1YUcw?=
 =?utf-8?B?b1hCcmNqZ2NJRkhNRzBnaDk3OCtzSHFTYW5TendYR0cvellxenQ1ZlNhL0dI?=
 =?utf-8?B?Qk8xQXN1elVRNTFPTndxdGlGVy9nVEl4R1pTMEpleU0yOHlLM1pFWjJyeXlB?=
 =?utf-8?B?eVNnMXV0bFdxRE9XMFB6MWJ3VExTVEl4VE5DbVBZcGRLVjZrd3J0b2FORVp6?=
 =?utf-8?B?Ym5xa2M2VEdTMVdSNEpJR010NldCZEtCQ2RMTTYzQ0lwRWJSa1d0TUZLT0F0?=
 =?utf-8?B?a2F6TnI2RkEzV1BaRU5VdW45S013TFYrd0dEcUZYTHlkeGhFVkcxOFk3Tm43?=
 =?utf-8?B?QWltU3U3eVFBN3UwcGxuRVRMM0w3M2ViVE5qTjRmRWZ0YnhTZjBMOGpoZ0hN?=
 =?utf-8?B?Q3BGQVYvSVJhdFIvRUwzUGZISzhhWUllbVFoeDIwdXBqcFk1TGdaLzcxR2JT?=
 =?utf-8?B?L0xkQzI3dkloRDBiSndETjhvcVFVdk1YaW1LTnVKOEI4RGdheThmeHFQamhl?=
 =?utf-8?B?UTB3VFdKamZuNndSSmV6SVFxM3NLcU1zd2tMNGt6Q0tVTyszWXN4ZDBaeEl2?=
 =?utf-8?B?bDVuSXEzZkdHZHZaTlJib1hEaFNJc3VSZ1dQVmVWaXdNRU9YN3RjZ2J4RmtN?=
 =?utf-8?B?Y1RWb0ZxSFpMdDZ0Z2hJdDdwSkhLR3ZpNy8xN0xuQ3hxdWNwc0NUMnNKZTJD?=
 =?utf-8?B?SjlTZ0lHdW4ycHBOVjAzWENwcFJ3M0ZmY2hnbUo5MnFtYThjRXk2QkxDS2NW?=
 =?utf-8?B?bERjd1VJbFAyU3daOC9tNGFnTEhBMlRPeWR3VjBoLzM1SERRQVpKUmJZM3JE?=
 =?utf-8?B?bmNnVEtheSs3YTh5ejY3TzdCdmdMdEk1WHZFL0NEb3dDWFZQbU02T3pSOUpO?=
 =?utf-8?B?dGIvdUVuT3lNWXFaRGVSZSt0OEhlVnM0U1BkQWdYeStubTlzUmZyYWN6WHh5?=
 =?utf-8?B?eStuRGpVblBWUEZlYldzSzhjMndGeXppbjQ2NzR2MENMNTRNeU1rUU0yMkNT?=
 =?utf-8?B?RzdOSmdpRmh3Mkt3NTRubzJlQzFOdFJjajFIZVN1SVFEZklSS3dVd0s5UDZ5?=
 =?utf-8?B?L3QrVUFyeDBvQnBDaHZSRXllRnFFQ1VqSkMxQUZCcnBKRVcvck50SjJadXpa?=
 =?utf-8?B?bjViSDZaMFQ1MWJVdVc2QnRKUkpUWnUyVFJCWnBOdXIrbU96UlJueGEvdWN0?=
 =?utf-8?B?bDRuREo1QmtqWDJCd0Q1YzN5Vk1VNnNmKytRaUxkZzJZKzdFVS9ZRHQwbVRM?=
 =?utf-8?B?ZlNuYnhiRUNFV1l2OUU1MmNtV3E2aitFNkFBMEQ3WEF3cTlYaU4vNXB4Z1Zw?=
 =?utf-8?B?MUJrTTVTcDl5R0NBcHBLQTlld04wRTJ5MCtQdzlNMDZRYXZLeUZIQUZKZkdD?=
 =?utf-8?B?NHFQQ3cwZlJZZFBCOWowQ0d0NnlHSVRjQ0d3aytuTFNDYUcxa0tCSTg1YUJZ?=
 =?utf-8?B?RnZscWFlUVVYRFFGWGpFZlZwblhLSytLYmZ5MVhpYmxTSDN2WCs4aVptSUZY?=
 =?utf-8?B?NXRVRDdGLytqUUhEY0RHSGJOZHd4NW9MRTdSaDBxdkVrcCtEUndDckhDczUv?=
 =?utf-8?B?ZDJCcUNZMHdkV0ZzNEJDOWxnS3dnQm9TeWhkdVQ5SEsrcVNORXlkd29UQ0Zk?=
 =?utf-8?B?ZlNLY1gvdlg5VWJGcE1nQlpWelZ2b1pETTBsSldySzVOTVJsTERQMDVMMUl3?=
 =?utf-8?B?OCs2U2U3SE1zVFpxRUtBMmkrOHBMRHBjV0llOFJoNTRNYW5MWHE0M3lFcktC?=
 =?utf-8?B?UXREZnM3djJEdGQ1QXNjN2pmNldMZkJrWDlTMWlSRzkrVmxCRWdEOFM5V1JF?=
 =?utf-8?B?OTFPTjNUY0Flb25ldWFRR21iQnFFUzN1WWFNWHBxOHVLNTN6bU54MjYrQVlR?=
 =?utf-8?B?a1hidTMrRGdWMHpSTmVIOWx6dllvZ1NuejA5d2N0OStlUGhUbzZ3anl4TGpu?=
 =?utf-8?B?VWh3amRIVlQra29RRklKdkozaStldWk3UmxOVzdCVGVHWllJTVh2dEtseHdV?=
 =?utf-8?B?WG1icTZlSSs5MDBFSWM4VGtRdHNiSWhhYnQva0RxenVLSFQ5ak1PSGtlSWpm?=
 =?utf-8?B?ZTBybEV6Y3hRS2U1OGpyYldYbXIwVXQ5YUxZSmhWK25HSEdES2w5VmhxclBD?=
 =?utf-8?Q?QWQHdTYkA2ZGv7xIeDGkScSjJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab9fe30-ccfb-4e9c-b3ae-08dc481c84af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:57:30.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2ZecgvpgztAzTerz//F6+LxEP2DV+SR0fEObKCidPsPDymfk6FLdoKP0N3cNfOpoqgxlLl0jq71pDfS1X2bBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827
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


On 3/19/2024 7:19 PM, Lazar, Lijo wrote:
>
> On 3/19/2024 6:02 PM, Sunil Khatri wrote:
>> Refactor the code so debugfs and devcoredump can reuse
>> the common information and avoid unnecessary copy of it.
>>
>> created a new file which would be the right place to
>> hold functions which will be used between sysfs, debugfs
>> and devcoredump.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>   4 files changed, 157 insertions(+), 115 deletions(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>> index 4536c8ad0e11..05d34f4b18f5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>>   	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>   	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>   	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>> -	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>> +	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_devinfo.o
>>   
>>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9c62552bec34..0267870aa9b1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>   extern const struct attribute_group amdgpu_flash_attr_group;
>>   
>> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info);
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>> new file mode 100644
>> index 000000000000..d2c15a1dcb0d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>> @@ -0,0 +1,151 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2024 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#include "amdgpu.h"
>> +#include "amd_pcie.h"
>> +
>> +#include <drm/amdgpu_drm.h>
>> +
>> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info)
>> +{
>> +	int ret;
>> +	uint64_t vm_size;
>> +	uint32_t pcie_gen_mask;
>> +
>> +	if (dev_info == NULL)
>> +		return -EINVAL;
>> +
>> +	dev_info->device_id = adev->pdev->device;
>> +	dev_info->chip_rev = adev->rev_id;
>> +	dev_info->external_rev = adev->external_rev_id;
>> +	dev_info->pci_rev = adev->pdev->revision;
>> +	dev_info->family = adev->family;
>> +	dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>> +	dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
>> +	/* return all clocks in KHz */
>> +	dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>> +	if (adev->pm.dpm_enabled) {
>> +		dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
>> +		dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
>> +		dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
>> +		dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
>> +	} else {
>> +		dev_info->max_engine_clock =
>> +			dev_info->min_engine_clock =
>> +				adev->clock.default_sclk * 10;
>> +		dev_info->max_memory_clock =
>> +			dev_info->min_memory_clock =
>> +				adev->clock.default_mclk * 10;
>> +		}
>> +	dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
>> +	dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>> +		adev->gfx.config.max_shader_engines;
>> +	dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>> +	dev_info->ids_flags = 0;
>> +	if (adev->flags & AMD_IS_APU)
>> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>> +	if (adev->gfx.mcbp)
>> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>> +	if (amdgpu_is_tmz(adev))
>> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>> +	if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>> +
>> +	vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>> +	vm_size -= AMDGPU_VA_RESERVED_TOP;
>> +
>> +	/* Older VCE FW versions are buggy and can handle only 40bits */
>> +	if (adev->vce.fw_version && adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>> +		vm_size = min(vm_size, 1ULL << 40);
>> +
>> +	dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>> +	dev_info->virtual_address_max = min(vm_size, AMDGPU_GMC_HOLE_START);
>> +
>> +	if (vm_size > AMDGPU_GMC_HOLE_START) {
>> +		dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>> +		dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>> +	}
>> +	dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>> +	dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>> +	dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>> +	dev_info->cu_active_number = adev->gfx.cu_info.number;
>> +	dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>> +	dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>> +	memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
>> +	       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>> +	memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>> +	       sizeof(dev_info->cu_bitmap));
>> +	dev_info->vram_type = adev->gmc.vram_type;
>> +	dev_info->vram_bit_width = adev->gmc.vram_width;
>> +	dev_info->vce_harvest_config = adev->vce.harvest_config;
>> +	dev_info->gc_double_offchip_lds_buf =
>> +		adev->gfx.config.double_offchip_lds_buf;
>> +	dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>> +	dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>> +	dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>> +	dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
>> +	dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>> +	dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
>> +	dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>> +
>> +	if (adev->family >= AMDGPU_FAMILY_NV)
>> +		dev_info->pa_sc_tile_steering_override =
>> +			adev->gfx.config.pa_sc_tile_steering_override;
>> +
>> +	dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>> +
>> +	/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>> +	pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
>> +	dev_info->pcie_gen = fls(pcie_gen_mask);
>> +	dev_info->pcie_num_lanes =
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>> +
>> +	dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>> +	dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>> +	dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>> +	dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>> +	dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
>> +				    adev->gfx.config.gc_gl1c_per_sa;
>> +	dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>> +	dev_info->mall_size = adev->gmc.mall_size;
>> +
>> +
>> +	if (adev->gfx.funcs->get_gfx_shadow_info) {
>> +		struct amdgpu_gfx_shadow_info shadow_info;
>> +
>> +		ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
> This failure is ignored in the present logic and rest of the information
> is filled. Probably, need to continue the same way.

Since this is the information that we are sharing with user and on any 
failure we just decide not to populate those fields. By default all the 
members are initialized to zero and they

are updated when we have valid values. To me seems the right logic 
instead of failing the complete call, we provide the information what we 
have.

Regards
Sunil

>
> Thanks,
> Lijo
>
>> +		if (!ret) {
>> +			dev_info->shadow_size = shadow_info.shadow_size;
>> +			dev_info->shadow_alignment = shadow_info.shadow_alignment;
>> +			dev_info->csa_size = shadow_info.csa_size;
>> +			dev_info->csa_alignment = shadow_info.csa_alignment;
>> +		}
>> +	}
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index a66d47865e3b..24f775c68a51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>>   	}
>>   	case AMDGPU_INFO_DEV_INFO: {
>>   		struct drm_amdgpu_info_device *dev_info;
>> -		uint64_t vm_size;
>> -		uint32_t pcie_gen_mask;
>>   
>>   		dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>   		if (!dev_info)
>>   			return -ENOMEM;
>>   
>> -		dev_info->device_id = adev->pdev->device;
>> -		dev_info->chip_rev = adev->rev_id;
>> -		dev_info->external_rev = adev->external_rev_id;
>> -		dev_info->pci_rev = adev->pdev->revision;
>> -		dev_info->family = adev->family;
>> -		dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>> -		dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
>> -		/* return all clocks in KHz */
>> -		dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>> -		if (adev->pm.dpm_enabled) {
>> -			dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
>> -			dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
>> -			dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
>> -			dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
>> -		} else {
>> -			dev_info->max_engine_clock =
>> -				dev_info->min_engine_clock =
>> -					adev->clock.default_sclk * 10;
>> -			dev_info->max_memory_clock =
>> -				dev_info->min_memory_clock =
>> -					adev->clock.default_mclk * 10;
>> -		}
>> -		dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
>> -		dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>> -			adev->gfx.config.max_shader_engines;
>> -		dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>> -		dev_info->ids_flags = 0;
>> -		if (adev->flags & AMD_IS_APU)
>> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>> -		if (adev->gfx.mcbp)
>> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>> -		if (amdgpu_is_tmz(adev))
>> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>> -		if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>> -
>> -		vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>> -		vm_size -= AMDGPU_VA_RESERVED_TOP;
>> -
>> -		/* Older VCE FW versions are buggy and can handle only 40bits */
>> -		if (adev->vce.fw_version &&
>> -		    adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>> -			vm_size = min(vm_size, 1ULL << 40);
>> -
>> -		dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>> -		dev_info->virtual_address_max =
>> -			min(vm_size, AMDGPU_GMC_HOLE_START);
>> -
>> -		if (vm_size > AMDGPU_GMC_HOLE_START) {
>> -			dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>> -			dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>> -		}
>> -		dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>> -		dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>> -		dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>> -		dev_info->cu_active_number = adev->gfx.cu_info.number;
>> -		dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>> -		dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>> -		memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
>> -		       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>> -		memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>> -		       sizeof(dev_info->cu_bitmap));
>> -		dev_info->vram_type = adev->gmc.vram_type;
>> -		dev_info->vram_bit_width = adev->gmc.vram_width;
>> -		dev_info->vce_harvest_config = adev->vce.harvest_config;
>> -		dev_info->gc_double_offchip_lds_buf =
>> -			adev->gfx.config.double_offchip_lds_buf;
>> -		dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>> -		dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>> -		dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>> -		dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
>> -		dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>> -		dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
>> -		dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>> -
>> -		if (adev->family >= AMDGPU_FAMILY_NV)
>> -			dev_info->pa_sc_tile_steering_override =
>> -				adev->gfx.config.pa_sc_tile_steering_override;
>> -
>> -		dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>> -
>> -		/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>> -		pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
>> -		dev_info->pcie_gen = fls(pcie_gen_mask);
>> -		dev_info->pcie_num_lanes =
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>> -
>> -		dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>> -		dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>> -		dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>> -		dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>> -		dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
>> -					    adev->gfx.config.gc_gl1c_per_sa;
>> -		dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>> -		dev_info->mall_size = adev->gmc.mall_size;
>> -
>> -
>> -		if (adev->gfx.funcs->get_gfx_shadow_info) {
>> -			struct amdgpu_gfx_shadow_info shadow_info;
>> -
>> -			ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>> -			if (!ret) {
>> -				dev_info->shadow_size = shadow_info.shadow_size;
>> -				dev_info->shadow_alignment = shadow_info.shadow_alignment;
>> -				dev_info->csa_size = shadow_info.csa_size;
>> -				dev_info->csa_alignment = shadow_info.csa_alignment;
>> -			}
>> +		ret = amdgpu_device_info(adev, dev_info);
>> +		if (!ret) {
>> +			kfree(dev_info);
>> +			return ret;
>>   		}
>>   
>>   		ret = copy_to_user(out, dev_info,
