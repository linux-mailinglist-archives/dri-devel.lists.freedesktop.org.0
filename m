Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36256E7568
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E9310E8CE;
	Wed, 19 Apr 2023 08:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9E710E15B;
 Wed, 19 Apr 2023 08:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZue3oY4CrEWJe86AsvIrfYBHgz+O+GUIdaFmQlA+kOci3eCqdIFpJzn9pfX5yr1FRRe2R5tZjhHQjWADnWB9KJGp/Pn0zBzdRqexjQmT+JnMaXZGgfclF3m8iYi2I5Gew1jaFsLBio8kePN3IakGBzcdHqRh+wK13llagzkv5GvVZ2wYKwRbrEcOSXDg26lRdPhHZ6sKU+VVVxxJSgCg4AsneKlMFm6dKHk6Du11wubi8gR80gEWW6slsmFdqw1hQX4DBhT8ef1o5FhIDJSWvmXFsRdEHeMk35Mpdo/M/oQquDIx6NVtGJzBfK0O++Pe5na17r68iOaryYIsVHFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYIrE53+UxAVrpxR8AYB9zix3SA3xyc5LH4x12x81A0=;
 b=Qg8B3FFUmC1drsGqo/lZtQxkYuyXDErtfHekE+45AERFT/eEnUTtFc8+fa2Wp13UdHyXMGjfJrcos3b1cVrQjRIXsjaqUKiSm6z/06Ixv82xfe56kY44mNZEtiNGRn9GJ9E5/In6zZd+NhDES1bX0rx2taAfn4kDtvkwbVBGH/utgerJTeA4UOES4JMT4oDcCOHQrJ67uDiuNLbDatCIDN714azWQ1bYtnnpixZPlnXi5ENMfAfhcCkCfJ0okfI7nXW4GmOC+PNj9w0yBblKxvzP43CX/gAu3YXl0uAamIg45agtsvAYgT5G4dXqdYFRVgFPBgDEVT2/iKkZ6irP0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYIrE53+UxAVrpxR8AYB9zix3SA3xyc5LH4x12x81A0=;
 b=y/0Ls6anrPg1PmP4M7QukLkKndHmgZr+6aZi24vN+BHDIxSD9XfHxMVaToMzUtAU1/7AacPqAhxmjWmY8PAfN5nKnolt9SU8q2FtWbfUCd6/exITGf6EyWWCrgoh1KF0yrvuNHfmO7gVucPZjLU2hXDbDdHu7U8FoI4YfuPsz8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Wed, 19 Apr
 2023 08:37:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 08:37:39 +0000
