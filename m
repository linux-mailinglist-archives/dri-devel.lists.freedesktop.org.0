Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2487FF5B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE3310EE25;
	Tue, 19 Mar 2024 14:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Run8HHsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2110.outbound.protection.outlook.com [40.107.220.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E787310E14A;
 Tue, 19 Mar 2024 14:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lue9o12CPVTIXoAqTx7YPuFDhU5s77GRotqudbIcqcoc5qx1K426T76URNDNBxFc3tKLJb8JvENEuZx6omdq45j3qzUN/r4cxpuSe5vGjxL5uSjwpo0o3tKu2VE95ljSaw92gOskYwFkPPgoebSdjmmVlKNy3lx1C/+RidJtyIy6xRlW4vzXgCu+GG+if8HiCC+paTC+UPVDpzWRBd8sPsSwD+hHBEGsT65wcwBFzYCvm5wrsAkg78Q5ydBYvqIY57TufZ35nG1I/3Kl5Y8whYuxqRfb/tzGPb1c3BdHGZ4f8hDAfXzZIjUWAN1oqhWGyMEmXluxdqKNxfphQxnIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txZdI8YXRWXcOKQOPF0qG+9NXSan4l2sgfLrd+EWqUA=;
 b=YvF849DFP2cISgBuN8HZGf69/GN+e9ppiqPRcWDimdbRbVVlGPei0R2qM1pxe4l93/7M1FJoKdHQBe3+46o4uqpcGbb/LX6ZJW1VOPNp/7jC0f9XyhL8wdxxxzi+dlt7z828ldgSGNWznK0ctioUHzr4Zv52Y4FbpXWONI0v6XOaq2yOvNG+GbxRrtN1sYn4Y+DvUqL6ZWWVdmWmsteLS+WTjbhC/8/B00pqaoe3bRwWKK9eDSqBRuYhjuHbN3Xim16QOrSLfRObZ0Bm0BP41mpux0I1pw99jYPmYSRSAMo9cqWgeznSj16s24zxlvPc0KVmwZhLkxPcSn5ruojErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txZdI8YXRWXcOKQOPF0qG+9NXSan4l2sgfLrd+EWqUA=;
 b=Run8HHslc3n1Motah4OlXt70W1hDHCCfPoJO+9660MBS3YV+3tp2JRen18jABCC1mAsNjDKTb8qM13kokPJIBGqA4SJCCzesahOOwcdKZfSG7lea8ehDy7C3+xYMCUkKAChmjXh7GlycUGkYxBkhRFyqOXJtlNRXV+MTRZQbkcI=
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 14:13:42 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::f349:addf:ae3e:814]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::f349:addf:ae3e:814%5]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 14:13:42 +0000
Message-ID: <6b00e84a-1720-4417-81bb-416ef6f01560@amd.com>
Date: Tue, 19 Mar 2024 19:43:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <a0fe5024-c1d0-49f4-ba5c-f81161d448e2@amd.com>
 <bcefa332-d29b-4fa0-9195-39dc77625e5b@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <bcefa332-d29b-4fa0-9195-39dc77625e5b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::16) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|SN7PR12MB8770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVkJukngGqLbZIw8qnoDqNFjiiY4s60TYDNhsfck067rw0EX0JXWbnDNK1D+L12bPw2z8WFD2YaT2iffuxvKwZhKPhbyMbOAPxSlssIVdgSgrp5PbVU8qqL8Mma7PI7/NpZSAVPXlK+5v/Kq3Mh7aZhQFrcR3ezKG+Usj4Ai14EToVmC67FFd/wodJspSKmYiNguV2BfP26oywR+g3HqtlO7y/T9f0gvc0WbjLS0fj65sBU1tm1jIfkfg8MJGSzPwSRhZxC+OyA5BS4EcNZRTkXj8BgI2nmegbSYFUvuhdFPCLRX0GdRR1aOTfnCbagzfo9uoyhCnCEhD7c1nIFvYu2T13NiyBwOJx1gf9ChtlbgrV2E3L0pT51DtMSVykD5+n5H9TA5vGrdZszl3YDroHU0Q1HBZvBHu+YnsW+ANrhbCr9gSYRo8MUy15GMYQVzRGQWb5MEeDbCLlWIf7USJIwvAsiIcV3/7SSsLYs8Kimj0oPpzayNfuiDp2dYTAZs0l5tfil94Vmer+hq3bfvo7TpZsnRvP0F570+/Y51QQ86yLBHioOx3W0cFUKEmmusY3i8ae6V9sfsiy9UgIV/7UsicUpyiuO6TYxorc5KVJHX3y2yugdr3e0NXcjJFaxc03QZzazjWiN9P9whndcc7NNsYCqE5d8dKFCjj4H60sI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBjWmFSb092QWFIVWsxSTF0Ynl1dFV6QlNHTUR0RHh0dldvUTI5cm9hTnFM?=
 =?utf-8?B?Q0NkYnh5K0VHeDI5UUtFUGVzTEJobDhyb3BqSFRTUjg1M1JiUzc4cUZXT1BM?=
 =?utf-8?B?NEx2ODlxbmFLbjhLQVNCenQ1bFd2a2h0aDhpbnZaM1hZNmhQb044M2hndnVa?=
 =?utf-8?B?a2w5NVhRZ0ZpNjg2Qi85N3grbGxsaXJHbkRMekdBK09OQU9jbk1jUnh0YlZT?=
 =?utf-8?B?S0JCa2I2RUdJRFFhbmdtRVZocEJuSU03NFlSVWFKRnBmV21RcnFINjBqV2hH?=
 =?utf-8?B?Smx1Rm9yejJBdHlPWUxxYWljN0VEVzlxQ242ZHNmOWRBdzNVRTFPaDhiRUh0?=
 =?utf-8?B?MHhiS0RNbGFtWk9DbkgvWjZ6M2E5NDVGRjZhTTNpbDdmUEVXU25Ob29LK0Ex?=
 =?utf-8?B?U0pSa0gwU3d5cGxuZ3U1azE3eXk5MTRSK1hZZjRtUWJaVlRBY0p1RWpNM3ln?=
 =?utf-8?B?UjBZK2dxK2xEeklIK2x4QmVvZTZVNFlMVzlPclFJY2RUSXQxN1A2Z25XV3ZR?=
 =?utf-8?B?S0ZzYXdkLzRJVldmWnkxVS9sTE1GZmU5M0ZUUUZFMVNYUVFiU0hjSXNQeVdU?=
 =?utf-8?B?b0hjSU9pSitJV1lOQzd5b0d6RUtsclEvUDg4UlA2dXRucngyVExxaVJzelda?=
 =?utf-8?B?dFlQdVJoSWdaeFNudU9SczgrdnZWOXJwZ2tCQUdJdDd5K05jUHlvc094Mmww?=
 =?utf-8?B?VmI2WURFQlpzaUtlSUFUNUFqYjQwYXV5K29CaTdtNDREaWhGc2hsMGRLYmlK?=
 =?utf-8?B?MUE0YlpMVnpuSzl0OWJCbnNGR0xRRUFTT1hTYjN5elZ4ZjgzZDAxSFU2UzJz?=
 =?utf-8?B?dEN2Ky9hL3QwR1grRGpidm56blA4WVhHZE1iVitiRjZtWTN4aEw0L2xVaG9u?=
 =?utf-8?B?SjYwbnRpYlA3VG85QVdiSmZ4a05YSitnOUx5SzRRaS9MZUZ5ZVBHY05qZkEy?=
 =?utf-8?B?NUIzYldpRE5iWElYMHgxOTJ2aGcrV1hjMlYvcEVCejVYaTY0ZkhEYnJtTklG?=
 =?utf-8?B?MS9UZ0lsdGMza2l0UjZOUUpYSmhJU0UwRFdvNFBsM0ZRbklNTC84YVlONi83?=
 =?utf-8?B?Y1pkaHdZYVREOGcydnNCSzZOTUpyNkgxT1NJdTZWN0hpaFBWc1BFcWxHVEIx?=
 =?utf-8?B?eXk2OXY1dEtQNkQ5MTBtMitVa3dRUW16ZTM2dlE5bWNydTVvdjZPVzBWK3BJ?=
 =?utf-8?B?Q0JobVNqQnNKOGxBVVAvRlRrOGJpQ21uQ3lWY2oweHNXc01CcDRRWTFMWTNh?=
 =?utf-8?B?eEZzQnBoeTEwYmFET2V6czJsVlRDVmp2MFJ0MEowVGVqazNjL0V4VUd5Z08z?=
 =?utf-8?B?dFFmSld3Rm4rVks2N0p6U2dONmd2TU9pV0xENWQvT2wxMXRvcHVnaUplc3Nv?=
 =?utf-8?B?NUpEenNUOVZXWCt3bmVqYVJVbzNMYlhQLzdFOHE2eElyOFRUVHJ1MDBBd0xa?=
 =?utf-8?B?THZCSGhaUkFMRnpDVFpja0Z0dzRxVWwyc2FtblpwT2FJU2d4NXllSVFzM3VF?=
 =?utf-8?B?bEFIakxjcGJXUk1UY3o3QTJPd3lhdDVhVEJWc1VlUGNEcldIY1ZYMVV2MnVK?=
 =?utf-8?B?SU5FdndwYzRHTjNoU0J0Qk9jNS93RldSMk81OXlUR1lPTnFabldkRUFNdyth?=
 =?utf-8?B?VVBkaTNwWm04ODZCZVJqQ1pKNmtwRktrZHRMRmo1QVdCTnpnck56VG4reXZx?=
 =?utf-8?B?WFQvNlVkMW5HTjl0c0EzU1RuZ3JnN1JLSlNFcVpnY29ESUZ4RFNOT0x6RkRC?=
 =?utf-8?B?bFNVay9zM09lcGRBMWJtYzllcldvbi91SGI4SWNhL0ZkZG5yL2FtODBCdU1W?=
 =?utf-8?B?MnE0L3c4SlFucUhqbTFOa0tZQXpTaFk4MGwranZiNkFVMTg4NTBsQUpPd3ZO?=
 =?utf-8?B?VkhmZWhLTTd5OXE4NzNDa0VYZXhPaEJpQUE2cHVvVWVkUWt1VGQzVnFyNmly?=
 =?utf-8?B?YVJRRTFZRWZOWEt2UmJ1VVNYSCtKR1hwVUN4VTlnUjVVR3V6ZFk5eVVidTJi?=
 =?utf-8?B?NGx0SWxJaTRaKzJSekRrQzVnVHFzQXNWTldZcmtkN0hJK3N6N1ltK0dWejF0?=
 =?utf-8?B?Q0czUXJYcXBHWTdleVpkV2YxN3FhaW9YTXRjYzVwZWEvTHFwUUIwRnB2QWd0?=
 =?utf-8?Q?OLr0hSM9KhAgkxPuAYQkqE+t8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3991e8-20d7-422a-f8dd-08dc481ec802
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:13:42.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9K597fsBkq1pdX+xFF78Icq+uZvJxf4svY7GCqKTkoK0NArw7trGrwnyIoF5D05n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770
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



