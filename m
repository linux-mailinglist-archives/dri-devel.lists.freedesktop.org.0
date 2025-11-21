Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45032C791A4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612810E869;
	Fri, 21 Nov 2025 13:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yoyl0JJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B64210E865;
 Fri, 21 Nov 2025 13:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtMeBOhHxFBe/U1jHUeBrfF07ZlnUcYNlZagerT91UXtcaZraCqIvS7cwCrKI84gu7GsncxH8+2HZxLz2curO41i47zTq78jhsxs9B/lwMfHzOyBQ9pz7tqmaSknT5/JFS7lANrQoqN0yr99ZKJYG94MahVZYL5vT9TZ9b79GAbgdbzEkvd/s58uHVhvrsPZ85njUHGgJIAgnMmFyn/MGFjUbrcnoLvxqJOX2BKTWVkNc7i34swbjCH/vvbu0bHeLsTnWImchph3j7Q1YMp1ylG2xSwekyd78QymjtLuL1hLKGZE2teSwpD+vz7ernVBc3yBMkyUQczi9zB9fEzEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqDvL9rpF8Th9n3uh2s59GARa//ATzDrBjOxKA2Plng=;
 b=T6Tgvqn3EucoeKXKMiMN55vM2kw3rwSNRDOqvl0bCHtm1n0OItR9W1H7NoNGZuGEWOIZ1ib8g0OooZgQFjyvMZ14Ww8sDLcFFLgr8+G/La7EmhF39t8b4SQdQ6UF1CCeRz4R8CdDKm7E8BIrREabgOdTNgEh2yajHoc9bw8g+sRbpo11kx9lhfs6ORYMC+7Aka7FyTeTvxmffbee1pW92oaN1vQMczCP5snoJq3u/ag2FLv5kprIAaXaxnzZ2zEZFMIUv1Pp2gKSa1weu1MHwNThsbp7A/U/EJlIU3FDnEwlxyx3ZZmendO0NAuBOHIxXJ0b95y7kumYsbDYH7DEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqDvL9rpF8Th9n3uh2s59GARa//ATzDrBjOxKA2Plng=;
 b=yoyl0JJvnFiD1tA589g6v4SGPbimF7cThfjx4Kd8aQdrVR4JYp5YEq8DaA9XlTYkoEfLvJ7g+hLUA6erXIwEqQKnlJghOAmbpaRBebLPxjYW8p2SIZT0wHhjFOUWLZbZ5CXwsroDjqHbrAwhvohtQsZC91VHKWB5ImbYeUBp18s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 13:00:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:00:55 +0000
