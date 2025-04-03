Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61317A7AEF5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72A10EA5A;
	Thu,  3 Apr 2025 20:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nMA7srtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B208F10EA5A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOJVazmNcnj5bHDuAw1jIL26zSRPlJXH4iy3lDbc7j1YtEQFbZupaQjZBKSIz8mN2Z83keqkq7EeAVsZKrZ18eKYO9qsybzEJBjkCAhIw0U5Fldq0Kdimoqs+EHG36h9Vlg7fWRtl1WP5G9QBwJS4KofPV2BDEE+eYPEYtD5JiH1eG8p3SdhVg3GZhp4EOt4Y8c/VtU1Vx/qJtBjgvR8Gollxt0i/VidDSor6QVdKjYUaUaYdCF0jILsHWYDece/8k4JdGQa5B5s9pcmBHY2d2om8YFdIQsSdcz2Kdx1dUeZFX55pMZRbDGDRZKhhbCXKz7CfyfvIhKcwJfNwtTvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF97LyW2fjmmnucA1QkpuWwPW4F2qJzYhXj4PrrQvPc=;
 b=o2fIH2EghAM1uRM7Rq1/2jdeD88w1Ud4wMJexaQoGeoYlH24uxU3G63++jy7ITlKsNr3EKxQds2BcPV4ngPVvHOBKSonC53Leg/itn/NG4P7JdcCuhP1hwW5azaX/2Ui36NOQP+tuGW/4xYdX9ncRG77Z0xWyf5uExRXAr6dQ1OewBDvg8eFW6wS4e/WogID5hYn0g733Vflj1vuZJHNku8JTNs18Od/nI6n4yVFlxxor97ChJa5RL6Bcv5kVrB1ESKk36FHFdFLoqyySuP7RnTtShKv01W4KJtmNbbRUFodaVdJE/tGorcWmKIBNo1kXfS4tTxp8YI5bhnKDOdkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF97LyW2fjmmnucA1QkpuWwPW4F2qJzYhXj4PrrQvPc=;
 b=nMA7srtgjG3rehfJctEYYnf/SiRSbapgr0ALgArUnBiYlwtDg+Mc9kN8H8UbY/iIw4Pa6HTH6aMRCE2tqU6C0aqNDXK2WQN5uXI8ysOIS+pm0ace7A77BmkopI3K2XFuNBw8TD/Lrf+VAaCLJZxY6GL3eutY9xH4Ylr16WlRLJw=
