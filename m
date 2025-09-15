Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511EB58310
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DC610E16D;
	Mon, 15 Sep 2025 17:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4+uMBQ09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286E10E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSASgIo5/kzyVoQJyt/mNnca13wVIQvmOHjrxarsJXHhjfzmfpu5A/2o6Ym2WqOXcUX0BaN/rQh56o78KziJtu4YgKuGXLWGoi0A6xRyJbXPAduLQiecHDgMqRorioJ7wETHOZYsG9PDSBiPYW+NATarSeyRPSvCIo2GUpRvb7Ske0UGIq0UZy0dMAskePMwJ7RRwNNqm/vPJC4T2nNucaAjKdU153p0kE10KYpWXdQsfF1BjAe/I+TNh4fBZR3w/88qsNyQZIfYy1ZZJ+oC8342/X0WnqyeKXhAUS4uW0nDPxAcrAJIclsH7WK4367BbNel+ulm3vvyfBtQvmpObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgT28oiKEP91W2/WOb6lIz43DMrS1UffzBVDnPGPEjk=;
 b=Pdd11BlPmQGJe/T72cYj9XKCmjy+S7z2mFmQSDrwcRmtMwsN2mXVfqD3ZFMkpZMvtxFqgzzsbP5vnSGadN78Bk3SRs7wL3iifovLRSIBV20FyUIl3cJlyAzPRTUjdUH53ZtxegtK3EGa48BAscwR9mt4ppltZHLQ8PeBDbk/ZubBtjutOXGZkNfh+qyVwIMYvCUUq80omVtlgnCB59f/bxBXAxoIzIjOFm5FGTj+3JF6X9b6ntZNjDbgxtczwgp/ejpNtBrKLUKiC0MgcQBunEBRT0lw3ek2CasboGYq1MrIOiPkQPBzyWv3fjR5ygNtzHrBCS40ez0gUwMORrOmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgT28oiKEP91W2/WOb6lIz43DMrS1UffzBVDnPGPEjk=;
 b=4+uMBQ09aKj8efEevZrMxWeO8rCwcBToUZaKLh2yKd6T0egpbX/AaLayI1n+95XVV7d/LCL/rBPR9gSNAe3Pbyb34Qmx7mfOYQGor3GG/JamGmGJ7osdugoSyvE3oahMQbcSbZRwvt6133xanFBEt2tGd7Uf3xOmNrYkl9bIgCA=