Message-ID: <16d9d7df-1ea6-453a-83b6-8de0681e8aa5@amd.com>
Date: Fri, 21 Nov 2025 14:00:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/28] drm/amdgpu: add amdgpu_ttm_job_submit helper
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0124.apcprd03.prod.outlook.com
 (2603:1096:4:91::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 003e099c-1a85-4429-3812-08de28fe019b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWNJQmxob05LWU55OER5T1A0OXZycDlSRW1rb1F0aVdJazMyNlE4SXdkblN2?=
 =?utf-8?B?K29vQTk4NERmVDZuTkhPMDh5cWordStScWlzaHhOTUh4YmVQQ05nMXgrYzh2?=
 =?utf-8?B?M2JsUWUvRHFQazdWWGpobnhZRHMyQlkvc2xTYlV6cXdVSjNwL2VQMFgwNDRS?=
 =?utf-8?B?L2x5aFdkLzA2SzRyK2RtNUQ4UEt5b01oeEhLT25LNnNhcklPaGhkaGFBL3dV?=
 =?utf-8?B?T2thcWt0cjd1dnBXRE1oWEtaSUZNYnlMcnlWZTJKM1hqNDJwSkk3S2krQkYv?=
 =?utf-8?B?NzJRUndJWk8yallxMHNJSVJ5YUNTaE9kR3lETFpMRXNpQkZYUlpENVhRSEJp?=
 =?utf-8?B?MGRiNGtYWmhxd3ZLTGNSWm1SZ0piVlFxTWN6SjRIYUV3eWllU0o0T0xQbVAv?=
 =?utf-8?B?TzhYUjJIT3pSYmJyNzhBSWovRmpsazBCSnhySXJGOTNNa1dIQ0lFZklPckpL?=
 =?utf-8?B?V0RuNUt5S3Nsc0FYQjV0WGdtblk0cjN3QW9JM215Nm9JdEZQQ0VsOXZTQlhB?=
 =?utf-8?B?YU03VSs0M0RJLzZRNkpxclJpL3c4UFd0WGo0VksvRE1jTnBNUkpBRXZ3VFBM?=
 =?utf-8?B?cHlTT2NyYWk4TGxpc1RPVisxQUFuZkVUVjhCWTdVRkxub1dNT3RaR1hDT1Ay?=
 =?utf-8?B?VWJOOFpuRU5sc3duZTdWdnRHTGljRHhYTm95YldtODM2ek84aGVQdTA1VTRz?=
 =?utf-8?B?R3JVZVM4TTJ2VmEvdDZ4cGRPRlJuSHYzT1NkTml0TlJuVnoxM3crRFdESUV5?=
 =?utf-8?B?VGpnSlJyQUJKVU9Xc1FpRXQvOFVnd3ZCdFNwVlhNanRlRXVQNW9rblZKQmNP?=
 =?utf-8?B?cHZvVmJQVTFUREJucTU2bEJhbXJsSFFzT2tDby9ONG5PdVFBYkR0MG5TNm9a?=
 =?utf-8?B?U3dZc1hWUWNhWWl2bk1Da0g2b3pPaEVMV2FTTzMrRVJQYWN1dFRrMkltTU9m?=
 =?utf-8?B?VjA3Rk1oYytxaElKSFp0QmtuTy9QZGJ1eTQraHB6YkFsOFBJVGo5QlVTNHE0?=
 =?utf-8?B?K1dFSU9GRmU3WndqNnZ3S1drQ2FkZlRWN2NYV3FramJrTlJIQ3loTWgxRGJH?=
 =?utf-8?B?cyswcXRvQkVINlgxT1V4aXhrMWwrOE56L0dCVWZ3VUhLNHJzTS9sVGljOFpm?=
 =?utf-8?B?b0JMVHZpb1ZSVFMzM2xtdTVCZnEyMFIxeUIyN2xVMzN0UkI3ZHV4eFpPNk5H?=
 =?utf-8?B?ZGFPa3p3TDB6dUwrQnRUdXN0MWZmVmtSL01nSWhhbDV3SlViZUY4cGZyc1lp?=
 =?utf-8?B?RkJ3a21HVGo5K2FOV2lWQldlYnNoYktBcVBseUR6VjU0K2l6czhpN3Z4K2wr?=
 =?utf-8?B?RHZ2L29nclNpRXpqYXNOZmRlSEQwOXZ1SElldittY1VpeGZzNDhSZFdGY09x?=
 =?utf-8?B?RDJrYmN6Y1pRRzJjN2p3VVNsMEV2ZEc0ZDd4MGd5SUJwRUc3QlNwczhHMzFw?=
 =?utf-8?B?MVd4N1poR01IenIrY21Wck1jQVBOWW8wT3FTcm9XUWE2OGJPWDhQSGFwaWdX?=
 =?utf-8?B?TjJDcnBOVlAvaTEzUlV2NVRxLzVhTE1LeEd1Zm9KWXVudmUzaWZFbkhNZDcy?=
 =?utf-8?B?R2xsWktBY2cvalVOWGVXYzZZVXFtSVNWZ29wNmRkTE9hcWhwN0UrRklSRGZU?=
 =?utf-8?B?aFU1Qm9ZRGQ2eDFtV2Y5VDlueS9wMDNUbHFLcEFuaWRMd2R3V1pEYzNxTjJR?=
 =?utf-8?B?SUIrTG1FTVNYemluYWpDUFJEOEpWWXlBSkZBL0IrdnR4RTdLLyt6S0RsWjg4?=
 =?utf-8?B?bzJEVE1La3NTUlpLMTZWbG1Xb2lLd3NPQUpvWUJCR0pFbHl0Q3dualVJWkdi?=
 =?utf-8?B?cjFpYnMxdUR4cXkxZWJiNVhqQm5tdyt0eS9NUFBibWlBS2N3ZTZMbGFZcmJ6?=
 =?utf-8?B?dHN5RFFqS2xGYnV2MWlNYkYyOC9oeUxXWXYyTVpIQ1hiYkdkMjMwMExzTHMw?=
 =?utf-8?Q?0mz9jlIOd0xs669bAmn5MID2wWj0zNkF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEEwcWFuNkJKUCtoTzVJcnVreFZJU3MrcTAzTnNnbE9iZDAzUXoxWXZORGRq?=
 =?utf-8?B?eVdoRWpEeUZ0Nm1FRm5qeXJtRHd2K2N5eHRvWmFwekJ3VndYZ2hkUzFERVEv?=
 =?utf-8?B?aTllaXNPTHgvaFpiWTE5aUc0NW01dWVMRlZEdG5wVWlIQWUySU52bkI2bmQ4?=
 =?utf-8?B?czRudEk4TjVWQ3ljSGY2Z1NuWktmc0xqUU1HWXFEdm9mSlE4NU9JWnVuNm1U?=
 =?utf-8?B?SVJHbVRvRGpLa2ZzMDZySVRZMEttcmxYTXlnaVprZmVEUFJFTVRUTGZDcHBk?=
 =?utf-8?B?VFZESVNDSmRjblZQUi9oTzQwM3FBWVVaVS9HNDNMcncyUnNLQk9zK0RZdHlB?=
 =?utf-8?B?aENJTExMUHNrZzZqRllGRTJrV09uc3pXQStDWUtLTVdZMEdOUzZpZHFBWVd5?=
 =?utf-8?B?U08rL1k5Zks4MEhnbkUva0xSZVQ3bjVHdDZxeVh6ckY3c0cyMzBrYlZ4U0w2?=
 =?utf-8?B?aktPalgwcFRvTzAyZmVyMzExWThnQi83U3hpcTNIdGtIaGRmdWZWTzZ1QlFD?=
 =?utf-8?B?Y3E3ZXFKdjZSdjgzNWpIU0JvN2tPRndyMGkyZm9EYmtsNVFXRERMbS9SQTJv?=
 =?utf-8?B?enRlRitiZFdLSVV5QnRQQTRwcFhRamZCRTlvYlNaQ3pHYTVMeGQzMkFFTjBP?=
 =?utf-8?B?cHhDdXMvU1NCeGZ6TUQ5WG1Xa0FpYVRLNXFmR3UvOXloQ0tSaVRRSlgxNk0v?=
 =?utf-8?B?eEZVZFA4QmJhZVdsNEJSZXg3SjcrSGVpcmxmaGU5SWlqbjFZeWlYM2ppSWg5?=
 =?utf-8?B?dUZVVFNITXVEMHZoY3lpYkxIMDZjeVhvOVhiVW5WamNKbGd4UGJiQnBNUjBz?=
 =?utf-8?B?aSt0V2hibUN2TW10Nk5uMmNhaTc1ZWtQQ3NWdmQzSy9CL3JMQjI4VXNOa3Jj?=
 =?utf-8?B?cnYzZ3hHZVlzUWx6YlNleXc2RUVnOU5LQjBYdVlGeHFrS3VhczlqZjhkWFEv?=
 =?utf-8?B?emRjakE5dDBSVDdrVXRtVG16WlYveDNJK3lOMEtMbENTbFQwM0hqcnVWRE5m?=
 =?utf-8?B?d1oyMitHbUlkSjRGaThLVlF1NkcyRWE4cmtmdGdZMlAzU3R1eU9YQit2d2xu?=
 =?utf-8?B?VG5xNmZOc1lJY2R1cmlYc1YzeG1BdWFMdENYWUhwb0hKbVNVcHdLaWp1R21I?=
 =?utf-8?B?ZW51ZkhJbUZ6dFF6QWxFN2orLzd1MTBMNzRnQ01YU1Rwcjl4OURrQXkyNlZE?=
 =?utf-8?B?OUVpRVZILzJjM1AxS0FNUnE2Z2ZhRU5QNS92ZkFHSXAxWkRwSFpyU0dOZGhJ?=
 =?utf-8?B?a1pNeGdoVFd5dHIxSDhMT2gxOWxicS96V2duLzBaNUJRd1loclcyMkNQREVS?=
 =?utf-8?B?QngwQUdieXQzRUEvT2c1a1ZudUdVemhIbjFGd29XNzVyR2JmdW9OUGJQUjc1?=
 =?utf-8?B?ZGtKeGU4RGMwdFhrYXVsTmVIMjA0R1FaR3BIbTB1K3p4M0VWTFltNTlyU3hu?=
 =?utf-8?B?TjkvSkpHKzR6MFc1ZEx1VDNPcHpTOE56eFR6N0tJSUhJQkhRaFdzU2J2a0xu?=
 =?utf-8?B?aXYyOUhsQjZBVEpyV29DcFRjUzF4NkZ5eFVOYUhkSGUyNE1NbzJYRkZ4MVFr?=
 =?utf-8?B?NHhxbjhwU2FaeW1zSk9EaEtyNWZidUQwNjlualR2UWR1WW5oaHlycXVSOWFW?=
 =?utf-8?B?c0FSK3BsNWJMVTdNN1BiL21hYmV0OGJtaU5ING1hbERhdDk1dWNyMVNHUkxx?=
 =?utf-8?B?RC9PUjFDN1V1aUlIdGo0ZEJnQWF0ZEt4UjJiejhqSUVmd0xUV3k0cFlybWtq?=
 =?utf-8?B?YVF6U0thWVNIMnV2azZMSmV2MVp2YUNwUHgraytVY1FUa29TU2NSaW11bHFL?=
 =?utf-8?B?Zi90aTNQQldtRWYyMXJBMGdJa0JKdzJaaVJNRkc3OTBtY2M1b0xkQkgwOGxB?=
 =?utf-8?B?TEg2bmwzbWVSZjBSc2VWL0lwZjJBSytBK0Z2STc3aTVqeVYxQ0JXVWZnMDBN?=
 =?utf-8?B?M2dURUNrbEVKL2hVYlUxV3Y4UGpsK20wdDdENmR2WiszdnFlYm1nK0FjM1BN?=
 =?utf-8?B?Y1RaQjNuZ0xac2NYYzhDN2trb1RxNmgvNXVxMkVRbWE1blZJZU8yM21oWDJq?=
 =?utf-8?B?ek1WM1F5UWc1T0hSSjBONzFXSVhLSXN2dmZWQUwyaldnSXFnb3NqL0dtS3lp?=
 =?utf-8?Q?CCwlETKmnQ4MQPpu13/mnkDHV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003e099c-1a85-4429-3812-08de28fe019b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:00:55.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzmUT2kJRdltbZNU2Uh6kduIFkrKgFMkwpcj16mWrJ0GuxNSQS0iqfrDnVNbA7es
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Deduplicate the IB padding code and will also be used
> later to check locking.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 34 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 17e1892c44a2..be1232b2d55e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -162,6 +162,18 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>  	*placement = abo->placement;
>  }
>  
> +static struct dma_fence *
> +amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 num_dw)
> +{
> +	struct amdgpu_ring *ring;
> +
> +	ring = adev->mman.buffer_funcs_ring;
> +	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
> +	WARN_ON(job->ibs[0].length_dw > num_dw);
> +
> +	return amdgpu_job_submit(job);
> +}
> +
>  /**
>   * amdgpu_ttm_map_buffer - Map memory into the GART windows
>   * @adev: the device being used
> @@ -185,7 +197,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  {
>  	unsigned int offset, num_pages, num_dw, num_bytes;
>  	uint64_t src_addr, dst_addr;
> -	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	void *cpu_addr;
>  	uint64_t flags;
> @@ -240,10 +251,6 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
>  				dst_addr, num_bytes, 0);
>  
> -	ring = adev->mman.buffer_funcs_ring;
> -	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
> -	WARN_ON(job->ibs[0].length_dw > num_dw);
> -
>  	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, mem);
>  	if (tmz)
>  		flags |= AMDGPU_PTE_TMZ;
> @@ -261,7 +268,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  		amdgpu_gart_map_vram_range(adev, pa, 0, num_pages, flags, cpu_addr);
>  	}
>  
> -	dma_fence_put(amdgpu_job_submit(job));
> +	dma_fence_put(amdgpu_ttm_job_submit(adev, job, num_dw));
>  	return 0;
>  }
>  
> @@ -1497,10 +1504,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>  				PAGE_SIZE, 0);
>  
> -	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
> -	WARN_ON(job->ibs[0].length_dw > num_dw);
> -
> -	fence = amdgpu_job_submit(job);
> +	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
>  
>  	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
>  		r = -ETIMEDOUT;
> @@ -2285,11 +2289,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  		byte_count -= cur_size_in_bytes;
>  	}
>  
> -	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
> -	WARN_ON(job->ibs[0].length_dw > num_dw);
> -	*fence = amdgpu_job_submit(job);
>  	if (r)
>  		goto error_free;
> +	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
>  
>  	return r;
>  
> @@ -2307,7 +2309,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
>  			       u64 k_job_id)
>  {
>  	unsigned int num_loops, num_dw;
> -	struct amdgpu_ring *ring;
>  	struct amdgpu_job *job;
>  	uint32_t max_bytes;
>  	unsigned int i;
> @@ -2331,10 +2332,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
>  		byte_count -= cur_size;
>  	}
>  
> -	ring = adev->mman.buffer_funcs_ring;
> -	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
> -	WARN_ON(job->ibs[0].length_dw > num_dw);
> -	*fence = amdgpu_job_submit(job);
> +	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
>  	return 0;
>  }
>  

