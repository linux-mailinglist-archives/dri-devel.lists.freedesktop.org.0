Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35488004E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A1410ED76;
	Tue, 19 Mar 2024 15:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RhImuccg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47DF10ED76;
 Tue, 19 Mar 2024 15:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AE4EQAkIdaErleogB+BAWl4bKmU7SRgNf+/8PDuTu+3/p+hoI284u/4oMeaVG5PUiHfX+nqQApGwuB9sbaTuU4Lmm71nK/7AnKyXb08WrEUwmLI09Ctv5/Ke0jvPGMKkx2oeFBZLHR8pwC+qTbGLpVZZ48W+wpRdOCf+det5JbKyMGsAQHUOOqYRR30mxKuxDCsohDg0aQmH9kjiuD3VGt3maJo7jXNLuO0wvxsuwmxXM/fp9TQINnVOwPywH5Ep0NPKlbLt6lwEny7YWyCrsr9leT/Hq1oH2sBoa17xohupSmY/0kG0APpLQipk/qcSXh+48YM5Df7o5wux2Nf54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyZyVoziCH0VoNUFYpYBNG1fR5oIF0O8JdQKG5wT4mA=;
 b=i+c+m+6ssnQ1FSdHlZqZrmB1TjBUbu3xOUwiwK+7h1s76dznS1B2CcpE8QtzcjOX1SBEMYQ+rsGRh31fUGrB/DMkXiUJHC0Mokt3XN+3m1RjawZ5xem1RouwNHrHuO8mNCIM0G6nmo8sfLwFXVnuLyHDeRo6Qz54X1kA8rsfH4cZxRZ5HjpCbCC0jXYSUdEJd3UFrvkfDROpbRr+mgmrh4DJvZ7SO4q/Kyp8lvJVHtIZJsoHJNiJTnqqfADym9eBTCmGlabwNqs7FZ2+PTSDrfW6ltL6/8FiFV4pvMnhiTM/g48Wt9cxUkv9MbJUBLjb4/A44YR2Dfr71oJyQAIhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyZyVoziCH0VoNUFYpYBNG1fR5oIF0O8JdQKG5wT4mA=;
 b=RhImuccgMSoNyB1Huqq/unk2ullwFAgVs/RJoC2IrCHUrmsTqDPAXUPlWjAyAuJCO6CJX8MLsTEcFDlwISS1+bTHIFf+XcrWK0FKpdnldO/ujXPc9a+maSArNtG5vwBIbOfCTxbCAMX/D7fu19Ni/3Y8ND1WTpR+57qgPL+dGOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Tue, 19 Mar
 2024 15:13:02 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 15:13:02 +0000
