Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C5BE49DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 18:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3310EA4C;
	Thu, 16 Oct 2025 16:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZOhr8gfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433DC10EA4C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbf6vYLMZJrbubpXDjfj8E0PJ1IC1l7ojsvA0vyObbQ5gvGq4w7slRpMU2Q9+UcXFUpo2Ws2zFPu+MauhuAM7ZNSeXNs+qIuSAg0LUQZA2dzDUp5/5q6hOfXLtrjSQ6wV3DV75uwTo2IOUEIBIUz7eMLQ0djqHn2bKD8vSvZxPDBafFlJMyTOXs2I6XRsqxsYjP8Rp0nC+mlaKdF1924Lo3qNelJ6aMX4PVMKVJjlmYI0X7LL72VgX7eCGR2AOZO60M+p8KODfM5OhMxA17BAUAZ8nZuDQqU/zEdVsVP3Bga/47gOa/j5YifvpZvTCvK5naGkLx99GPbp3eD/UGMQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbYaxwM14q7Egt/dCnjQv4at3Hl7eUMDD4TDsA4RFRE=;
 b=QzF0qBP+4ot7huQ4ime6Z/QceNNTfNuSliAKf7hpA5olDzWlaCdCbHnTF5vj0ZNSFRKNKrfglvyYB6RVDAEXz4Ta9W3CsdrKQAhu8KFg5hnyquJ0CK+eCuLh6d2/CjjbUPnxPq+V82LGzSj+T5vXaVaqStHVdvT3q9YVjxixeS9Ue0Qsrpc4ZJQvfQRsSgxMzbSHfH4YCKOQHhQdOsfyfF87NiBSFHZlEHcKj5KQfIrEGJV1yA/PcH1Vu5jleFfzB1KvBxgx+itlZRJ/6bOolGIsJSlWuqLHFzdSEC3Td/WJZsiNBm3fNxgM0GVWKJArI43i+NlelX4GcHnQUJZOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbYaxwM14q7Egt/dCnjQv4at3Hl7eUMDD4TDsA4RFRE=;
 b=ZOhr8gfzWL8sRtEzMCVVV050N39Q0dKIoiONL3plV8GYqF7G93aypF+PXFc+zw77fAcb18AIlwXxxrkkZazMdEapmzBR2XZt6bwuo0XNUDvaoEaibubwRKNLpJ7/kE+m/29jl+Fr+rBkR3rNaZi5R0cWJlImLytgMcNMwL116zo=
