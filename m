Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D328B1AEA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BA210E00C;
	Thu, 25 Apr 2024 06:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y6kkdi3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ECA10E00C;
 Thu, 25 Apr 2024 06:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hipnTY6Q/CLWeHMut+znyQOLNOaRO7KKLxKeVf/xcwZIdw+icEow/hhGpb0k+p9rYaeLivv6YH8JVRvgFEEyCwsL+RqJ7fJvhEZTImfTg9VO1onra8ItamxTBrxpEWM7ZdgAAwHN2AalKfheRdSuTczbjYdOo0glkTT9tIcIFoCtwDsWQfeb1SYsZcZFX3hsW2jpBYjaMgqbiN9eA1liqVF+uAO2JiEd2he0mrveJopN+5f7WqJK78+OsuckKGVLYtiXkYNDe7u6fOs5rcTgWFca6tXE3RncZDC2vsh5ZKNEIIqP8BrC+PHH8GIfvo/gBJW9/sh3oGdH4Kyq+sDOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czrSOTqx1WkiZqGWEzxWJ4PziV1eFtR1fW54KXok/08=;
 b=UCXKiJ+3eNFMOBv1e8a0LKOY9/8VhzaXbUYGsoZBhWYehYSGzHXF/Q7zlseIeFSG9HD/2bqU1yuxwyiW7xZeOl9fhI2hcJMqdoaPtDt3VTmiTNpNiAoVJMp+6Wu0oxNe1bxlBwa0qkRJyvucFWQM+pkz8/kZH2TAe2c1vSoeZQmPwiBa+Rq4BUttpP9fiNNTOY1tveR1Nz72Rj8iPHtWu5+SB9oAcL0qd5uhh7lwTgcIis954QiDWSZHtS3Uh+6YgicskAx/s2IsGJfJ9Px62SCY8WRqsnnhMrLH68NZL0JRqrN5WcXVkflXn3VOtFtycZ/VUW113kBF7wsMKNhLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czrSOTqx1WkiZqGWEzxWJ4PziV1eFtR1fW54KXok/08=;
 b=y6kkdi3Jw+w7dvjtifJe+u4UnS2fEY66uVIihu0hH2gj2e4nOtFqZoxegbCkINXmtXu53ozHQRkAOOlJnyByf288aEWk47t1051y5WIOL4yP72SmFfRvtv9zss8hyhU3DdDhsDsJ/57csFG6RDmsxhXzhGURUxXwR9ZOiEY8P6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:24:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:24:17 +0000