Received: from BY5PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:180::45)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 20:38:55 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::61) by BY5PR13CA0032.outlook.office365.com
 (2603:10b6:a03:180::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via Frontend Transport; Thu,
 3 Apr 2025 20:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 20:38:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 15:38:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 15:38:52 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 15:38:51 -0500
Message-ID: <4642f313-56be-6199-3e65-0fa34f343a52@amd.com>
Date: Thu, 3 Apr 2025 13:38:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Update FW Boot API to version 3.28.3
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, Karol Wachowski
 <karol.wachowski@intel.com>
References: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250401155817.4049220-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SA3PR12MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: b101fafe-b2ce-40a0-3d02-08dd72ef8cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDc3aENPeXVENWJMaWpEblYrOW1SU3BtSTdMdW1uanhSNUp0b3VRTXdBQzdl?=
 =?utf-8?B?ODVzODh1T0lpZkJLaXZtQlo2Z3ZsY2E2NFNrY0hpaVF0Vm51OHRabmRjTHha?=
 =?utf-8?B?T254MzN4M1hvY2cxbTE3UWlMNTlDRU9UVkdMSGoxTmtoY1BtMllTSVRDVHRn?=
 =?utf-8?B?UGNMYlhmSjNKa29FN2w4aG12MzFwVlVmWTdxbkROcU50TVkvcmJ0aTBydThi?=
 =?utf-8?B?eHpKU0F5bytxOVRqUERLamo3OGNQczFiQ21sY0kwUHo4NkFKc1BaMmVnSWQ0?=
 =?utf-8?B?a205c083TXQvYUgwUmt3dnNCbjJDWFJxZXEvbU4vUXFEWmtTQ0ZTWDdmSXNG?=
 =?utf-8?B?dkowZ0M4ZTczcGZMKzRSazAwQUs3SEQ5TWFuaEhHS1AzTnJFdmF2WjE5ejF4?=
 =?utf-8?B?SXFsTDVpeUtOV0ovQ0RCMU5kZ0VDa0ZLKzdLRkFqL0RvY05DVkJ2ZEZkVkgx?=
 =?utf-8?B?K2xpTG1ta2VZQXBVMkJ6MUwvL2RqME9BVW5qY3ZVTXBqU1RybjY1cE9vWDBn?=
 =?utf-8?B?RTl5M082NGJKaXVRQVpGNUZxOHhhNXpBZkRFQ09hNzJrN2FLd1k2bVdXZHdM?=
 =?utf-8?B?YjMvQi9nNnhiajBpZFE0aWtXc0x0eGQ3VnhFSDRBMW9ZUlpYWEVTUjBFYm91?=
 =?utf-8?B?UjArTHBtZys4V1p4WjQ2elZuajVBMXJYenVOOU9EckpIdmpLMDh0YzdWYnJI?=
 =?utf-8?B?eS9MWnBNT3hNV3l2TXVjSTZyZzBDUHFDcndaQ1dlYjMrQ0FpN0JhUFlpRURu?=
 =?utf-8?B?NWFpTFh6MHRlRVVwNmJpUUNRc2RSZ2E3ZHdtU2FqZmNhVjhGY0dMQ1piTy92?=
 =?utf-8?B?R0ZwLzByMm9wMW1mZXlPNzFYTzNhUjJCMjVueWpOaUt3SnVReXU5MUlzdHdW?=
 =?utf-8?B?d0hrMmtRMWNqWVNFN1JsKzV1SnM1K1NNeHlFendoWjllSHFySFRWbTE0ZkMz?=
 =?utf-8?B?RVBZbWUvMndNL0kzRWRsTWJYMm5vTkF2Q0xQcWd1ZGZWN0RJVHhwTmlGWS83?=
 =?utf-8?B?QVo2VHdHajBjYlZzRVV3MitNSDJ5aEVIb3pObjgybU5GejRMN3o4aTEzRSth?=
 =?utf-8?B?RjVidGxyY0IrcTh0K1BScjF1aVVoQWFNcGxnL2RyQ0VZL1pKZmx2V2xUMVEy?=
 =?utf-8?B?OXgwS3djYjJ6RzVwM055dG9qTTBsamRZLzkyN1FxcE9OTVJaNWYrN3NDTkRI?=
 =?utf-8?B?T3YyZWdzbU9qOFEzaDBaVjZtdkhMeHVxOFJtR1BFeEEwOFplaFZSa0k4WVJt?=
 =?utf-8?B?aW1aL2lyeGpQQzNOdittQm9SbUF3Nkd1czcxZ3I4ZVNRUFZLemZoajNBRHpw?=
 =?utf-8?B?dDZhVnhwZUc1TjhVb05FT3lIcldyWnlKcHJjSExFTlUvUEwxdkZ2Z3p3NXBD?=
 =?utf-8?B?dE1KNm5GRzErRmE2Z1drYU1pSDhxcVIxQkNBWGdaN0xiUHJITlluMjA0cDdi?=
 =?utf-8?B?dFdmOWV6dkM3bUEyUGdqTVorRGZqUWVteTZndGlUVnU0aExzS2lFb3NDOFE2?=
 =?utf-8?B?blU4ZWl6MU55SnNMSjZMNHNjbVByWWZqK25rdFREWXlYL1RON0dMZGFTZE1P?=
 =?utf-8?B?Q3VNOGRKQ2Z0YW8yWVVUSzUyZkdIZGVGdmt4SkdxUU5MZWRQVjhXS1EyQ1NY?=
 =?utf-8?B?SWk0RGE4SFJJZXVhQ0dwTi9tcTkxNkJXeW1nSzZCUDBwZ0RzZUk0TkFXRXRZ?=
 =?utf-8?B?YlhxSjV5Y2lna0JqdTJWZW4zcys4TDZGUklrY3hHemp4M0N6NmNRSkxzNW9m?=
 =?utf-8?B?cjlYWVc0a1ZYVFltVWpENTh1VlZ5RTVtU25IY3ltdDFxM2xZbnBDbEJ3NkZN?=
 =?utf-8?B?cVFzN2kvcXBwTUw4Q1dHWjQ3aTZZYVNKN1JVcWNkc0FGL0NjZWpBZTJudyt0?=
 =?utf-8?B?KzA1QytUUXpUNmdpbWF3MGp2V3VKL2p2MmxZQWxLUnpEUHJTejNLdE1MaFcr?=
 =?utf-8?B?VlNlcENBWGIyeGRpV2w1Znk0Q04yOERzNlE1ZFdBYmlNZkc1aGNFbHMxcjlF?=
 =?utf-8?Q?YBJysUQ6EsE/t5vtdstkmBhGQQoSzE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:38:53.8641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b101fafe-b2ce-40a0-3d02-08dd72ef8cb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762
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


On 4/1/25 08:58, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
>
> This commit bumps FW Boot API to 3.28.3.

Bump FW Boot API ...

Please see: 
https://www.kernel.org/doc/html/v6.14/process/submitting-patches.html

Lizhi

>
> Use new preemption buffer size fields from FW header added to
> firmware boot API for preemption buffers allocations,
> if those new fields are zeroed use old values instead.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_fw.c      | 14 ++++++--
>   drivers/accel/ivpu/vpu_boot_api.h | 13 ++++++--
>   drivers/accel/ivpu/vpu_jsm_api.h  | 53 +++++++++++++++++++++----------
>   3 files changed, 58 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 7a1bb92d8c81..3799231b39e7 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -233,10 +233,20 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   	fw->dvfs_mode = 0;
>   
>   	fw->sched_mode = ivpu_fw_sched_mode_select(vdev, fw_hdr);
> -	fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
> -	fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
>   	ivpu_info(vdev, "Scheduler mode: %s\n", fw->sched_mode ? "HW" : "OS");
>   
> +	if (fw_hdr->preemption_buffer_1_max_size)
> +		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_max_size;
> +	else
> +		fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
> +
> +	if (fw_hdr->preemption_buffer_2_max_size)
> +		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_max_size;
> +	else
> +		fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
> +	ivpu_dbg(vdev, FW_BOOT, "Preemption buffer sizes: primary %u, secondary %u\n",
> +		 fw->primary_preempt_buf_size, fw->secondary_preempt_buf_size);
> +
>   	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
>   								 fw_hdr->ro_section_size,
>   								 fw_hdr->image_load_address,
> diff --git a/drivers/accel/ivpu/vpu_boot_api.h b/drivers/accel/ivpu/vpu_boot_api.h
> index 908e68ea1c39..218468bbbcad 100644
> --- a/drivers/accel/ivpu/vpu_boot_api.h
> +++ b/drivers/accel/ivpu/vpu_boot_api.h
> @@ -26,7 +26,7 @@
>    * Minor version changes when API backward compatibility is preserved.
>    * Resets to 0 if Major version is incremented.
>    */
> -#define VPU_BOOT_API_VER_MINOR 26
> +#define VPU_BOOT_API_VER_MINOR 28
>   
>   /*
>    * API header changed (field names, documentation, formatting) but API itself has not been changed
> @@ -76,8 +76,15 @@ struct vpu_firmware_header {
>   	 * submission queue size and device capabilities.
>   	 */
>   	u32 preemption_buffer_2_size;
> +	/*
> +	 * Maximum preemption buffer size that the FW can use: no need for the host
> +	 * driver to allocate more space than that specified by these fields.
> +	 * A value of 0 means no declared limit.
> +	 */
> +	u32 preemption_buffer_1_max_size;
> +	u32 preemption_buffer_2_max_size;
>   	/* Space reserved for future preemption-related fields. */
> -	u32 preemption_reserved[6];
> +	u32 preemption_reserved[4];
>   	/* FW image read only section start address, 4KB aligned */
>   	u64 ro_section_start_address;
>   	/* FW image read only section size, 4KB aligned */
> @@ -134,7 +141,7 @@ enum vpu_trace_destination {
>   /*
>    * Processor bit shifts (for loggable HW components).
>    */
> -#define VPU_TRACE_PROC_BIT_ARM	     0
> +#define VPU_TRACE_PROC_BIT_RESERVED  0
>   #define VPU_TRACE_PROC_BIT_LRT	     1
>   #define VPU_TRACE_PROC_BIT_LNN	     2
>   #define VPU_TRACE_PROC_BIT_SHV_0     3
> diff --git a/drivers/accel/ivpu/vpu_jsm_api.h b/drivers/accel/ivpu/vpu_jsm_api.h
> index 7215c144158c..4b6b2b3d2583 100644
> --- a/drivers/accel/ivpu/vpu_jsm_api.h
> +++ b/drivers/accel/ivpu/vpu_jsm_api.h
> @@ -22,7 +22,7 @@
>   /*
>    * Minor version changes when API backward compatibility is preserved.
>    */
> -#define VPU_JSM_API_VER_MINOR 25
> +#define VPU_JSM_API_VER_MINOR 29
>   
>   /*
>    * API header changed (field names, documentation, formatting) but API itself has not been changed
> @@ -53,8 +53,7 @@
>    * Engine indexes.
>    */
>   #define VPU_ENGINE_COMPUTE 0
> -#define VPU_ENGINE_COPY	   1
> -#define VPU_ENGINE_NB	   2
> +#define VPU_ENGINE_NB	   1
>   
>   /*
>    * VPU status values.
> @@ -126,11 +125,13 @@ enum {
>   	 * When set, indicates that job queue uses native fences (as inline commands
>   	 * in job queue). Such queues may also use legacy fences (as commands in batch buffers).
>   	 * When cleared, indicates the job queue only uses legacy fences.
> -	 * NOTE: For queues using native fences, VPU expects that all jobs in the queue
> -	 * are immediately followed by an inline command object. This object is expected
> -	 * to be a fence signal command in most cases, but can also be a NOP in case the host
> -	 * does not need per-job fence signalling. Other inline commands objects can be
> -	 * inserted between "job and inline command" pairs.
> +	 * NOTES:
> +	 *   1. For queues using native fences, VPU expects that all jobs in the queue
> +	 *      are immediately followed by an inline command object. This object is expected
> +	 *      to be a fence signal command in most cases, but can also be a NOP in case the host
> +	 *      does not need per-job fence signalling. Other inline commands objects can be
> +	 *      inserted between "job and inline command" pairs.
> +	 *  2. Native fence queues are only supported on VPU 40xx onwards.
>   	 */
>   	VPU_JOB_QUEUE_FLAGS_USE_NATIVE_FENCE_MASK = (1 << 1U),
>   
> @@ -275,6 +276,8 @@ struct vpu_inline_cmd {
>   			u64 value;
>   			/* User VA of the log buffer in which to add log entry on completion. */
>   			u64 log_buffer_va;
> +			/* NPU private data. */
> +			u64 npu_private_data;
>   		} fence;
>   		/* Other commands do not have a payload. */
>   		/* Payload definition for future inline commands can be inserted here. */
> @@ -791,12 +794,22 @@ struct vpu_jsm_metric_streamer_update {
>   	/** Metric group mask that identifies metric streamer instance. */
>   	u64 metric_group_mask;
>   	/**
> -	 * Address and size of the buffer where the VPU will write metric data. If
> -	 * the buffer address is 0 or same as the currently used buffer the VPU will
> -	 * continue writing metric data to the current buffer. In this case the
> -	 * buffer size is ignored and the size of the current buffer is unchanged.
> -	 * If the address is non-zero and differs from the current buffer address the
> -	 * VPU will immediately switch data collection to the new buffer.
> +	 * Address and size of the buffer where the VPU will write metric data.
> +	 * This member dictates how the update operation should perform:
> +	 * 1. client needs information about the number of collected samples and the
> +	 *   amount of data written to the current buffer
> +	 * 2. client wants to switch to a new buffer
> +	 *
> +	 * Case 1. is identified by the buffer address being 0 or the same as the
> +	 * currently used buffer address. In this case the buffer size is ignored and
> +	 * the size of the current buffer is unchanged. The VPU will return an update
> +	 * in the vpu_jsm_metric_streamer_done structure. The internal writing position
> +	 * into the buffer is not changed.
> +	 *
> +	 * Case 2. is identified by the address being non-zero and differs from the
> +	 * current buffer address. The VPU will immediately switch data collection to
> +	 * the new buffer. Then the VPU will return an update in the
> +	 * vpu_jsm_metric_streamer_done structure.
>   	 */
>   	u64 buffer_addr;
>   	u64 buffer_size;
> @@ -934,6 +947,7 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
>   	/*
>   	 * Default quantum in 100ns units for scheduling across processes
>   	 * within a priority band
> +	 * Minimum value supported by NPU is 1ms (10000 in 100ns units).
>   	 */
>   	u32 process_quantum[VPU_HWS_NUM_PRIORITY_BANDS];
>   	/*
> @@ -946,8 +960,10 @@ struct vpu_ipc_msg_payload_hws_priority_band_setup {
>   	 * in situations when it's starved by the focus band.
>   	 */
>   	u32 normal_band_percentage;
> -	/* Reserved */
> -	u32 reserved_0;
> +	/*
> +	 * TDR timeout value in milliseconds. Default value of 0 meaning no timeout.
> +	 */
> +	u32 tdr_timeout;
>   };
>   
>   /*
> @@ -1024,7 +1040,10 @@ struct vpu_ipc_msg_payload_hws_set_context_sched_properties {
>   	s32 in_process_priority;
>   	/* Zero padding / Reserved */
>   	u32 reserved_1;
> -	/* Context quantum relative to other contexts of same priority in the same process */
> +	/*
> +	 * Context quantum relative to other contexts of same priority in the same process
> +	 * Minimum value supported by NPU is 1ms (10000 in 100ns units).
> +	 */
>   	u64 context_quantum;
>   	/* Grace period when preempting context of the same priority within the same process */
>   	u64 grace_period_same_priority;
