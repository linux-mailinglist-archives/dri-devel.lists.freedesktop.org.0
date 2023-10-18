Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F27CE232
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254F910E145;
	Wed, 18 Oct 2023 16:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27AE10E145;
 Wed, 18 Oct 2023 16:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr3jGLt+YwxFCUaRJfVMGvMu99ZrYD7nl+GraiJDsIbo+Lz3mj/6dYYvkP4A5n5dKNNG3OxddrLmHxzj8TVReXfTF15IKDSdYIIJrtGge+tFkNRpeip38QlDSVUijb2j5jEv5jRTOYkVSsECfiRpViAfLlU3zgGBdp8r70sf6MzsyeYV1e2acINlv5vdVyiByMlicYuKPFOXOAXIvebRLeaIkMHzYeoxvNW5iBU5Ltnvj4OF3hMJOxNGBmAlQXdxjeZ6xMr7EurygZpJyhINzkYmffTr9/H35dHQyy+qJucOa8hMe1R7Aa7RTI6mYf4qfGnSTqWxudIwTlG0srcfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7/12FZim+LHm182L0HJqyBt+A/WdnhOpoEqBB516/A=;
 b=YD91wCdk988cpAg6qQgeMYmfOmDFcwN0ednimJtRnd92rLmmVKHs6ksR9glPrKB+dZlQ/QPWtkzzti75Pm7b7+z5vfmP3s1/ezTDm3KFtbGCupLqQYB91EN0ALuYZPYx886FO3+khSh9OQxJyzBKmr8oZabrSy5o+UdKX6eHh2HAxGkD0anAMUx5MRf4Jy2DSRf5rpG/12q4pk9r8aHuNe4Tt0BDZFXVQp5ih0CtD0bm7b/gNdZ/JX3Ykn8zWJY1rRS7iTjoLZ91xUsPmScmj37fNB1KDwHfD+e+Ue+E0UruxTnJaRL32n6FNfmOsWguhdVr8xysBLjUr2j9f9z2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7/12FZim+LHm182L0HJqyBt+A/WdnhOpoEqBB516/A=;
 b=w7PlGRglJvDeNYER6B/BZ8k/shtoHnLO9dqHPsYuMxbJO5DvMSuYpImq9H013EK+oIxqMyl18405vJ1Se/k5UtjJBbH19PjjT8IpbvigQ3FzBX16MHd37994mCmz3muS4tZ655x2Y/8Pgdf8ThV47JbgAoKhWeUI3DQ+mhnVJlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:07:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 16:07:47 +0000
