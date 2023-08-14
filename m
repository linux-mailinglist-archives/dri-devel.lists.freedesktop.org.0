Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F577B90E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 14:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBE410E1F1;
	Mon, 14 Aug 2023 12:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023C310E1F1;
 Mon, 14 Aug 2023 12:52:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY311XG407hdvx5f8lnMXzOPG91btL88KrVEnIdAOo/A+6bMw0srnl5LVAsvVEQgK1Tz0iyeRQei+9a8ORQ2+8xowuCfRsXPqMdJ89axSDVN4KMD8DnC9BsXvkZx5mY/69JQe+qLyCGCBiHwjWMcsrx1rO169jqExafaV7n5sZJf7yv884+XMtbLQf8aFsprkLGcTdLdYoI9/DBED93T86A/+NnwZKibWBarewL/KDyL7UFfBc6aZ3xSo1rWYfbHRQ2IoUiACRhRMdHkGSFdolWebrWZNfVfULFH9YHLI2nzIm37jBKMzrl3TXIVP97rZR+Qw8MWpnuXpJSPj1qaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o15rBE90Mowj5KdzQMhwdN3NPTbXtAOtaZmdW3RvaKY=;
 b=ngoSsq/U2ukCz2DWnUL1vmd1vudM5XOoDMuRFV9xX85c3g3q0kDollg2qIUUCS+06gUhoqd9zHV1RCWVQm38A4DgYToTGwnHUxxGJxvellTPEDv2VZizhhvO5FCkyYdWV4C0Gw4KcqxluEVtrBcd0FNI4L/XQehBkGixyEudp4jmnMDk80C09+ay6L852pCenvKPTmXzsWVxLKYWUutvIHbF9MJ82L3b6cB9vhfYjLGMJiKlD9fyUqs0dXGlnz3XJklZh4LGQIngJMjcWRqPMp0kRlbcTOcpd3s6UVs505Vzlk5RHGR+AeZot/n+8HeE9DWguGlZOW+YZG1TECLn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o15rBE90Mowj5KdzQMhwdN3NPTbXtAOtaZmdW3RvaKY=;
 b=bsdPa66DIVvAaqgqSwcfCJEpmXmXhuVtZyYuanczVot8pDhoExXqbmn/lFBBNDsGWcioBOGBo/rDW0Z1TW2SidNxZxeIzsUNmheMzervXdsFerF/knjQRR0Z1GWqt6lPp2e4rhBb6Vu1xFAOVZl9BM0HFu+s0b9aG2u//MngbPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 12:52:25 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 12:52:25 +0000
