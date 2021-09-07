Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFC402718
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 12:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7CA89904;
	Tue,  7 Sep 2021 10:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC1A89904
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 10:25:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZJHdLwCql6rTZMNxs4MxmjmEvP8M646rxKf2D46YOEr1oH5PcMN/7XGs1iv/3ZSzNuA/7Lu9OF5cn6wfyHA4rIpUERhsCZgI8O98U+10/bEZiCJdqyJlFsP923l6QzzBGAugK9Vyrb921l+hjNam6Bua/oQWYm2GgOJEeXV1zPqbMeSLCUNFwTfdh22y4esGmyHpJ7JL3Fa1IUiwhfQZTARPSTAXkspMKpPera4x/oTzspltbgZdXfuB04EWbJ0qqJPDtthJA7Pmfvt4sIs4Xt4W/GHEqwBJpAwnLYBP4BCLa1H9zmrU0dE0i75NCA04IquY37S538xxkDNzX2Stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5vt1YI7dmXn8HoU9ao1GNa0OIz+EYKgkVJa4432sV7s=;
 b=jAOy7FQ7GB6Pcysr9Xxa/ep4bBoZ3LskOSlLwbUWSqQiImZKE5cQYloObk8ZYhjKH2qTIwpaSxWs5RCmaqmTUbNGiXPrTpkuimr3CHabTU8vk4ivTP7E+wghdSc03YYuWRapJ27qvg2KbMvcYZreX7H0TROy7HoYgHwhsZ+rmnMefjH82abILuRBnyaQUPZKZBsx89dg4fFCbgtO8VI2gb9WjZWpgWDaozMekSiRTZjcoedoV84Awi7vs7yw/YJWRuZdNAoXHtH3OQyBQinkbYvFBk6tc2PsxYQ1d59cf2jU058Z+wKaz42+8b+6SmSfHrcgiiT6oKpH0EUdSuwyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vt1YI7dmXn8HoU9ao1GNa0OIz+EYKgkVJa4432sV7s=;
 b=l2PHom2yOKDUgCfZxbc245oa/gTCaKLPbR9qPC/YeVjiydHYSdUDzoJdWOEfZSAL9fN3AZfLuwHNC48CU4KfVrcvOfNrIdBy9IuI5xcptYb6V6rce9QNWBxDq9THTv4KJoz8iAxlESsl+vAeAk0S9+CEnZYTWeqWyRwpImzsfxc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 10:24:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 10:24:58 +0000
