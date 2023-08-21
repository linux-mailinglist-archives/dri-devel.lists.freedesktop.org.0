Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FB7829F5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BF010E24D;
	Mon, 21 Aug 2023 13:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF85210E24B;
 Mon, 21 Aug 2023 13:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E95PWYK9MqvlTzkLc9H5hCtzoKPsAep/N619lkQ1EhMgFFN2rHlI6Flym3SqCfXzDSpPL9cM2b4tzklqP5/dST547Bg9cc/5ZKc+cglJC0jf947pDyRYtvvug7xFweUcdihhbFkLKzqO8MEwtG3C0eAM155IqedbIsyohtRIdI4hvUms3uYa5rAuxc0Kng9rp2yyDM7OYDCAU+rnw7xgQAUSdbTLEIzaOFhQS+2wmIo8/5HrXhHfWPRCNBTWsvjVAsH7t0ZQm0ju9hHwJVHb12BN6ED9cohE/k0wdQfl1PyI1Ss8Q5a45OP938jclh/fU1Qm1ECfgihFc21biOc/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bljo3ZiZJpqGcWTvMgHwLwWkrMV2ym3XZo9FWCETt6M=;
 b=SmLcLVOZJfyFQZFBR/brMY2pooxXtxtUOtjzKrclQ9y4pKYiCiVkZfDdb43tTAPDMI1rf1xEZwq7cgG/pdsrJc6IwuXCPKp84jUjXh0T69SV0c3hclVozLJo3No7JdYeybifKw17ZZReOjPXBNj5kqe/LnwTZ52IGnoGTfhYL/TWXdrCNSEeLj7e+OG5ZQrJLvqhOHD9swG1oOxqJHDlBZPNc3B+mYEheal8r8J/azg50pKdvXkp128VtP/fOUYn/FxktXOVhbEiS2lMQS5X3g+PwRSYq5YK98uC9lIG6+CCEy6NL4o70U+MQq6fqUEtrPg/M7I7rBOPOEFGMZGzhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bljo3ZiZJpqGcWTvMgHwLwWkrMV2ym3XZo9FWCETt6M=;
 b=v24Zdj8D0IMeko/2v8akR2tnffxaxXXNYlHbvOaZ9Ikr+le5xrMHuawhLcV3S0iZucWlr1TAhNydVD3B4XQd4K23W9BrJuak0jW8dSwFFyJYpUfmhRwxN8GI/mkN6jcO5h2DwSb/UEU/yKYzTQUroIsSNCDoDB745qDwG/C7f7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:06:19 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:06:18 +0000