On 3/19/2024 7:27 PM, Khatri, Sunil wrote:
> 
> On 3/19/2024 7:19 PM, Lazar, Lijo wrote:
>>
>> On 3/19/2024 6:02 PM, Sunil Khatri wrote:
>>> Refactor the code so debugfs and devcoredump can reuse
>>> the common information and avoid unnecessary copy of it.
>>>
>>> created a new file which would be the right place to
>>> hold functions which will be used between sysfs, debugfs
>>> and devcoredump.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>>   4 files changed, 157 insertions(+), 115 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>> index 4536c8ad0e11..05d34f4b18f5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o
>>> amdgpu_kms.o \
>>>       amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>>       amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>>       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>>> -    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>> +    amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>> amdgpu_devinfo.o
>>>     amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 9c62552bec34..0267870aa9b1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group
>>> amdgpu_vram_mgr_attr_group;
>>>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>   extern const struct attribute_group amdgpu_flash_attr_group;
>>>   +int amdgpu_device_info(struct amdgpu_device *adev, struct
>>> drm_amdgpu_info_device *dev_info);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>> new file mode 100644
>>> index 000000000000..d2c15a1dcb0d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>> @@ -0,0 +1,151 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright 2024 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person
>>> obtaining a
>>> + * copy of this software and associated documentation files (the
>>> "Software"),
>>> + * to deal in the Software without restriction, including without
>>> limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>> sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom
>>> the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
>>> EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>>> DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>> OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>>> USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + *
>>> + */
>>> +
>>> +#include "amdgpu.h"
>>> +#include "amd_pcie.h"
>>> +
>>> +#include <drm/amdgpu_drm.h>
>>> +
>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct
>>> drm_amdgpu_info_device *dev_info)
>>> +{
>>> +    int ret;
>>> +    uint64_t vm_size;
>>> +    uint32_t pcie_gen_mask;
>>> +
>>> +    if (dev_info == NULL)
>>> +        return -EINVAL;
>>> +
>>> +    dev_info->device_id = adev->pdev->device;
>>> +    dev_info->chip_rev = adev->rev_id;
>>> +    dev_info->external_rev = adev->external_rev_id;
>>> +    dev_info->pci_rev = adev->pdev->revision;
>>> +    dev_info->family = adev->family;
>>> +    dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
>>> +    dev_info->num_shader_arrays_per_engine =
>>> adev->gfx.config.max_sh_per_se;
>>> +    /* return all clocks in KHz */
>>> +    dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>> +    if (adev->pm.dpm_enabled) {
>>> +        dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev,
>>> false) * 10;
>>> +        dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev,
>>> false) * 10;
>>> +        dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true)
>>> * 10;
>>> +        dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true)
>>> * 10;
>>> +    } else {
>>> +        dev_info->max_engine_clock =
>>> +            dev_info->min_engine_clock =
>>> +                adev->clock.default_sclk * 10;
>>> +        dev_info->max_memory_clock =
>>> +            dev_info->min_memory_clock =
>>> +                adev->clock.default_mclk * 10;
>>> +        }
>>> +    dev_info->enabled_rb_pipes_mask =
>>> adev->gfx.config.backend_enable_mask;
>>> +    dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>> +        adev->gfx.config.max_shader_engines;
>>> +    dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
>>> +    dev_info->ids_flags = 0;
>>> +    if (adev->flags & AMD_IS_APU)
>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>> +    if (adev->gfx.mcbp)
>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>> +    if (amdgpu_is_tmz(adev))
>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>> +    if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>> +        dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>> +
>>> +    vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>> +    vm_size -= AMDGPU_VA_RESERVED_TOP;
>>> +
>>> +    /* Older VCE FW versions are buggy and can handle only 40bits */
>>> +    if (adev->vce.fw_version && adev->vce.fw_version <
>>> AMDGPU_VCE_FW_53_45)
>>> +        vm_size = min(vm_size, 1ULL << 40);
>>> +
>>> +    dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>> +    dev_info->virtual_address_max = min(vm_size,
>>> AMDGPU_GMC_HOLE_START);
>>> +
>>> +    if (vm_size > AMDGPU_GMC_HOLE_START) {
>>> +        dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>> +        dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>> +    }
>>> +    dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE,
>>> AMDGPU_GPU_PAGE_SIZE);
>>> +    dev_info->pte_fragment_size = (1 <<
>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>> +    dev_info->gart_page_size = max_t(u32, PAGE_SIZE,
>>> AMDGPU_GPU_PAGE_SIZE);
>>> +    dev_info->cu_active_number = adev->gfx.cu_info.number;
>>> +    dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>> +    dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>> +    memcpy(&dev_info->cu_ao_bitmap[0],
>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>> +           sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>> +    memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>> +           sizeof(dev_info->cu_bitmap));
>>> +    dev_info->vram_type = adev->gmc.vram_type;
>>> +    dev_info->vram_bit_width = adev->gmc.vram_width;
>>> +    dev_info->vce_harvest_config = adev->vce.harvest_config;
>>> +    dev_info->gc_double_offchip_lds_buf =
>>> +        adev->gfx.config.double_offchip_lds_buf;
>>> +    dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>> +    dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>> +    dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>> +    dev_info->num_tcc_blocks =
>>> adev->gfx.config.max_texture_channel_caches;
>>> +    dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
>>> +    dev_info->gs_prim_buffer_depth =
>>> adev->gfx.config.gs_prim_buffer_depth;
>>> +    dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
>>> +
>>> +    if (adev->family >= AMDGPU_FAMILY_NV)
>>> +        dev_info->pa_sc_tile_steering_override =
>>> +            adev->gfx.config.pa_sc_tile_steering_override;
>>> +
>>> +    dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
>>> +
>>> +    /* Combine the chip gen mask with the platform (CPU/mobo) mask. */
>>> +    pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask
>>> >> 16);
>>> +    dev_info->pcie_gen = fls(pcie_gen_mask);
>>> +    dev_info->pcie_num_lanes =
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ?
>>> 32 :
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ?
>>> 16 :
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ?
>>> 12 :
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>> +        adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2
>>> : 1;
>>> +
>>> +    dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>> +    dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
>>> +    dev_info->sqc_data_cache_size =
>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>> +    dev_info->sqc_inst_cache_size =
>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>> +    dev_info->gl1c_cache_size =
>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>> +                    adev->gfx.config.gc_gl1c_per_sa;
>>> +    dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>> +    dev_info->mall_size = adev->gmc.mall_size;
>>> +
>>> +
>>> +    if (adev->gfx.funcs->get_gfx_shadow_info) {
>>> +        struct amdgpu_gfx_shadow_info shadow_info;
>>> +
>>> +        ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>> This failure is ignored in the present logic and rest of the information
>> is filled. Probably, need to continue the same way.
> 
> Since this is the information that we are sharing with user and on any
> failure we just decide not to populate those fields. By default all the
> members are initialized to zero and they
> 
> are updated when we have valid values. To me seems the right logic
> instead of failing the complete call, we provide the information what we
> have.
> 

Actually, this is not what is really done. If you fail here, then this
happens down the call. It doesn't copy, instead frees without copying to
userspace.

+        ret = amdgpu_device_info(adev, dev_info);
+        if (!ret) {

Thanks,
Lijo

> Regards
> Sunil
> 
>>
>> Thanks,
>> Lijo
>>
>>> +        if (!ret) {
>>> +            dev_info->shadow_size = shadow_info.shadow_size;
>>> +            dev_info->shadow_alignment = shadow_info.shadow_alignment;
>>> +            dev_info->csa_size = shadow_info.csa_size;
>>> +            dev_info->csa_alignment = shadow_info.csa_alignment;
>>> +        }
>>> +    }
>>> +    return ret;
>>> +}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> index a66d47865e3b..24f775c68a51 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev,
>>> void *data, struct drm_file *filp)
>>>       }
>>>       case AMDGPU_INFO_DEV_INFO: {
>>>           struct drm_amdgpu_info_device *dev_info;
>>> -        uint64_t vm_size;
>>> -        uint32_t pcie_gen_mask;
>>>             dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>>           if (!dev_info)
>>>               return -ENOMEM;
>>>   -        dev_info->device_id = adev->pdev->device;
>>> -        dev_info->chip_rev = adev->rev_id;
>>> -        dev_info->external_rev = adev->external_rev_id;
>>> -        dev_info->pci_rev = adev->pdev->revision;
>>> -        dev_info->family = adev->family;
>>> -        dev_info->num_shader_engines =
>>> adev->gfx.config.max_shader_engines;
>>> -        dev_info->num_shader_arrays_per_engine =
>>> adev->gfx.config.max_sh_per_se;
>>> -        /* return all clocks in KHz */
>>> -        dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>> -        if (adev->pm.dpm_enabled) {
>>> -            dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev,
>>> false) * 10;
>>> -            dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev,
>>> false) * 10;
>>> -            dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev,
>>> true) * 10;
>>> -            dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev,
>>> true) * 10;
>>> -        } else {
>>> -            dev_info->max_engine_clock =
>>> -                dev_info->min_engine_clock =
>>> -                    adev->clock.default_sclk * 10;
>>> -            dev_info->max_memory_clock =
>>> -                dev_info->min_memory_clock =
>>> -                    adev->clock.default_mclk * 10;
>>> -        }
>>> -        dev_info->enabled_rb_pipes_mask =
>>> adev->gfx.config.backend_enable_mask;
>>> -        dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
>>> -            adev->gfx.config.max_shader_engines;
>>> -        dev_info->num_hw_gfx_contexts =
>>> adev->gfx.config.max_hw_contexts;
>>> -        dev_info->ids_flags = 0;
>>> -        if (adev->flags & AMD_IS_APU)
>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>> -        if (adev->gfx.mcbp)
>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>> -        if (amdgpu_is_tmz(adev))
>>> -            dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>> -        if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>> -            dev_info->ids_flags |=
>>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>> -
>>> -        vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>> -        vm_size -= AMDGPU_VA_RESERVED_TOP;
>>> -
>>> -        /* Older VCE FW versions are buggy and can handle only
>>> 40bits */
>>> -        if (adev->vce.fw_version &&
>>> -            adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>>> -            vm_size = min(vm_size, 1ULL << 40);
>>> -
>>> -        dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>> -        dev_info->virtual_address_max =
>>> -            min(vm_size, AMDGPU_GMC_HOLE_START);
>>> -
>>> -        if (vm_size > AMDGPU_GMC_HOLE_START) {
>>> -            dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>> -            dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
>>> -        }
>>> -        dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE,
>>> AMDGPU_GPU_PAGE_SIZE);
>>> -        dev_info->pte_fragment_size = (1 <<
>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>> -        dev_info->gart_page_size = max_t(u32, PAGE_SIZE,
>>> AMDGPU_GPU_PAGE_SIZE);
>>> -        dev_info->cu_active_number = adev->gfx.cu_info.number;
>>> -        dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>> -        dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>> -        memcpy(&dev_info->cu_ao_bitmap[0],
>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>> -               sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>> -        memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>> -               sizeof(dev_info->cu_bitmap));
>>> -        dev_info->vram_type = adev->gmc.vram_type;
>>> -        dev_info->vram_bit_width = adev->gmc.vram_width;
>>> -        dev_info->vce_harvest_config = adev->vce.harvest_config;
>>> -        dev_info->gc_double_offchip_lds_buf =
>>> -            adev->gfx.config.double_offchip_lds_buf;
>>> -        dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
>>> -        dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
>>> -        dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>> -        dev_info->num_tcc_blocks =
>>> adev->gfx.config.max_texture_channel_caches;
>>> -        dev_info->gs_vgt_table_depth =
>>> adev->gfx.config.gs_vgt_table_depth;
>>> -        dev_info->gs_prim_buffer_depth =
>>> adev->gfx.config.gs_prim_buffer_depth;
>>> -        dev_info->max_gs_waves_per_vgt =
>>> adev->gfx.config.max_gs_threads;
>>> -
>>> -        if (adev->family >= AMDGPU_FAMILY_NV)
>>> -            dev_info->pa_sc_tile_steering_override =
>>> -                adev->gfx.config.pa_sc_tile_steering_override;
>>> -
>>> -        dev_info->tcc_disabled_mask =
>>> adev->gfx.config.tcc_disabled_mask;
>>> -
>>> -        /* Combine the chip gen mask with the platform (CPU/mobo)
>>> mask. */
>>> -        pcie_gen_mask = adev->pm.pcie_gen_mask &
>>> (adev->pm.pcie_gen_mask >> 16);
>>> -        dev_info->pcie_gen = fls(pcie_gen_mask);
>>> -        dev_info->pcie_num_lanes =
>>> -            adev->pm.pcie_mlw_mask &
>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>> -            adev->pm.pcie_mlw_mask &
>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>> -            adev->pm.pcie_mlw_mask &
>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8
>>> ? 8 :
>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4
>>> ? 4 :
>>> -            adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2
>>> ? 2 : 1;
>>> -
>>> -        dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>> -        dev_info->num_sqc_per_wgp =
>>> adev->gfx.config.gc_num_sqc_per_wgp;
>>> -        dev_info->sqc_data_cache_size =
>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>> -        dev_info->sqc_inst_cache_size =
>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>> -        dev_info->gl1c_cache_size =
>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>> -                        adev->gfx.config.gc_gl1c_per_sa;
>>> -        dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>> -        dev_info->mall_size = adev->gmc.mall_size;
>>> -
>>> -
>>> -        if (adev->gfx.funcs->get_gfx_shadow_info) {
>>> -            struct amdgpu_gfx_shadow_info shadow_info;
>>> -
>>> -            ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
>>> -            if (!ret) {
>>> -                dev_info->shadow_size = shadow_info.shadow_size;
>>> -                dev_info->shadow_alignment =
>>> shadow_info.shadow_alignment;
>>> -                dev_info->csa_size = shadow_info.csa_size;
>>> -                dev_info->csa_alignment = shadow_info.csa_alignment;
>>> -            }
>>> +        ret = amdgpu_device_info(adev, dev_info);
>>> +        if (!ret) {
>>> +            kfree(dev_info);
>>> +            return ret;
>>>           }
>>>             ret = copy_to_user(out, dev_info,
