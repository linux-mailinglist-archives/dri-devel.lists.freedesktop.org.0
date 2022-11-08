Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2D62093F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 06:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70D10E1EB;
	Tue,  8 Nov 2022 05:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C050310E1EB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 05:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAVs4+9fYgJMPN4Gg0PXH7qw1wqL+boCUH09px7+EXBq+ZBnSrqne2GnPheqi72oNymyLm6SUyYXMyLvu7hFC/448DWoBX5AJ5Lq+3qb2XY4ir3wR3RkBMIe/Ys23NM/n+mTK5IaGIDCDD2HooJmeJv5zzdmHfNuUnMLGUJkMwUlD7zIDrvRLhTYVXSO1fLYsMhwlM6zEY6AOS0mO9eLzqpqcU9FcuiIbcrWqDAxj9ayk55/SiN0xVBHm4HDf1qqOLis8+SotIVUFaq0bawbJni45JjOiBrU8fzVWidKYF4RDZm1cOq3LfU3WONe2plVFmZUNKeCrPTn4tqcBLAFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRiL2a7v2Yi+m6ZYyscvEzKF/g/OEal4qAbb7u8Mdj0=;
 b=C+Yd9tyWXKykTc6WZ2FksZFvq8iO76RM55XVi5ula11UL3o9fLY9Ce8bfkhVqjpeGeUtCpddT33V0dXaLR4sK8WTtHTkRwIvfBo+QVSvayOJNwPoJ90eI2ZpXz72rkc6inOFh2IeQs50falczBsQv+h6HazGA53tUg6iZ8tp2jtt++UXJLcvLcqKHhUDZgSH34f+Mhh9fHs/U/JiSFc8FeHg7CiMwzB92kZm48QtmAm9X4zinhQNN9v7zYq6XscbvuT2DRshrLF7u8p6F12kbq4Gfd3fbvYeWAtIJV+Pxm5tc4xI2iPOVt/HprDZR+MxxXJRGRscubUK9Qu1Y4JQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRiL2a7v2Yi+m6ZYyscvEzKF/g/OEal4qAbb7u8Mdj0=;
 b=FUM7mFHGkcL7DVwU2ZJ+ymfRM0nccTNqW9ozjXgz84z+4wvfr4NeINZ6WbS8jNYhtB1c8F5tk23vGYkeWRiEPZW1YFsGjW3Uk+mXyHBi3+DdEUHXsevCQJCUVtHihbies8i7otb8XTj1YCr9DPgA8KTNH5qSlIRB4DvILZorj/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 05:57:14 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 05:57:14 +0000
