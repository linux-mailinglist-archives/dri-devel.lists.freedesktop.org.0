Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC911C07FE9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225E510EB34;
	Fri, 24 Oct 2025 20:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oDlhxulI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7210EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9QjkUcEUSmY07qBTbKphhJ/fFAwIVaPPNQlLKrtpolCl7kqmMI3tTtOO37CvI8pGchU/J8pC4CCumXJPtODxqU7FBiGvIm66Nr9XLm8QrN3jqCN6T6hp6yjJF2zVJ8EOwUoKH7A7ZT56UFEvOHww37/jdVDc1vtl/44MHULOjm3w2Dmq7KJajbm6A/5mDe7UZP6+S32wFNAHUhHoUFZcqJ7QS1iXUt+cB6PnF/HiNRvpvZ8XBkUH5JZT8t7XR1BZvju8js8+Ix37BKHeFYKeTI7/bdcpzrskMn+Ar3p0FDdt4fPBBSEg42f+u132ukvvkL9A7iBPzyTVWp9a8DXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mYFOpzolo1jZIDjR/PPCtFI9oQP0931XbUwllVfv/0=;
 b=y0aDpOGs0DAIkyPCbVO7qskYSYHPa0YDMyt3GRn+GWGQ2tEiqRquU+ABMCNk6bgBXHEZXNIsu8qOhd/7bYjsQ4swPy3AsFcBp1iQSLuglYEx6kkhUgSGhsexvLuXjETlzRiOVkbJA+7TsUgtp1kIO5Ic6arBAK1JLA3XZKOpwwEAJZvEttegPC/JJIC2Ck35Wfbax5YEQ7rxhqaJCitF004jOxeK+W3NRRgIqTFFGaBcuXvCmUZV+mjIm1MV7YsmS+ZLk+1zh+ELVy6Pt60NTjhQaoDqWoDLGyUSx6pwJRnKbcgda79fv/jdp0NtF0vBq39bd/6hhhGyyGitcS/5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mYFOpzolo1jZIDjR/PPCtFI9oQP0931XbUwllVfv/0=;
 b=oDlhxulII1hymxYiZe7o4H26jS91FviZ2I4bIBLLP5yPT9VhodaFoBoUZSKSj01VcBLFXaKJ1W6QEJOd1HsdTlBr22fwmhHjYz+c2CupP+fy8GJtRj1LNF6eLKoukKUdHHvSvdmPNXyn++ZJycJNfizb/g2NEBl6AHpswC5kWn4=
