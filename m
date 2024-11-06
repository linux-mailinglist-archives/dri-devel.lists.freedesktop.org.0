Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7B9BF89A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 22:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860910E0C1;
	Wed,  6 Nov 2024 21:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bIPPdRnF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2FB10E0C1;
 Wed,  6 Nov 2024 21:41:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLlveq445uVJuUawMyIh8vpRQDD9xdKdtEN0RBPXuOHZYCYCddpor2xAnG6nA0F2C737luL6bEYEs0uDYW6AHVvtWD87F/rbmbGlGYDGRDSrBv3FNuMKSWERUSBa/9CyfOEXansiY0XigmuWAm7ZuKePKeQOoFW+5jTjXKDPFdpP5rNGaRP88i1wxpoYyufA7WUhwEf/nDun2zZSpruq6ZOjhqc7S9Lic43vFJjS2cRiIdcCVwiN3/nUNNp0FfSN6hiZgCbGOaHZ/O2hEcruz6OeS9sxJ/dCLco2Ixnhuw3aQ0SHmGdZJMr9MQtJqXCJZAS83OVJS1FIPoJmcBeStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A88THvKdP1cZ6cYv2VsYgTZlIdBwyTt8g5+TBhZJrpQ=;
 b=Frw+LpBtj+bNNm4LIUb/qYO0D6VXjF+MrtLDoD0dZaD4nFaE1sRjqCHw3c+wKs3mJO1A409lmvRfQpd0v7Tz09Fpr++AVg1IeAXNF4DfA556fkdaLW/6XdATRVMjahA98M3S36XxU21Ba0NRHr93/OcwTz+FgHP29q7VOM5d0AA8wm805eZIWuwXryBhwaL3FKeybs5C99BQSxV73VWrGeBvdX2i6IoQ4AhCXLHqb3LdvuSH5WSXloQjzjjbLIRqiubS/SPtusfP3r3QbrGObZlUZ3WN2Hws1cNIIDqXr4kzjXhgZtiwv16D7HRl6EEXPdvIvtxr/a/SjFc9Pz3Sig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A88THvKdP1cZ6cYv2VsYgTZlIdBwyTt8g5+TBhZJrpQ=;
 b=bIPPdRnFBK3UT5v74TzgVXAeJXskkQjxo+q+HQ3hAZweuVcbyQOwRE9ut3xyUP/IGKK7TCif9NbAWejaFUGATnQ5s3SR91W2HeDRjVNaaN2hRSIjtj8jAOB86D6gG8Jh12Pg6FC84+kPpNDhRSaj+MUE62W6X7kUrtfdrlhaAEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 21:41:11 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%5]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 21:41:11 +0000
