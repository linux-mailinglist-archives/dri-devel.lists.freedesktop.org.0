Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73191993A8F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 00:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEFD10E28D;
	Mon,  7 Oct 2024 22:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PxM3Q9gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09B210E28D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 22:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dx3Ba+v9w0ktesM2G5xFkbuSsXYvdqCxt7DbrWkUXqhP0deW/ZkU08vranCXs2n321taqEslBU5vcb1vySoHB//BMOhflfo/otZA/xjFnoymOU4MPjdafg/GPfikALhqUCaEFYP43yNsyekXBN+SMNfC2NvrX+18sVK/973f5UinF0DlfwovNRv4oyDikGrfFB7ISDYJtCliocwutfP1ARNKIunxCNoocaNOgv0QPEqjW0Ser9WFOTcCkUryAowyhM/xZI/ifrUhOyHoE4SlzI52L7EQA5g2eqFPoqASdVid/DYdbs2boWPAFWhzOEdJg9Kou62JTFZMYgnw3Hx1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuJN8FwTQUrKRfsHPXAjCOq1dwsjcrrLmdOdAd15bEI=;
 b=rGKgwOyLieeT26stKHOKYR4SuthBRYU4SclE7Ixp9vYg7oE/G+tM5qeoWUqbtb55ZGNQ7KtuDNliqKC87DFVLJOWNLsJZE4WqoVCru6OMFf7dt+F0W5I8OdMhns2A2U8g3Kyudp02eW3/80LkfnaI2+Lh/uyeLnTx5bAe2GGos1SnEmMr0en/5l922QgPPqZeIL1Tv+CQhy1vR8rkBqaDqd9/pCEBRMu1wW9jRnKe0L6FT/17/Asl4fiBX0ICkKS88Bwe+0DLQS7+iO0xdSsEJZl7e3pknbW0XCxhwLQxyhr+VW3lWtAJX6+HJc3sEFs/fMwuHNTuSKypJu7rfIJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuJN8FwTQUrKRfsHPXAjCOq1dwsjcrrLmdOdAd15bEI=;
 b=PxM3Q9grRiT/LaPCA3T6sbxWR3/6dvOHJ3aR32RCgLHDIY+G0akB489rC9+MPGa0Al67FXrCroQbfESvBRxmbs5O8Gsx6wfnH9128P01MUgUNIrYQcooI2f71ju7SPtQWgST7TehRWSndPlKGpZ2DYTGoV6Ob/E65OY5af8+QB8=