Received: from SA1P222CA0150.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::20)
 by MN0PR12MB5764.namprd12.prod.outlook.com (2603:10b6:208:377::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:09:57 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::5a) by SA1P222CA0150.outlook.office365.com
 (2603:10b6:806:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 20:09:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 13:09:57 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 13:09:56 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 13:09:56 -0700
Message-ID: <e2a2f8a6-b9d8-502e-dcbd-d6598ea40f52@amd.com>
Date: Fri, 24 Oct 2025 13:09:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Fix uninitialized return value
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251024165503.1548131-1-lizhi.hou@amd.com>
 <ab69ff44-14a5-4f65-a026-c08d9931c2c1@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <ab69ff44-14a5-4f65-a026-c08d9931c2c1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|MN0PR12MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: b6da1d49-ed98-48f8-bd42-08de13394dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTIxcFV1UGpGenVrTHBiRk1vM2MrNGFKT2t0am9UZVdxdUliTVZyUzhMQ2NO?=
 =?utf-8?B?bW1Ra2pWVmxyZzdiNnh0aWd4ODBGd1VBYUdweEh5cEFlbW5ESEg1aGZpWml3?=
 =?utf-8?B?L1krSFAvaytaYlJ6Yk1kQys4MTh4QlZDTy9wLzE3elowbTVEQ3EzQzFZQllD?=
 =?utf-8?B?SlYwQ0g5WklFMGlWOG5FSkQrNUJGSW9rd2lRb3B2RGpHeHB5allNRk9FZ3Ja?=
 =?utf-8?B?NzFLUUFxZzVVM29KQktQR01TUWtabU1WcFJSamhDZjNiSWx0cUhhOEUvSU81?=
 =?utf-8?B?UG5oT3lXL2VTYUkzV1dpaW95cjNXWmRNN1lSeGdDdGpydThjRy93aUdCMktv?=
 =?utf-8?B?TkhBRmpKcHVRMll1L2hJdTFVSXdNcjUxd0xrRVJybFBNVUpQSGd5Z3FOMGox?=
 =?utf-8?B?ZkZxYmZqMXZkNjJ4MjlPUnU5WWE3MU11Z2pBZFo3RkZHdGhMT0RVSHlkN0xl?=
 =?utf-8?B?RmFSemlENDVIMnZ5azFaV2RubGt5V0tOQVhXNFFnWmtzWGpvRTM4N2NsZUNw?=
 =?utf-8?B?MEtGcnJ0cDB4UitvalBQdHJHMXRDdWZBZmtoYXFiVDUzeFM3U1VENEpQdGFV?=
 =?utf-8?B?VGJJLzkxWkM5eWRmcEVyTitEZWJQcHR3Z0hNYnRDRDFlVjFtMHNTczlRUENI?=
 =?utf-8?B?YUVicHRYekFtZnBQdXU1eHd0dkpFUXFyZTd1OW9Yd0Jnem8veWF3bjNvR2xT?=
 =?utf-8?B?MDZTQTZVQjNQcVFLaUUzTTFaa0ZqZUJUVm00TjBnNU5oQzRjVnROUVVFVlhQ?=
 =?utf-8?B?U2FxVlZMdTZ2bi8xVHVJcGxkb21XeCtRaHpkdHJsOHlTWm1VdzhtU2o2dHdF?=
 =?utf-8?B?aTRxQmcydmhYZHN3aldKQUE5eU1mbXBXdjFVcFVUWFhPUWRESjNERVRNNUFm?=
 =?utf-8?B?QU5XbklyWUlLb0tSb0x1akd4RHJRcVAzMjBtVGtmaXZ4UGdiR1YvbEtuM0cy?=
 =?utf-8?B?emFqTlN5T3B3emdIbTN1UVdCbDZ1SmgvK2RmVVhYTDAwTDg3UUNLcEZ0STIr?=
 =?utf-8?B?cW14aThWU0c5UndVVHlUWThXREpSTHphamZDWDBRdEt5WGg3dmZRenBvNGZO?=
 =?utf-8?B?TXVRMXNHVktFaDZIalJ1WGNJS1VyM2xOWHpxeFI1eG5pUm5rSTFKOWJjdnp2?=
 =?utf-8?B?M0lzMTVkUnRmNE90VzlWKzVuM2Z4cXdyUmxKaUdDWnJmeWs4dm1LaStQd0Rt?=
 =?utf-8?B?UjJzUnJ0QXhZcGUzMU9LZ01jTEFwNUdvN1hJOHFyNEtBSVJQZkR3dW1nYXA3?=
 =?utf-8?B?dS9TNFNodmJCcmM4TVhiVjZJUjQ5SHJ2aVBTeW41NTk3QkMrVEpYRWs1K0h0?=
 =?utf-8?B?SzZwYm85bGhYSEhkSGtFTm1zV3I4K21vanFOUkpUUFdhbnpEQmF0M2NrWlhM?=
 =?utf-8?B?ODg0VTlUcUg5UCt1cFlLY0lTaEJESy9CWUJtUHRqaGpYL3htMnhDZUdHZFdr?=
 =?utf-8?B?YTZUVWYvbmJwYzVRR0VHTjdVK25tVnljQjlGVXRqMzBqQ1JHdTN5bmhQZG5x?=
 =?utf-8?B?bi9YMEt2Q0haclpsYXlXTmR5OWVtUG94a08vNDlEYm05aitGN2JwRW0xOVlT?=
 =?utf-8?B?TEgyRUtQVXMrRVEzeldJOEhIRFk1Y1o1eTRRVzM5RklOL3B3UEpsY080SHh0?=
 =?utf-8?B?b3ZYaEZBVWZib0MzNVlmVkp2L1Z4a1BRY1RpaFR1QXdGUE5OVDdVMXVROHAz?=
 =?utf-8?B?enZBa3JLcXlrRm1POGpZVDBqa3FKTm9pVlE4K0pnZ080SzROUUNyM24wdmw5?=
 =?utf-8?B?bjQ2VTFpNE52TFZDd0pBYVJKMFRLMDJhWndNaWpraHJYaUJzbE1PYlYvZnlR?=
 =?utf-8?B?Z3czNTVSZER3bm5RbG9NMkZKRGRHZGdBb3NLamFoemtlNkJRWU51WVhnVEpH?=
 =?utf-8?B?b3dkNUJ0TlFhR1RTQ3BjQ2g5VHM1M2tVSVVBQ3VTeSsyUlJUbDZFRE9NSG5y?=
 =?utf-8?B?QzVwbHJrcnlWQkpKL3Y4azlUVkFqNENVOU5JdGJqakwwVW9oQXV6WTdZWERs?=
 =?utf-8?B?ZjEvbGNFeUFyclFNeWFuTWZuMnNveThRNnYwTWRpdGpvTldEdS9iWWE1aWJx?=
 =?utf-8?B?VVZ0MnlUNkdlNEd6d3VaYXpIR3RwQ3VQbFZPWnVSY2lBZyt0azY2M3dzSUVB?=
 =?utf-8?Q?F1GY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:09:57.2300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6da1d49-ed98-48f8-bd42-08de13394dd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5764
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

Applied to drm-misc-next.

On 10/24/25 11:07, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 10/24/2025 11:55 AM, Lizhi Hou wrote:
>> In aie2_get_hwctx_status() and aie2_query_ctx_status_array(), the
>> functions could return an uninitialized value in some cases. Update them
>> to always return 0. The amount of valid results is indicated by the
>> returned buffer_size, element_size, and num_element fields.
>>
>> Fixes: 2f509fe6a42c ("accel/amdxdna: Add ioctl 
>> DRM_IOCTL_AMDXDNA_GET_ARRAY")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/accel/amdxdna/aie2_pci.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>> b/drivers/accel/amdxdna/aie2_pci.c
>> index f48045318dc0..f1a8112b080f 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -822,7 +822,7 @@ static int aie2_get_hwctx_status(struct 
>> amdxdna_client *client,
>>       }
>>         args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>> -    return ret;
>> +    return 0;
>>   }
>>     static int aie2_get_info(struct amdxdna_client *client, struct 
>> amdxdna_drm_get_info *args)
>> @@ -904,7 +904,7 @@ static int aie2_query_ctx_status_array(struct 
>> amdxdna_client *client,
>>       args->num_element = (u32)((array_args.buffer - args->buffer) /
>>                     args->element_size);
>>   -    return ret;
>> +    return 0;
>>   }
>>     static int aie2_get_array(struct amdxdna_client *client,
>