Message-ID: <6d34a8ba-e19f-4d1f-a39c-a29265360386@amd.com>
Date: Wed, 6 Nov 2024 16:41:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: Fix wrong usage of INIT_WORK()
To: Yuan Can <yuancan@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mukul.joshi@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241106013541.77666-1-yuancan@huawei.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20241106013541.77666-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: 689b7211-1b19-437f-1763-08dcfeabbb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0pjd2d4UEZhUVc3eWE3TzBrekhHRnF4Y3BGSnE5R0lycXJHU1JjaVVnSFZP?=
 =?utf-8?B?ZnZWUUN5SjVKNnhleVFPUjhYTVRvVmJ0MVhYaXVvdGN3cThjL09zY3pvbzdy?=
 =?utf-8?B?QWE0cFR6UzRYaDMyR2FHUUFHWHNwemR0dWdxSXBTODhnaFFyZmJtU2FmSmIy?=
 =?utf-8?B?b2pCbUFCUmdhM2w4Zi85Vm0yRll1SWFPdlBweW5lQWp3S2ZkV015aWhuRjFO?=
 =?utf-8?B?RVQrQXlMUlFmZHRUQ3pYQldQWCtXbDJ5bFNDdFFQajU1aFNVeWIyT1NHUXVT?=
 =?utf-8?B?RjBGNTcvdTNyTkg0YnpYL1lxazZicGcvVllKem92WGVHRmVwK2VDUGFNZnpE?=
 =?utf-8?B?dnc4eUlpc3FUUWdlc1RrdStaOWhYN2lCWUM2Y1Q4WlUyL2hZSlFYVHNoZGZU?=
 =?utf-8?B?SURtY201UTZtUzlpOW1RbGM0Q25ycnd5a1BjNHprajZvejdzVjhtU091QVJ3?=
 =?utf-8?B?aXFqRFAra1NYSDJyNkVKOFdjL1JENm83UFFyU05ONGlVZFAxWndiOFUyajNn?=
 =?utf-8?B?Q0VBTzN6Q0s0NUxydHpSZDZJUnhGcnFRZVphOXNNcjkxdFQxK0IyMW1KMjdx?=
 =?utf-8?B?RWJyZXdkT2dvY1VranQ3cVFmYmdJYUNXUHpFS1VFVUhyOVRjWVpuQ1NnY1FX?=
 =?utf-8?B?Q0NpVnllcXN5M3lyWXloV2Q5WXoxOHNXTFo2TFBTYlZNRGY2Ym1vQTg3Wm9Y?=
 =?utf-8?B?dFNyMVFMYmZnR2ZiSGVUTXVaZWlSZnlpaGRDOFo3aVhFS3FqMmJsMXR0dTdu?=
 =?utf-8?B?OXpCWXA2Vml4Qkw4aEdHd0RvQTA4V2lxYmV1bnE1UVAvU1BraXNnNG1FVEEy?=
 =?utf-8?B?SWw3RTRnMG5Ma0lIdXRHU1Q3TmFPM1Y5cjl5bE5WZFlidWZET3hvckpvYlNQ?=
 =?utf-8?B?L3pkVjFtNjNRQ0YwbEo3cTE2ZllOT1Z4R2tjVEp2MW55OGdSeVJBdWVhdEFU?=
 =?utf-8?B?R0V3MStiVThUZjcwSk1XUmZ1bmVUdTI0MWNZcEgwSWJvM3RhMXVDZ241cXJt?=
 =?utf-8?B?MVFHS1pDN0hLbThoek94aTNINmpDOTduSUVsNE13Q2c1dmZoWEJPQzlLMmkx?=
 =?utf-8?B?bDV5U3c4WkJFNFFLS1dhZEhZTHRpTDBGUWcvYWlEeGJHZmk1VGR6U3E0NmFh?=
 =?utf-8?B?STY2RVNBa25rN3pTZkswUlozY0s3K0Y0RHBlVjFkVEh5K2JGV211dWZ6cHpP?=
 =?utf-8?B?VVBZNVlseXFVa1o4aWZ4bDZoRU9yZ201T3Jla1lQcWJjbTlEMlpua2FwdzlE?=
 =?utf-8?B?bm1ycjRueFptTGFON2gvL29jU2xOeFUwSjBMd2RxWERiM3ZmU2tJeUZ1SVlX?=
 =?utf-8?B?WGVNYXZuU1hhdStvMW5NY0tZU3d5cmxYZXFhbTdvcHZjVUx6VjBQT3poM0hG?=
 =?utf-8?B?RThIbXNwWkFLZ3l2R25Ta0UwU20zclNBcml2RHZSb0VFZHVxMENzVXNzWEZE?=
 =?utf-8?B?T0J2VWZ4SW1rcTQ3LzF5aUVjKzRjYi9hWnpTU00zSU4zakk1Y3BpTXZZU1Fz?=
 =?utf-8?B?Mk1kUng4azFvOVdMd0o1dTVCblNhRG0vNTJSSTVMYk5adFBLQWtOR3ltN2J6?=
 =?utf-8?B?QytJY3kzTFAvRHlKYWxpQlJGb3RKYnpDallGZVBOSjE0WXNlR29PU1JhZmtT?=
 =?utf-8?B?NjBXejZnR3o3OEp5Yjlwc01vSXRKU0ZxSC90Um9xT0lUN1hNWFcxKzhMUkE0?=
 =?utf-8?B?ZUs0WFF0cWZXUnJHaGRMSHprRnlNUFVDb1ZCSnJudERtaDl0SFVLd0xMYWxx?=
 =?utf-8?Q?8+zaLMOb3hyK2L+dGWlwxByAjoF92DUNvpWqBhs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHg5RVlpTWE3d3BYeW1ZUmZJdmpadW1tdm5LZUYzK2JoMy8yaHJEYTlobEpx?=
 =?utf-8?B?MFZSN1p0aFk0VUt5MUZJbU9LZXNlRXdTOWRMM1ZLWGE4a1JDb2xERVFMU2Qw?=
 =?utf-8?B?Rmk2M0lrM0crWDRFMXV4dkhwc2dWN0VHYmFydVNhM3pFaVJqcnNHZXdXWHRq?=
 =?utf-8?B?THlaSHJNRitkS3Y4MzByb3VXQ3BBUytUVHBUVXQ5V2YxSEpuWGJCaWQwQnhN?=
 =?utf-8?B?azdRSEtFRXg3eUhUbExsN3dmcWtEcGxFNk9ZQXphbG5QOThGVjdpSWg5ZUVN?=
 =?utf-8?B?TFJvYUk0MTN2d1NLOFBvOUxVZ0dMR1NSSXEzQlJrYzVtSnZCWnJPSGRER2Fp?=
 =?utf-8?B?MDJTaGdFeTJBUzFtcXRBbk9Fd1hQVkFmdCs4OGJRWGVyN0ltbDc3QmlNaklu?=
 =?utf-8?B?U1NhSUUwWkxKUXUvb3BjVHRwdXhVQXYwSThKUmxFWmhuek91eFhWK09jWkpY?=
 =?utf-8?B?ZTBEZzdBV05tUGYrTnkrVU5wUFE5YkFJN051ZXZQR2MxMXVKN3lKYnM5VUxR?=
 =?utf-8?B?VFFPdW5uVURyeGJYclRkUDk2aXVzRTQyellIUlRaQ3ZIWCt2c1p1SmNTb2RE?=
 =?utf-8?B?emYvYVRrSDBVeE5TTXZ0L0t4bTBNSzlaSDJwQTkvN0xsKy96VUVaVk53dVNU?=
 =?utf-8?B?V04zWnVUMmd1RDd6NmtLeWxjOWpWV3gvS0J0a2VUQWxXMC9RZllOd2xBb01v?=
 =?utf-8?B?UUI0eXAyNXZZZ1lzTnlmTkRlak50WWJ2WDl0VDBJUUJSaE1WcVZJbmNwRk8w?=
 =?utf-8?B?UmtaUnNuM01iVytySTFQR2hud2ZsMHFTQzV4UTVXeTFnaEtGaWlGbWhmZkZU?=
 =?utf-8?B?VkFrRlMzdEw3a0JWc2pJUENUR3hqVytTTkpFbC80a29lRS90K3VkcG5yd2t0?=
 =?utf-8?B?SnFuUGMwTUJZMllJM2E4T3NOQnFDd09JOHFqVzVMc2RJVVJTbXNEVVVkcHVa?=
 =?utf-8?B?clMweDBxNUs3Q09wMmQ1WkFHMUZib2RBaWcvdUdjNnA3Q1NJZ0J5VnE4ajFW?=
 =?utf-8?B?Rmo5Tlp5cHJ6LzMydHY3N3FoK09VZUVFYk1wbDJCcG1YL0FrQlNYL1prS2NH?=
 =?utf-8?B?R2xhTG9nU1FoZ3pTbWVlK0V2ZmVBUUI0T2xwV3lPelZubGw1OG9PNG5QcDJs?=
 =?utf-8?B?dVdMTC9WLzNLc0ZsTnVwWjJPT0o0MDI4TzN5aXJ5c3dFM01IRmRYZlg0dytw?=
 =?utf-8?B?MXVYYWpkbXA5TlVFNlZMb2gwaFRaZGlIZlJhK3IxYzJhS0x0RWtjOEZDU0sr?=
 =?utf-8?B?U3pxbUlxSWNmRmdSZGNXU3RnOXZORE5FZXdGSWh4bTZXbFRiU1pEbHIyRjhH?=
 =?utf-8?B?M3g3Q2phQnFaRzY0ejg3T21WT3JnTmludmhhV2Iwd1BhalRmem1UUkYrczhi?=
 =?utf-8?B?RnFOeFlHdkhWVnpTM0U1aVRSK09mbUUyTFRtcUJkZTZ4VyswMlllVjNxeCsv?=
 =?utf-8?B?cm5qSVY0Uk9YVVBnbk9icWRqYkZnQ1Bua2VGQ0Vjd0xLbERBQ2dCL2pkei9I?=
 =?utf-8?B?SEhUUk4xK291VDhMVmlKMkh5c09YZ1o1cWVZdWNTRmFjZCsvOTZKQk1aNVBv?=
 =?utf-8?B?UVNrZkRiSFYvWkRIZEM5STdZSlNSanA3YWFJaG54VFhwSjd2WTBab2JUTERr?=
 =?utf-8?B?dUFFN1hpM2dqbDN3Z05lbXlRVzRxblg4S1VDRndFNlAxZ25vcjVrYmlpRGxX?=
 =?utf-8?B?cDNRUjdvNTVvQ1BhdlE1bE13VC9UaHVHM2YzR0crQlU2Qk1Hcm5ZZkNjdUF0?=
 =?utf-8?B?bUpuRWZlZDJEWEt5VTRGUXY5TDh6VU1aODNZYkE4ZXlHNDlIUmU5WDRkZzVW?=
 =?utf-8?B?SWROMS9IQ3VZWnkraWI5am1rWXhSM0RaRFNTaFRQYzB2WXZZb3ZxNWJ3MThr?=
 =?utf-8?B?N0ptN1YrdVJUaEk0VHFVMUc4UWxXcGJqS0ZJWVdocXdlSzBuVmh0NXIwcUwx?=
 =?utf-8?B?UUNKMW5DWTV0N3l5bk9haTNqTWx5R1lKa3Nkbkp6dGVyWklaTnk3RGZQNzdU?=
 =?utf-8?B?ZG5jVS83YU1TZlhhN256WEM5OUFLczB1ODJGMDdRaWV5SUwrTDZiRzNlRWkr?=
 =?utf-8?B?V1dQZld0TWVEcEt3S2hCOFBRQmpWeWtOZmIwdDRPNktGbm4zRkV1SnowUTJY?=
 =?utf-8?Q?7W3NA+ocO74+ugnulBYVW9Ysi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689b7211-1b19-437f-1763-08dcfeabbb1f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 21:41:11.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjQIuC9jfUwM1+6LEg6TVenctnYCaxJ3/Elweaelca3E65+716gryCYPLpZofckmWZayZirdZs7wVkpA0Y7afA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188
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

