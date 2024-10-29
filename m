Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F499B4DAF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 16:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9B810E293;
	Tue, 29 Oct 2024 15:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="toBMXlIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B84D10E293
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 15:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8DQ0rD8RrhlS5KH7e9kVlKRS7WpS6KPjsUZGcBN+M8F8md0vBARs/bDI+5Pk4BeaQrlaUENWWIbbnMWvFaBrNn9Hko2AIJNjgXzwI+hDMpXGF0jBcgwKxhkNhgoMHFmW/pfJymqhPjGoPm2RuwB73h/lX604ByfKcj6vJKK4gvdCl4d8AdHAC+WFMjvRROmqLwHHDdCTq8PzJg2MN9kXRsqtc5UO5YbLRKVCn8Mx+eO/CRuZKHQsAhW8M3Zbgcj+EAb6x9H4KYh4s5di0uzOJ9/SVL4EBygeQfySQ5v26Px7izXVeifxmE67mAxJrO4JUVart0V9FV16zBgk31hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srCVsSytriyEjEHNI16kdQuGKenibPVcu44dy/L4BrA=;
 b=Ds64nwd28hE93h0D/73yVVeXvFMPaf/vkrcSbjXSrFFz/rag3h3FTQQNItUR+jiEFGu3IT+2U/hjavV30JxyFEC4bVzmzCjp/9qESVSe+vCmYOmjKeqHYCof+5foMgl97B60Wl4eKfmZaeDPv7jNgyBimnWVgsWZ5TngXtPsryLqFnnyrisD5powrGmAAXMwCRZeD9E6BQRID2Mv50xRiM+0J676cEXELW/dy7Th+QkKZ0ixxvwECNON6mytFom1LRtgNuVF0ScCyS2cGkWztoz9xDydYjacBSkauQ527f6vjB06Mib/u52d/40Gdn+ULNAtcJxkuDXVyUsT4JNK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srCVsSytriyEjEHNI16kdQuGKenibPVcu44dy/L4BrA=;
 b=toBMXlIJBZ2agMpDtgu5Le4P2X+L5GqPYStxUycdf/PXBDPfhYCOAPJOJ4vH+5Bd25qaOUzNmRmriAQRMN3Xc16vEt4dwJVXkS4uoK7vF1eEzbRGfKq9R4R3/l/pQja8yWY2Gw/L1Qb1kBAw824YU3QQGNxiGvipZFdHdbFAMek=
