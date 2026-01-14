Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A31D20AB4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 18:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5B110E61F;
	Wed, 14 Jan 2026 17:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="u11fS0Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazhn15013060.outbound.protection.outlook.com
 [52.102.133.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95AB10E61F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 17:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzFzslyThE5ssibh8jele4hdAaxl8V8lbxZMRDDCW0Y/ExN6qzvMgoYYuwiFj+vgjbU2QBD2CBNU46DuvVjaKXKWMDKe9vj+MtQg97gxNvScsv/A8Cwz3gJdkDkDLe3CQ/BXgPJQ6NtlbdKTuhdSI2x9tbBiOOhZ7BmclthDzazQ103FgS/zMfe6hNd3AIjxKdV+1hzdBjReIsOjqoy54TzsDxDP9xrLZuU8tU8lRK0b3OBRtQHwl3J2hQ4b3xSw3NAdObVRDxLLrRoiUSJUGxT+2e9MC8NGc4RBruCkrHt5pjS84S8OsIuay34D5AM9nDRR/8LKWJ/G5QtdRkXwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQnvywff7wkwvXpqcEbTNMsS7mGtvWlFE6qbpAYERng=;
 b=xFKMT+NzFyiGyQUcDAVxdQ8kN4S3uXXixXB8kUbMs1QDMcNefAGSDSU3jP0ne1FTjJFH4ON59m1Qyz5o2mbqXx7moxwrensjsYK9wi1wEYNxpsBnqOu0g/MC4lcbFjXIACAekrBzoCxg98gitNlZlLRuasyOzxKLPjWjc0jyxKTMoqUK/QWRt+MX/aZz08Iz9U2cqY/yeOWjgg0k6tTSx0wui4FjeIwOC6D2wzlpkQpf9nrmVttNXLhH5gQFkTIuqemVsxJk2jynXEnqcvoRMn7VWi5R/BylpVklWejGr1r7MXLalvfH9fryfsvH4AQ1IkYbVao3VaSQAufwGKPRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQnvywff7wkwvXpqcEbTNMsS7mGtvWlFE6qbpAYERng=;
 b=u11fS0MhAfvGPijb5D4m/ja/2+haI9y2BolfDvqNC7CtzI9kOD+Jt8HmdOLk7xMjGzyuon88VEiER4wFlNzLFYunMzhqY8OCJpla7tlplmWgPRAP6qYR20yXGzZU0I6TssdNyMYI1y2KpD//31v+JpHOTPEZkx8aaQZm/1a3TNE=
Received: from DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36)
 by SA1PR10MB5736.namprd10.prod.outlook.com (2603:10b6:806:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 17:53:46 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::93) by DM6PR02CA0059.outlook.office365.com
 (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 17:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:53:44 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:53:10 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:53:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 11:53:06 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EHr5sR059224;
 Wed, 14 Jan 2026 11:53:05 -0600
Message-ID: <d9b0d6d5-6f1a-4cb0-a8ab-5e3fdaf33fa5@ti.com>
Date: Wed, 14 Jan 2026 11:53:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add
 memory pool for DSP i/o buffers
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Randolph Sapp" <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, Andrei
 Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robert Nelson
 <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
 <20260114-thames-v2-1-e94a6636e050@tomeuvizoso.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260114-thames-v2-1-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SA1PR10MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 6764148e-862c-4732-1fa4-08de5395dcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|34020700016|1800799024|82310400026|36860700013|376014|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blF3cFljZWdib2FHOWNKekRBSDhNQ25jdDNQSHhiQmRlcWdrZzZJanFCVitq?=
 =?utf-8?B?OXlNVmxwSStPSktpb21TNFp0aVVoZ2dwZGdRcnlnRHQ5MSs3TzZtcTdzUE9l?=
 =?utf-8?B?bUExTW5NTHhpTjl4TFk4aHRWVzF5dzdwazRBOXF2QnNnNnAvNGVFL1VsTW1h?=
 =?utf-8?B?eEJhbUUxZmVoN2hiMW9MVVUvQTVhRmFIcVZUVE10MTZDQjRoeVBVb2dQQjFk?=
 =?utf-8?B?eTIxZWNrRFBicnVpSU5MdjR4NTM1YjMwbDNhQUZqdlVJZVpDOGZCRFRyb2Jn?=
 =?utf-8?B?Rk8xb3R2U2V1c1JhVFUvNWJSUThWVGVpTThud2ZoNkRoZTRETlh0RS94eldX?=
 =?utf-8?B?YjVjYUNZUWtOeHlsdDhFMytkK0RTQWlZVmVCNWJTZ0NpVUwyREVxRC9IcWQ2?=
 =?utf-8?B?V3crQlVFVG0waEpuT0JPc0NNNjI0UWdjVnRPZGJNS04xTHkrUmxmZVVLZWZR?=
 =?utf-8?B?T2pkeWdkc2Q2SGFCSUNSRFFONmszZGh2QVJVSC9pMWUwNjk2cWVJUDNJSlJH?=
 =?utf-8?B?UWdQS2oraHdjNURObGczOUtiWHVIZlBkaWQxdjhmMFNRTjdVOGZEaXIvVHF6?=
 =?utf-8?B?RkZVZlczYkQxbDV1SUVXbFZ2dkNIMXAyenJrOVpJRWxNbEY2WDhYUmo1QW5M?=
 =?utf-8?B?YkNnSVh2SVJCRVZOMExreUhSWDJFOXE4RkdkOSsxQjNGSnFlRDN6TXFybjE0?=
 =?utf-8?B?Rmh0clRSbllESFlHeTZXVjBueTJKRHN3amN1NkN1Q0JMdVpuUlFDcDJOMFlZ?=
 =?utf-8?B?SE0rQmJCMGdIZzlvTDFjQWJZa0F5ZWRUTlU2ZXJLMzhkSFAzeE5nakxOODdh?=
 =?utf-8?B?dkg0ZXRMdlVLRkIxVWQvNWM4aEFwcWVBVUs1TGkxN0Y5YjVieEZKbTBSZFpC?=
 =?utf-8?B?Y2hwT0dMTWJxTUV4TXptMlZCQ3AvQTAxT0NncnpJRlhxL2NWRDVkblQyRnJZ?=
 =?utf-8?B?elpjdnZzT1VlUDliS0dNbHJRdG9HNm9NdEVDNzZydkdoQTlQLy9GN1h1dDVE?=
 =?utf-8?B?QzRVVWovclY0Q3FIaXkySHpQbCtMS1JOUGZVQTFZMWR4YUVXNi9UNHdmaVJr?=
 =?utf-8?B?SkxEOS9BSWs1YXlvVTE1cmJqYnRBWFlBZVVLU05sbzNkR3NPcFJ0STBOcmlp?=
 =?utf-8?B?RHVJUzlqNW8xSWxQbHNDWW0xU2xGZ2RCeWg1Mzdja1VuQkZsNGl1MWZEZGlo?=
 =?utf-8?B?SWhsZGlISjBLdzA2VzVvWjR3dysxVVh6Z0ZpMzdLZG4rdVVYdHNoMlhIR3FQ?=
 =?utf-8?B?elEzYkxSZWN1RkMwcVpMNk5RamtjYVpHOTdRSjVZbTFIYmtvV0N4bm1keTNv?=
 =?utf-8?B?Z0xlSjlQZnVKUXlyZ2NFdzMwOGlYTTZVdzZNQ1Y1aXc5Y01ZTnlSdG1Wamwy?=
 =?utf-8?B?MHZPaDBSYnBDZE92cTgrZkp2MnRvMnpnZG9pVVN4bjZ0VkViSHlOMlVFbHNZ?=
 =?utf-8?B?YlFiVWxackdIallOK0tJdmkzSjVDUFBSeUc4TVdnSEtBMzhaN2xSdEpyWitt?=
 =?utf-8?B?aFpWVmFHUE13bm4ybW42U0E5YmY5NEZ2ZVM0emNMb1lRdkU3YXpUR3RPbGtX?=
 =?utf-8?B?dG91cTE2SWVRdTY2MXZvVllnVStoR0FPY0w0dGhtNHBZREtrdStWOTlzYlFL?=
 =?utf-8?B?T2pzNk9MSUtGcXJzc1Q3NHU5N1AyOVhTdzlFRHZXYzJFS0ozNEx2ZVM0TElG?=
 =?utf-8?B?RUtLVVZVNTRSV1d4Q3VaaFZQQllIdndyaFdvc3NnakRmV0NnWWczNENoc0pC?=
 =?utf-8?B?MEFtK1orRytEUlcwTWx2ay9FalpUYjZlSjh2aDREOE5lcC9nUHhIbi9maU1F?=
 =?utf-8?B?OWs3TFU5MTRKZEZ3TjF0TnRzdnRIT3VJbjVnV1BSRjlua3NhNDVJbjZveHRH?=
 =?utf-8?B?VlZuZkhCVThkeFA0Qll0cGdnMlBWRzFSc0doVml0dWQzdDgzQURMbUNoWnQ0?=
 =?utf-8?B?RnBSYXBpYWdzOThuVnJRL3VXU3YyZzJBN2ExOWNqc2xvbXlTTUlxeFVaODAx?=
 =?utf-8?B?eUloZWF4SXg2eDRjSytXOUxyOWFUeTlDSng3TTF5NlpvZVU1aVZhMmkrRkZK?=
 =?utf-8?B?LzQ3QjB3aldEc1JhTUNJek40bDFEOTRhN092d29UMFZOYnNyR0dEeXJMVC8z?=
 =?utf-8?B?em5KdUErY2FiZ0JCdndXKzBGbjkyMEY5RkV0Skd3UDMzSmNVTnZKaE1IeGFP?=
 =?utf-8?B?VWxEM3N4ei9uT2FMakVlM2llM1l1b3pWZXoydzBFZFkxalpPSzFSbmp4bnA5?=
 =?utf-8?Q?BOxv3DHy+2ejvODsEehrQzpB1CUVtjOId1pVAN5kRw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(34020700016)(1800799024)(82310400026)(36860700013)(376014)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:53:44.9811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6764148e-862c-4732-1fa4-08de5395dcad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5736
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

On 1/14/26 2:46 AM, Tomeu Vizoso wrote:
> This memory region is used by the DRM/accel driver to allocate addresses
> for buffers that are used for communication with the DSP cores and for
> their intermediate results.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
> @@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
>   		no-map;
>   	};
>   
> +	c7x_iova_pool: iommu-pool@a7000000 {
> +		reg = <0x00 0xa7000000 0x00 0x18200000>;
> +		no-map;

Could you expand on why this carveout is needed? The C7 NPU has a full
MMU and should be able to work with any buffer Linux allocates from any
address, even non-contiguous buffers too.

Communication should already happen over the existing RPMSG channels
without needing extra buffers. And space for intermediate results
should be provided dynamically by the drivers (I believe that would
match how GPUs without dedicated memory handle getting intermediate
buffers space from system memory these days, but do correct me if
I'm wrong about that one).

Andrew

> +	};
> +
>   	c7x_1_dma_memory_region: memory@a4000000 {
>   		compatible = "shared-dma-pool";
>   		reg = <0x00 0xa4000000 0x00 0x100000>;
> @@ -151,13 +156,15 @@ &main_r5fss0_core0 {
>   &c7x_0 {
>   	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
>   	memory-region = <&c7x_0_dma_memory_region>,
> -			<&c7x_0_memory_region>;
> +			<&c7x_0_memory_region>,
> +			<&c7x_iova_pool>;
>   	status = "okay";
>   };
>   
>   &c7x_1 {
>   	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
>   	memory-region = <&c7x_1_dma_memory_region>,
> -			<&c7x_1_memory_region>;
> +			<&c7x_1_memory_region>,
> +			<&c7x_iova_pool>;
>   	status = "okay";
>   };
> 