Message-ID: <7235bb94-cc34-f0eb-fa3f-0d4beaa998b2@amd.com>
Date: Tue, 8 Nov 2022 00:57:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ttm: optimize pool allocations a bit
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20221107195808.1873-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221107195808.1873-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a1e5f2-4287-4523-2245-08dac14e158c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zzaukM7KmYtGWGh7as8+twQhKLEDfF3o8MCiSVZoHHUVztpqJGn0jUiKAJq9OQu7hxNSFgVFASPdlPFoAiYPxGsxrMXWyKqNpz0f9Wvc7/hpolFqnnP2mGjF9C451na2IBsqnavrTANa2NRj5se04bK+e7vAo7WwhHwHlIRHddtHSeKRMLz4RCuf8z6znTOw+g4qv1JroTi3hfRjnHQZaQ+lk4lSwus8BhmwEfYD5RrjAQldVMiSn/U0iRECsbpkb5I3BOLkt1lEW4dnevn8d3Vt0Mx3w2Lg3iKfrJn5oC7YBqaIZNrKfd4z7LLMgroKEQJpVECzExX0VXv6CiI/2RQLC49Rp4Zok48E0YRAtR0sm0d42RwnyF/C7S3He2AOwATKS2kOuH1TdLwSk0ojHGLaoeE9QKtGvjdsWBPbD1NituvBEbfK+rNETzDVvYXWfDvj4NhkPlFgZ3y1BPhLGg4eOQ+u0+qNQxGvMbYIvwnk2Y0rs562/mMsVtqUpOpOxArW1b96Q4AZ4Hqp6RoiVeyFMG6YVzFcmTrhmtBN4xKqbY4KP7gwIu4porDAd5myk8jHUoQxRKMXyVVE1AOMCs0cl62XHMrXxAT1V8/IYVox1tQu5OgQSVeGJFETnXUUJbm0gpx9cnJVU9FevNmpOlUKdpQTPzGb9aySBwM0OgB1SHFs57VI9yWZzMbzFxXGIKm3QxnsXrY+6s8Rc13iL4WffUnqdnZNqvwJiqN05npXVkXO6hnOGgcqVDaDMnLJcrueKAXUaXQf+A0OQdmWXw8sleoXigzKKUMRUdAHyuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(44832011)(4326008)(8936002)(31696002)(5660300002)(86362001)(83380400001)(41300700001)(2906002)(8676002)(2616005)(186003)(38100700002)(66574015)(316002)(66946007)(66556008)(66476007)(6506007)(6512007)(26005)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWx3ZFB5Wk9PVEtoT213VEFrVXdwYTl5MzUva1RlQnhXSkp6RHZFOTBHR05X?=
 =?utf-8?B?bWtCVVVpdzdEWXVMSUdJektPTFJzZ3diNVZoYUFzNGNtSGJldFRkMWg3VW1n?=
 =?utf-8?B?eW11VVFsMmNpZE0vSVhDNFFEc0JMVjhwdjR0K1pQZG5QMGFZMStBVmpWRXpw?=
 =?utf-8?B?SmFpTzcrU2R2UjRxTk5DbmlCcisxWEdsM1hyMGZPRDNpYWs3QWE3Um9QV242?=
 =?utf-8?B?ZXlDRGlJTFRPdlNyaXVNNkUza2d6WXo1UHJ5NTNGMlJNZ2pXNFNrV0FNQ2Fk?=
 =?utf-8?B?Y2JFbVlmbFlQSm4zcFJWcDRGOHlJSGJLY1pTUDRYeENIVURvY2NHS2szbGtw?=
 =?utf-8?B?Q0ppeElrcG55QXpTWnBiSmw4bFFZWUxRZUVienVKRXJBejZzdFBQUVVmUG0y?=
 =?utf-8?B?WmIzY3Bkd25jNlVVSnpGeWxlM3pZTGVUR0RjcmNjWEdLVm9qQS9yQlhNVFU2?=
 =?utf-8?B?KzV1eXpRa0cvcDlpcUtHTktnNS9GV1pzb212ZlVDTm5FWHhoK0lBcEJnTjU1?=
 =?utf-8?B?NkcvSGtoWnQxWElHby9yanl5d0x0Q1NQMmxiS2t2bDE5cU5JdlJKUlZzNVla?=
 =?utf-8?B?b3JSdzZVUkR1aDFQNWVmVldYNG9KL1p2czlKVUl6Umdlc3d6M1MyWGh6b295?=
 =?utf-8?B?emJWcVdtdCtiUkxKbjZrR2hXVFhxb3pxQnVXRWR2azBUU2ZVNEplbFpOU0pH?=
 =?utf-8?B?aWdTb0Q0c09qdXJMZHY1UFczRDkzcGdIN2dBcGxjTWtkNmVFaDZPNTBaazdQ?=
 =?utf-8?B?dUhQMEpLK0NTWVo2SXJZdlhybFQwdHBhOUs3TXJvTmgzOVVEQzNrVXNnM25o?=
 =?utf-8?B?VWtwU2xaZGxtZEFkYVltYmkzeXVMdXRkc3NmTEFHL3RuL2U0WjRsczJDRlZx?=
 =?utf-8?B?MEhJWHJpQ0xxSGNkNUpjbUcyQjJLdzQzb2tIMHAzYU1BRzRwY0pZRW9YUCtQ?=
 =?utf-8?B?U29CQ1dUeHY5MzBVSGlPdHlpWk5tNVkxVlMrUlpjaDRxbUZwQmdHbkwvNExP?=
 =?utf-8?B?UDIrTVg3VVFxZ251M1d2YVNTdGJuUXNLMFllbWhTdCtLMUFIN1ZmT3piWXlJ?=
 =?utf-8?B?eXp4TUtnMnRHNllVZ1dsUFUzQXl3a1FUSE1VanNyaVJKRWFZTFdZRnBoVzAv?=
 =?utf-8?B?QU56bStQemNsTlJyZlhyL0xjRVBiNkljTkNQTGFZQzViaXowNjc0SGRhaWR1?=
 =?utf-8?B?QnFrZ1Z3dGQvZlhBTHJwYkF3cW9lVjZ0YVlOV0xXcG5oaGE0VWJ6ZGVXYUVt?=
 =?utf-8?B?OVJ6RzErdjdRQlE0b0pJaXJTN3JsT25jYzZyWEorSkpMekZFSHRrY083MUIx?=
 =?utf-8?B?alo0N21ydkpBNEdtYUZieW05Q1IralI5LzlXY3hrUlVpRmJ4UHRRdUhrLzhF?=
 =?utf-8?B?SFdEeThmandldkFLenFpWTMzRWFwQlh3S2plY29LY1dJd0VNeVhQTlVDZzhy?=
 =?utf-8?B?ckI5Q2ViSFlFOUkxMk53a29kbFhMemNyeFJFcHVqa2tWdm9PSlk3NUs4NVYy?=
 =?utf-8?B?NWU5aldKWnZ5UStBMkJKVDc3bUpvRnNVM3hqdGVkNGd5SElObG9WejU2VzJp?=
 =?utf-8?B?MitiNHNkdWowZ3htbkVEazloU3RPclpMcXAxYnEwRUJwMWZVNjRDamRmL1pD?=
 =?utf-8?B?MUpiRGNzMUg3WVZhSjgvbEVoRFBUb3NDVHJLcDBRRGtmc0R2cnJyaHRJVW9W?=
 =?utf-8?B?NjdwTXIxTzVkZWhrMjZXRmxRVnlxeXNYRXpBaDhVMUtHNkZrSDh0RVBlZTlI?=
 =?utf-8?B?S0ljakF2dG12TWI3RS9jWXo0SWhIU0hLV3BncXFtWVpkZStZQThOSlNUWUtR?=
 =?utf-8?B?cytidG52S3NHaTJaMlJlY2I5Vk5zeDhmTjJrWmxHcEhBWm1TOUZIWHlrbXg5?=
 =?utf-8?B?RmNnYm1QK0xWOG5Eei9rNWF0TEhLR3Z6OG1QUVRuMW5hNEEwQ1R1Q0hiQlJU?=
 =?utf-8?B?SE4zRUJwSEc3RG9aQ2RJYjdDQ1JFS3ZtaWFxb1p3WFZWTytiTmU2Ty9yM1V2?=
 =?utf-8?B?MVR4WERhL1pxQXJYMDBoZk1mc1lCQTd4RUlzNXFScWtlRmNRdGdFVklPbHVD?=
 =?utf-8?B?SXdPWXdLSFNvYnRCMGI5MUtKd2l2T3ZuTmpqcGpQKzhEWlU1R2JSRkhOaGJp?=
 =?utf-8?Q?dHV7Lo2b1dVsjWRWAM8vzZkCP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a1e5f2-4287-4523-2245-08dac14e158c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 05:57:14.2273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHC8oRa03dY7IxROqGWZdXqWr5GHI9UQdIrbh/0sBWZiClVg/KSUwTm32nVIOMZZNJWH/zDzceURf5ggn36vUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
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