Received: from MW4PR04CA0180.namprd04.prod.outlook.com (2603:10b6:303:85::35)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Tue, 29 Oct
 2024 15:22:57 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:85:cafe::e6) by MW4PR04CA0180.outlook.office365.com
 (2603:10b6:303:85::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.0 via Frontend Transport; Tue, 29 Oct 2024 15:22:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:22:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:22:55 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 29 Oct 2024 10:22:54 -0500
Message-ID: <72a3926a-f707-361d-22dc-74657eec8914@amd.com>
Date: Tue, 29 Oct 2024 08:22:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V5 07/10] accel/amdxdna: Add command execution
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
 <20241021161931.3701754-8-lizhi.hou@amd.com>
 <72765a2d-2e4d-b8fc-8caa-8d4a131357bd@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <72765a2d-2e4d-b8fc-8caa-8d4a131357bd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f05595-178f-45b7-da97-08dcf82d90a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGtwQXhOMFhEVGtnSmltam9rbmRwZUs4d0JzNExWRFZGRGhxV0ZNb0Frd3VF?=
 =?utf-8?B?U1BOVEl6bHBIRkt6UHJESHlnMGJyN1JOeUtNc0dac1dYamhhbFBzWFp2aWRj?=
 =?utf-8?B?dFNucnl1MEE2V3lwa0hoUXEzYkw3Mkl4Z090cnZXWVNGWEpieElOM3ozNkJw?=
 =?utf-8?B?cmdpaFQ1NFltM1lwNTRqRWJmY3RoUU9zc0hnQ2sxclpubFNMODl5M1gwdFg2?=
 =?utf-8?B?dlpESWZPc1I2Uldld1o5a0IrNDVGU1JpNVpDdm1Jd2ZFaGFQZzRLT1ZxaGlo?=
 =?utf-8?B?QjBjWHFWSG80STNBYUQxWUVsZHh4aTFnVS9MU3Nmc1Fqc2NMVmJSZmtkaGtX?=
 =?utf-8?B?UGs4VHRFTXp4dlRtKzhxZTNDcDlQeFc3K2xjN1E5dmpNOXBYZXpBT2c4Qytr?=
 =?utf-8?B?SlEzZ0VRQkVWWWp1NzBrdDZTVWY5N1RaQUJvNzRlRTFGeGhOWUNMaEZSR1k5?=
 =?utf-8?B?LzZZK2ViY2R4czArdzFxNnlQRjZTSWtYQll3cE5qZVZ2dXg2djZYNnIrVi8x?=
 =?utf-8?B?S3dBcWd6dlNxdm8xSnBXaWxIdlFZV3RaTFVxT3IweVpwc3llVnpyUUk0a1NW?=
 =?utf-8?B?bUJCRkd4dzJpTnEzYzVOQWJNQkw2eTF1b0FvU2VqV3Y1VWFjYVRnU01Pa3Np?=
 =?utf-8?B?Ylc0dStVUDJyQkN4Q291ZHZoUXV2Wng0WEl4Z2ZzbDF2WDBrclNuMUtWMS9y?=
 =?utf-8?B?MkNkSVVjSGtvQlE0VHNxUVJwOHFUS2lwNFRhZEI4SVRobFBLaHY0b09EaGl1?=
 =?utf-8?B?ZVl1RGtadXo2eXhYcmNxRzVoY0NMcnQ3WDBrYUlkS0NSTEJNa2VZZ3JTclVv?=
 =?utf-8?B?TkdTb0VvTng5T08xQUIwM0toWU1WM2IyR3RWcG9HOWtVSWhvMzdrNFlwR2Zz?=
 =?utf-8?B?VFBZL29scjFTVlVTOXhsV25HVFRlWG5VMXhkZDhSazAwdnRZcnAybDhEeTNZ?=
 =?utf-8?B?NXhmY1ZiTU51SUZxckFTWlVrQkUvMTJzSUNqVFhFTW1HSm9RMFd3a1lPSUdF?=
 =?utf-8?B?Q2JEVktiT014akUyRjVaeXJYQlhOWUJoQW5jaGJ5bGxGaFZid3pIVHM2VHZQ?=
 =?utf-8?B?MFpuRTJaYU9RdithY1krU1dUL3E4UVkxSFIvZEpZTWRkdXFrTlZoVldNR0Jr?=
 =?utf-8?B?K08rU0cwcjdKTkEwZDlybzRQS1k0T2k3Z3dyL3RYbm8rbktuVDhtWTZ1UUlz?=
 =?utf-8?B?Rnc5Yk5hR2JEb25qR2JMdGpGbkNFeUhkaXpNenltVnJxUVZpak40MHJqdmlu?=
 =?utf-8?B?WUZPcUlSUW9wNkRxQ1VOekxGN2N1a2VVTGY0UUFDRWt6WXE0UnkxUW0wbUJZ?=
 =?utf-8?B?ZVBsVzBvajBiVDBaZTd6ZStaVGYxdXRSNGEyZXJLWUNqSkdXTlJIbTNCYWJ3?=
 =?utf-8?B?T3VsM0s0UFUrL2w5RWVVVWJHa284a1QzOWdQaGNHbkFoQzlTY0IxWHhyM1lV?=
 =?utf-8?B?UlBGTkxUc3pXanB5bHcyMXlGYmcwM3ZENG5mNDRXcjNNbDZVeGkvYi82bktF?=
 =?utf-8?B?RU1rS0ZMR25INFFzbmwxTGhDL2NVZXpaZFlKUzVkMkRtQmlXeUQzeGhJMEZl?=
 =?utf-8?B?SW5RRm4xaTQ3bHI0M2hBclpidFNtcHFVcjdxNmo5U2JVNXZ0NWthK0ZRcG5t?=
 =?utf-8?B?Z3Vrd3VsZjVreFpsOS9SWmJESUpoWkg0aERudGtQVkhWSmVkVnNLK2pCMW9F?=
 =?utf-8?B?bkNBRHpTYTlCaGU1K0E1aG1Xd1hFa0hLNFFUK2tOL1hzZGhPM1FXbDRyQnND?=
 =?utf-8?B?Nk8wQTgwVW43bktxU3hnU25RVm1kR01LNTMxWkRqMDRNYVZpMDVDVVhQZlI1?=
 =?utf-8?B?cHFRNnFqUHEvaWF6TlBORW9OQVhQVFVwRUJONnVKSEZ4RVIrYkhwYWtQQmRX?=
 =?utf-8?B?eGs0OG1xcnh3ZGVud3RIaVZiL0h0TFgvK0tsNDdOM0ZiL3c9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:22:56.2276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f05595-178f-45b7-da97-08dcf82d90a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
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