Message-ID: <3e20b067-c02a-1911-cac9-3e547a14b565@amd.com>
Date: Mon, 21 Aug 2023 15:06:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] drm/amdgpu: Added init/fini functions for workload
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-2-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::12) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 528c43b9-28b7-40b0-0e5b-08dba2476897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBvnf/x+CZp8Y5NBA2VuaUSdq/WjSDWSl2z5ZCuetpmVtlOXkjfx77eN+JaCVEg7GwcOabdfk7w3WlVIKpQ5VzHjafgKTpc2SaJKQtcxuBTPal4O//ELE9J0gcUAbX6rRQ3UrPv0a0gfWDSWYfsyUq7s7R1S0VSXHbWJeOYwKiKZbJcsL7tLoOFREosM3/CVeXsVPqlvNQ75WKMrheq4F0JLETn+W1rEvSJIrQN0cpP1nVFrylP6/zUC6u754oKLK/qOa4HpHtyxsmXW4Wl14TYKqZZk38k/xAZOv1RuPvBA07bfvqounmDlV/9LHH35EG58Oq+SABhGIvZbHjNQw5NB2jMae2B9DAcXD3w8esfUZ3XV6X87UYitYdPJnXv9fjwMhsTudoqSDJsDyx/pMOIFYtL2tErTX/qX/JLVTVkVwz+XhjEXaP7VfAwpg4Dnz9oXUxRt+poRYf34ZAxfHwx68o70Nk0IG4JOpv3EH8qDxCjiqw4GEGWf2tE8hjPNF2W/lsfLRQCZ6Tbf1s66OoF1ex5i7WkGyT1q94VSUr/mI1M1+1pPdZ6HmYt+Zj1bTj7JexWLMgnOkvp2oPvec+yTWphK3E3pQdzz9sWDyPBvti17an7OdRoEuvAtZel1Gmu0aYJmqgDOHaUP9+GxHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(66899024)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zlh5SXFuaWdyK1NyR3VCMVBBWXpOd3ZPV3J2Z083NEpjUjMwMFR5Vng2bXV6?=
 =?utf-8?B?eU9LSVNDRzkyVGtvTVlXQUgzeFN1TjJON255OWQ2djJWZTZxM2xLa0p5dFU3?=
 =?utf-8?B?Nk1SSzNnNEZ1ZDdCY01xa2ZLblE0WkxMUVZsUnNjNm11Y1NWd1ZJSlE5Sk1H?=
 =?utf-8?B?SFhzTTBMV2I5djVSeXdjVi9pRWVpWWtEUU9XMTN6MXFUVU9ZTUhvdGJmOG5L?=
 =?utf-8?B?SUlmVDExdDBqelhENDBFVk5NV1U1akxWUWtiWmFNZlFTZFdmZEsyOVpTRW5k?=
 =?utf-8?B?SDMxWXlySzgyYjlPWGJWWDJnN2tFZEwvWk54R1hsQ2dwS1hqYzRCOXhIYzJ1?=
 =?utf-8?B?WVZPRnBMTU9XbXBvSkFYNFNpWlp1UWVLSWpseGFWNUhGU29LcElobmN0Ulpk?=
 =?utf-8?B?eU50L0FZTmVnbFV1UGVYWXZhRHJDcThCZ1RyenJHNW1QQmJnd2RPajZlRkp6?=
 =?utf-8?B?VHBZMEhkK0RhMzQwVTFoRkN1K1Z4WFVZbS9qRW5HRTRqMldieHBGQWFMYWtK?=
 =?utf-8?B?Z2xJUzJwN1BvODVVN1crdzl5TXRSZHVFdzVPcGRBYjJzSGl2V0V6Ti9qZ2g5?=
 =?utf-8?B?TE1sVElsZTRiczQvV0I3YnZZQmxscFA2Q2xMRWw3QUlxbWFhelVnZXJmRGdI?=
 =?utf-8?B?VVJpVmZpc2V4VEZKNHVmTnlxQ1FVSHRkTTJtY0tOVzY2NndocHV1N0lRK1VW?=
 =?utf-8?B?N041VWFSSTFaUzlFZHlpTTdQUDF2NDVpVkY4ck1qTncrd2FHNU5wS0Fvb1hv?=
 =?utf-8?B?QW5hWitCR2hlUGlraWRNdEhBaUhRT2ZGUUJpUWtoU1RUODVmVmtQVkJPUkgz?=
 =?utf-8?B?cFI0ejZGUThrOWJHTjdCNGFmYmxHY293VDIvTnU3TW9iQVhWWFZ6ZXdsa2tp?=
 =?utf-8?B?THlpdHQweWtoTGZBczRxMExlRElTeUQ4TllXd2J2T2FCYUtiVU1WNU5SanNU?=
 =?utf-8?B?K1Q5a0E2TkNkNzdXcVNTbTBwQmJBYWJaZXd6bTZhMGVvSGt6Smd4aFV5bm0v?=
 =?utf-8?B?aXg4Q1ZDbDJEWEZnYlVWZ3NyTVFVV0VDR21uY0dlcHkwcUx6N3NVM3ZMa1FM?=
 =?utf-8?B?aGxmSjF6YVJxeFRhcERIVFpBTyt2Wjh5SjhrUHA3M2NydzNnMW81cDN4Ym1J?=
 =?utf-8?B?YzhkbGIxRjVlK1BIU2hKVW5YZk5kbVJETDNLdFV2Qm5ybEdpbjZZUjVKR0to?=
 =?utf-8?B?QWFVVnpoQTZBeWJQblFRTUs4QzRnRFRuSHA2Rkl5aTdad1d3SVQ1TjVQR3Nn?=
 =?utf-8?B?eklJdDhJeUFUdUhlNnViYnVhc3YxSzlrQVFUQ3lzR0wzVEtpQWg5dDM0L3Iv?=
 =?utf-8?B?SXdIYmxvMytkMGhuVlNWdGFEekovYnE3cFJaK3RkZXBqN1E5VlZlclkrTWNa?=
 =?utf-8?B?RWZMd1pPd2lwQ29rN1E5WVlnQ0hrcWk2MVhoV1JuZzByUFR2QncveG9TTDgr?=
 =?utf-8?B?Zkh5MUp4S1JzVWI3citON2pBMEhwVUdpdDNTbUNaK3NwOVFSOEU4Z3U3ajVt?=
 =?utf-8?B?V2lvd05QTWlKMnltMW9XbDIySm81Q1ZCVDUvWm82NGl6WnZrdnNHcmd1UTNa?=
 =?utf-8?B?Mms3clR6TEZaRnJVRFExeXpLQVhETXdQY2d3MkVPc09MS0xsUTl1bUVzblVl?=
 =?utf-8?B?UkEzZmpvcWhUVnVwWE5YZjhUa2dIckJaVUZIeTBZbTlnQTNFUkxzMHV1aytN?=
 =?utf-8?B?VmpzMDJhYms5RHFSL01CZUU1Z0VadXdhcVg0T3ZtQ091YVM3VjdZcEhZRTQ0?=
 =?utf-8?B?TFpyOXNjYTkyVUpjcm1TR2hGT0dMeFdDUC9PTzV6MjJlaWVUak1TR3BUL0VI?=
 =?utf-8?B?cm41bXJBY3NtUnVacjVqeEdMVjJqcFd3UmpWc2tYamNzc1N2L2R3NU53Skk2?=
 =?utf-8?B?bWNnTGZnQWJuVklSTERYdlo4WHEwZVYvWjlKeE5GU1VUamVaNVZ3dkZIS0Fz?=
 =?utf-8?B?TXlxRTNOdzdwR3UzWWhDdkhRY3BsSit4MmVRVXBOMktjWEZKZlRjbnhNRkFz?=
 =?utf-8?B?U1d2Q3RJeE1PTXVwTWRaeG1MNEs5c1JocE14VEVMUEFvQ01tWmErRVpwbGhw?=
 =?utf-8?B?NGhvTnh1bGgzdmRZdHdEYTIzNS8xVC9xSjNoVm5KcmU1Z0VueTFiYi9zclo3?=
 =?utf-8?Q?IvOIGKhLH5De2ED0DQfrfykzv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528c43b9-28b7-40b0-0e5b-08dba2476897
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:06:18.7372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djGLzhRqolewc+lAr+o8dBuyc0xyD5xS4+TPwLH0QzF4a+fKdF0WYL3NoHwdcczaBq+wYGPHOqgTJhwiGX0DtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Arvind,

