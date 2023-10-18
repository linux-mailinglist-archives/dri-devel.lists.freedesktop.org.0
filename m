Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2987CE355
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B760710E199;
	Wed, 18 Oct 2023 17:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9710E199;
 Wed, 18 Oct 2023 17:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGkC+8JtajjOYBYKO+g1SiCdVdzyeJTZvxOekxjf/0OL5Vwf4UJS/2Vz3GTVkzLMBlUmElm8Z67rQJqpz86fRKqgrq6Ajtq6tnuTp1fjedKxcK9VjWV7snwvpCXjkfyXJu4jFjghHIFbhRzjTCS7TyY4Y//fDPF8o0B/b6wR9QT9z7YSH3eELy8CqPO3X6uVUyz5JyFQE1WVtR/Mt940oBY+slit6GcMfEHW/b8Qsix/FJZFQ1Jm4sCxXocWAzyIa17yLAOQqMmOID9RYPO7n00CDUiG0HoUgHBIVHYiqU/FBkRtvbFY1zxU44BlNnDlaXCM6t76Xb+GR37UZh6gGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5AcOkXUaGsHGRiXi6BJ/twMWJGb5U2uv/SFGI9bduk=;
 b=aliVdyMYLLVnGajO52DeWWMqdmRHbJO8/5g3mPbb9hgp6ozDB9PHdgK49LLspjYAkl0i2YSkVfZSnpHHmh1dvGL1QOzHeTpM7LNw7lj2C9tXe3DIjFji7lk/4QNxwV1ULK8NNdValKzLwn8SViIt6hWzo8wnjE/hIUucguvr55OpURd0msJmaQWCZUm+il7O+EG0EF1UO9J0lvpsbEz6c9la8Jqqa2HQ9ncbnmhGTmJL1ouWfSZkUjBwV+c/xJH0IvF++9kVwu3IBpOBKYctvcY3aWQ+dHg6KMdgUg04lI7I96zJZbCiXaxZYP14NoIfyMH7cqdiUKLnkWjfUdD5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5AcOkXUaGsHGRiXi6BJ/twMWJGb5U2uv/SFGI9bduk=;
 b=DQgiW5XMmkRPUyNo2ClMHqDQaRB7YvL8P3UAK2RhLrnpPfuqoLbOcL9WZdMYU/eTtRNTj0XIAp+At9VHWt0AT28ghm3QKP+WBa4UuBP2arafHfGA8ahwH4PIdhm5lF5/mztm2bq5OyyCD1XUKRMpE88oZN1t9tsyNeqEKqW+n4E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 17:05:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 17:05:15 +0000
