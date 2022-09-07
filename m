Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74505AFC95
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587C910E35A;
	Wed,  7 Sep 2022 06:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302510E35A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRml5kptsSdfspDvgjHvqQttbeOBewQM3IaYrAgtYgwiqOkzJHPbpfjzQ8aJkrCAZl69IGdLAFxIldI7sPUBI1BbZbgXqUyYrGj8vwU1Moz2WdaLKAsG3eTnD6LmsUZRqnTXDWfV/uVI0x9IOXZpU98m+yyh4ulbrd+9RYqxJjss8vXlIeHU3EPwLWnbNUlleJug5deZUSWxwXypp0ziCxREsvLAMWpzQ86Yee56vIpO1Uw7wEHUJ1Y7poYdIdqo2TA1FPBmInTSHL6FT989DZ2n+YK4mqONb6Hp2Be62/S+hmBpK9EB4uDceDIDLh7kEHn7MDy9V+ec82m7mETH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Do9sQBtPj0vzAqccJAjkUSR799gq4PfpGgx8uRRxKc=;
 b=nemImdd+IZRIKwK3TqPBSboOejfQ/Uyw9yQFAikHUkq0oaKmpCrY7QqP+gaF/u0HVnBQL0bJCOPejUiAuh4oSfFkoabj3VGIOUX8+ljYtacB7HJgthJZGwCsaZSX7nWpNHMFFfZTA1e+byBP6OcHRVd7nboVjiSkL8oGahMnu5OVTKCuoW7icDUsA8DtyIxJMnpkuC+7Bm8SD/7J2FNhZ6a84ZopJWW2rV0EyjKTl4IsrMkiS1C/jdFtKJHGe9kvtHZiuUt2B5gxwNLvt3ovnLGLOWxGZpQicxGe7Vab+koiXxMLnPmeoJigGX3HxImq8nHBwzgaQK2UQzgaNqV53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Do9sQBtPj0vzAqccJAjkUSR799gq4PfpGgx8uRRxKc=;
 b=SZKE4PN5rmXKzXXjPC7BvV78WEouzHoD5vXJOObz8QNR4mFZ4AD1SYOhZWxjxw14Mnqnwi1sd260BZWTb7HcWa/bzhxs8D26KdWPvQhBpD8abTbFoHjMpuLA9Z8yiP20CFAey/tD6fjEfwEnp4Le74wlmVGMByfC7BGP7LZiO3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 06:37:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 06:37:53 +0000