Subject: Re: [PATCH] drm/ttm: fix the type mismatch error on sparc64
To: Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <20210907100302.3684453-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5e365947-4ae1-47a0-7565-7f0cdde0bd84@amd.com>
Date: Tue, 7 Sep 2021 12:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210907100302.3684453-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 PR0P264CA0154.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 10:24:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a79d7bb0-f73b-460a-f2b3-08d971e9be10
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41910A7294F86CB75242AB2B83D39@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsOQJDhGNvKlHAwgidTV0F+o0bmf5fKlW4o59IY7FzCDlyrkQET5e8/FLCm9RO3msPD2OgisSB4e5dXHasVDCN/DyXvCEFF7ldzzVyT6MS1AXH9rg08j4ELPSEihrATgtaE9S/Ker1xYT0p1HLS3zacPp50HSmpSVQCvuVht6+ZI4QCqigNPnoqQdEXV7YO/X2iKdlT7Z+Ta7UbJ02eAuLw2T8kzs3MCQTtHRuzWtJxF6QIID5AGeyB6+BXtjAYhKsVYgCi1FDab2USjtL+zxlEcLvKyTchXcbMtoQ6NjFFEPFi34zOc7Zs3vmejA7M/ioi1YC9tf5WvbAN5bTgXQQ7qXEtUY1KjfdXRP1ucFgJ0rq8H1WWyZWkeXDbNOvsFV8VMADpj1NdgzM7H9HnIuBDf3ULBHN4ICgDxWKEDJz8zeFrCUqYIjlwA4QdYvqMGZoeKGr69JfNeutEYW7DVclJV42GW39NXa0IHxGznsg4n2oY5IomPzHdOa9pTcsVuTA4dDVegwPsbqtlgKhXHN0EmNHX9XT0vg2wEpySDber88WShLi99d4iOZNnn2o7YSa7YcI0lk/4EUBBdeOSa46uAHU7Gn9gsty9izbdW6J42XdWpFSN66qy38UjUj75MplbMHJMD1Fn3zLwrjCVSIjvV2GiKi0V4XuliaR1pKXpLEaoGUUWbWGegbCWAHx+yUkxl4XMtiKML1tvkRf60kGsbpHvqFaAdBpQYlD30Yl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(186003)(83380400001)(66476007)(6666004)(66946007)(31686004)(66556008)(26005)(110136005)(16576012)(316002)(54906003)(478600001)(36756003)(8676002)(66574015)(8936002)(2906002)(86362001)(4326008)(31696002)(38100700002)(2616005)(5660300002)(6486002)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjI1NkUxOHRaTDAwRHBJYjJicC9hU05FQjlSTFVKRjFWYXdZS3RrWk4zcXBk?=
 =?utf-8?B?TllPZ2FVSzdzcklKdVBDVkdqNU5DZG9PcUtMMnoxaXBxSnlzbVQvTXBrMWNs?=
 =?utf-8?B?WWkvQThwTkRIREIrcm5FdEg1YWNYY1IzOStQT09kbGFPMzJGWXNXUEZidUFQ?=
 =?utf-8?B?dU54RXFtU2tRbWR4RXh3WXRSZU9Fanh2WXI2VGRLYTRkTFZaazBoWTZPSnd5?=
 =?utf-8?B?NXk1eW42SC90RkN3RWYvSitTZVRkeVJGY2VZL1I3UTVmYkVCVXVIcnhVa0cr?=
 =?utf-8?B?dXhQTGJWdXVZQ1pFdnpCZFJ0L202bWtQRHZaMys2M2U2NkNzZmJFaCs3M0hT?=
 =?utf-8?B?eXFhbXhxV0hPWGowb2pqbU5xWUZVWFJuQmYvYnp5Nmc3aG1FcXRZTFF4SjhO?=
 =?utf-8?B?dGFzNWdwL2cxSmhVZTd4WEVmR2s3NUo4ZWM5Wnhud05OODMxUEhndVNHdDUw?=
 =?utf-8?B?bFZPbElPSWNXQVR5ekhuUEtveVJiQzNGWUFWZCtSQ2Y1eFZmZEFrYjgyU1lq?=
 =?utf-8?B?SkNqWXVtM2JQZmU0eUhJc2xpNnVmajJ1SjlKMWhpclBFOC96R0E5a29MbGRz?=
 =?utf-8?B?MERTQkJGemVWRmxKWjlHQzNVaTFMSW1oTEJaZGEwZ1dXeFE2ZVhPbUtMQ1Rr?=
 =?utf-8?B?cWNvMWM1enRweFRkZG1oOFJ6S3VFdmx6Y2x6L3MrSEQ4TFdpUFhmTndqL3pQ?=
 =?utf-8?B?V3ViTjJ1MStDcWk0WUtlNlIyT29zSytaaW9JaFkreE5KY2xlNDV1aFR2dGsw?=
 =?utf-8?B?MTdhbExPbmJqWG1VUU9rc2kvL0ZYVDhQTmk0WlFhV0hhV0hINTQrdXpEUTZV?=
 =?utf-8?B?cFNVaHBHV2NLcGpMWDRGVE1TTVJPenBLT0tod3BrNHlkMHVvSUhzSjc1QkUy?=
 =?utf-8?B?anhYY3JqUGFPZHd0Wll6WGNnenJtWUtxTGJwNUdUa0RTSmoxRG1iYXArMEY5?=
 =?utf-8?B?NC9NZmhxeXBpNlk5bWFSWlY5SVhUTjJRSk9JNEJ5SVM0UTc5czAvSWNveW54?=
 =?utf-8?B?Y0lScVBodEh5U3BXR3hiNUg1SllIVE1ZRDdKOEZlUnNDL2pFNURsd3lqRHUx?=
 =?utf-8?B?S0VZSXBpMndZcHA3OUlQRUs4R1lTT0lZQU41UU5hL2tZeVMyL05KWURNVjVl?=
 =?utf-8?B?d0ROU1MxS05hNGVTb2tPbGJUOEU5S1VpdU9PVzkzSWtCQi9YR3g2emhRSG5w?=
 =?utf-8?B?UzQzTFMrZzZ1WUczQnZpeG5kSTlDdzQwbkNFbHM4QlpvbjVCeDZlTkp5T084?=
 =?utf-8?B?d0ZWSXBrMTFHekVnRm9ia2gwb1VLb3h4Y3VRYnZ5bTdWa2Fxckk5SndpTnJN?=
 =?utf-8?B?NHVsTUQ5WHlQREF1bm52d211WWZTY2pzZ2RnNk9lamFpTUo0MTNieTV5VmNW?=
 =?utf-8?B?MjVadG5WWUd3aXlLK1JIYW1xS2ZSNkVjWUt2T3RxUVl3SU1wU2JScXMvS2l0?=
 =?utf-8?B?ZzFrZERQd0pqTVZpSUY4cnVoZ1dtbmRwZ2VrcExxUTJCckpEV3l0OFFxMExD?=
 =?utf-8?B?S1prL0xnUDY2R29WMjJ4c2pVMmRYTnNCSC9URnBOQWk1a2tPUDZ2Zk9QaTVI?=
 =?utf-8?B?ZzFoU01rU3JDcFJYOFhWaE1IdUpLOERyR3dRVjJTbHFvMmlHNVAzSzFxQWJM?=
 =?utf-8?B?YTNFMVpPZUV0NVJSczdLYlZ3UEp4aUd1UDU0SWkwNWRsV01qRmYzV3E1RUtv?=
 =?utf-8?B?enpJeXFaa2IzN05CTm1FRlhBNEtYc3hQOERQRHBpNURjOFlvRWh5bVBKeWJM?=
 =?utf-8?Q?RLd9RZZiTbr/QlkPjmYFoYzTuqJWHZs1j5Hf7yL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79d7bb0-f73b-460a-f2b3-08d971e9be10
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:24:58.1515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs2ScRrqOxV0ntA4jvNAOIk6PEVC0dhBq/iUmKUhsrWWS9bPkWbnKfCHGRzlGnBr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

Am 07.09.21 um 12:03 schrieb Huang Rui:
> __fls() on sparc64 return "int", but here it is expected as "unsigned
> long" (x86). It will cause the build errors because the warning becomes
> fatal while it is using sparc configuration. As suggested by Linus, it
> can use min_t instead of min to force the type as "unsigned int".
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index af1b41369626..c961a788b519 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -382,7 +382,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	else
>   		gfp_flags |= GFP_HIGHUSER;
>   
> -	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
> +	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
> +	     num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
>   		bool apply_caching = false;
>   		struct ttm_pool_type *pt;

