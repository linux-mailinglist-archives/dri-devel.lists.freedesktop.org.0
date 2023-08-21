Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7F782A9F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31A810E256;
	Mon, 21 Aug 2023 13:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EDF10E0A2;
 Mon, 21 Aug 2023 13:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtaqdpmBP/fpErwGkg3CkummK89ztJkvt9wXVrQ6VF1+jQHEvFyyQc05qn0+vzV5MWjBqda7iwdl3A1L8QkhU7OG/BNjaDfCnb1OaRL5bqArO0dS/oTg/63DpOGCDJ1FhU++Nuy7oRN188CcMg6PgZgLB2lAN1F1/jV7etYsIRuVtD1jAVE2ulYSD+sNOJ42Vs9OHjO4ctbwgtWT4N2zrIUES750nS2UsfnBNoFlA1slwidOeRujFAnei4DxzyArtcUHNUDpcbIjoEyUwnf4F32T/Tnm01qt6lugwwV4GR6EP53bgtmrm91OB4IhuWeKBaGRMs4IKByJ2DHKoEMVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcdvDONO3jlFN+5fNeuhLZ0qPto8nPcarVhD0e7QbLU=;
 b=Ahq3FNQM/dXWT8FpWK4lNF2vPT4Cgex/APvykTjDw5OclxNoTzCS5q5rk8n0vbakf6FEEWs0rfxMdLBeYT9GFf96MkqdDskZmY3GlkRRQ9ipYnT2A/4sFlAgORLL9iBiNXh/2TaReSWqB8atkOKsFQ75G2yXJ1V07MNkiKY8wWc3Rm26yyerUaw4VC5uPwGFwTShilI/xcRTj2FKCVwPGBiNzQV6azwvAzax5cL/twlNX94sODius/CQEqHtV80j89JNeJZd830hnJcGDr+qu3ICpytFRDQjQvQWP9kcSresyHOoIG7mdffqixnqBtCLxHXjeJpL1vsqIP4XKCnjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcdvDONO3jlFN+5fNeuhLZ0qPto8nPcarVhD0e7QbLU=;
 b=hZG9mq3dbBkt7ZdA99inutojkYALvidYwwZElP2IZ8WrheQeHz8XpygQ4/cGFZSIX7WJCZrfa3k9Gmj45JZtldu9VdKoP6AQrl3+hpuUolOrA+s3/sD5ByXy8LFkdxeI2ahJvbfav8L9j0ujwN9UvqAzxlFSjRCQCNh1n73PHi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 13:35:22 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 13:35:22 +0000