Message-ID: <fda2308b-6d3c-4ef5-8435-9f416a8deed1@amd.com>
Date: Tue, 19 Mar 2024 20:42:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240319123208.851901-1-sunil.khatri@amd.com>
 <CADnq5_PW2ZQ8sP9NcX=f5QhHM-Ne=EQA7k9BKwwwZbgsRyV4-A@mail.gmail.com>
 <8e36fae9-6501-435e-a01c-93990bef57f7@gmail.com>
 <CADnq5_PRXnBVtUVk+7iTHr43KGTbbfHxCwB1jZPo-sGCadY5Qw@mail.gmail.com>
 <4f2d5b6a-a1ce-4cdb-bb17-55f19e8898d5@gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <4f2d5b6a-a1ce-4cdb-bb17-55f19e8898d5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::13) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: eabbbb04-b64f-494d-17f5-08dc482711c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0u192C/E/TlgfBo5GpSeXOcFSkxWRrcwOodQnAPxSb3ldRSwFJQaNCPatUzZ3+o3hnV8P9ectNggA/5G12jwoH2ew+WxinmFQfH1A7wavo/QmvhwWCcWNnBOZSnKcondVTlo+MOTvSwD79CCf7/41/E5q+5VbSU1tR6VlF2rgWkwZx00L5ed8dVyo5ya9OLTQ/RDNt89rxWBip0u5shdvjPJxJpR302vEDQbESCJnGuF5MYOMCSX2b+QI0HWDNt7WvZ8ZQEb7NEKp3oIdn7mycqwHTEF+duAsNs/VXtchNwcC+ttwhYJeDv8CdRHjO6z/L1UcFpVAwv3WFYHjUVXgPmWXbxJ0DRerHLLsKSZs+pGGAv6WkLiuOlLJpIrLvu2ZxavPJk1bcxx0QoBIdGZMHM8JTQTestM069fbpV8Ysj4jIhVruEu1zOOPpT5L8mC3MWd2ki8M85X1VVjXRj/mvUGg+thRbaYQMF3SBLxT60NOWFDdlEXV7Juuf0L5n269ooE2d27+Sd/zBxeCha4Wy+Qnv821sW/Tirym3FF5pOrdGUlCEG33+Ogb4SxWKsP5tJqqfaItXFjEYwJaU1w7J7DWSa8/69PyfRHAZVlbL4VVB/6EjiI4MmeznAatKis6tzS82b8TimZYo1682/mLX1lttlkqrEFOBACw42wfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5hcE5YUkFSS1MrYzcrRlR5VTFoNFdhRW83bnFhLzRtOHNkMHlFKzJ2Y0hW?=
 =?utf-8?B?Wmw5NHZmLzliOXZRdTVITEM1ZTJPL0I4U1dLRDkvYVY5bVl3NVROY3pBOEhq?=
 =?utf-8?B?K09vUFdKOXBuUVhJUHFyMmh3dk1mRTRkZlZLcGVja0sxNURMZnJwT0paWWY4?=
 =?utf-8?B?TzdyMUxyZFdhcEtpeDVYSFVnQmZHRHNOSTZPZmZOd3g1Um5KMWZpd2xGYzJj?=
 =?utf-8?B?WmdhMmNhOGFTMFZ4ZG5wNjlFbEZqVVpwdXM5elRkWEVWMXhVb1JZVGU3UkhB?=
 =?utf-8?B?OHFmR2VqWFpCeThJQmZDbml2SGEyeWxlRWNSamNFeEtSUEFSLzg0V3dFZEgy?=
 =?utf-8?B?N1h3NHRPTUVuZmc0OXVuTEhiS2dyNmYrdEhGVDJFNXF3dTI5K05KcWRBd24w?=
 =?utf-8?B?WDJ0M1p6OFdjM3VlQkdOdlI2NWNzZ0c0clVtTm9ER2laekZUYnBDQmtkSFVX?=
 =?utf-8?B?RjVhR3FxQ0JhZ2xBcWttRmp2T0RpVm5BYlBzWlFYaXMzOWtJaVBhV2gvblZM?=
 =?utf-8?B?SkplVkhvL1l3WkNJVHRDVUIwZzV4amdHdWExM2tNNmpONEd1Zzl3d3pFZmVQ?=
 =?utf-8?B?TjdQSUlqdzBiUUNJTHkwVTNLaFRSSmUwTDU1ekpDbXk2UTlhQnFLdVp1NmlM?=
 =?utf-8?B?OW5oTVA5UmdyZlpScmwzLzkvTFRaamJpeGFlY3Nya3h5bitaTG9iWFMyYjN1?=
 =?utf-8?B?RVdGbHdtNmpGdndubmNyUWZIa0pwU2QzK1ZjM2h2M3dsSDhpTnBGajU1U0ZE?=
 =?utf-8?B?Skg0SmROYnJsUWEvTkh3ZEh0SE8xellobFU0aDFLbUFVdUc1d2hGTy9Ld0k2?=
 =?utf-8?B?Z1dqYzRRakMyZHBDU2V5WVNnRVgyZHRxcVFyZUZZOHBreWVjVHRUcThCK3Jk?=
 =?utf-8?B?aFcwdXVnNDZ4bXE4TXlNVkh0anpseVlUenZUU3RSRnNhcFNTcWVDMnF3T2to?=
 =?utf-8?B?bXIxTE0wbWhnOHRNc3BpWWgrNkJnUXMyMCtmaDVpdUxvREFwUTRvVFNSdjJl?=
 =?utf-8?B?RUVvZmowQ0tTeVZjTWZLdjBDZVJRRm9UZGhJV0NSaXZzSklOZDVPZExsaWFF?=
 =?utf-8?B?dldHUUtReVVrS3NiZWM2R2IzR2V3U3liaEJJTlZZNjFwT3dhcmdNbjlNREx0?=
 =?utf-8?B?cEFIR0oyU3JPS3l5Nk5na3lhelZzcDVLNldHTTlRRmFjMUJITDlLbm9waVp1?=
 =?utf-8?B?QWhzL05LK3ZET2VBVmVieVdUOGllM2V3Nm9VdXFpQ0xFYk9iK0VMb2NNK0o4?=
 =?utf-8?B?M0swYWR0Mkl2dEZ4NmlDMVFrTGdreGN3cnc5K2hpWEl3Q015ZmlwRVBoY2JI?=
 =?utf-8?B?OGh1NlI1NUFYL1NhSUVnYm5ySHprWTdBY0pvVjg1SStqTlBETnlkZzNaMElV?=
 =?utf-8?B?NElxeFJERWhEYVMxTGY0ZTk3bms2aldYb29EQVBiVnc5SjFOeTdmTFByMTBy?=
 =?utf-8?B?WHdEenhZQVE4WWZuTFJzR3gwRENFU1lkKzU4Y0pZNmpPb2lBZWNvSFNGdThF?=
 =?utf-8?B?RGpYZHF5eDR2MHZoK0licmxUZytqUzZsV1dtRGdleklsNzN2MHZhdUhUM0w0?=
 =?utf-8?B?T0J0WC9oMXlPclZ4aTdEVFZETG5tYW5mOUhHM2oxdEtIQnZiaEhtejY2dWNv?=
 =?utf-8?B?a2JaeXlpTVJvSzVnT3BoeElCUVFxMWNScDNjTjJTMnAvNjlCS1JuV3o0YWZQ?=
 =?utf-8?B?S2JIQURXeE1VM2UrWVBDQ2hvdWJsZi8vMVF5S2xvWHlPMnNrVmNGMnB0eWZL?=
 =?utf-8?B?QkthQVR4VEN2OTNrd3FYeS9HeUxTQXhGWFlwYTgzWTVmWHBMTVh4cmRleU9Q?=
 =?utf-8?B?UzU2TEgvYnNIMU52TUVmWXJzNXM0K0RnWDNVVmtJSVN1VWlWenFiOVZoZ3Zl?=
 =?utf-8?B?SHJLMlBmaVFsNU1QcVNLUlNYa0VnWEdGTVhmNlA3QWtBZ045Y085U2tSWGpr?=
 =?utf-8?B?QnBKMVVlbkRNdEJ3ODIrclF2R3ZRUlJ0eFM4clZRS3ZqSFBJSXZYeU15cnVR?=
 =?utf-8?B?Uy9WSzloL3JZb2tIdmtpUllNT0FBc2lKUEFSUnloQWpPNTNDTzgxd2ZBbVds?=
 =?utf-8?B?M0p5U0haK05ycU0zWC9wVC82ZUV3MTJpLzdyZDhWUTBlckpHdW9XMlBFeXhW?=
 =?utf-8?Q?y5L49tKZSUhmMm6g4r5gQtC4L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabbbb04-b64f-494d-17f5-08dc482711c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 15:13:02.2403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7QpY8WKkxfvMYiHf0cyLUgWyS5o9Hx44/82CRjXQtJvKzW5lq2BPYAuYeUSHTkeLgfepuLqiW8hpAr5I4WwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364
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

