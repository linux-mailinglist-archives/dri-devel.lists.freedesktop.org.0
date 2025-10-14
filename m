Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D262ABDBA27
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ED010E245;
	Tue, 14 Oct 2025 22:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FDSFyP+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B610E245
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uy2SnrmKkqc5bqAsTtMeduQWLhpK0kMT4vPod2ktEUZ7SwJnylwAthQ6GMKW8IwMCMtly5TTORBHaOYkB+csGRUD7KAAxyiAow9Y6elWSaP2L65A9N0W2bSsHlCCScPB8Q3EyBkOsoEfaWWHQdSjtDAzN+/KEdTA1xBOzhjOp+ps9rWhCAHi9MCqP6RnwFhkaD2RFb/Iq0Z3P2kAXt8Ko3IbGPXptL4GeVRniOjAT6yuIN3E+A0fD1sgBWsRtOXy6hRX+4Vd6rtoOv9EIfEUcHDVSS0KMT5W0qYjuxlIOQpNw6iC4xm8GZNCShtdB5lg3ZZ9xXtZIK1CE0Nc6jcd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBdXOxougaUa8TSUH7QBIlhtDeYYMIIQ4qZucwAAJS0=;
 b=FH85WqoUU2lZDS+PlxkUepQe9bG6MrkBMgqIoC0vZnzH3d1/nIZEJMtNbogG0fsJ8GqKVnTcN3AdgJjmenvxlDPlEszWBZ0xrS7s1P/GCoCB9zAcSS0DCKiN4TlYI/wh0zgJM3SwsaGPJ8J1bbTVRMhM8t7t+lk3WTj4MN6Mrf5Do3CdCQz0rlv0jGZvuHxNy43Eio02nZJ1ywY9jAOLwD6rAYFlXuBp4G4nVyqD+bBlhAFz4P9MRi2L6PYNAnngYncDarnjWKUn0xsDjhqe9P7ksCRjKM7+3/oXYxgHJRGw1jFQBdEqBHDJTFYEWKPNpdKTtuR4DKrTl4Jz0mFObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBdXOxougaUa8TSUH7QBIlhtDeYYMIIQ4qZucwAAJS0=;
 b=FDSFyP+GTyy9V7jRML/ewsQRIC4UyFY2GML/8QgncaDKGKzAkqe23cmg+2CEJVFVh7npY1sAup4x3wktX9KvZpHSSUvygccsaubS404rGdnhtGzncMCU8MqIcspNSHi9n2vjUkAjmrb9AwTBiNt766TMLE40RRFHGPBkuhtM8ko=