Message-ID: <e3005eb6-e37f-bbb1-446b-15b2bc02b69f@amd.com>
Date: Wed, 19 Apr 2023 10:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Content-Language: en-US
To: hackyzh002 <hackyzh002@gmail.com>, alexander.deucher@amd.com
References: <20230419042407.69001-1-hackyzh002@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230419042407.69001-1-hackyzh002@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a85e92-eedc-4bf7-04ee-08db40b15580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBbxSzJYQXBr1t1QyruQWsBoTdF74M5PS3i0oVHTWUNxGWgJqAZW0HNor0wQIr0sztCjzRkl6+h6WoKA7CRT0JGPmeAg1UfPMdv+4BIC2R/Ev4IZAVqWPIUFwZcoHm+CcmCsZGgjecaXNlZF3Njv1SrY+7EAXHZZvJT61IbB1TAsxznC3MbUkql8NwsQrdo2ZQ/5LZZXEM9yJUCIuKeZ4ZbHZqt/xVwSX3v77SNist+bGUBH0ACpTiKlKpGtEUZH3Ar+nYFXFJOy9HYvtE4KEAJqlVhHTNl+VuI72p2d3+Ys2sKDkGzePtefcTIUc0ouqUufSQmIGVXSFMJZLA1VyOJj3GNaYMb3La7oSMLmJJ19y4vJBLrbQkvmT366oPYfPjt62jYnDUQxKwLIR1SsRdlFq1XWQOumAcqP2iRHi9jtblnjhkPvV1IE4wZIJUi+TyNhRfo0DbjokZGAAN+SO/JTu0YUwEvKrletaONWv1IUJQrmzTJADE/PHl51jz3vU50srD9KE7bWXFegHKQ3uxOM9w//GuFaJZ/se6u1IZ7ocusacKNwOK4KY0hQktXfarTpj6AB1CepTjy9Rgm/8UbRrjJdty3PhSUkZLXFbjIBnKmQgUyNp8B/AeG5IA3mr5WSRnppzD7aSigbGGEGOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199021)(31686004)(36756003)(5660300002)(38100700002)(2906002)(8936002)(86362001)(31696002)(66556008)(4326008)(66946007)(66476007)(41300700001)(8676002)(6486002)(83380400001)(6506007)(478600001)(316002)(6512007)(6666004)(186003)(6636002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVRSklyWHgxdDJ2QmZzTzJoNmtZMUdHUnNIZEtpYnBkbk9BVTViZ1p6M2Uw?=
 =?utf-8?B?K3RVNzN0NFdpMjFxVmlwMDRkRDRzT0FHeXNsaEZEZVJjWXlmcmx6a29Vcmll?=
 =?utf-8?B?VllwdU5Tc21KZFFPZy9ZZm1mcmZadkRiWmlOeTcrNFVicHJBNHRDTnF3Q2U2?=
 =?utf-8?B?SjFmRnAzN2tJR091Q3lnVU4wN09rYUZvVHZXNWtyRkUxa2dyTVZ0LzMxS1Z1?=
 =?utf-8?B?TVQ3Y09xZEcwNkFVR3NxcWh5RlJHODZqTTg2dkRSbXJVa2Q1Q01hM01rRmNG?=
 =?utf-8?B?eW5HUTFtV3BiWG5TWG5Qa2NlY2M4TzFiREU4SHl6c0VTUUZ5cmlpNWFFYmpB?=
 =?utf-8?B?dWFiRCs1QlFaei9NMEJPdU0rR08vcmV4Ty93dnhFbURkWEc5VVgrb29aZm8r?=
 =?utf-8?B?dWIxYU92VXg0NHNjOE82bEtkVjRsUlJIbGRXcUJFZmI5WDhzRnY3aDNWY3JS?=
 =?utf-8?B?UzFJeCtNLzBYTWlQSmNCcHJkOUs3WjJNTzNHU202T0VWSjJPQUdQMWNWU0VH?=
 =?utf-8?B?dEYwNmRHZW5TWmdoVkZNYkJGWFR0QXJIR1BqQlFSdDljQ0lTa0ZRS05vT0VE?=
 =?utf-8?B?T25FR3hOQVVha2U4Y0JZdURwd21mcFJobFhWdXl5SE1MOVFBU0xmNmJ2cTVh?=
 =?utf-8?B?cExsTkhzUzIrM25QOW9sMVhlcm55ekpndk52d0V2bnhYcDRiUmQrSndxQjJn?=
 =?utf-8?B?TTlFeE8yWnNaRXpHYWtEVkQvVEtCVkpydDVKRkp3dlcyZngvUE13K2Z6dW12?=
 =?utf-8?B?L1U4M21RNXkvbGl0QUVvd2ppU1BhSkZqSDlIaURDcjVRWHg2aGJrVk9BRFM0?=
 =?utf-8?B?WjNCcUZqY1JCYTlGNE8rYUs1S3JHV01OY3RLMzdacDhROStLc3dVOWFkcWdL?=
 =?utf-8?B?VlhQQWlZckRUd25wZmtYamJwN09GWGlmWWtJYzVlWnlMVE5UbTFhMG9DdjNy?=
 =?utf-8?B?c0x4TWEyQVRKK0RaR1VTeGNXOGh5SkljV0t3VXpueVB0SUkwWEdFRXVFQmxt?=
 =?utf-8?B?bE1WeURBc3NEaXRSb1pKb1FTdUlINGxDSGFtaitwdGMyV2MyTlVtdmZEYnlY?=
 =?utf-8?B?VjZPUHByczcwSVVpbVRNTW9kYUxGbEpDM2NaNWZRYU9HUlJ0UFBnMk5uS0dG?=
 =?utf-8?B?TnMrb3QwNFh6NmkyRGd0c3k0c2pIdyt3cC81SGZSK0JKUjJQY3d2Yi8xUjhP?=
 =?utf-8?B?bzVleVdQUWp2d092cW9EalpoSjZiMVVHNXBuT3F5V0J3Wmd2L0V0TVA2TnM4?=
 =?utf-8?B?NzRkNmxrVzdMMHdaQ0dKd3U2bWVybmwwRnVDRUJiV1RNeWtiOFQ0SHpFSFJS?=
 =?utf-8?B?WGtZSE1iWHd4anVsY2ZtdlI3eWV6Rzk2Yk5tN3Bxd1NPQmkzNVR6OUJtSE16?=
 =?utf-8?B?LzBuVTZoVFZoUzVCTjBLKzhDcmxzVEhKcUx0VTRCWGZEenNqMFFTR1hnQnZh?=
 =?utf-8?B?dFZQbTNrWGU4MWM2YklQcHl1ZEdsZUZTME1zQlBLSzRCeUwvOTZPWkpCaUQv?=
 =?utf-8?B?aHRISnZiL29Uc3VsS2hqWXRNSDRqSVE2N0RKb1ZxMVEvR2VicG5BeW1UTkg5?=
 =?utf-8?B?MWV1TDVHQ2YyRHNXaTU0Q2N6NEFIZ3RmcElZanE0bERmYlg3U1ZQaFdwbEVQ?=
 =?utf-8?B?aEJxRTY4TFNPRXlwSGo2emtjVWcxdDNOanEraUdRZE9sRGpPeFUvcnFWbXpz?=
 =?utf-8?B?cHNWdjRwSHNCK0dHMmxOVG5DKzlkNk4zMS9YQkplVnM3WTJsL1J4OCtNUFg2?=
 =?utf-8?B?Z3JpTUJWaUJXOEFsSG9CTVBBckw5TUxKRmRVTzRBRHBWbHAxN3BjK0pGWjdT?=
 =?utf-8?B?UW40aWZnejFiZTRGaWxIWjRuZ04yeFJPei9iUEgxVXVoSWhmZitLUzYvQmph?=
 =?utf-8?B?U3IrVk50QUF6MVowRmVEK3VnZ2pqbjdmakxxQS9NN2MxcWlZZndFOU1CNFda?=
 =?utf-8?B?WUs5UEcvNCt5NGxQZ0p3TDFVZitWamJJYlk2UnZ0L0tYKy9rbEFEZTBENXRP?=
 =?utf-8?B?cmRkNE1pallxT0ZQQ3EyVFREUEt0TjZYcVBFUkt1a0FDK2N0N0Q2Si9YUkVG?=
 =?utf-8?B?ZGl3N2lxM0pvS3Y4dmlEcXhtTkd5UlVnOGxOb2NWME1RK215S0hxbm9OZjFU?=
 =?utf-8?B?TTFVazhUVTFsVm10MWZIMjJyVnlUSzhPd3ZZT3l6dFhTYVJOZ3Q4ZmlWNGpq?=
 =?utf-8?Q?Em7RQIqgwkmeui33N0+JLaKaROJebhNZkWhqXg76VoTz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a85e92-eedc-4bf7-04ee-08db40b15580
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:37:39.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRoOPCWI+KpoVj8vb8z4db7RsmsQiuSHyYTnbrz0E5rvkuEw2b1cr/81NqApBM3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.04.23 um 06:24 schrieb hackyzh002:
> The type of size is unsigned, if size is 0x40000000, there will be an
> integer overflow, size will be zero after size *= sizeof(uint32_t),
> will cause uninitialized memory to be referenced later

Well good catch, but this is actually harmless.

Userspace can control the memory which is referenced here anyway and 
since the size would be zero when copying anything back to userspace 
this is also not an information leak.

>
> Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> ---
>   drivers/gpu/drm/radeon/radeon_cs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 46a27ebf4..472c29050 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -270,7 +270,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
>   {
>   	struct drm_radeon_cs *cs = data;
>   	uint64_t *chunk_array_ptr;
> -	unsigned size, i;
> +	u64 size, i;

Please use size_t for size only and not "i".

>   	u32 ring = RADEON_CS_RING_GFX;
>   	s32 priority = 0;
>   
> @@ -347,7 +347,7 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
>   				continue;
>   		}
>   
> -		p->chunks[i].kdata = kvmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);
> +		p->chunks[i].kdata = kvcalloc(size, sizeof(uint32_t), GFP_KERNEL);

Please drop that chunk.

Regards,
Christian.

>   		size *= sizeof(uint32_t);
>   		if (p->chunks[i].kdata == NULL) {
>   			return -ENOMEM;

