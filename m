Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAF0C791DB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3913E10E86B;
	Fri, 21 Nov 2025 13:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zyzqCwFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715F10E86A;
 Fri, 21 Nov 2025 13:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXCFfFnfnKkrxmrsg7fH6BjXackKStB1Htqtqrv9SzpxBPcHiGvHfdaSu4pyoMOy9zuzpLLVTNL8IaNq2EjjEI/aFjxP+1HTfzF3rNDchR7DXGQE37UKfvEPOU4Xtf+aHOQ+P5jodVMstTAJNLmEnqSEjtstcuQJ/+2rVID/0pJuLYJkDHZBY2SPbxWe+nP1BywUnC4zqhDbGbrBzFpdblkzBULtYROYG5UDPr6QtK0A088b97joEluBknoo4Z2mnQOQMF3Zh7WFDD5vMQj6KlIsoUUEkFGzdxEmHwfE3Y0WUUOSygC2Ho2LRVCvMI94oZPOFZee7OXrekCsS2K/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNH7wOGwpil1SAEDTGf22rw/wKbSYqGd0sr8oHAAW78=;
 b=TAptlivj1NSFRN2481iXdfSqSRHIUxw+tsx8SanCNzcjkQw/KUnf7nDxVdBM02KiaiTVUcTXhVLkPbj9zKowtcxgg++Iq88Uvw2zFExPtv44+2VHwc5S6nS4OgEphsam8SSlVhDkHOdLvWw5EM4Tr28iwi3QoEt54hR4BkNtN8A9hr3nfTUZeLkUWXUE0PiBiQdiAnPQ4UEbnpMwnFo/kde5Ym06QqTwM2m6HhdCYov/UoQhtr5V2VAwauvXPs/ulZpluWpAyW0RV6DTc9iknWDMo671XC9WPGCnk1li3lNEctRPuUXqfo1Dsg54SI9qdsBeHI8b6boXKpU9XXUSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNH7wOGwpil1SAEDTGf22rw/wKbSYqGd0sr8oHAAW78=;
 b=zyzqCwFU3/nYLpVtM54bMnUIoomsqkcCCZer67dZmuXU99LPeW7cINNpKiuNvErZp9RjqCgiZcs3uoyfvr+AM6qZmVkalV8pdDfAc5y8c+dVqtEI7VQDZaoDAoq4BNlP3I5pe16UTdsJuWECmZMWBIXeg2Xb0HZijTaj57c5nGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 13:04:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:04:17 +0000
