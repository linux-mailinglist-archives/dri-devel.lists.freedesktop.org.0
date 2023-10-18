Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEEE7CDD90
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586C010E046;
	Wed, 18 Oct 2023 13:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5A410E046;
 Wed, 18 Oct 2023 13:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Beb8Wcw6xD8ZKttQfidRtMgvLomEv1BJ3eqJgobFnDksRww4j+HU3MAa43lNcrmafvY/iP17IhdChBU0xX85DTu1zAWbqGVVN1JEz7sPA5qezyWENJK3kVspeBXf8i2IQh/tpyTmqgfh+Xb1hQUEF1Y8HczCfN3j2yDgFB584POh+c1ZHxAtjDmeDcrNeUb6u5sY0X2tCcvo9/oz8cwnIJOviEgNM5Mfb+Ksmk77jULppct5wxOGxe3TmwrAG5Xf189UrLOUrQeMrQ6r+SEDIJFcBOkAHEikqbdCz9SJijVCjQzOOUTF2nUxglfFvnBOmgPFCdt+FVgOU2jN7uO1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHLyMRxG1j9nKRskIE5k8JAtydkgpYk/Wlfu2SKFFbs=;
 b=lEnSDlfdvpRRhEW0K07wHsm/uOSf0ELWVktVmrVCV0UclCmg/dO3HbUZF9VJu3YNjKBotco6Xu0WK3QsiedcICyZFx42OeJWVqDU+ejrKRg4H3QuaHvQJFMw3zw6AQLKJsKGzA3fTgmYDeI6Bnpm7bfMviRMdVt6H//BifZ9MoqB3rd6lwjTnWbQ66zR6Vpfn5eQGje36gkZNjDheEm2AB5gREdLFFIba5IP45QPRGUo5B9EKCL5yUBVJjRMjatxZ3UVb4bVeMAwPsLUDmaYDBYLliUlZyolD1qX8/Up/ipq6W09wUykTcRZp+xaX1vj7tc3cgz32DX+37Sg9lPluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHLyMRxG1j9nKRskIE5k8JAtydkgpYk/Wlfu2SKFFbs=;
 b=EuV6mX4dNMMNnqnxcaS5+NT4aN9kd0C42XFLOG8Q6Z5J6JhqKbdlHK2HX11Pb1j8sN8ETcuIOffaIDFzbVf8voKlwaFTo+gwuPVNqTHsBcly6dmsMSnVoKYd+U7hRURiocCJu148ju1AdW6DdGxmQTkIQRStwsLgBV96tNnDoHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6321.namprd12.prod.outlook.com (2603:10b6:930:22::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 13:40:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 13:40:56 +0000
Message-ID: <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
Date: Wed, 18 Oct 2023 15:40:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b071df4-9cab-4b09-822e-08dbcfdfdac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: el2DeIlav4P+Ajs3fV2hvYGiyYWHKAKAjwwlYHYuzCC9NkEOgCUb2R72UMtOr+l5DmvbDC/ech6sb5jHtEDx17JbkmrlnfGDSthcM+I5deP9SuMQnCFkF3AU1pSG3DKLY9+FiQPP3APz2fQ9wy7UdmhB5iUJP/5oTaZyxcoSGDljn4Rz50GOSH/vu6vc4tiy2xCudGA3R1aEi1BO3TJJqQACxMlJEt9hlK5ofVCZKyqIaPtlAuFiS/UfsXbZZY5bqPoChglvwkVYfl7uAyYNyx1VB6SGB7b7ZxHu2uEFAgZ7hW5w9JScgoOZfZNPhTPX3mfiFc0jP3bkHb8fA+/3MrxYr8/K9BUE/z+mqCF3roPsphpVc/d9wOu+Bwa3QLmC0PHpSb+fsIFSYusV1NjjuZnUW1/+jhO0g6ADzVAJE/KK90XmajqGU2vHwZHWHvW6XILUNooPvttZud4Mmy6S7zAm8mdCis/LcsHPLoyXOHfZIysyVRXzNzNOTV9tCD1PIDsSTek5QGDMfex0sD/LMtQZKYgR6mNVUsnwsNsif5JH4L6TCOKBw1Xwi2ibST2XMazswm9nl03nuEQzz+5auRBC5rgQC8P8HSBKvFg2yJ3eRoVpopCf6YwLxUx1ywLkT4/HthnZsW1kzEFDQH/1qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(2616005)(66574015)(26005)(6506007)(6666004)(6512007)(53546011)(83380400001)(7416002)(8676002)(8936002)(5660300002)(4326008)(2906002)(30864003)(41300700001)(6486002)(478600001)(110136005)(66556008)(316002)(66946007)(66476007)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjM2cTJwTFBrMU1MRWtIRENFNnJjNm1LY3cwOW9vL0VBdGFEbEt6aEJZc0lK?=
 =?utf-8?B?UXAvWGU5L2ZLblhuaEdOSStVZ2Y0VmNteXNCZ0lQSldwZ1FqOXZ6aWk4eW14?=
 =?utf-8?B?SFlqV0ZXbUZVbHdhay9kL2F3OFN5K3JKWnFtTkhxb0FxWUkvVVp0SVpvalZs?=
 =?utf-8?B?MURCSjBYM1hpdVhCVVh6SHVNYXdBUU9ZY1pmUVlFWTJJNDI1MGxuMW13b2cx?=
 =?utf-8?B?dTIyd0J3eW1waG9GYnk2bWlWaGcyYURhYmxaa2pjZ3JJRFBPZWtjMEpRWFVh?=
 =?utf-8?B?dHA4Sjlmbk02dndtd0JPbmFSRDhNb0RtN2NuRUR6ZnBSejIzZVJlUlRlSFdu?=
 =?utf-8?B?elFta3VCVjErNnEvS1FrN0h1a0p2OXN4Y3d0TGE1SXoxOTNYamlLcVdva3lw?=
 =?utf-8?B?MWcySHEzc0s2c1ZqNW5uZ1RFNEpTYU85UHkzakZTNVc5RGIxT3YzYklSRnhP?=
 =?utf-8?B?dnNMZ2FQZjFpL1hzUVhMM0wvWlAxVVJTT3RtQzl1YjVPTktSTUxWZ1A2ZDN1?=
 =?utf-8?B?MTl4cmZqR3RJVWxaakpZR3JtaDJjL05Tdmt4NmJkUk5zM3Y1VnN3clprOVdQ?=
 =?utf-8?B?RjgvNkdzZ3l5RElueW1QSjNhcHZTMm43Y1c2Y3Z4Y2FxektDbC9mZS9Ga3Y1?=
 =?utf-8?B?NnlnNGlZSCtIRVRtaFlGd0hQTG5XWlZISlR2alZqd0c2Q3JUL0lwb0E3blZF?=
 =?utf-8?B?OUR5SzhVVnRjd0ZOV2FFVy8ycDhqNXRkTXZ3YXBMZ04zaHE5NjN6RWVTdlND?=
 =?utf-8?B?Mm1FVk5ubjMzWllORDdGV3QvaEpZcFFMbTJVWmc0b1hiSDlIbis1bTZza2c3?=
 =?utf-8?B?REw5SFlxYkdhNHZuQ0F3T3hrOFVXTHIvNHlHdmthQkhQYmRHRXREeXdLZ2Ez?=
 =?utf-8?B?a2M0bFk2S1Y2L0E3cDhjR1ppWDUyT3lHT01DZUJGRWRHTnZWY05kbmJVRkc5?=
 =?utf-8?B?SXR4ZkE1VE1WekI0cS9NRk9KMjdJRVNHa3FuOFBzWTJJQjdOWlFsb0FWVjFT?=
 =?utf-8?B?OVRrZFFHeW9IM1RSRTZlUjNqd0hSTDlkaVY4Mm9XV2FjZWFHdXkzc29kNzg5?=
 =?utf-8?B?QS9RdTFrMjdGMzdsbGVsZGZubnRGNUltZmxtd2Qvdy91UXdhUFBDTnFXSlpy?=
 =?utf-8?B?TGRURit5emVIUFJLclVOSXRyZWpOSzFxWWpIQ2pSeU9aN3VVaVo4T3RMeG4y?=
 =?utf-8?B?b2hpejJUcjdNa2xwRTdsaVlCOXJLQjlOam9xNmNkeFVXSXVIelBxV2owSDZ6?=
 =?utf-8?B?UkNUQjVmazBuZ2RwVHAzMDh5MXpQOERQdXY3SHJ2eEE5WVN4OHI2OVRuaUFR?=
 =?utf-8?B?bmR5c1dGUDU2M1hPdlBSV05JR0U5KzZGdk9TL1FQZjBFVi9kUjlydkdKMVhD?=
 =?utf-8?B?bCtJWmVoMHpWK2hCYVBQZ1VvSjZZR3RYVEJ4T0l4TkUwMDk3MkNLbXNvWlRx?=
 =?utf-8?B?RnlrdzkwMUtzeElUd1pjTERHb2xmTmVid3piNVVPZjNMWUcrMzNVbDkwcVZD?=
 =?utf-8?B?azRNdDBPMURGeWF3RCs3TFQ1OEF3WVhjQjVibE9CdGR6K24yWHdnenNzTldz?=
 =?utf-8?B?OFVZeUR2anlFYW9aSnVKZTdVbDdadEpBQXI0ZHFoeFk3UjJYem1yNEE3K0kw?=
 =?utf-8?B?Umh5bzNLMStaZXk3T01CS244RGtXVlVzODNkT1dYaTVBOC9lL09xWHdOWlV0?=
 =?utf-8?B?OHZYaEhVQWJYbENzYm8ydTdDa0Z3OGlodGhOdzJwZnRnMG1ORXJHY01qOVNJ?=
 =?utf-8?B?YUsxak45b1FnVVBTemxNeEJyalVod0FDcG0yaXZUZXZiVUUyTmkzdDlrSUhk?=
 =?utf-8?B?b3hRZittQngrTW0veEhOSEx6VlVVZ0pjMlVycThVNjFvYWNLR3hVQVZVemRV?=
 =?utf-8?B?Rm4rbjhaUk5EUjhyeWgvOVF5TVF3VXpTbFRwV0dpejRCTEQvRm54bUwvZ3h3?=
 =?utf-8?B?Yk9hbk1Bb0F2RGJjSVhYNWp6RmpsQk5Ra0x0RE9aUzVLamZjbzNDczFCNHpT?=
 =?utf-8?B?bjVSbFowaEpNb0FjbFlyN212ejh4TDV1eXZRbjJaSTZZZXgzV2ZkdFRyd3dJ?=
 =?utf-8?B?WnFVd0Flelhwdzd2S3AyRXpkaGdoNytseG01UzR1Y3dDeTBjYjA3TFVEbld5?=
 =?utf-8?Q?z9QQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b071df4-9cab-4b09-822e-08dbcfdfdac5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 13:40:56.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxhWABgxcIpgOC+bgQHIn/HBWyHX839YL1KOCLd5sb4m4MO6K4Wgbs1oBajJr86F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6321
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>
> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>
>>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>
>>> Add the initial code path for get interface from AMDGPU.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 ++++++++++++++++++++++++
>>>   drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>   drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>   drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>   drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>   drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>   include/linux/amd-pmf-io.h              |  35 ++++++
>>>   9 files changed, 220 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>   create mode 100644 include/linux/amd-pmf-io.h
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>>> index 384b798a9bad..7fafccefbd7a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>   
>>>   amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>   
>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>> +
>>>   # add asic specific block
>>>   amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>   	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -50,6 +50,7 @@
>>>   #include <linux/hashtable.h>
>>>   #include <linux/dma-fence.h>
>>>   #include <linux/pci.h>
>>> +#include <linux/amd-pmf-io.h>
>>>   
>>>   #include <drm/ttm/ttm_bo.h>
>>>   #include <drm/ttm/ttm_placement.h>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> new file mode 100644
>>> index 000000000000..ac981848df50
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>> @@ -0,0 +1,138 @@
>>> +/*
>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the "Software"),
>>> + * to deal in the Software without restriction, including without limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>> This is MIT, right? Add the required SPDX-License-Identifier line for it
>> at the top of the file, thank you.
>>
> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
> text. So, have retained it to maintain uniformity.

Please add the SPDX License Identifier for any file you add.

Apart from that the whole approach of attaching this directly to amdgpu 
looks extremely questionable to me.

Regards,
Christian.

>
>>> + *
>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> + *
>>> + */
>> Remove the extra empty line at the end of the comment.
>>
> I just took the standard template for all the gpu files. Is that OK to
> retain the blank line?
>
> If not, I can remove it in the next version.
>
> Rest all remarks I will address.
>
> Thanks,
> Shyam
>
>>> +
>>> +#include <linux/backlight.h>
>>> +#include "amdgpu.h"
>>> +
>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>> +{
>>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +	struct drm_connector_list_iter iter;
>>> +	struct drm_connector *connector;
>>> +	int i = 0;
>>> +
>>> +	/* Reset the count to zero */
>>> +	pmf->display_count = 0;
>>> +	if (!(adev->flags & AMD_IS_APU)) {
>>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	mutex_lock(&mode_config->mutex);
>>> +	drm_connector_list_iter_begin(drm_dev, &iter);
>>> +	drm_for_each_connector_iter(connector, &iter) {
>>> +		if (connector->status == connector_status_connected)
>>> +			pmf->display_count++;
>>> +		if (connector->status != pmf->con_status[i])
>>> +			pmf->con_status[i] = connector->status;
>>> +		if (connector->connector_type != pmf->connector_type[i])
>>> +			pmf->connector_type[i] = connector->connector_type;
>>> +
>>> +		i++;
>>> +		if (i >= MAX_SUPPORTED)
>>> +			break;
>>> +	}
>>> +	drm_connector_list_iter_end(&iter);
>>> +	mutex_unlock(&mode_config->mutex);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>> +
>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (!acpi_video_backlight_use_native())
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	*state = backlight_get_brightness(bd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (!acpi_video_backlight_use_native())
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	if (backlight_is_blank(bd))
>>> +		*state = 0;
>>> +	else
>>> +		*state = bd->props.max_brightness;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>>> +};
>>> +
>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>> +{
>>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +
>>> +	if (!(adev->flags & AMD_IS_APU)) {
>>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	if (!acpi_video_backlight_use_native())
>>> +		return -ENODEV;
>>> +
>>> +	pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!pmf->raw_bd)
>>> +		return -ENODEV;
>>> +
>>> +	pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
>>> +							   pmf, &bd_cooling_ops);
>>> +	if (IS_ERR(pmf->cooling_dev))
>>> +		return -ENODEV;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>> +
>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>> +{
>>> +	thermal_cooling_device_unregister(pmf->cooling_dev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>>> index f246252bddd8..7f430de7af44 100644
>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>   	depends on AMD_NB
>>>   	select ACPI_PLATFORM_PROFILE
>>>   	depends on TEE && AMDTEE
>>> +	depends on DRM_AMDGPU
>>>   	help
>>>   	  This driver provides support for the AMD Platform Management Framework.
>>>   	  The goal is to enhance end user experience by making AMD PCs smarter,
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>> index 4b8156033fa6..c59ba527ff49 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>>   	}
>>>   
>>>   	dev->cpu_id = rdev->device;
>>> +	dev->root = rdev;
>>>   
>>>   	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>   	if (err) {
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 8712299ad52b..615cd3a31986 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -13,6 +13,7 @@
>>>   
>>>   #include <linux/acpi.h>
>>>   #include <linux/platform_profile.h>
>>> +#include <linux/amd-pmf-io.h>
>>>   
>>>   #define POLICY_BUF_MAX_SZ		0x4b000
>>>   #define POLICY_SIGN_COOKIE		0x31535024
>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>   	void *shbuf;
>>>   	struct delayed_work pb_work;
>>>   	struct pmf_action_table *prev_data;
>>> +	struct amd_gpu_pmf_data gfx_data;
>>>   	u64 policy_addr;
>>>   	void *policy_base;
>>>   	bool smart_pc_enabled;
>>> +	struct pci_dev *root;
>>>   };
>>>   
>>>   struct apmf_sps_prop_granular {
>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>>> index 512e0c66efdc..cf4962ef97c2 100644
>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>>   	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
>>>   	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>>   	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
>>> +	dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>> +		drm_get_connector_type_name(in->ev_info.display_type));
>>> +	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
>>> +			"Connected" : "disconnected/unknown");
>>>   	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>>>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>   }
>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>   	return 0;
>>>   }
>>>   
>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>> +{
>>> +	amd_pmf_get_gfx_data(&dev->gfx_data);
>>> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
>>> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
>>> +}
>>> +
>>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>>   {
>>>   	/* TA side lid open is 1 and close is 0, hence the ! here */
>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>   	amd_pmf_get_smu_info(dev, in);
>>>   	amd_pmf_get_battery_info(dev, in);
>>>   	amd_pmf_get_slider_info(dev, in);
>>> +	amd_pmf_get_gpu_info(dev, in);
>>>   }
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 2f5fb8623c20..956e66b78605 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -9,6 +9,7 @@
>>>    */
>>>   
>>>   #include <linux/debugfs.h>
>>> +#include <linux/pci.h>
>>>   #include <linux/tee_drv.h>
>>>   #include <linux/uuid.h>
>>>   #include "pmf.h"
>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>>>   	return amd_pmf_start_policy_engine(dev);
>>>   }
>>>   
>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>> +{
>>> +	struct amd_pmf_dev *dev = data;
>>> +
>>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>> +		/* Found the amdgpu handle from the pci root after walking through the pci bus */
>> If you insist on having this comment, make it a function comment instead
>> (with appropriate modifications into the content of it) but I personally
>> don't find it that useful so it could be just dropped as well, IMO.
>>
>>> +		dev->gfx_data.gpu_dev = pdev;
>>> +		return 1; /* Stop walking */
>>> +	}
>>> +
>>> +	return 0; /* Continue walking */
>>> +}
>>> +
>>>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>>>   {
>>>   	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>   	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>   	amd_pmf_set_dram_addr(dev);
>>>   	amd_pmf_get_bios_buffer(dev);
>>> +
>>> +	/* Get amdgpu handle */
>> Useless comment.
>>
>>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>> +	if (!dev->gfx_data.gpu_dev)
>>> +		dev_err(dev->dev, "GPU handle not found!\n");
>>> +
>>> +	if (!amd_pmf_gpu_init(&dev->gfx_data))
>>> +		dev->gfx_data.gpu_dev_en = true;
>>> +
>>>   	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>   	if (!dev->prev_data)
>>>   		return -ENOMEM;
>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>>   	kfree(dev->prev_data);
>>>   	kfree(dev->policy_buf);
>>>   	cancel_delayed_work_sync(&dev->pb_work);
>>> +	if (dev->gfx_data.gpu_dev_en)
>>> +		amd_pmf_gpu_deinit(&dev->gfx_data);
>>> +	pci_dev_put(dev->gfx_data.gpu_dev);
>>>   	amd_pmf_tee_deinit(dev);
>>>   }
>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>> new file mode 100644
>>> index 000000000000..5f79e66a41b3
>>> --- /dev/null
>>> +++ b/include/linux/amd-pmf-io.h
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * AMD Platform Management Framework Interface
>>> + *
>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>> + * All Rights Reserved.
>>> + *
>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> + */
>>> +
>>> +#ifndef AMD_PMF_IO_H
>>> +#define AMD_PMF_IO_H
>>> +
>>> +#include <acpi/video.h>
>>> +#include <drm/drm_connector.h>
>>> +#include <linux/backlight.h>
>>> +#include <linux/thermal.h>
>>> +
>>> +#define MAX_SUPPORTED 4
>>> +
>>> +/* amdgpu */
>> Document the structure properly with kerneldoc instead of an unhelpful
>> comment like above :-). Please also check if you add any other structs
>> into kernel-wide headers that you didn't document yet. Or fields into
>> existing structs.
>>
>>> +struct amd_gpu_pmf_data {
>>> +	struct pci_dev *gpu_dev;
>>> +	struct backlight_device *raw_bd;
>>> +	struct thermal_cooling_device *cooling_dev;
>>> +	enum drm_connector_status con_status[MAX_SUPPORTED];
>>> +	int display_count;
>>> +	int connector_type[MAX_SUPPORTED];
>>> +	bool gpu_dev_en;
>>> +};
>>> +
>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>> +#endif
>>>