Message-ID: <90f7c142-3372-536f-accc-a04baaf9f666@amd.com>
Date: Mon, 21 Aug 2023 19:05:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/7] drm/amdgpu: Added init/fini functions for workload
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-2-Arvind.Yadav@amd.com>
 <3e20b067-c02a-1911-cac9-3e547a14b565@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <3e20b067-c02a-1911-cac9-3e547a14b565@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: e2931116-a673-4332-170c-08dba24b77ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slSQhB1MMT2bG5QwGXSLHU6zqNycJsfU1WMPFvxm6VE+/SG0Cb+1nlPOSKLwYxabFRktJUUiSUngEPn0HItCA50FLK2EeFL0EUcaN4fQP044vMNKplxDA7SNfD7woktdX+wBBYbscp/gk2hRgABwBdnzYmMWVP8tbpZLYr0rdvTvaodMeQBuuAJ61u4EoOe2i8jpOvJEREqt3X0Um5g1+RN5WKpc+tvUKrtKP4siJh708jEur7v805zNe8A5G0iodn7WEJvon5TiGgxw2/hMiAfVvUW7W9M+hk2n3lXf4Mp6BL0gNBgmANhWvxPR5n8i+qRSXAvSBnzZe20kF8mqskFh7ZX0v5d8JBBt9eOfIea1xveMJY7Ugk0RrXIX8t62wLhq0js4KCSoqbhnstJU1XzvPEhXyczHmCuvRnUCaX45Qk97XPOTAhXMQeEKihYjxRBl7upqYkYJ/15UODEZ1zfSIqltd2QlngNKGS4bgEcjuDxentqbUY7ulMwJcleU16pRHQHHQ+IZCL7HePR0USslLLCVOho1Wxk4vaWXMksgdJRRYRQ4wVS043hwkj7vIxNu5c/dorJI2zNReJgumm7HTom+vVoOdlIYzeGctIkjPr2Q6bxL161bwsVLpiIELr/yBk1n2GcL5Cvo/OAKkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(30864003)(45080400002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(66899024)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkoydFptWklZcy80Z2xWQlN3aVRjUEVFeFFiZHZvbW1LUlRvSlRtL3NXVUJp?=
 =?utf-8?B?amo2cERLbE5vOURZS1RLbUpvS1hGSEJqVkR1ZXNnWjJ3L0Z3d2hhNGhNV1hK?=
 =?utf-8?B?dWR4Vm9lRzNUOWR5dXJ4ZkFHcnovUjJwS2JpSnBYTHUrUm1RQlQyZ2JVYlhM?=
 =?utf-8?B?bEl6REsvcE4zaHFHZWxsdUl6d3g1Z0FyOWhMcWU2ckJBenZqejFzQTEwSVc0?=
 =?utf-8?B?amUwVFlGNGRZYnFjWW9iWDhjaFJXd2NJemtpa3dJa0NVd0FreEJxMmVmdzQz?=
 =?utf-8?B?OStzWEkrWHJzYitwYWQ0V0I1VTBMUXhxRTNiSjI1YzMvOStpdUZ6MCtSS3Bl?=
 =?utf-8?B?WDlsdTVQVDBKQ3FmUzhjZkVqMnRtUWk4Qm0vZFpGRnFsMnlZVWJHSWdqY2lF?=
 =?utf-8?B?QWVXZnlaQVNXUjIyZlY0UXVRaFlIbGQ1VnBKYzd4L3IweklHL3RJS0pzQ1V3?=
 =?utf-8?B?ak01RENEdVc0WTNhSDVjOG43MzNlVnU4UWVsVjN2STcrYzJoSkFBZU1LbVJy?=
 =?utf-8?B?bFpDbTRCSEhEWGVkbkVlSE9xaXhSRUQ1QmF6TXVwZHFDUW9mUXFub21yTXpq?=
 =?utf-8?B?ZklieHhyVUhXOUFDTmhoTFdWSG15bnNhMnNkUnhtc3hHZE1IdmJ4SFpzdlU3?=
 =?utf-8?B?ck1ZWVBIQXViQlBVVXdWVHZINnV5c0VXaEhwZHUwQ3A5ZFpWbnppbCs1ZWw4?=
 =?utf-8?B?dW0vczBhcnBHQnFvVWFIT2U1eWgrdnZUQURMUHBtMGhnZU9UZlQvS2RVQ2lT?=
 =?utf-8?B?b01kWXVSaFFJR2E2UzR6TWpGL2lib2VCMmUvVzcwYllERWZJc0FBMzBPcDBE?=
 =?utf-8?B?SWJBU2FBdTJoNWFrMjVLMFFiWFdmUDF3YmhoMDhnb3A3a0ZBaDFOM0VBa0pV?=
 =?utf-8?B?NVVuZWYwK0J1cUVEajYxWVorTUZUWkRnUFVhcHZEenZiVnMrdlRuem1wQ3BU?=
 =?utf-8?B?cDNuNzNpY1h1VHNLTU5jT3o3QnFkcnZmaG1rdzdqNlJvZ254UHBFU2NTcUh3?=
 =?utf-8?B?ejN6QXI1bmsra0JEcWhlVnFMM3I4S0NNMUhQQ21CWmJDYnZVVFJBNVFMdkFB?=
 =?utf-8?B?cjJlSkpxemJHNVhrWlRZZG1DRU1SbjBPem5qbXZ1Tit2Ly9DUHVNdVkzMlZT?=
 =?utf-8?B?R1JhQVJIRTR4SVpBaVJDVENSZnZ2ZEh4RW1Td3ZLcFM5cHBhWUsybkR1bzRJ?=
 =?utf-8?B?cHhCcWQ1a0tFS1hueTd2S2QvWGJ6anZHS09GZkIxaDgzRVlNb2tFQmRDZXl3?=
 =?utf-8?B?NzZWSnd0Qk8xMEVFeVhqbXZMM2syWWIxMTlaWWlLeXFvL1FGTGZwVCtQNlJ3?=
 =?utf-8?B?ZkFHQ3pKaGw2RmIzWkJsaFpKejU2eHE5clVnSUFrTjVIb0VXZDJnM0JrdmY5?=
 =?utf-8?B?MGo4RkVEV29KaTVIczBweU10ZWJoVmdRK3IwblhOS2s3dXdjbGljYkR3UE1i?=
 =?utf-8?B?ZWkxdFM1eGJ1WWdWckp6clQxZWwwVlpoRUJMeEt5VDc4alBJRjMyYjhQQ3B6?=
 =?utf-8?B?eUt4OTM2UGlDV1BBQTE4QkpIdDd0S1cwNG9yMXNGUFVhS3RnSjA3MkV5U3N1?=
 =?utf-8?B?RWtXOUtiSTRFT2JFSi8zMTdrV2FFUWVyeXl2anhZN0tvZ2M1eXNNemI3RTVE?=
 =?utf-8?B?Z0VMQUhCRVAwWDhHaW1IV0ZCaGVPRHI3c3dndzJuRVZFdzVwamlaM24xZkVL?=
 =?utf-8?B?enJlcWVrSFVubjVIQnk2UmEzTnRSZkQ1Tm5iQTJJY1FMaXBBSi9SUkFxeXhh?=
 =?utf-8?B?cC85YWdEWmV5MmhtQVUzc3Z0M0RXU01ha1lIeUhtc2RBY2R1K3NXOVFmM1pU?=
 =?utf-8?B?dlhUb24rVnJOTXREZXEzanFDbTRwSTFJM3ZjUkMrYTFFMTY5Z2xmVGtZTDFR?=
 =?utf-8?B?cWR0N2RSdU9xQVp2d29maWZzcm9obS8xcE5RNmx1Rk8xeFd1di8raFc4MkR1?=
 =?utf-8?B?dG9NSGJBS1M5SkMzZm9lRWI2MDI4YzVERm5GNzBadllsT09wcjZsVUNqNy9s?=
 =?utf-8?B?MzRBaGpsbGVsNXp4LzV6V0E5VWgrY0dPUUNWQTA3bkhkelcybTMzTVhmeXZ6?=
 =?utf-8?B?VzMxbTA5RHVOeTJ1Nlg3VFJMdmFGQlhSbThKMXNjL1NzNEZ1WHd0VkhIcDZv?=
 =?utf-8?Q?Awpp8dfJ1od12S/Fg3G4W8yaU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2931116-a673-4332-170c-08dba24b77ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:35:22.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LDn7EOzhFHsrtV9Apt5vUgU0EN2Xjm2BQhP5NNNqCazxwQU7Zi5qh0/Pdoq7U6FEkJPH4qB5OL/doMXCfodPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/21/2023 6:36 PM, Shashank Sharma wrote:
> Hey Arvind,
>
> On 21/08/2023 08:47, Arvind Yadav wrote:
>> The'struct amdgpu_smu_workload' initialization/cleanup
>> functions is added by this patch.
>>
>> v2:
>> - Splitting big patch into separate patches.
>> - Added new fini function.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  3 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  4 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 44 +++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h | 53 +++++++++++++++++++
>>   5 files changed, 105 insertions(+), 1 deletion(-)
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
>> index 5c7d40873ee2..cd3bf641b630 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2243,6 +2243,8 @@ static int amdgpu_device_ip_early_init(struct 
>> amdgpu_device *adev)
>>       adev->cg_flags &= amdgpu_cg_mask;
>>       adev->pg_flags &= amdgpu_pg_mask;
>>   +    amdgpu_workload_profile_init(adev);
>> +
>>       return 0;
>>   }
>>   @@ -2890,6 +2892,8 @@ static int amdgpu_device_ip_fini(struct 
>> amdgpu_device *adev)
>>   {
>>       int i, r;
>>   +    amdgpu_workload_profile_fini(adev);
>> +
>>       if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
>>           amdgpu_virt_release_ras_err_handler_data(adev);
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> new file mode 100644
>> index 000000000000..32166f482f77
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -0,0 +1,44 @@
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
>> +void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>> +{
>> +    adev->smu_workload.adev = adev;
>> +    adev->smu_workload.submit_workload_status = 0;
>> +    adev->smu_workload.initialized = true;
> why do we need this variable ?

Hi Shashank,

If any error comes while the device is booting then amdgpu will start 
unloading everything.
So I am using 'initialized' for unloading a driver successfully. This 
variable is to identify that the driver is loaded or not.

This is the below error for which the amdgpu driver is unloading when it 
is not getting firmware.

[   12.421609] amdgpu 0000:08:00.0: Direct firmware load for 
amdgpu/renoir_ta.bin failed with error -2
[   12.421618] [drm:amdgpu_device_init [amdgpu]] *ERROR* early_init of 
IP block <psp> failed -19
[   12.428207] [drm] VCN decode is enabled in VM mode
[   12.428212] [drm] VCN encode is enabled in VM mode
[   12.430925] [drm] JPEG decode is enabled in VM mode
[   12.430931] amdgpu 0000:08:00.0: amdgpu: Fatal error during GPU init
[   12.431184] amdgpu 0000:08:00.0: amdgpu: amdgpu: finishing device.
[   12.431296] ------------[ cut here ]------------
[   12.431297] WARNING: CPU: 3 PID: 438 at kernel/workqueue.c:3379 
__flush_work+0x22f/0x240
[   12.431305] Modules linked in: ledtrig_audio snd_hda_codec_hdmi 
snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec 
snd_hda_core amdgpu(OE+) snd_hwdep snd_pcm kvm snd_seq_midi 
snd_seq_midi_event drm_exec amdxcp snd_rawmidi iommu_v2 crct10dif_pclmul 
drm_buddy gpu_sched ghash_clmulni_intel sha512_ssse3 snd_seq 
drm_suballoc_helper aesni_intel drm_ttm_helper binfmt_misc crypto_simd 
snd_seq_device ttm cryptd snd_timer drm_display_helper input_leds rapl 
joydev cec wmi_bmof rc_core snd drm_kms_helper k10temp ccp soundcore 
mac_hid sch_fq_codel msr parport_pc ppdev lp parport ramoops 
reed_solomon drm pstore_blk pstore_zone efi_pstore ip_tables x_tables 
autofs4 hid_generic usbhid hid crc32_pclmul nvme igb ahci i2c_piix4 
xhci_pci i2c_algo_bit nvme_core libahci xhci_pci_renesas dca video wmi
[   12.431360] CPU: 3 PID: 438 Comm: systemd-udevd Tainted: G        W  
OE      6.5.0-rc2-custom #1
[   12.431362] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS 
ELITE/X570 AORUS ELITE, BIOS F34 06/10/2021
[   12.431364] RIP: 0010:__flush_work+0x22f/0x240
[   12.431367] Code: 8b 43 30 48 8b 53 40 89 c1 e9 f9 fe ff ff 4c 89 f7 
e8 45 0b db 00 e8 90 f5 08 00 45 31 ff e9 11 ff ff ff 0f 0b e9 0a ff ff 
ff <0f> 0b 45 31 ff e9 00 ff ff ff e8 02 a0 d9 00 66 90 90 90 90 90 90
[   12.431368] RSP: 0018:ffffb0668156f818 EFLAGS: 00010246
[   12.431370] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000000
[   12.431371] RDX: 0000000000000001 RSI: 0000000000000001 RDI: 
ffff9cea492c7840
[   12.431372] RBP: ffffb0668156f890 R08: 0000000000000000 R09: 
ffffb0668156f7a0
[   12.431372] R10: 0000000000000001 R11: 0000000000000001 R12: 
ffff9cea492c7840
[   12.431373] R13: 0000000000000001 R14: ffff9cea43839940 R15: 
0000000000000001
[   12.431374] FS:  00007fde83c18880(0000) GS:ffff9cf15e2c0000(0000) 
knlGS:0000000000000000
[   12.431375] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   12.431376] CR2: 00007f2648000010 CR3: 00000001059e2000 CR4: 
0000000000350ee0
[   12.431377] Call Trace:
[   12.431379]  <TASK>
[   12.431384]  ? show_regs+0x68/0x70
[   12.431388]  ? __flush_work+0x22f/0x240
[   12.431389]  ? __warn+0x8f/0x150
[   12.431392]  ? __flush_work+0x22f/0x240
[   12.431394]  ? report_bug+0x1f5/0x200
[   12.431399]  ? handle_bug+0x46/0x80
[   12.431402]  ? exc_invalid_op+0x19/0x70
[   12.431404]  ? asm_exc_invalid_op+0x1b/0x20
[   12.431408]  ? __flush_work+0x22f/0x240
[   12.431410]  ? irq_work_queue+0x10/0x60
[   12.431414]  ? __wake_up_klogd.part.0+0x5a/0x80
[   12.431419]  __cancel_work_timer+0x124/0x1b0
[   12.431421]  ? _printk+0x58/0x80
[   12.431423]  cancel_delayed_work_sync+0x13/0x20
[   12.431427]  amdgpu_workload_profile_fini+0x25/0x40 [amdgpu]
[   12.431854]  amdgpu_device_fini_sw+0x33/0x550 [amdgpu]
[   12.432035]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[   12.432213]  drm_dev_release+0x28/0x50 [drm]
[   12.432256]  devm_drm_dev_init_release+0x38/0x60 [drm]
[   12.432278]  devm_action_release+0x15/0x20
[   12.432283]  release_nodes+0x40/0xc0
[   12.432285]  devres_release_all+0x9e/0xe0
[   12.432286]  device_unbind_cleanup+0x12/0x80
[   12.432289]  really_probe+0x116/0x3e0
[   12.432291]  __driver_probe_device+0x7e/0x170
[   12.432293]  driver_probe_device+0x23/0xa0
[   12.432295]  __driver_attach+0xc5/0x190
[   12.432297]  ? __pfx___driver_attach+0x10/0x10
[   12.432299]  bus_for_each_dev+0x7c/0xd0
[   12.432302]  driver_attach+0x1e/0x30
[   12.432304]  bus_add_driver+0x11c/0x220
[   12.432306]  driver_register+0x64/0x130
[   12.432309]  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
[   12.432491]  __pci_register_driver+0x68/0x70
[   12.432494]  amdgpu_init+0x63/0xff0 [amdgpu]
[   12.432667]  do_one_initcall+0x48/0x310
[   12.432671]  ? kmalloc_trace+0x2a/0xa0
[   12.432675]  do_init_module+0x6a/0x260
[   12.432677]  load_module+0x1db3/0x2050
[   12.432681]  init_module_from_file+0x9c/0xe0
[   12.432682]  ? init_module_from_file+0x9c/0xe0
[   12.432685]  idempotent_init_module+0x179/0x230
[   12.432687]  __x64_sys_finit_module+0x5d/0xb0
[   12.432689]  do_syscall_64+0x3b/0x90
[   12.432691]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8

>> +
>> +    mutex_init(&adev->smu_workload.workload_lock);
>> +}
>> +
>> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>> +{
>> +    if (!adev->smu_workload.initialized)
>> +        return;
>> +
>> +    adev->smu_workload.submit_workload_status = 0;
>> +    adev->smu_workload.initialized = false;
>> +    mutex_destroy(&adev->smu_workload.workload_lock);
>> +}
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> new file mode 100644
>> index 000000000000..5d0f068422d4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -0,0 +1,53 @@
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
>
> call it power_profile_work instead ? Looks good otherwise.
>
Noted.

Thank you

~Arvind

> - Shashank
>
>> +    uint32_t submit_workload_status;
>> +    bool            initialized;
>> +    atomic_t power_profile_ref[PP_SMC_POWER_PROFILE_COUNT];
>> +};
>> +
>> +/* Workload mode names */
>> +static const char * const amdgpu_workload_mode_name[] = {
>> +    "Default",
>> +    "3D",
>> +    "Powersaving",
>> +    "Video",
>> +    "VR",
>> +    "Compute",
>> +    "Custom",
>> +    "Window3D"
>> +};
>> +
>> +void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>> +
>> +void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
>> +
>> +#endif
