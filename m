Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102AC62026A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 23:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003FA10E54E;
	Mon,  7 Nov 2022 22:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2ED10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 22:41:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2RaVjlMTkQHWku84ae50bENMFifaNyXXohOppNWWKzcSbIV/rhpksqdbYkpxNyDF27oRr00RdBBk+2yKXFnX3W6Fyd62AiZrDVNE//LccNWoOXs0WeYJArent7BDXltCL+0HMXetZQamtl/nhMtY5qOjxRa8kncBmHdieuqRxaw9j9o/Ua07QZ6s60zzlFOERl2/vvdVzTnFW2sJZ0T/7YwT6pQnOf6kCRMXQKF+wDAKmLpDqYpYfsLDfOKgczfO1TWCFks4rA5VeaOJKjLmXOcg2akVmFWrsVIObgTBI0I7f5AeeH7oQ/uq41UUJ+6YapEBtymGiY7f3eok7gsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC4wjIYbaBUxT0Ocfqy2znl+3078Gp2DXYlDuvK+b0c=;
 b=hA2qFbwQdUuMUeePyHlF7GDoGcZfDzZSoZJbSL3NniGNeRUhmYxsh4yl0SYOsdy9iU/ATGoRkg5pEUpe+XNPJYSDUndPkpvlcUOjiZKZMVKM3t6VMTAoee4z+n2nSXdR2EUB4ksQyfaIJvthGErBZ1NV2DueYDo2ESBYCtbvYa3s837wpedOWFspADvfizf2wP9RfH1gimgY+VgaOSFs0iPToJkCcRFc5TiDQfzG7rcml+ZQ6Sw3CQsBJqtfJa3B24dVIGucs9g5mDfuAuKU+2PJFSJooLrVsgfPyXJZNgOBzVQ0xGJLlQLqFxZ1SaeiqNhel8yXzo11N0TQ45i37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QC4wjIYbaBUxT0Ocfqy2znl+3078Gp2DXYlDuvK+b0c=;
 b=i6BRAmIaCXsISPxvvyK61JOUTgegwY0z+WhlduLUg01lSHWNuClbEOw6mEJCDNOfQSrXhDJtE7u2pgHiAieQbekhNv/4GJ6dWYXNWmUT8GTxWq1tljAIreq6xLbUAAn7PlQ0MrPcsJA3f9smWBHYpuepfeBxySeiRCfol5vSXak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN0PR12MB6103.namprd12.prod.outlook.com (2603:10b6:208:3c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 22:41:54 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 22:41:51 +0000
Message-ID: <588ef03c-41b0-268f-406e-d3d4d0d8ed29@amd.com>
Date: Mon, 7 Nov 2022 17:41:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, felix.kuehling@amd.com
References: <20221107195808.1873-1-christian.koenig@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/ttm: optimize pool allocations a bit
In-Reply-To: <20221107195808.1873-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0068.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::26) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN0PR12MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 3638fbda-abb4-4468-e0eb-08dac1114366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oT2cF1vyK5NuaE9/6NS2jLdxWRMuBizSiicqXhezCsp5wm1h8PyXXceFFqpqfeNiYbRM1UhdvsbDLV1cw3EXUAU8EHDerT36N7sndD07nN3eJAPoHfTxyV5YpvYO1mFznls4q1UeeVBnlXArIXY18aDInwJ4ilRMGa6nx6QQQ9ki0UjRW7LEqIlI1FwoZU9sAiEvmFcOoErSGcPS6kz56O59FI4ytedVOGSzuIXWo9UI44xFN07qOTgX9FAy8ZZDPiJD+YW0aBaCDlkVfK86WO2ZiQPIFMCarHMfQ20ZGL4/HdQszTCms97B477lOi4EClcViADGSAlrAuiSNbzxzoPGyOkeCbBdkyjHVkvsNNSXy/Jzx97na9lkepRB6UE7LKh9+lLl2dZqtJJCQPMSiZv7703OWbgtb/LwJUeFpvVA4DrLt7BNA7AV8xXOZvadyiNCVSRzGy75MjLF0XiGiJCQmJrvtpvCIHU6lR+MHd5XtIqa+T7eYFZeiLFO0MzikZUY0Rm6QcPPM7XYSWRXV7QH24CsaSHi3KuWXtyWLrB9Br1lcmpazlEzBlBw6K+YX1eTFglNtHxA+TlgfFeBMDsawL9LsWDhzCTYf/XbDQQBDU/mLk8Y/5emaB1DRfFDxiXSXT/ml8VKbN27ToyIse5IqLHFe/iyenindO87woGL6qjJZ6SIjZazg9o+iPx4zNjLqKZAp4WRTa3D+7Aex4zZF4QUDCXIhsxUT8VSaSnNSK7iVNv+NTVQ4vMsFHqVqb663MekH+TeGHYGSNzHO3vrt03i0jg4/ejVRzTBhc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199015)(6486002)(5660300002)(8936002)(478600001)(44832011)(36756003)(6636002)(41300700001)(66556008)(66946007)(316002)(4326008)(8676002)(66476007)(83380400001)(2906002)(38100700002)(31696002)(86362001)(6506007)(186003)(66574015)(6512007)(2616005)(53546011)(26005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXRyK1FXcUtpWFBGVGdIbDlmWCswTDJFWS9VUzlINmp6YlEzWlQrbUVYVFhu?=
 =?utf-8?B?T0pLZVoxcFN3aVF6bUJHZ21wemJoSVhCdTJZMUlxTjRHS1ptbmR3QjBOSWJB?=
 =?utf-8?B?d09YdE5XWkk3WE1XcFZyL1dEaE1BYXFteGZrRTVvWGNaRGtMcXR2dDVxRU4z?=
 =?utf-8?B?NGh5OHJYdDczOG52d3hKKzFOdjNCci9qZ0Y2VHNXaTYzMUVNVkRXenE0WmYv?=
 =?utf-8?B?aEhpVWN2L0dYOWl6dFY5NDNzZmVWbnZPZStuMFhzaGw0R1FvQ3dmYWxPOWRz?=
 =?utf-8?B?L21Gd3VqVHA5TFJKY0NDWk9DUXFoSXJWNlBWQm9URURLV2hGNGxzMEl3MnRK?=
 =?utf-8?B?bFFXbzV5MHJKY1cxd0tWVGdrUkswQ3MvNytQU0NBenRRRkdwYTRJMlNPTDJK?=
 =?utf-8?B?SW9JbDJBNnZVZXVhRWF1SUtaR241dnBxMkxzN2EvcUFLR3NiNWtjY2N6TURT?=
 =?utf-8?B?UVlHRUxrSHQwdXMyNG14cU55NmR0V0FmTXQ1eEJBeEd2STdhcW5PemlFd2Zq?=
 =?utf-8?B?SUhjWU1QQkV2VWh6MWM0dWNzU0RkUnZIcjJNYVpVY1hGYWUrbklLVERVeGV1?=
 =?utf-8?B?eDBrdUVjY3Zwd1Vxb3l1N1hoUWxWQStOc2Jja0VvaWdQTUtibWw0ODVFMVFa?=
 =?utf-8?B?RDd5ZlpEaUxtdFNsbDlIbFRUczlzcVdJWGZXc1B4SXgyKzErOXVnWHYzTEdF?=
 =?utf-8?B?S1p6OW4rdGpKK1JqOThveVJIcC9JWTIwWEtHYmR3RXo2YzhvN1BxOGRtRXhw?=
 =?utf-8?B?OWJ1MW9JSFlOR09WcGZ1dGV0QVlCZ2dEK0tCMjFmeVpvRjd4anNhSzhIa3Qz?=
 =?utf-8?B?N1I2ZUVhYWsyaVpUc3N0ZEVTN1dOYmk5QXk4VEVNb25sREtzcHdUeGlVdjFj?=
 =?utf-8?B?b09qYXdMREY3cllISFdaQmZ0WlZuM1p4TC9nV2Z5TThjTXdHWmNOdzdGYm1o?=
 =?utf-8?B?d0k1MmJQYnJNQWpRNlFlUDRwL0lVRFp6ZFZlcFNKTXAwYXZJUGMxRTFqakpi?=
 =?utf-8?B?YXY4Z0FOZzZkTkgzM3Y3emJZSGNUWVBzYmRQUlNIaU16UW5ob2lXbGlFOEl4?=
 =?utf-8?B?endMQmRWQ1ZrT1RNYThBMzZuUUE1T0IxNG92Q3JBVERWcktTUmhDMmhpVlpS?=
 =?utf-8?B?N3pQVGxwWmprbk5kTUV2U284N2RSbnB4ME44K21janBtRXVYSjVCY3JiUGRG?=
 =?utf-8?B?N1Q2c2MyQlVKY1pLcDBoNmxFVlZQMjZMNCsxcDFscVJicnhJR1htVEEzMys5?=
 =?utf-8?B?RXVLUS9Qd1FPTm5EaGVxNnZmN0pLVWxtNFhsdG9BSS9jQnVuVlk3VkpCek4y?=
 =?utf-8?B?OXhXVC9QUnJuWENBckRyMjRXNlNiWm1OWEZROXNwV1ZZYlNVbTJlZ1IxZmhr?=
 =?utf-8?B?TEliSG5IWEtGVWh1MHlhZWJFaHhTRUx6NnRhY3BwUGdLeHZDN3pMSTJYZ0pM?=
 =?utf-8?B?TTRVeWt5SzBnaWprSTlheUExN1ltMWJMNW5Sa05LTW9SUTU3d0J2MDZobjJ6?=
 =?utf-8?B?M0tkaTBJYW5RZ1VrOVZFWTBNTXdRbzRUYzNPa2RzcUxNQXMwSXk2UnIwNlNJ?=
 =?utf-8?B?aTdFSEJXdWRvTmMrOUE3NTN4N2IzVHgxY3dFM2FjUk5ud1pBSUE0S01ZVi8x?=
 =?utf-8?B?cUJDZE1GZXhURGNXODFvTENCSXA1bi9xVEhPSENzUFJqU3R4VEFPV2Qrcmw1?=
 =?utf-8?B?ekRtY2pCcFdKa1VOcjJQalk0Z2lKaG1lOXV4UDRmOExDcTd4bm1wRmlyQmxF?=
 =?utf-8?B?QklyRDc0d1QzSE1FNmVCZWxHNmRGTlk0dlJwSXdrY0Iwclk3NklTTU85VTRE?=
 =?utf-8?B?UU1CZ2paMDgyZGFncE92Y1RUL1lzanU2aU0zTDZLazg5dy9ON2pqd080MVR5?=
 =?utf-8?B?WEVSOUpqU0Yvb3VKL3Jrd0ZnRFhKNXFyMjVUdXovYkN5cEJYZjBvMmFEam5y?=
 =?utf-8?B?VTdpWkhqaVRHWWVQOTJGejVOdThSYTBLOUwrUlZ1bkl0ZExwSndxWmFvZ1Zh?=
 =?utf-8?B?bS9XZ2k4NjVMMHJVd2JmMDFVaHZBRnhobWpnYTBlSk9MZzZPWk9LamthVWJJ?=
 =?utf-8?B?cVNLWkIvSno3ZU1SWk9oT2hhc2w3N3hhNmFSekJmU04vWDhYd1k2Y1pLaGlG?=
 =?utf-8?Q?zGU7Y/OBp/ik1zLEJ6aK7SLpl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3638fbda-abb4-4468-e0eb-08dac1114366
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 22:41:51.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCGXFYroc/PuJdg823b9d4KsmXhM1eq7ps4rnWFFS1xAWbdA/RU2Hz7amgV2msKv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6103
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-07 14:58, Christian König wrote:
> If we got a page pool use it as much as possible.
> 
> If we can't get more pages from the pool allocate as much as possible.
> 
> Only if that still doesn't work reduce the order and try again.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 81 ++++++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 21b61631f73a..cf15874cf380 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -344,6 +344,27 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> +/* Called when we got a page, either from a pool or newly allocated */
> +int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
> +			    struct page *p, dma_addr_t **dma_addr,
> +			    unsigned long *num_pages, struct page ***pages)
> +{
> +	unsigned int i;
> +	int r;
> +
> +	if (*dma_addr) {
> +		r = ttm_pool_map(pool, order, p, dma_addr);
> +		if (r)
> +			return r;
> +	}
> +
> +	*num_pages -= 1 << order;
> +	for (i = 1 << order; i; --i)
> +		*((*pages)++) = p++;

Since we're using a for-loop here anyway, perhaps it's better to simplify-clarify
this as:
	for (i = 1 << order; i; i--, (*pages)++, p++)
		**pages = p;

Regards,
Luben

> +
> +	return 0;
> +}
> +
>  /**
>   * ttm_pool_alloc - Fill a ttm_tt object
>   *
> @@ -385,45 +406,57 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>  	     num_pages;
>  	     order = min_t(unsigned int, order, __fls(num_pages))) {
> -		bool apply_caching = false;
>  		struct ttm_pool_type *pt;
>  
>  		pt = ttm_pool_select_type(pool, tt->caching, order);
>  		p = pt ? ttm_pool_type_take(pt) : NULL;
>  		if (p) {
> -			apply_caching = true;
> -		} else {
> -			p = ttm_pool_alloc_page(pool, gfp_flags, order);
> -			if (p && PageHighMem(p))
> -				apply_caching = true;
> -		}
> -
> -		if (!p) {
> -			if (order) {
> -				--order;
> -				continue;
> -			}
> -			r = -ENOMEM;
> -			goto error_free_all;
> -		}
> -
> -		if (apply_caching) {
>  			r = ttm_pool_apply_caching(caching, pages,
>  						   tt->caching);
>  			if (r)
>  				goto error_free_page;
> -			caching = pages + (1 << order);
> +
> +			while (p) {
> +				r = ttm_pool_page_allocated(pool, order, p,
> +							    &dma_addr,
> +							    &num_pages,
> +							    &pages);
> +				if (r)
> +					goto error_free_page;
> +
> +				if (num_pages < (1 << order))
> +					break;
> +
> +				p = ttm_pool_type_take(pt);
> +			}
> +			caching = pages;
>  		}
>  
> -		if (dma_addr) {
> -			r = ttm_pool_map(pool, order, p, &dma_addr);
> +		while (num_pages >= (1 << order) &&
> +		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
> +
> +			if (PageHighMem(p)) {
> +				r = ttm_pool_apply_caching(caching, pages,
> +							   tt->caching);
> +				if (r)
> +					goto error_free_page;
> +			}
> +			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> +						    &num_pages, &pages);
>  			if (r)
>  				goto error_free_page;
> +			if (PageHighMem(p))
> +				caching = pages;
>  		}
>  
> -		num_pages -= 1 << order;
> -		for (i = 1 << order; i; --i)
> -			*(pages++) = p++;
> +		if (!p) {
> +			if (order) {
> +				--order;
> +				continue;
> +			}
> +			r = -ENOMEM;
> +			goto error_free_all;
> +		}
>  	}
>  
>  	r = ttm_pool_apply_caching(caching, pages, tt->caching);