Message-ID: <3c7c0aec-f731-fd21-276c-e042a2caec8c@amd.com>
Date: Mon, 14 Aug 2023 18:22:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] drm/amdgpu: Add new api to switch on/off power
 profile mode
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-2-Arvind.Yadav@amd.com>
 <ea08865e-bacb-f377-7ac0-c191045fde72@amd.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <ea08865e-bacb-f377-7ac0-c191045fde72@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: f20fa035-0863-4d9e-7058-08db9cc54f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7pJkEPWAUIuCsJN67HZQk25QDsGJNug4TpukGuNFhwByZmR9AjA7vv6RU3ezdFj45yE7uX6llLsBhWY0ZJTwzEprcCJ+VPOZBQ9lBTIeIszhDwAjjVyADsLZ27ew2sYqbRdTp/Ay2AaC60bnkY9wfcmtZOC5qNaKco2J3BhfFdaWmcB/IlCqoSSMOAMTIyH0bLkJX+iKwVedpkNKGtRFnJue2gS43ZWAOH0S8lukj3iukX/GAGi5hmGaXERZpviitOaiiWTVY1X8g3di6C89Z0YsknJY0xOYrxUNlvQO1QHiMZtNGzgs6W5DbxOspM3RMFjAcGNmnL1AM3G6ih3Nah8hhcfE0H1sN6ET4bFg8czYK0+p7vaeFYbsj3VR9N5H3vz2C4+hKX4isegKrF+EBwP2+4A8g1qpQhBojE9AmEdFARxpp1pvHcCeEo4vC8ln9FAHb+eihOi1tafIgT7AZEFYIPvbrF+k+5hLi5f5/LrfEho6FjNHGaC+5qPqrNGFHatB68gfw2fM14oJJnE86V8KW5HRMOndy6YpSAyis2zukFuQ4Y0rNtVKTkF2xrXzY8T+IxEhWEqGRGqxxq2J2Bkixc+YerlaT8iH0fnzSFPX6aOd3iDhoxJD1TS+L8uxowL7FQ9E26uuvr45trE/XdPPNzRi2QEQ0pIrpdXpVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(1800799006)(186006)(451199021)(921005)(38100700002)(66899021)(478600001)(31696002)(36756003)(30864003)(26005)(2906002)(83380400001)(66574015)(6506007)(6486002)(110136005)(53546011)(41300700001)(66556008)(66946007)(66476007)(316002)(8936002)(8676002)(2616005)(5660300002)(6666004)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlNSOThzSU1xQnpscUxzS0NKMUFuN3E3WWdER0Jvbzl1L0dGcTRMSE1pMEtu?=
 =?utf-8?B?TXRsNW85Vk1LcTU2ZElHZFUvU3o5UUVHY2cxZXd4bFVSYWRGYXU3MkhTclRn?=
 =?utf-8?B?Z3FweFN6R1RKK3FzRTJBeUd3MHZuQndxdUl4ZHZOWEQ5RzZxLzVvMmQ0Tisx?=
 =?utf-8?B?OTdmZ2krdlBzWE1NS2xSNS9jL1V6ZXVidC9aOElnUGFFRWp4bGt6MDMyc3FS?=
 =?utf-8?B?NitpQUFRam5jekh0S0k3OFZyR1hQRGN6U0hnaUc1RnN6eVN0aThBbGpVaHpw?=
 =?utf-8?B?NzVtQkovQURrbElZc2dOcjB5OFEzbVBZNWN3TVpHQ1c5OHBrMnl2VUpSUG1a?=
 =?utf-8?B?TDNSYWQwdWo1NitaL3RtV0xDMXg1cGoxdTdyUXUzeEFTT0p4Q3JiOEVSWWVZ?=
 =?utf-8?B?aFpoOFdRYUNKQ1oyRVV1SnRZZ29FcGJ1K3FWTi8zaE5vbWdhcmI3cjVNVWdo?=
 =?utf-8?B?Qk9xUDA4eEl4R29EVWdYMU41VUM3RTRzSFZYTXYwQlhGWi9KZVRGYkJ0WmtN?=
 =?utf-8?B?RHVjNGJuSWNHTGNyb1owb0hwbVRsaGMrVDk4bko1MlFMWHh0VG5aMWdYZWxP?=
 =?utf-8?B?NllVVDF3cEY2c1ZLcElMZkRWbDVpSEU2aG9BUUdrSC96R2JCTm0wdERvQktv?=
 =?utf-8?B?NXRyMi9TN0RMQUIza1AybkVLYXRqTFB6dGpwc1Y5ajZ5d1ljTjVJZ3BnL1I0?=
 =?utf-8?B?Tmx1b0J4TWJRNHFwTG1TQWdaL3UwWGdBS1JRdysrOEhsbXhscVFNZDM0dG05?=
 =?utf-8?B?aVZTYmtjK256NEZaVDZZRTN4MzZFRGZxOE1XZUFnK0ltT21PRHkyamdGdXJD?=
 =?utf-8?B?S3hPSytqUmdrdGF0UWlCd3dObUdNcVlDMnpET1ZYalY1QUgrb3NPTEJPWXNO?=
 =?utf-8?B?MW4xYTBOdjhOQ3FySFJrK3BTM1ZqVzVseDdxcitLSUNNdGE5S0FaT0h4c29t?=
 =?utf-8?B?MXpBdlllRmJ4RkRYSmRTano0UnFGNGtzTVo3VXlUTk1aTzJuYTIzUkxnSFBr?=
 =?utf-8?B?TVdJcGVwMEJxZ3duNS9zNjhick4xNmFhNlg0a1lxOTRiK3k2VGRtT3dKVStp?=
 =?utf-8?B?SzJrbldnNVZINm9zTnNubkNyOFZycU10NXJSZFdQanNWZ1JQaVB5ZUs3L3Rr?=
 =?utf-8?B?UUhFcnV4di9CWHI3SncrdUtibWtwOU5mcWNIbTY5S3ZBOHNPUVd4dk83VVVN?=
 =?utf-8?B?eUs1a0VCZ0RXRk1ISFhtcE4ydGpxMTRUN3luWGlkNU55RVROUGgvL3JobmdI?=
 =?utf-8?B?N0oybmY4M2RmbUxRajAzdEtWcnlsQzZaU0s4WlBmTlUxck5td0ZwUmJGY2lB?=
 =?utf-8?B?cEZicUxlVGpkQXNIYkNWTCtVVGMzOGIyYmhaYlNUNkVlRDZyc0Y0RHQybERv?=
 =?utf-8?B?MFNjZDl3ODF3cEpyU0svZS9pM1RGK0VHZTRPVWt1ZzI4d3pVZVNXdm5FWGgx?=
 =?utf-8?B?dmlTa2hMbnlJZHdrLzRaTkNPTkNmaDdrMzdLM3pETk5KRUdIeWxFeUIrVllz?=
 =?utf-8?B?aU0yRndKanFjK00wYmg5NVhJV0tHVjV2SW5NeEhkSFhxK0ZBL09vL2VYc2tx?=
 =?utf-8?B?cG5TNXF1TTZFRGVlRERPNmpsamNpSE1odUxYNUFhamFsSURlRHZVNWRrODl1?=
 =?utf-8?B?cnJRUUg5QlIrNElEMHNLK1JKTi9QQnFQK0o3b2dHTXNNTTM5eFFWNkZkdUdG?=
 =?utf-8?B?aGVZaUtrUjAzM2ZzRUtHeUZSd1RkY05aUmFUMzFsSjlsUWRkOG9YSlhLSDUy?=
 =?utf-8?B?UnZXV0lQUlExU2NoQkxVK2swWWtqVVRMQk1NUVROVWJiam5LemtCcnhFdjhx?=
 =?utf-8?B?MVFwbi9WTkd1ZU56L1paQUM3bUlseUMwT1ByYkZHdlc1SWZaSElSazhoVVJq?=
 =?utf-8?B?QzdXeGd5citnMWt5dnRBTitteStSaUtLeW1mbXhCN3ZFdU9JemR0NnhvNmVC?=
 =?utf-8?B?WDNxbHNrYXlsZWEvMXl1WDM4eGk2LytUcExhVVBUV3ZjSmFjTjNsQjFFeWtL?=
 =?utf-8?B?UDNtNXp0SVhxV0NqYVB2NVZKNUlkSHNHQlpLK1F5VnBKVElXalNOcjdaaXQ3?=
 =?utf-8?B?U3R1SzBmVEs2OVgzY0ordkNEVmkzdHJIUmFXYkFQNko2aXdhU0lEeFd2MEUz?=
 =?utf-8?Q?RCsS5eZe5VsLKujLZbKks/zPN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20fa035-0863-4d9e-7058-08db9cc54f15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:52:25.6551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLBIKC+mJP78E4JWffhf1yMA8fLtHFzFHlfKl2nlsk/zTLmxw4ele771lZh7wv1rIx7ceb7e66z6Cptqo5+ceg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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