Message-ID: <c8ed2e1e-77b9-459e-b81a-e95db4d22a9b@amd.com>
Date: Wed, 18 Oct 2023 18:07:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb1f9a5-6bbf-41db-2cbe-08dbcff45ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2jM+iX9vsdtE1ESF+/GihYfuaqsY48E2aG4S+7w2popAWor03lrlXZn22en5ezMelWVsHJZ1IcubGIiY5N8VISrzzSCXHd6JEUmY3HPvvMYHQ1NM+NzHO2cxs9j57iGYZeHsPKSJc5BM0eVNijDKZtvT02ZaAxJ8+Za6bjDevzxpoMqSPdvGlEXGqyCxhrU9N2wdDuxVuUqHFO4XTys5IAPEot1s8DLeNl9YPmvscnsrdwAaLbXIz1IaEtlPl3EnFqSGyQLAjA/xlsoamHO136OZhligEXduP67eFiP/nsWjroIGMeoNKedbVaKQVRpQ6znXN1U0CH511qmACfXiHNutus7GL5sUsxWvRMiZKH4bTiP7xNTLFK8NU3hq8HQuUfzASvub1d9eIyFCbOcEsEe628lp81UIjv3XulCP8J1h+9kFhK6QcjAXdtahtNSQenqC/9D7RGaHTFI97/rO7zLMcTaEi+VZwccRbRZZbrFF1pO8Guyy86FfOR4rkJCnmgqOpS7g0ydbACfRAaAHcS0g4OWZFcHkmajMFJLdUMgFqspu8j7hVlWMsNuq0lmwYX7X++SZtZplcurkXDRO4S346CF+yFUKjrcM3l8V/UXZm/f0idAtWhdjuVQvdSI0v4OOFAvL4KFJU4d9ifxAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66574015)(83380400001)(6666004)(6506007)(38100700002)(45080400002)(53546011)(6512007)(2616005)(26005)(6486002)(478600001)(31686004)(316002)(66476007)(66946007)(110136005)(4326008)(8676002)(41300700001)(8936002)(30864003)(2906002)(86362001)(66899024)(31696002)(7416002)(66556008)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNRNEFrclJSd0Z3bUhQWXhPcmtaNi9iQzdyUG5SWFFhNU15a1ZoamhQQ0Ja?=
 =?utf-8?B?ZW9yTndzelRhMmQySUpmV1FtNzh1dnAwbVVoMmpMZmF2QU9hYVVXb0s4S1Ax?=
 =?utf-8?B?UkxSRXRUVFFIOGtEL1ZvbWRLc1B5V2ZzVExFZkRzNEQ3elEwa1U3MjFVVWJz?=
 =?utf-8?B?NFVCRFIrSVJRakh4WklreHIxZmp1cjBpWXlWU0R6MjBjbDJuQm96T01tdlBK?=
 =?utf-8?B?T29TWGFvMEVHVC92L29UZ0F6c3BhQ3luVlBJRnQxNDM1eU9zenFBTmlLemU1?=
 =?utf-8?B?SFBKSmlyS1MxTDlyWWtMSG9oZXVsZzRzV1JBL0c2Q2o5a05FR1o5MWpDazRl?=
 =?utf-8?B?K1VYd1QrYVpDL0lSSVByeFZkbVc4THhEWDBNamdKN3diNTR3clZMcS9wYzgx?=
 =?utf-8?B?YmJzc3dIRFNZdTBISWdySkVKRFFQbUlVdG9QbUJ1dlI2ZWJ5Y2w4K29JVHk2?=
 =?utf-8?B?bkc3NVY4SXcwdmRCTnA1aDNFQktZSGVNQTVHMzlHRGNHYkZJOFRuTm9rNE5i?=
 =?utf-8?B?WkFabHZld29NSkMvYWRPU2tCWDV1cDlvSERPTWorM3RUbTZTZ1dLK2pSS0Fs?=
 =?utf-8?B?K1JWMkNqOGVJQ09JWGU1dXN5UjRBV3NDamM2djlzWkpWYTBqeUpkMUt0d3Z3?=
 =?utf-8?B?UHV6bmQxYjg0UzZGSFg3ajdyYk1GNE9PZmZhUjIyM2ZKeWZIaDZqRS9XNkhv?=
 =?utf-8?B?eVFTSStHWEN1SElQYXlFTWhDNnRVUkl2bWczUy9yNkcvZnpscUhBN2xUU05M?=
 =?utf-8?B?Ny9DQnI0Y0ZyRkZYZ0tpZHdjc1ZSemVCbGJULzFLbXVKR3UrRURtTVlnSU5Z?=
 =?utf-8?B?K1J6YUd2M1hwbjRnd2NoMmxLMGIzZExma3RHdHNZS2gwQ2kxcUdOZUU5eEJy?=
 =?utf-8?B?RHd5TWE0ejg4VFZWYU1WS2dxeUt5UUpIRU9pZVZLa1o3Q0Y5ZzhIMFNpZExu?=
 =?utf-8?B?N2Zmd205cStKMTBDOTNaRWl2aUVob0FRcW5Xazk5TzNpZmVoZ2dhcG92R2Nj?=
 =?utf-8?B?cE9IZ3p5aGlvSWRJRTZKWXR6bHEwK3Z2SWZvSzZZZXM4Q2dIYlA4dnBOenli?=
 =?utf-8?B?NEtDNXoraXB0eWtXQVFZOURYVEtkVTVZWGpxcHAvRW1tSUo3eHZBYkRZbDkr?=
 =?utf-8?B?aW90cU9lQlNYMmhYYkRRWkdZYmwxNDZIVmwxamEySEtQOEkvbGIvTlA2ODhn?=
 =?utf-8?B?QXpHU1pPS3dEY3Bkc2ZudU1RemEvdyt3Zko4VjhhVURSMGxFTXBoazhpUnFB?=
 =?utf-8?B?OGJWWGJhemNqa2RseHBKM2EyRGdnSm9Oc3JyMW0yYUNZY04zMkM3STNDQzdC?=
 =?utf-8?B?RTVwUWFlZUdzY2lsR0hpVEpKWjhCdWFzdnc3VVVBRjdHM0plM0hwQVNyM2Mx?=
 =?utf-8?B?bndNTjFaWHZzN3V0cDQwVGxJbDV0SUtCcjVoYzNVbDd5VDJCdE1hV0ZvdFYy?=
 =?utf-8?B?R1R3U25sNmlyQ2t1RjVxcldsNDVMMnlxU3lML3lxd1Bra3NaRWV4QXBUN0Nl?=
 =?utf-8?B?NEF1aDhzZzl1TlFuNmE1M0wwbXR6OUJMTEVTZi9kMG9iUlYwTWdxeXhvbHFq?=
 =?utf-8?B?Vy8vNXV5U0xra0RwRWVxOXE1TFRyU0RYa09GOVJZVzg3a0lPdmUwOHBvYW9L?=
 =?utf-8?B?OXNLa0pjd3dkMXpZWCs4WjBXTTUxUTE5M1F2c2hlOTNEdXhhalpweHZTUkNx?=
 =?utf-8?B?UzJ0T1Rsd1FtdGxLYnJiaVp1L001NWFYeVAvNVF1bzFvNlJTQnBpZitibElS?=
 =?utf-8?B?bHRMOS9pUmwzVzYrZVVDMlB1R2lTcDVDM0RiZzVZNDBFY0xJNkNnbHhlNVps?=
 =?utf-8?B?NkZqMXFJYW9QU3hwakJHd0hrdTBHb0xEVVBnU2R1eU1VY3l2dVcvanpicndR?=
 =?utf-8?B?N2dyY05ZRHRjNkJUSk9uN0kyelpIUEtxWGlyYmsvRi9wZlV6bHhRNytiTkRI?=
 =?utf-8?B?S2g1OEF1TXRwRHJ0Wi9tTTB4Z1NBVHZCQ1BTekhlanNILy9rcTQ1OW16NjNn?=
 =?utf-8?B?ZU1qejVWNU1SNVZuSDJxVHU1dDZxSHJRcVJJNkwwZmNKYk5zY0ZpbDZBM002?=
 =?utf-8?B?d0pEMUU3MkRnRE8zSlI2aDFxZmp2OW80MkNvRWJmZnRFeFp5RmVlK0RDZ3dw?=
 =?utf-8?Q?TVSZc6hTdAbHyPAzSeDnRGqTY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb1f9a5-6bbf-41db-2cbe-08dbcff45ee1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:07:47.5969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6yx1Ncd9pGsWPDN1BbJ1KMJHLPrhChG6hlkfLpnXHGKrtQkmapuKyBFcdXIyAUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
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

