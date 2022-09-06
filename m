Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A095AE384
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8FE10E5F7;
	Tue,  6 Sep 2022 08:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE9F10E5F5;
 Tue,  6 Sep 2022 08:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzwO1fpNkDokUR8kHg5k+FNUVBI/db9XKLiiXWjK64Io2JUqp0ilYKxtImUL4DSPwdz2Csd24cuzQVIZgjhJAKs0+MGsXivlmY1knj8lq+xgskl3TuHBoqCLt2kkevVL0dH4TglhgY+pxSwXUi7hyw1sT6QjUCYNwuhMDrKa+MZn6gC+IKSDI92sdMZXen+FfSxaLoXdfYNo1WTiCdaTqWES4zwhi4hbMrIfvINlb2Ar2OtRn1qUhhduT5fYoWjm8I9eYTjaDzdpGOAqAPTWiwSXiWDwQoj+uDckPYkqsA/wd2bTpS37DZOZuomK4BzaNfNYcWst7J05TRIXcaAvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxpOzOgxsQzCgda950P3nDxXhr/pxIJP7uTfnDeRpMg=;
 b=XT3FEHzUnojahEvqO2tly6pfhhuwMd1Anz3SiClGhDY0WcTeEzEb9yV8aMQ0ntkDb6x3o6oDXN3vKI0zQd9Y6BhYYjkRnYF6QOltFXIVCOXb5UTHPXZykTZi1uQdCdyMTo5XIlB63/jltnxQsoiJ8UsMI401dvEB7Kz1b8WgHkwUrZ5fs5vRdCR3a6Zym153lHQPHOB4+ND6noHUgVBbXifJsCRoOoAMAbnPOZRE9Qku90jPTof38WUb6qwNKsCeP6oSlAZbmey3M5mEKU6VyLctUtmEn4eYq3DxR3ZUv/GP2jqzW0eAaJyxNx/BHe24nDAIy54M669m3vT7qvkFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxpOzOgxsQzCgda950P3nDxXhr/pxIJP7uTfnDeRpMg=;
 b=W8xORtDZsfc1J/1cknzUgDcgFPfSeRY01r1Rj+pN49z4QOBpuY5zln9jlLWfY8ZLHv5O1Z0AgbydljfBtwcHR4LPDVv9ymn6XA0qgdjFFfy0f3qa/fQMY/xcMu3e3PKRFEkBKgN8PSBTRp5ObStdks+vqIWREFyYOvayJXdVFx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 08:53:45 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::a997:c7f:aea0:764a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 08:53:45 +0000
