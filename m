Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1797377F194
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8E210E405;
	Thu, 17 Aug 2023 07:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F00810E3FE;
 Thu, 17 Aug 2023 07:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+CLFBDAX+e5j/Q7RSI4l/aS5/ynCb9F5rdn7+//dyStUgXXeTMMFdzFvTQTqtvKjNmOswi4kYRKu4s9sG8eo1YnhgpS1nX1QWjcmBMnlbz8Yt1fqGFnwW9tkktipVkfwOl89k7nbyvPbO+HA7hY5YvtFtXUbpv0iBRyxqZKdSonqQ4O/mpfSaOG/9Yfp3UzWboxQkGc2cmA2wnNc+a2pfXeFv0XnfMtURph0Yr8SO5X2xgo+A0f59DIwxKYBr33HWZIQM5F1sj21SWzAoQ+iV3igm93NZ09/blU0Zmjqz30jCg7CUBG5b5PjdL/hC6ENZKqgJGqM9mobXFGxeANUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qxx+/Lj57XEF0wDfRBk/TyWQMfUTcEVsbWpHnZswgr8=;
 b=f7Evsl6AxDt3OGKEFFYlfbF14KmPskqXXv0lZwKxckz/WLRUtWEF1ndMu0wuywZyLMpdT76C1nG41UvCMC14enHN1/YCLpIW66zIhnwYEZWmVaGIg8oMy60RXXaX0UcWyKNjSjw/ZNDgqhXIg4+kq4j05X2TN1D9goiVvNWDaivihScE9tLuq3tfjjg2cZKfJvhnWZaCRtqiqHs63i5/POgOLcdPjzvQIhDoPORjYsZq0wOFAvQfD0AwsHzG9EX/iOJFhCv1ChMswakl50xQIrhRTdEeF00/EvO1nzv187O0KlxVZ3/Umx6mF6Qp6kZMklMJ0EUrC5R4mDpanQnD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qxx+/Lj57XEF0wDfRBk/TyWQMfUTcEVsbWpHnZswgr8=;
 b=emdjpfGVzt2YYcxBeQHYxsVxmVf0SsuU4AVYg6GlKeHxyJ5xeGo+56EuxkcnAGFl5OEDcjYOaKFN6NoLMDBmzpvi7m0Vww0rHVi9c+HOJ7iX8m5VnaWjNX+cEpKABwcCovMTQLjoaPFCiJTpkq2xu56O804cVeVHQRhRdfGyq9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 07:58:20 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 07:58:19 +0000
