Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB864FA903
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 16:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930710E0EC;
	Sat,  9 Apr 2022 14:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7210E0EC;
 Sat,  9 Apr 2022 14:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8WwcfnXv7S6SRDzfvYFO86SvMM33XHCfsSEoZHGgEdafSB8vR091r/cXYSTRtGvW/aRvhnrA38BTHtMJd8iOJM4d70aXVVyYUMbfpIe8tzh36ZO1oFqsEVah5SMe15dh+nTlwd0Qu9TnJ19u6H5q9RGuNseL4bhsyi9f094tEBi24vIetWI8a+RRvoqYmdvD8nQESms5EQY8YcQ8+taGWXQeEF1q4uBTxDaVb6Lk4uxwm0MIm06cXzCulJEpAMavVtkL97Dc9Su07UEiciQcc/Qfcu7s3aTRs0wJkkr6Q8W1IWGj9wnP92AM5Y/OT7uD6SsifRFHhi9U4RnQxAhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOreZU0Z74iCI97+EhAGeYKw3R5mL9aTaeseck0KkQM=;
 b=c3e+h36NEGTdiuj7GI78TRJ/BpQx+deBTwyBrWOFuSwOJRGGOv/mtAkF6Sb9rrfz306VUEMhAlVogen8NAAc9hpaYt84dSjkrQwkRt8ht73Yfj8iSIgXKoDHKyV/0KFyS1u8wimgEiUdyJd+zfhSvtHt4cYErB495f8cz/pVasyVpbpuF2M4rhWXasZM1DWIsffH8qB6KaMcOtmeyH2dsVeVlYWm2/ZIKF1rNuHoMLY7VnPKWi4DQfSyL7/DxpDEgUXpeXx426tG20AgnBES6zGp/QXgTjYYFWMW46pAXba8UsgjCc3cgVTGreVwmbEmOHC+QZO/xmuFytvnEp1N5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOreZU0Z74iCI97+EhAGeYKw3R5mL9aTaeseck0KkQM=;
 b=wYg9pgh3M0Oe1alu6bER8QOlhqrB5EJgnu/deWdjjreqG89n3LjsP4wNwWTRze7rPKB++fXasYaKHwoS1qjycP68O3jX6E+f6EBkhrQMWIvDEWra1FA9/bbtoVdllf+g7Ge+UjupZWzpqk+ToEa3lgHnG6z/ceIy/s0ziI2A7pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4893.namprd12.prod.outlook.com (2603:10b6:5:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sat, 9 Apr
 2022 14:33:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.027; Sat, 9 Apr 2022
 14:33:22 +0000
Message-ID: <fe1e583c-b942-0f33-55d1-435f0966b110@amd.com>
Date: Sat, 9 Apr 2022 16:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm: add trace_dma_fence_emit to msm_gpu_submit
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, freedreno@lists.freedesktop.org
References: <20220408211230.601475-1-olvaffe@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220408211230.601475-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0015.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d67c1301-a6ca-494d-7a7e-08da1a35e60b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4893:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48933745546F06908A5AA21B83E89@DM6PR12MB4893.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhqQnECA/JU7/vtzLsL6XUrbbQHDoGrZ60QdV5l5rVNCytN0zB0rwxl55DvwbgaSvEyWRNgvwRPy2blae1XVvog3VDh4wYZAkvMG4/DKgGbhF35KALAYMegrpFcPd3oMNeO5VTXkAw/J9ApK7rww9YrPrjkS0vbtyWWlsR8Nax8v3qNGPoYr7qZAvbaqAQ75fUZzptQiwF++24x9O6gQQ/WRC0gVBrffda5klbBaFg5kKDBp9vkwitDHRzNVg4lDCaieesU5/fDNPSGQDMTtpfTXXw8IUbA71b3arZKKNPrjYFxJUE8xoTD2IjOnmBEIJryXDYBtzLtgUQY8Wny6+jkksFqDC4ORc9J5CtZiIWO8XSgEkBXOZzM/g1iCZIpTM0sgAifCgGuA/qXOzHz/jHxxr1OoJ21tM+0DlleYeZQMAbAcJzroz7YeeRIqMmtreTZGgFU5pIPCxnOAE7HgMtODmErVzkrvwhP9Lz4yoby68oCe9qVGQXpWVyoHDtb+gsXr3MtqWN/6ktOmiyQ/kId+Lk/I1WrF1hzdhog6kKl3SBk+JHt2k95Cj+lIdHzIP0VSk02tNQ+XdGXKgRdzoeGOEGFh7EhXufGXNGK8rav5TAacmGX0H9cb3SgORot7g13FMX8LHmCxjB4hZMHTq9+ErQEnaH4ohyOVxCSM9bsdl0vli2aM60zWDxGu0OXAgidhQsk5FxIwxwqFY8Ik+9gbRAD3c//QkafcrFrKJRW8uZo783pjuwH8o2kxh/B1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(316002)(66946007)(66556008)(38100700002)(4326008)(8676002)(66476007)(7416002)(86362001)(31696002)(8936002)(5660300002)(508600001)(6486002)(54906003)(6512007)(31686004)(83380400001)(6506007)(36756003)(2616005)(186003)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akh6K3N5K1cwUjNjVm1zdE50b0JqOHp6b1FOd3RDSVQzZDVIb3hsWXRKWnN6?=
 =?utf-8?B?bXZBRVNKTTlxMFNFUS9lZEtDNWVTck9TaG0yZGVKUUEwNFJiSlhJbzl6c1ZK?=
 =?utf-8?B?MS9ROWJXejlIK0luQjQ2VFhYS1lMWlZ0djhQdGdzODdTekpZeTQ2cHNIc0pG?=
 =?utf-8?B?S3F5czJmRkI2VWpVN2ptdkFzY2x5ZU12UUVsdUgzbkVqZURDV25NSjgzaVkv?=
 =?utf-8?B?Mk4wOG5LUW1sK3grK0pDU2w5aUlxcld6UFhxazRsQWg4YW9VZy9jWDRIbFNx?=
 =?utf-8?B?QmpnNjhrT2lyZm5XTFFXQmJPdXNvaUtsZndCL1lNNm9TNG9NOGFsdmtCbEls?=
 =?utf-8?B?Y05MM1FHbU85K0VLUFp1bE1XWURMODE1dktVajV5VFYydzREUFBzT01UQmJD?=
 =?utf-8?B?ZFJXMlN5TTBSQm5MZnF2ZnA0elFjNmhpU2YxVU4zbWpLZ0IvR0JkcGJ6RWtF?=
 =?utf-8?B?cEJIR3NvTW1xU3VjVUJnTVdGN3hMM1c5eGRuN1NEMlNsazlyV2R1S1NQMkNy?=
 =?utf-8?B?eTlPWm12L3p0OVI3ejY4bzV6QVNjUXhsdWFzNUdNQUN4ZW1YeUhJRWQ0Tmc3?=
 =?utf-8?B?b2dRL3B2WEFaL0lLUFlyMTQrc2Z5Y2p4ODJWVm0vSVV1ZEJLRWZQeHJLTGd1?=
 =?utf-8?B?ZzhhYkxza2hEMzFwS0krSzQ1OHpvNkN3aGNldHIxbFlaNThpcmF5S01Tclp5?=
 =?utf-8?B?QzlkRm8xNnFpQ1BLT1V4aXl0S2ZCVjFGRkpHL3VxY2V5aUVEeTl1aUFkbEgv?=
 =?utf-8?B?NXpGOXpFMk5zcnMzUnF6VTRnT2VDKzB0SURlQU44d3JtVjlUUkVzN2JlZFRa?=
 =?utf-8?B?YlVrcktDR0JVSGFBL2cvYm1SaU9aYlJIaTdDdEJaMVJla1UzMFRWRDB1bTkw?=
 =?utf-8?B?cnlwM09sSmFIZ003K25RZGpZM3Q5QUFaZGhma0RHcC9XS0xJd3pqSEVzSG45?=
 =?utf-8?B?YlJnckQxRExwT3JpMCttZ3hXcHNPMUhQbkhBWUhwMXQ2cGVtTmtJNlIzZ0FQ?=
 =?utf-8?B?TEF2WGhXaHA1Rm5sM0NON2kyeWI4T1p3VC9HL0lOai9tNHFHY3A3VWZwbG1W?=
 =?utf-8?B?d1dKU2JVTlB6d1FObVBRUzVOcG5paVJ6V2JtUEdUVU44ZGJFblUybGhnakx5?=
 =?utf-8?B?RXBMcTAvNms1SFR6MFVJcHcvWmNMb1hLODNJSjVuMlFZVmdvMmEzcGhJSXBL?=
 =?utf-8?B?VUw4UW4wZzRBUzljUlBYeUxtaXlPL2kvWEhkRGtRRWdqdERWS3dFM1YxcGc4?=
 =?utf-8?B?OWN3MHIzQ2V4WVlyeDBhbU04NHVtK3AxT2cyUkdzQ0k2ZEVqd0QwM2tmaTlk?=
 =?utf-8?B?eHFxNnlnUnhOcXM1aERxbm1Qbms2Nk4yYlB1SXZ0N2x1bGZsLy96V1dMWTA1?=
 =?utf-8?B?dDBiQWE5UFBMc1N3NEp5Uy9wWldHVVpDOGxRalNSTEIwR2xpaXFnRnlCZHFT?=
 =?utf-8?B?ZXdtZ1NobjlMai9MNk1qWUZpdkdxQXBiOGFzZ0hHeEd4TkhJNEtISWFEcllr?=
 =?utf-8?B?UUdRang1RExNbmRLNUxhU2NCWWxkOUVJSEN3L0FWUTdEaFJJMFVPMHFlNk1l?=
 =?utf-8?B?Q3lMZFB0M3BiV0ZjSlI3bGkvY0x6cFNwRUpLSkRmVzJVQUxPdFVPQkhiU210?=
 =?utf-8?B?WWtsbWlob2pWQ2tyTnhsdDlXb3M4MlpZeVdENUF3OStURVNOUkpjRlZpMG1X?=
 =?utf-8?B?M3ZReGJTdmRVY0ErZXJjdzJEVmRVc1VIcGdoU1ZPR3NMVDVaUk1YSjZTZWN6?=
 =?utf-8?B?TzJ2TlJDYis2TVplNldQYlU0OWVPZ1V1QmtpZTU3bGxqQ0k0NjVGMmg5MXBC?=
 =?utf-8?B?TlgvRDdJcEZpbkVFVDdLL1o3cVRQWllTT0h0MnlXM1dvSXFyM0JvZS9LZUNh?=
 =?utf-8?B?bUV5RUxoR0ROT3hrSUZOZXp0aU5UQWpYTTZPVEZsWFQrSWVXYmttQUdNb0Jt?=
 =?utf-8?B?L1JmSWcvd09sS2diQU85b251UjNCQTJucXRpeCtkRmdodE54RGoyZTFNMzk1?=
 =?utf-8?B?T2ZFNlE5VHpZT0dwUmxOblRoOFMvVnpZemN5NkJYbHJGSGNWQTFDelF1aENh?=
 =?utf-8?B?c0x1WVFyWlJjZWNTRUc1WE9RUmR2RkpVZTBxK2gwRmt6SEUvV3E5YmVTRm5l?=
 =?utf-8?B?TUx5clFhU0t4azB4aGJYTUd4QllRRXZJamtiUnVDQjFlcjZKOTl3ZzVPUzZO?=
 =?utf-8?B?QXJZbHZxMjNZd3R2ZzJSUkI0OTNtMzM1dDYyY0pKb2lJMlNLbkthT3VpSlRi?=
 =?utf-8?B?dE1ESjV2WlZjdjVYcGVwSFFpeFFDeHQ2YWlzUGxidmlQWTh4Zk5QUkkyanFZ?=
 =?utf-8?B?VWZlaVhyQlM1R0FmR3ZsTlR5OUNYcnlCdWErcm8rTGZtSEppMVFnMVZ6RWpJ?=
 =?utf-8?Q?EcIscuzRSTEktDYyUD4JYcNVT23VlzDgViPQqklwDvAe0?=
X-MS-Exchange-AntiSpam-MessageData-1: yWHq/7utMcbOZA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67c1301-a6ca-494d-7a7e-08da1a35e60b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2022 14:33:22.3478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSVQxaoI4ePO+AvOQhSMBHSV9GPsvmTdukNCEFjYSnx1iKLTfmHOXfSXIwZzUA05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4893
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 23:12 schrieb Chia-I Wu:
> In practice, trace_dma_fence_init is good enough and almost no driver
> calls trace_dma_fence_emit.  But this is still more correct in theory.

Well, the reason why basically no driver is calling this is because it 
is pretty much deprecated.

We do have a case in the GPU scheduler where it makes sense to distinct 
between init and emit, but it doesn't really matter for drivers.

So I'm not sure if it's a good idea to add that here.

Regards,
Christian.

>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index faf0c242874e..a82193f41ea2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -15,6 +15,7 @@
>   #include <linux/string_helpers.h>
>   #include <linux/devcoredump.h>
>   #include <linux/sched/task.h>
> +#include <trace/events/dma_fence.h>
>   
>   /*
>    * Power Management:
> @@ -769,6 +770,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	gpu->active_submits++;
>   	mutex_unlock(&gpu->active_lock);
>   
> +	trace_dma_fence_emit(submit->hw_fence);
>   	gpu->funcs->submit(gpu, submit);
>   	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
>   