Received: from BLAP220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::16)
 by PH7PR12MB6936.namprd12.prod.outlook.com (2603:10b6:510:1ba::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 16:38:00 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::3f) by BLAP220CA0011.outlook.office365.com
 (2603:10b6:208:32c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Thu,
 16 Oct 2025 16:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 16:37:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 16 Oct
 2025 09:37:59 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Oct
 2025 11:37:59 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 09:37:58 -0700
Message-ID: <67e8e444-6eb8-97db-4088-bf618b7b6df6@amd.com>
Date: Thu, 16 Oct 2025 09:37:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Support getting last hardware error
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251014234119.628453-1-lizhi.hou@amd.com>
 <4e64ba7c-18d6-42e0-8fb1-dc03ae0cfbd7@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4e64ba7c-18d6-42e0-8fb1-dc03ae0cfbd7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH7PR12MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8ce742-8507-4f39-1ef9-08de0cd25e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTdBa2k4TUwvMHQ3b2E3dHR3UTk3MkJBYnp1L25Cck1aTGdWclU3eVoxK1dH?=
 =?utf-8?B?ZzVaZGlnSy9wMW05eFRMMDlHTmNNY2JSM2hOeHF0TGc3d2NZR0htRnU1SUpZ?=
 =?utf-8?B?MmtHa0U2TDliNmRsL2EyUGlobjdqb0VybVFnYmxNRnYvaElqN1pPMFFtN2hM?=
 =?utf-8?B?NGpTNlQvdnRSQ1hLcS9xVjRkNXdlVUpSWGUrYTBQMXBSSVEyUEJiQUtJN3kz?=
 =?utf-8?B?ZUtGRkUvYTR5eTBreTZsK2h5VXRJbU1kRmY3S1FBQ3NHVVJtTnpqc2xzekQ0?=
 =?utf-8?B?bWI2Q0RLWityblRJdFc4SmJIVnJ5WGw5MFJrUUJCYU54WnMvcVY5UzVueXlV?=
 =?utf-8?B?T3g5dFFVYkFLTWlXSnNFQ3IyT1p0V2dFTDdVMnRwREpDL2JhYTY1REFKVnlq?=
 =?utf-8?B?cVhmSDVIVVFpdE1ybHlQTy9jeE05aENZNFBTWmt2NjY2Y0l6L2pSazBVc0dL?=
 =?utf-8?B?US9yS3QvMUt0SWZxcU90WmdCTWI4NCszNytialp1WEtIMnpBb3dJZXJyUWRm?=
 =?utf-8?B?bmxjV0Z4NGJxK0Npb2hpQzBKa0RlM2IxdWQ0eW1BdWU0MHRBdDIzRWVxc3Fp?=
 =?utf-8?B?SEdSTXJBUlp2dXdvM1FGOXV2cDRuWk1Yajd0N0ZQanlLUkZpNlR0M2R2T081?=
 =?utf-8?B?TUxVQ3ZYUmVwUlNTd2pvVk1DMW9qZjg2T2NHaUZjUUlSYkkxSkpkOTR6MUQy?=
 =?utf-8?B?YU9aVUM0YzB2UWNWM1FOK0grQ1BNOUpGTlcvd0Y4Ymk1NmxtY3BveDNWZy9Q?=
 =?utf-8?B?YU0zZSt2ekMzdVVhUGpaUGxPWFVjTTczNXBEN1NJcytlN2pNQmZTNW14M0Jt?=
 =?utf-8?B?aWFmc1NsdlVlVWJNaWJQek5WYzFudDlDYTFtSGxIUmQya0ZXL2Rxb2dVeWs2?=
 =?utf-8?B?S1dtWTdpVFZPQmRRZXVQc3Q1VFpaL1p3U016eXljbys5KzkwbmNkMDhBSEVX?=
 =?utf-8?B?djhaQ2NmUzJVSjB4UDlhcWYrM3kreUltZ1c5cGNRT3d0Zm9TSDBkSzFhYkpR?=
 =?utf-8?B?MnNaU3d0bTFWcFJadi9OZjE3Z2ZDOHo5cTZtc05wQlFndTJ4MHBqV3lZYURu?=
 =?utf-8?B?YWE3L0VlTlcycFpCQlVOT09tdVppY1NFQUQ0VWtNaDNKaVQzejM2T1ZubmM5?=
 =?utf-8?B?MmYrZXRrQzY1SS8vaTZQQVpsb0ppY09KNDlDL2J5MU0yVzJWc3ZXQndzSGU0?=
 =?utf-8?B?L0tFR3FaT2hDQjQ0R3kxbjR5RS9pUG1Wd0gya3RlQzJFT202YkxKMXI2OSt1?=
 =?utf-8?B?UmpqWUFZWDZtdUJoVHAvNWpER1hvUnNCMjNRR3RBMXVOMVJMdVhURStvWUp4?=
 =?utf-8?B?YVRJUmpaM2Z1NzNOd2tUZFcxNThvTmNjV0lsVmZQVXpNNkdJUDdVQXF2T0gr?=
 =?utf-8?B?WkxwZ2p2ak43VC8rSW9CVUJMNGVNSDNaWHpubnRMOGIycDhaT3grVTJJTk9u?=
 =?utf-8?B?aEVzd0RoTU9FeTNrSTJ1Rjh4TFJaNWVyenRKc1hnY3FlbkR2R05oemJHU1M4?=
 =?utf-8?B?NzI3ZE9USWZ0aE4zM1djbnNHV0EwWFVzUERnRW9yeUs5bGt4VTVkY3AzWnJ2?=
 =?utf-8?B?bUUvUnRGRVNCQnNnMFNBWEZlQUU1N3QzbDh1NUxPT2w1VFVjclJ0MW5EMEJh?=
 =?utf-8?B?YXB4RTkyOENueG9HKzIvZ1lWUmVXVG5rczlKUHFIVDVjd2tIUEx3NzJQWS9Q?=
 =?utf-8?B?ZExDdFhoZXFRM1FJWlUzdmR0V2pwcWFzRjhscHg1RkRQUnZOaHJ1enBmbFl4?=
 =?utf-8?B?dGNzYmx3cmZtUUtPRjBUOHc1OUlsTGRaNUZTdGc2OVY4ZlFRUktmWHUrSHM2?=
 =?utf-8?B?ZUJDOEFwN3FOSk53R3FwYnhLN1hjdlRFR2dsU2NNbVV5bitXajBYdzNyUlNz?=
 =?utf-8?B?R1orSHZEQzRZUzlvamJIbkZTdlV5RWdkR3hnVEd4bzAzdUpENFlrelZUcjND?=
 =?utf-8?B?cDJYWTltYnZzcU1ZcTloU25QU1RpS2ZwbVd5NWNyeUY5Qnpvb1QzLzlGbUZz?=
 =?utf-8?B?WEx2Y0pFRjF3bkpyU0lzTFA4SUZBR3ovajlYRlhtc2hJL1VOa00zMTZoN3ZC?=
 =?utf-8?B?TEZGc1piTFNEVi9EWndxUmcva1FQMEErVnN3VWliejJWZFhjMUw2MDV4VEFT?=
 =?utf-8?Q?Rltc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:37:59.8306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8ce742-8507-4f39-1ef9-08de0cd25e59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6936
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

Applied to drm-misc-next

On 10/15/25 06:42, Mario Limonciello wrote:
> On 10/14/25 6:41 PM, Lizhi Hou wrote:
>> Add new parameter DRM_AMDXDNA_HW_LAST_ASYNC_ERR to get array IOCTL. When
>> hardware reports an error, the driver save the error information and
>> timestamp. This new get array parameter retrieves the last error.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>> ---
>>   drivers/accel/amdxdna/aie2_error.c      | 95 ++++++++++++++++++++-----
>>   drivers/accel/amdxdna/aie2_pci.c        |  3 +
>>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>>   drivers/accel/amdxdna/amdxdna_error.h   | 59 +++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>>   include/uapi/drm/amdxdna_accel.h        | 13 ++++
>>   6 files changed, 159 insertions(+), 19 deletions(-)
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
>>
>> diff --git a/drivers/accel/amdxdna/aie2_error.c 
>> b/drivers/accel/amdxdna/aie2_error.c
>> index 5ee905632a39..d452008ec4f4 100644
>> --- a/drivers/accel/amdxdna/aie2_error.c
>> +++ b/drivers/accel/amdxdna/aie2_error.c
>> @@ -13,6 +13,7 @@
>>     #include "aie2_msg_priv.h"
>>   #include "aie2_pci.h"
>> +#include "amdxdna_error.h"
>>   #include "amdxdna_mailbox.h"
>>   #include "amdxdna_pci_drv.h"
>>   @@ -46,6 +47,7 @@ enum aie_module_type {
>>       AIE_MEM_MOD = 0,
>>       AIE_CORE_MOD,
>>       AIE_PL_MOD,
>> +    AIE_UNKNOWN_MOD,
>>   };
>>     enum aie_error_category {
>> @@ -143,6 +145,31 @@ static const struct aie_event_category 
>> aie_ml_shim_tile_event_cat[] = {
>>       EVENT_CATEGORY(74U, AIE_ERROR_LOCK),
>>   };
>>   +static const enum amdxdna_error_num aie_cat_err_num_map[] = {
>> +    [AIE_ERROR_SATURATION] = AMDXDNA_ERROR_NUM_AIE_SATURATION,
>> +    [AIE_ERROR_FP] = AMDXDNA_ERROR_NUM_AIE_FP,
>> +    [AIE_ERROR_STREAM] = AMDXDNA_ERROR_NUM_AIE_STREAM,
>> +    [AIE_ERROR_ACCESS] = AMDXDNA_ERROR_NUM_AIE_ACCESS,
>> +    [AIE_ERROR_BUS] = AMDXDNA_ERROR_NUM_AIE_BUS,
>> +    [AIE_ERROR_INSTRUCTION] = AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
>> +    [AIE_ERROR_ECC] = AMDXDNA_ERROR_NUM_AIE_ECC,
>> +    [AIE_ERROR_LOCK] = AMDXDNA_ERROR_NUM_AIE_LOCK,
>> +    [AIE_ERROR_DMA] = AMDXDNA_ERROR_NUM_AIE_DMA,
>> +    [AIE_ERROR_MEM_PARITY] = AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
>> +    [AIE_ERROR_UNKNOWN] = AMDXDNA_ERROR_NUM_UNKNOWN,
>> +};
>> +
>> +static_assert(ARRAY_SIZE(aie_cat_err_num_map) == AIE_ERROR_UNKNOWN + 
>> 1);
>> +
>> +static const enum amdxdna_error_module aie_err_mod_map[] = {
>> +    [AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
>> +    [AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
>> +    [AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
>> +    [AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
>> +};
>> +
>> +static_assert(ARRAY_SIZE(aie_err_mod_map) == AIE_UNKNOWN_MOD + 1);
>> +
>>   static enum aie_error_category
>>   aie_get_error_category(u8 row, u8 event_id, enum aie_module_type 
>> mod_type)
>>   {
>> @@ -176,12 +203,40 @@ aie_get_error_category(u8 row, u8 event_id, 
>> enum aie_module_type mod_type)
>>           if (event_id != lut[i].event_id)
>>               continue;
>>   +        if (lut[i].category > AIE_ERROR_UNKNOWN)
>> +            return AIE_ERROR_UNKNOWN;
>> +
>>           return lut[i].category;
>>       }
>>         return AIE_ERROR_UNKNOWN;
>>   }
>>   +static void aie2_update_last_async_error(struct amdxdna_dev_hdl 
>> *ndev, void *err_info, u32 num_err)
>> +{
>> +    struct aie_error *errs = err_info;
>> +    enum amdxdna_error_module err_mod;
>> +    enum aie_error_category aie_err;
>> +    enum amdxdna_error_num err_num;
>> +    struct aie_error *last_err;
>> +
>> +    last_err = &errs[num_err - 1];
>> +    if (last_err->mod_type >= AIE_UNKNOWN_MOD) {
>> +        err_num = aie_cat_err_num_map[AIE_ERROR_UNKNOWN];
>> +        err_mod = aie_err_mod_map[AIE_UNKNOWN_MOD];
>> +    } else {
>> +        aie_err = aie_get_error_category(last_err->row,
>> +                         last_err->event_id,
>> +                         last_err->mod_type);
>> +        err_num = aie_cat_err_num_map[aie_err];
>> +        err_mod = aie_err_mod_map[last_err->mod_type];
>> +    }
>> +
>> +    ndev->last_async_err.err_code = AMDXDNA_ERROR_ENCODE(err_num, 
>> err_mod);
>> +    ndev->last_async_err.ts_us = ktime_to_us(ktime_get_real());
>> +    ndev->last_async_err.ex_err_code = 
>> AMDXDNA_EXTRA_ERR_ENCODE(last_err->row, last_err->col);
>> +}
>> +
>>   static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void 
>> *err_info, u32 num_err)
>>   {
>>       struct aie_error *errs = err_info;
>> @@ -264,29 +319,14 @@ static void aie2_error_worker(struct 
>> work_struct *err_work)
>>       }
>>         mutex_lock(&xdna->dev_lock);
>> +    aie2_update_last_async_error(e->ndev, info->payload, 
>> info->err_cnt);
>> +
>>       /* Re-sent this event to firmware */
>>       if (aie2_error_event_send(e))
>>           XDNA_WARN(xdna, "Unable to register async event");
>>       mutex_unlock(&xdna->dev_lock);
>>   }
>>   -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev)
>> -{
>> -    struct amdxdna_dev *xdna = ndev->xdna;
>> -    struct async_event *e;
>> -    int i, ret;
>> -
>> -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -    for (i = 0; i < ndev->async_events->event_cnt; i++) {
>> -        e = &ndev->async_events->event[i];
>> -        ret = aie2_error_event_send(e);
>> -        if (ret)
>> -            return ret;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
>>   {
>>       struct amdxdna_dev *xdna = ndev->xdna;
>> @@ -341,6 +381,10 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>           e->size = ASYNC_BUF_SIZE;
>>           e->resp.status = MAX_AIE2_STATUS_CODE;
>>           INIT_WORK(&e->work, aie2_error_worker);
>> +
>> +        ret = aie2_error_event_send(e);
>> +        if (ret)
>> +            goto free_wq;
>>       }
>>         ndev->async_events = events;
>> @@ -349,6 +393,8 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>            events->event_cnt, events->size);
>>       return 0;
>>   +free_wq:
>> +    destroy_workqueue(events->wq);
>>   free_buf:
>>       dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>                    events->addr, DMA_FROM_DEVICE);
>> @@ -356,3 +402,18 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>       kfree(events);
>>       return ret;
>>   }
>> +
>> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev, struct 
>> amdxdna_drm_get_array *args)
>> +{
>> +    struct amdxdna_dev *xdna = ndev->xdna;
>> +
>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> +
>> +    args->num_element = 1;
>> +    args->element_size = sizeof(ndev->last_async_err);
>> +    if (copy_to_user(u64_to_user_ptr(args->buffer),
>> +             &ndev->last_async_err, args->element_size))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 8a66f276100e..cfca4e456b61 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -924,6 +924,9 @@ static int aie2_get_array(struct amdxdna_client 
>> *client,
>>       case DRM_AMDXDNA_HW_CONTEXT_ALL:
>>           ret = aie2_query_ctx_status_array(client, args);
>>           break;
>> +    case DRM_AMDXDNA_HW_LAST_ASYNC_ERR:
>> +        ret = aie2_get_array_async_error(xdna->dev_handle, args);
>> +        break;
>>       default:
>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>>           ret = -EOPNOTSUPP;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index 289a23ecd5f1..34bc35479f42 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -190,6 +190,8 @@ struct amdxdna_dev_hdl {
>>         enum aie2_dev_status        dev_status;
>>       u32                hwctx_num;
>> +
>> +    struct amdxdna_async_error    last_async_err;
>>   };
>>     #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
>> @@ -253,8 +255,9 @@ void aie2_psp_stop(struct psp_device *psp);
>>   /* aie2_error.c */
>>   int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
>>   void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev);
>> -int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev);
>>   int aie2_error_async_msg_thread(void *data);
>> +int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
>> +                   struct amdxdna_drm_get_array *args);
>>     /* aie2_message.c */
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>> diff --git a/drivers/accel/amdxdna/amdxdna_error.h 
>> b/drivers/accel/amdxdna/amdxdna_error.h
>> new file mode 100644
>> index 000000000000..c51de86ec12b
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_error.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _AMDXDNA_ERROR_H_
>> +#define _AMDXDNA_ERROR_H_
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>> +#define AMDXDNA_ERR_DRV_AIE        4
>> +#define AMDXDNA_ERR_SEV_CRITICAL    3
>> +#define AMDXDNA_ERR_CLASS_AIE        2
>> +
>> +#define AMDXDNA_ERR_NUM_MASK        GENMASK_U64(15, 0)
>> +#define AMDXDNA_ERR_DRV_MASK        GENMASK_U64(23, 16)
>> +#define AMDXDNA_ERR_SEV_MASK        GENMASK_U64(31, 24)
>> +#define AMDXDNA_ERR_MOD_MASK        GENMASK_U64(39, 32)
>> +#define AMDXDNA_ERR_CLASS_MASK        GENMASK_U64(47, 40)
>> +
>> +enum amdxdna_error_num {
>> +    AMDXDNA_ERROR_NUM_AIE_SATURATION = 3,
>> +    AMDXDNA_ERROR_NUM_AIE_FP,
>> +    AMDXDNA_ERROR_NUM_AIE_STREAM,
>> +    AMDXDNA_ERROR_NUM_AIE_ACCESS,
>> +    AMDXDNA_ERROR_NUM_AIE_BUS,
>> +    AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
>> +    AMDXDNA_ERROR_NUM_AIE_ECC,
>> +    AMDXDNA_ERROR_NUM_AIE_LOCK,
>> +    AMDXDNA_ERROR_NUM_AIE_DMA,
>> +    AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
>> +    AMDXDNA_ERROR_NUM_UNKNOWN = 15,
>> +};
>> +
>> +enum amdxdna_error_module {
>> +    AMDXDNA_ERROR_MODULE_AIE_CORE = 3,
>> +    AMDXDNA_ERROR_MODULE_AIE_MEMORY,
>> +    AMDXDNA_ERROR_MODULE_AIE_SHIM,
>> +    AMDXDNA_ERROR_MODULE_AIE_NOC,
>> +    AMDXDNA_ERROR_MODULE_AIE_PL,
>> +    AMDXDNA_ERROR_MODULE_UNKNOWN = 8,
>> +};
>> +
>> +#define AMDXDNA_ERROR_ENCODE(err_num, err_mod)                \
>> +    (FIELD_PREP(AMDXDNA_ERR_NUM_MASK, err_num) |            \
>> +     FIELD_PREP_CONST(AMDXDNA_ERR_DRV_MASK, AMDXDNA_ERR_DRV_AIE) |    \
>> +     FIELD_PREP_CONST(AMDXDNA_ERR_SEV_MASK, 
>> AMDXDNA_ERR_SEV_CRITICAL) | \
>> +     FIELD_PREP(AMDXDNA_ERR_MOD_MASK, err_mod) |            \
>> +     FIELD_PREP_CONST(AMDXDNA_ERR_CLASS_MASK, AMDXDNA_ERR_CLASS_AIE))
>> +
>> +#define AMDXDNA_EXTRA_ERR_COL_MASK    GENMASK_U64(7, 0)
>> +#define AMDXDNA_EXTRA_ERR_ROW_MASK    GENMASK_U64(15, 8)
>> +
>> +#define AMDXDNA_EXTRA_ERR_ENCODE(row, col)                \
>> +    (FIELD_PREP(AMDXDNA_EXTRA_ERR_COL_MASK, col) |            \
>> +     FIELD_PREP(AMDXDNA_EXTRA_ERR_ROW_MASK, row))
>> +
>> +#endif /* _AMDXDNA_ERROR_H_ */
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index aa04452310e5..696fdac8ad3c 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -27,9 +27,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>   /*
>>    * 0.0: Initial version
>>    * 0.1: Support getting all hardware contexts by 
>> DRM_IOCTL_AMDXDNA_GET_ARRAY
>> + * 0.2: Support getting last error hardware error
>>    */
>>   #define AMDXDNA_DRIVER_MAJOR        0
>> -#define AMDXDNA_DRIVER_MINOR        1
>> +#define AMDXDNA_DRIVER_MINOR        2
>>     /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>> use the
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index a1fb9785db77..c7eec9ceb2ae 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -523,7 +523,20 @@ struct amdxdna_drm_hwctx_entry {
>>       __u32 pad;
>>   };
>>   +/**
>> + * struct amdxdna_async_error - XDNA async error structure
>> + */
>> +struct amdxdna_async_error {
>> +    /** @err_code: Error code. */
>> +    __u64 err_code;
>> +    /** @ts_us: Timestamp. */
>> +    __u64 ts_us;
>> +    /** @ex_err_code: Extra error code */
>> +    __u64 ex_err_code;
>> +};
>> +
>>   #define DRM_AMDXDNA_HW_CONTEXT_ALL    0
>> +#define DRM_AMDXDNA_HW_LAST_ASYNC_ERR    2
>>     /**
>>    * struct amdxdna_drm_get_array - Get information array.
>