On 2024-11-05 20:35, Yuan Can wrote:
> In kfd_procfs_show(), the sdma_activity_work_handler is a local variable
> and the sdma_activity_work_handler.sdma_activity_work should initialize
> with INIT_WORK_ONSTACK() instead of INIT_WORK().
> 
> Fixes: 32cb59f31362 ("drm/amdkfd: Track SDMA utilization per process")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Thank you. The patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

I am submitting it to amd-staging-drm-next.

Regards,
  Felix

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index d4aa843aacfd..2792015f1054 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -338,8 +338,8 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
>  							      attr_sdma);
>  		struct kfd_sdma_activity_handler_workarea sdma_activity_work_handler;
>  
> -		INIT_WORK(&sdma_activity_work_handler.sdma_activity_work,
> -					kfd_sdma_activity_worker);
> +		INIT_WORK_ONSTACK(&sdma_activity_work_handler.sdma_activity_work,
> +				  kfd_sdma_activity_worker);
>  
>  		sdma_activity_work_handler.pdd = pdd;
>  		sdma_activity_work_handler.sdma_activity_counter = 0;
> @@ -347,6 +347,7 @@ static ssize_t kfd_procfs_show(struct kobject *kobj, struct attribute *attr,
>  		schedule_work(&sdma_activity_work_handler.sdma_activity_work);
>  
>  		flush_work(&sdma_activity_work_handler.sdma_activity_work);
> +		destroy_work_on_stack(&sdma_activity_work_handler.sdma_activity_work);
>  
>  		return snprintf(buffer, PAGE_SIZE, "%llu\n",
>  				(sdma_activity_work_handler.sdma_activity_counter)/