Received: from MN2PR20CA0051.namprd20.prod.outlook.com (2603:10b6:208:235::20)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 17:13:17 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::89) by MN2PR20CA0051.outlook.office365.com
 (2603:10b6:208:235::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Mon,
 15 Sep 2025 17:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 17:13:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 10:13:16 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 10:13:16 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Sep 2025 10:13:15 -0700
Message-ID: <53deb7b1-17eb-366e-3f8c-847a7a903032@amd.com>
Date: Mon, 15 Sep 2025 10:13:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Remove unused firmware boot parameters
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>, Andrzej Kacprowski
 <Andrzej.Kacprowski@intel.com>
References: <20250915103553.830151-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250915103553.830151-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f627e11-dc9f-4e92-fb0c-08ddf47b2988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFY0RE5HbmZaMVBtVG82THFTNnZudUlPaUZxaG1QdnRJelFHTmRRZ25JNmZr?=
 =?utf-8?B?WGV4UHNNR0oxTXZ6cUs1bW42OHZ5Q1VMTlhXUE41am5sdHJ6by9PWm5hbVhB?=
 =?utf-8?B?Ri9qZW9PTlJqUmVXMVB5MWxaZC9tM1h2SnlVQXlUaHhoS0ltWWpSR3VWT3VV?=
 =?utf-8?B?ejlBM3ZVNTBSSjhjMHROWEEyME9ZeE5qU255OVVkZVdQNWNJSEtyRWFlZzJs?=
 =?utf-8?B?QlpnaUtoekNnaDhpVzE1Qjh1bi9na1c2Y0N6QkRkSlhFMU9PZWVzcWMxRWdp?=
 =?utf-8?B?ak1XQ09xTzB3TTJQbXBSS2FNVk1xK2lBZTNCWWR1RURZdForY3NUbFNZTGFJ?=
 =?utf-8?B?T3FrM3NvdWNnanZlWmEwZ2s0KzJhNnNGM0ptNlZlQURodmQ3UVdicHg2TGZG?=
 =?utf-8?B?QlZJMW5DTlZrcmpZU1h2Ym9pQTREcWE0Zm1ubW1oNVVYQ2dsbFFrem9LTnFu?=
 =?utf-8?B?aDNJc3lUeTUvMzM5cmNTcmtvMTZxeklBNU5YWncyMTVyL3pmdFErK2xTbnl0?=
 =?utf-8?B?dWZUNTlLQUwvWDFiSVExdDk0SVNkVTFKWFZiVXlGUktXU2ZSTUkyZS9lR3c1?=
 =?utf-8?B?aURFa25rN24xRU8xQUFyOWpuQzlKTmJXc3BqNjlyZ0ZTY0RmS0pIRXFCQ0Fj?=
 =?utf-8?B?YitOYWlsSnI3WE55SFdtUzMzK01PZm16RFhaUU1GY2RmWWR3VkkwdzY2UGNS?=
 =?utf-8?B?TVpmd2xsRE5mMDl3UVVzM0l1b3pkODNzRjlLVWgrNXRBRHR0b043KzJWeVlj?=
 =?utf-8?B?K252Uk16YVRON0dBMjRFSk5DMC9taWNrckx2VkdmTGRIRU80RzgzK1lWN1U2?=
 =?utf-8?B?UU85alFTZm9HNW8zWXpKZm4yWFRkQzdLT1ZOdzluY2hOWC92NlNidStleVhH?=
 =?utf-8?B?UlJiTDlZZXVYeGpPYXZaM09sZnc4YWlCNGdwTzhQVGNEZkRjQnBINCtPVGJq?=
 =?utf-8?B?VEFDS2paQWVQS05neEJORFN4YWVna1NXbllOS2c1Wk1oRGlMSU9ibDlWUnNa?=
 =?utf-8?B?WXR5cHlIeUJrdUFZQlptMjJlZWJpSnlrajkwd3NONDhlTzVGNDRGeVhqdkti?=
 =?utf-8?B?YUZxUm9mNERKY3luWWJSalJUQlI3VW1EeGNHcXlMcXJiMHZJTmI2eWl2L0Rj?=
 =?utf-8?B?aHRuRjU0dlJZS3VpVG1FZ3NwVzFlZXVKaEFSeFNYWm5VczVXT1VmSWtTeXRF?=
 =?utf-8?B?STNQb25qZTR4QXFvRDNNUlU5UlZTTmZNTzRRenU5VHdvSDRsL1BQeVFaekF0?=
 =?utf-8?B?ckcwOWtsaytJeUpkOHdhSUp5Y2F4cmcwcVdUNHBWS2RJWm9kbUdJcHZCRjBL?=
 =?utf-8?B?UU4zdG1IZ2tRMlBRZUQ4S0g3dktCdjRjS3gxZGdCMVlSZTJtNXFTRmcxK3JJ?=
 =?utf-8?B?YmVHeVBDL2Fwa05VNkoyUUFTV2RVRk93MGVwUnIzdlUrQzNoMFI2WjJrVzhC?=
 =?utf-8?B?M05uZ2QwckxtYXE2QmZ5N0t0WWs3d1NwZG13SmtORUp3OEtsZlBEMVBDSFFy?=
 =?utf-8?B?Qkc5QWxNeStrU1o0OFJxOHBIOEZTQWtweG84R0Z5MVlnSi82MzVGKzU5ekNj?=
 =?utf-8?B?QnJ1WTR6enVMVXpxNTRJMUZHdHErUkwyRHNrT01yc1NjWVBvUnNMZzAxT3k0?=
 =?utf-8?B?WTFJb2Y2YWhaTGQ1QjBWanNqVnhVb2ltYUViRXNpVnQxd3ZuN3dGTDNOQTht?=
 =?utf-8?B?dW50Mk5hb3lnZWtOOGU5WFYwZkVCVWZ5RjE2RzhlNzg5YlUwZjV5ZXBHcFBu?=
 =?utf-8?B?N1lNWVk4QnNaK0JEMlpYa0JzUStCNVNkU1p2SnlxT1JnNXJ5K0FOdHVlYUZF?=
 =?utf-8?B?WUZWV3dleHl2RVpqb09jWjl5R2NFazJnYWUxSUVvSGgxUmxEVUJ1OC9HNExP?=
 =?utf-8?B?TkNzZGorZmFRK01ndjUzSUdpQjZTdFlPcnBiOFpaQVNUK2lGbFd2QzQ1SFlM?=
 =?utf-8?B?TkxTNzVLTFlZZElZdStiMHF5TEI4L0d6STJPUDU5LzBqS1pWalErWFlpR0dp?=
 =?utf-8?B?QXNVVVcyVW9RdnFBV0VsU0Z2K0RLMzB5aWIzclhTc3paV0lUanRDK1ZvTjU3?=
 =?utf-8?Q?3uhWDb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:13:17.1040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f627e11-dc9f-4e92-fb0c-08ddf47b2988
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 9/15/25 03:35, Karol Wachowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>
> Remove references to firmware boot parameters that were never used
> by any production version of device firmware.
>
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_fw.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 6e0941d324a8..32f513499829 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -518,11 +518,6 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg = 0x%x\n",
>   		 boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg);
>   
> -	ivpu_dbg(vdev, FW_BOOT, "boot_params.global_memory_allocator_base = 0x%llx\n",
> -		 boot_params->global_memory_allocator_base);
> -	ivpu_dbg(vdev, FW_BOOT, "boot_params.global_memory_allocator_size = 0x%x\n",
> -		 boot_params->global_memory_allocator_size);
> -
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.shave_nn_fw_base = 0x%llx\n",
>   		 boot_params->shave_nn_fw_base);
>   
> @@ -530,10 +525,6 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>   		 boot_params->watchdog_irq_mss);
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.watchdog_irq_nce = 0x%x\n",
>   		 boot_params->watchdog_irq_nce);
> -	ivpu_dbg(vdev, FW_BOOT, "boot_params.host_to_vpu_irq = 0x%x\n",
> -		 boot_params->host_to_vpu_irq);
> -	ivpu_dbg(vdev, FW_BOOT, "boot_params.job_done_irq = 0x%x\n",
> -		 boot_params->job_done_irq);
>   
>   	ivpu_dbg(vdev, FW_BOOT, "boot_params.host_version_id = 0x%x\n",
>   		 boot_params->host_version_id);