Message-ID: <9b57b254-8d67-9937-5cec-783e7a4d8f56@amd.com>
Date: Wed, 7 Sep 2022 08:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] drm/sched: Enable signaling for finished fence
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220905163502.4032-1-Arvind.Yadav@amd.com>
 <20220905163502.4032-2-Arvind.Yadav@amd.com>
 <5568fad0-1503-a0f3-222e-c238fd4eefdd@amd.com>
 <ffb5acca-7c20-4497-d7d0-25508a6566d2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ffb5acca-7c20-4497-d7d0-25508a6566d2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0750.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: bae217ee-bd27-4c0f-5997-08da909b7d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXaakCuK4dfOJfXQZzbdiYy0CMD9idCTBvPOUCclfoOE0q/ScApJpGSKf6Ytyoi9yXHSkCmXQx4E1tkYlvz16QG+bPFldrhglsDt6IMG0ADdqRZtDHEgAWrRM8K/nL44eI1rzXT5OSi3sBzy9xl7/4lOoaU32mVYImXvLw/1jg+tM3jQ/Su4M+sbTZTFhYyWJyE1Kxp0nct2kDk9oJ7rBPhre8WkFWhWCA4LHWtkDZy02MugxZomvq4OCtJ6a4jRWDOvJkpztABR+GWRXNVhr0mB7ekKX5ejk9QN+e4r5dr9xcW/VhPf/XpJIBki0hRfKt5BE3xaBfeimO4cYo0etAMnjbYpqr3diUXMo28B8jSi2GXz27EI1GcNmfNI60YJAal2bm6Pjju80uUW0Z7SJFpl+/JPBfOZWwtEMGq+E49TvEb6E39tO1YdgSjXHACeWaWfjEPsCoee0ExKG3I2M92Dtwl6dq6g4KMLmDLwmH2jXqZ0Db5uPOGWjzYBPooEQev1rGU6DO+iHQdtS+7n/G5b1NPK0jhMXgBbHp+vyQSyDlBAhz8+KdrClbGq2Dy7YXSFKr4NeJKX/QLxIbOZMCCmRq5VN2Ov391yYr6afnt7uf1lc0TYJEXI3Ew5zZVC/U0fBWZeil8Im29+XgIC3n43LpbPHARS1wjCrphbjeK/jwfe3rfeNSgV4cIt+UNf6JIlwd6W3TrW5RJmRi8qi6feUP77oXaqsMlSVC2IeuBUwZ/uCivODJBedGHjRMw365OKCpP3DZMwyAgkSTJ+tXpgX3QlyGtzYLSijNA0IDyz3xKUAt3+VpNaWYEN/nuw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(6666004)(36756003)(26005)(2616005)(6506007)(53546011)(86362001)(41300700001)(6512007)(921005)(66574015)(38100700002)(31696002)(186003)(5660300002)(8936002)(66556008)(66946007)(478600001)(66476007)(6486002)(2906002)(110136005)(8676002)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE5XYTFJY3hMM1RFUG9oSUJ3VVZOWHl2MlRtOFhaR3NwU0xqMFlQVG1PU04r?=
 =?utf-8?B?YlhRUlQzYUhOZGJNUWV0VUpCdzB2Z083RWpIV1oxT09ldFB2VzBxaXdtTlFF?=
 =?utf-8?B?Mm8zTnJiaUhFcGd2SStERTJrSlhrcEJnakJtQ2gvRU5ERkhWNWdLZURkSE1x?=
 =?utf-8?B?VEh2M0VIbUJZMmsvVzNjcXJURnFXMTVMdkxrWTRVc29PMGhzdUF1VlFoWEo2?=
 =?utf-8?B?dUIyL2VuTm9ENXdHUVd0MHVLNnRwN1Y3Nitaa08xOWVKaTFTTGJ6QzI5RUht?=
 =?utf-8?B?RnAzRnl1TFRBUjBuaVJFcy9zbVVpd1Z6b2hvekNReFFLSUJXSGJZaXZoeXYy?=
 =?utf-8?B?QWZwTkNJQVVYbHQ4eTcvM3RpOXFPMWZTek5EYXk3dXd6RUJKQUlrWE82bS8x?=
 =?utf-8?B?ZG9lczFBdEVCWTIzeU9POERHdCtPNG4rWFYvclJlY01qQXg0N21VUmFJd2Fa?=
 =?utf-8?B?S1hpa1puLy9RdTFOQlgvYWVKNEg5R0wvaGZFUTJSYXpUcHZqcHA4eDExdlc3?=
 =?utf-8?B?NzBmU0lUcDgvcER3YnJhVWQrY0FXU1hxOFlua2EvcENzMHV2M2ZoL0tBRlJp?=
 =?utf-8?B?cEZhS1FDZjlrWUhZU3NXbTc3NE0zQkNXVHp2OEtUK1FhQjc5ekloNE80ZlFY?=
 =?utf-8?B?Qnozc0V2Znd3citDQko0dEpBNWdXMjJWU3phVHlCbExPTHlPUzlPeklUekNi?=
 =?utf-8?B?U3hxWW9KMjVRZWZOYkg4amMveTZTdjRNK1hPSm04UVg5MVdyalR0czNHYzZX?=
 =?utf-8?B?YldIL3JUcllzaWIrWjNSSCtSM0RDdzZkK0ZXdE1jU2dmVlJnSktCNzdUcVZR?=
 =?utf-8?B?RXZscFV6UEk2WXRmNUlqNHNQandqdnEwVVJEb3RDd3JydWt1WkNIck9QUm95?=
 =?utf-8?B?bTg3WHZ4b2JuNDZZU1c4K0U4ZTVEMVZuTFFKUkJQRlNOUDlaTTN2dFI4UElB?=
 =?utf-8?B?clYxenM5OXJtUzRLRVJncmd0ajNEZGo1MlFwemQxQnMxTCtxZ0ZtaXErcHFK?=
 =?utf-8?B?bDFPdGlwZzJWNWJqYWN5VjVJVUpLMkltZnJoMW1wem4zcTVkMmsyT2pFaWtu?=
 =?utf-8?B?MHhOUVoyZ1UxWXkwQkNZbDJnTU5FT2crOFo1UVNjQ002QnROYVFVZTU0U1RK?=
 =?utf-8?B?WkUxZCtubGZ1TWZFZmpZaDFnREJxaDJHT0o0bFNWMjV4NmRDVkNRYWt6OUNQ?=
 =?utf-8?B?NTd3NlgyU2l5QjIrVFpwT29GQWM1d1J6bHNzOE5xSHptL2RnVitlK2tvTVlS?=
 =?utf-8?B?ZGRtUWkwci8xUUcwN3NEOG9BcnJJMERNOTNuVDRTdUNzS05WM2FaQUZIbThx?=
 =?utf-8?B?dG0waFdxcHU2YWR3NVlmb0RwYkg5TkZpQ0JUdlpyS3MxamdIb1NVTFVGNEhM?=
 =?utf-8?B?c09QRlgrdldIMmlPaEY5SkUwL0x2bVlGTFpyOGsyb0JoZmFQR082Z3oxSEpC?=
 =?utf-8?B?NTlpQnZMbG9EVTl3djlIQWtlRm90RjlDUmNzSnBEYzltL1drd0hSdDZ5SjVD?=
 =?utf-8?B?bS9oeThNSUI2OGFiTlFQaTFnYldHNVFUeHd2MElBLzFNZXpYTjluam5nZXRo?=
 =?utf-8?B?eHRrOHM4ZDA3dWZhZER0aGRLS3Mzb2Zjenhqd2pXRm9SVVFsUnA3a3FvQU1D?=
 =?utf-8?B?dkJPMmM1empubGhoS0lFUE5lMWtnWVc0ZE8zTVJCM1k1WnVoUlRFYWo5N3hW?=
 =?utf-8?B?TWltWmNzUGh6L0YvcmhRL3RKeDl3ZXRtbkYwVHRtVnc1U0Q4Y0U5dXlCSUdT?=
 =?utf-8?B?TENSWTNRU3hGMlc4cU00MGc1NTdUYVg4cGRkQjdtVXg4eE1RNUtCQm1TcTZJ?=
 =?utf-8?B?QVpJNjhRZzNBaXh4ZDdFWlIvRVZBVit2d3N4WVFzZ1ZVajN6K2JpaXdUUTFM?=
 =?utf-8?B?ak1BTUxlZU82N2RtelJkbHZtT0dWU2I0SmkrZTlIYWNLRVZMSkh0N3RLUzNa?=
 =?utf-8?B?NTgzb2lTc09LakpybGFsK1ZyQ0NRYWFCSDFZNW1CZE0zNkpnTWlLQmMwSVlw?=
 =?utf-8?B?YkZkdVpYdldJQmpUem5FRHRsOVZOY2VlOVM4R254R0ZxUlJYWEZWOWNNTWw2?=
 =?utf-8?B?em5rbHhFS0FhaGhVTzQvOHBOOWhIclkrYTMzRUJ5YVpuQjA0MC96YmhJVlBx?=
 =?utf-8?Q?A4Of4lqrVzZdLgn6t39Wl+MFm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae217ee-bd27-4c0f-5997-08da909b7d85
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 06:37:52.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5F5Ib0uJS7ftRxbVPEK2m99Pwq4UsrJPs/9+0pEhtWIYZqC/jlOYuuiFUz4n6O7e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Am 06.09.22 um 21:55 schrieb Andrey Grodzovsky:
>
> On 2022-09-06 02:34, Christian König wrote:
>> Am 05.09.22 um 18:34 schrieb Arvind Yadav:
>>> Here's enabling software signaling for finished fence.
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>
>>> Changes in v1 :
>>> 1- Addressing Christian's comment to remove CONFIG_DEBUG_FS check from
>>> this patch.
>>> 2- The version of this patch is also changed and previously
>>> it was [PATCH 2/4]
>>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e0ab14e0fb6b..fe72de0e2911 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -962,6 +962,8 @@ static int drm_sched_main(void *param)
>>>               /* Drop for original kref_init of the fence */
>>>               dma_fence_put(fence);
>>>   + dma_fence_enable_sw_signaling(&s_fence->finished);
>>
>> Ok, this makes it a lot clearer. Previously I though that we have 
>> some bug in dma_fence_add_callback().
>>
>> This is essentially the wrong place to call this, the finished fence 
>> should be enabled by the caller and not here.
>>
>> There is also another problem in dma_fence_enable_sw_signaling(), it 
>> returns early when the fence is already signaled:
>>
>>         if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>                 return;
>>
>> Please remove that one first.
>
>
> Why we even need this explicit call if dma_fence_add_callback calls 
> __dma_fence_enable_signaling anyway ?

Two different fence objects.

The dma_fence_add_callback() is done on the hw fence we get in return of 
submitting the job.

The dma_fence_enable_sw_signaling() here is done on the finished fence 
we use to signal the completion externally.

Key point is the finished fence should be used by the frontend drivers 
which uses the scheduler and not by the scheduler itself.

Christian.

>
> Andrey
>
>
>>
>> Thanks,
>> Christian.
>>
>>
>>> +
>>>               r = dma_fence_add_callback(fence, &sched_job->cb,
>>>                              drm_sched_job_done_cb);
>>>               if (r == -ENOENT)
>>