On 21/08/2023 08:47, Arvind Yadav wrote:
> The'struct amdgpu_smu_workload' initialization/cleanup
> functions is added by this patch.
>
> v2:
> - Splitting big patch into separate patches.
> - Added new fini function.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 44 +++++++++++++++
>   drivers/gpu/drm/amd/include/amdgpu_workload.h | 53 +++++++++++++++++++
>   5 files changed, 105 insertions(+), 1 deletion(-)
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
> index 5c7d40873ee2..cd3bf641b630 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2243,6 +2243,8 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
>   	adev->cg_flags &= amdgpu_cg_mask;
>   	adev->pg_flags &= amdgpu_pg_mask;
>   
> +	amdgpu_workload_profile_init(adev);
> +
>   	return 0;
>   }
>   
> @@ -2890,6 +2892,8 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>   {
>   	int i, r;
>   
> +	amdgpu_workload_profile_fini(adev);
> +
>   	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
>   		amdgpu_virt_release_ras_err_handler_data(adev);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> new file mode 100644
> index 000000000000..32166f482f77
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
> @@ -0,0 +1,44 @@
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
> +void amdgpu_workload_profile_init(struct amdgpu_device *adev)
> +{
> +	adev->smu_workload.adev = adev;
> +	adev->smu_workload.submit_workload_status = 0;
> +	adev->smu_workload.initialized = true;
why do we need this variable ?
> +
> +	mutex_init(&adev->smu_workload.workload_lock);
> +}
> +
> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
> +{
> +	if (!adev->smu_workload.initialized)
> +		return;
> +
> +	adev->smu_workload.submit_workload_status = 0;
> +	adev->smu_workload.initialized = false;
> +	mutex_destroy(&adev->smu_workload.workload_lock);
> +}
> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> new file mode 100644
> index 000000000000..5d0f068422d4
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
> @@ -0,0 +1,53 @@
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

call it power_profile_work instead ? Looks good otherwise.

- Shashank

> +	uint32_t		submit_workload_status;
> +	bool			initialized;
> +	atomic_t		power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
> +};
> +
> +/* Workload mode names */
> +static const char * const amdgpu_workload_mode_name[] = {
> +	"Default",
> +	"3D",
> +	"Powersaving",
> +	"Video",
> +	"VR",
> +	"Compute",
> +	"Custom",
> +	"Window3D"
> +};
> +
> +void amdgpu_workload_profile_init(struct amdgpu_device *adev);
> +
> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
> +
> +#endif
