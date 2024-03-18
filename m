Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326387E94F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 13:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251C710F698;
	Mon, 18 Mar 2024 12:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mk8RMf2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434AA10F693;
 Mon, 18 Mar 2024 12:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXCWTvE4J+TibbkfSPCbp5wl8/xwnnnRvby6SNO4kWyFDtcHh3K1PaeX4yWRYHKnF5rZSLhIz5FAvl1/XdVFcye2r7elCWrfU0NgyhTB1cyMaQT3gr4HjQmlTdoWlktS++5l/qgiyDM5B4qTqghtuWlHq+KIMIAW/4QQPe1CCTVI9LZEbjqEzK07LeCXB2ZfgDmOtm/Qq3AYPJ+7t5wobv6k6F1rL/kA1PjnJM2bbADxhGomP8BXKPvIyZq/Js/RjnA556k/JrCIfJcEjkm1rQwLzYiTvWRJhUYCm44bt1jkoWorLKkyyTwMBnkttL7Y/gG3rNlFamRNx/WR4517VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4DPdwhtgsNqagCQZZutij8T6xcD8OVC8vc25mfOh9E=;
 b=oN8dmgr6k4xr9FBpdnw46SJaD4bM4/17zLW1s+fSsgwyjEcxtAmxdDoZTup1f7fZtt9gWDeglM54SDMZsWAr5VQHsmR9R/7pHYr0EqBlIWDA86JjEutWNc2DDrnaicoYtjqrKE24AnxDDFciI1vS0zdx3lfx7MTdOVVm8sZMgLlAJlqJSbNkl0bt2ofdUJ7fFQ4Eqj15IVLRjcCb/Nx3TvRzJOihsbMDNpza6TNxylBgQtpMF51xBx7PP0cYHSlWVo3J4QSG1Em9UolJzNnlFwRYaUP5nC6nCXULAQT1TUp+MZXuj4L1ikSibYOCnAEzXGW21sYDWp70SjP8v25wqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4DPdwhtgsNqagCQZZutij8T6xcD8OVC8vc25mfOh9E=;
 b=Mk8RMf2Qt4wRObrGoCcNkwX0G7AeZB+Pva2kJrL+u8VWHVDOfo/7CShYZdXLwgafGuanoSc0tv9SdP6A8WdclVNKt1gck2sSc79UubcT5XHzzpq4cpy9fATNwHK1yU5GDgadFagxITsLr4mGjL1NRsdGVkyI7hqhOM+I/WsAd+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9043.namprd12.prod.outlook.com (2603:10b6:8:db::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.26; Mon, 18 Mar 2024 12:29:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.023; Mon, 18 Mar 2024
 12:29:57 +0000
Message-ID: <f7d34df0-f0c6-4475-89c7-437833391999@amd.com>
Date: Mon, 18 Mar 2024 13:29:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: remove the adev check for NULL
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20240318062900.541823-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240318062900.541823-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9043:EE_
X-MS-Office365-Filtering-Correlation-Id: 2146a2e9-8492-42e8-7e0c-08dc47471f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GG/+esPNT20H3ZSlXETzvuDjz+ajQ4C05laQB3/lCFfWOmZz29zODfm9hUJ0rPn4C7crNLU5TcgaAhX7PWk95DgCW1uTThp4JCQgtEf053tiVK8n1HtnNjSsjhicZm3jEuzqucR+OpwEZlhS7v3E48fnjpCH5/gGkutHfHUuVZb0Ztyg14/JvigK5HdEDjrZpzKw07LwmHaNmEujdY4CyRonXjtlSrldhRObEgS3s9pNTnW2UGsXf7QPz+LEwjxFIRBz3OYUC4NZnH/+Kw2cn9oxaGr1fuXI3kGnPl3x/1TvFHLA43qsYyWZpWtVuK7PK6KoCekUj96RFJdB62+FnxRuFKQ4FuEt9AoY8Qx9jqHVolrI8qmmPvbhjkrWyI5cXxx7qUdDTrHPtvlhpEAI+a+CfNzl5cEK2SgbXAa4ExV6JXK8K1W6wiamlQfmrI8QA52XO8OhoDxBCrrlAnNb5ZibKO3vX0UAc+JQameR1aqdLnWT76me9KN9DMPq4kH3Il1VHiYWvvqGbc12a8DEcIXeqM0znB5OjjUXabtln7t2PMgBAQYT/90ZoHpoeJgP0XTJ05zUaDwu0ZvzlYYns3y/H5vGXr0AxZLGOCXM7D7GhykYVBhA39r51PmRLW9XsqFzwY+mEX9vhsuPAk8AEOmtAV95ErydcnH6zKVFW68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk9EZC9KS1p6ZkVxOXc1K2Urc2NGY3IwZFZRZHRIaktGbDZycVhVVEhURmc0?=
 =?utf-8?B?c05XQmM3Mk4vanY0TVROUDdSWXplMUxBM0hqRVZ6YzZyS0pjYlhWUHFOT2di?=
 =?utf-8?B?RDRTL0RhcHczd2lJelZDcG1WWXR5anJvaUdLMUZqZ1JaNFJ0UE5Jc2drYTVB?=
 =?utf-8?B?bytjQWRjdDFOVU1haWs2SlNXTGZlOEVHc2poTHpCeE9UZHV1WEpIZEtwdzh4?=
 =?utf-8?B?VGdHNVhaMDhTaFBTUlIrYWR4bSttSXB4Rno2VU9nVCtCRFM4Z1g5cCtLa1do?=
 =?utf-8?B?L2FZU3dPT2FyUG1rODV1NW9RK01JUEdKN3hmL0Z4Z3A4UFpqREFzMEQ3N2VO?=
 =?utf-8?B?VHVYanM0d0Y2VGwya1kxbzJrS09ZOFh1NEJwR1E5bExCVkN2VlprOCtVUERl?=
 =?utf-8?B?NUVHUFBEVXVpOXg1YkhES3JOcWVwWDBkOVpIU1IvM01NV2hnVXJvSzE4aW5S?=
 =?utf-8?B?b2VJNEY2dm1FOVk1dS9SYXZxSGxXVEk0anhSaDJyaUJMK3U3MEl4NW14RTRl?=
 =?utf-8?B?ZWFBSUJSTXFCcVBoc1M5VEU5c0ordTdqcUczRmw1WlQ5MmJ6blJ4MGVvb1lN?=
 =?utf-8?B?ZHN0M1g2Q2NHaEsyREFIWW5pM0Z3aTZFZDRiUTVPdmJFamRCMldpVmppakZs?=
 =?utf-8?B?YmVkMzRoL0FVdjQ2WkNSTHRwSzFNL29BOS84ZUg5MFVJdnJYTkRValhwL2Iw?=
 =?utf-8?B?bXJvTmdIYS9UL0N1VHlvTERkTm4rdnF3aHBnQko0ckV5QnNiaTFEUi8zQXdU?=
 =?utf-8?B?dE5lcmNsbENWVFFsaDIyNkVzUTJJU28zNU82M0JsWWdZS1NDSUdBU041Y0lK?=
 =?utf-8?B?UlB6dEkyNFFKb2dKNVBnL2FnNFVoeVV3NG14dm91UEc3MUtNNGR5b2x3eEh1?=
 =?utf-8?B?bzFHTlg0eXhrZjZXeEpRNE1FaTQwQzVGWThzb1g1ZTQrL3NadzVQeUp3ek81?=
 =?utf-8?B?aUEyek1OU09jMVNWcDd2VWsrWSttZ2pTUE03YmFIUHNaWGxtWC81ZXhhb2V3?=
 =?utf-8?B?Mk14bk9Lb0FMdVlHOWd4b29JV2NpZFVSK3gwTDMycjVCS2Y0aXJKdzRwNDN4?=
 =?utf-8?B?dG5MS0pTTUlkeEl3c2czRTBrMnRNSzJCRUZadTdPQW9wQitFUzhtckJtWDNI?=
 =?utf-8?B?M09tS1JlcisrbEJaVERIQTZZdk1YTWlyMU1SUVJpR29hdWMvWGkrRGhZbHNZ?=
 =?utf-8?B?THlVVTMyUGVyMThjcHNkZ0NoclcwUHQzNisvcktuQ2V4ZkMxVCtYdXBoR2VH?=
 =?utf-8?B?eHNUTWphUjJpa25Jalo2QWc2WGF4Sk1RL2tSTWZQRFFlckxvRHpWU3RvS292?=
 =?utf-8?B?TmI0Zkx1cmJzMEpEQlA1OEFHTDhMcDlaWkJ5Q2dZR21RYldvMy9rSlRVdGox?=
 =?utf-8?B?cTJ1bXVzYTRaVGxPZ29MQVR3ek52clE2aWJtY0tzZFcwT3oyMk9SRS9XVUEr?=
 =?utf-8?B?aGVjVHNCNUhxQVlvRkxnaDFCVllxM3RJTGhzRUQxUkx0S3NJWHEzbE91cXNG?=
 =?utf-8?B?a3RCVE0xTTNwaHJCWEtiU2x4Nzk0VytaWWpwOTB2YzBVa2M2RTJhN2JRQjNH?=
 =?utf-8?B?Yno4R3Z2N0szWW1mKy96d09sQk1qaUIwVUVRWEpwQkxQUE9lTGxJUVBPNkUv?=
 =?utf-8?B?aldaenFvVnlISDNlUFZmNGIyK0xLa0JkVkJqMGswZlJta1VGWFY1YzVCMU9H?=
 =?utf-8?B?MmpOL3BZMlV2OUFMSlhuT1VrMHlOVDdJOTBtVEdDUllzOG5LSGRYWEdkMVcr?=
 =?utf-8?B?bTJuRUg2UXorcUY4Wjk0RThNM0U4enpybkFrVDBZZmR3V3lPQ1FTSUdHNCti?=
 =?utf-8?B?REczY1ZZVkhHZERNM0FQd1RiY1dkbGpBWXhpZXJQYWZDSVF1cDdpdzJSbHBy?=
 =?utf-8?B?VGdCUGYrRW9oN3JPbjRzU1RzSy9mSHlwSC9xb2gyQ2FlTk9DUmgzT1dGMFoy?=
 =?utf-8?B?M3I3aG5nMWRFRDhhNDNZV2wwd3dnb3MyeHFnc09VcXNuL1ZkcnpoYkZQOHlO?=
 =?utf-8?B?VjdRbDVRNWRJWUQ1OEVaUkpuVFlQSkRJdkQ4c2RFNzBwN25ldVJNMzFmOTla?=
 =?utf-8?B?Z2lQaGpYTFJtdkUzbHJLWVJRbjFzenBnS2lqMmtTSmFqUjV1SEsxZDdVelRJ?=
 =?utf-8?Q?eHFBtTtz48czTUIFDNCfiZaDN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2146a2e9-8492-42e8-7e0c-08dc47471f1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 12:29:57.1200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mwp3TA/hopOc6+KzQacHaIi2zZABafXgI2NFmleQZkFV5U5ktZSBV/dnG9Pq0gm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9043
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

Am 18.03.24 um 07:29 schrieb Sunil Khatri:
> adev is a global data structure and isn't expected
> to be NULL and hence removing the redundant adev
> check from the devcoredump code.
>
> CC: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 57 ++++++++++-------------
>   1 file changed, 25 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 1434e9a5506b..3398f2a368d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -211,7 +211,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   	struct drm_printer p;
>   	struct amdgpu_coredump_info *coredump = data;
>   	struct drm_print_iterator iter;
> -	int i;
> +	struct amdgpu_vm_fault_info *fault_info;
> +	int i, ver;
>   
>   	iter.data = buffer;
>   	iter.offset = 0;
> @@ -233,26 +234,22 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->reset_task_info.pid);
>   
>   	/* GPU IP's information of the SOC */
> -	if (coredump->adev) {
> -		drm_printf(&p, "\nIP Information\n");
> -		drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
> -		drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
> -		drm_printf(&p, "SOC External Revision id: %d\n",
> -			   coredump->adev->external_rev_id);
> -
> -		for (int i = 1; i < MAX_HWIP; i++) {
> -			for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
> -				int ver = coredump->adev->ip_versions[i][j];
> -
> -				if (ver)
> -					drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
> -						   hw_ip_names[i], i, j,
> -						   IP_VERSION_MAJ(ver),
> -						   IP_VERSION_MIN(ver),
> -						   IP_VERSION_REV(ver),
> -						   IP_VERSION_VARIANT(ver),
> -						   IP_VERSION_SUBREV(ver));
> -			}
> +	drm_printf(&p, "\nIP Information\n");
> +	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
> +	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
> +	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
> +
> +	for (int i = 1; i < MAX_HWIP; i++) {
> +		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
> +			ver = coredump->adev->ip_versions[i][j];
> +			if (ver)
> +				drm_printf(&p, "HWIP: %s[%d][%d]: v%d.%d.%d.%d.%d\n",
> +					   hw_ip_names[i], i, j,
> +					   IP_VERSION_MAJ(ver),
> +					   IP_VERSION_MIN(ver),
> +					   IP_VERSION_REV(ver),
> +					   IP_VERSION_VARIANT(ver),
> +					   IP_VERSION_SUBREV(ver));
>   		}
>   	}
>   
> @@ -263,18 +260,14 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   			   coredump->ring->name);
>   	}
>   
> -	if (coredump->adev) {
> -		struct amdgpu_vm_fault_info *fault_info =
> -			&coredump->adev->vm_manager.fault_info;
> -
> -		drm_printf(&p, "\n[%s] Page fault observed\n",
> -			   fault_info->vmhub ? "mmhub" : "gfxhub");
> -		drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",
> -			   fault_info->addr);
> -		drm_printf(&p, "Protection fault status register: 0x%x\n\n",
> -			   fault_info->status);
> -	}
> +	/* Add page fault information */
> +	fault_info = &coredump->adev->vm_manager.fault_info;
> +	drm_printf(&p, "\n[%s] Page fault observed\n",
> +		   fault_info->vmhub ? "mmhub" : "gfxhub");
> +	drm_printf(&p, "Faulty page starting at address: 0x%016llx\n", fault_info->addr);
> +	drm_printf(&p, "Protection fault status register: 0x%x\n\n", fault_info->status);
>   
> +	/* Add ring buffer information */
>   	drm_printf(&p, "Ring buffer information\n");
>   	for (int i = 0; i < coredump->adev->num_rings; i++) {
>   		int j = 0;

