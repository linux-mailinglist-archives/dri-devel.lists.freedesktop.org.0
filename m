Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FC753251
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 08:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134A310E7CC;
	Fri, 14 Jul 2023 06:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5082D10E7CB;
 Fri, 14 Jul 2023 06:56:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCMuQpJUOn3cF5ymyWfbkBfCw6x66EmPZUzsKvROd9OwDsezHQgd1Vg3WbPt6rI8FYuOS+LR7/yaT8VvImz7mhI8v6xzFiHwykS4ONhJlBIwBO2aAGNeKOWHCARoEP7zXr6Ybqz3G2NZ1U/RHpPQ3e3jWB9JVtAWF+RgZf5oAO+8xzM9ZcG2EJGey+L0T1KqOcGTrT+tQO6XPdSvFBM3dr3qqSuEN+f5FW6K045D/OGuGlWUaTmH/E4sVzPE2RVPN8vK/SbrMkALLB6K6+T5DDcnaCEzbCbAoXZyjoIS6JXHjKfpLxEEPP2AAhWLHnWWKoMs187Gr5Oqc4WrosWToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3YY9Cu94Q3g2G5osfhDmwLvQiCadQKD2GQg4w0UNp0=;
 b=gnvvk4R7FOV4Y94Ukq6PE/Yjm3g9yJ0IPg+e+LhptpiRQVT+0PyO11kJTl7cro/aAJHwIdV0Jph+jDp+TtrqG7jJWdYyYfElpVk2ST1cM8SVbDDwzFqebCinQccbuC6Uw1fbWkW//siaPSvO6IsCue2dIQRJ1fG+9ymCvyvG1Ue9oqreLxZ5qGJf2UNMQeMp4MB6po3Y/XJnMFs4GXRZdwgEyvajoF9zmXUKkWItkokwjYOKt5QOQqi8VX9IPJFvYsnBV8ftwPwOUDKt4oRLJi+tB4uRyoyRsVpRO4Auvqojwbl/tuQnFR8w10UNJr8huQ0cuXU6gVXMdmt+uDEZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3YY9Cu94Q3g2G5osfhDmwLvQiCadQKD2GQg4w0UNp0=;
 b=hG0dLq99bJjcLSuwU6P/fU9l/QAZ4isUJ7YlzHj6n6HyGPTLxajVIhVs7SjK8PDtm8b07Ed42Xj66POEMk250sKH64sJr4OsuAarIacokTKG52Nsu4t+brGns0whhH6+H6wVPPLzgRqn22gUHvrU7gnEtmna3LwnYtq4/MP30Rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8509.namprd12.prod.outlook.com (2603:10b6:610:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 06:56:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 06:56:20 +0000
Message-ID: <defcbed9-7cfc-9499-9e08-02a06390cc8f@amd.com>
Date: Fri, 14 Jul 2023 08:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dma-buf/dma-resv: Stop leaking on krealloc() failure
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230713194745.1751-1-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230713194745.1751-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcd6eff-9ef9-4389-2a63-08db84376d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vc2Q4VJO3Zh2jFZzSMHRwnw3XYm7R6MvRAIIL8TtcFExKZYbghT3+xdIV+fAHjbcWWuRRYBb5yoo52NA6NaTaRfMGVUPy2JVojspK1Pkm6WbyH4z9Gr6TQghRmFAAQra104oOGXPu0Hd4xEZK1eCKck19k8gmJirlwF0YkYMKnEhKktxCbWWQb0Rk4ZGxGVySCiZgpBK55sQBUjJqkCrmWC9ONSnIqThkqNRUSokdeRM+2EnGVs3JaV+BEZkln3gbl951HsyJp2Sq+Rxnf5qeyDhl9YX/jC6LFms2YIxVaWpguhM6Sm3IMgWyO1Iw2AMw8kw/hu98/h+nBY3dEHevs79VaWMumI8Od/RsiyJEa6Zzpw7OTQYJzgYscFLreg/f3u2jn5leccFx7VDSLicOlFx/pOJsEzHuRQkwDBwF2qN5jXa0jtE+YUwsDyx8xvKA63DXfGaC0Gu8lFPenfP5t1x0pco+tL2YVRN9z+eUooHyNL5sNhTx9bdKjP5VNnNBFx7dgNn9v1QdXCtRkZtfuXVFqmRC5jzSErZm+lNmbVbkvaHdMLKsLha0bRNsjg59T9HGdELDF96Cl3JTucTJuMq1pqD9BWpSJOAYBv3YLCQ02kIyStnjv7/cKO6FBRiZSmXCQJR9vCTf4Gq07UvDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(4326008)(66476007)(66946007)(66556008)(41300700001)(316002)(2906002)(478600001)(8676002)(8936002)(5660300002)(31686004)(6666004)(6486002)(6512007)(66574015)(6506007)(186003)(36756003)(83380400001)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3g2bnBsSTF6dVhDQVd5YzE0azROOEJnSCtycTZzcmhCYWMwR3UyamxnckVa?=
 =?utf-8?B?eWQ0bUJBQlQ4UjROeEJSRnMrMWVsanZZZjRnYUZoc0h2NG9lVlE2NC9ubnMy?=
 =?utf-8?B?SkIwWXoyK1FoVkR3bURYWkxLeWk5eUdGay9TYncwS0oycTdCME55cDlFV3hT?=
 =?utf-8?B?dnFkS2ZyRisreTRUQVM1TG1jcUd2SUUyMm1lZ3BKZHhUZFJON0pYeE1mQVl1?=
 =?utf-8?B?UGZJQnNxaVhORjdlbGdIWUtvekNSc0hFL1VYS09kV2NPa2dpNWYrNmVwOFJE?=
 =?utf-8?B?RXRvWEFEYkE2RllmWGRHZXJQNnVsZ2M3TWZkYkNJbkhQZFNMUkptKzRveU02?=
 =?utf-8?B?R05mcTVLTHpKL3Bmdnl2Ny9Gc0JqQ2c3UFFsc0VCcmw2YTRmY09WWTl4SGkw?=
 =?utf-8?B?dUZtNEJ1UE5DUnA1eHpjK3RveXFvamUyUXdPbFRxLzFkY0taL3FaQ0FIdmds?=
 =?utf-8?B?ajVNamhOcEx3dE40NEFac0hwQUprazNpdUdQQXl1MVNFak01QTdGcVh4SzNm?=
 =?utf-8?B?WUFQY2Vma2EwL1JnMVo0OXhibzc2QXRuR3RRYnVBaHplbVJ1V2x3MXBnWWIz?=
 =?utf-8?B?UHB1ajh5cS9HWmVRTGkxNDUxZzNvOGRNOWQ3UlNad3hadnJrVG9zVjNNR3Mz?=
 =?utf-8?B?V21KalJydklKbWFMKzg4eWZSOXA5L3lRR1pGNHZzNU1kWnA1WWVSbWp5eUJq?=
 =?utf-8?B?amlXd0N2QW4vaWNFa3o4NE9JQnFFK1dwcHRxdEdrV1Fmb2lKT2ozck1zb3BY?=
 =?utf-8?B?YlEvWVV5d2dWUFBFeVJBRGdHSTVMdHMvZWsrcDlhanFlOHN2Y0NIS2pWNzdk?=
 =?utf-8?B?N3ZFSGtvb3p6TzU5clF1bHJHanNrZndHWmxLWEVDVDdmeG5RR3ZtZi80Qndm?=
 =?utf-8?B?ZWNEUVkxQmtBTzBZTW9ISlVJdFlCeXNEaDdzUm0zNjhsa3gvOTg5SHlNaHJM?=
 =?utf-8?B?aXVNNnVNTmExUXBqOVpxNzZsMytZZWZRb2MrbEpiSFI0TnM0UWhDcG5GUHg3?=
 =?utf-8?B?N3BiN3BsR3dSdnFwQnh6TS9LaDExVmJ6KytQWGx4bHFxZllRODFDMk9tdHVD?=
 =?utf-8?B?Y3dua01xR0tNVU80VVJXNS9VS2tleWRtUWFDSktxRzJ4YUl3L2Y1bzgzaFZk?=
 =?utf-8?B?bFkyUkc1am5hVXErcUZNTmlrYzR0N09qQzlZbk1lRmxqVXRDMVZiZ1A2QTB2?=
 =?utf-8?B?QkxrNG05d3QvYzRNZTIwN0gwMUR0aVBkNk1GdmVlQ0Y3eEkrWDFFTHk4UW8v?=
 =?utf-8?B?aGsyU2VSSjJtejRyR3owOW4wMm55aXVUWDJZb3Q5U0kyNktReGRzRlRCTFNn?=
 =?utf-8?B?WWZ1T0dGUDhXemhWYUdjWG96WXlwckdKb0tMOWxQYzQ3d0tQUHIxUGZrcEFo?=
 =?utf-8?B?WlJNZlRJK012T09BZFA0ZitJQ1VIMVRLYUNXMEp4SkRxUFJjMG1LdCs4K3Bq?=
 =?utf-8?B?V1A1b25iSXlldHhtTkhKbitFa3hya3NvclEyUEd6ZEJOVTRmS0ZOdmQwR1Ez?=
 =?utf-8?B?NVk3UndnZTBKeWhzMWVReUUvQUhkZkExK2JhWUY3R2pFVkR6RFlJMms4MmtR?=
 =?utf-8?B?L1NoVU44bER4Mm55YWVFTGUrT2c4a1dQMDZGbGovei9MSEthSXZEcjJuWFhX?=
 =?utf-8?B?VCszTXhrdGVkeXovcUFieE8wdE9qK0h3N2k0N2hXcUxDK0l6M1lHRXg0TEU4?=
 =?utf-8?B?OWd1WU83Y1FUdW5aS291aFlFOWpQSXBMY001QWZnSGpFNU5QOGJMWlhXZDZk?=
 =?utf-8?B?UnVTbGt4Z0xjakl6YU5JTzcxUE9LTUhzalVhRnk3ZlNLMndjQU5LcW1CTldi?=
 =?utf-8?B?VHJmaG1Qc094aDVqRjE0U05wMGFRZnR5OE5oVjZIWmZqUmtCaTVtNytHekQw?=
 =?utf-8?B?QjZJZENmYjdNbU5mOFp1djBmOHRWY1QzV25PZzVQNXhUbDdPZ1E2Y0d5QzFV?=
 =?utf-8?B?dmN4eTBiWVBaRmZtc2NudS9VK1NFd25iMmJvV1g4ZmFJai9CL0NKeDNRZVlT?=
 =?utf-8?B?bmNVZXNjQStsM3daSi9zbXpZdXorUmYvOTJhZk45eGtzV2NzakVKY0JOY2Y0?=
 =?utf-8?B?TllFTHZDUkM4UnpLcjQ3VDdwTnZWcGh0Vjk3cEErRWxjVWJOL1I5d1BuZDVP?=
 =?utf-8?B?c29NUXIxZytmMDBNbUFxenhGbXdReXVxa1Y3UE16OWgvWjlHbjhHSmNPc0No?=
 =?utf-8?Q?sycgNExlNaYrD1EtEMe7hl61h03YtljnTlD6/fvbeDU1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcd6eff-9ef9-4389-2a63-08db84376d74
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 06:56:20.0042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCtob62qVWP7L34u8EGY87kifZEZaFMAcqJUcihIIdEJMs4ZrFGn+bIApRvZKaT4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8509
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.23 um 21:47 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Currently dma_resv_get_fences() will leak the previously
> allocated array if the fence iteration got restarted and
> the krealloc_array() fails.
>
> Free the old array by hand, and make sure we still clear
> the returned *fences so the caller won't end up accessing
> freed memory. Some (but not all) of the callers of
> dma_resv_get_fences() seem to still trawl through the
> array even when dma_resv_get_fences() failed. And let's
> zero out *num_fences as well for good measure.
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>

Should I add a CC: stable and push to drm-misc-fixes?

Thanks,
Christian.

> ---
>   drivers/dma-buf/dma-resv.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index b6f71eb00866..38b4110378de 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -571,6 +571,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>   
>   		if (dma_resv_iter_is_restarted(&cursor)) {
> +			struct dma_fence **new_fences;
>   			unsigned int count;
>   
>   			while (*num_fences)
> @@ -579,13 +580,17 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>   			count = cursor.num_fences + 1;
>   
>   			/* Eventually re-allocate the array */
> -			*fences = krealloc_array(*fences, count,
> -						 sizeof(void *),
> -						 GFP_KERNEL);
> -			if (count && !*fences) {
> +			new_fences = krealloc_array(*fences, count,
> +						    sizeof(void *),
> +						    GFP_KERNEL);
> +			if (count && !new_fences) {
> +				kfree(*fences);
> +				*fences = NULL;
> +				*num_fences = 0;
>   				dma_resv_iter_end(&cursor);
>   				return -ENOMEM;
>   			}
> +			*fences = new_fences;
>   		}
>   
>   		(*fences)[(*num_fences)++] = dma_fence_get(fence);

