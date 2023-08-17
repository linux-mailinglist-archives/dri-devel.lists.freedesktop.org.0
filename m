Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950377F17F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BCB10E1BF;
	Thu, 17 Aug 2023 07:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0113A10E1B9;
 Thu, 17 Aug 2023 07:52:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2F3jBuvjoD1Jo+DziRqxxEUX/+9dFFBOBbokr9MR3ARPC9ehuHiLJU6nlos9PUHieMEKkovYifH+vYaZMCloMaPFSGjPM4JY8HkdRYQVhGt1I6CJGnypYnNApBLdi36DVp79PRJRXsisOlAeC6tv1if9OBwD0WV3rUJQ7NT4ID1a373acBsEEz/aEQLojpo6hHg3jmee6BB6HnqW0ZyWCrCn7XxbwXH8J3aIkw9gvrsRDVNbGo3P6KrAZGARb+XVex7cRGC4f2+ID92WbhcqxHH+AqKPiWCwtYAfVkgTnPFUYMm0osSl3etZsOdC4V91zdvIrM89zreqqKFqfR0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK8XteWJvWmh0waBKPxg2nTryfeViYu3rV0qo3samaM=;
 b=G1M4sTRLdK3BuRpnDqfgOkA2VabE398jhfhI5pyZP8JeGFIJo9Piq4bqGMl2EapjF9RfFfceK0/1fDCiWRcrkVOkiSICx/b1OiWKMfJvnohy8sqzbCAAInoK8iXZLRVfIwFG1erpUZYhVthLICZZycgGDP5ylBRIC7c8lFA5FDdd0AC2Dd8cGz8xOAcPuKMZA4TgqfBppulCVkRsBSQa7ejLJWS01bxODQXpR6HwUhiki3TOJf76w1DH9m1rkfPHtF7VdGmPQf6djUbh/cTBJ+rJ13BblNycba2pMjU5zBtUKkbqtbM8UFl4z0xC3EcqYjvgpzR/fsTGYuVGE6lJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK8XteWJvWmh0waBKPxg2nTryfeViYu3rV0qo3samaM=;
 b=zB+idIpJfCvuN7oia66oXa3id935s/eFEMPT1U+2/eycwTsJ/Rii9ol7SliCTpG2KMKGwzFbOA4oyG+qfxZnY5z6uGOk4UbobexD8xnzHHQQlk+o07V6acm2u6E5VwoLM9VSdNluzUhvMzJIdlxs1iEiZYGKGYXonkOmNoYwSI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by IA0PR12MB8716.namprd12.prod.outlook.com (2603:10b6:208:485::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Thu, 17 Aug
 2023 07:52:06 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 07:52:06 +0000
Message-ID: <63997e6a-27a1-3ac3-f7a0-039911ba1cf8@amd.com>
Date: Thu, 17 Aug 2023 13:21:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
 <CADnq5_N2YzOv4naA_etwQ_C5NkNYwV-PtBAJ3UKEXp6RbdQojQ@mail.gmail.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <CADnq5_N2YzOv4naA_etwQ_C5NkNYwV-PtBAJ3UKEXp6RbdQojQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::19) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|IA0PR12MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 3048bb7a-74af-4a68-93e8-08db9ef6da06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Q/cvyXUsWTPy6cu83zZNSvd6FCvoX30DcgHl9SAN3c7gLM12c7/BAX+eJ8co+PTNRUo43+oTlxSqNYOC4ez/KcQzrnsrR+ePQUdB3GDnMYXFgBI3npDfDkFg9Q0NS5vVtzFrEWJAkLaH95BCqIn4I+yLDMzYM75VrzWL6HXkoPOV2LDIdTmdcVDcW3hl9sJEcULj7sNrAdacq/KdHKpV3750fPVnALS0zr8z7ervS0VDat+mb/tTa6n3QWWf6/ku1+cgzs8lOBYVoS2Vx10ZNoUHlsro/+iFXOGOhzAoKuMS6/BQq+lSv/HJY4l1Hgau+tvsHBr0Bq4t3J8Wgg2OcvCS+NPaHzIKKLuF7nRCZ2don2uOGhAUgNzeoYtOKEZbKirs61oYVHd2WuFYcucjYKj83YUMVemhbugqht+rmF5zRqovi97HWWDBG3LBm0TX8h8aV1nCO53NWycbudd+wRPfnRVmMNceSXBkkdSEnR2Stcsq5SoH9FIlpt+VVcF8YQveli3YsPFQJVpGdskMacwoqIooS6bkFa2NPFwX3YurTpMGu/T0ucprix5Rrso8D0/H5j/m8gal2Z4b5rkpXcPXqeNDPbUZDQw8yIMbWQs4rjTKFvIYojGXObh6jwvTiBh0vLFFGnKnGT0RHWQNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(186009)(451199024)(1800799009)(36756003)(31696002)(31686004)(8676002)(83380400001)(4326008)(8936002)(5660300002)(2906002)(30864003)(41300700001)(26005)(6506007)(6486002)(53546011)(6666004)(2616005)(6512007)(66899024)(66946007)(110136005)(316002)(478600001)(38100700002)(66556008)(6636002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWVVQkFqTWhRN3dDVkZoMG13NzRITVd3Mk1XZlIySTgrcFhOTmJOdVJKSmFR?=
 =?utf-8?B?dEV4TThuM0xqUHFoblJtTlZBaFk4SHQ3SG15c2tQVXRRbXY4eGIwMFBJTWJP?=
 =?utf-8?B?U2JxZnBrZWE4WjNyQkFXNmlWOFB6alRJK3V0cHlNSEIreGdMcWFHNU1zZTho?=
 =?utf-8?B?aG5yUlZGeklJelNHdDM1UGt1MmFIenFyOEx2Rm4ybUtTRHZ1dFB6enpVa3hQ?=
 =?utf-8?B?SXlKV245czArWmM5bWN2YngwcnR3bW15clNweWk5TWNPVUZjRHFrOGhtSEFN?=
 =?utf-8?B?MUNDMkpHUytNWlNHS0gvSTVZTFc0WWZZY2xQd0hwbFJRRjJVU2Y0bkcxdkZS?=
 =?utf-8?B?YkJMQmdpekJ3SXYxMkZxRmFMck9JWERuT05OM095ZGpqYS82VzFiTU1ZaHZK?=
 =?utf-8?B?VTJ0ZFNmQmFtUEkzMEZxQjl5S1lEUktldjgvS2c4a3c3ejRlSWZDZ1FaM2RY?=
 =?utf-8?B?aWFyWUJoWVVxbnhvd0hjakJyQzVrTzFzSS9CVUhNQjFXZ2M0My85OGdMdTBr?=
 =?utf-8?B?TlZoZ2FwVS9hWEJrbDc4NEVDQ3BzUXhYd21IVWNTVytmVFpYUzNETFViZnZq?=
 =?utf-8?B?TEJ5ekMzVDY1WW9YWFpKbm54YllPWnkxQ0xpU05rbWY4OGpFQTN0cllpTFQr?=
 =?utf-8?B?UXMrSFIwaHBiWWNySXJ3ZDl3ZnhXT00xb2laR1ptVzFFbXlOR3RseVBGRE1n?=
 =?utf-8?B?UEw5anM2bnA4dlZ3T0NzTnBMOHRvbVJGdHpCV2pidUVaWnEzaitWQWpwbVcw?=
 =?utf-8?B?Vk1WZmoxZUgzQS9UK2FVZzkyYkxvQzU4OVIwQXQ1a0RtNFJHN2RacGxlajQ4?=
 =?utf-8?B?ZERqajZZV3g2VkkrcExRYm95djBBZlVtV2NwRUlBKzVFb05iN3hXUm45SVM2?=
 =?utf-8?B?UkxRSkVLRmRBWjcyY0RWWGhFdmgrb0RsL1JpQjc2WkxQUkt1bUZ0RGRPSzZl?=
 =?utf-8?B?U21PYUxTVEpPVjk2K1ZJRUZxcXZwVE9rOGZ4M3lrQTVSTlc4ckpubHlRMU1U?=
 =?utf-8?B?ZGdieXZKMWlVSkxOdHhKSys3ekc5RjRaT2RBZHYyRlBhb3dmem9OZHJkeW5u?=
 =?utf-8?B?Qm9ZRkdUcHBzalJWWUYrYm1CYmZDS1BueUxtTVFxQ3VoYW9NOHpFTWlOVUEv?=
 =?utf-8?B?SUVSK25mcE5vdm5oTVZuTU9ieElIbXpTVG9JREF3a3ZLYXQ5ems1V3JJZGlm?=
 =?utf-8?B?Y1FJeUZMM1JPVkZFcDRLdzNsNDFXZnVaMmRzY3pMcVhaZTd6aDJIcEFSaWdK?=
 =?utf-8?B?V2JVS2NIU2FwamNGSzc0a2dXcTBuaUg4Z2FlemN6aVU1cHByWnVTcmFMOXkz?=
 =?utf-8?B?bmxTbytPZ2tqY2hwMWhGQ003ZzRGS3N2N0pLUXQvOHhDaVhGSCt2VnY0V2I2?=
 =?utf-8?B?cUpIZ1dqMVhJeW9Pc2tQT0o3dXRBS2ZnMHZEWVhVNERJSnVQdVpoa0tiWHQx?=
 =?utf-8?B?VmxYWmVMbnV0dTBibFB5d3ROUDBYVjF1UGd2N2ZtS0Q1TlNvaUtyV3BrSjFS?=
 =?utf-8?B?WERiZUVSKzByVVVpVytEQyszRi9UVnh3Ly9JWkdURmVtUlppaXJoUlFld3F3?=
 =?utf-8?B?bFJxTXRDdFg4a0tKNm0zdlRYdnM1L2dlaHN0RGJFdDlFRzhwTEFVYk9lQ2ZQ?=
 =?utf-8?B?b1B2QUFPUVJzbFFtaGlQNG5GNURSVDVGN085V2hVa2trUlpURERnM2FlaVA5?=
 =?utf-8?B?dFd2cXM1UDRNWFY3a0ZGQXNBQTRESHk1ZXlMVnJ6ckQra1lHb2ZEczJjbEFj?=
 =?utf-8?B?UFBzQXBYKzFnM3ZqZEFDeDdkS1lDU3N2VUFaeWtjMTZuMEZIbW5DSWFoWDRK?=
 =?utf-8?B?QXhyOHdHelI1UHM5bWtCTnFKSWM1RllPa0JOREhjS05OcGpObXB1cGYvbjdz?=
 =?utf-8?B?Wm9hbEpVa01kOGtUUkorWjhZam9icHpVcUxnZVg1bW1lbmhSanZtSFp6b3Rl?=
 =?utf-8?B?SzV1Ym8wR1puMWhKSmRZU24yUmVnazlsbjdibTNCd0paYlArUUNaR0F0aFhD?=
 =?utf-8?B?Zk9Hc3JwMVVjSXVXNEJJNWdLbGJ5THRCSGFoUmpQK1F3Ujc3K2NyRGlISXVZ?=
 =?utf-8?B?OHJLa1lDUmY0VS9UZmxkdWdSdkhvS2htM0pOMlc4MjQrNVBJSGRscXJCWjJB?=
 =?utf-8?Q?1uWIB04d523DabIiNErQe02mY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3048bb7a-74af-4a68-93e8-08db9ef6da06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:52:06.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbdXbxKrsnFixoeF8WwLtyv/s25jhbgfZp08qkz5H542WULKV/K11Hjp7IUkTny25T1zuLA0rFiu+1BFBJ8vfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8716
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
Cc: shashank.sharma@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/14/2023 8:03 PM, Alex Deucher wrote:
> On Mon, Aug 14, 2023 at 3:35 AM Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>> This patch adds a function which will allow to
>> change the GPU power profile based on a submitted job.
>> This can optimize the power performance when the
>> workload is on.
> A few minor comments inline below.  One thing to double check is that
> we properly cancel this work before a suspend or driver unload.  We
> need to make sure this is taken care of before we take down the SMU.
>
> Alex

Noted,

>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
>>   5 files changed, 206 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>> index 415a7fa395c4..6a9e187d61e1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -60,7 +60,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>>          amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>          amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>          amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>> -       amdgpu_ring_mux.o
>> +       amdgpu_ring_mux.o amdgpu_workload.o
>>
>>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 02b827785e39..1939fa1af8a6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -107,6 +107,7 @@
>>   #include "amdgpu_fdinfo.h"
>>   #include "amdgpu_mca.h"
>>   #include "amdgpu_ras.h"
>> +#include "amdgpu_workload.h"
>>
>>   #define MAX_GPU_INSTANCE               16
>>
>> @@ -1050,6 +1051,8 @@ struct amdgpu_device {
>>
>>          bool                            job_hang;
>>          bool                            dc_enabled;
>> +
>> +       struct amdgpu_smu_workload      smu_workload;
>>   };
>>
>>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 5c7d40873ee2..0ec18b8fe29f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3672,6 +3672,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>
>>          INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>>
>> +       amdgpu_smu_workload_init(adev);
>> +
>>          adev->gfx.gfx_off_req_count = 1;
>>          adev->gfx.gfx_off_residency = 0;
>>          adev->gfx.gfx_off_entrycount = 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> new file mode 100644
>> index 000000000000..ce0339d75c12
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -0,0 +1,156 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
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
>> +
>> +/* 100 millsecond timeout */
>> +#define SMU_IDLE_TIMEOUT       msecs_to_jiffies(100)
>> +
>> +static enum PP_SMC_POWER_PROFILE
>> +ring_to_power_profile(uint32_t ring_type)
>> +{
>> +       switch (ring_type) {
>> +       case AMDGPU_RING_TYPE_GFX:
>> +               return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>> +       case AMDGPU_RING_TYPE_COMPUTE:
>> +               return PP_SMC_POWER_PROFILE_COMPUTE;
>> +       case AMDGPU_RING_TYPE_UVD:
>> +       case AMDGPU_RING_TYPE_VCE:
>> +       case AMDGPU_RING_TYPE_UVD_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_DEC:
>> +       case AMDGPU_RING_TYPE_VCN_ENC:
>> +       case AMDGPU_RING_TYPE_VCN_JPEG:
>> +               return PP_SMC_POWER_PROFILE_VIDEO;
>> +       default:
>> +               return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>> +       }
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>> +                        enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +       int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>> +
>> +       if (ret == 0) {
>> +               /* Set the bit for the submitted workload profile */
>> +               adev->smu_workload.submit_workload_status |= (1 << profile);
>> +               atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +       } else {
>> +               DRM_ERROR("Failed to set power profile, error %d\n", ret);
>> +       }
>> +
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>> +                          enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +       int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
>> +
>> +       if (ret == 0) {
>> +                /* Clear the bit for the submitted workload profile */
>> +               adev->smu_workload.submit_workload_status &= ~(1 << profile);
>> +       } else
>> +               DRM_ERROR("Failed to clear power profile, error %d\n", ret);
>> +
>> +}
>> +
>> +static void amdgpu_smu_idle_work_handler(struct work_struct *work)
> How about amdgpu_power_profile_idle_work_handler() for consistency?
>
>> +{
>> +
>> +       struct amdgpu_smu_workload *wl = container_of(work,
>> +                                                     struct amdgpu_smu_workload,
>> +                                                     smu_delayed_work.work);
>> +       struct amdgpu_device *adev = wl->adev;
>> +       bool reschedule = false;
>> +
>> +       mutex_lock(&adev->smu_workload.workload_lock);
>> +       for (int index  = fls(adev->smu_workload.submit_workload_status);
>> +            index >= 0; index--) {
>> +               if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
>> +                   adev->smu_workload.submit_workload_status & (1 << index)) {
>> +                       amdgpu_power_profile_clear(adev, index);
>> +               } else if (atomic_read(&adev->smu_workload.power_profile_ref[index]))
>> +                       reschedule = true;
>> +       }
>> +
>> +       if (reschedule)
>> +               schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
>> +                                     SMU_IDLE_TIMEOUT);
>> +
>> +       mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
> amdgpu_workload_profile_put() for consistency.
>
>> +                                uint32_t ring_type)
>> +{
>> +
>> +       enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
>> +
>> +       if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +               return;
>> +
>> +       mutex_lock(&adev->smu_workload.workload_lock);
>> +       atomic_dec(&adev->smu_workload.power_profile_ref[profile]);
>> +       schedule_delayed_work(&adev->smu_workload.smu_delayed_work, SMU_IDLE_TIMEOUT);
>> +       mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
>> +                                uint32_t ring_type)
> amdgpu_workload_profile_set() for consistency.
Noted, I will change the function name.
>> +{
>> +       enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
>> +
>> +       if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +               return;
>> +
>> +       mutex_lock(&adev->smu_workload.workload_lock);
>> +       cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>> +
>> +       amdgpu_power_profile_set(adev, profile);
>> +
>> +       /* Clear the already finished jobs of higher power profile*/
>> +       for (int index = fls(adev->smu_workload.submit_workload_status);
>> +            index > profile; index--) {
>> +               if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
>> +                   adev->smu_workload.submit_workload_status & (1 << index)) {
>> +                       amdgpu_power_profile_clear(adev, index);
>> +               }
>> +       }
>> +
>> +       mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_smu_workload_init(struct amdgpu_device *adev)
> amdgpu_workload_profile_init() for consistency.

Noted,

~Arvind

>> +{
>> +       struct amdgpu_smu_workload wl;
>> +
>> +       wl.adev = adev;
>> +       wl.submit_workload_status = 0;
>> +       adev->smu_workload = wl;
>> +
>> +       mutex_init(&adev->smu_workload.workload_lock);
>> +       INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, amdgpu_smu_idle_work_handler);
>> +}
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> new file mode 100644
>> index 000000000000..09804c3d2869
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
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
>> +#ifndef _AMDGPU_WORKLOAD_H_
>> +#define _AMDGPU_WORKLOAD_H_
>> +
>> +struct amdgpu_smu_workload {
>> +       struct amdgpu_device    *adev;
>> +       struct mutex            workload_lock;
>> +       struct delayed_work     smu_delayed_work;
>> +       uint32_t                submit_workload_status;
>> +       atomic_t                power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
>> +};
>> +
>> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
>> +                                uint32_t ring_type);
>> +
>> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
>> +                                uint32_t ring_type);
>> +
>> +void amdgpu_smu_workload_init(struct amdgpu_device *adev);
>> +
>> +#endif
>> --
>> 2.34.1
>>