Message-ID: <63778ba1-6ae5-0cfe-9a29-6b8cbd8118e3@amd.com>
Date: Thu, 17 Aug 2023 13:28:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
 <0713c5eb-0f24-20b7-f045-e1cb1e92f84d@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <0713c5eb-0f24-20b7-f045-e1cb1e92f84d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: ec337636-6739-46f6-d69c-08db9ef7b8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WcWMPrdcFLVcIpfXLv/ySd6tJ2ZWA0Ad8aMSHYtdc/9Z+NyN7B85V+EvtN8ckYiSOsoQMxaJ4fW6HYVqwdZZ9CfWf4+Zp9PWBFkCb6BKWMLWQxHpe9bwv01JxbpPd63OxOeXQXm5SUrdojFcb+CXRmNUDLMY87te0ylQS/+/oVDJlP6Xb9FG8tkJ/bUe0afx5FnX+xOXe4ShVqNAoZNHaB+gL4eCOcFpJDctOX9ggOigPbZFM8RK4nl4RrHF/htnMHQxC5t1MzHBBO4/ohXq8M3xaeD0yUDDMRJq0jzlHWyVxwnUVktwC30cEoJ5FTCfrpesE+jn2Waerefp6Xu9f0+rk1EdElGTSyPs+LW80i3UIO6MAbAiJCzIaWM7Ad1fnolQfrxviFijr7p0YQkau2mKQfBGiay+QNBZ256qI1K551lkKiQwGDfFdIUanU7fKDeFBDqtNU4Tbs8A/bKetn5ISax+oDIKd8yHHNXHLQiglmM/ErpotVT6YFfwhu7xGzwBbySDRYJxtsP7wXLf2cfQJphXjwOahbD9vsvfjSh75ZRF1ijn0b5hudSSpPxXr/3Hh3fZjpEDzM8Ce/90kUTLYoMWTvhBYxP8cyITNMsyFZaaQdYieYiz+iJ7Zxcp+a7Rqnrh7TDTAmbM+KVS1PxENNTZz3ZjFRRqK7EPO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199024)(186009)(1800799009)(110136005)(66556008)(66476007)(66946007)(5660300002)(2616005)(41300700001)(30864003)(2906002)(316002)(478600001)(8936002)(8676002)(31686004)(66899024)(6512007)(6666004)(6486002)(6506007)(53546011)(36756003)(83380400001)(38100700002)(31696002)(26005)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCs5eFlFNWsrajFKMEdFZ3RpV2tjeTRKZ002dm9ZS2dGb2tNUzRLSlRGdysx?=
 =?utf-8?B?a21rV2ZmVXE3L3hWKzIvYkxVU1FjUVh6VXJTdlJlRlkwWHNFd2V0aFlCK0V1?=
 =?utf-8?B?SE9iTUJiSFUyeklMTVQ2VUR0aVVPVUJJZlhjNUZjUHlXR3paVEpqNGFjMExk?=
 =?utf-8?B?a1F3ci92VExXZHAwaFFWamJseWxUaUFyanJ6b2Z2Y0x2VFNaNk9YNzdwekk4?=
 =?utf-8?B?NDEwMEcwdUpja04ybnpxL0VoTXcyVmJEVnFOWEs1Y1NBL1hZMy82RjdnUkJO?=
 =?utf-8?B?Tnd2ZXhrUzJXWldvdzdEVjhad3RIUW1yQmZIOEYrdGNIeXU3L3J5TVAyOVFW?=
 =?utf-8?B?RGxGb1pzNDZBSzdJMWxmeWpnUEllQ0QveEhWdE9Ta2xFNkhjbHZGd3R2c2kx?=
 =?utf-8?B?cDZReDFtY2hlWk9FQjlTTHNXZHo3MUNoUTNXeTNicjROZStvVXhKbVVZV0Vm?=
 =?utf-8?B?OUZGRzAyYWdjdW5rdFNuSTJ4UW02SE1jL0tyT3ZNd0h3NWRRL3kzdEkxV2kv?=
 =?utf-8?B?aWFkdGMxMEh2dFkrNmVDTnNOUWJwS3M2MmZkUHhDSnREY3RLRzVpNG5JcjNC?=
 =?utf-8?B?ZmpFdDc2YTdpVVRtbHE1ZVNXaU1BUlp5UnM3SndPSmIxdGlFQkViVG43WWdw?=
 =?utf-8?B?WFR6V0xwWjVGNGJ1TmNtaG5iZkdiTnprbTBoZm56U0tqVHJmZmNtdllwdXI3?=
 =?utf-8?B?NUl5NWxjbTV0ZEhVcjh2YjZOTUNoZVMxWkI2M2h1VEV1TjZrdTRjeWtxK1VC?=
 =?utf-8?B?bmRsTWFWR1ZpVlBBbjY5ZDdCbFhrZDZhV0hpTnh2R2xxVTdyQkUrUFV4SWVZ?=
 =?utf-8?B?aGhEUTdQaldCalNWSm1iOHJlbXlKVFY3bEhXOURqQWFCN2xlNWhNMlZXcnBI?=
 =?utf-8?B?a0pJenBET2FJUHAvOHJFMFRxbm0raGs3Tm1oZUdMRmRwMTUvUCtjbnl1S0M0?=
 =?utf-8?B?d25ESVJTSDc0UG5lVmtCL2c1OUR0RG0yRVZxOWdNQjkxeVdSRTM1V2ZYOFhB?=
 =?utf-8?B?SUVjZEVaNGgrZ0UwYTFaRXVRTkU5eW9aRENzaFQvUSt1OFM2TUNoanRmaFVo?=
 =?utf-8?B?dHJVaUhuTlpCNTZQY1REQ2Z1VzZEZ2QwUjRtdWovTDB1amxmYnFPcmZEWitL?=
 =?utf-8?B?U1NBS3NKb1ZwbDlZQS9QZ0JiZzFhUFp6K1ZTNHdDUFZva1JRazlUcHViYTF2?=
 =?utf-8?B?S1JITytuelFHdTdxRktWeGcvU21YNk85WmRydUo2QmwrRWQ0OERhcFdrVDA5?=
 =?utf-8?B?NnVCV2lRNS9JM1M5ZmxyYlJ5MFladnpNRlF5cVJYNzNBaWJIUzBWa2xHVjdO?=
 =?utf-8?B?K2s4V21OeWg0bHczQUpSTUtIdCtlVWdZMHpsZDlmVzhVK3hDSVFja3l5Zmcw?=
 =?utf-8?B?bWx0YmU2TEd5ODF5bCswMlRFem1GaDEwL2tuMitMSkdoZ1FjTENxSktoa0tk?=
 =?utf-8?B?MTl1cmlReHFBV3ZZcVU2RE9SQjZORlZpYjBaSm9ER1JnUktVVGlraVdUbWJD?=
 =?utf-8?B?cTQzWldJQTN3K1ZZdjI1b2t4bWVQNFc5WGtuMnA5Q3c4ZHYyMkgvc2RjNXpL?=
 =?utf-8?B?d3RYYXR4VHNWMDZHNlkzdmpVYjJRSUF0VkE0bEZleXNxVzE3WlpXNDBSODFZ?=
 =?utf-8?B?eGF3TDVrMVE1bG8zUERLcGJmVE1hNXY1b01MMnZsN0p4QW5udE9PRlZjRWtu?=
 =?utf-8?B?WG1VUmNRbm80V0IvV04vc2FVWFNWRGxLUFZMdTM4aGhYeGtyTTJFMnZBMkJ0?=
 =?utf-8?B?aDVaT2JhcXJaUzVTUzdOazJYa2RIU2tKbkhWQmo1aDh0cHE1WFNVdDhrVnVK?=
 =?utf-8?B?TkZ4VzUzbGp2eXVNOWVveG4yU2JZYUpuVDlSSXRPZlBHRGVqdCtaTXZsTTdm?=
 =?utf-8?B?VmU2dWdJOXE2NW0xOTZzL0NKR2c0YlBNZDR0TkRSOXVOT0l4VjFkQXAvckF5?=
 =?utf-8?B?ZDhjbnVSUElsSlAxWVoxWFk4RnpqYVdpbm9yZDlJNENKWDd1MWpQRUF6TEVM?=
 =?utf-8?B?SlprOEFRNHNYYmJmTkRYeldnRkVhM1JwMXZtdEVaN2RnemNrdURZbUVudFRn?=
 =?utf-8?B?TEtDb2JiTjczUEVieUh3b3NBM2tWQmxsTW9jbGM3U0E1MHN1RGVEU1laME5M?=
 =?utf-8?Q?Syy1fWZpuJbm6+XNYlKNuVdSZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec337636-6739-46f6-d69c-08db9ef7b8ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:58:19.8860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldkfXoTelOLyvSg3nmkARaVSlQnwDWO5ZD7juVCPXxcOEWyVnfQeY/5T/seTj9B6HQ8HeEn+g2GoFvPmhh9KKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
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


