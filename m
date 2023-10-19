Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1387CF368
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871210E4A6;
	Thu, 19 Oct 2023 09:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54BA10E49F;
 Thu, 19 Oct 2023 09:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMV6nF/ckwaInvPW9p5D7+Y5AlPGlHhVr9pW4d2c9zubw/s1cHRG6h4Mp68pMMthbyqb2jcyr3VBPO5CH8TugFv5RRhZu5GMJ8RRgIK3dfGvITbjsbewR4hSruUCgK+eWVQ15t1qwkZVyI6jqHQoX9NEHCYIjIybnKGITEePnxb6NS0oqVIRPd65RqFGSg5qeypG72/PKvDjTehpp764OJaKjk2LbuVo5QYGj0/5oCU9HvgMhz5ZKqQiHpL6bDaQyQMzRN7xKyrH1TBiA1RMYW6LzePCJynVPOEYyjGF3KoPkmwfifkbWJYW5vHEQzJS6qgIAbldsj/fafBVuAs+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL1D6eYfi4KlouykEU1ySG3BSuyh9ZX/cOCVtkUAjsM=;
 b=MWjo23eex8DFaXJT+rrCItLUAax6mf6+x4BHf0uwS8BEyVimF6hxqPSCI4i80eMu7riHe0YAwucL1X5eysx7WJ/3+3p5pQt+Op4MbgzPAGzbfytdbVbjZabG6C3i5nV9BZxS63WxmY80HYMLrToBw6g1EV+aFhHXKpkh7YM4ipgiWZGeh2Ypeo/SJe3Q+8pORow9yvagLiKoJByqAUhyqazH/zmmg8OOXOlqPp2dlOxHX12FBK0WAHZx58giPehFvu9wjRhntT/i8YCFz1TaiqH99Kic7Rwy52fg82A1RxLzG9aXtoivg69TYPZpkTI/V15JJXWds4OgeJl5oQPCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL1D6eYfi4KlouykEU1ySG3BSuyh9ZX/cOCVtkUAjsM=;
 b=c8p1zc9oEOIxkFgZ+Ew8FhGS3qhd4nr6sboZSPKNWETz27+FynypRqdbVYlL5oP++yHbVpydUToZ3CkkUlEcy0jzsNscsHD4Gp3jnABvJFpskzpDPg+OdbTLInWU6lS4E0a2hiRhaIspoplZaEMPbBQ34dZBwSOqz70JINdTg1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 19 Oct
 2023 09:01:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Thu, 19 Oct 2023
 09:01:15 +0000