Sent a new patch based on discussion with Alex.

On 3/19/2024 8:34 PM, Christian König wrote:
> Am 19.03.24 um 15:59 schrieb Alex Deucher:
>> On Tue, Mar 19, 2024 at 10:56 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 19.03.24 um 15:26 schrieb Alex Deucher:
>>>> On Tue, Mar 19, 2024 at 8:32 AM Sunil Khatri <sunil.khatri@amd.com> 
>>>> wrote:
>>>>> Refactor the code so debugfs and devcoredump can reuse
>>>>> the common information and avoid unnecessary copy of it.
>>>>>
>>>>> created a new file which would be the right place to
>>>>> hold functions which will be used between sysfs, debugfs
>>>>> and devcoredump.
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 
>>>>> ++++++++++++++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>>>>>    4 files changed, 157 insertions(+), 115 deletions(-)
>>>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> index 4536c8ad0e11..05d34f4b18f5 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o 
>>>>> amdgpu_doorbell_mgr.o amdgpu_kms.o \
>>>>>           amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o 
>>>>> amdgpu_rap.o \
>>>>>           amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>>>>>           amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o 
>>>>> amdgpu_lsdma.o \
>>>>> -       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
>>>>> +       amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o 
>>>>> amdgpu_devinfo.o
>>>>>
>>>>>    amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index 9c62552bec34..0267870aa9b1 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -1609,4 +1609,5 @@ extern const struct attribute_group 
>>>>> amdgpu_vram_mgr_attr_group;
>>>>>    extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>>>>>    extern const struct attribute_group amdgpu_flash_attr_group;
>>>>>
>>>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct 
>>>>> drm_amdgpu_info_device *dev_info);
>>>>>    #endif
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>>> new file mode 100644
>>>>> index 000000000000..d2c15a1dcb0d
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>>>>> @@ -0,0 +1,151 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright 2024 Advanced Micro Devices, Inc.
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person 
>>>>> obtaining a
>>>>> + * copy of this software and associated documentation files (the 
>>>>> "Software"),
>>>>> + * to deal in the Software without restriction, including without 
>>>>> limitation
>>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>>> sublicense,
>>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>>> whom the
>>>>> + * Software is furnished to do so, subject to the following 
>>>>> conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be 
>>>>> included in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>>>>> KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>>> MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO 
>>>>> EVENT SHALL
>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>>> DAMAGES OR
>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>>> OTHERWISE,
>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>>> USE OR
>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +#include "amdgpu.h"
>>>>> +#include "amd_pcie.h"
>>>>> +
>>>>> +#include <drm/amdgpu_drm.h>
>>>>> +
>>>>> +int amdgpu_device_info(struct amdgpu_device *adev, struct 
>>>>> drm_amdgpu_info_device *dev_info)
>>>> We can probably keep this in amdgpu_kms.c unless that file is getting
>>>> too big.  I don't think it warrants a new file at this point.  If you
>>>> do keep it in amdgpu_kms.c, I'd recommend renaming it to something
>>>> like amdgpu_kms_device_info() to keep the naming conventions.
>>> We should not be using this for anything new in the first place.
>>>
>>> A whole bunch of the stuff inside the devinfo structure has been
>>> deprecated because we found that putting everything into one structure
>>> was a bad idea.
>> It's a convenient way to collect a lot of useful information that we
>> want in the core dump.  Plus it's not going anywhere because we need
>> to keep compatibility in the IOCTL.
>
> Yeah and exactly that is what I'm strictly against. The devinfo wasn't 
> used for new stuff because we found that it is way to inflexible.
>
> That's why we have multiple separate IOCTLs for the memory and 
> firmware information for example.
>
> We should really *not* reuse that for the device core dumping.
>
> Rather just use the same information from the different IPs and 
> subsystems directly. E.g. add a function to the VM, GFX etc for 
> printing out devcoredump infos.
>
I have pushed new v2 based on some comments on chat with Alex. Now if we 
need this functionality or not could be debated and will decide to go 
for this or not based on it.

