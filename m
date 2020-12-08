Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09F2D3D5B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E536E237;
	Wed,  9 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2147 seconds by postgrey-1.36 at gabe;
 Tue, 08 Dec 2020 08:54:15 UTC
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F96E8AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 08:54:15 +0000 (UTC)
Received: from [10.9.9.74] (helo=submission03.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1kmYCV-0007Tz-Ey; Tue, 08 Dec 2020 09:18:23 +0100
Received: by submission03.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1kmYCQ-0002zv-JO; Tue, 08 Dec 2020 09:18:18 +0100
Subject: Re: [PATCH] drm/ttm: fix unused function warning
To: Arnd Bergmann <arnd@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Madhav Chauhan <madhav.chauhan@amd.com>
References: <20201204165158.3748141-1-arnd@kernel.org>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <3a55c203-57dd-79f3-99ec-6bdeafaba157@mupuf.org>
Date: Tue, 8 Dec 2020 10:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201204165158.3748141-1-arnd@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2020 18:51, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> ttm_pool_type_count() is not used when debugfs is disabled:
> 
> drivers/gpu/drm/ttm/ttm_pool.c:243:21: error: unused function 'ttm_pool_type_count' [-Werror,-Wunused-function]
> static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> 
> Move the definition into the #ifdef block.
> 
> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd! The patch looks good to me:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 29 ++++++++++++++---------------
>   1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 5455b2044759..7b2f60616750 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -239,21 +239,6 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>   	return p;
>   }
>   
> -/* Count the number of pages available in a pool_type */
> -static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> -{
> -	unsigned int count = 0;
> -	struct page *p;
> -
> -	spin_lock(&pt->lock);
> -	/* Only used for debugfs, the overhead doesn't matter */
> -	list_for_each_entry(p, &pt->pages, lru)
> -		++count;
> -	spin_unlock(&pt->lock);
> -
> -	return count;
> -}
> -
>   /* Initialize and add a pool type to the global shrinker list */
>   static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>   			       enum ttm_caching caching, unsigned int order)
> @@ -543,6 +528,20 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   EXPORT_SYMBOL(ttm_pool_fini);
>   
>   #ifdef CONFIG_DEBUG_FS
> +/* Count the number of pages available in a pool_type */
> +static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> +{
> +	unsigned int count = 0;
> +	struct page *p;
> +
> +	spin_lock(&pt->lock);
> +	/* Only used for debugfs, the overhead doesn't matter */
> +	list_for_each_entry(p, &pt->pages, lru)
> +		++count;
> +	spin_unlock(&pt->lock);
> +
> +	return count;
> +}
>   
>   /* Dump information about the different pool types */
>   static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
