Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261ED5ACA4C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4E10E150;
	Mon,  5 Sep 2022 06:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127710E151;
 Mon,  5 Sep 2022 06:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpVcT5pvX/qYM3mXpi+GWsuT8dgyybrc3t2+HTFhetZP4EmqoFMtvG4Ijdj8L9fWZS4K70JIYt9jjXUbWo8zMGJZK9IxBx1fhMf285L8K1M/F01gqNa3bWMwkT5ZVZyHceIUp7KVo8Z+M1ZkyY85LE9Fv/pLQNcflGDFd32rDH0MvbtM9mVSqm9cGbThhOWlI2H5pfF+CyqkwblC+df//ZaZOnQ+OmRt+Toumq3DQoNnHrQMwjPOyzD3eGhGy94ZQsP43hgNSdZziexoYwmk0KpwFCgJWBm8ArfpBzdU0EBJbBJ/MlCG+CEqNvdtisdjssC7YrVETVS8Xa5cPpgLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNnAT+WVhYNuGkD+rHXv/qu6ylNi+Jzed4P0KiGlGhc=;
 b=HVXn+h27gquYNZTbIv/ncmbyXmbQPdAB1Rr9+/phYpElUP0J7JMmenp2DqOf/eiJB5ECdqvCdHtSOp3GPEYy/IrBBeUeqoGb/5PNoXxtPFvA8sBDc04HdkZHItuH/JMXLLt4lmjxJ+LBYYNVdR7pNBdyU/YZKRDDCwDeDrWuIcDDieIJH6PERcvjQmSSM6OZ42Q1wM+UVUsFKprsiC7bRukuOtjWiBvZiVdjgaGjdW9Luk+j8thvPOQt9zNWtH4XQQ1SxBkGd0UCf6qy73nX3N2tH46A/hvrVeUvVw6/JeVS87KXRYfHma8E0nRa7RS3FbtR7jPi4Vw3b5SZHGoOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNnAT+WVhYNuGkD+rHXv/qu6ylNi+Jzed4P0KiGlGhc=;
 b=dZgpRDapoPjmNIliKkrxZj03fwFT80GzAsOdeezobH7VYtRaYoEEVXC9XmiRspYu1Phd3Z6EhjEiD+oYMq5Jb6O98xVTk7Y1IIMfpLz4vqpvtMuVx7rqhw0hjVYsU2U7f43O4srOhycJnrv86kllW8DYi4tTb/ZljpskbKBg3OE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4515.namprd12.prod.outlook.com (2603:10b6:5:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 06:06:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 06:06:02 +0000
Message-ID: <2f793737-17a1-7497-27c1-3feec713114b@amd.com>
Date: Mon, 5 Sep 2022 08:05:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm:Fix the blank screen problem of some 1920x1080 75Hz
 monitors using R520 graphics card
Content-Language: en-US
To: zhongpei <zhongpei@kylinos.cn>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, isabbasso@riseup.net
References: <20220905032307.1519169-1-zhongpei@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220905032307.1519169-1-zhongpei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0225.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d535175f-aa0a-4690-c70e-08da8f04b5e6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4AhlogUsfyJDMmfNpoWSyTt6u09CiTwGcfBCopJwtiEbRnKQtfBbeTJp493k50JsA60v+1nSlh07l8AoVTP5knoezwAqB5UcepDdHWXtZ20nM3B+/uFI3D5bJzDOwROKWjUyW0uQxKrnLZAqKTfJdeHYKD1E5eQrXUGwikOSlWA72w03qHQLhzliunGzSpdvZVJpoIAnacSGQ7w8TEeBxg2Z4AvpPXhnzjNSyKjj5QJFSWX9Q0t531sZuUaGHsJ/HJBmJg8CLZs6FfYbhvACrxQe9hVsFqTG/cPBjdHixjmFXv/uC9PWPkYf3Rtz0FmJo88hUVRMB2req6HmCvoer7LJisS5C0694oAFBFJfn9GQI39iWYfMPvSIdN1M5n/eOn+/fyacWKvySoNYj8tCumf+Nl5l1nO6gr7oPMSG5DZKDbjbnADHLoGneRhq549VNQvLEFI8YrISXoQg2VfUY5geMKt4wATEHpeaulqJ8bgLPwD2z9+ojGBsCadUIAG75sNf+4X6E2sAhzL1AOE0GDiVZRQGuRtNi0ho2RY5miWPk5e6ejqR13BISMqtw4ox8zZgpGFF2NS9C37w+gF80kQ3y+6X8Oq+yQNSSvQu8HqC03Y1noaSvyXVqK3Je2hSZb6DQ7B9SJq0nDnt6oVAr26K6jYk3HCMDUbTOaMRqpsvJkCDAp8DVN7LvV1ynuXh38SZK05r60qcJQbaZPfUA+2cpCOLBXKqr7ByBS0hAqE7X+MbvovzjIcD/SPl7pe5dyyqMZH9/xoVwtTJSO/1rdA4vpq9AJHa7qIWW2nCNKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(31686004)(186003)(83380400001)(316002)(2616005)(6486002)(26005)(2906002)(5660300002)(8936002)(36756003)(6512007)(41300700001)(4326008)(8676002)(31696002)(6506007)(38100700002)(478600001)(66946007)(66556008)(86362001)(66476007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVOeHZIUUV3KzFndzZlbHJHbCs1MVh4N0ZiVStISkMyT3o2SlRXM1dyekIv?=
 =?utf-8?B?dXJMWDA5WG5OdU5VZGhudmUxTGlSdHNPd0hpb2VqdjcyM1owVDRiUzdOZTVo?=
 =?utf-8?B?dXNHZnc2anRyaFkxbXZodTdkZTRHZ3pDOXlJUG8rMU15d3VoOGhDcTRBT2V0?=
 =?utf-8?B?T0hHMEVuSE9HWnlySWs3L01XZ1N5NXExRkxZclVOMW9WV1dNYUg2azhhK0Rq?=
 =?utf-8?B?NVB4U0RNOWc4SWlOVFZYSzUvcTU3RGFLc1IybE9MK0x6eHhzRGw4eGtVOUJR?=
 =?utf-8?B?dkFZOGM3S0tTcG9HV250azg2YXhENzlENHdjNEQvRmQ5YjRzTnY3djJxWXkv?=
 =?utf-8?B?VSs0N05VTU1oRFFzM2NFOFZwUHNaV25BcWpxRzRZcWlEeVlPOUR1Si9xNTZW?=
 =?utf-8?B?bzJTdThwWTFPeGNJVGlaWldvL3V1NVBoR3dGSzNvMWZCTEZ4QWlhemxwaGcr?=
 =?utf-8?B?YzVwU0xqaUVCMm9uQVNzRW9aVFFhTXlTMmpJYkNSQzA3Z2NvWEVjUEVYOHNl?=
 =?utf-8?B?NVIvc2lYQ3RFYmNpaWdHV0NKUzlzNWRGMXM4QmtMQVFJMFIva29KTzFabW1o?=
 =?utf-8?B?NFV4MG1LZHF4OEw0anJnTjRLRmY1MWlKVW5RY0dxVTcrRkV5d05mYW9zQzJT?=
 =?utf-8?B?eUZ2eGkvSjhZSXk4L2x4Y2JReWZoaVlWaHZPQXRYTWtqMjBKb2hUMGxZUHVs?=
 =?utf-8?B?OUtySFVCODlna1NBMEQrY3FJOGdMTEZOTkkzZFRaN1k5V0J2WGR4L3Q3eS9E?=
 =?utf-8?B?Q3ZVM2NHV2FHeXlHNzRDVFhSTHpPaE5iWlZ6em0wRDhISldTY1ZTS3BIYnFD?=
 =?utf-8?B?S1IrN0Q5aXNiOGU2bHJNZ1lyMVpNZG9LREdCa1Q0WE0wU2RwSkRqRXJ0elBm?=
 =?utf-8?B?b2I5SFlsaWpVV3NiTG5EMXJrZUlIWHJ4ZDBERXFvbDU3NjlrS0RFYUxuSWpk?=
 =?utf-8?B?ZnNyalNVS0kyWmFJekJVVzVjK09oOWxuajM5dndWOUY1Q2E4Q21JLzZZNWdO?=
 =?utf-8?B?RDVzcDI3UTdrS092YUVta2cybFF3Z1FzWUY1MFJySHpidHB3bmdHaVh3cGhv?=
 =?utf-8?B?em8zd1FuUWVQanIzNmRBejZNeEdiYTVjcWlvRTRoajFOdWlzM0xLVkRzWEZy?=
 =?utf-8?B?TVFVT0pYbTQ5ZWNLNWJrL0Q5TlNib2xwV0h1bDlmdFFtY2lMYUFmMldyNkZx?=
 =?utf-8?B?SkdobW9neXQrUW50LzFFUkZyeXduYVRwMmJkRGt2cUg5bGhUNFJQZlQ2U1hN?=
 =?utf-8?B?RjFXcjFybFdpN2g0eWVMOHo0Y1o3TEhRNGRBNmN4RmhKcG4rVDJoR0VITGpy?=
 =?utf-8?B?bjdhVjk3aStMTUtZak1uemRmV1R2NnpIQ21ncmFYay9nQWNLTVRoTy9DK0k3?=
 =?utf-8?B?enlJNGJCcm9Hdm5iZmU3UlpVZ1JLTWJ5enFjN0lyQVFYUTUyT0FQckdkeDFu?=
 =?utf-8?B?d3VwYzRHUE5QY291aGxhZmZCZ241elpEM1lhdnNabXdoT0xhSGQzZ2Q5WGxB?=
 =?utf-8?B?UVl0S0xSQ2ZQeTNqaHNJUjhSQWJrSWJmSGFZU29wRjVjYytiV29RZG5IL2xp?=
 =?utf-8?B?L0dWRFhPNy9yN2YvQlFJckRiLzBMenJHM0JBa21aYzZLUGlWRllxNGZHcG8v?=
 =?utf-8?B?MForOHZDWndSTWI1cmZqUlRwR3FOMGlodFZ4Q090VUNwd3c2SHZnSXllRjhW?=
 =?utf-8?B?U09jQ1ZIRS95OWtDbDMwK0pLSmx2OG5ESVdxeVNlckloeEp0blBrY0t2YTlk?=
 =?utf-8?B?QStyUHBvR1RiUkFhM3l5OFNmTFRYSll6U1dyOUhTZmpQb1g3OUdZTEtTRzgv?=
 =?utf-8?B?VlFKd3hlV0FHdDZWVG5qQllYeHNtdGlFMUtQUUpVeHh4Qmwrc083akZKbHpj?=
 =?utf-8?B?NmJoOGMza2pvOEdzK3BKR2h0eDJJYnJDRzZWWFRwek9keGtCblF3dThrQS9P?=
 =?utf-8?B?REhFU3VoUmZjNzQ4cUlVYzErVDAzQnVDSTdVd3ZIaFAzWC82UisxRFJsS0U5?=
 =?utf-8?B?NzAvenFDQzhjY211NW90L1lNZlFnWjhlRWd2dkVWVVhzcUxrK25SZGF4eGhN?=
 =?utf-8?B?SG94SVFxNHhUQ1ZZRThDSUJFZ3lGQTFFQWo2YXBocmkwK0d5T1BoQnZERUhw?=
 =?utf-8?Q?Wl9O01kIRU0I1brgzUgJaXyaW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d535175f-aa0a-4690-c70e-08da8f04b5e6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 06:06:02.2194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/TC/CG9xdbdee/6h2K5FtUP9DKb1yJg/sYt1Z7MWWocRJrmtMmeMxQ6DkDexIIp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4515
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.09.22 um 05:23 schrieb zhongpei:
> We found that in the scenario of AMD R520 graphics card
> and some 1920x1080 monitors,when we switch the refresh rate
> of the monitor to 75Hz,the monitor will have a blank screen problem,
> and the restart cannot be restored.After testing, it is found that
> when we limit the maximum value of ref_div_max to 128,
> the problem can be solved.In order to keep the previous modification
> to be compatible with other monitors,we added a judgment
> when finding the minimum diff value in the loop of the
> amdgpu_pll_compute/radeon_compute_pll_avivo function.
> If no diff value of 0 is found when the maximum value of ref_div_max
> is limited to 100,continue to search when it is 128,
> and take the parameter with the smallest diff value.

Well that's at least better than what I've seen in previous tries to fix 
this.

But as far as I can see this will certainly break some other monitors, 
so that is pretty much a NAK.

Regards,
Christian.

>
> Signed-off-by: zhongpei <zhongpei@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17 +++++++++++++----
>   drivers/gpu/drm/radeon/radeon_display.c | 15 +++++++++++----
>   2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> index 0bb2466d539a..0c298faa0f94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> @@ -84,12 +84,13 @@ static void amdgpu_pll_reduce_ratio(unsigned *nom, unsigned *den,
>   static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, unsigned int nom,
>   				      unsigned int den, unsigned int post_div,
>   				      unsigned int fb_div_max, unsigned int ref_div_max,
> -				      unsigned int *fb_div, unsigned int *ref_div)
> +				      unsigned int ref_div_limit, unsigned int *fb_div,
> +				      unsigned int *ref_div)
>   {
>   
>   	/* limit reference * post divider to a maximum */
>   	if (adev->family == AMDGPU_FAMILY_SI)
> -		ref_div_max = min(100 / post_div, ref_div_max);
> +		ref_div_max = min(ref_div_limit / post_div, ref_div_max);
>   	else
>   		ref_div_max = min(128 / post_div, ref_div_max);
>   
> @@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
>   	unsigned ref_div_min, ref_div_max, ref_div;
>   	unsigned post_div_best, diff_best;
>   	unsigned nom, den;
> +	unsigned ref_div_limit, ref_limit_best;
>   
>   	/* determine allowed feedback divider range */
>   	fb_div_min = pll->min_feedback_div;
> @@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
>   	else
>   		post_div_best = post_div_max;
>   	diff_best = ~0;
> +	ref_div_limit = ref_limit_best = 100;
>   
>   	for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
>   		unsigned diff;
>   		amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max,
> -					  ref_div_max, &fb_div, &ref_div);
> +					  ref_div_max, ref_div_limit, &fb_div, &ref_div);
>   		diff = abs(target_clock - (pll->reference_freq * fb_div) /
>   			(ref_div * post_div));
>   
> @@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
>   
>   			post_div_best = post_div;
>   			diff_best = diff;
> +			ref_limit_best = ref_div_limit;
>   		}
> +		if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 128) {
> +			ref_div_limit = 128;
> +			post_div = post_div_min - 1;
> +		}
> +
>   	}
>   	post_div = post_div_best;
>   
>   	/* get the feedback and reference divider for the optimal value */
>   	amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max, ref_div_max,
> -				  &fb_div, &ref_div);
> +				  ref_limit_best, &fb_div, &ref_div);
>   
>   	/* reduce the numbers to a simpler ratio once more */
>   	/* this also makes sure that the reference divider is large enough */
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index f12675e3d261..0fcbf45a68db 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -925,10 +925,10 @@ static void avivo_reduce_ratio(unsigned *nom, unsigned *den,
>    */
>   static void avivo_get_fb_ref_div(unsigned nom, unsigned den, unsigned post_div,
>   				 unsigned fb_div_max, unsigned ref_div_max,
> -				 unsigned *fb_div, unsigned *ref_div)
> +				 unsigned ref_div_limit, unsigned *fb_div, unsigned *ref_div)
>   {
>   	/* limit reference * post divider to a maximum */
> -	ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
> +	ref_div_max = max(min(ref_div_limit / post_div, ref_div_max), 1u);
>   
>   	/* get matching reference and feedback divider */
>   	*ref_div = min(max(den/post_div, 1u), ref_div_max);
> @@ -971,6 +971,7 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
>   	unsigned ref_div_min, ref_div_max, ref_div;
>   	unsigned post_div_best, diff_best;
>   	unsigned nom, den;
> +	unsigned ref_div_limit, ref_limit_best;
>   
>   	/* determine allowed feedback divider range */
>   	fb_div_min = pll->min_feedback_div;
> @@ -1042,11 +1043,12 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
>   	else
>   		post_div_best = post_div_max;
>   	diff_best = ~0;
> +	ref_div_limit = ref_limit_best = 100;
>   
>   	for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
>   		unsigned diff;
>   		avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,
> -				     ref_div_max, &fb_div, &ref_div);
> +				     ref_div_max, ref_div_limit, &fb_div, &ref_div);
>   		diff = abs(target_clock - (pll->reference_freq * fb_div) /
>   			(ref_div * post_div));
>   
> @@ -1055,13 +1057,18 @@ void radeon_compute_pll_avivo(struct radeon_pll *pll,
>   
>   			post_div_best = post_div;
>   			diff_best = diff;
> +			ref_limit_best = ref_div_limit;
> +		}
> +		if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 128) {
> +			ref_div_limit = 128;
> +			post_div = post_div_min - 1;
>   		}
>   	}
>   	post_div = post_div_best;
>   
>   	/* get the feedback and reference divider for the optimal value */
>   	avivo_get_fb_ref_div(nom, den, post_div, fb_div_max, ref_div_max,
> -			     &fb_div, &ref_div);
> +			     ref_limit_best, &fb_div, &ref_div);
>   
>   	/* reduce the numbers to a simpler ratio once more */
>   	/* this also makes sure that the reference divider is large enough */