Message-ID: <80fcdcb2-1a22-4002-9bfd-d6cf15d5a57b@amd.com>
Date: Wed, 18 Oct 2023 22:35:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
 <c8ed2e1e-77b9-459e-b81a-e95db4d22a9b@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c8ed2e1e-77b9-459e-b81a-e95db4d22a9b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::27) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3c6786-8d35-4067-0dfb-08dbcffc65af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g4C9UdSEnN0HpbzBNTfqshs8NQQ5l7Lfs6H6I0yMWHx2rmokJdubXU7IZimYi8fTQKXfChBMXdywsERUwwZuoOikxkO9Fr754EQJKLJ5aFPfaLt5E/ILcJAIb51L42Rlrk/GjEN4O58uWMcVXdXtX5PrM8uDbNBlaU9sYiAODsKG1Zmv2NpUiUoXgStGwZPX+1kPbUIFm5+ol/54GHT5rod/XKeX2OzrC3DXrU+3lbKwwDTEXO4+PsRq3J85A0mKKszz9x4ImLlmyeQ9DqQ4M3uUvJG1WtUXLQHJMMOBd9aDOmcAIo/FgTRqYm6JylElfjuRjADo3ft7TG8PI7raFVGADplsOss3vSYStN+jrekdinJd4uF8RvTxfQhcrC0j+jimVfuhDiCWNsX6nOeyY1gQPbVSF6ZuOeku51pieOK28M9O9bNx+TfnAjua9ce/TVS7/E5ZSN3n8/IY985ArWe4CmJls61g2lvkGnIIrBrbEiwMV6xmrUls2lL1aLK+v5ddTIbBk1HuEIufkFsGR+7JEk/74/oP1uALQfzBwb3kD936hV4OmO6ZCATHEcQKmch277cy2sOVsqgpkpjt33fuAdS4/G8a/8uQ6FnT/B/86vw0xGgI31Mx3rKk/RdSNYPxChVWx4W8uEBd93FN2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(38100700002)(66899024)(478600001)(6486002)(5660300002)(110136005)(8676002)(8936002)(4326008)(31696002)(86362001)(7416002)(66946007)(2906002)(6666004)(45080400002)(41300700001)(30864003)(6506007)(66476007)(66556008)(316002)(53546011)(6512007)(2616005)(26005)(83380400001)(66574015)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHUrWU9RQkpBNk05Vk9aQTdZaWhmcW45WW15aUYvc2J6ZU01R1lqOTZ0NDBN?=
 =?utf-8?B?ME9iOFU3QUVvVWVBaVZ3Z0F5Y1UwMm5RQkRrZzNXVWc1U0RFa1BPM0lhV3RT?=
 =?utf-8?B?cXlBZ3RSYkNUU3cxRmcwaGZUa1ppcVNpYW55TTFac0VXSysxRVV0ZS93Z2JH?=
 =?utf-8?B?b2tnWUJYWlpuT21KVjhGUXlkYmhIRy9tM1lxVndHWmtYZ0ErUDdScGF2UTBo?=
 =?utf-8?B?MGZGaDN6RkwvdSszMDcxNTc3ZTAzbkxWR3pDNis2cWxLelNpQ01MeU8yQUI1?=
 =?utf-8?B?UlU5RC9TcDN4cnU5dXZFWXRWb3VDVmJlK01jMGdSU25MQjhRVWE2azV3dFF0?=
 =?utf-8?B?UTlmUE0yZk4vNllIczEzdTNGeU5COGdXVmFRd2lRaFNvV2d2MTIxWm5VaGZu?=
 =?utf-8?B?UmI2SDRwV3FTV2hRNFcyUWNBcjA5enNENGJQemFSSkR3dk1PRjVSN1JPdkhI?=
 =?utf-8?B?amtUU2xacTJ3NG42dGlyTUFJSlBvd0plNktDQ1RMdEU4OEp1Y0VobzJ2dEw5?=
 =?utf-8?B?dGRlNE8yYVpuZ09NWUVFQ0xQK0hUdWg2ZnpnRCtsbHZsUE5PSlJuYVQ3ZmhT?=
 =?utf-8?B?blJrVEpCc0RTZGJ2S0huTjQva3hNK29KTmpuNllOVWlscmU1VS82ZVNqeGtV?=
 =?utf-8?B?RjdiTTJObXdiNENvRVJPQ2Vzb05xVzdhTnRjS0hNcVFHZS83bEtSNjVjTjdV?=
 =?utf-8?B?YTIyZU90aFhxWUFyV2hydFJhZUo5elYxdXYyRFlrYTVTOEZjSW5UM0xoQmkz?=
 =?utf-8?B?K25OL0VxNzZDeWRoUUVncXRjOUhGWXdFck5ILzJmU1oyVG15ZXpVa2d4aHFB?=
 =?utf-8?B?YThXTWR4SWVySWozeW1JMS9jT1d0U0hMQ2VHbFZKaHUzUzJsMWNpTnZMNk0y?=
 =?utf-8?B?dHpVWDA3U0krT0h0dnRXYVZ5ZitMRjF4S3pUZWxNM1VJcFA3OHZ5N2grQ1VN?=
 =?utf-8?B?R3A5MDZrM2s0WEpzOEgwOUxjTmNST3ZQYkg2SGZJd1MwZnJmSmJtS1o0Vk1z?=
 =?utf-8?B?SGZxVk4vcWRHbXI1OUxLV2ZQOXFDYnlMYk5YemFzNlZHSEk4WTV5TVlOaldp?=
 =?utf-8?B?S2YvcFRkcXBmaExxdXFGVkg2VHhSY2h0bVlBeHQyQys3bzJhcFNwdkRFMGx4?=
 =?utf-8?B?d25OL1AzQkJUZlIxVm9YOHNlWXRaM21aUFJCV3UxdWZqdXlJWlVHMzEyald1?=
 =?utf-8?B?a1FjS2ZzdTdNQTRkRUd3TGlXOWxRbmtEcHVva3NUUHlDWWFHeXpyRENBRVE1?=
 =?utf-8?B?NnpJRUl3Qkhoa0FoTW5zRUh5Q3FuN3dwNW95R3B0UnRmOHN3ak9EV29sTlN6?=
 =?utf-8?B?QUlJQW5aVXlHcU1qYnl0cnREbWNhQ0ZSbjc2cU1FRkltUG1LMkNpQXJ0OFFS?=
 =?utf-8?B?UjZ5VmZUMVdTNE9nL3NlRFlCcUI1eHlXSVlKdzRBZk4wbnRnZVFXT01DVnY5?=
 =?utf-8?B?VUJES3FCRG9ac2pPRlg0UEtPcjRVQnlMUUwxNkVBbjdHMnNLM1pBcXBvQ1RJ?=
 =?utf-8?B?c0V6c1R1QTFDNmFYd2l2VW52VU9sOWxtMG5PZFlocXpYWnZ3NTZmN0V6WThN?=
 =?utf-8?B?U2lMbDg3NmF0S0IzYlV0Z2thR0xzbm1ROXlzMmdQZWMvcFNacHk4ZXc5R1Y4?=
 =?utf-8?B?bTRteE5kY04yVlg0L0FLWm8vY2RlcGFPYW1wUU1FTkMwbUJ0YUVMVG1CSGg5?=
 =?utf-8?B?OXJlb0x5YUNabEppd0t1d3FIMVhEZ3l1cXFoK2xqWDdoZ3NrZzhCMkc0eEVW?=
 =?utf-8?B?WXhJR2ZWdlZ1amxEdkcwU3RIVHlMNFdpK0VJbWY5RzkrQUJlNWxqbmlRYXY3?=
 =?utf-8?B?dG9PUzd1ZTRrNXlDWU9QZGdnVTRoaWZTL1RoRTlRbUx4eFFEY3NSSnFPSGJU?=
 =?utf-8?B?ZE9EMndiVkVPeEd0UEozRmhxbUREQkVUdnhkd2NYMHdGbVVmUjR5SmxJQjRC?=
 =?utf-8?B?dGdtMWRGTjc1UjVMczd0dnFwK2RSWUlUVnVyU281R2xHU0EzdThOYklOcjdk?=
 =?utf-8?B?aHI0dXZ5Mi9jVkRrR21ja1g4RlUyTkc4QnNyWjBkL0pYdFQ5UXcvL01EblFP?=
 =?utf-8?B?Zk1Pd1hSVlhUSFpxUlpZWFNIRVc3bGErdlprTjBNQ2IxcmJ1ZUVYVlZJZTIr?=
 =?utf-8?Q?Vyp9J3Jl1weFxX1l9OW+7tyyW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3c6786-8d35-4067-0dfb-08dbcffc65af
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 17:05:14.9925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVOkgAKeKTkWlcKfXao/IeyWQotUn+1FTKZtORSCJWzLtN1O/ttzZ4FaAjaJkAT72bkhxRftmNMx/4o8OW0KGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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



