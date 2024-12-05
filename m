Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D8A9E4D35
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 06:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514F610E384;
	Thu,  5 Dec 2024 05:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pnkiwiOf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE7110E384
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 05:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjUsrVVM+Kxvi3f85VjhdEY5d1TOP5mhAIdpBOY3pYj7vLyaw7m1I/pSA3TTqH98xUIzFxWbin4OK5qpKQn2Q+uc/AiK3bdRIuHD64aeBCeGLIp44iTL5fVjEoJfEKbdqjC2E69qZGvoH8s1oJoaZf+0aS9QwFO99rPoKceORo++09I6IbAVBOhqUVOx7VR/xn6lIsfzcSd12qYZsx6P1vDP+5FmRnbUJwL2p0tBieHntSqYOtKhYwrDhQ2YzXDCRPuYpHfJwdFRQHunqPv4CmWsudA1gLxIPtwNOAh+UuRvl7uWnJuGPtNzAO8NE/5tmW6bAfN8r9X1I54EgGDM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHUuIezHA9lRAxfqwCSt7QcFPFI728tChcboZ4jqCEE=;
 b=jP+zjKuUD0VYxyh70C9k8X3YBm6HHs0ZlccrJcNjaZgStXXPYV2qC1y9i9XNnCKV63KgQMzE3qVAGJ2LfRlMpegwamrvksy+pxv4JGqSiZcoRIa1cTepJ5Z9AZsPEvAhaq0u4puQfUgREWwG+e0e7dSA1y8bDoJKHrRpFnaf2QBSx3iu5ju9hqFfGGoQS2yPyVJ647ezGnHRIgY03SJARC56ERJZd9g6JOOqCl9kxfuqE1BIIFz4De3W0Xu+gcvEb8wOrYURSBMQFYsICoSh1Feen8207m7iiUAqZs1Lm2YWXVw4D9VM2KGFrAdnvrZ5Eh6RoKBTDBn6yrNlifgX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHUuIezHA9lRAxfqwCSt7QcFPFI728tChcboZ4jqCEE=;
 b=pnkiwiOfEOTMASvWDFf3gfBJ3kS0KJCGsFScu/203PrtV5nTfJrcZnWX/SofOHF22ICpstlrsdA5cJRyrAMB23lCefgCfqzSAGJDawggcZc9crSCivYYj4r2hGN05rLo4u8w10ONVompT8+ZyEof/ENqLe95lTLMZkTyHhjLdM0=