Regards
Sunil

> Christian.
>
>>
>> Alex
>>
>>> Regards,
>>> Christian.
>>>
>>>>> +{
>>>>> +       int ret;
>>>>> +       uint64_t vm_size;
>>>>> +       uint32_t pcie_gen_mask;
>>>>> +
>>>>> +       if (dev_info == NULL)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       dev_info->device_id = adev->pdev->device;
>>>>> +       dev_info->chip_rev = adev->rev_id;
>>>>> +       dev_info->external_rev = adev->external_rev_id;
>>>>> +       dev_info->pci_rev = adev->pdev->revision;
>>>>> +       dev_info->family = adev->family;
>>>>> +       dev_info->num_shader_engines = 
>>>>> adev->gfx.config.max_shader_engines;
>>>>> +       dev_info->num_shader_arrays_per_engine = 
>>>>> adev->gfx.config.max_sh_per_se;
>>>>> +       /* return all clocks in KHz */
>>>>> +       dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
>>>>> +       if (adev->pm.dpm_enabled) {
>>>>> +               dev_info->max_engine_clock = 
>>>>> amdgpu_dpm_get_sclk(adev, false) * 10;
>>>>> +               dev_info->max_memory_clock = 
>>>>> amdgpu_dpm_get_mclk(adev, false) * 10;
>>>>> +               dev_info->min_engine_clock = 
>>>>> amdgpu_dpm_get_sclk(adev, true) * 10;
>>>>> +               dev_info->min_memory_clock = 
>>>>> amdgpu_dpm_get_mclk(adev, true) * 10;
>>>>> +       } else {
>>>>> +               dev_info->max_engine_clock =
>>>>> +                       dev_info->min_engine_clock =
>>>>> + adev->clock.default_sclk * 10;
>>>>> +               dev_info->max_memory_clock =
>>>>> +                       dev_info->min_memory_clock =
>>>>> + adev->clock.default_mclk * 10;
>>>>> +               }
>>>>> +       dev_info->enabled_rb_pipes_mask = 
>>>>> adev->gfx.config.backend_enable_mask;
>>>>> +       dev_info->num_rb_pipes = 
>>>>> adev->gfx.config.max_backends_per_se *
>>>>> +               adev->gfx.config.max_shader_engines;
>>>>> +       dev_info->num_hw_gfx_contexts = 
>>>>> adev->gfx.config.max_hw_contexts;
>>>>> +       dev_info->ids_flags = 0;
>>>>> +       if (adev->flags & AMD_IS_APU)
>>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>>>>> +       if (adev->gfx.mcbp)
>>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
>>>>> +       if (amdgpu_is_tmz(adev))
>>>>> +               dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>>> +       if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>>> +               dev_info->ids_flags |= 
>>>>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>>> +
>>>>> +       vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>>>>> +       vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>>> +
>>>>> +       /* Older VCE FW versions are buggy and can handle only 
>>>>> 40bits */
>>>>> +       if (adev->vce.fw_version && adev->vce.fw_version < 
>>>>> AMDGPU_VCE_FW_53_45)
>>>>> +               vm_size = min(vm_size, 1ULL << 40);
>>>>> +
>>>>> +       dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
>>>>> +       dev_info->virtual_address_max = min(vm_size, 
>>>>> AMDGPU_GMC_HOLE_START);
>>>>> +
>>>>> +       if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>>> +               dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
>>>>> +               dev_info->high_va_max = AMDGPU_GMC_HOLE_END | 
>>>>> vm_size;
>>>>> +       }
>>>>> +       dev_info->virtual_address_alignment = max_t(u32, 
>>>>> PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>>> +       dev_info->pte_fragment_size = (1 << 
>>>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>>> +       dev_info->gart_page_size = max_t(u32, PAGE_SIZE, 
>>>>> AMDGPU_GPU_PAGE_SIZE);
>>>>> +       dev_info->cu_active_number = adev->gfx.cu_info.number;
>>>>> +       dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>>> +       dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>>> +       memcpy(&dev_info->cu_ao_bitmap[0], 
>>>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>>> +              sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>>> +       memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
>>>>> +              sizeof(dev_info->cu_bitmap));
>>>>> +       dev_info->vram_type = adev->gmc.vram_type;
>>>>> +       dev_info->vram_bit_width = adev->gmc.vram_width;
>>>>> +       dev_info->vce_harvest_config = adev->vce.harvest_config;
>>>>> +       dev_info->gc_double_offchip_lds_buf =
>>>>> + adev->gfx.config.double_offchip_lds_buf;
>>>>> +       dev_info->wave_front_size = 
>>>>> adev->gfx.cu_info.wave_front_size;
>>>>> +       dev_info->num_shader_visible_vgprs = 
>>>>> adev->gfx.config.max_gprs;
>>>>> +       dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
>>>>> +       dev_info->num_tcc_blocks = 
>>>>> adev->gfx.config.max_texture_channel_caches;
>>>>> +       dev_info->gs_vgt_table_depth = 
>>>>> adev->gfx.config.gs_vgt_table_depth;
>>>>> +       dev_info->gs_prim_buffer_depth = 
>>>>> adev->gfx.config.gs_prim_buffer_depth;
>>>>> +       dev_info->max_gs_waves_per_vgt = 
>>>>> adev->gfx.config.max_gs_threads;
>>>>> +
>>>>> +       if (adev->family >= AMDGPU_FAMILY_NV)
>>>>> +               dev_info->pa_sc_tile_steering_override =
>>>>> + adev->gfx.config.pa_sc_tile_steering_override;
>>>>> +
>>>>> +       dev_info->tcc_disabled_mask = 
>>>>> adev->gfx.config.tcc_disabled_mask;
>>>>> +
>>>>> +       /* Combine the chip gen mask with the platform (CPU/mobo) 
>>>>> mask. */
>>>>> +       pcie_gen_mask = adev->pm.pcie_gen_mask & 
>>>>> (adev->pm.pcie_gen_mask >> 16);
>>>>> +       dev_info->pcie_gen = fls(pcie_gen_mask);
>>>>> +       dev_info->pcie_num_lanes =
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>>>> +               adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>>>>> +
>>>>> +       dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
>>>>> +       dev_info->num_sqc_per_wgp = 
>>>>> adev->gfx.config.gc_num_sqc_per_wgp;
>>>>> +       dev_info->sqc_data_cache_size = 
>>>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>>> +       dev_info->sqc_inst_cache_size = 
>>>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>>> +       dev_info->gl1c_cache_size = 
>>>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>>>> + adev->gfx.config.gc_gl1c_per_sa;
>>>>> +       dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
>>>>> +       dev_info->mall_size = adev->gmc.mall_size;
>>>>> +
>>>>> +
>>>>> +       if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>>> +               struct amdgpu_gfx_shadow_info shadow_info;
>>>>> +
>>>>> +               ret = amdgpu_gfx_get_gfx_shadow_info(adev, 
>>>>> &shadow_info);
>>>>> +               if (!ret) {
>>>>> +                       dev_info->shadow_size = 
>>>>> shadow_info.shadow_size;
>>>>> +                       dev_info->shadow_alignment = 
>>>>> shadow_info.shadow_alignment;
>>>>> +                       dev_info->csa_size = shadow_info.csa_size;
>>>>> +                       dev_info->csa_alignment = 
>>>>> shadow_info.csa_alignment;
>>>>> +               }
>>>>> +       }
>>>>> +       return ret;
>>>>> +}
>>>> As noted by Lijo, this should probably be a void function since we
>>>> want to populate as much information as we can and we can't break the
>>>> IOCTL interface.
>>>>
>>>> Alex
>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>>> index a66d47865e3b..24f775c68a51 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>>>> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device 
>>>>> *dev, void *data, struct drm_file *filp)
>>>>>           }
>>>>>           case AMDGPU_INFO_DEV_INFO: {
>>>>>                   struct drm_amdgpu_info_device *dev_info;
>>>>> -               uint64_t vm_size;
>>>>> -               uint32_t pcie_gen_mask;
>>>>>
>>>>>                   dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>>>>>                   if (!dev_info)
>>>>>                           return -ENOMEM;
>>>>>
>>>>> -               dev_info->device_id = adev->pdev->device;
>>>>> -               dev_info->chip_rev = adev->rev_id;
>>>>> -               dev_info->external_rev = adev->external_rev_id;
>>>>> -               dev_info->pci_rev = adev->pdev->revision;
>>>>> -               dev_info->family = adev->family;
>>>>> -               dev_info->num_shader_engines = 
>>>>> adev->gfx.config.max_shader_engines;
>>>>> -               dev_info->num_shader_arrays_per_engine = 
>>>>> adev->gfx.config.max_sh_per_se;
>>>>> -               /* return all clocks in KHz */
>>>>> -               dev_info->gpu_counter_freq = 
>>>>> amdgpu_asic_get_xclk(adev) * 10;
>>>>> -               if (adev->pm.dpm_enabled) {
>>>>> -                       dev_info->max_engine_clock = 
>>>>> amdgpu_dpm_get_sclk(adev, false) * 10;
>>>>> -                       dev_info->max_memory_clock = 
>>>>> amdgpu_dpm_get_mclk(adev, false) * 10;
>>>>> -                       dev_info->min_engine_clock = 
>>>>> amdgpu_dpm_get_sclk(adev, true) * 10;
>>>>> -                       dev_info->min_memory_clock = 
>>>>> amdgpu_dpm_get_mclk(adev, true) * 10;
>>>>> -               } else {
>>>>> -                       dev_info->max_engine_clock =
>>>>> - dev_info->min_engine_clock =
>>>>> - adev->clock.default_sclk * 10;
>>>>> -                       dev_info->max_memory_clock =
>>>>> - dev_info->min_memory_clock =
>>>>> - adev->clock.default_mclk * 10;
>>>>> -               }
>>>>> -               dev_info->enabled_rb_pipes_mask = 
>>>>> adev->gfx.config.backend_enable_mask;
>>>>> -               dev_info->num_rb_pipes = 
>>>>> adev->gfx.config.max_backends_per_se *
>>>>> - adev->gfx.config.max_shader_engines;
>>>>> -               dev_info->num_hw_gfx_contexts = 
>>>>> adev->gfx.config.max_hw_contexts;
>>>>> -               dev_info->ids_flags = 0;
>>>>> -               if (adev->flags & AMD_IS_APU)
>>>>> -                       dev_info->ids_flags |= 
>>>>> AMDGPU_IDS_FLAGS_FUSION;
>>>>> -               if (adev->gfx.mcbp)
>>>>> -                       dev_info->ids_flags |= 
>>>>> AMDGPU_IDS_FLAGS_PREEMPTION;
>>>>> -               if (amdgpu_is_tmz(adev))
>>>>> -                       dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>>>>> -               if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
>>>>> -                       dev_info->ids_flags |= 
>>>>> AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
>>>>> -
>>>>> -               vm_size = adev->vm_manager.max_pfn * 
>>>>> AMDGPU_GPU_PAGE_SIZE;
>>>>> -               vm_size -= AMDGPU_VA_RESERVED_TOP;
>>>>> -
>>>>> -               /* Older VCE FW versions are buggy and can handle 
>>>>> only 40bits */
>>>>> -               if (adev->vce.fw_version &&
>>>>> -                   adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
>>>>> -                       vm_size = min(vm_size, 1ULL << 40);
>>>>> -
>>>>> -               dev_info->virtual_address_offset = 
>>>>> AMDGPU_VA_RESERVED_BOTTOM;
>>>>> -               dev_info->virtual_address_max =
>>>>> -                       min(vm_size, AMDGPU_GMC_HOLE_START);
>>>>> -
>>>>> -               if (vm_size > AMDGPU_GMC_HOLE_START) {
>>>>> -                       dev_info->high_va_offset = 
>>>>> AMDGPU_GMC_HOLE_END;
>>>>> -                       dev_info->high_va_max = 
>>>>> AMDGPU_GMC_HOLE_END | vm_size;
>>>>> -               }
>>>>> -               dev_info->virtual_address_alignment = max_t(u32, 
>>>>> PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
>>>>> -               dev_info->pte_fragment_size = (1 << 
>>>>> adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
>>>>> -               dev_info->gart_page_size = max_t(u32, PAGE_SIZE, 
>>>>> AMDGPU_GPU_PAGE_SIZE);
>>>>> -               dev_info->cu_active_number = 
>>>>> adev->gfx.cu_info.number;
>>>>> -               dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
>>>>> -               dev_info->ce_ram_size = adev->gfx.ce_ram_size;
>>>>> -               memcpy(&dev_info->cu_ao_bitmap[0], 
>>>>> &adev->gfx.cu_info.ao_cu_bitmap[0],
>>>>> - sizeof(adev->gfx.cu_info.ao_cu_bitmap));
>>>>> -               memcpy(&dev_info->cu_bitmap[0], 
>>>>> &adev->gfx.cu_info.bitmap[0],
>>>>> -                      sizeof(dev_info->cu_bitmap));
>>>>> -               dev_info->vram_type = adev->gmc.vram_type;
>>>>> -               dev_info->vram_bit_width = adev->gmc.vram_width;
>>>>> -               dev_info->vce_harvest_config = 
>>>>> adev->vce.harvest_config;
>>>>> -               dev_info->gc_double_offchip_lds_buf =
>>>>> - adev->gfx.config.double_offchip_lds_buf;
>>>>> -               dev_info->wave_front_size = 
>>>>> adev->gfx.cu_info.wave_front_size;
>>>>> -               dev_info->num_shader_visible_vgprs = 
>>>>> adev->gfx.config.max_gprs;
>>>>> -               dev_info->num_cu_per_sh = 
>>>>> adev->gfx.config.max_cu_per_sh;
>>>>> -               dev_info->num_tcc_blocks = 
>>>>> adev->gfx.config.max_texture_channel_caches;
>>>>> -               dev_info->gs_vgt_table_depth = 
>>>>> adev->gfx.config.gs_vgt_table_depth;
>>>>> -               dev_info->gs_prim_buffer_depth = 
>>>>> adev->gfx.config.gs_prim_buffer_depth;
>>>>> -               dev_info->max_gs_waves_per_vgt = 
>>>>> adev->gfx.config.max_gs_threads;
>>>>> -
>>>>> -               if (adev->family >= AMDGPU_FAMILY_NV)
>>>>> - dev_info->pa_sc_tile_steering_override =
>>>>> - adev->gfx.config.pa_sc_tile_steering_override;
>>>>> -
>>>>> -               dev_info->tcc_disabled_mask = 
>>>>> adev->gfx.config.tcc_disabled_mask;
>>>>> -
>>>>> -               /* Combine the chip gen mask with the platform 
>>>>> (CPU/mobo) mask. */
>>>>> -               pcie_gen_mask = adev->pm.pcie_gen_mask & 
>>>>> (adev->pm.pcie_gen_mask >> 16);
>>>>> -               dev_info->pcie_gen = fls(pcie_gen_mask);
>>>>> -               dev_info->pcie_num_lanes =
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
>>>>> -                       adev->pm.pcie_mlw_mask & 
>>>>> CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
>>>>> -
>>>>> -               dev_info->tcp_cache_size = 
>>>>> adev->gfx.config.gc_tcp_l1_size;
>>>>> -               dev_info->num_sqc_per_wgp = 
>>>>> adev->gfx.config.gc_num_sqc_per_wgp;
>>>>> -               dev_info->sqc_data_cache_size = 
>>>>> adev->gfx.config.gc_l1_data_cache_size_per_sqc;
>>>>> -               dev_info->sqc_inst_cache_size = 
>>>>> adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
>>>>> -               dev_info->gl1c_cache_size = 
>>>>> adev->gfx.config.gc_gl1c_size_per_instance *
>>>>> - adev->gfx.config.gc_gl1c_per_sa;
>>>>> -               dev_info->gl2c_cache_size = 
>>>>> adev->gfx.config.gc_gl2c_per_gpu;
>>>>> -               dev_info->mall_size = adev->gmc.mall_size;
>>>>> -
>>>>> -
>>>>> -               if (adev->gfx.funcs->get_gfx_shadow_info) {
>>>>> -                       struct amdgpu_gfx_shadow_info shadow_info;
>>>>> -
>>>>> -                       ret = amdgpu_gfx_get_gfx_shadow_info(adev, 
>>>>> &shadow_info);
>>>>> -                       if (!ret) {
>>>>> -                               dev_info->shadow_size = 
>>>>> shadow_info.shadow_size;
>>>>> - dev_info->shadow_alignment = shadow_info.shadow_alignment;
>>>>> -                               dev_info->csa_size = 
>>>>> shadow_info.csa_size;
>>>>> -                               dev_info->csa_alignment = 
>>>>> shadow_info.csa_alignment;
>>>>> -                       }
>>>>> +               ret = amdgpu_device_info(adev, dev_info);
>>>>> +               if (!ret) {
>>>>> +                       kfree(dev_info);
>>>>> +                       return ret;
>>>>>                   }
>>>>>
>>>>>                   ret = copy_to_user(out, dev_info,
>>>>> -- 
>>>>> 2.34.1
>>>>>
>