Message-ID: <0c816746-7f52-442f-aea5-0d8c713aa2ce@amd.com>
Date: Thu, 19 Oct 2023 11:01:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
 <c8ed2e1e-77b9-459e-b81a-e95db4d22a9b@amd.com>
 <80fcdcb2-1a22-4002-9bfd-d6cf15d5a57b@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <80fcdcb2-1a22-4002-9bfd-d6cf15d5a57b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: f440fc3a-5b44-4672-d9fd-08dbd081f329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2jLAvDGD+EAGSL4YGqlZjIjf31dFSQD53MfsQTnkqu+ON7AsM51rMWAfRddJPLWS5a9qD3WgTXCQowcm/kZF9TgNx+KOxKyRcENtyS8E3tadfG7fS+gFPG3yjqKCpT3vc1hUdeqOAfFcGYwtk9MYc6jQezBSlR16WS3N6PF2NVgkFRKgzkIMlyAydq1kebk5bk26c16kAPEo64QsCu6fOV4CHYumG3cO/bOI1dPapVFnsTT5S0T2YcYXucqObm4AJb9lw7YiMq0CCWFPXWLDUkmpMwbniikx1usJZ2vt4hzvWzPwg8bbfKWO1eVuSg+iWyLOSG25jwS2GHNDIg296lr1YSJfQIyoBRZTC0aKE8ULxqnNw06U15aedVdbQdqpR7ua1fHhLys5go0ytipctCXkgADX/1ZzNSpeHXopgj2bv/ceEjm+CbsZvU5YVHSAx++5bxdeduiZ5o0YCsT0vKNCZviGbxQuhX9T8f74IQ9GfQGjFhySzL4/HJNEoic8k9+xJFcLKj5a6uEmsZXShXKWbZADSjDoH+su/inbjX1kb+RwtSQmihc4xu36kqcC3brQlGLNDJt6LamCO2fyddNHYdh3fV0rCRjsYgbBWXsVQZk+S33LuqflT4A8hgcy1OcNz5+mPDQYyTjI41ywLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66476007)(53546011)(45080400002)(66946007)(66556008)(110136005)(478600001)(966005)(6666004)(6486002)(26005)(7416002)(30864003)(66574015)(316002)(6506007)(4326008)(36756003)(38100700002)(8936002)(2906002)(5660300002)(86362001)(8676002)(41300700001)(2616005)(31696002)(6512007)(83380400001)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1JQaE9Mek9tWGZubHZFVkRXaEZWS1hvRVg5QVY3cUZJTWN4Y2RrZnBWZ0xV?=
 =?utf-8?B?YnFhRmpnZFFUaVFCRmZlR29jYzlUaENndjdTU0w4NkdVNFZoam1Sd0wyTjBo?=
 =?utf-8?B?dWFqQnFVWXkrQkk0c3FzeFozdHV0UmgwNGVKQ0pOU25JSEVjQWpSNStqTWky?=
 =?utf-8?B?L3AzWW5jck96endIcXVPSjNleVlWeTZuUXRoNS9Rdjl3bXBFL1UvN1hsR0Ev?=
 =?utf-8?B?eEVEMjJZc0U4VVpYUTJtUzVCcUlJYS9VS0FIVGJxYXVVaTlGNU9kUml0SC9G?=
 =?utf-8?B?eWw0YWEwckRIOUdtVkMydUFGdG8zODNTdnFWa3pVV1YzM2x6enRNS1lTT09o?=
 =?utf-8?B?NzdiV3QwbHBMWFljQ3NwWnE5STgxVTlYY1lucjhRaW0vMURQZnArcUMrRnBw?=
 =?utf-8?B?SUlmb0Q3SzBreXN1b2FOQ2x1TWlYRkJvY3hobnFKclh0ZHE4ZVExUDhndS92?=
 =?utf-8?B?VTRYZzFrL3dhMWlDSGh1WGxNVmZ0V1FDTE0wOWJ6VWxhWXFXTWorNmZ0SDk2?=
 =?utf-8?B?b1VvbEhQNXJlM2NqZXhZbFRlTXVFcUEzanFBS1ZVUkpwdDRJUTBKWUEwWXNK?=
 =?utf-8?B?ZDQvY0lHYkNWTFlKWG92a0hybXJCaTE5OUFuNEIwMkZxUnA0VjN6cFNQM04x?=
 =?utf-8?B?Sm9WYXR0UTFQQ1U4YWl3MW9qTGlZcENIK3Z3WXNmV1IvbVU1MUJPeCtwc0Q4?=
 =?utf-8?B?bXdyNkQrZGRqRFJQcVZxMEh5V0NRcXdWZlFOWmFxS0ZCRTFzK21heW8xeVJL?=
 =?utf-8?B?YmhPS0tGdW5TaFhkTllMbnBNRktIcWdCRGJvaWJzRU9jM2QySzZFbW9rNGlK?=
 =?utf-8?B?R0dhNEtnMFlTa2Q1K012Ym5DZmpXakNjVEE3bWRlZFc1QVZ6ZXpIdjFBc3Fn?=
 =?utf-8?B?cXdOVEd1elJ6R1lqYm4rb1UxUmhuaGU4RXhZWkFhR0JpZkdRWmNjOW1kU2I4?=
 =?utf-8?B?d1E0bFl6RGU0bnAwM3diVU9kZnhieVBDbE5kRUYvcEU3LzJNYmk1VXU4MDhH?=
 =?utf-8?B?U0NSQ3BrTEFLaVB6QXFicTVFUkRsaWJoOENuMm5WY2Z4Q2VPYnVBci9WZm5P?=
 =?utf-8?B?d2VuZXRTeXo2cFJtK0lRT2JjWGovNTZheXh3bVEvRzlhNFQ3NmlqQ2hEMnVY?=
 =?utf-8?B?MVhZb1dQbmtyNjZ6NnEvaTRheGlxQUxOTURWYTFGMDdqMWo2VGJBYzhTTzd4?=
 =?utf-8?B?STFtcTJuMDVsMGJlOE5ocEtZVW00aFQ3VTRxTXB0dDY4UlZ5TmRKK1Q4NkpD?=
 =?utf-8?B?YmtsTXlGSmRzMGpaUkZPSE54bE5GZytKTDh2N1ZpalFhVXVVNUdBQUx0K3Nm?=
 =?utf-8?B?T2xaUmN4QzlCYjVvYW9yTTBIVy9jNURqSU1NMXZKMElaVWJpRHhZeXNOSTNx?=
 =?utf-8?B?dnNsOVN6ZnJYZ2RsNFJ4QTRqOFdxM0JtUzRlZ2lSZkFKY1ROOXVtV01FYitO?=
 =?utf-8?B?SVM0aGd5bkppM0hRdlViSHFzeEVLTkdtYlhHMnVuOXZNQXNpbmJ1RndjK2R6?=
 =?utf-8?B?VHdoOE5hS01Eai9nb3pCY01lSlRkb1AzRVI2djNFeVI5b0lFd2xKRjIzdVEy?=
 =?utf-8?B?YzFCOGk1Mk0vQzhTd1dZNEM4T0puSmtKTTNwNnh1cmxQTHRpK3FpaHMydTVF?=
 =?utf-8?B?NSswMDhGMHk0RVpxc21CbjhqeHpFY2dNbGRyZjVZR1l5SG9icitLL3JLdXQ5?=
 =?utf-8?B?L3pZRGlJWDRFUXlqUklBL0FuMzVDa2ljSHZ4WEZzWmJCNFk2MzZaWnpSd3NC?=
 =?utf-8?B?MnVpcmduUW1vZnBlRk9iZlJocnkvQlk1WmFSNWRlamFqVW5XZWl4QnNDMXl5?=
 =?utf-8?B?d2VOUnJPZ05YcUEwRWdNNE42eDhsTkdiY0ZvSDB0NWdiUWdHaXVyclZRRzh1?=
 =?utf-8?B?NVc4cEpVVVc5eFZGN0lJQkhWMjZwS3N0dTZtelRlQVpZK3JWa0o1cUk5Vm8w?=
 =?utf-8?B?VHZVVml3bmtFdmREOW42bmsvd0pXZnZuK2VkM2FUS2lLZitGRHJPa0RYTWlr?=
 =?utf-8?B?ZGlwMnZsN3k5bmNuRHhUazJlbUpTQ0lwQy9lS1hyckpIRWd1dnE1ZEIyTXJt?=
 =?utf-8?B?dFRuNUFHaWJwREdXTEZjRWtjVUdFMnZDc04zbWNIOFk1UlJ5MXJGdmZ0cnU2?=
 =?utf-8?Q?7g7A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f440fc3a-5b44-4672-d9fd-08dbd081f329
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:01:15.4066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr6UlnTBQJVwhIW4mKTYDPBYB2rherOH4wVDgVIKyOFsqNrNF9bG/NdcWLAoMxEf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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

