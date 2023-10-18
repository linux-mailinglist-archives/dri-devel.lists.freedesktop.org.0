Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49187CE193
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 17:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2610E160;
	Wed, 18 Oct 2023 15:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B588A10E132;
 Wed, 18 Oct 2023 15:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOPiBPQzG7qEDxD6NT7CucMm1eNWHRrGwuAiyxJ42AifH3idbSonOFi6ptKX1Eyt5D6rfnnKNubNB0AX42lf3pPeiNJEkzeu/nTgMpz9bwrf8sS5GAy3m0gGPvvcx8tfVEWOg06rUUKxtWtWGpKzRgoUpUoHvOxB2lJZY8auG6QPHohoI6Z6IkuOeGuy43nwvMTLq/8xWniuh3GAN6lPoV7Dv4ablNKyLEeqZwJdUrHrGHQ7Znee7E73M9NVxCu8VV9c2zZjuJRzsyQMKKqYU3ooY3mkWrjkjWqnnlbf77Py6xaT0fxfIwbiutRPwnirX4bL1rHJTazQt82MxQUjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chO9/RnHGtWfI9PZLIQ33EFUnatqP07/hBgVmHvRysw=;
 b=F1jxUWhUvIsah/SEwycoY1dkjHfyTQRRyhPiGBG61GuoSztY4QYC/c8Wch9oomSKTw6EeyF5x+SrGlzSyuNIak0sXutU1x80fBqVzCs5dF/onKQoa0gqjIrjOG5HkbqfMleWVXrXvZ977McTYj/PHEhJZG1FdNKokuG2yfBt/t6gW7g2Vxa1ef1M+CieMqHyZc+xaXPRmzWcD9j7H1ToSIAksEtKxXLk+x9Qid2F+71rQ363v4AiTeJ8Gxlam2kI/jZXUZiYUMNKPMm6cWq562NQ/8lqPkXwrYn2RvcX+MhfNVdTh0/g6L7hNkRI0KHXwa0D6uYVK9eVn+oTJ5RNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chO9/RnHGtWfI9PZLIQ33EFUnatqP07/hBgVmHvRysw=;
 b=T4nQUpVo49grO2aRVBOiFlcISA48Y8vEugy+1WyXGur7lrAL/PUCf0La1mladn0Z10qW8M3AnYx65Hv28TNPwly4qRlWiOFNGbUJZ/pZR5IZv34FN2ji4lE/O4rHp1SsxRxJmv/L7vYvZ6kDBV4gbGmQu0oxMqoIJkladgIQkzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB5005.namprd12.prod.outlook.com (2603:10b6:5:1be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:47:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:47:06 +0000
Message-ID: <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
Date: Wed, 18 Oct 2023 10:47:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fad8a42-a516-40c5-071c-08dbcff17ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MynSab3kdAZ/7EfQzaHhpdGmiCp/+GL0xYbynkAc6+11d1oSQNBzcHHckqoRvZ2DoD6DYAjOIKtZZ8T90feoGgTvs6VyiCNl1jv4jD6I5uXXWYAmncYmfPo+GzeiIgesqGWWFP6m9Dc5Rw9CjY65F3vLWlL2vW7XOYpjfkpJ81HfH1H6XwMRf36hXUmDSuLVSLXSaXY23W5CI7lY7rYGkcrMAt4nIT2OLp2WTUoUMctkdwnEiLdJ38OAteDGWYZlARuF9IZOgGAFIBqORl7MmzpJ9hnqBEMhmmnIuhT7cJvRbJOKDAn4bB/7woPh+3AskzrVZQEdffup5RbMl9lH1cEdorZF+4XbedZap9eGDei5ZQbVPuh6qRSJCt53wD8BzvPyTCoyGOusP+FSNAVJnnbfbxkKLtREORBdyFZ7zQNOV7dFs2MdhLBMNP2XcOqgaqvSSHST+nOQDqgtQ8G75PhqFGcBXLPwGpxbVAZzNKEwYX3O4sjFznipSCyu7iP+LSUPcHHkjW8WhUMEZ1JtU8LbLrh5F5zIQ09zxjM8DBdKN3+WB78d7fvs+k2aCBQGzAJWYgUCliKA539TXb8Fqusu0ZGoMjQ/mMiP2i1xBKHuS52piSbOCDl/JrbGR+81g8SLCcgRUDACPRGaqNCNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(7416002)(26005)(8936002)(4326008)(8676002)(44832011)(2616005)(41300700001)(6512007)(5660300002)(86362001)(66899024)(30864003)(2906002)(66476007)(31696002)(6666004)(66574015)(36756003)(66946007)(66556008)(110136005)(316002)(83380400001)(38100700002)(31686004)(6486002)(478600001)(45080400002)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNYSXh5K1ZpNE5tQ0F1amV6UlR5U05ZRXlwN3h4NWhSakRtR0xxcHhnbUFw?=
 =?utf-8?B?RXpNWU1wOGw3UUZqNTg0UGtwekx6anU5alZnY1oyaUFNdnhLOUszWnV4dXNo?=
 =?utf-8?B?cnNLS0lna1pEU0xHVm54NmowWVFxcXJmQ2pvblUyWGtpNSsvZld0ekRmTWV0?=
 =?utf-8?B?aWpaQXpXSVpqN2RwL0phUHE0S24rM0lmYlNCc0taZGt3bExHNXgzMGlDcEsw?=
 =?utf-8?B?ejJ4cXJJVitmMXJXYS9Dd08yYmpXQ253Nml5Z0JXQjQzOVVpeDR0TjF2eFJ6?=
 =?utf-8?B?VGFpM00xZmlyN2gvdnVxclpmM1VycFc1R1NyeXB1Z2R2ejc3RnFHbk5QYjNt?=
 =?utf-8?B?Vkk2VFlKNDFUOXlQS0pGU3BOZzJRUHdDNFA5Vmlpc0hFVThjMUg5eTdxTUs3?=
 =?utf-8?B?T0ZpeVRKN3M1Nnlhd2FQNnNQUGhJRmZ3azgyUEFOZTBNSGpJRXlrdGUxc0JU?=
 =?utf-8?B?a042akgwUnNKNnFLSkxyL29mZU01NFNYenRSelFiTDFYQXNDQ0p3VmtlUmxM?=
 =?utf-8?B?SGxQeHcyM1VqRVh1UTdDZnFNcThwcVcwZGN3M1NnbU5qTytkbUxidzhuNThU?=
 =?utf-8?B?TkFad3U0VVdSK3pyY2N5L1ZZemlPMm1BNlAzWlAwZXYyY1F0YTRJdW1qajRB?=
 =?utf-8?B?cW9MZ1U2akNYZlIxTWxMSUVSeGRCTlNpOFc5SUwxY2YzTS9BRHhnZm5hdzZX?=
 =?utf-8?B?MGw0Si84RmlpL2ZFOVd4d2s0NWRuRnptV1FLMVM4OWxoWTEzdStuMkYydVls?=
 =?utf-8?B?a3FaS3B2U0pKN1JaZ1VuS0gzRzIwL2svdGZHZ08rVUJwM1FLQ0JnQVNWcXox?=
 =?utf-8?B?a3VsallKNUNxVVBOd0QxV2dMU3Zkc0wrbTRpdTBnL25BL3Fhc1ZtVWd5ZTdH?=
 =?utf-8?B?dHp1L09sWG0rZDRVRVQxTndnTVUvSGdWVzEreGpYTjNPVkdoa1RGUlp5VWNL?=
 =?utf-8?B?S2hJWnVKdG44bnZkcFlNNkJRaW9BUDFDTVVxcUgyQ0d5YWMrVUtXR0swRlho?=
 =?utf-8?B?b2ZHN1BjdmV1SGt6Q21ZZ015a0NkaE84azI4RGRPa3ZsNVlOaTBKQUhMdHRS?=
 =?utf-8?B?aFkwUXcyaG9DU1p5bWowbm5wN0VjN3paN0ZjYUtFN2duenBoY0pzSXgwK2lF?=
 =?utf-8?B?UHFGMVJEMkVlMGQzSjlKbXdIRVF5a3BkMnBBLzE1Z0ViRnFyU1RkMDlENnhm?=
 =?utf-8?B?NzFPNCtra3VIL2RnQWFwSEZ0aGR3ZFVCTmRZNWxkc0V1VEpXV0RCOG0waGhH?=
 =?utf-8?B?YURLVlA3Q3hBVWZyVmFHbE5qQ3RwVmx0R3lBa1g2dUpHTWJiNXRsRk9jYkxq?=
 =?utf-8?B?NXlDV0VqUElTNjdwZ0dVTmJTelEvNTRxV1JUYWY2NDBXK0pUL2hMT0szbmh0?=
 =?utf-8?B?RGk4WHM4b2dsbkZpMkgzWlAvR0tNaGtjVVBTdTZ1aFEvdDBSbFo5K0FjcnBp?=
 =?utf-8?B?NTh4T0RWNW4xSWJOSmNuWmRRK0pNaDJ4MlR1aFdwbGU0L25KcnQwL3JkSFFR?=
 =?utf-8?B?WkF5dEVMYWczeVVDeTRFTXBwZjM0Y2VINElFOXBFK0FmQTdNbUc4aW96N2Y0?=
 =?utf-8?B?VXczL3VHYklFWHpaR0FOSUczbTN1UndLcE5XUTRFOFY3Y0lvZi9kU0RJSWtF?=
 =?utf-8?B?eGhBL1hYc1VaREV1aSs0TVlueVA1RndET2lXYThISkRkSEVUTlVlTHJGNldZ?=
 =?utf-8?B?YWtEVjFIbWE0UXpYWFVPNWRpQ1QvRDBWMmhCbmRvVkNiOVQ2U2tKL1d2bXRY?=
 =?utf-8?B?RGpkeEpMZjFjZzF1UW45S1lYSkNBNmt6RTZ3bzRwTVIvN0hneGRoTXMwZXFo?=
 =?utf-8?B?NG4vMFlFWE4yRDhpT3ZWZ2hpK05Vc2R3ei8yQW05RmVpWnNQSW9HNHdLbzBO?=
 =?utf-8?B?Q0JyS3REVnpXdzNDYXpJMElWMTJ4Y3l2eU5HVFZWeVkzdldXVVh6UFM5M0Nt?=
 =?utf-8?B?WXhMR3R0QUJnNWdDdEh2VGdIZDBDbGc3OXQ2MmRGV0VSUmpaL0NwRWVFMnRJ?=
 =?utf-8?B?ankvOThvamQxajZwSjkrd1p2SmRrandHVm1vRGVKRWJ5RkpIWHM3Lzg1WFp0?=
 =?utf-8?B?a200VlVMeWJ1M2RrL2puNlI3L2xKNktGQlNaNm1HdEE4c01INjU3VHVGOUwv?=
 =?utf-8?Q?OUfWunwzH0W7+gGoa5+FpvdK/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fad8a42-a516-40c5-071c-08dbcff17ae4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:47:06.1033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9187WnrTPao/BDAsIj1tNOAvTG7ppLfSTfkQCbePNTJGNjpBkfgVDbkSdhPF4/IlOv43GgMzAFMwalGbSURMIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5005
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
 jikos@kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, markgross@kernel.org,
 Hans de Goede <hdegoede@redhat.com>, benjamin.tissoires@redhat.com,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/2023 08:40, Christian König wrote:
> 
> 
> Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>>
>> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>>
>>>> In order to provide GPU inputs to TA for the Smart PC solution to 
>>>> work, we
>>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>>
>>>> Add the initial code path for get interface from AMDGPU.
>>>>
>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 
>>>> ++++++++++++++++++++++++
>>>>   drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>>   drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>>   drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>>   drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>>   drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>>   include/linux/amd-pmf-io.h              |  35 ++++++
>>>>   9 files changed, 220 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>   create mode 100644 include/linux/amd-pmf-io.h
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> index 384b798a9bad..7fafccefbd7a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>   amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>>> +
>>>>   # add asic specific block
>>>>   amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>>       dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -50,6 +50,7 @@
>>>>   #include <linux/hashtable.h>
>>>>   #include <linux/dma-fence.h>
>>>>   #include <linux/pci.h>
>>>> +#include <linux/amd-pmf-io.h>
>>>>   #include <drm/ttm/ttm_bo.h>
>>>>   #include <drm/ttm/ttm_placement.h>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>> new file mode 100644
>>>> index 000000000000..ac981848df50
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>> @@ -0,0 +1,138 @@
>>>> +/*
>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person 
>>>> obtaining a
>>>> + * copy of this software and associated documentation files (the 
>>>> "Software"),
>>>> + * to deal in the Software without restriction, including without 
>>>> limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, 
>>>> sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to 
>>>> whom the
>>>> + * Software is furnished to do so, subject to the following 
>>>> conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be 
>>>> included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>>>> EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>>>> MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO 
>>>> EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>>>> DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
>>>> OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE 
>>>> USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> This is MIT, right? Add the required SPDX-License-Identifier line for it
>>> at the top of the file, thank you.
>>>
>> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
>> text. So, have retained it to maintain uniformity.
> 
> Please add the SPDX License Identifier for any file you add.
> 
> Apart from that the whole approach of attaching this directly to amdgpu 
> looks extremely questionable to me.
> 

What's the long term outlook for things that are needed directly from 
amdgpu?  Is there going to be more besides the backlight and the display 
count/type?

At least for the display count I suppose one way that it could be 
"decoupled" from amdgpu is to use drm_for_each_connector_iter to iterate 
all the connectors and then count the connected ones.

> Regards,
> Christian.
> 
>>
>>>> + *
>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> + *
>>>> + */
>>> Remove the extra empty line at the end of the comment.
>>>
>> I just took the standard template for all the gpu files. Is that OK to
>> retain the blank line?
>>
>> If not, I can remove it in the next version.
>>
>> Rest all remarks I will address.
>>
>> Thanks,
>> Shyam
>>
>>>> +
>>>> +#include <linux/backlight.h>
>>>> +#include "amdgpu.h"
>>>> +
>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>> +{
>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>> +    struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>> +    struct drm_connector_list_iter iter;
>>>> +    struct drm_connector *connector;
>>>> +    int i = 0;
>>>> +
>>>> +    /* Reset the count to zero */
>>>> +    pmf->display_count = 0;
>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    mutex_lock(&mode_config->mutex);
>>>> +    drm_connector_list_iter_begin(drm_dev, &iter);
>>>> +    drm_for_each_connector_iter(connector, &iter) {
>>>> +        if (connector->status == connector_status_connected)
>>>> +            pmf->display_count++;
>>>> +        if (connector->status != pmf->con_status[i])
>>>> +            pmf->con_status[i] = connector->status;
>>>> +        if (connector->connector_type != pmf->connector_type[i])
>>>> +            pmf->connector_type[i] = connector->connector_type;
>>>> +
>>>> +        i++;
>>>> +        if (i >= MAX_SUPPORTED)
>>>> +            break;
>>>> +    }
>>>> +    drm_connector_list_iter_end(&iter);
>>>> +    mutex_unlock(&mode_config->mutex);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>> +
>>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device 
>>>> *cooling_dev,
>>>> +                     unsigned long *state)
>>>> +{
>>>> +    struct backlight_device *bd;
>>>> +
>>>> +    if (!acpi_video_backlight_use_native())
>>>> +        return -ENODEV;
>>>> +
>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +    if (!bd)
>>>> +        return -ENODEV;
>>>> +
>>>> +    *state = backlight_get_brightness(bd);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device 
>>>> *cooling_dev,
>>>> +                     unsigned long *state)
>>>> +{
>>>> +    struct backlight_device *bd;
>>>> +
>>>> +    if (!acpi_video_backlight_use_native())
>>>> +        return -ENODEV;
>>>> +
>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +    if (!bd)
>>>> +        return -ENODEV;
>>>> +
>>>> +    if (backlight_is_blank(bd))
>>>> +        *state = 0;
>>>> +    else
>>>> +        *state = bd->props.max_brightness;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>> +};
>>>> +
>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>>> +{
>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>> +
>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    if (!acpi_video_backlight_use_native())
>>>> +        return -ENODEV;
>>>> +
>>>> +    pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>> +    if (!pmf->raw_bd)
>>>> +        return -ENODEV;
>>>> +
>>>> +    pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
>>>> +                               pmf, &bd_cooling_ops);
>>>> +    if (IS_ERR(pmf->cooling_dev))
>>>> +        return -ENODEV;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>>> +
>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>>> +{
>>>> +    thermal_cooling_device_unregister(pmf->cooling_dev);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig 
>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>> index f246252bddd8..7f430de7af44 100644
>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>>       depends on AMD_NB
>>>>       select ACPI_PLATFORM_PROFILE
>>>>       depends on TEE && AMDTEE
>>>> +    depends on DRM_AMDGPU
>>>>       help
>>>>         This driver provides support for the AMD Platform Management 
>>>> Framework.
>>>>         The goal is to enhance end user experience by making AMD PCs 
>>>> smarter,
>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c 
>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>> index 4b8156033fa6..c59ba527ff49 100644
>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device 
>>>> *pdev)
>>>>       }
>>>>       dev->cpu_id = rdev->device;
>>>> +    dev->root = rdev;
>>>>       err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>>       if (err) {
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h 
>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 8712299ad52b..615cd3a31986 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -13,6 +13,7 @@
>>>>   #include <linux/acpi.h>
>>>>   #include <linux/platform_profile.h>
>>>> +#include <linux/amd-pmf-io.h>
>>>>   #define POLICY_BUF_MAX_SZ        0x4b000
>>>>   #define POLICY_SIGN_COOKIE        0x31535024
>>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>>       void *shbuf;
>>>>       struct delayed_work pb_work;
>>>>       struct pmf_action_table *prev_data;
>>>> +    struct amd_gpu_pmf_data gfx_data;
>>>>       u64 policy_addr;
>>>>       void *policy_base;
>>>>       bool smart_pc_enabled;
>>>> +    struct pci_dev *root;
>>>>   };
>>>>   struct apmf_sps_prop_granular {
>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c 
>>>> b/drivers/platform/x86/amd/pmf/spc.c
>>>> index 512e0c66efdc..cf4962ef97c2 100644
>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev 
>>>> *dev, struct ta_pmf_enact_table *
>>>>       dev_dbg(dev->dev, "Max C0 Residency : %u\n", 
>>>> in->ev_info.max_c0residency);
>>>>       dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>>>       dev_dbg(dev->dev, "Connected Display Count : %u\n", 
>>>> in->ev_info.monitor_count);
>>>> +    dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>>> +        drm_get_connector_type_name(in->ev_info.display_type));
>>>> +    dev_dbg(dev->dev, "Primary Display State : %s\n", 
>>>> in->ev_info.display_state ?
>>>> +            "Connected" : "disconnected/unknown");
>>>>       dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? 
>>>> "Close" : "Open");
>>>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>>   }
>>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct 
>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>       return 0;
>>>>   }
>>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct 
>>>> ta_pmf_enact_table *in)
>>>> +{
>>>> +    amd_pmf_get_gfx_data(&dev->gfx_data);
>>>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>>>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
>>>> +}
>>>> +
>>>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct 
>>>> ta_pmf_enact_table *in)
>>>>   {
>>>>       /* TA side lid open is 1 and close is 0, hence the ! here */
>>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct 
>>>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>>       amd_pmf_get_smu_info(dev, in);
>>>>       amd_pmf_get_battery_info(dev, in);
>>>>       amd_pmf_get_slider_info(dev, in);
>>>> +    amd_pmf_get_gpu_info(dev, in);
>>>>   }
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c 
>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index 2f5fb8623c20..956e66b78605 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -9,6 +9,7 @@
>>>>    */
>>>>   #include <linux/debugfs.h>
>>>> +#include <linux/pci.h>
>>>>   #include <linux/tee_drv.h>
>>>>   #include <linux/uuid.h>
>>>>   #include "pmf.h"
>>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct 
>>>> amd_pmf_dev *dev)
>>>>       return amd_pmf_start_policy_engine(dev);
>>>>   }
>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>>> +{
>>>> +    struct amd_pmf_dev *dev = data;
>>>> +
>>>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>> +        /* Found the amdgpu handle from the pci root after walking 
>>>> through the pci bus */
>>> If you insist on having this comment, make it a function comment instead
>>> (with appropriate modifications into the content of it) but I personally
>>> don't find it that useful so it could be just dropped as well, IMO.
>>>
>>>> +        dev->gfx_data.gpu_dev = pdev;
>>>> +        return 1; /* Stop walking */
>>>> +    }
>>>> +
>>>> +    return 0; /* Continue walking */
>>>> +}
>>>> +
>>>>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data 
>>>> *ver, const void *data)
>>>>   {
>>>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>       INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>       amd_pmf_set_dram_addr(dev);
>>>>       amd_pmf_get_bios_buffer(dev);
>>>> +
>>>> +    /* Get amdgpu handle */
>>> Useless comment.
>>>
>>>> +    pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>> +    if (!dev->gfx_data.gpu_dev)
>>>> +        dev_err(dev->dev, "GPU handle not found!\n");
>>>> +
>>>> +    if (!amd_pmf_gpu_init(&dev->gfx_data))
>>>> +        dev->gfx_data.gpu_dev_en = true;
>>>> +
>>>>       dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>>       if (!dev->prev_data)
>>>>           return -ENOMEM;
>>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev 
>>>> *dev)
>>>>       kfree(dev->prev_data);
>>>>       kfree(dev->policy_buf);
>>>>       cancel_delayed_work_sync(&dev->pb_work);
>>>> +    if (dev->gfx_data.gpu_dev_en)
>>>> +        amd_pmf_gpu_deinit(&dev->gfx_data);
>>>> +    pci_dev_put(dev->gfx_data.gpu_dev);
>>>>       amd_pmf_tee_deinit(dev);
>>>>   }
>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>> new file mode 100644
>>>> index 000000000000..5f79e66a41b3
>>>> --- /dev/null
>>>> +++ b/include/linux/amd-pmf-io.h
>>>> @@ -0,0 +1,35 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * AMD Platform Management Framework Interface
>>>> + *
>>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>>> + * All Rights Reserved.
>>>> + *
>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> + */
>>>> +
>>>> +#ifndef AMD_PMF_IO_H
>>>> +#define AMD_PMF_IO_H
>>>> +
>>>> +#include <acpi/video.h>
>>>> +#include <drm/drm_connector.h>
>>>> +#include <linux/backlight.h>
>>>> +#include <linux/thermal.h>
>>>> +
>>>> +#define MAX_SUPPORTED 4
>>>> +
>>>> +/* amdgpu */
>>> Document the structure properly with kerneldoc instead of an unhelpful
>>> comment like above :-). Please also check if you add any other structs
>>> into kernel-wide headers that you didn't document yet. Or fields into
>>> existing structs.
>>>
>>>> +struct amd_gpu_pmf_data {
>>>> +    struct pci_dev *gpu_dev;
>>>> +    struct backlight_device *raw_bd;
>>>> +    struct thermal_cooling_device *cooling_dev;
>>>> +    enum drm_connector_status con_status[MAX_SUPPORTED];
>>>> +    int display_count;
>>>> +    int connector_type[MAX_SUPPORTED];
>>>> +    bool gpu_dev_en;
>>>> +};
>>>> +
>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>>> +#endif
>>>>
> 