Received: from DM6PR06CA0067.namprd06.prod.outlook.com (2603:10b6:5:54::44) by
 SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Thu, 5 Dec
 2024 05:14:35 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:54:cafe::d4) by DM6PR06CA0067.outlook.office365.com
 (2603:10b6:5:54::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 05:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:14:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 23:14:34 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 23:14:33 -0600
Message-ID: <7741c649-3897-fabb-ee1c-e12c62e4ccfa@amd.com>
Date: Wed, 4 Dec 2024 21:14:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 5/7] accel/amdxdna: Add query firmware version
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
 <20241204213729.3113941-6-lizhi.hou@amd.com>
 <4f233efa-8269-4f6f-bd22-0dcf2810c4ab@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4f233efa-8269-4f6f-bd22-0dcf2810c4ab@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SA1PR12MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c20750-978c-48cc-8969-08dd14ebb5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWFOc1NpOWE1bTQxeGlVcnZBRXRZSFN1ZFR3L0Vxckw5cE92ajF0U3BYR0ZL?=
 =?utf-8?B?NnVUdlp2ZHNuWHNXcytnMWV0T1BpeVQ4Rjg3Tmx3OGcvUjRNYXVwdVE3YVBU?=
 =?utf-8?B?TjhiRTlLSDFxZVpDU1AxaFF6T2U5Nk90QW1FdmJSZDc0U0VpZEhQMXcyVXlx?=
 =?utf-8?B?UVlkTG50YWZRSjI3YUZ2bEt6aG0yN2tPQUZveXlBeW54a2drTFNJc01wdVFr?=
 =?utf-8?B?aWhTaUFwMncwVFlpRDdTdGJNVys0M2dMS0hGWGE5cndiVG5DZU1KYm5FRTNV?=
 =?utf-8?B?UlZTMnNRNHFUaGtHTWU3cFNTaGdTSkl4UzdnT1VLRkg1Tm85MUVnUVdKNllF?=
 =?utf-8?B?eDBFNHl3M0lFd0QzNEk5QzRzalJWejZ5eFFmT2J4ZURyVWtIR2h6N2xiYlQ0?=
 =?utf-8?B?MUt4cStpL1JaNEgrd094dVdFNGVGTFNvVEV3WHd5eFVHbUR0SEdSRVovbC9m?=
 =?utf-8?B?Vm5YT1dFMUpyemIxeVpIZTErR3NGZXIzdmpkZjhqRlNBMlNIQ3BiZTU5aXBv?=
 =?utf-8?B?bmVwU094WGxHeGs1MUVETllEZXBPL05XTnFJNHh6VUs4Ti9Lc2htMUpzNGNV?=
 =?utf-8?B?bnhQQy9COW9VR3FQMm9yWDNuU2RPNmg1c0M2QkpEQVY4TzBYYzJXYTNmQ25M?=
 =?utf-8?B?bXlRejd3ZlNySnhXaXRRVjBpdHBtZ1I5Q0FaVFRhWk5pdExJZFpPc2NNR3R3?=
 =?utf-8?B?TEd6Rm9HNTFXd0FYODZlTldianNQaFR5UG1xc2kvenZURzlSc2k5b2NXN3Vz?=
 =?utf-8?B?ZGd5cG14eHQ5SU1XT2IxYzRvT2R5S1dqU2lIdVBmRTIyVTZYMmxDSzRacTRq?=
 =?utf-8?B?cUtBYmU5a21LZmtCKzVpOTFHcndVelR3TExRM2s0VGVjOTdKY09Fb2Z1REJO?=
 =?utf-8?B?N25KR2NRRHdqMEpOV0ZKdDl6ejFISkkrS3pJaFJBblNTbXh0cE9HWjRaZWd6?=
 =?utf-8?B?N2NpcE4zb2YwckxyTjllT1pPQWIxN08xU2tGUUFHeFFFZUozRW1xYXNZOGw1?=
 =?utf-8?B?TWdQMW1jaHVXNDJ6QzRCMXFHZjdRdG5SWlVjUFo0czZaZVJSeUVzaG1jVDBY?=
 =?utf-8?B?VXpIeFQ1T0QwK25BNmtkK08wYjBHZlYxMnFrNXdLQlBkMExMRXhIVmQvekth?=
 =?utf-8?B?N2xPWVc1cmFiT1Q0Z1BaL1JBRVRzWkpzLy9aWGo1a3BHWG96cTF2Q25FMm83?=
 =?utf-8?B?TVhaMFV6ZzJxeDZML3ZSR1ZySUxPWi9JeENXTDlnTGdKQm45MkpvT1VmcnZW?=
 =?utf-8?B?OS82UWYySzFGaXJyenB4UkhuOWFsKzJ0UTNqRmkzMlAvc1M2dDFGWWRTSEFr?=
 =?utf-8?B?SEYvaXFlN3RISk10WWJ5Q0RxV2JBUkk0ZUJhWCtMSnlwUjNWMXFRaVBmbzg5?=
 =?utf-8?B?eXY1aXJKZmJlaXoxU2R2bnhCTWYyYnpMbjl4QnlqazdwdU1qYnZIMk1oUEU3?=
 =?utf-8?B?VjZjUW0wYVgxZ09INGozdFlHRGt6cWtQek90cEZwamdTc1N0elhLT3dJeWpF?=
 =?utf-8?B?d012bWZQcHBXZVFVVUkyS0lLQ2x4SDhBdWVNakZ2dFU4by8wRkxyVEpxamRE?=
 =?utf-8?B?K1hhTkJPTy9oeVo0akxFaHVYekdESVVmSXdVbjNCQUppUS9Rb2lzbURWMDBR?=
 =?utf-8?B?NVk5S1BsWVQvNklic3VSNmxibjVvdWlpejhDaGxQOTRmbmd2M1JvZFlWblV4?=
 =?utf-8?B?OVBXc3VPWmVRVHpOQUx6eldEUDY3bkdjOCtHVGx1SXB4RDRISWllQnFMVHox?=
 =?utf-8?B?TE5hV01oOTRLRlJyNFhZbTlRRWd2SXpYUTRNNTB4bnBIWEVZcjNCRWhsZEpY?=
 =?utf-8?B?bFRuSWVEaTBOTEVsWHVIR2d2a09KNDNrUXR3QTN4S2FqcXB4ZjZCVUZaRlhU?=
 =?utf-8?B?Y2w4WHlkaW1QK2ZUWUVXN01ZNit5cWgxaUo0aWRiYmlZb2M1c2oveXpxdE96?=
 =?utf-8?Q?4Wl17rvHRXoF7y3OVQebJW8hh8IG9vzD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:14:35.2976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c20750-978c-48cc-8969-08dd14ebb5a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987
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


