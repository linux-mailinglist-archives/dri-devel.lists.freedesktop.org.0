Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3420AC6ED6
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776410E65C;
	Wed, 28 May 2025 17:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UdOfyCZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C0710E69A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4TLbUD0btHLJDLhy5AebRYbBo/mrMOvJ2Lse9i4F1/2Hv3fxIdGiWpwVt48oO6K7DEONxdLHYHZef6AVIQ5PFTizUn8OhzJO/s/GJ3Tz5CmjJTEalt+rPiaGMadww+WwHuAKdsdkA3vUf51EkPxGjcpkcZ4gkpofHEjh2oPFzCoo33goTQpAQZVoQB+/LYtAmWzwb34TA3ZRPUr+lyLIBCb3CY8uD42ms2K1EZSEV1+YkS03szjIMnfm7BuR47+e5A+pNU8jqicfoTkK5j1O/Ie4wjt3OY0208Jf29M47YCb15TixQzCrGPfzQR92nCai8ezhNHnA9PU1v/y028mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di3WOrSotwS3Sy6s72Rqruqx/6x5kx7rNsLhoITwi6A=;
 b=j3GFbBOPwmCOutoTtm2/eSWEKian6hZFVDZSRoWnMNWY7+TEenbgaz7x7+cEsosQ1TDogfhZIdi5G1WhHOYDdIVeUu7ipHkkSPT8HKd8msMn5Pq71fjFhsvGACuiW/6GRIOlBmhFZrc+5i9GhoGOEl/laPma5gS13/DUcEGVk0mDvZyeE7akWnHoP8FxTxIeR7L1W6IaDp8yvN+vcdvaWWNfbfQkRjRBFcaclXp1qB9oA+p6L4lNjBbOPGhCRpMXHSe/ds6ghGsfhKMg+dJCHp+rLCFhOgvANcyLEKWwkdV1e3R3PLOkOP2Da4BplhgqfAS5mZ28PFN72mmVQSA2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di3WOrSotwS3Sy6s72Rqruqx/6x5kx7rNsLhoITwi6A=;
 b=UdOfyCZiEccvGWoVnAVv3TSZIkk6RLTlCSFzqsoCVYzGXGUv9Qzm0+8jHLp1IU2BlLZ/jBEgQst3sFb63iLZbMeDYmmIEWsb6pLYgnLDrGOACP/TLJcFdJvPa4qpF2dDvdwSMz9y1FJEafgyANDC/w+m/j4tRpxTCLjPB0rhVd0=