On 10/25/24 10:55, Jeffrey Hugo wrote:
> On 10/21/2024 10:19 AM, Lizhi Hou wrote:
>> diff --git a/include/uapi/drm/amdxdna_accel.h 
>> b/include/uapi/drm/amdxdna_accel.h
>> index 3792750834b2..08f3ec7146ab 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -13,6 +13,7 @@
>>   extern "C" {
>>   #endif
>>   +#define AMDXDNA_INVALID_CMD_HANDLE    (~0UL)
>>   #define AMDXDNA_INVALID_ADDR        (~0UL)
>>   #define AMDXDNA_INVALID_CTX_HANDLE    0
>>   #define AMDXDNA_INVALID_BO_HANDLE    0
>> @@ -29,6 +30,8 @@ enum amdxdna_drm_ioctl_id {
>>       DRM_AMDXDNA_CREATE_BO,
>>       DRM_AMDXDNA_GET_BO_INFO,
>>       DRM_AMDXDNA_SYNC_BO,
>> +    DRM_AMDXDNA_EXEC_CMD,
>> +    DRM_AMDXDNA_WAIT_CMD,
>>   };
>>     /**
>> @@ -201,6 +204,54 @@ struct amdxdna_drm_sync_bo {
>>       __u64 size;
>>   };
>>   +enum amdxdna_cmd_type {
>> +    AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
>> +    AMDXDNA_CMD_SUBMIT_DEPENDENCY,
>> +    AMDXDNA_CMD_SUBMIT_SIGNAL,
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_exec_cmd - Execute command.
>> + * @ext: MBZ.
>> + * @ext_flags: MBZ.
>> + * @hwctx: Hardware context handle.
>> + * @type: One of command type in enum amdxdna_cmd_type.
>> + * @cmd_handles: Array of command handles or the command handle itself
>> + *               in case of just one.
>> + * @args: Array of arguments for all command handles.
>> + * @cmd_count: Number of command handles in the cmd_handles array.
>> + * @arg_count: Number of arguments in the args array.
>> + * @seq: Returned sequence number for this command.
>> + */
>> +struct amdxdna_drm_exec_cmd {
>> +    __u64 ext;
>> +    __u64 ext_flags;
>> +    __u32 hwctx;
>> +    __u32 type;
>> +    __u64 cmd_handles;
>> +    __u64 args;
>> +    __u32 cmd_count;
>> +    __u32 arg_count;
>> +    __u64 seq;
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_wait_cmd - Wait exectuion command.
>> + *
>> + * @hwctx: hardware context handle.
>> + * @timeout: timeout in ms, 0 implies infinite wait.
>> + * @seq: sequence number of the command returned by execute command.
>> + *
>> + * Wait a command specified by seq to be completed.
>> + * Using AMDXDNA_INVALID_CMD_HANDLE as seq means wait till there is 
>> a free slot
>> + * to submit a new command.
>> + */
>> +struct amdxdna_drm_wait_cmd {
>> +    __u32 hwctx;
>> +    __u32 timeout;
>> +    __u64 seq;
>> +};
>> +
>>   #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
>>            struct amdxdna_drm_create_hwctx)
>> @@ -225,6 +276,14 @@ struct amdxdna_drm_sync_bo {
>>       DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SYNC_BO, \
>>            struct amdxdna_drm_sync_bo)
>>   +#define DRM_IOCTL_AMDXDNA_EXEC_CMD \
>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_EXEC_CMD, \
>> +         struct amdxdna_drm_exec_cmd)
>> +
>> +#define DRM_IOCTL_AMDXDNA_WAIT_CMD \
>> +    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_WAIT_CMD, \
>> +         struct amdxdna_drm_wait_cmd)
>> +
>
> Nope.  This looks like a driver private wait ioctl on a specific BO. 
> That is not the modern way to do things per Vetter -
>
> https://lore.kernel.org/dri-devel/ZC75%2Fq34YnDDsGpB@phenom.ffwll.local/
>
> Skimming the implementation, it looks like you are already using 
> fences and the drm scheduler, so plumbing in syncobjs is not much more 
> than what you are already doing, I think.

Ok. I will  remove the wait ioctl and use syncobj instead.


Thanks,

Lizhi

>
> -Jeff