Message-ID: <61ab0203-7bea-4049-84c9-88b268ea7c0f@amd.com>
Date: Fri, 21 Nov 2025 14:04:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/28] drm/amdgpu: fix error handling in
 amdgpu_copy_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-8-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-8-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::28)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fadc7e-6c24-4e15-661a-08de28fe7a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1JYN0w1VWVUYjlLR1lnQjU5MVoydW1OS0lZR2I1dk9rdWh6UVVSakY4MXVj?=
 =?utf-8?B?YkZQQUtVRDRyRFh4Mi9vRVA0REY4Tk8vMzVmYXJpS0tLRkQycEJuZy9RZ1ha?=
 =?utf-8?B?L1lBQldNSVlYREo5NkxadjFxVStCTjdTOWpVUG9RNVdIT3RtaFpGVFgxbDJ4?=
 =?utf-8?B?THdIMjQ4ZDF4VkRkS2xqQWxtVktJbGUwWHFxYVU1cVZJT0czNXVKR3VUa1Vu?=
 =?utf-8?B?SmZzcVhRcXdJU2psSXFSNlRnanVRYjZlZjQ2cUdkak95c1VlZTNoQ09rSzk1?=
 =?utf-8?B?Y1dRcHdxWHpQcnlxV202ejJnUFZXRXpxWGQxZFExd0NrRTE2Yzh5WjhqYzhI?=
 =?utf-8?B?elVHUE9NWmF6dmRsdm9XL09zWXBmTDdmTUxSQjdvZHdiUEMvMGdmaXpyaEUy?=
 =?utf-8?B?Y2I3VUJnU09OSUZzTEtIbGZPejZYV3c2c3RSWUpPNEZ5b29kYTdOYUJXQlR5?=
 =?utf-8?B?Ym1SYUp4dUR4NSsxcTZJc29wbkEzL3IzdDgzVWNXN2xxNUFTYVNjei93NUE4?=
 =?utf-8?B?RjI4aWtlQ25wWjFtTlp0SGJVemo4Q0JVblB6M0Z3VnFMMWJNeXJ3SDh3TWk1?=
 =?utf-8?B?M055UERpSk9FbGVXRFFvbmNYYzMzVExVNFg0K0lwYzZxQjFYMkVXem5udlAy?=
 =?utf-8?B?bGZSdXl1Z2ZTYkRHa1gzQ3plZm1tOGdVNXZ6d0VPZTFuRUpaZU1DenZYMjRC?=
 =?utf-8?B?cjN4L1djVUdhd0xSam84azB2eWZ2eHQxcC9pRGRPTkc2TjBOTFBKcCttVC9n?=
 =?utf-8?B?ak13YzhpTTJBYlVlVGVzWm9mRkRmbllwdHVsclRNZHB1VSszWTYwRmZlb3ZO?=
 =?utf-8?B?UC9jVWpBSHIyNkZGYTFWN2pMeEdTU1RENTUyRW43dS9QbXdVVjFZN21UTVEv?=
 =?utf-8?B?aGdGT2ZEVjg0ZmVxTnN2b2UxLzlxaFpobTFJQ2VUaXJaQ1dQeTZtYUlBbUMv?=
 =?utf-8?B?SEpMd2daMnpPWFNnZDhPOGJ5VzUzU0lrNkxCUStXZTBCbmFnZ0V5Tmd1YktQ?=
 =?utf-8?B?WnBFeHp6MkdoeE9wakp2Y0svQWZqYjBPVVhFSDV5RHBQUld4UEE2ZG5pRkVs?=
 =?utf-8?B?UFFUbG5EL3dkWG5ZdzBQakFvZmlwUXRiQ3hmaXJvK1Z5bVpKOG8rYXFoN01u?=
 =?utf-8?B?WnlWMWpGblp3WC8vUGVTNW8xdlhXYTlhWCtZN0ZTYnpDRE1YUGRQLzVZNmJs?=
 =?utf-8?B?Y0pTbFdKVW9IMWYybnNnb1JKU2dmcmoxZ05pSmhEUDlVVTNWbGgxaHZyQUtR?=
 =?utf-8?B?MUVkME5vZXM5KytPRTdDWHExaVROOTRteDBCVlhQZ2g1NEYzMFVCNno3T0V1?=
 =?utf-8?B?Ymw5MURGWWY0QzhuOUliTGp3Q2tqNFNoL2NmQ2IybFhzblM1OHkybDVmdlRz?=
 =?utf-8?B?VCtpaVNnM0pTM1lqb0YyMnAvRHVGS0sxdWFWaW5rUHJLdWpJWHBqYVJtYXJX?=
 =?utf-8?B?UU9SdmlWT3ViSmNFYkNIZXZibXhkYnZaSFZ3T2xQbzQ2U3VqVktuWFA1aUpv?=
 =?utf-8?B?ZnFUUUlaUkVjQTIyOFdWU1NlUTZ6VWM1V0NNdGJYSnlnM1ZyczlQMElwbjlU?=
 =?utf-8?B?QVNNUnF3UE9XVldSVFVYc1U2T2lGZGdSZm9HVlNWcW5RRWJzVnFNL1pNTkVv?=
 =?utf-8?B?YVJESGVSVk81bk5yOFpCKzg5aTB2NTdXb1lmVUFTemhUSUUveGdkVC9sU0dB?=
 =?utf-8?B?N09NMERuOEZKdnBlY00vYSsxNE40LzF3anNLNHkrY2RCdlVaZGFBc3Q5SVhJ?=
 =?utf-8?B?ZjNOcWRiVFQyMjRGSVU0YXpSZ1Q0UWNLRWUvektWVU9oSURZRFBZbFZ1VnNp?=
 =?utf-8?B?cXk0TjRia3hsblQ2aTNwVUVVdS9BZDlmckNNNDZMRnZuSlFlOG50a0Q5dmdK?=
 =?utf-8?B?VFRVNGN5blQ1ZElvVkZFZHVoNk1ZSUJ5NnhTQzU4NEMrUFRESWVXWEFPS1FP?=
 =?utf-8?Q?POOGA6ff3T4Wj/ODc1rxEXoDMVI0XVIh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am5GR2Zycnd5Z29jSmFRNU0rVHJTN1FuM1RKditVK0tjM0ZiS1ZWbURpRld2?=
 =?utf-8?B?U0UweG43enBGZzRndFNzZGszZ3FUYnVJSFBHMlM0WWRjeWJvSEVpM2FjZEw0?=
 =?utf-8?B?NXZLaTd4cU1qcmJhcmlKS0JxYmNYRXdncVVqdTZ3RmUyNDJCQ0tjeVV4ZEtk?=
 =?utf-8?B?RHZYYmxlYjhuUzlMVGRYWDBVRkd1Sm1VeERrT1pJZlhVcDAvOXVXOG5QNFo1?=
 =?utf-8?B?L3pFb29oekZmc29VU1ZVTitIMkNuSjJZdS9ZNmtubXo1bm4xL1dtcTFMdEtz?=
 =?utf-8?B?U1ZhYUxQSVVPVzhDaVVQZGxTRGQ0bE5yVHhwTlZWZUozWjFJZDk3M01sYlpW?=
 =?utf-8?B?RmVsamgxOTJMdU5qM0oranNzOXFRSERBek9lckNTaG9BMnZhNXpWM3RmTlBn?=
 =?utf-8?B?aEQ2ZUY5SEJOeGdvMUNjejB6L1h6b3Q4VVQ0MC9ZS3lKUk9JMklDU3ZvV0o5?=
 =?utf-8?B?TGR3Mm43bUh6dmFoSDRZd1J2VWw4VGxySy9lZGdCZWlTT2JOMk0ycXVBMEho?=
 =?utf-8?B?clpZVG9pQ3F4TkJxVnNhZTZLL2JsRk9mWHBPM3B4VmZhS3ltaGkzdTBBRjEy?=
 =?utf-8?B?VzY5a0kvV25rcFlCTWNkYVFUQ2RiencveEx1bHBuOFkxbHo4ZHdmZE92REJB?=
 =?utf-8?B?VlluQ1RpZUpleVRvUkswZ1BDc2o3MzdLMlRuM0RpN0NzeENsbHdXNW9iSW5m?=
 =?utf-8?B?SWlPK2U5NkczM3Y5SWJDbFpFTVpGdjdxT2ZnYzNVZ3VFLzhvbkdBdG9qZkF6?=
 =?utf-8?B?clNXZkM1a1RrWmZpT0hVTUJDY0RwVytMVkZrajM3S21yLzM0a1RRdmJoeTBi?=
 =?utf-8?B?WFhFZ2JlSGp5cXRFc2NmQ2pTM1kxeDg1cjJsQTlQeVFiMm11L2daQkRhVGgr?=
 =?utf-8?B?dEMrQmszTUhKREdVR2x4SkwwQnAyRkR6eVhPU1p1dTRTRlcrWnRaOFRGQklw?=
 =?utf-8?B?S2lGbGpEVTAwUVRMQks0RGV1ZzVtUFlzcjYySFhrclk5d2NCN0VTUGNNNCsv?=
 =?utf-8?B?RmY3a2NEQk9ubjl1eXdNaTJERmZzK1VQZjFGdTdZV2s3NGttMWpYYUw4NndV?=
 =?utf-8?B?SjV6dVRxWmo4UFU4ekxmYzVkZXRwcUVxNXdpTjVzK0QzQzlQOVEwM0xUUWVG?=
 =?utf-8?B?bnozR3ZvZlNCTW5NYmdySXdTNjhjRDk3MUpKenI1QmZYNVlzbWNhK05qRkZv?=
 =?utf-8?B?N3JFME5jNHhDVGpma0RneWRGNGtGRnRxaUNZd2RvQ2dwVDk3QXpUcmhBdFl3?=
 =?utf-8?B?MUhmNExtbUs2Z0k0L3luYUtGc2kvelJXZGxSWXZPalBVZjNpOWRqV29hZElE?=
 =?utf-8?B?aW44WGtlV254RXEvWDNEcS9mdDB0ZGg1aFpBWXJ2cTRrWURzTC9qU3FGNmNt?=
 =?utf-8?B?ZHRRdmE2aFdBalVMTm01amJibWpKV2FURTlYZy96MUJMK2VlYTBzaTdGUmtV?=
 =?utf-8?B?MlNJNGEzcTE0dlB4ZWl0SnhQL2tKZjhsY01GOTVJSCt3eXQxSUZmQk1SV0VK?=
 =?utf-8?B?U0RiRjlCK3lYUEVTUGxSNzBQRkN6RmdnNXprRWZwUUkxcGY0amVUNmNRMkh4?=
 =?utf-8?B?UEJyMUwwTDJjbFRob1lpTkE0eXNVZ3l5QVhBNHQyOVB5U0ppVWw3eUlvbVVz?=
 =?utf-8?B?SFlYRERZQWRyc290OGZMZ1BTc0t1VXB6S0h1Vlk2d2U1Q1pLcUlnKzBoOVZs?=
 =?utf-8?B?UnpEb3V5b0ZRSDF4OGpXYlpncWFaYXpmblB2UFNldkN6ZlNhVVJMcmlWOEYv?=
 =?utf-8?B?V2lHRm5iVnMxTnY1cml0VGpGZi8xUnkxRWlvYk9wWUxpWm4zUy9KM1NaOW56?=
 =?utf-8?B?cmxYQ3NCdzNwZnlJTHc4NXBUNEg3NEs0RXFZRm1FMHk3d2d5MFA1NS93d24w?=
 =?utf-8?B?ZHBHQ1ZCRlFsYXF6bVVuZWRCOTUxaG5VTXJKWWhkOWhJeHZ1RzRsenlMRUxh?=
 =?utf-8?B?YnRKQklRK2VZbGR0eDc1U0hYL2k2U3ZSMkZKckdOVkRQWmNMd0FwcENOQUph?=
 =?utf-8?B?SE9PK1dHdjNrenI1OGJIaDBSMUN0YUVja21KYTFMOGZWYlVBeDBhc2VrZFI5?=
 =?utf-8?B?Ti9yc0Q1bFZmODZ2SDZWNEd2K0ZrdDRJQVhrVGsrMEEvc095SmpRbjJsNEFv?=
 =?utf-8?Q?dokoWclcQzbcRu3fvzLNqp5Vj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fadc7e-6c24-4e15-661a-08de28fe7a64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:04:17.6996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oU4kyKfrqNusTdied7xJ2eOWfRveqAYvcCuDVBo8oCk15Z9wyhcIMNR+dNL3X+7h
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
> If amdgpu_job_alloc_with_ib fails, amdgpu_ttm_prepare_job should
> clear the pointer to NULL, this way the caller can call
> amdgpu_job_free on all failures without risking a double free.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index be1232b2d55e..353682c0e8f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2233,8 +2233,10 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, pool, job, k_job_id);
> -	if (r)
> +	if (r) {
> +		*job = NULL;

Mhm, that is something amdgpu_job_alloc_with_ib() should probably be doing instead.

Apart from that patch looks good to me.

Regards,
Christian.

>  		return r;
> +	}
>  
>  	if (vm_needs_flush) {
>  		(*job)->vm_pd_addr = amdgpu_gmc_pd_addr(adev->gmc.pdb0_bo ?
> @@ -2277,7 +2279,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  				   resv, vm_needs_flush, &job, false,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
> -		return r;
> +		goto error_free;
>  
>  	for (i = 0; i < num_loops; i++) {
>  		uint32_t cur_size_in_bytes = min(byte_count, max_bytes);
> @@ -2289,11 +2291,9 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
>  		byte_count -= cur_size_in_bytes;
>  	}
>  
> -	if (r)
> -		goto error_free;
>  	*fence = amdgpu_ttm_job_submit(adev, job, num_dw);
>  
> -	return r;
> +	return 0;
>  
>  error_free:
>  	amdgpu_job_free(job);