Received: from PH8PR07CA0046.namprd07.prod.outlook.com (2603:10b6:510:2cf::24)
 by DS4PR12MB9611.namprd12.prod.outlook.com (2603:10b6:8:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 17:14:39 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::69) by PH8PR07CA0046.outlook.office365.com
 (2603:10b6:510:2cf::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 17:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 17:14:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 12:14:37 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 May 2025 12:14:37 -0500
Message-ID: <7c0b8692-f367-e4d4-14ef-71e226f0814d@amd.com>
Date: Wed, 28 May 2025 10:14:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/ivpu: Fix warning in ivpu_gem_bo_free()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250528171220.513225-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DS4PR12MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: b772f6b3-163c-4195-5c96-08dd9e0b2078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHpqMUdPVitYUTE3Zm5HcDk2Q2p0cEdLbEs2TGMxd3J0TXRRV1pCN1hXcWFy?=
 =?utf-8?B?WE5OUXpvamRabXhuNk5WNWZ5MTlBQXR0VGg4ejNaeUlPZ3h3MzRoT2kvS2Ir?=
 =?utf-8?B?TFY1dTcxMjVoYlNwVFFQMThwZ0VFdFV3ejNsMVhHUXNHaVdWYkozY256dGQ3?=
 =?utf-8?B?VUoxS1MzYkRub1hQMHczMzdiRFd4b2VGQ0Y4ZUxxbFd2amJwYSsrWS9zWEpt?=
 =?utf-8?B?UnAxRzdRZ21kV1psNmI3SU9nT1I5MzluV1Jzb0RDN3dqbnRIV3pUaE9KcXM2?=
 =?utf-8?B?clRpYXVWWklkdXRWNFluQUxlQndBR1JFc0RQNUNCclFOQUlEa2U1Z2FHK3Y2?=
 =?utf-8?B?djJGMUFXZkVhaGo5MGFXSG8yb0l1cGRYNkpmd0xZOTJRL2JvSE1XZzQ2TmIx?=
 =?utf-8?B?dUVlUlV2Lyt5N1dUM09NYzRMYmRBNmkzSzB6cWdPNTRlb3ZkQVZFZTJ0S0RD?=
 =?utf-8?B?WGhIREtrUkhTaXA4UFprWkxvdnEzSTNLT1Y1ekgzQ1JzNk5FRElDcVBsQXJv?=
 =?utf-8?B?WmZOQXR1NHQvUXR2SWs2enJzalRYZUxENlczNGJqMGo5K0dtUWdLUCs4b2kx?=
 =?utf-8?B?VDc4WVV1bUw4ZzUralJSTGJvb1NnVjZ2YTRoaVpFeFBoRlZKVlZ3ZjF6aVpC?=
 =?utf-8?B?cXRQMHhNQktXMlpQOVFhOVlPVGhQSEF0VW80dTh1a2xQNklvcmFJVHRGWVpa?=
 =?utf-8?B?dXlmZ1ZTZzNtSGw1T2QrZjlLQmxkazg3eW9PM0hIblNQWlFPK1Bac1B0bTc2?=
 =?utf-8?B?ZDVNYWFGSUQrSG1ZQ3pIazViWENodkt3eCtjL3BOSStCenBQSW1HWW9LU0Q3?=
 =?utf-8?B?N256eUIvMS9mNnlLOTF0NmZCY3R1TTN1bktOVmtIQkY3ZSt2V0h3eXV0Mkpw?=
 =?utf-8?B?OXpUOFZOQlU2bGFwRjlCV3RKWkkyWCthTkR6TkxLMyt6YjUwV1pRQjViS2gz?=
 =?utf-8?B?c3FUOTJaVmxjL3BqcURsM29QN3ZtMHpHOWpCQTc4cHRYR29zVzRvNG54Y25G?=
 =?utf-8?B?QWttWXl1ck81VkM2ZWJ2eGQvbWpoMlQ3QWNNOWxXcUU1T2pJWlczNU1LR1Na?=
 =?utf-8?B?Ukx6dUhkSU0yM2J6OWFrVW1YMzFaRVJlNDgzaUx0VzVsYUdLZ2xhR3ViUllO?=
 =?utf-8?B?WFZhV2NHQ254SFZTVjlVODNJWk1rM2FiM203UDBWWHFzRjU0Z0I4clpaZ1dM?=
 =?utf-8?B?OGdTRzdYSlRGTmR0clBUTWZtNDVveGY1bkhzK0p1VkJwYXdzWkRsRk1ya3BC?=
 =?utf-8?B?L1RNWWxlK2cyK083NjFUQjlFNXZMdlN4N28wbkhUQm1aWEhLbDJRK05CY0l4?=
 =?utf-8?B?L01uYmpaUWZ1Z1NydVJXYm5GbTNaV1VBeUY2clNXNVVWQmlOVE11cnZEQkhu?=
 =?utf-8?B?WnR2aytZdDdER3pmNDFsUkxydHBtY3hlWEE4NUlaVzRHRVBpb1lRdFVqUHNM?=
 =?utf-8?B?NjdXNHBVUjQveTVWR3lsUnhXWSthSzl0cFRyN0NPdU9FbHRlQ1JJcXJqMTZn?=
 =?utf-8?B?Rlp3TUlFZ3hMWnhjc1NOSFRIRjR1OXNvM3JBeG9PbGpLVndMOHFDbkpZWkJm?=
 =?utf-8?B?ZWdhMHkzbmdxTmM0b2M1Y0w1N1lQaGdvZlhjak9CNHg0N2ljYTd3bmlIY2NC?=
 =?utf-8?B?ZkhscmpEQVFURVRPeHlVTjE5UXRTUHFtSDEydmJwQ29ScTkzQkpuRnVSVkxD?=
 =?utf-8?B?VTJQOUVacXcyeWtOSTg0L25YNU1KQTMyQzZCTUxnMGJVMmlyM29KRm9MaE81?=
 =?utf-8?B?U3k5dXRqQmdBekxzUjRXK2EvdTlHd1l4Rm1SZFZQcnBmTVVvcllJU3d5UWRn?=
 =?utf-8?B?cFpmZjBHNmZ4QXZVM2s4VG5pOVpYVDlQSmVQRkhncUxZM3BzVW45L1lkd3lU?=
 =?utf-8?B?VWdMNnhtSVM5OHB6N3FCK0M0bFdrVVN1UDRqVENUOWoxZG9yd0ZZRzJhOUNn?=
 =?utf-8?B?Q1B5ZW56QUxFS0VBazFCanVNQnZYME9janpTaU1WM1NMOGFhUHI0UTU5QUE2?=
 =?utf-8?B?eUpCUVcwTHB3N2ZXT2NZWW5RcTgrbE5RNXZZaGFjeGpFemJXYXoyVjJnb3VE?=
 =?utf-8?Q?X0HuZx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:14:38.2057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b772f6b3-163c-4195-5c96-08dd9e0b2078
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9611
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


On 5/28/25 10:12, Jacek Lawrynowicz wrote:
> Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
> can be indeed used in the original context/driver.
>
> Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
> Cc: stable@vger.kernel.org # v6.3
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
> v2: Use drm_gem_is_imported() to check if the buffer is imported.
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index c193a80241f5f..5ff0bac739fc9 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -278,7 +278,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>   	list_del(&bo->bo_list_node);
>   	mutex_unlock(&vdev->bo_list_lock);
>   
> -	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> +	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base) &&
> +		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
>   	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
>   