On 12/4/24 14:24, Mario Limonciello wrote:
> On 12/4/2024 15:37, Lizhi Hou wrote:
>> Enhance GET_INFO ioctl to support retrieving firmware version.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 20 ++++++++++++++++++++
>>   include/uapi/drm/amdxdna_accel.h | 19 +++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index 1c8170325837..83abd16ade11 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -640,6 +640,23 @@ static int aie2_get_aie_version(struct 
>> amdxdna_client *client,
>>       return 0;
>>   }
>>   +static int aie2_get_firmware_version(struct amdxdna_client *client,
>> +                     struct amdxdna_drm_get_info *args)
>> +{
>> +    struct amdxdna_drm_query_firmware_version version;
>> +    struct amdxdna_dev *xdna = client->xdna;
>> +
>> +    version.major = xdna->fw_ver.major;
>> +    version.minor = xdna->fw_ver.minor;
>> +    version.patch = xdna->fw_ver.sub;
>> +    version.build = xdna->fw_ver.build;
>> +
>> +    if (copy_to_user(u64_to_user_ptr(args->buffer), &version, 
>> sizeof(version)))
>> +        return -EFAULT;
>> +
>> +    return 0;
>> +}
>> +
>>   static int aie2_get_clock_metadata(struct amdxdna_client *client,
>>                      struct amdxdna_drm_get_info *args)
>>   {
>> @@ -752,6 +769,9 @@ static int aie2_get_info(struct amdxdna_client 
>> *client, struct amdxdna_drm_get_i
>>       case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
>>           ret = aie2_get_hwctx_status(client, args);
>>           break;
>> +    case DRM_AMDXDNA_QUERY_FIRMWARE_VERSION:
>> +        ret = aie2_get_firmware_version(client, args);
>> +        break;
>>       default:
>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>> args->param);
>>           ret = -EOPNOTSUPP;
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index af12af8bd699..ea86c57beb92 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -375,6 +375,20 @@ struct amdxdna_drm_query_hwctx {
>>       __u64 errors;
>>   };
>>   +/**
>> + * struct amdxdna_drm_query_firmware_version - Query the firmware 
>> version
>> + * @major: The major version number
>> + * @minor: The minor version number
>> + * @patch: The patch level version number
>> + * @build: The build ID
>> + */
>> +struct amdxdna_drm_query_firmware_version {
>> +    __u32 major; /* out */
>> +    __u32 minor; /* out */
>> +    __u32 patch; /* out */
>> +    __u32 build; /* out */
>> +};
>> +
>>   enum amdxdna_drm_get_param {
>>       DRM_AMDXDNA_QUERY_AIE_STATUS,
>>       DRM_AMDXDNA_QUERY_AIE_METADATA,
>> @@ -382,6 +396,11 @@ enum amdxdna_drm_get_param {
>>       DRM_AMDXDNA_QUERY_CLOCK_METADATA,
>>       DRM_AMDXDNA_QUERY_SENSORS,
>>       DRM_AMDXDNA_QUERY_HW_CONTEXTS,
>> +    DRM_AMDXDNA_READ_AIE_MEM,
>> +    DRM_AMDXDNA_READ_AIE_REG,
>> +    DRM_AMDXDNA_QUERY_FIRMWARE_VERSION,
>> +    DRM_AMDXDNA_GET_POWER_MODE,
>> +    DRM_AMDXDNA_QUERY_TELEMETRY,
>
> This is more than DRM_AMDXDNA_QUERY_FIRMWARE_VERSION.
>
> The other ones should go with other patches.
> Like DRM_AMDXDNA_GET_POWER_MODE should be in patch 6.
Ok.
>
> I didn't see DRM_AMDXDNA_READ_AIE_MEM, DRM_AMDXDNA_READ_AIE_REG, or
> DRM_AMDXDNA_QUERY_TELEMETRY used in this series, are they just 
> placeholders?  Maybe a different patch for the placeholders?

Yes. These are placeholders. I can remove them.


Thanks,

Lizhi

>
>
>>       DRM_AMDXDNA_NUM_GET_PARAM,
>>   };
>