Am 18.10.23 um 19:05 schrieb Shyam Sundar S K:
>
> On 10/18/2023 9:37 PM, Christian König wrote:
>> Am 18.10.23 um 17:47 schrieb Mario Limonciello:
>>> On 10/18/2023 08:40, Christian König wrote:
>>>>
>>>> Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>>>>> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>>>>>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>>>>>
>>>>>>> In order to provide GPU inputs to TA for the Smart PC solution
>>>>>>> to work, we
>>>>>>> need to have interface between the PMF driver and the AMDGPU
>>>>>>> driver.
>>>>>>>
>>>>>>> Add the initial code path for get interface from AMDGPU.
>>>>>>>
>>>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138
>>>>>>> ++++++++++++++++++++++++
>>>>>>>    drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>>>>>    drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>>>>>    drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>>>>>    drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>>>>>    drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>>>>>    include/linux/amd-pmf-io.h              |  35 ++++++
>>>>>>>    9 files changed, 220 insertions(+)
>>>>>>>    create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>>    create mode 100644 include/linux/amd-pmf-io.h
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> index 384b798a9bad..7fafccefbd7a 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>>>    amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>>>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>>>>>> +
>>>>>>>    # add asic specific block
>>>>>>>    amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>>>>>        dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> @@ -50,6 +50,7 @@
>>>>>>>    #include <linux/hashtable.h>
>>>>>>>    #include <linux/dma-fence.h>
>>>>>>>    #include <linux/pci.h>
>>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>>    #include <drm/ttm/ttm_bo.h>
>>>>>>>    #include <drm/ttm/ttm_placement.h>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..ac981848df50
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>>> @@ -0,0 +1,138 @@
>>>>>>> +/*
>>>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
>>>>>>> + *
>>>>>>> + * Permission is hereby granted, free of charge, to any person
>>>>>>> obtaining a
>>>>>>> + * copy of this software and associated documentation files
>>>>>>> (the "Software"),
>>>>>>> + * to deal in the Software without restriction, including
>>>>>>> without limitation
>>>>>>> + * the rights to use, copy, modify, merge, publish, distribute,
>>>>>>> sublicense,
>>>>>>> + * and/or sell copies of the Software, and to permit persons to
>>>>>>> whom the
>>>>>>> + * Software is furnished to do so, subject to the following
>>>>>>> conditions:
>>>>>>> + *
>>>>>>> + * The above copyright notice and this permission notice shall
>>>>>>> be included in
>>>>>>> + * all copies or substantial portions of the Software.
>>>>>>> + *
>>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>>>>> KIND, EXPRESS OR
>>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>>>> MERCHANTABILITY,
>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>>>>>>> EVENT SHALL
>>>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY
>>>>>>> CLAIM, DAMAGES OR
>>>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>>>>> OTHERWISE,
>>>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
>>>>>>> THE USE OR
>>>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>>> This is MIT, right? Add the required SPDX-License-Identifier line
>>>>>> for it
>>>>>> at the top of the file, thank you.
>>>>>>
>>>>> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
>>>>> text. So, have retained it to maintain uniformity.
>>>> Please add the SPDX License Identifier for any file you add.
> OK. I thought to keep it same like the other files. I will change this
> to SPDX in the next revision.
>
>>>> Apart from that the whole approach of attaching this directly to
>>>> amdgpu looks extremely questionable to me.
>>>>
>>> What's the long term outlook for things that are needed directly
>>> from amdgpu?  Is there going to be more besides the backlight and
>>> the display count/type?
>> Yeah, that goes into the same direction as my concern.
> PMF is an APU only feature and will need inputs from multiple
> subsystems (in this case its GPU) to send changing system information
> to PMF TA (Trusted Application, running on ASP/PSP) as input.
>
> Its not only about the display count/type and backlight, there are
> many others things in pipe like the GPU engine running time,
> utilization percentage etc, that guide the TA to make better decisions.
>
> This series is only targeted to build the initial plubming with the
> subsystems inside the kernel and later keep adding changes to get more
> information from other subsystems.

Yeah, and that's what I strongly disagree on. Don't come up with such an 
approach without consulting with upstream maintainers first.

What you propose here is a system wide framework for improving power 
management, that's fine. The problem is that we already have something 
very similar in the thermal framework.

See for example the Intel solution here 
https://docs.kernel.org/driver-api/thermal/intel_dptf.html

 From the general design the job of the amdgpu driver is to drive the 
display hardware. So this should in general be completely decoupled from 
this driver. As Mario suggested as well you can iterate over the 
connected displays independently. Same thing for the backlight.

When it comes to hardware state like GPU engine utilization then we 
don't have that inside amdgpu either.

Regards,
Christian.

>
> that is the reason you see that, this patch proposes amd-pmf-io.h as
> the interface to talk to other subsystems. For the initial path, I
> have opted to get information from SFH and GPU drivers. But this is
> meant to grow in future.
>
>>> At least for the display count I suppose one way that it could be
>>> "decoupled" from amdgpu is to use drm_for_each_connector_iter to
>>> iterate all the connectors and then count the connected ones.
>> And what if the number of connected displays change? How is amdgpu
>> supposed to signal events like that?
> PMF driver polls for the information based on a configurable sampling
> frequency.
>
> you can look at amd_pmf_get_gpu_info(), that gets called from
> amd_pmf_populate_ta_inputs() in spc.c in this proposed series.
>
> Thanks,
> Shyam
>
>> This whole solution doesn't looks well thought through.
>>
>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>>> + *
>>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>> + *
>>>>>>> + */
>>>>>> Remove the extra empty line at the end of the comment.
>>>>>>
>>>>> I just took the standard template for all the gpu files. Is that
>>>>> OK to
>>>>> retain the blank line?
>>>>>
>>>>> If not, I can remove it in the next version.
>>>>>
>>>>> Rest all remarks I will address.
>>>>>
>>>>> Thanks,
>>>>> Shyam
>>>>>
>>>>>>> +
>>>>>>> +#include <linux/backlight.h>
>>>>>>> +#include "amdgpu.h"
>>>>>>> +
>>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>>> +{
>>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>>> +    struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>> +    struct drm_connector_list_iter iter;
>>>>>>> +    struct drm_connector *connector;
>>>>>>> +    int i = 0;
>>>>>>> +
>>>>>>> +    /* Reset the count to zero */
>>>>>>> +    pmf->display_count = 0;
>>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>>> +        return -ENODEV;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    mutex_lock(&mode_config->mutex);
>>>>>>> +    drm_connector_list_iter_begin(drm_dev, &iter);
>>>>>>> +    drm_for_each_connector_iter(connector, &iter) {
>>>>>>> +        if (connector->status == connector_status_connected)
>>>>>>> +            pmf->display_count++;
>>>>>>> +        if (connector->status != pmf->con_status[i])
>>>>>>> +            pmf->con_status[i] = connector->status;
>>>>>>> +        if (connector->connector_type != pmf->connector_type[i])
>>>>>>> +            pmf->connector_type[i] = connector->connector_type;
>>>>>>> +
>>>>>>> +        i++;
>>>>>>> +        if (i >= MAX_SUPPORTED)
>>>>>>> +            break;
>>>>>>> +    }
>>>>>>> +    drm_connector_list_iter_end(&iter);
>>>>>>> +    mutex_unlock(&mode_config->mutex);
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>>>> +
>>>>>>> +static int amd_pmf_gpu_get_cur_state(struct
>>>>>>> thermal_cooling_device *cooling_dev,
>>>>>>> +                     unsigned long *state)
>>>>>>> +{
>>>>>>> +    struct backlight_device *bd;
>>>>>>> +
>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>> +    if (!bd)
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    *state = backlight_get_brightness(bd);
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int amd_pmf_gpu_get_max_state(struct
>>>>>>> thermal_cooling_device *cooling_dev,
>>>>>>> +                     unsigned long *state)
>>>>>>> +{
>>>>>>> +    struct backlight_device *bd;
>>>>>>> +
>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>> +    if (!bd)
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    if (backlight_is_blank(bd))
>>>>>>> +        *state = 0;
>>>>>>> +    else
>>>>>>> +        *state = bd->props.max_brightness;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>>>> +};
>>>>>>> +
>>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>>>>>> +{
>>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>>> +
>>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>>> +        return -ENODEV;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (!acpi_video_backlight_use_native())
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>>> +    if (!pmf->raw_bd)
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    pmf->cooling_dev =
>>>>>>> thermal_cooling_device_register("pmf_gpu_bd",
>>>>>>> +                               pmf, &bd_cooling_ops);
>>>>>>> +    if (IS_ERR(pmf->cooling_dev))
>>>>>>> +        return -ENODEV;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>>>>>> +
>>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>>>>>> +{
>>>>>>> + thermal_cooling_device_unregister(pmf->cooling_dev);
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>> index f246252bddd8..7f430de7af44 100644
>>>>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>>>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>>>>>        depends on AMD_NB
>>>>>>>        select ACPI_PLATFORM_PROFILE
>>>>>>>        depends on TEE && AMDTEE
>>>>>>> +    depends on DRM_AMDGPU
>>>>>>>        help
>>>>>>>          This driver provides support for the AMD Platform
>>>>>>> Management Framework.
>>>>>>>          The goal is to enhance end user experience by making AMD
>>>>>>> PCs smarter,
>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c
>>>>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>>>>> index 4b8156033fa6..c59ba527ff49 100644
>>>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct
>>>>>>> platform_device *pdev)
>>>>>>>        }
>>>>>>>        dev->cpu_id = rdev->device;
>>>>>>> +    dev->root = rdev;
>>>>>>>        err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>>>>>        if (err) {
>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>> index 8712299ad52b..615cd3a31986 100644
>>>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>    #include <linux/acpi.h>
>>>>>>>    #include <linux/platform_profile.h>
>>>>>>> +#include <linux/amd-pmf-io.h>
>>>>>>>    #define POLICY_BUF_MAX_SZ        0x4b000
>>>>>>>    #define POLICY_SIGN_COOKIE        0x31535024
>>>>>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>>>>>        void *shbuf;
>>>>>>>        struct delayed_work pb_work;
>>>>>>>        struct pmf_action_table *prev_data;
>>>>>>> +    struct amd_gpu_pmf_data gfx_data;
>>>>>>>        u64 policy_addr;
>>>>>>>        void *policy_base;
>>>>>>>        bool smart_pc_enabled;
>>>>>>> +    struct pci_dev *root;
>>>>>>>    };
>>>>>>>    struct apmf_sps_prop_granular {
>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c
>>>>>>> b/drivers/platform/x86/amd/pmf/spc.c
>>>>>>> index 512e0c66efdc..cf4962ef97c2 100644
>>>>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>>>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct
>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>>>>>>        dev_dbg(dev->dev, "Max C0 Residency : %u\n",
>>>>>>> in->ev_info.max_c0residency);
>>>>>>>        dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>>>>>>        dev_dbg(dev->dev, "Connected Display Count : %u\n",
>>>>>>> in->ev_info.monitor_count);
>>>>>>> +    dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>>>>>> + drm_get_connector_type_name(in->ev_info.display_type));
>>>>>>> +    dev_dbg(dev->dev, "Primary Display State : %s\n",
>>>>>>> in->ev_info.display_state ?
>>>>>>> +            "Connected" : "disconnected/unknown");
>>>>>>>        dev_dbg(dev->dev, "LID State : %s\n",
>>>>>>> in->ev_info.lid_state ? "Close" : "Open");
>>>>>>>        dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>>>>>    }
>>>>>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct
>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>>>        return 0;
>>>>>>>    }
>>>>>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev,
>>>>>>> struct ta_pmf_enact_table *in)
>>>>>>> +{
>>>>>>> +    amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>>>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>>>>>>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>>>>>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
>>>>>>> +}
>>>>>>> +
>>>>>>>    void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev,
>>>>>>> struct ta_pmf_enact_table *in)
>>>>>>>    {
>>>>>>>        /* TA side lid open is 1 and close is 0, hence the ! here */
>>>>>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct
>>>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>>>>>        amd_pmf_get_smu_info(dev, in);
>>>>>>>        amd_pmf_get_battery_info(dev, in);
>>>>>>>        amd_pmf_get_slider_info(dev, in);
>>>>>>> +    amd_pmf_get_gpu_info(dev, in);
>>>>>>>    }
>>>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>> index 2f5fb8623c20..956e66b78605 100644
>>>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>>> @@ -9,6 +9,7 @@
>>>>>>>     */
>>>>>>>    #include <linux/debugfs.h>
>>>>>>> +#include <linux/pci.h>
>>>>>>>    #include <linux/tee_drv.h>
>>>>>>>    #include <linux/uuid.h>
>>>>>>>    #include "pmf.h"
>>>>>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct
>>>>>>> amd_pmf_dev *dev)
>>>>>>>        return amd_pmf_start_policy_engine(dev);
>>>>>>>    }
>>>>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void
>>>>>>> *data)
>>>>>>> +{
>>>>>>> +    struct amd_pmf_dev *dev = data;
>>>>>>> +
>>>>>>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>>>>> +        /* Found the amdgpu handle from the pci root after
>>>>>>> walking through the pci bus */
>>>>>> If you insist on having this comment, make it a function comment
>>>>>> instead
>>>>>> (with appropriate modifications into the content of it) but I
>>>>>> personally
>>>>>> don't find it that useful so it could be just dropped as well, IMO.
>>>>>>
>>>>>>> +        dev->gfx_data.gpu_dev = pdev;
>>>>>>> +        return 1; /* Stop walking */
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0; /* Continue walking */
>>>>>>> +}
>>>>>>> +
>>>>>>>    static int amd_pmf_amdtee_ta_match(struct
>>>>>>> tee_ioctl_version_data *ver, const void *data)
>>>>>>>    {
>>>>>>>        return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>>>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct
>>>>>>> amd_pmf_dev *dev)
>>>>>>>        INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>>>>        amd_pmf_set_dram_addr(dev);
>>>>>>>        amd_pmf_get_bios_buffer(dev);
>>>>>>> +
>>>>>>> +    /* Get amdgpu handle */
>>>>>> Useless comment.
>>>>>>
>>>>>>> + pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>>>>> +    if (!dev->gfx_data.gpu_dev)
>>>>>>> +        dev_err(dev->dev, "GPU handle not found!\n");
>>>>>>> +
>>>>>>> +    if (!amd_pmf_gpu_init(&dev->gfx_data))
>>>>>>> +        dev->gfx_data.gpu_dev_en = true;
>>>>>>> +
>>>>>>>        dev->prev_data = kzalloc(sizeof(*dev->prev_data),
>>>>>>> GFP_KERNEL);
>>>>>>>        if (!dev->prev_data)
>>>>>>>            return -ENOMEM;
>>>>>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct
>>>>>>> amd_pmf_dev *dev)
>>>>>>>        kfree(dev->prev_data);
>>>>>>>        kfree(dev->policy_buf);
>>>>>>>        cancel_delayed_work_sync(&dev->pb_work);
>>>>>>> +    if (dev->gfx_data.gpu_dev_en)
>>>>>>> +        amd_pmf_gpu_deinit(&dev->gfx_data);
>>>>>>> +    pci_dev_put(dev->gfx_data.gpu_dev);
>>>>>>>        amd_pmf_tee_deinit(dev);
>>>>>>>    }
>>>>>>> diff --git a/include/linux/amd-pmf-io.h
>>>>>>> b/include/linux/amd-pmf-io.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..5f79e66a41b3
>>>>>>> --- /dev/null
>>>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>>>> @@ -0,0 +1,35 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>> +/*
>>>>>>> + * AMD Platform Management Framework Interface
>>>>>>> + *
>>>>>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>>>>>> + * All Rights Reserved.
>>>>>>> + *
>>>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef AMD_PMF_IO_H
>>>>>>> +#define AMD_PMF_IO_H
>>>>>>> +
>>>>>>> +#include <acpi/video.h>
>>>>>>> +#include <drm/drm_connector.h>
>>>>>>> +#include <linux/backlight.h>
>>>>>>> +#include <linux/thermal.h>
>>>>>>> +
>>>>>>> +#define MAX_SUPPORTED 4
>>>>>>> +
>>>>>>> +/* amdgpu */
>>>>>> Document the structure properly with kerneldoc instead of an
>>>>>> unhelpful
>>>>>> comment like above :-). Please also check if you add any other
>>>>>> structs
>>>>>> into kernel-wide headers that you didn't document yet. Or fields
>>>>>> into
>>>>>> existing structs.
>>>>>>
>>>>>>> +struct amd_gpu_pmf_data {
>>>>>>> +    struct pci_dev *gpu_dev;
>>>>>>> +    struct backlight_device *raw_bd;
>>>>>>> +    struct thermal_cooling_device *cooling_dev;
>>>>>>> +    enum drm_connector_status con_status[MAX_SUPPORTED];
>>>>>>> +    int display_count;
>>>>>>> +    int connector_type[MAX_SUPPORTED];
>>>>>>> +    bool gpu_dev_en;
>>>>>>> +};
>>>>>>> +
>>>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>>>>>> +#endif
>>>>>>>

