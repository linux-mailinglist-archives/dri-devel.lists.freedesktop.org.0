Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FCC7CD7F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD9810E3C0;
	Wed, 18 Oct 2023 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A4D10E3C0;
 Wed, 18 Oct 2023 09:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEsb1N6thyu9dSqig2y2LggFJSrxXVwvLCI4V8DP7y56rlXHYEP6Zuz96TB9MWhRvRyGOYa6RkAVwTgKLmxbywzfAsqYSUEx3cEqDdUKJ10CDhTSUYTANdV3bq5B4QcWwsvi2ezCxTDzCyu9/FF6tQ/F19zv2aXifMHIya0iCnurY5ZkzqQ6eeeMu11yE2QPkPl0c/RKahB6Uw5QY2pxddvp9nLGAu1GFUqhChJFN9pAM3BxO3o6PtvKhlCIGukRHbzmX1D/FhZIGt8fqcqmfq13tbl2Sy1jQSRPiuDpSwjBrscCF+/HUgTOt2emENuonXsPYuAitZXQB88gd0cY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsXoGCenBsLtYBWuz4cYrfTXzNrEt+VMlN5qXlgSp6g=;
 b=U0WWlpsWHp8m/B7mm+tNtcMAJ82Rx9uXYnb6f6a368wAb47zINyETa3NUEXVWhBtg9sOqHqo/XwCOK74uR4qsdrusUDmn1vDiiZRl5ILLfjpNj6acFqd7ZaZT4bBfLTL4TbzYjCnESWxmeLBs1zz+ghlREzzNSWsUqNIvDQa06XyX1pb+ZlyfOaatqhKT5cr9G1X9KtkWGnz+uLZAAfyfvXqZXPLbvj3SlXPWOxUz6MMSah840aoS1EmigWdBLJ9uaoAp1kDrpkU7WR90NYbBVsjm84a2VQSla5wjAmllptCw8MWPZDKbNvZw/yMga+iwYTWxYKp2EUKgD2xy6+TPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsXoGCenBsLtYBWuz4cYrfTXzNrEt+VMlN5qXlgSp6g=;
 b=oK7X+vpxG7y8IgYH22u5PMyrGipE0N4ZtLpSdi5BuMDHNQs5FEWf+tMgnt5iZb11YHtJZfwgW1e4IZqORgi3xMZ+ald/mSDYhGx/k0nEg18GE0kce2TYIw6xsXcwQQAd6UvpUy6FjL1FZSIOWfHIyJrmbrUqNMo7wHbrwNLCvqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5708.namprd12.prod.outlook.com (2603:10b6:208:387::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 09:28:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 09:28:24 +0000
Message-ID: <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
Date: Wed, 18 Oct 2023 14:58:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4ff85a-86dc-4980-47e2-08dbcfbc93c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ivI435oZ14nW0m4dRMjUteORXlCEQQtF54uGnBUelrB2KGv5IlkVt4/Y592Mc9PdzDYNxZCPevcpOJ9f1FIi6ZLgRh97oNKPk8rUhQmYKGOrFDWXcz7qbKbOyoJDmPlDvLRyHPu5T/95YUUl1L/hE6Z34ee7Etle0FROLKOOcLND8I2wQZC24kxRW98T1YLSDbZbaGMjGie059/7r4AD4h31+qrHeaVEZxdu/QcfFCBu0Sj6/zBdDPBG49X8bWsf+8X+yRA9/lqeWUgeFQpTVZGqZkC5lht/Z/RXa6ur9vD0sk7yiJRwgNtSAfN2+ROnGKCZArYtJmDCZflptcpMscdVGB3VysUTNsR4IE16AkPKEn2z+Es1213f0JWtiMJQtejoQJKok7grvqkH3V+Qo3F4OzI536ANntib7m+w+4KMAXv3jijteZqjwc7PH+1eoQabAhjkLvAjODRDE6xxI0vCmDHLdO11MxIJVjDWCGFezPR/YghKetNGjQcNRZpH2ZxSI7lPS7gyGGEvKPoyPv0MjPWu79kTq+KIGHfmmDG1Zm2ZdLHOakvFr5ECJ4NZGnUin+b90y9Jgz5c+TmxFYIBION6dITB7rWEfRpxf8yZ7eRTwziVD+JO6Hm8hveV6OUu14I6nwCMHV6iFu8q5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(31686004)(66899024)(36756003)(66946007)(66476007)(66556008)(316002)(38100700002)(6916009)(31696002)(2616005)(86362001)(83380400001)(53546011)(66574015)(26005)(6666004)(8936002)(6506007)(6486002)(2906002)(8676002)(478600001)(41300700001)(30864003)(7416002)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkErcDRaQnU3bUhMeE01UjhsYktyaEV2MVdUVVgwQkY5RVUxN0cxRk5Bb1Jr?=
 =?utf-8?B?b0pVZk1zQWZGbDc1QUFUTEtlTy91RkVWaTc2WXJ2VDFpQ3R4NXVTdzF2bkhF?=
 =?utf-8?B?TUU1T1NSODNvSjkrRS9GcFE4cGt3ZUNOYWZDTCtDMEQrNmxyeXFFR2hEUjVY?=
 =?utf-8?B?ZUlEazdWMWk4cHlNZGdMd3lWaVJIS29JakdpQ2NoNjdwNjZHOGVQc05Jck9i?=
 =?utf-8?B?RXVRRzJaZHNaYytmbXpKL1NCV3BIeWpBZ2FuZ0pXTmNOMmRLbWkzQ0UyZk5X?=
 =?utf-8?B?cnQ5aWxkNTQ3Z2VWbVQxanUvdWlhdUY5K1RuK1dNM3hJbzB2SVZDeG44N3Y0?=
 =?utf-8?B?cEJ2Nk1NbHJjZTlPbU1vYlRXemk5RHRUL2czek5iOEt4KzZtT09QTWl5eVE0?=
 =?utf-8?B?aE9sWUpSQkZxYlpqSTAyZ3d1Y21qOUlkaS9ITk1YOVNKdkhrMXVZaS8xV3I5?=
 =?utf-8?B?ZTRURFNXNk1la3Z4WEc0TFRZMG5OVkFyMTZCcnJFNGd3QTlWMndXMmdIdG1o?=
 =?utf-8?B?ZmYyTHFQbkdzcmlHK2hFSHIrcmxoaUllOFJWS1RWN2t3ZU0rcFVZekVaREhL?=
 =?utf-8?B?b1kvM0JVUHZSL0Y3d2hobFdGVW8xOTQwZTJRYXp0UHo0WkdZdFROaE5iQlpM?=
 =?utf-8?B?MktEMFdTL1Q5S2h6UmRPL284TWdGOTd3WjNkb2oydXZyNVdKUXpHWkpCQ2hs?=
 =?utf-8?B?RWxzSGJ0bXZENlU0bm1rYmt1QlZveGtaejdLMkpOaFdFZlZSSFpqeWo3VVpo?=
 =?utf-8?B?VGFUcmU4d1dicWpvNXZvMDFmVnZJRVIwMVVyeTVRdWhFSWgrdm9pQ3BkcW9Q?=
 =?utf-8?B?a3BsYys2dXFONTZ0d3poZDI5eVRPNUhncFRac0R3Z1lCeWJadVhwZFBadWVt?=
 =?utf-8?B?L0c0YW4yb1plclRIWWxXU3lWSXA1cjczZ08rVG5QZmx6aERqZ2hsWTc0bzhT?=
 =?utf-8?B?YkNnWGU5ZFYzS3JPb0NJemcwbmdpNUFoR1NVVElEcWlMS20wcUN6THNPaFFn?=
 =?utf-8?B?NFExTHlDbm5Oa2VMaHE3ekJXMnI4MmtUS0lheW1GbDl6RyttOW9mVTVCOFIx?=
 =?utf-8?B?ZnJkYm5XeHYzQzFTaWxReWZsMnl0VG9HRVRVSCtkMnA2dmVJWkVhMmRUK2dr?=
 =?utf-8?B?UExKTGJySUt0QnJmUjVEbEdWSWx5ak9yaXJ3YzZWeVc3aGlRbXl0VHZiRE1C?=
 =?utf-8?B?SUREVnJtK3J2TC93dDliR2RUSEI2NmxJcjRrb1lQMUFIR1VHYkppODZKN0t2?=
 =?utf-8?B?OVJHdmRHc2h2a08wLzRxVUxnRUtLVUx0S2w5Qm1ETGtPOVZMNUZNWlh2eFlX?=
 =?utf-8?B?SEpyVkZtNWNyaTRCZStDNVhCQ0VXZ1ZTR0t6OWUwYi9HN1RSVUpWNEFNeU0y?=
 =?utf-8?B?RUNEZ0ZCK3Y5a3hraVlacHAxSTliWFN5enpzdGtKR09pdFVOaGhlNUloWE12?=
 =?utf-8?B?a1pOVkxva1YxdTBNNEpUT0lpSDYwOGZ5eG5jOHBONFJXUys3WFZTTnI0WlVj?=
 =?utf-8?B?L0pIZGtIUFp0S2xtdHNYS2lzOUJ0OU9WWXJVQmdkTzlteG5pM1hYYTNpbzNu?=
 =?utf-8?B?bFM3YmZkempxUndIYlZMUVcyZGlmb2UxcTdjYzQyOGF0VXlZTjl0MjZua3dB?=
 =?utf-8?B?eWhBOGx1RGpsYU92NG5heWRUeE95Mlo0SnlVQm9KUS9DT2Y5WC9QUnltWWtO?=
 =?utf-8?B?WW5BUWlhK21DcVJKQVZZTm1jOGJ3clpaQkhiOGFXOThPbDNrd1piaXI5Nzdp?=
 =?utf-8?B?WUVTeTViazZVOUE1blg5MnRqV2Z2Wk91ZStXOW9ERFlqbEIyRFlwVzdmL2hJ?=
 =?utf-8?B?SE9EMktyT2NwaU5CVEw1cjIzYVJFMENIUWRmSjZhK0p3OW0wdk1EYXdQc1pW?=
 =?utf-8?B?V2VWNnBNVFNDalpzbnlzOEFlY1pRQ3o2OElkOW0zM0ZrVXVlWFI0d2JQSktO?=
 =?utf-8?B?cVlGdEcxZGVvWVhCcENlUTdBTDBXME1PTW1HUGVGcGNxT2t0dnJsR3FjQnVq?=
 =?utf-8?B?SGM2Y2dkL1UvN2JFK25XVlVrQzUvSUJ4SmR3L2ZTK2hBNXJtSC9zd2w2WXA4?=
 =?utf-8?B?a2toVTRNazQxSllrRnFDY3FZam9acktNNjFzaTJZRTFxQVBkaTdxVS9zTVM0?=
 =?utf-8?Q?aePXilO3/eCgyPIWE+lccNPvz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4ff85a-86dc-4980-47e2-08dbcfbc93c3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:28:24.6129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M99ML1C1+/0LbW9g3G9PXpoklXnLPY599gqgXMCjU2wC/KHtMlewQ5weVcCRAcTozaUp4KFIBStESNLcd4+h6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708
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
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
> On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
> 
>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>> need to have interface between the PMF driver and the AMDGPU driver.
>>
>> Add the initial code path for get interface from AMDGPU.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 ++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>>  drivers/platform/x86/amd/pmf/core.c     |   1 +
>>  drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>>  drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>>  drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>>  include/linux/amd-pmf-io.h              |  35 ++++++
>>  9 files changed, 220 insertions(+)
>>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>  create mode 100644 include/linux/amd-pmf-io.h
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>> index 384b798a9bad..7fafccefbd7a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>  
>>  amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>>  
>> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
>> +
>>  # add asic specific block
>>  amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>>  	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index a79d53bdbe13..26ffa1b4fe57 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -50,6 +50,7 @@
>>  #include <linux/hashtable.h>
>>  #include <linux/dma-fence.h>
>>  #include <linux/pci.h>
>> +#include <linux/amd-pmf-io.h>
>>  
>>  #include <drm/ttm/ttm_bo.h>
>>  #include <drm/ttm/ttm_placement.h>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> new file mode 100644
>> index 000000000000..ac981848df50
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> @@ -0,0 +1,138 @@
>> +/*
>> + * Copyright 2023 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
> 
> This is MIT, right? Add the required SPDX-License-Identifier line for it
> at the top of the file, thank you.
> 

all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
text. So, have retained it to maintain uniformity.

>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *
>> + */
> 
> Remove the extra empty line at the end of the comment.
> 

I just took the standard template for all the gpu files. Is that OK to
retain the blank line?

If not, I can remove it in the next version.

Rest all remarks I will address.

Thanks,
Shyam

>> +
>> +#include <linux/backlight.h>
>> +#include "amdgpu.h"
>> +
>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>> +{
>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +	struct drm_connector_list_iter iter;
>> +	struct drm_connector *connector;
>> +	int i = 0;
>> +
>> +	/* Reset the count to zero */
>> +	pmf->display_count = 0;
>> +	if (!(adev->flags & AMD_IS_APU)) {
>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	mutex_lock(&mode_config->mutex);
>> +	drm_connector_list_iter_begin(drm_dev, &iter);
>> +	drm_for_each_connector_iter(connector, &iter) {
>> +		if (connector->status == connector_status_connected)
>> +			pmf->display_count++;
>> +		if (connector->status != pmf->con_status[i])
>> +			pmf->con_status[i] = connector->status;
>> +		if (connector->connector_type != pmf->connector_type[i])
>> +			pmf->connector_type[i] = connector->connector_type;
>> +
>> +		i++;
>> +		if (i >= MAX_SUPPORTED)
>> +			break;
>> +	}
>> +	drm_connector_list_iter_end(&iter);
>> +	mutex_unlock(&mode_config->mutex);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>> +
>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>> +				     unsigned long *state)
>> +{
>> +	struct backlight_device *bd;
>> +
>> +	if (!acpi_video_backlight_use_native())
>> +		return -ENODEV;
>> +
>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!bd)
>> +		return -ENODEV;
>> +
>> +	*state = backlight_get_brightness(bd);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>> +				     unsigned long *state)
>> +{
>> +	struct backlight_device *bd;
>> +
>> +	if (!acpi_video_backlight_use_native())
>> +		return -ENODEV;
>> +
>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!bd)
>> +		return -ENODEV;
>> +
>> +	if (backlight_is_blank(bd))
>> +		*state = 0;
>> +	else
>> +		*state = bd->props.max_brightness;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>> +};
>> +
>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
>> +{
>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +
>> +	if (!(adev->flags & AMD_IS_APU)) {
>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!acpi_video_backlight_use_native())
>> +		return -ENODEV;
>> +
>> +	pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!pmf->raw_bd)
>> +		return -ENODEV;
>> +
>> +	pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
>> +							   pmf, &bd_cooling_ops);
>> +	if (IS_ERR(pmf->cooling_dev))
>> +		return -ENODEV;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
>> +
>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
>> +{
>> +	thermal_cooling_device_unregister(pmf->cooling_dev);
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index f246252bddd8..7f430de7af44 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -10,6 +10,7 @@ config AMD_PMF
>>  	depends on AMD_NB
>>  	select ACPI_PLATFORM_PROFILE
>>  	depends on TEE && AMDTEE
>> +	depends on DRM_AMDGPU
>>  	help
>>  	  This driver provides support for the AMD Platform Management Framework.
>>  	  The goal is to enhance end user experience by making AMD PCs smarter,
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 4b8156033fa6..c59ba527ff49 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	dev->cpu_id = rdev->device;
>> +	dev->root = rdev;
>>  
>>  	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>>  	if (err) {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 8712299ad52b..615cd3a31986 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -13,6 +13,7 @@
>>  
>>  #include <linux/acpi.h>
>>  #include <linux/platform_profile.h>
>> +#include <linux/amd-pmf-io.h>
>>  
>>  #define POLICY_BUF_MAX_SZ		0x4b000
>>  #define POLICY_SIGN_COOKIE		0x31535024
>> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>>  	void *shbuf;
>>  	struct delayed_work pb_work;
>>  	struct pmf_action_table *prev_data;
>> +	struct amd_gpu_pmf_data gfx_data;
>>  	u64 policy_addr;
>>  	void *policy_base;
>>  	bool smart_pc_enabled;
>> +	struct pci_dev *root;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 512e0c66efdc..cf4962ef97c2 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
>>  	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>>  	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
>> +	dev_dbg(dev->dev, "Primary Display Type : %s\n",
>> +		drm_get_connector_type_name(in->ev_info.display_type));
>> +	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
>> +			"Connected" : "disconnected/unknown");
>>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>  }
>> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  	return 0;
>>  }
>>  
>> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +{
>> +	amd_pmf_get_gfx_data(&dev->gfx_data);
>> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
>> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
>> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
>> +}
>> +
>>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>  {
>>  	/* TA side lid open is 1 and close is 0, hence the ! here */
>> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>  	amd_pmf_get_smu_info(dev, in);
>>  	amd_pmf_get_battery_info(dev, in);
>>  	amd_pmf_get_slider_info(dev, in);
>> +	amd_pmf_get_gpu_info(dev, in);
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 2f5fb8623c20..956e66b78605 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -9,6 +9,7 @@
>>   */
>>  
>>  #include <linux/debugfs.h>
>> +#include <linux/pci.h>
>>  #include <linux/tee_drv.h>
>>  #include <linux/uuid.h>
>>  #include "pmf.h"
>> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>>  	return amd_pmf_start_policy_engine(dev);
>>  }
>>  
>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>> +{
>> +	struct amd_pmf_dev *dev = data;
>> +
>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>> +		/* Found the amdgpu handle from the pci root after walking through the pci bus */
> 
> If you insist on having this comment, make it a function comment instead 
> (with appropriate modifications into the content of it) but I personally 
> don't find it that useful so it could be just dropped as well, IMO.
> 
>> +		dev->gfx_data.gpu_dev = pdev;
>> +		return 1; /* Stop walking */
>> +	}
>> +
>> +	return 0; /* Continue walking */
>> +}
>> +
>>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>>  {
>>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>  	amd_pmf_set_dram_addr(dev);
>>  	amd_pmf_get_bios_buffer(dev);
>> +
>> +	/* Get amdgpu handle */
> 
> Useless comment.
> 
>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>> +	if (!dev->gfx_data.gpu_dev)
>> +		dev_err(dev->dev, "GPU handle not found!\n");
>> +
>> +	if (!amd_pmf_gpu_init(&dev->gfx_data))
>> +		dev->gfx_data.gpu_dev_en = true;
>> +
>>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>  	if (!dev->prev_data)
>>  		return -ENOMEM;
>> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>>  	kfree(dev->prev_data);
>>  	kfree(dev->policy_buf);
>>  	cancel_delayed_work_sync(&dev->pb_work);
>> +	if (dev->gfx_data.gpu_dev_en)
>> +		amd_pmf_gpu_deinit(&dev->gfx_data);
>> +	pci_dev_put(dev->gfx_data.gpu_dev);
>>  	amd_pmf_tee_deinit(dev);
>>  }
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> new file mode 100644
>> index 000000000000..5f79e66a41b3
>> --- /dev/null
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * AMD Platform Management Framework Interface
>> + *
>> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#ifndef AMD_PMF_IO_H
>> +#define AMD_PMF_IO_H
>> +
>> +#include <acpi/video.h>
>> +#include <drm/drm_connector.h>
>> +#include <linux/backlight.h>
>> +#include <linux/thermal.h>
>> +
>> +#define MAX_SUPPORTED 4
>> +
>> +/* amdgpu */
> 
> Document the structure properly with kerneldoc instead of an unhelpful 
> comment like above :-). Please also check if you add any other structs 
> into kernel-wide headers that you didn't document yet. Or fields into 
> existing structs.
> 
>> +struct amd_gpu_pmf_data {
>> +	struct pci_dev *gpu_dev;
>> +	struct backlight_device *raw_bd;
>> +	struct thermal_cooling_device *cooling_dev;
>> +	enum drm_connector_status con_status[MAX_SUPPORTED];
>> +	int display_count;
>> +	int connector_type[MAX_SUPPORTED];
>> +	bool gpu_dev_en;
>> +};
>> +
>> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
>> +#endif
>>
> 