Am 2022-11-07 um 14:58 schrieb Christian König:
> If we got a page pool use it as much as possible.
>
> If we can't get more pages from the pool allocate as much as possible.
>
> Only if that still doesn't work reduce the order and try again.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 81 ++++++++++++++++++++++++----------
>   1 file changed, 57 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 21b61631f73a..cf15874cf380 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -344,6 +344,27 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>   	return p->private;
>   }
>   
> +/* Called when we got a page, either from a pool or newly allocated */
> +int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,

This function should be static.


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
> +
> +	return 0;
> +}
> +
>   /**
>    * ttm_pool_alloc - Fill a ttm_tt object
>    *
> @@ -385,45 +406,57 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>   	     num_pages;
>   	     order = min_t(unsigned int, order, __fls(num_pages))) {
> -		bool apply_caching = false;
>   		struct ttm_pool_type *pt;
>   
>   		pt = ttm_pool_select_type(pool, tt->caching, order);
>   		p = pt ? ttm_pool_type_take(pt) : NULL;
>   		if (p) {
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
>   			r = ttm_pool_apply_caching(caching, pages,
>   						   tt->caching);
>   			if (r)
>   				goto error_free_page;
> -			caching = pages + (1 << order);
> +
> +			while (p) {

This looks like it should be a do-while loop. If you get here, there 
will be at least one iteration.

With those two nit-picks fixed, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


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
>   		}
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
>   			if (r)
>   				goto error_free_page;
> +			if (PageHighMem(p))
> +				caching = pages;
>   		}
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
>   	}
>   
>   	r = ttm_pool_apply_caching(caching, pages, tt->caching);