Message-ID: <38533ddd-3ad8-48c7-ae9d-8101b184a2ae@amd.com>
Date: Thu, 25 Apr 2024 08:24:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/18] drm/amdgpu: Don't mark VRAM as a busy placement
 for VRAM|GTT resources
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-10-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-10-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: a9094b2a-341e-475e-d781-08dc64f05583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkR3dGZ1b2dYTnhzMUZyN0g3bURyR0RyZG13ZERuNTlqQUJxZGlrYzBMVDdk?=
 =?utf-8?B?a3ZsWjV5eTVjaFNoTGs2WW5RanR0YkFYVEl3TWZTNjdTZGtDQUxla205QkZV?=
 =?utf-8?B?Q2JtVzJ3YlNBN0U0eXAwSzN5dG1MbDEvMVpNRUtDcGJ1RGcybVBEdS9jdG5o?=
 =?utf-8?B?dmFzMXVwcFZkc3A1blJqQUpTMS9VVXpwRkgwWERDeTBna2ovUElJT05OWndo?=
 =?utf-8?B?Z2UzM3NnVkZscENYQkhvVDNKU2Rvc3ZtVk15TDhYTWRJblBZSFpGZ2p1Wm5v?=
 =?utf-8?B?VUZLSVRnTHNUaGJIUXBwSUM4dlJJZWJHb09BWVd3emtmZFZWLzNtakJHWDNv?=
 =?utf-8?B?bWhSdVE5aEIzblhQai9WTk1FbldHWVZJRjdYTkxJMDN6djNZZ3N2YTdsaENH?=
 =?utf-8?B?THRZVWFkYVJsT0ZTUW1pbkxBKzdhZWZUWjlYb1IyaDFzYjR3V0tvbzMxWk00?=
 =?utf-8?B?dys0VVJCc21TT0NZc1VyUXdtRThaRE9ZLzV2VVVLMHVXV01TNUZPMS9jOUpv?=
 =?utf-8?B?WCtsc1hEY1hNTXQ2YWN5OTJUU2ZxbkQxblJHT3FEZnpZYUo1WnBleEFuTVcx?=
 =?utf-8?B?dW9WNGZhQmxyakhQd08rWmlmQXRNZVNlbWtlTnlvOFhOTTVOR3gyNTJ6R0ll?=
 =?utf-8?B?eTZ1Q0Z3N3pmblVkcS90Ny9IQWVVMnQ3T2htS3VlbWQrT1RaZEpDR0pKSVZC?=
 =?utf-8?B?QzRIK1RuVjNaUDRPUVJNVEJjTENLQnZzWFdvZnNUSUtuQ2hJOTRVNWVSaFdO?=
 =?utf-8?B?S2Y2VGtqQksxLytGWG4vcW1WV0xsUGhRNk1JcmFaNldra2YyTGlhRHgwVXNi?=
 =?utf-8?B?YmF2RFUzSXh3dEFRdDl2UXBGZkxCMHQ4NEpQbTZGT0c2c29FT0IvY1cwaE0r?=
 =?utf-8?B?VXBWaWR4bC9SaVlTUDN5dFROUVRObFdvcGt3RU1SWmtOd1cwWjhVSFhsbzcw?=
 =?utf-8?B?MFZLQmtMY3VYalhuTURrRXVrQ09MTXYxME85SENST2pwaEo0UTNiRFQyMU82?=
 =?utf-8?B?Tm9JZlJCRW5CNytDbkx4U0xlL0V0dHNweCtUT0RUNUlSM1FUZ01acGJ3VGUv?=
 =?utf-8?B?a0RvY0NhZkpsZ2tZcjY4V1piL21VS2E4MW1xdnRzaDZNOFUvOVYrTHRIUThr?=
 =?utf-8?B?YkM1Sm5GR1kySXFYWXhieDlHcXVPMzU1aElJMHBCODd4YS9ZaTZTdWI4NXFo?=
 =?utf-8?B?SE5qSVBoenlHSUlaWis2c0NrUGdFTHZmRFZvSTg1d1h0ZElLYnlLY3JleHpx?=
 =?utf-8?B?MmFCNWZDREwxVjhDWWN6cFZ0a2hNdDZHM081eFN5T2dCZkR4MHJPWTZZOEs5?=
 =?utf-8?B?aWhNMkpoL05EVDRUemp1bFRLNThZbU82QUcwV1pLNkZzd3psS2xMdjdKNGpC?=
 =?utf-8?B?eEorbE14VW5wMUtHY1lzM0F0NXVoWVl2ci9sL0ZySjMvNUl3ditOOGFGcFZU?=
 =?utf-8?B?c2kyaFhNNWl5UmRPdjQxbzRMVTBueWtPRzZVQTlFRTZSME1nR3pNZ1lsRjhE?=
 =?utf-8?B?a2hYWHFnenNIT1FSaklVazRsamt6aVFhYUs4MnQvbTR5NkloRFJ4U1pMZTYy?=
 =?utf-8?B?b0JJVHRnN296cld3UTBRZnVXTjkwTjlsY3Q3a00rM2dReGd6VzYrcDlDbVFz?=
 =?utf-8?B?dnRlY2NldkNQaFZDUk9ITXZ0NjF2QVRXTStNVm5EanVSNWsrWkxucVRXR2tl?=
 =?utf-8?B?WUJWakhCZFFBVUNkY253dWdrVzE1R0MvM2JCYWpnL0s4SWxndlNrcmF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXU3a0dYaEZVemhRcG9SQm1YWmFTZDJJOXJZT2puQUV1UUlZWkttT0NqZmZ4?=
 =?utf-8?B?M1lPUFBCMlcvL2FkS05YZnQ1UGdzd1QvWm9JOHhwN3AwUm9HS2JLdU4rblkw?=
 =?utf-8?B?QUd3MlFOalR1K1lhdnpzbjhZeVorMzd4SUFNVWlyY29BMjVHb2JMczVYelNs?=
 =?utf-8?B?R2NLY0RsQmt1WlZLYjdNbHJLQ1Jpa0lqWHFBc2FpWFZqZUwwR1hFajJUTlhW?=
 =?utf-8?B?T2htZEdEYjF0azhqMVNVWi9yeGZIemhNVzcvNWNSaWROMUZXbzhMSVFTRjZK?=
 =?utf-8?B?RUN5c2ZzU2YrWkdIVHFKZVVJV29DUDVpNnlVRTdkRGpuNjRuSkNTNzdlUlQw?=
 =?utf-8?B?QnRvMURnY1pVcTEyekxUT1cyWURlU0xsNmFGTHA2RkowOGpuRVZuTDBzZkN5?=
 =?utf-8?B?UGRhaXJDemViM1RDZkNyOGpTMlViUGRiZHBDSjdwNFpYQ2MzUjQxekNiVElR?=
 =?utf-8?B?L2FCL1JNRkdIRmd3OXMzNmFpOFFKRkFFT2I4Q3dYQUVCQzMyYUh3YjRtRFNU?=
 =?utf-8?B?b1FKcUxCekZXZCtjZnNUdW42L25aalpOMDluZGQ5M3A4N1F3U0F6ckNMU0Jw?=
 =?utf-8?B?TG9qdXhVVXptcGRxYVdwRUpQbDczU2VyMkJ2L200dlFTYkQ1cjQ2T2JiOHNM?=
 =?utf-8?B?R0RCSEVHWVlGUkxlZnNvcEJvOFh6cytjNkN2azArbWN1cUVIZk42cGxwVkZv?=
 =?utf-8?B?bGZEZ0t3eXdMVE5ydUNUaDFSa2d6aVoxSWJWcjdjTEpvMjF3VlZxdXFaNGF0?=
 =?utf-8?B?OGlYZlRmK3dHMWJ3cXZ3L25LMDBHSkJPZmJnT0VEVlNuaGpaYStZa1dmNXc0?=
 =?utf-8?B?VXQwMVdyZ3pLejhFZWFqcWcvTFNUNHdkUmhHTnIvSzNLeXhlbDhrdE84UWwz?=
 =?utf-8?B?RWs4cjQ1OVFQV1dPR0ZkakNtUnkvczdXRTIyMENMTjFYRGFvckx4aVJUVjlr?=
 =?utf-8?B?TCtRdGJBMFk3RDBCYi93TnI1b1FKTEFNMkNMNlk5WkdhTEtKVytyK2tWcmFs?=
 =?utf-8?B?REcvU0N4OHBTZllqM2VxQUw1TlRiTHpOcDBKYk5nb3VDSGh1anR4RWM0RWk2?=
 =?utf-8?B?cTUvS3F4SVV1UG5VL240aENrTlVUOFd4R0RIbnQxS0J0bGorcDFmbkMyK2tl?=
 =?utf-8?B?WFR6YnBJTk9BazlhNWxrdUQxQjhOcWx1Sm1uelk3cU1xejdBTHZraGhvVmpV?=
 =?utf-8?B?VHZCQ3JEVkMyYTVseTI5eWlWbWVZK3gwV3RiM29WSHVtV3NhR0VmTmFWVTFZ?=
 =?utf-8?B?ODJXVFpRQzBlMlFYbHFuK1I2ZU41aHA0a3pQY2FkVDBlRUhxcHNCMkFRT1Va?=
 =?utf-8?B?MFdrTEp0UUdweExZeGJhV2FWVlkvR1FkamhDeGpFaXc4WWlJZEVzcVNaM1JY?=
 =?utf-8?B?bngwT1JobW1iY2NNQ3k5MlNudE9yc3ZOUXUxSDJSb0QwRUd6bDJmQmxqOXZW?=
 =?utf-8?B?Z0hwWGFlUWdzNjBmbnBaWVVUNmF0Q1FncERpTk1zeUw3dXlMRlBDQWppRkN6?=
 =?utf-8?B?UGZwOURvY3QvRWkrcHlrT0pTTzJqSWFuL3ZZNmFsZ0JLU0VCdys1a1FmOVVn?=
 =?utf-8?B?MEYvMUg3MjJqM291aDJLbE43ZEZnRkdaWFRrSnZvbU1PQ2FVVWtEa1RRMlIr?=
 =?utf-8?B?OFNhcE5LY0VXMWxCQTZXQytCYk93ZGY4S0NIZEFwYURWY2pLd2FZNkluck14?=
 =?utf-8?B?ZTM5NGVjTVhpVUVBbXg4aFVzdDdqeHhwWk1MSTFNV1VLRWpWbnk4L2pGdmZq?=
 =?utf-8?B?SmQ0cWJxWm1FajJNK2lHL2hSeVE1Nmt5Z3QwaGloWEpKZkJHdFpNV2xlbzZp?=
 =?utf-8?B?ZnA0Ym1HSi9WbVVhemhXRFRPeWtHTlZwZkx2bWtwelA3Tzd2bTg2MGk2eVBP?=
 =?utf-8?B?bytuWTh0dTB1ZlBJOG8wempSNlZZa2pxcHJIYk52VkI4d2JCUkJ1b1gvbUhT?=
 =?utf-8?B?RDQ3WUtVS1NMNlQxcU1OeWxLMzdVVzRwcUdjT0hIRVZYMEVScDB4ZE1QZUND?=
 =?utf-8?B?NWt0d3pacDcveFA0dDkyZFRGSmJCQmZrbEhJZ3p2dy9ub3Jzc0pGcmx3Mzdw?=
 =?utf-8?B?YmtmZEZ6Z2swSnlsYk1lbEllU092Z01MMWV5MWlwUHhMcTg4OGh2bXR3UExL?=
 =?utf-8?Q?tsjgbRJLEocWa5VxsIHgE74nI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9094b2a-341e-475e-d781-08dc64f05583
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:24:17.0443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2fsCZGBMpy9VvuI2plNoXHk8Ru2ZmZRBA38lwwzQAPXJRfbfhrqK1v4CmVOKH4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
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

Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> We will never try evicting things from VRAM for these resources anyway.
> This affects TTM buffer uneviction logic, which would otherwise try to
> move these buffers into VRAM (clashing with VRAM-only allocations).

You are working on outdated code. That change was already done by me as 
well.

Regards,
Christian.

>
> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 5834a95d680d9..85c10d8086188 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -127,6 +127,7 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
>   	struct ttm_placement *placement = &abo->placement;
>   	struct ttm_place *places = abo->placements;
> +	bool skip_vram_busy = false;
>   	u64 flags = abo->flags;
>   	u32 c = 0;
>
> @@ -156,6 +157,13 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>   		if (flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS)
>   			places[c].flags |= TTM_PL_FLAG_CONTIGUOUS;
>   		c++;
> +
> +		/*
> +		 * If GTT is preferred by the buffer as well, don't try VRAM when it's
> +		 * busy.
> +		 */
> +		if ((domain & abo->preferred_domains) & AMDGPU_GEM_DOMAIN_GTT)
> +			skip_vram_busy = true;
>   	}
>
>   	if (domain & AMDGPU_GEM_DOMAIN_DOORBELL) {
> @@ -223,6 +231,11 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
>
>   	placement->num_busy_placement = c;
>   	placement->busy_placement = places;
> +
> +	if (skip_vram_busy) {
> +		--placement->num_busy_placement;
> +		++placement->busy_placement;
> +	}
>   }
>
>   /**
> --
> 2.44.0
>