On 10/18/2023 9:37 PM, Christian König wrote:
> Am 18.10.23 um 17:47 schrieb Mario Limonciello:
>> On 10/18/2023 08:40, Christian König wrote:
>>>
>>>
>>> Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>>>>
>>>> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>>>>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>>>>
>>>>>> In order to provide GPU inputs to TA for the Smart PC solution
>>>>>> to work, we
>>>>>> need to have interface between the PMF driver and the AMDGPU
>>>>>> driver.
>>>>>>
>>>>>> Add the initial code path for get interface from AMDGPU.
>>>>>>
>>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138
>>>>>> ++++++++++++++++++++++++
>>>>>>   drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>>>>   drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>>>>   drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>>>>   include/linux/amd-pmf-io.h              |  35 ++++++
>>>>>>   9 files changed, 220 insertions(+)
>>>>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>   create mode 100644 include/linux/amd-pmf-io.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>> index 384b798a9bad..7fafccefbd7a 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>>   amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>>>>> +
>>>>>>   # add asic specific block
>>>>>>   amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>>>>       dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> @@ -50,6 +50,7 @@
>>>>>>   #include <linux/hashtable.h>
>>>>>>   #include <linux/dma-fence.h>
>>>>>>   #include <linux/pci.h>
>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>   #include <drm/ttm/ttm_bo.h>
>>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..ac981848df50
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> @@ -0,0 +1,138 @@
>>>>>> +/*
>>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>>>> + *
>>>>>> + * Permission is hereby granted, free of charge, to any person
>>>>>> obtaining a
>>>>>> + * copy of this software and associated documentation files
>>>>>> (the "Software"),
>>>>>> + * to deal in the Software without restriction, including
>>>>>> without limitation
>>>>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>>>>> sublicense,
>>>>>> + * and/or sell copies of the Software, and to permit persons to
>>>>>> whom the
>>>>>> + * Software is furnished to do so, subject to the following
>>>>>> conditions:
>>>>>> + *
>>>>>> + * The above copyright notice and this permission notice shall
>>>>>> be included in
>>>>>> + * all copies or substantial portions of the Software.
>>>>>> + *
>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>>>> KIND, EXPRESS OR
>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>>> MERCHANTABILITY,
>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>>>>>> EVENT SHALL
>>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY
>>>>>> CLAIM, DAMAGES OR
>>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>>>> OTHERWISE,
>>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
>>>>>> THE USE OR
>>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> This is MIT, right? Add the required SPDX-License-Identifier line
>>>>> for it
>>>>> at the top of the file, thank you.
>>>>>
>>>> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
>>>> text. So, have retained it to maintain uniformity.
>>>
>>> Please add the SPDX License Identifier for any file you add.

OK. I thought to keep it same like the other files. I will change this
to SPDX in the next revision.

>>>
>>> Apart from that the whole approach of attaching this directly to
>>> amdgpu looks extremely questionable to me.
>>>
>>
>> What's the long term outlook for things that are needed directly
>> from amdgpu?  Is there going to be more besides the backlight and
>> the display count/type?
> 
> Yeah, that goes into the same direction as my concern.

PMF is an APU only feature and will need inputs from multiple
subsystems (in this case its GPU) to send changing system information
to PMF TA (Trusted Application, running on ASP/PSP) as input.

Its not only about the display count/type and backlight, there are
many others things in pipe like the GPU engine running time,
utilization percentage etc, that guide the TA to make better decisions.

This series is only targeted to build the initial plubming with the
subsystems inside the kernel and later keep adding changes to get more
information from other subsystems.

that is the reason you see that, this patch proposes amd-pmf-io.h as
the interface to talk to other subsystems. For the initial path, I
have opted to get information from SFH and GPU drivers. But this is
meant to grow in future.

> 
>>
>> At least for the display count I suppose one way that it could be
>> "decoupled" from amdgpu is to use drm_for_each_connector_iter to
>> iterate all the connectors and then count the connected ones.
> 
> And what if the number of connected displays change? How is amdgpu
> supposed to signal events like that?

PMF driver polls for the information based on a configurable sampling
frequency.

you can look at amd_pmf_get_gpu_info(), that gets called from
amd_pmf_populate_ta_inputs() in spc.c in this proposed series.

Thanks,
Shyam

> 
> This whole solution doesn't looks well thought through.
> 
> Regards,
> Christian.
> 
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>> + *
>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> + *
>>>>>> + */
>>>>> Remove the extra empty line at the end of the comment.
>>>>>
>>>> I just took the standard template for all the gpu files. Is that
>>>> OK to
>>>> retain the blank line?
>>>>
>>>> If not, I can remove it in the next version.
>>>>
>>>> Rest all remarks I will address.
>>>>
>>>> Thanks,
>>>> Shyam
>>>>
>>>>>> +
>>>>>> +#include <linux/backlight.h>
>>>>>> +#include "amdgpu.h"
>>>>>> +
>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>> +{
>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>> +    struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>> +    struct drm_connector_list_iter iter;
>>>>>> +    struct drm_connector *connector;
>>>>>> +    int i = 0;
>>>>>> +
>>>>>> +    /* Reset the count to zero */
>>>>>> +    pmf->display_count = 0;
>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>> +        return -ENODEV;
>>>>>> +    }
>>>>>> +
>>>>>> +    mutex_lock(&mode_config->mutex);
>>>>>> +    drm_connector_list_iter_begin(drm_dev, &iter);
>>>>>> +    drm_for_each_connector_iter(connector, &iter) {
>>>>>> +        if (connector->status == connector_status_connected)
>>>>>> +            pmf->display_count++;
>>>>>> +        if (connector->status != pmf->con_status[i])
>>>>>> +            pmf->con_status[i] = connector->status;
>>>>>> +        if (connector->connector_type != pmf->connector_type[i])
>>>>>> +            pmf->connector_type[i] = connector->connector_type;
>>>>>> +
>>>>>> +        i++;
>>>>>> +        if (i >= MAX_SUPPORTED)
>>>>>> +            break;
>>>>>> +    }
>>>>>> +    drm_connector_list_iter_end(&iter);
>>>>>> +    mutex_unlock(&mode_config->mutex);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>>> +
>>>>>> +static int amd_pmf_gpu_get_cur_state(struct
>>>>>> thermal_cooling_device *cooling_dev,
>>>>>> +                     unsigned long *state)
>>>>>> +{
>>>>>> +    struct backlight_device *bd;
>>>>>> +
>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!bd)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    *state = backlight_get_brightness(bd);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int amd_pmf_gpu_get_max_state(struct
>>>>>> thermal_cooling_device *cooling_dev,
>>>>>> +                     unsigned long *state)
>>>>>> +{
>>>>>> +    struct backlight_device *bd;
>>>>>> +
>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!bd)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    if (backlight_is_blank(bd))
>>>>>> +        *state = 0;
>>>>>> +    else
>>>>>> +        *state = bd->props.max_brightness;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>>> +};
>>>>>> +
>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>>>>> +{
>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>> +
>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>> +        return -ENODEV;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!pmf->raw_bd)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    pmf->cooling_dev =
>>>>>> thermal_cooling_device_register("pmf_gpu_bd",
>>>>>> +                               pmf, &bd_cooling_ops);
>>>>>> +    if (IS_ERR(pmf->cooling_dev))
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>>>>> +
>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>>>>> +{
>>>>>> + thermal_cooling_device_unregister(pmf->cooling_dev);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>> index f246252bddd8..7f430de7af44 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>>>>       depends on AMD_NB
>>>>>>       select ACPI_PLATFORM_PROFILE
>>>>>>       depends on TEE && AMDTEE
>>>>>> +    depends on DRM_AMDGPU
>>>>>>       help
>>>>>>         This driver provides support for the AMD Platform
>>>>>> Management Framework.
>>>>>>         The goal is to enhance end user experience by making AMD
>>>>>> PCs smarter,
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>>>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>>>> index 4b8156033fa6..c59ba527ff49 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct
>>>>>> platform_device *pdev)
>>>>>>       }
>>>>>>       dev->cpu_id = rdev->device;
>>>>>> +    dev->root = rdev;
>>>>>>       err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>>>>       if (err) {
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> index 8712299ad52b..615cd3a31986 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> @@ -13,6 +13,7 @@
>>>>>>   #include <linux/acpi.h>
>>>>>>   #include <linux/platform_profile.h>
>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>   #define POLICY_BUF_MAX_SZ        0x4b000
>>>>>>   #define POLICY_SIGN_COOKIE        0x31535024
>>>>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>>>>       void *shbuf;
>>>>>>       struct delayed_work pb_work;
>>>>>>       struct pmf_action_table *prev_data;
>>>>>> +    struct amd_gpu_pmf_data gfx_data;
>>>>>>       u64 policy_addr;
>>>>>>       void *policy_base;
>>>>>>       bool smart_pc_enabled;
>>>>>> +    struct pci_dev *root;
>>>>>>   };
>>>>>>   struct apmf_sps_prop_granular {
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c
>>>>>> b/drivers/platform/x86/amd/pmf/spc.c
>>>>>> index 512e0c66efdc..cf4962ef97c2 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct
>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>>>>>       dev_dbg(dev->dev, "Max C0 Residency : %u\n",
>>>>>> in->ev_info.max_c0residency);
>>>>>>       dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>>>>>       dev_dbg(dev->dev, "Connected Display Count : %u\n",
>>>>>> in->ev_info.monitor_count);
>>>>>> +    dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>>>>> + drm_get_connector_type_name(in->ev_info.display_type));
>>>>>> +    dev_dbg(dev->dev, "Primary Display State : %s\n",
>>>>>> in->ev_info.display_state ?
>>>>>> +            "Connected" : "disconnected/unknown");
>>>>>>       dev_dbg(dev->dev, "LID State : %s\n",
>>>>>> in->ev_info.lid_state ? "Close" : "Open");
>>>>>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>>>>   }
>>>>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct
>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>>       return 0;
>>>>>>   }
>>>>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev,
>>>>>> struct ta_pmf_enact_table *in)
>>>>>> +{
>>>>>> +    amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>>>>>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>>>>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
>>>>>> +}
>>>>>> +
>>>>>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev,
>>>>>> struct ta_pmf_enact_table *in)
>>>>>>   {
>>>>>>       /* TA side lid open is 1 and close is 0, hence the ! here */
>>>>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct
>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>>>>       amd_pmf_get_smu_info(dev, in);
>>>>>>       amd_pmf_get_battery_info(dev, in);
>>>>>>       amd_pmf_get_slider_info(dev, in);
>>>>>> +    amd_pmf_get_gpu_info(dev, in);
>>>>>>   }
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> index 2f5fb8623c20..956e66b78605 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> @@ -9,6 +9,7 @@
>>>>>>    */
>>>>>>   #include <linux/debugfs.h>
>>>>>> +#include <linux/pci.h>
>>>>>>   #include <linux/tee_drv.h>
>>>>>>   #include <linux/uuid.h>
>>>>>>   #include "pmf.h"
>>>>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct
>>>>>> amd_pmf_dev *dev)
>>>>>>       return amd_pmf_start_policy_engine(dev);
>>>>>>   }
>>>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void
>>>>>> *data)
>>>>>> +{
>>>>>> +    struct amd_pmf_dev *dev = data;
>>>>>> +
>>>>>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>>>> +        /* Found the amdgpu handle from the pci root after
>>>>>> walking through the pci bus */
>>>>> If you insist on having this comment, make it a function comment
>>>>> instead
>>>>> (with appropriate modifications into the content of it) but I
>>>>> personally
>>>>> don't find it that useful so it could be just dropped as well, IMO.
>>>>>
>>>>>> +        dev->gfx_data.gpu_dev = pdev;
>>>>>> +        return 1; /* Stop walking */
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0; /* Continue walking */
>>>>>> +}
>>>>>> +
>>>>>>   static int amd_pmf_amdtee_ta_match(struct
>>>>>> tee_ioctl_version_data *ver, const void *data)
>>>>>>   {
>>>>>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct
>>>>>> amd_pmf_dev *dev)
>>>>>>       INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>>>       amd_pmf_set_dram_addr(dev);
>>>>>>       amd_pmf_get_bios_buffer(dev);
>>>>>> +
>>>>>> +    /* Get amdgpu handle */
>>>>> Useless comment.
>>>>>
>>>>>> + pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>>>> +    if (!dev->gfx_data.gpu_dev)
>>>>>> +        dev_err(dev->dev, "GPU handle not found!\n");
>>>>>> +
>>>>>> +    if (!amd_pmf_gpu_init(&dev->gfx_data))
>>>>>> +        dev->gfx_data.gpu_dev_en = true;
>>>>>> +
>>>>>>       dev->prev_data = kzalloc(sizeof(*dev->prev_data),
>>>>>> GFP_KERNEL);
>>>>>>       if (!dev->prev_data)
>>>>>>           return -ENOMEM;
>>>>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct
>>>>>> amd_pmf_dev *dev)
>>>>>>       kfree(dev->prev_data);
>>>>>>       kfree(dev->policy_buf);
>>>>>>       cancel_delayed_work_sync(&dev->pb_work);
>>>>>> +    if (dev->gfx_data.gpu_dev_en)
>>>>>> +        amd_pmf_gpu_deinit(&dev->gfx_data);
>>>>>> +    pci_dev_put(dev->gfx_data.gpu_dev);
>>>>>>       amd_pmf_tee_deinit(dev);
>>>>>>   }
>>>>>> diff --git a/include/linux/amd-pmf-io.h
>>>>>> b/include/linux/amd-pmf-io.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..5f79e66a41b3
>>>>>> --- /dev/null
>>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>>> @@ -0,0 +1,35 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +/*
>>>>>> + * AMD Platform Management Framework Interface
>>>>>> + *
>>>>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>>>>> + * All Rights Reserved.
>>>>>> + *
>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef AMD_PMF_IO_H
>>>>>> +#define AMD_PMF_IO_H
>>>>>> +
>>>>>> +#include <acpi/video.h>
>>>>>> +#include <drm/drm_connector.h>
>>>>>> +#include <linux/backlight.h>
>>>>>> +#include <linux/thermal.h>
>>>>>> +
>>>>>> +#define MAX_SUPPORTED 4
>>>>>> +
>>>>>> +/* amdgpu */
>>>>> Document the structure properly with kerneldoc instead of an
>>>>> unhelpful
>>>>> comment like above :-). Please also check if you add any other
>>>>> structs
>>>>> into kernel-wide headers that you didn't document yet. Or fields
>>>>> into
>>>>> existing structs.
>>>>>
>>>>>> +struct amd_gpu_pmf_data {
>>>>>> +    struct pci_dev *gpu_dev;
>>>>>> +    struct backlight_device *raw_bd;
>>>>>> +    struct thermal_cooling_device *cooling_dev;
>>>>>> +    enum drm_connector_status con_status[MAX_SUPPORTED];
>>>>>> +    int display_count;
>>>>>> +    int connector_type[MAX_SUPPORTED];
>>>>>> +    bool gpu_dev_en;
>>>>>> +};
>>>>>> +
>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>>>>> +#endif
>>>>>>
>>>
>>
> 