Received: from MN2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:208:23c::19)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6dd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 22:23:06 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::7a) by MN2PR18CA0014.outlook.office365.com
 (2603:10b6:208:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 22:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 22:23:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Oct
 2025 15:23:04 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Oct
 2025 17:23:04 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Oct 2025 15:23:04 -0700
Message-ID: <0d03768b-60ae-0f65-c92f-9d9ec584710c@amd.com>
Date: Tue, 14 Oct 2025 15:23:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support getting last hardware error
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251014170130.601390-1-lizhi.hou@amd.com>
 <2d8cbb22-db99-4af0-bb36-940772880229@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <2d8cbb22-db99-4af0-bb36-940772880229@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dfceff-8e1e-4ebb-9b92-08de0b703f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWlXOFlLSFAxY3YzdWh4M0Q2Q0pFYWhYNmR4RFdDUm51QlZjOVhNWVdRdWth?=
 =?utf-8?B?RkcwU1pLcGVJa3pkbkFSbEp3NlZvSG1jRUVlRHBHTzh2dmg1cVRxalBXU1FD?=
 =?utf-8?B?SXI4MkJHWFN0Z0hieWVNNHFDWEVEQzJxN3ZmeHlHRUpjM0tPVngyaHpJTUh2?=
 =?utf-8?B?SXRqRytEdFhnanVFRkNtOFFQZk92dkVXUk9lRXBhZEZoZEZnRllxMXNDSS9p?=
 =?utf-8?B?YkFXMUcvZllOdG1pbmpZOGYzakwvekIxb1RKdG01TmVXTDM3S1RqM00vWFgv?=
 =?utf-8?B?cFN6VEt6bm1RbFlLQ2hkUTZoK3lqaCtvMlRWWTkxak42bXJMSnZoNXphQmdO?=
 =?utf-8?B?ajI4Uy9kdmZic2l2UGdHYmxPbHFwRXZWU29vUWVJVVRPZUU0OUlJaUlrOVVK?=
 =?utf-8?B?V3pzOWlkWW00OEVkT3g1cWlaMHlIVkdlY1ZuYkFWT3huVWxydDEyN0lyTitk?=
 =?utf-8?B?citCY2orWFRNeFhQdTV6aWJFUEMvRGM0SjdvdllOemMwenVWUFh4MTZLQWpQ?=
 =?utf-8?B?ZEY0MG5CYVFCRzNaK2kybzhRayt0ZFVRdVVncjJReDhXV2JoVVgva2tnR2ZP?=
 =?utf-8?B?bFNyMlJpNjhSejBqTUhRanZvNmYwUGZvVGlxSW5YMGdqcmRJUXNpVG1UeEtI?=
 =?utf-8?B?ZUQ5dGp1RmluL0Q5TzBHWE1TdUwwVVAvNlRvVGE1V3hTYXpkZXRiOWtkRUZE?=
 =?utf-8?B?SWJPQmNOejNpSjBQUFJZYU1VSHRoeFl0a1NlVGpYR3RQZDlac3lCMUJGSzJi?=
 =?utf-8?B?ZXVqZUdxTHdNQ1drM2lMa2pDN0tidVFpdGdnb2JFUjZIT09rZ0NsNVc3UFJi?=
 =?utf-8?B?NmhJVGVQOFFrYjFhTHVxVTZ5Vi9HYXhjVmJtSjY1emx5V2xrNG5Kejhac2FM?=
 =?utf-8?B?YVBjV2d2dnAyK2ZYSXI2VnRnTmtVS1diWHlqWGVPSDQzcExiWGVnNzI3VmVL?=
 =?utf-8?B?T2ZTQ3RKMGdjVGg5MEQvcDJzUVlzaGlVNklFa2ltRG1sWVRtMFRVYXRoRVlR?=
 =?utf-8?B?bWRzMEdyM1RGZE5aRnNVNzdKS2VkeDkxcVI5NjhRRHRXY2J0WEhOM2drZHVK?=
 =?utf-8?B?YWRhaVFaT1EzWGdNUy9MTmwwUEVBbmtvTmdEOG9Fc3dwcW1FOUsyeFFINjlI?=
 =?utf-8?B?dDJqcFZJR3ZsdGlKYjdySGtBNTFKWHA4WDV6amhLeHllU3RHQ2M1b3oybk1X?=
 =?utf-8?B?RnJRQ21xLzE5Y1RGdlVlb0VUSkVtWFc1ZWJabWsyTWFLU2I4bGNISHZmZ3FO?=
 =?utf-8?B?R3l2K1ZLTWRvcWhuMmZPcnd6aWlreFc4TU43K2pyWjAxVURIeWtyUitPWmJq?=
 =?utf-8?B?MzlNNnkyMHozeUJ6bEVHcy9sU1J1ODRxMGdYWkRZVWZ3OXFOeXhPWnl6VnMv?=
 =?utf-8?B?eVFTTXJzZnorQlQxNVprNXM4cWhZQWFoS1o0cGlEaHlPZ3ZwVmlIODc4UDBX?=
 =?utf-8?B?dngyenZZa3BGVTU4Uy9RNkJhV2pFdkQvWWQ1eVQ5WTluV1NmOU00UEI0bm5X?=
 =?utf-8?B?bHlxeWhva0pTQjVFSDRBTElLVENyTzE2MUQyUHJBNGp3U0t5Z3hTdHJ0L2Uv?=
 =?utf-8?B?MmVtSVMxZWxZU1NCeW9iWVk3bmRUaVpjdW4rM2Rrcm9sSUFtWXA3VFp0ODA0?=
 =?utf-8?B?ZDdmQmYrNkU0a2VPL2RPWEtWczdQSTVUWDIzb3gxMFZmSVFhYnBUSjRUNjd0?=
 =?utf-8?B?Sm00SDRlcEdWYTU0WlhoUXZ5Qm94bnk1bHhMcUxpK1ZwSlRDMDB4S3Ivb29P?=
 =?utf-8?B?YXdhYklXazRMRDArMVdibGRyZkdnV25uU3BLbis0OUNtbVZXZG9mU3EwZEQ0?=
 =?utf-8?B?NlZkOW1vYmpZNEZrc2lHeHlRZWYvUVFYT2FWME1sVWxiMHowSWl2Rm55cXY3?=
 =?utf-8?B?UEdVZUxDWENjK05VcnljQVN6UGYySHJDa24ySUY3NlZkSFhPUzkwbkMyOEdI?=
 =?utf-8?B?SnZCRkZram1pL0xZNDBCVXRYTDJqUW03TStabVRGSFBIdmJiRWk1SWhoU2dw?=
 =?utf-8?B?Y01EN3ZiQjlUNVRTZXI3WFladU9HUHlqQ0Q1OEx6M0REYnhoeFJlQUd6QTln?=
 =?utf-8?B?eHNXT21Qc1dKK1NsSSthNUYzVENuakt4eHdESHBZUzIwVFIwUHFPL09hdjhl?=
 =?utf-8?Q?VGGQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 22:23:06.0940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dfceff-8e1e-4ebb-9b92-08de0b703f6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B
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


On 10/14/25 15:05, Mario Limonciello wrote:
>
>
> On 10/14/2025 12:01 PM, Lizhi Hou wrote:
>> Add new parameter DRM_AMDXDNA_HW_LAST_ASYNC_ERR to get array IOCTL. When
>> hardware reports an error, the driver save the error information and
>> timestamp. This new get array parameter retrieves the last error.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_error.c      | 91 ++++++++++++++++++++-----
>>   drivers/accel/amdxdna/aie2_pci.c        |  3 +
>>   drivers/accel/amdxdna/aie2_pci.h        |  5 +-
>>   drivers/accel/amdxdna/amdxdna_error.h   | 59 ++++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>>   include/uapi/drm/amdxdna_accel.h        | 13 ++++
>>   6 files changed, 155 insertions(+), 19 deletions(-)
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_error.h
>>
>> diff --git a/drivers/accel/amdxdna/aie2_error.c 
>> b/drivers/accel/amdxdna/aie2_error.c
>> index 5ee905632a39..976f5f0ea308 100644
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
>> @@ -143,6 +145,27 @@ static const struct aie_event_category 
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
>
> I think it would be good to add:
>
> static_assert(ARRAY_SIZE(aie_cat_err_num_map) == AIE_ERROR_UNKNOWN);
>
>> +
>> +static const enum amdxdna_error_module aie_err_mod_map[] = {
>> +    [AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
>> +    [AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
>> +    [AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
>> +    [AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
>> +};
>
> Same thing here for a static assert.

Sure, I will add assert for both arrays.

Thanks,

Lizhi

>
>> +
>>   static enum aie_error_category
>>   aie_get_error_category(u8 row, u8 event_id, enum aie_module_type 
>> mod_type)
>>   {
>> @@ -176,12 +199,40 @@ aie_get_error_category(u8 row, u8 event_id, 
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
>> @@ -264,29 +315,14 @@ static void aie2_error_worker(struct 
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
>> @@ -341,6 +377,10 @@ int aie2_error_async_events_alloc(struct 
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
>> @@ -349,6 +389,8 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>            events->event_cnt, events->size);
>>       return 0;
>>   +free_wq:
>> +    destroy_workqueue(events->wq);
>>   free_buf:
>>       dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>                    events->addr, DMA_FROM_DEVICE);
>> @@ -356,3 +398,18 @@ int aie2_error_async_events_alloc(struct 
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