Message-ID: <47d80b9c-8ef2-80da-2df8-4c7083907f66@amd.com>
Date: Tue, 6 Sep 2022 10:53:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/ttm: update bulk move object of ghost BO
Content-Language: en-US
To: ZhenGuo Yin <zhenguo.yin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220906084619.2545456-1-zhenguo.yin@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220906084619.2545456-1-zhenguo.yin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::18) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 434cca26-d8e1-4366-212a-08da8fe54e27
X-MS-TrafficTypeDiagnostic: CO6PR12MB5395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGicZlN6PZL7cPELlWofFVioU2enKlmw5+vNcmr88T7bqvTLSm//u0/pxnSNLPE2CYRBIh/dfqtoEX+xBmjrY1k1kT+yHOi91mEnvzGPkrj/pN2krCtz+efVegPhdjXaLqgVZBtl75jkpUVVcFI4h+O6HvVBn5ZT4otU3VxagTpbkR29yWqSvW1fcOD7wL9eTwE2j39z9W9h6IS78B3GlE+ZUeML478qTSjBtBSN6lM/oY9awfY9/yp+utuUV4m1tLVKYh40YzjdMpY3tr+w/TiPLnyRWKlgifClIS2bJXSJBGk5RQTjQnHXOzMFOfY/VnhJ2Pgq7uiMISnu+Bhm/diCxMdtrLolN5YxhxmwUCTFoLVMxscINLtl1oTh9sE6V6TDEfioKDYk42a0BG9uC8i70Wi9FO8hJo9TIq9xY1Rrb1B2IRcsZljDFCU/IWvoatKT/CSjMr+w8O45Cly72n295NRRnujMFOD9CPTMM7jlrWxWBAzj+HowFH1gzd8dJUVIwJPywRQYLqbf77XgbdVe5OMJuuefHrrySiH+XEzkifXYpI9gTVwG/zK0FyuTFPVQ/jfbNcvTL5SANn38gCkFIJMjzsstjWhPN9Y5lrBxhJfwiNvlB8b8NGYhmJPjXAIiWXk4rU6ypxCMvdVp7aJHhzJTl6Bvndmsb3llpK3c1JB4+WqW/sHQ/vFTA2x+/efzLb1/+mDM9je/KurTrQAaB76Og8qt2s3VXfvkMQ1NUhWSDh1PZHQbllRG2zR/b7UQuxOdZdlIeCBgs00s12xUaUx1upXkduYhRuuUih0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(31686004)(316002)(86362001)(31696002)(36756003)(38100700002)(2906002)(5660300002)(8676002)(4326008)(66556008)(66476007)(66946007)(450100002)(83380400001)(6512007)(41300700001)(2616005)(66574015)(186003)(6506007)(8936002)(6486002)(6666004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1YU3Z6QzFBa0xRN2doc0cvQUFKM3RCQlVmVHdweFVlV1VoWkdEUS81Zko1?=
 =?utf-8?B?YW5sdzFKT1lXN0pxL2F5MUNOMUZ4OGM3R1FwVmY1YVpLUWM4RjhlaTlhUnov?=
 =?utf-8?B?ZmZoOUJLZjlpYWlUZk9GalFBZk4zNzhiOUcyOWdUUVFNMzNlTTB0SUVrYjhq?=
 =?utf-8?B?Y2JNSTA1R1pVKzZiT2xWTDl2eG4rTUdyWFY3SEowZVpWcVEyeWc0N01jVHZU?=
 =?utf-8?B?cnlrdk00RFp3ZWxwNDNLblZ4RGlHMnN2MGROWHRhZDlLMStVcWIzRTl5bVFz?=
 =?utf-8?B?NzE2Q1F4OFBlK0EzRUlsdFhjSnREOHUrbGd2cm4waGdPdGRxWTBsSVl6UzhR?=
 =?utf-8?B?NnU5a0NvcnRDZ2EyTktkZ3hpVkdiNFlEM0ZpYU9zZWlndnltVG0zUTMzR2g1?=
 =?utf-8?B?dUw3L0crcjBaRmhKTlJ0cG1vNkdCSk9qaFRFOW82Vnp5QXczWitKMVhFR2xJ?=
 =?utf-8?B?QVVPZDRjQ3dESVJTRG0yNm1BdXBCTGU3NWdrTkhUSFlGTXdLdVl1cjQ4S3ZG?=
 =?utf-8?B?TUIxVmp0NWh2NG9XWmVRSHUvYTZPMmpHdGQ0Vzc3OGc2MmIvdHUwT3NyVTc3?=
 =?utf-8?B?bTJaQVlLUjM0QzZPckdhVnFOUHpMQy9wRGI5eUMyMmphMWFJb1EvZHp6SFZE?=
 =?utf-8?B?ZXRiREF6M0sxR1NPdkRvMmZRUDA2NHg5QXFIRmpaVkgvSjlLWEszbmpnL01G?=
 =?utf-8?B?dHZ5ZEJBU05BbTZvRk1LRDFxQWhtdE1UQVZYSHd4akRMUWcwVldPRzl2Qkty?=
 =?utf-8?B?UEdJNEdieU9sMHFrQmRBYkRuWlVHNldGMUZleW5ETHhTaExvV2FtSU9OcVJB?=
 =?utf-8?B?WTFYZE95QlEzSmZqck5LOEhqaHRFYUhyakk4emU0Ylp6SytOT01OR2dtNVBU?=
 =?utf-8?B?OXovQ1BzdjhNYzRTZWFYRVFaelZCcTFwQk1GTGNPTzkvdTVrNkE5dEo2RHBn?=
 =?utf-8?B?TmRaZ29wR00wMk9NMU1zb1cvVVRURFdicXgyL0MreFN1c2YxV0pTeTAzYU4z?=
 =?utf-8?B?N2dFNEhmOFJMeXErSGtEWGR4NFNnTTBvcE1Ja3pWdXRzWHRaOW1BUjg1bnVy?=
 =?utf-8?B?UWZIbUZmTVgza3VPNERDNTNaQlZxWmx0YzJaby9xM0paU3JNb0dJWU5sbGNl?=
 =?utf-8?B?eVowTGlNSzhxUGJ4V3E3VkQ1MlFQbERZelAwS1FSUTR5OGVFSjdub0pZcnIr?=
 =?utf-8?B?UHpKU2FON0F6S2drY1pPcTFiTzBXbEZPK2VJVUttV3lXcE9sT0syTnBvUml0?=
 =?utf-8?B?MEY1dWc2SThJOEZsTEw2L0g4UmFDTGFhd1pvSW5ZZlBqc09HK0d2bGcwQURR?=
 =?utf-8?B?L0F2TnFjalNERVI4eWlMQUZSalIvblRZU2dOaVcxWGFEVXJIVjNvQmFlRXlk?=
 =?utf-8?B?VVA5TlBlK0ZtMTcrZmp6NWV4aHJMelk2cFhPcHV0ME9sdFBGc3BWLzE1NlJT?=
 =?utf-8?B?elZoRVZvZ0pzWm9pQ0lGRkVzb29nU1BzaWxZbkFVVkttbkttTkFvcFArRjNn?=
 =?utf-8?B?Vnh0eVZTMmZsNlExZENVTFBJRUZZQ2xnUC9YeHpIMmp4WS9SL2xpK0hpcmIz?=
 =?utf-8?B?ZjBUV3dJR0h4V0JFUTlpVmFrOFJlcHo4VkxTVGErSEx4ZjdNamdhOUpNV3lO?=
 =?utf-8?B?VGFrQzJka2NYUlFtL1ZnTVg5YzY2YkJLckdTWDFEdytCVytNNC9NcmhWSDlL?=
 =?utf-8?B?Mkhhclk4bnBkazcyZ1dPSEI4RFg2NFg1MDNXa3pQaW8yVVhRa2lUZXN6bGdH?=
 =?utf-8?B?cStrdG1FdDhqNzJPUWdXSEhHOTBMaGRQQmlabVFBZXNBQjVSelNlZ1VBTzlx?=
 =?utf-8?B?MVYvZEhpcjlIZ0lkYmpxM0NxT0t2L0xjUWhhSFlONWhDT25uckRrdk02VXJG?=
 =?utf-8?B?MnNlaFNIdmhGRnJXSWQrcnBZQll4bnBIZTZmeHJuVjRMWEp2MkRDVnZDYVd2?=
 =?utf-8?B?K0xLNkRhZzVNYWJnSXhxK3M4RmJNQ3pZUEJOeDkrblE0b0FaSE00VUU1bDVj?=
 =?utf-8?B?dG9WeEtZdk9tVHpsY0lyWXBGQzNIYXBlTnlEQ0YwdTllTDQ2Y2JyOThCSExa?=
 =?utf-8?B?UXlSenEzSkdiTG5Kazc3T2Z2N2tFM0cxcDJnTENJOXBEQ0toMFVxV3lpZjZF?=
 =?utf-8?B?STNwTDZYWXpTZTFOWXo1am4wM3dQZWdlemtDeFQvU3NFV0x0SmVKdlpmMFY2?=
 =?utf-8?Q?lzFC/4uUj/+DHT5UPpFDOs0u2z9qOKgACk0RYG0Eoekc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434cca26-d8e1-4366-212a-08da8fe54e27
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:53:45.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTaVXH0hH8jcDiXmoTMKt2i9jWs9wSZqlbk2+bDYV4uKJCVRRuwLGa7pLW0QbjJk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
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
Cc: jingwen.chen2@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.09.22 um 10:46 schrieb ZhenGuo Yin:
> [Why]
> Ghost BO is released with non-empty bulk move object. There is a
> warning trace:
> WARNING: CPU: 19 PID: 1582 at ttm/ttm_bo.c:366 ttm_bo_release+0x2e1/0x2f0 [amdttm]
> Call Trace:
>    amddma_resv_reserve_fences+0x10d/0x1f0 [amdkcl]
>    amdttm_bo_put+0x28/0x30 [amdttm]
>    amdttm_bo_move_accel_cleanup+0x126/0x200 [amdttm]
>    amdgpu_bo_move+0x1a8/0x770 [amdgpu]
>    ttm_bo_handle_move_mem+0xb0/0x140 [amdttm]
>    amdttm_bo_validate+0xbf/0x100 [amdttm]
>
> [How]
> The resource of ghost BO should be moved to LRU directly, instead of
> using bulk move. The bulk move object of ghost BO should set to NULL
> before function ttm_bo_move_to_lru_tail_unlocked.
>
> v2: set bulk move to NULL manually if no resource associated with ghost BO
>
> Fixed: 5b951e487fd6bf5f ("drm/ttm: fix bulk move handling v2")
> Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push that to drm-misc-fixes in a minute.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 1cbfb00c1d65..57a27847206f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -239,6 +239,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   	if (fbo->base.resource) {
>   		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>   		bo->resource = NULL;
> +		ttm_bo_set_bulk_move(&fbo->base, NULL);
> +	} else {
> +		fbo->base.bulk_move = NULL;
>   	}
>   
>   	dma_resv_init(&fbo->base.base._resv);