Am 18.10.23 um 17:47 schrieb Mario Limonciello:
> On 10/18/2023 08:40, Christian König wrote:
>>
>>
>> Am 18.10.23 um 11:28 schrieb Shyam Sundar S K:
>>>
>>> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
>>>> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
>>>>
>>>>> In order to provide GPU inputs to TA for the Smart PC solution to 
>>>>> work, we
>>>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>>>
>>>>> Add the initial code path for get interface from AMDGPU.
>>>>>
>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 
>>>>> ++++++++++++++++++++++++
>>>>>   drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>>>>   drivers/platform/x86/amd/pmf/core.c     |   1 +
>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>>>>   drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>>>>   include/linux/amd-pmf-io.h              |  35 ++++++
>>>>>   9 files changed, 220 insertions(+)
>>>>>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>   create mode 100644 include/linux/amd-pmf-io.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile 
>>>>> b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> index 384b798a9bad..7fafccefbd7a 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>   amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>>>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>>>>> +
>>>>>   # add asic specific block
>>>>>   amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>>>>       dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> index a79d53bdbe13..26ffa1b4fe57 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>> @@ -50,6 +50,7 @@
>>>>>   #include <linux/hashtable.h>
>>>>>   #include <linux/dma-fence.h>
>>>>>   #include <linux/pci.h>
>>>>> +#include <linux/amd-pmf-io.h>
>>>>>   #include <drm/ttm/ttm_bo.h>
>>>>>   #include <drm/ttm/ttm_placement.h>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> new file mode 100644
>>>>> index 000000000000..ac981848df50
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>> @@ -0,0 +1,138 @@
>>>>> +/*
>>>>> + * Copyright 2023 Advanced Micro Devices, Inc.
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
>>>> This is MIT, right? Add the required SPDX-License-Identifier line 
>>>> for it
>>>> at the top of the file, thank you.
>>>>
>>> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
>>> text. So, have retained it to maintain uniformity.
>>
>> Please add the SPDX License Identifier for any file you add.
>>
>> Apart from that the whole approach of attaching this directly to 
>> amdgpu looks extremely questionable to me.
>>
>
> What's the long term outlook for things that are needed directly from 
> amdgpu?  Is there going to be more besides the backlight and the 
> display count/type?

Yeah, that goes into the same direction as my concern.

>
> At least for the display count I suppose one way that it could be 
> "decoupled" from amdgpu is to use drm_for_each_connector_iter to 
> iterate all the connectors and then count the connected ones.

And what if the number of connected displays change? How is amdgpu 
supposed to signal events like that?

This whole solution doesn't looks well thought through.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>
>>>>> + *
>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> + *
>>>>> + */
>>>> Remove the extra empty line at the end of the comment.
>>>>
>>> I just took the standard template for all the gpu files. Is that OK to
>>> retain the blank line?
>>>
>>> If not, I can remove it in the next version.
>>>
>>> Rest all remarks I will address.
>>>
>>> Thanks,
>>> Shyam
>>>
>>>>> +
>>>>> +#include <linux/backlight.h>
>>>>> +#include "amdgpu.h"
>>>>> +
>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>> +    struct drm_mode_config *mode_config = &drm_dev->mode_config;
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>> +    struct drm_connector_list_iter iter;
>>>>> +    struct drm_connector *connector;
>>>>> +    int i = 0;
>>>>> +
>>>>> +    /* Reset the count to zero */
>>>>> +    pmf->display_count = 0;
>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    mutex_lock(&mode_config->mutex);
>>>>> +    drm_connector_list_iter_begin(drm_dev, &iter);
>>>>> +    drm_for_each_connector_iter(connector, &iter) {
>>>>> +        if (connector->status == connector_status_connected)
>>>>> +            pmf->display_count++;
>>>>> +        if (connector->status != pmf->con_status[i])
>>>>> +            pmf->con_status[i] = connector->status;
>>>>> +        if (connector->connector_type != pmf->connector_type[i])
>>>>> +            pmf->connector_type[i] = connector->connector_type;
>>>>> +
>>>>> +        i++;
>>>>> +        if (i >= MAX_SUPPORTED)
>>>>> +            break;
>>>>> +    }
>>>>> +    drm_connector_list_iter_end(&iter);
>>>>> +    mutex_unlock(&mode_config->mutex);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>> +
>>>>> +static int amd_pmf_gpu_get_cur_state(struct 
>>>>> thermal_cooling_device *cooling_dev,
>>>>> +                     unsigned long *state)
>>>>> +{
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!acpi_video_backlight_use_native())
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    *state = backlight_get_brightness(bd);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int amd_pmf_gpu_get_max_state(struct 
>>>>> thermal_cooling_device *cooling_dev,
>>>>> +                     unsigned long *state)
>>>>> +{
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!acpi_video_backlight_use_native())
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    if (backlight_is_blank(bd))
>>>>> +        *state = 0;
>>>>> +    else
>>>>> +        *state = bd->props.max_brightness;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>> +};
>>>>> +
>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>> +
>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    if (!acpi_video_backlight_use_native())
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!pmf->raw_bd)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
>>>>> +                               pmf, &bd_cooling_ops);
>>>>> +    if (IS_ERR(pmf->cooling_dev))
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>>>>> +
>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>>>>> +{
>>>>> + thermal_cooling_device_unregister(pmf->cooling_dev);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig 
>>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>>> index f246252bddd8..7f430de7af44 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>>> @@ -10,6 +10,7 @@ config AMD_PMF
>>>>>       depends on AMD_NB
>>>>>       select ACPI_PLATFORM_PROFILE
>>>>>       depends on TEE && AMDTEE
>>>>> +    depends on DRM_AMDGPU
>>>>>       help
>>>>>         This driver provides support for the AMD Platform 
>>>>> Management Framework.
>>>>>         The goal is to enhance end user experience by making AMD 
>>>>> PCs smarter,
>>>>> diff --git a/drivers/platform/x86/amd/pmf/core.c 
>>>>> b/drivers/platform/x86/amd/pmf/core.c
>>>>> index 4b8156033fa6..c59ba527ff49 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>>>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct 
>>>>> platform_device *pdev)
>>>>>       }
>>>>>       dev->cpu_id = rdev->device;
>>>>> +    dev->root = rdev;
>>>>>       err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>>>>       if (err) {
>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h 
>>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> index 8712299ad52b..615cd3a31986 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>> @@ -13,6 +13,7 @@
>>>>>   #include <linux/acpi.h>
>>>>>   #include <linux/platform_profile.h>
>>>>> +#include <linux/amd-pmf-io.h>
>>>>>   #define POLICY_BUF_MAX_SZ        0x4b000
>>>>>   #define POLICY_SIGN_COOKIE        0x31535024
>>>>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>>>>       void *shbuf;
>>>>>       struct delayed_work pb_work;
>>>>>       struct pmf_action_table *prev_data;
>>>>> +    struct amd_gpu_pmf_data gfx_data;
>>>>>       u64 policy_addr;
>>>>>       void *policy_base;
>>>>>       bool smart_pc_enabled;
>>>>> +    struct pci_dev *root;
>>>>>   };
>>>>>   struct apmf_sps_prop_granular {
>>>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c 
>>>>> b/drivers/platform/x86/amd/pmf/spc.c
>>>>> index 512e0c66efdc..cf4962ef97c2 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>>>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev 
>>>>> *dev, struct ta_pmf_enact_table *
>>>>>       dev_dbg(dev->dev, "Max C0 Residency : %u\n", 
>>>>> in->ev_info.max_c0residency);
>>>>>       dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>>>>       dev_dbg(dev->dev, "Connected Display Count : %u\n", 
>>>>> in->ev_info.monitor_count);
>>>>> +    dev_dbg(dev->dev, "Primary Display Type : %s\n",
>>>>> + drm_get_connector_type_name(in->ev_info.display_type));
>>>>> +    dev_dbg(dev->dev, "Primary Display State : %s\n", 
>>>>> in->ev_info.display_state ?
>>>>> +            "Connected" : "disconnected/unknown");
>>>>>       dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state 
>>>>> ? "Close" : "Open");
>>>>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>>>   }
>>>>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct 
>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>       return 0;
>>>>>   }
>>>>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct 
>>>>> ta_pmf_enact_table *in)
>>>>> +{
>>>>> +    amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>> +    in->ev_info.monitor_count = dev->gfx_data.display_count;
>>>>> +    in->ev_info.display_type = dev->gfx_data.connector_type[0];
>>>>> +    in->ev_info.display_state = dev->gfx_data.con_status[0];
>>>>> +}
>>>>> +
>>>>>   void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct 
>>>>> ta_pmf_enact_table *in)
>>>>>   {
>>>>>       /* TA side lid open is 1 and close is 0, hence the ! here */
>>>>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct 
>>>>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>>>>       amd_pmf_get_smu_info(dev, in);
>>>>>       amd_pmf_get_battery_info(dev, in);
>>>>>       amd_pmf_get_slider_info(dev, in);
>>>>> +    amd_pmf_get_gpu_info(dev, in);
>>>>>   }
>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c 
>>>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> index 2f5fb8623c20..956e66b78605 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>> @@ -9,6 +9,7 @@
>>>>>    */
>>>>>   #include <linux/debugfs.h>
>>>>> +#include <linux/pci.h>
>>>>>   #include <linux/tee_drv.h>
>>>>>   #include <linux/uuid.h>
>>>>>   #include "pmf.h"
>>>>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct 
>>>>> amd_pmf_dev *dev)
>>>>>       return amd_pmf_start_policy_engine(dev);
>>>>>   }
>>>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>>>> +{
>>>>> +    struct amd_pmf_dev *dev = data;
>>>>> +
>>>>> +    if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>>>> +        /* Found the amdgpu handle from the pci root after 
>>>>> walking through the pci bus */
>>>> If you insist on having this comment, make it a function comment 
>>>> instead
>>>> (with appropriate modifications into the content of it) but I 
>>>> personally
>>>> don't find it that useful so it could be just dropped as well, IMO.
>>>>
>>>>> +        dev->gfx_data.gpu_dev = pdev;
>>>>> +        return 1; /* Stop walking */
>>>>> +    }
>>>>> +
>>>>> +    return 0; /* Continue walking */
>>>>> +}
>>>>> +
>>>>>   static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data 
>>>>> *ver, const void *data)
>>>>>   {
>>>>>       return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev 
>>>>> *dev)
>>>>>       INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>>       amd_pmf_set_dram_addr(dev);
>>>>>       amd_pmf_get_bios_buffer(dev);
>>>>> +
>>>>> +    /* Get amdgpu handle */
>>>> Useless comment.
>>>>
>>>>> + pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>>>> +    if (!dev->gfx_data.gpu_dev)
>>>>> +        dev_err(dev->dev, "GPU handle not found!\n");
>>>>> +
>>>>> +    if (!amd_pmf_gpu_init(&dev->gfx_data))
>>>>> +        dev->gfx_data.gpu_dev_en = true;
>>>>> +
>>>>>       dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>>>       if (!dev->prev_data)
>>>>>           return -ENOMEM;
>>>>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct 
>>>>> amd_pmf_dev *dev)
>>>>>       kfree(dev->prev_data);
>>>>>       kfree(dev->policy_buf);
>>>>>       cancel_delayed_work_sync(&dev->pb_work);
>>>>> +    if (dev->gfx_data.gpu_dev_en)
>>>>> +        amd_pmf_gpu_deinit(&dev->gfx_data);
>>>>> +    pci_dev_put(dev->gfx_data.gpu_dev);
>>>>>       amd_pmf_tee_deinit(dev);
>>>>>   }
>>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>>> new file mode 100644
>>>>> index 000000000000..5f79e66a41b3
>>>>> --- /dev/null
>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>> @@ -0,0 +1,35 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/*
>>>>> + * AMD Platform Management Framework Interface
>>>>> + *
>>>>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>>>>> + * All Rights Reserved.
>>>>> + *
>>>>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> + */
>>>>> +
>>>>> +#ifndef AMD_PMF_IO_H
>>>>> +#define AMD_PMF_IO_H
>>>>> +
>>>>> +#include <acpi/video.h>
>>>>> +#include <drm/drm_connector.h>
>>>>> +#include <linux/backlight.h>
>>>>> +#include <linux/thermal.h>
>>>>> +
>>>>> +#define MAX_SUPPORTED 4
>>>>> +
>>>>> +/* amdgpu */
>>>> Document the structure properly with kerneldoc instead of an unhelpful
>>>> comment like above :-). Please also check if you add any other structs
>>>> into kernel-wide headers that you didn't document yet. Or fields into
>>>> existing structs.
>>>>
>>>>> +struct amd_gpu_pmf_data {
>>>>> +    struct pci_dev *gpu_dev;
>>>>> +    struct backlight_device *raw_bd;
>>>>> +    struct thermal_cooling_device *cooling_dev;
>>>>> +    enum drm_connector_status con_status[MAX_SUPPORTED];
>>>>> +    int display_count;
>>>>> +    int connector_type[MAX_SUPPORTED];
>>>>> +    bool gpu_dev_en;
>>>>> +};
>>>>> +
>>>>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>>>>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>>>>> +#endif
>>>>>
>>
>

