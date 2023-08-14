Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072077B830
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDD810E1C3;
	Mon, 14 Aug 2023 12:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD4C10E1CC;
 Mon, 14 Aug 2023 12:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDB+yeUA8RWbrwZcpwmv0I38F4mSxlWnUXy0AptCIhHyj6JH7Mps40w7l8BxfRyzuoTAaWX+1DQNass6M0pDi0F8pAvDpkoNqnaZQf+R+Hs3qNZN6OzMKMExaCu8kQfb9kVGfK0L4fIAl2HuVJu25qCmD7Vfop8+j1Cl/t/uiYiNIG83Sk1dhFc7/cMAVgBCkW/F4L3TTx0g2l3aFbTs10pKGikDghohRRFJn8KTSK2kYUc5Mx1tuFBVL4+oxRsFW+1cVW1Z4a/mDRGJ19T3Y1SQhWOliAu7mz4mgdkjo+Zw0Olzjk9eouqDxC3YvipiTUBBt2GsZhM27boZpQ/+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yC5wQEkfg6FAByPUMr9O/xk4WWKjDLIx+AA/BGIg0/M=;
 b=jsWNcSDPxttOy+BI+Q/nzYUdS8kGUYpgtnCxL3fOlmh88rfUkror95/4nvc4S3YU1H2oF5/WKOotQaNNoRXxIxf5G6kqhK+S6X+nGlJySJX3najkAqG5u5fYlpcJKOn3rcjG0ZvBuVbyB8KZXVW8Re5oByNdY7kOiv+UZ9jmxAisQ1pDC8UlH0yZo7l9nQsgU0/Q+NXDRsPe+3Gm08eGmHZNiriBBTKzPklPvCmrBD3NI+IzHcGmKOmY5yGLSi98mLV2xrCWUbWWG7MFy7pF9CciIDJzdRQG1VpPBK5AWcxXOEG9ld7vofoO8Vmin+/e6vTx1SurJPQK7YXWKFR5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC5wQEkfg6FAByPUMr9O/xk4WWKjDLIx+AA/BGIg0/M=;
 b=KVm6ofxdjb3yHh82FXC7zhvqd2wu7GDsxc7uIEHozY1ktmKD2uwEgiQG5Bjc1GqXd2HJWj0qX11dZUv6wafga+7cN9N3Tr5sHuJd8mMdtmXcRlmRvlHgfqF+xi21Ls08y2ate9ZtSkoW3dii5cpbcTlt6Z4lYZoL+fAEpwNn664=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8064.namprd12.prod.outlook.com (2603:10b6:a03:4cc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 12:06:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 12:06:01 +0000
Message-ID: <ea08865e-bacb-f377-7ac0-c191045fde72@amd.com>
Date: Mon, 14 Aug 2023 14:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230814073438.10682-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: b27351cb-26a4-4913-9c4f-08db9cbed370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvV/mciy6O7xUY5KKN+g/caKJOrWARzkSHjaWuezeBY4X2dntADDisxikh3Ri+kRo04cvZf/sKF4S65v2P2JNFc9KqzeJzrZ+7AsJ57GjQVnJLumA0QLYPg10xfIOlc4znoack279XxbuA5Rxzo8X9Ne9bdi2ilX9aK4yfxHBiW8BApVsOxuGr1sFDT4hx0XY/1aRbdSVhhFR+C1Wjh/4eQBuzx9VzgI2hDTj2fN6QtPaaiNz94DE7FwawuVH2LUELw6vngfV+lXRuTN0DgdSAECqAIjKB3Ho8qR/aeTfwqKacWOpMDEJKjnOdyfT5SadJIbNmitAzbGgWRvH9+UumlgYdplK5ufdFyM9k0jl9jfhBXnTQPRGvqjEq3TLLB6EJOHRGX4/tm9m3l7Mrdyn5eOlGPYJpoUveyCtcGLAM8O3WKqbPhN4Hqc+5NEzAhFuotAw6FybWw3kO7ugfSayiZZasDEEutdA0+/ZoBqClChJXxnEMHHjv3qCWXt/yDsPl7nx0AnrWy9R0p/dO2OAr+pP2BlQUGm+Rzn66CeyhX1H5nPqRsEVfHPBio+OHToqJ8PxoJ6RhlErxWrTVseviui+uVnv75ilFToA75SM+Q29+i36+Nw01WEVL4Yq0rkDtJPGeV9U5BEbAoPqTciCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199021)(186006)(1800799006)(36756003)(5660300002)(31696002)(2906002)(86362001)(30864003)(31686004)(66899021)(83380400001)(316002)(66556008)(66946007)(66476007)(38100700002)(41300700001)(2616005)(6512007)(6506007)(6486002)(8676002)(8936002)(6666004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c054RDlOY0RubWdpQ1VYQzBCaXNySUFPWUJYSDBvOVpOSlI5UDJLSjJFNFA1?=
 =?utf-8?B?bGszampVdnBUWmg0NXZSU2QyVXBpYm1qYi9QbEhSZ2NVeVp1K1BvLzViYXE2?=
 =?utf-8?B?clJnV2NtbGpya0kzcU0vc1ZtTEY5bDAvajVwdXg0c2tiZ3FBa1pJZDliaXNK?=
 =?utf-8?B?a05uT3RKWVFUUS9uUUxKT3Azc2RlR1Z6VUJORktnZDQ3dWc0RmtIeWhHQTU1?=
 =?utf-8?B?VUpkNnNTaVIxRGJGMjZvaGE2dTQ2VkJ1S2o4Nmhrd0M4WU01U20xL3NEWmd3?=
 =?utf-8?B?b05YaFNpYTNtN0d3WjNkKzEzOGduSHJXM1U1YmFuWG9YQ2VoQVZuWXRBS080?=
 =?utf-8?B?Q1IvYXpKU2hyYWpzZm9LNnF1T3YwTDRFZlowTUJYVndoQzlDYlZTcGN5Y1hG?=
 =?utf-8?B?NTdKN0hmY1ZaL3FtbkV2dUc4UWdTUmJmWEN6c1EzNVJpQXZUbjhsT054RUlJ?=
 =?utf-8?B?YW5nWi9JbVBJWllnMkFQM2w0OFMrcVVwYkNLZHc4SGxVaXV6bzJRL2FTL0Fv?=
 =?utf-8?B?ekNFNU9GMFNTMFYveWhPM3libUFZN2d6K2RRM09uR2wwZXlKaUhhY3k3TThU?=
 =?utf-8?B?T2tUS1c1ZmQ4NUE5RU5tYnJUVUgvR1N3dHZTeEZhamY0bXhqMjg0VzFxR1Ny?=
 =?utf-8?B?cjBZVGhpZTVWNHFoaExHUUJyeGJFNHRGcWo1ZWhoeXlGZVVhTmxCTzFyUUZ4?=
 =?utf-8?B?WTIrN00zRkhUbzIxRTloU1R5N1BHTVE2OUtXS0R5QUJZWWtnY2ZqK21HN0JP?=
 =?utf-8?B?MStKTlpCMkhWRE8ySGFEalluZDJwS0xCMm5kbGVwYUxsd2RKcEdHOEM1UXFV?=
 =?utf-8?B?aW5rSU9KUUxOQi8yeXBuUEpPWk9sY1NKTk1GZ2hXM21GbXhOaW0wMm9SQmhD?=
 =?utf-8?B?blZlVjBqMytYTkhWWlNJdWFrS2ViTzFadUt0OUdjK2VDNGZvSno5bEphbkRT?=
 =?utf-8?B?L3QwdnRwTXp5VDBOTkxubDlWblBJYWlwSERyUWRJK3RJZ3N3THAxeWJqcWhQ?=
 =?utf-8?B?Y01qN1FPWXBrVVFVK0lSRTUvOVFiYzZqZWR3cVJsc2ROY0ZOUm56aGlNcHhN?=
 =?utf-8?B?UDVtK0hsZVIyeXkzNFdhMWcydlp5ZEJPNDRDS05HZklLUTFmVWxJRjU3RGor?=
 =?utf-8?B?NFp5WDVRcWV6SW5ZR2NNMkp1ZWdpS241Z3k5MVRDNXIvd0hsclhtdmo5YlVC?=
 =?utf-8?B?TnlXQjJwL1lMYkpac3U2TVdsZitXK0hZV0ZmTjU5cXNwZnJRQ3BxNmltWi9S?=
 =?utf-8?B?WGFicUZIK0hXVUpvQjNVTi9jODdia1hxeDBYWnVJTHp5d21lNzA3UG1DNVNw?=
 =?utf-8?B?UXBCRkJZOHQ2dVFHVHNVVktHcnhNZm8xbzVNRGxESDlOQjVXUGJMNEgvcUdP?=
 =?utf-8?B?SWJjRmM5cEVTeHVwcXFLT050YjZhWkdBODh2K2V4ZEd2Mk5DZE1aZXRKU1M4?=
 =?utf-8?B?ZXZxbUxNR3gxM3Fvd24yaFdnRWRLdG9JVFZib3MwZVM5dXRHYTlwSEpYQnJo?=
 =?utf-8?B?Y3RRRUMrUStMdUpyTEFCbjMwNnBzTS91V3hrbmYrYUZQU213L3htWkc3Y1R1?=
 =?utf-8?B?VG9TYTh2OVhyeXp5WHRlMCtiVVdNUXM1aHNYdmlER29KQXBjeHAycXhKYUQx?=
 =?utf-8?B?ZThPcitKOWM4TnpMbEJmdC83L1RlckJzeDRhanArTUE1UXp0SWNRc0QzZHJr?=
 =?utf-8?B?emN1T3o3b0ZyZ1Y2UDFtNnhMdlRVSXZKVG5yUjNqWU1KQ2dTU3RCd1JwWHJa?=
 =?utf-8?B?VVVIdGdzNjdrdXhuM3JXMFcycENCdnVmUUZxSVk4bjFaZnBZaWtGUkNOc0Qr?=
 =?utf-8?B?aE1YbU9CZTRDTjkrWDErZVdkek5lVU93WkJzd1dxOGFoeVVZT3hrV2NoT2Rs?=
 =?utf-8?B?R0R2MlErT3RrYXRZSGxPZE83ak9wckJuY2puMFB2TXVTYzA5V0d1aDlyYUpO?=
 =?utf-8?B?NjJjYlJIZDI4MmxJSHl5Qm9maDBiWUdUOC9FdGtuQytTZXBqaThQT2Q1Y3NB?=
 =?utf-8?B?SndzcUcvbElzRXlCTEpjbzZMdkRucHZUVlNHMW1CTkkvcU16N0tleExuTmdD?=
 =?utf-8?B?UkI5NXNPdG5TTTkxWG5XMkw5NkZrdkFFd0NJK0pFWnBrSU5saklTdXhMSUti?=
 =?utf-8?B?OTArczhBUlBMM3VXVU9IL1NpNUhsTUMyVUpvKzUvVXJHTHZHemZIa3VvdXVS?=
 =?utf-8?Q?02J4IqxCG2cWchYjoHxKw950+q7Xp1XZm7sBxmurFbnd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27351cb-26a4-4913-9c4f-08db9cbed370
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:06:01.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/RZ9a98fksw4cljIznyD4x1u4zHKLsLLCK2KfRqRRV5nZcvcXtJ+1GaTVHwoySG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064
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

Am 14.08.23 um 09:34 schrieb Arvind Yadav:
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
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
> +
> +	if (ret == 0) {

Please double check the coding style, stuff like this is usually 
complained about by the automated checkers.

Apart from that Alex needs to take a look if this here makes sense or not.

Regards,
Christian.

> +		/* Set the bit for the submitted workload profile */
> +		adev->smu_workload.submit_workload_status |= (1 << profile);
> +		atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
> +	} else {
> +		DRM_ERROR("Failed to set power profile, error %d\n", ret);
> +	}
> +
> +}
> +
> +static void
> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
> +			   enum PP_SMC_POWER_PROFILE profile)
> +{
> +	int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
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
> +	     index >= 0; index--) {
> +		if (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
> +		    adev->smu_workload.submit_workload_status & (1 << index)) {
> +			amdgpu_power_profile_clear(adev, index);
> +		} else if (atomic_read(&adev->smu_workload.power_profile_ref[index]))
> +			reschedule = true;
> +	}
> +
> +	if (reschedule)
> +		schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
> +				      SMU_IDLE_TIMEOUT);
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
> +{
> +	enum PP_SMC_POWER_PROFILE profile = ring_to_power_profile(ring_type);
> +
> +	if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
> +		return;
> +
> +	mutex_lock(&adev->smu_workload.workload_lock);
> +	cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
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
> +
> +	mutex_init(&adev->smu_workload.workload_lock);
> +	INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, amdgpu_smu_idle_work_handler);
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