On 8/14/2023 5:35 PM, Christian König wrote:
> Am 14.08.23 um 09:34 schrieb Arvind Yadav:
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
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>> +
>> +    if (ret == 0) {
>
> Please double check the coding style, stuff like this is usually 
> complained about by the automated checkers.
>
I have run the checkpatch.pl and did not get any warning for this, But 
sure I will change this.

Thank you,

~Arvind

> Apart from that Alex needs to take a look if this here makes sense or 
> not.
>
> Regards,
> Christian.
>
>> +        /* Set the bit for the submitted workload profile */
>> +        adev->smu_workload.submit_workload_status |= (1 << profile);
>> + atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +    } else {
>> +        DRM_ERROR("Failed to set power profile, error %d\n", ret);
>> +    }
>> +
>> +}
>> +
>> +static void
>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>> +               enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
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
>> +    if (reschedule)
>> + schedule_delayed_work(&adev->smu_workload.smu_delayed_work,
>> +                      SMU_IDLE_TIMEOUT);
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
>> +{
>> +    enum PP_SMC_POWER_PROFILE profile = 
>> ring_to_power_profile(ring_type);
>> +
>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +        return;
>> +
>> +    mutex_lock(&adev->smu_workload.workload_lock);
>> + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
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
>> +
>> +    mutex_init(&adev->smu_workload.workload_lock);
>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work, 
>> amdgpu_smu_idle_work_handler);
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
>