Received: from PH8PR15CA0001.namprd15.prod.outlook.com (2603:10b6:510:2d2::13)
 by LV8PR12MB9205.namprd12.prod.outlook.com (2603:10b6:408:191::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 22:51:20 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::6d) by PH8PR15CA0001.outlook.office365.com
 (2603:10b6:510:2d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 22:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 22:51:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 17:51:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 17:51:18 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 17:51:17 -0500
Message-ID: <4d295041-fa3d-58e5-9fa7-c835f7435bb9@amd.com>
Date: Mon, 7 Oct 2024 15:51:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 07/11] accel/amdxdna: Add command execution
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-8-lizhi.hou@amd.com>
 <8549424d-bd22-8308-c661-c2ef13cdc441@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <8549424d-bd22-8308-c661-c2ef13cdc441@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|LV8PR12MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 220710ef-0709-45aa-2465-08dce7228f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXhvU2dBWk9XRW1pWDBURVptNGR0bzlpMkVXYWhiYkd0VGdlMVMzY1diRS9J?=
 =?utf-8?B?NnlMY0ZNcU9Hdm1jZXpua1lnakM2RWR2RzFrY1NTZnRJT2YyY3QweFdnb0FV?=
 =?utf-8?B?L3VudkNxdnp1NFM0dk5aam55ek9jRVFGSjNPMVk3N2ViVzQra3ViQ3dGV2NH?=
 =?utf-8?B?bVc5N2U4bWZXWWs5RzFPbHdFOUptWTRUMWlHRlhTeFkwa3Z5SkVnVmQwRGpa?=
 =?utf-8?B?ZlJWQ3hDd3RDTW5oTWNTZ1Z1NXBzK0h1L1Frb3pSMDJFVEdGMHIzVXl5TnVI?=
 =?utf-8?B?d3QrT2YyNnhuWWJ0UUF4T0k2VU5wVTI3V0kvNW1VV0YvWXZZRkZmekIyRCsz?=
 =?utf-8?B?SEc3Q3ZmbEVHQ051ZWkzVnlzVHNheGRHbWlCa1prYmt4YnVvYTYxVnh5Ly9k?=
 =?utf-8?B?aFhCTXF2dDJaaUZkRUtjRnJUdWNkQXZkbGFrY01ZR0JwU28rQmVPZ1o4YTV0?=
 =?utf-8?B?Y3NqcU9UdmtSRlRWRXlNbGRNOEJTTjV5Vmg2MTVSV3FkY3NCSHJaWDJqQ2ZV?=
 =?utf-8?B?QXlWdHRrOUhHSVhvdGNMOHJDUFJMSjA0K2VqZEowTlArZlFRNFEwUEpULzlt?=
 =?utf-8?B?ckJJUkFQMVRkSmI4UUFFcGdlWERqSE4zNVZOeDZHem5iWEQrM0xvbnVKaXR5?=
 =?utf-8?B?NGhITGR2Z09GV3RwaHkzS0QwTlQ1anF4aWg5L1BVSnJDZ2NvSktqUjhZVWdZ?=
 =?utf-8?B?SVNHUzI3RUhWRGxoOG1OOENUVDZ1MHI3aXdGcnlTbHlqbGN1b2lHMXQvdlli?=
 =?utf-8?B?SHdNQzc0VUhoTkRNV056Nmt3bGJIZ3lveGdzck9zM2VsUnlFUkUxUXdIWU1p?=
 =?utf-8?B?Zy9LNDlyZThpUUFLMm83dUpSaXNuenphaG84SXdlVGVYL3M1cEJKbkdRcVlx?=
 =?utf-8?B?Nkx4UWxxUFRaTElSMmRaeW9QNGEwV1pxTlIwbGZ3QlBlVWJRaWN4cno2QmhC?=
 =?utf-8?B?TDBDMnBxSXFwOU44bjVHb2YvaXpqNXcycGlWZGtvSHIyY1FnOHJ5djVaSEt2?=
 =?utf-8?B?L2l4bVhFQmxxYTBPaDBRSzFTOVE2Q2psR3MrTmYxVjZBWGdydWRrek1MZHAz?=
 =?utf-8?B?ZzBrSy8vWmo5WkxaRFJsRzIrZ2c3WWF2cU5JVzMwTlc4a3JwcWVRUThDVzVT?=
 =?utf-8?B?ZkRzZjBpckpKYWEvYlg2M3VwTm9HYkltV1Z6RTlZL1d1bjEyS05jbU1sSWJj?=
 =?utf-8?B?YUhQSXVnNHMya2FrN1F2SjMvY0pGWk8rcFlYUHExMUxESktpYUozMDk2TlBF?=
 =?utf-8?B?SGd6V1FHRlBHalBTaFJML1lMMWZsZlFMSGllWjFWL1hQZmNYUVVwbWpCdi84?=
 =?utf-8?B?b09PbmpOczNISStjK2k3WC9ldEZNdHZxZ1F4QXZHNFI0UGxKVWVtZ1p5MXJ0?=
 =?utf-8?B?YlU0TzRYclFxSThxcFdvN084N1U3WmNQUm5Yb0xQSkc0ODlhM25iaTUwTnds?=
 =?utf-8?B?VDN4Z2ZGaGR1VUwrYXY1Smg3ME5YYTBxK3U1RFJUYS9wQjJqNnpMcldzTTVv?=
 =?utf-8?B?T3QvMkpxbDhsc2h2OWxKV0VsU2NqRVEydGVJTTF0N0w5RmQyVGNDdWNxVGtN?=
 =?utf-8?B?VWUrcXVkOGg3RVFjcVJLUVVkSFB5VFQ3b05lVTBrZFE3VnJFdEFXbHFQSldK?=
 =?utf-8?B?YmRLOS9obWJ4SlMzUkt4ZnVZZTVRUzQwYmR4NTE2ekhrWFJNN3hhckxFc1F0?=
 =?utf-8?B?UlYwNW5BbTRLbTV6cFlBRUhQVHE5RE5qcDI1WFNvQlE4aEo1NFExSm8vZzgy?=
 =?utf-8?B?cCtINU1JVDFpcXEvK2g1QUxIWGZpR0tSZlo2Z0lINGhRZm1WL1dtai81c2Zy?=
 =?utf-8?Q?4Z777vo1w0c5cNnz6sLQai2lIwPY2Hm0AIWBY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 22:51:19.7649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 220710ef-0709-45aa-2465-08dce7228f57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9205
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


On 10/4/24 11:01, Jeffrey Hugo wrote:
> On 9/11/2024 12:06 PM, Lizhi Hou wrote:
>> +enum amdxdna_cmd_type {
>> +    AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
>> +    AMDXDNA_CMD_SUBMIT_DEPENDENCY,
>> +    AMDXDNA_CMD_SUBMIT_SIGNAL,
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_exec_cmd - Execute command.
>> + * @ext: MBZ.
>> + * @ext_flags: MBZ.
>
> I see a check for ext_flags, but not ext

I will add the check.


Thanks,

Lizhi

>
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
