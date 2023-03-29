Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692766CDA69
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961910EAB5;
	Wed, 29 Mar 2023 13:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D9810EAB3;
 Wed, 29 Mar 2023 13:18:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoM6iUT47px6CI4S1sA6yiFB+Y2YW3W0Vvb4rT46hZpYYDfS3DeYH8gNBMENs6VuStMsPA3VERm1HqWO8LNXZOdYZo7G+u5FaFzJ9pQQMQUFZ+w8mgod2MHoLWM0NakLstGxEmTDIzKrr+A71/JGVaBxc6lIJIjoRLRjMqyC8P9+V1ixlTu1GG2yRGTiLhRqVMJ6LOVTroOnUeK/sARbvLgo/GvuXn4TvhryYqXEMHwh635CcpZkQ9nuihp2/z+c8RKA34rUUJJSPzI6MBVG8P1tFcG1iWHI3U4JUrlJM4TifntYzsgDlAkoC2h/108ErOCnXUYeRr38miXH8cgppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tteaj48HvLxEhpcyn1UQr8X0395827dz8e6Vn8ToXLw=;
 b=InpCZ4dSegVlAwUK90mWXIuYtbvYElWsQaU6eONMqGI7RfzBRALfIa5AcVk3wimNloGeaxSlP4eMhDpU41GoH97hsECR8hEFQ13xw9bYf4AZ/FEYrRq+PDsbaJwXT5tn2UsjFOPXZxYy6PllirThfFmffAlUqzMVgigs1Tg35gY1XQt2S515ZsH0ZMNm1j7EoqpIHJQquvmgIDhIlzFC/37Wl1TUX7cbAFxySCsE0GYPhXrKnXHx46gAkmMmal08dghXVUgD7RIEsMhaknlqe/bX31PqndP4jpFtRzG/2Zr1scaIPgYoU3+0zK9NcU1B3AmnqQoxyBFn40MY7Piv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tteaj48HvLxEhpcyn1UQr8X0395827dz8e6Vn8ToXLw=;
 b=FUVlv89b/ygCQ4xDn4hWLKtBAO+xAf6DL8IajFSAjR/QwCvy9PggEbykxZe0HUcsef1W7Aw6KQJ2YnCNFIuAc5/FR4+/sF+sOaFs6H/Uu0R0b8pdJ2rdapl88FMGe1PLnTvAePKkE6dGRKKSI1v0hhDluvC+bfTuIEEwJIlasxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6340.namprd12.prod.outlook.com (2603:10b6:a03:453::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:18:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6222.028; Wed, 29 Mar 2023
 13:18:06 +0000
Message-ID: <3bef108e-2e62-d7d3-af44-f178779702e5@amd.com>
Date: Wed, 29 Mar 2023 08:18:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/amdgpu: Remove ASPM workaround on VI and NV
Content-Language: en-US
To: "Gong, Richard" <richard.gong@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <20230329095933.1203559-2-kai.heng.feng@canonical.com>
 <9c8d928d-f322-e9aa-c811-28682ca70f04@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <9c8d928d-f322-e9aa-c811-28682ca70f04@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0071.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dfec31-d0d7-496d-4991-08db30580885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXcGzsJgjmlsRjnqby0ey2XnMmW4BGy4jok0msCSjrfMRFuNp6nSqVPWerIllpB16LyfzJGXH1S2NflbntAemqT45h5r5Hx4RWnVmrr7MPYP3xyoknisqit5vMCk+vgVjElDNCyXeIofALbxptt33mIBBuygS09OUoG99AsGbiaZFPUcLduCMv+kKr2VF+78JHhzQEpyn8GrW5dGlUcViVh6RXJnUNOB090caeDhSVSMys5gxGRhURFUpCdUlkepljJI6JGIno53+dhyLpuW4SWgwgryOgI0BqtgsvneoGuQ2fwb8GsYCVw3xWkq0aB1eHVNvL1EUl2wdifAXlO1jUEv2litDjvdHnkvG4YQ+aP45GC/2f2J8ofc/MrBhqK2nRxlbdsZdhV1U7LVJsB0or/9Yn7oMKFfUTpGapV6O5zRPowUw60+QCb2sj9hVXTiCGJM2vYpTnFLb+AUzaRX8kkQ9n+uF22WBhZyqltC6cEK0Z+ArP8rfdVGom38AcnQt3SgzxRuVPoLrARQ+5pMv7If9wMfpWd9poWzWUSRhBrQTgEUYBjJ1dmJri4ReZSiXje78NczcQCZSgPQ9CmCmfP7xaRuhe9X8uz64FdetO7vPuCACBbZwjON44T292PuvIsdDgfbokQiLrOAwrl6qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(86362001)(186003)(31696002)(6486002)(8936002)(478600001)(4326008)(316002)(54906003)(110136005)(5660300002)(41300700001)(66476007)(6636002)(36756003)(6666004)(66946007)(8676002)(66556008)(53546011)(6506007)(6512007)(44832011)(38100700002)(31686004)(83380400001)(2906002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVZCcjdySE55YkQwN3BRYkVQZkpIckx3VGsyU2Z1MWJTMWpzL3c3ald4blBl?=
 =?utf-8?B?MHVISUhQRkovUGJIYzNwcFNrVzRPQUM5ZlZPU2J3emh5aEVCQWFXQkpBQmNV?=
 =?utf-8?B?azRDYUg3TXlpeDNlMU1sdUtMK3Ric2NRcGt4QWMzS1laalJGMzJxVW5reUlR?=
 =?utf-8?B?OXdZZEthOFprREc3d2NlOEJzb0ZvV1NwODYxeWhyRWx5UnJIUFJpU2pId0R2?=
 =?utf-8?B?UDdsTk9zNXFITDUyN1htY3ZmUld1RHRXc1lCMHRyTmp1b0VMODloZzZsSVpm?=
 =?utf-8?B?M0RpT2R6NG9GSFFUNzBvY0dkNzBqcWZtaEhzYVVoTHFTTm84RGJ5VGdWTHU1?=
 =?utf-8?B?WmIrZ0xMUnVncXZsT1lnc0wyZTZrUU5mc1dNRVYrZXFhMmpVVkFZZi9hZEZr?=
 =?utf-8?B?Ly9RV2hUeW9mZG1XT2tjak51Yk1rem0zbWI3YjREcDNSdmpQQlJPOFdSa3U5?=
 =?utf-8?B?WHpWbEFVSUUxNnJ6SDF1R1o3bGRZa1NLaFplb1BuZm1JckV3alNySnBiME1P?=
 =?utf-8?B?M3Q4N29oMHZnNXVlQmMzSkcxNnVMbFpFKzNCOEwwN1NHTVRGU3MrKzlnY0Zq?=
 =?utf-8?B?SlllU3hWbHVpVDBsUzNqbXBEcXdMNUZ1dzJhenBhR3Y4R1hzK0pxZWg1MVFP?=
 =?utf-8?B?T3ZHTUl6N1RMVk5ydjNMS3A2bnhQVzFMTHR3YUcyT0VHd2UvalJQbEhLVXBy?=
 =?utf-8?B?K1lzZG9lWHNGSHJaRkZ3VWV5ZklzUTF6RGlCYTZITWNobGV1Y1FWTVZ4R0lT?=
 =?utf-8?B?cE8yc2JKOGNPbGpYU255MXBFbE1pV2lZN0tjcnJIRDhOc2dCQlQxNWV6THpI?=
 =?utf-8?B?Q2ZRdkxOMElkSCtCUUxwYnRJcDN4azB3UWNrcDBQTlhwYlA1MitSditqcHlB?=
 =?utf-8?B?Q2txdE9rTmxpV0xGaGRUTnE3ZU5CeVNkaHZNQVZOSDNEQXA2elJyaGVuZElU?=
 =?utf-8?B?UmZRY1F3Z0xWUjg5ZkRpajdjakFaOGc5RjVvV1UwbFBaSERCbUhkd2Vzdmh5?=
 =?utf-8?B?L09rR3RNZGFNeWIyY3BsaytTZnhmdURydjhnSHV0NjhjRUdEVTQxdUlKODFH?=
 =?utf-8?B?NmlYUjRsQnNnbXdlNVFNdnhLamd4bHFuZkNESUl2Nk1IQTFoVHRiQVZKRHMr?=
 =?utf-8?B?TSs0SlA2blUyT2xnNlpNWWtGNHBQNERFTzRsWU5IYjF5UkVHblc3ZnRpT0dw?=
 =?utf-8?B?bVNhd3d1OVdrTFVLc0pXdGwzVHk1RkhXeXhTTDYyS2xuK3hYYTB1TmVnWjBB?=
 =?utf-8?B?cnVOcTliUWVJVWNqZUVpRENFTnJtWWg1am9UVEJqaldEZGVDVU11c3h5emJI?=
 =?utf-8?B?MDMySDdKYzZiMzFtNyswVEp0SGdyOVhtMkl5NkFUZmZURHU3TngvbUhwZllj?=
 =?utf-8?B?Rk5UTTNwbEJtN2Z5cDc4RlZmK213eTB3OC9sWFg5SlZIR2hmTWFCYmxsaVds?=
 =?utf-8?B?T0FTQ2tYc2Zya2lGa05LMUU5d0c0S3VDd25GTzUxQnBXc2pGUzMwZ2RURlgr?=
 =?utf-8?B?UEF5YndWOWd0OTdEbGE1VXA1Yng4RXZXSlJrU2JTRmV4Qms0RkM0eEx6YXBJ?=
 =?utf-8?B?RFkrYnNwOWJCbEYrV2tWNEVkS2ZLUk9iN2ZadDhmSXBmamplWWF4UWdIY2Vo?=
 =?utf-8?B?d1psTXdaTUp0YlV1YVgrbTJYYVcwVER0SnZpTFpjUjM5RWhVQzJNVWxlRWtr?=
 =?utf-8?B?MHRTUDczVkZ1bHRnWmp2QlNNU0FWT1VjWjdpU09Wa1l5ZUtvTzRweGFwcGls?=
 =?utf-8?B?TldSVURaUml0dmM2ZmkxMy9zSUVMSW5jakRncmFMN1h0TW5sbnlrR2JYV1BX?=
 =?utf-8?B?UnhNVTM3K3ZaKzdzclJ3cDZMaW5YNUZNbyszcDJ5RlNTUVVYVlY3a3FVZUg5?=
 =?utf-8?B?czludWtiTzZXWTZmSzNkTVBPcFpZMUE1Zk44WG1KM0tTK1A0SHRXamZtdVdu?=
 =?utf-8?B?WHUxTGEzREdqZWdKUzdCTWNlQUdyM3hqSS9nR2hObXozaC80cmZkdFpZdW0z?=
 =?utf-8?B?c0FaaG5VaThXRHpWalU1YW94UVBwN25CWGtkVmpZTFMrTGZaMW83Nng0cjFi?=
 =?utf-8?B?WW1yN1NMMGdEUTVWZ1Y4YmtncjRORThOYXVkTUtIZ1UxTXZrSTNHdUVsdlg2?=
 =?utf-8?B?NGoxdStzNzYzMFFmSlE1aGlZMmpLaVZ3VGlnMTFYRHFtajlCaGYrdkZqS0pr?=
 =?utf-8?Q?vGpTkI6yM2oY2knMaJWQQx+Z14O6Ce69G+IFH2qF0yIF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dfec31-d0d7-496d-4991-08db30580885
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:18:06.4736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fpf7vdbooyOLLfRWnyrEC/MsQKgryvc539+LR6p8YotdYAdB5oFNQj3vfBSw3A+kgxsDerrznopW5WAg4JCqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6340
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Victor Zhao <Victor.Zhao@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 dri-devel@lists.freedesktop.org,
 Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/29/23 08:08, Gong, Richard wrote:
>
> On 3/29/2023 4:59 AM, Kai-Heng Feng wrote:
>> Since the original issue is resolved by a new fix, the ASPM workaround
>> can be dropped.
> What is the new fix? Can you elaborate more or add the new fix commit 
> here?

It's his first patch in the series, but yes I agree it should be 
mentioned in this

message explicitly what about that means this can be dropped.

>>
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 ---------------
>>   drivers/gpu/drm/amd/amdgpu/nv.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vi.c            |  2 +-
>>   4 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 8cf2cc50b3de..a19a6489b117 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1248,7 +1248,6 @@ void amdgpu_device_pci_config_reset(struct 
>> amdgpu_device *adev);
>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>   bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
>> -bool amdgpu_device_aspm_support_quirk(void);
>>     void amdgpu_cs_report_moved_bytes(struct amdgpu_device *adev, u64 
>> num_bytes,
>>                     u64 num_vis_bytes);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index d56b7a2bafa6..0cacace2d6c2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -81,10 +81,6 @@
>>     #include <drm/drm_drv.h>
>>   -#if IS_ENABLED(CONFIG_X86)
>> -#include <asm/intel-family.h>
>> -#endif
>> -
>>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
>> @@ -1377,17 +1373,6 @@ bool amdgpu_device_should_use_aspm(struct 
>> amdgpu_device *adev)
>>       return pcie_aspm_enabled(adev->pdev);
>>   }
>>   -bool amdgpu_device_aspm_support_quirk(void)
>> -{
>> -#if IS_ENABLED(CONFIG_X86)
>> -    struct cpuinfo_x86 *c = &cpu_data(0);
>> -
>> -    return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>> -#else
>> -    return true;
>> -#endif
>> -}
>> -
>>   /* if we get transitioned to only one device, take VGA back */
>>   /**
>>    * amdgpu_device_vga_set_decode - enable/disable vga decode
>> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c 
>> b/drivers/gpu/drm/amd/amdgpu/nv.c
>> index 47420b403871..15f3c6745ea9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
>> @@ -522,7 +522,7 @@ static int nv_set_vce_clocks(struct amdgpu_device 
>> *adev, u32 evclk, u32 ecclk)
>>     static void nv_program_aspm(struct amdgpu_device *adev)
>>   {
>> -    if (!amdgpu_device_should_use_aspm(adev) || 
>> !amdgpu_device_aspm_support_quirk())
>> +    if (!amdgpu_device_should_use_aspm(adev))
>>           return;
>>         if (!(adev->flags & AMD_IS_APU) &&
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 531f173ade2d..81dcb1148a60 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -1122,7 +1122,7 @@ static void vi_program_aspm(struct 
>> amdgpu_device *adev)
>>       bool bL1SS = false;
>>       bool bClkReqSupport = true;
>>   -    if (!amdgpu_device_should_use_aspm(adev) || 
>> !amdgpu_device_aspm_support_quirk())
>> +    if (!amdgpu_device_should_use_aspm(adev))
>>           return;
>>         if (adev->flags & AMD_IS_APU ||