On 8/14/2023 8:28 PM, Shashank Sharma wrote:
> Hey Arvind,
>
> On 14/08/2023 09:34, Arvind Yadav wrote:
>> This patch adds a function which will allow to
>> change the GPU power profile based on a submitted job.
>> This can optimize the power performance when the
>> workload is on.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
>>   5 files changed, 206 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>   create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>> index 415a7fa395c4..6a9e187d61e1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -60,7 +60,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>>       amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>       amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>       amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>> -    amdgpu_ring_mux.o
>> +    amdgpu_ring_mux.o amdgpu_workload.o
>>     amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 02b827785e39..1939fa1af8a6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -107,6 +107,7 @@
>>   #include "amdgpu_fdinfo.h"
>>   #include "amdgpu_mca.h"
>>   #include "amdgpu_ras.h"
>> +#include "amdgpu_workload.h"
>>     #define MAX_GPU_INSTANCE        16
>>   @@ -1050,6 +1051,8 @@ struct amdgpu_device {
>>         bool                            job_hang;
>>       bool                            dc_enabled;
>> +
>> +    struct amdgpu_smu_workload    smu_workload;
>>   };
>>     static inline struct amdgpu_device *drm_to_adev(struct drm_device 
>> *ddev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 5c7d40873ee2..0ec18b8fe29f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3672,6 +3672,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>         INIT_WORK(&adev->xgmi_reset_work, 
>> amdgpu_device_xgmi_reset_func);
>>   +    amdgpu_smu_workload_init(adev);
>> +
>>       adev->gfx.gfx_off_req_count = 1;
>>       adev->gfx.gfx_off_residency = 0;
>>       adev->gfx.gfx_off_entrycount = 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> new file mode 100644
>> index 000000000000..ce0339d75c12
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -0,0 +1,156 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom 
>> the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>> EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>> OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>> USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#include "amdgpu.h"
>> +
>> +/* 100 millsecond timeout */
>> +#define SMU_IDLE_TIMEOUT    msecs_to_jiffies(100)
>> +
>> +static enum PP_SMC_POWER_PROFILE
>> +ring_to_power_profile(uint32_t ring_type)
>> +{
>> +    switch (ring_type) {
>> +    case AMDGPU_RING_TYPE_GFX:
>> +        return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>> +    case AMDGPU_RING_TYPE_COMPUTE:
>> +        return PP_SMC_POWER_PROFILE_COMPUTE;
>> +    case AMDGPU_RING_TYPE_UVD:
>> +    case AMDGPU_RING_TYPE_VCE:
>> +    case AMDGPU_RING_TYPE_UVD_ENC:
>> +    case AMDGPU_RING_TYPE_VCN_DEC:
>> +    case AMDGPU_RING_TYPE_VCN_ENC:
>> +    case AMDGPU_RING_TYPE_VCN_JPEG:
>> +        return PP_SMC_POWER_PROFILE_VIDEO;
>> +    default:
>> +        return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>> +    }
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>> +             enum PP_SMC_POWER_PROFILE profile)
> This function expects the caller to hold the smu_workload_mutex, may 
> be we should document it.
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
> I think we should pass this return value to caller instead of keeping 
> the function void.
Noted,
>> +
>> +    if (ret == 0) {
>> +        /* Set the bit for the submitted workload profile */
>> +        adev->smu_workload.submit_workload_status |= (1 << profile);
>> + atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +    } else {
>> +        DRM_ERROR("Failed to set power profile, error %d\n", ret);
> This can be a warning instead of error.
Noted,
>> +    }
>> +
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>> +               enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
> same for return value here as well.
Noted,
>
>> +
>> +    if (ret == 0) {
>> +         /* Clear the bit for the submitted workload profile */
>> +        adev->smu_workload.submit_workload_status &= ~(1 << profile);
>> +    } else
>> +        DRM_ERROR("Failed to clear power profile, error %d\n", ret);
>> +
>> +}
>> +
>> +static void amdgpu_smu_idle_work_handler(struct work_struct *work)
>> +{
>> +
>> +    struct amdgpu_smu_workload *wl = container_of(work,
>> +                              struct amdgpu_smu_workload,
>> +                              smu_delayed_work.work);
>> +    struct amdgpu_device *adev = wl->adev;
>> +    bool reschedule = false;
>> +
>> +    mutex_lock(&adev->smu_workload.workload_lock);
>> +    for (int index  = fls(adev->smu_workload.submit_workload_status);
> This can be kept outside the for() for better readability and alignment.
Noted,
>> +         index >= 0; index--) {
>> +        if 
>> (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
>> +            adev->smu_workload.submit_workload_status & (1 << index)) {
>> +            amdgpu_power_profile_clear(adev, index);
>> +        } else if 
>> (atomic_read(&adev->smu_workload.power_profile_ref[index]))
>> +            reschedule = true;
>> +    }
>> +
>
> This block can be re-arranged a bit for better readability, pls consider:
>
> for () {
>
>     atomic_t val = 
> atomic_read(&adev->smu_workload.power_profile_ref[index];
>
>     if (val) {
>
>         reschedule = true;
>
>         break;
>
>     } else {
>
>         if (adev->smu_workload.submit_workload_status & (1 << index))
>
>             amdgpu_power_profile_clear(adev, index);
>
>     }
>
> }
>
Noted,
>> +    if (reschedule)
>> + schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
>> +                      SMU_IDLE_TIMEOUT);
> pls check the return value of work
Noted,
>> +
>> +    mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
>> +                 uint32_t ring_type)
>> +{
>> +
>> +    enum PP_SMC_POWER_PROFILE profile = 
>> ring_to_power_profile(ring_type);
>> +
>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +        return;
>> +
>> +    mutex_lock(&adev->smu_workload.workload_lock);
>> + atomic_dec(&adev->smu_workload.power_profile_ref[profile]);
>> + schedule_delayed_work(&adev->smu_workload.smu_delayed_work, 
>> SMU_IDLE_TIMEOUT);
>> +    mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
>> +                 uint32_t ring_type)
> I would prefer if you can split this patch into two, one just to set 
> profile, other to clear profile and schedule work.
Noted,
>> +{
>> +    enum PP_SMC_POWER_PROFILE profile = 
>> ring_to_power_profile(ring_type);
>> +
>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +        return;
>> +
>> +    mutex_lock(&adev->smu_workload.workload_lock);
>> + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
> Please check the return value here and proceed only when we were able 
> to cancel successfully.
Noted,
>> +
>> +    amdgpu_power_profile_set(adev, profile);
>> +
>> +    /* Clear the already finished jobs of higher power profile*/
>> +    for (int index = fls(adev->smu_workload.submit_workload_status);
>> +         index > profile; index--) {
>> +        if 
>> (!atomic_read(&adev->smu_workload.power_profile_ref[index]) &&
>> +            adev->smu_workload.submit_workload_status & (1 << index)) {
>> +            amdgpu_power_profile_clear(adev, index);
>> +        }
>> +    }
>> +
>> +    mutex_unlock(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_smu_workload_init(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_smu_workload wl;
>> +
>> +    wl.adev = adev;
>> +    wl.submit_workload_status = 0;
>> +    adev->smu_workload = wl;
>
> Why do we need variable wl at all, which is a local variable of the 
> stack ? You can just do:
Noted,
>
> adev->smu_workload.adev = adev;
> adev->smu_workload.submit_workload_status = 0;
>
>> +
>> +    mutex_init(&adev->smu_workload.workload_lock);
>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, 
>> amdgpu_smu_idle_work_handler);
>
> Are we missing the respective amdgpu_smu_workload_fini which will 
> destroy the mutex ?
>
Noted,

Regards,

~Arvind

> - Shashank
>
>> +}
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> new file mode 100644
>> index 000000000000..09804c3d2869
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom 
>> the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>> EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>> OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>> USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#ifndef _AMDGPU_WORKLOAD_H_
>> +#define _AMDGPU_WORKLOAD_H_
>> +
>> +struct amdgpu_smu_workload {
>> +    struct amdgpu_device    *adev;
>> +    struct mutex        workload_lock;
>> +    struct delayed_work    smu_delayed_work;
>> +    uint32_t        submit_workload_status;
>> +    atomic_t power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
>> +};
>> +
>> +void amdgpu_set_workload_profile(struct amdgpu_device *adev,
>> +                 uint32_t ring_type);
>> +
>> +void amdgpu_put_workload_profile(struct amdgpu_device *adev,
>> +                 uint32_t ring_type);
>> +
>> +void amdgpu_smu_workload_init(struct amdgpu_device *adev);
>> +
>> +#endif
