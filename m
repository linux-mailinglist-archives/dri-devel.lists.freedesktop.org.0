Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5003F02B3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 13:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215D88EFE;
	Wed, 18 Aug 2021 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0204A88EFE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 11:27:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r7so3055546wrs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=lFa3YGjSwzNh5uyRqe307xal667WABS1LTapKh49yFk=;
 b=OI6jHfpB4IoEuPBx9Z92U3br8Y7nVESzd+JcMa2fUMyNyCSe1H9nL4y5oiv7G19zsx
 CdPz5HObCrny6mEPSHerm3bCa6u/0Gdxlbz6GclFf5BTH0p3c08Q9M3x35XFdk+rwMLK
 WNHqhXvkH/CC75nTiFIV/l+iHdbNEgPqjTXsK+e/mg6FWh+jsrSeD40tNXe73tIzeOuj
 Xc1tdK+GsPHLvu6YPVzcsJX/lELcSIFK/2rfvpYeZG0X8kJ0oOnr2PnSCIo8k4NEPiLu
 BXp0o+WG+Rrp6XlI9iOQFI9kb9KNjeUSi45il8SXVnXx5TUeerdKvLaysV4l3zewLBY8
 TUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lFa3YGjSwzNh5uyRqe307xal667WABS1LTapKh49yFk=;
 b=Gq7UV4J54wKTGoip14vCelpcw8WqYhwijV3PT8BFwbf6NJxfHTsDFiyTovcruQq0hu
 3KJO1vxFYmY55BZ1tXZcFQMZFgJOx7NSN+6Of0RQb0nyDrGb+ESc70LNTUY6PW90DO2T
 lP4Q8OJJtIbjdNJmbmjjp73mmcWdcT9HGoKZy/DjgjWhz+edHNB6K4iQIgH6d23Gbqie
 AEb+K2NX9ibgIDJXLa5skS5/kAkvEM7+uovHpiODOUQ+XLGPn6nCQV9Ss1E6zKzqxk0O
 mHCJ61yCkxzMUZBbdhEgOADpLXxlJThQ/YIAcRejwAvkxg0Ioq88yim+9K7esSV10d6r
 mPXQ==
X-Gm-Message-State: AOAM531StRCv2riUehpjTJDywVR1kl0OcKZkUHhWFL6wDhhbgjlCDHfW
 6jqWNkpgG+IUZXYaP+NRP2Y=
X-Google-Smtp-Source: ABdhPJyjkn239MKSsoKrTszQzJOQ5/f1QM0f90Kyd091Y7NECgT4Ox8j1n0DgU6moLad5vjUKc3c6A==
X-Received: by 2002:adf:c006:: with SMTP id z6mr10052337wre.157.1629286034546; 
 Wed, 18 Aug 2021 04:27:14 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id p5sm6158688wrd.25.2021.08.18.04.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 04:27:13 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: optimize the pool shrinker a bit v3
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Huang Rui <ray.huang@amd.com>
References: <20210722113453.2314-1-christian.koenig@amd.com>
Message-ID: <ae7405c6-2d91-e7e4-0a0a-7de6f4b330a0@gmail.com>
Date: Wed, 18 Aug 2021 13:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722113453.2314-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Just a gentle ping?

Does anybody have any objections? It's just switching back to using a 
spinlock in the hot path instead of a mutex.

Thanks,
Christian.

Am 22.07.21 um 13:34 schrieb Christian König:
> Switch back to using a spinlock again by moving the IOMMU unmap outside
> of the locked region.
>
> v2: Add a comment explaining why we need sync_shrinkers().
> v3: Drop sync_shrinkers() and use an SRCU instead.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 45 ++++++++++++++++++++--------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index cb38b1a17b09..cee664c487b5 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -70,7 +70,8 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
>   static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>   static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>   
> -static struct mutex shrinker_lock;
> +static spinlock_t shrinker_lock;
> +DEFINE_STATIC_SRCU(shrinker_srcu);
>   static struct list_head shrinker_list;
>   static struct shrinker mm_shrinker;
>   
> @@ -263,9 +264,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>   	spin_lock_init(&pt->lock);
>   	INIT_LIST_HEAD(&pt->pages);
>   
> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>   	list_add_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>   }
>   
>   /* Remove a pool_type from the global shrinker list and free all pages */
> @@ -273,9 +274,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>   {
>   	struct page *p;
>   
> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>   	list_del(&pt->shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>   
>   	while ((p = ttm_pool_type_take(pt)))
>   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> @@ -313,24 +314,27 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>   static unsigned int ttm_pool_shrink(void)
>   {
>   	struct ttm_pool_type *pt;
> -	unsigned int num_freed;
> +	unsigned int num_pages;
>   	struct page *p;
> +	int idx;
>   
> -	mutex_lock(&shrinker_lock);
> +	idx = srcu_read_lock(&shrinker_srcu);
> +
> +	spin_lock(&shrinker_lock);
>   	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> +	spin_unlock(&shrinker_lock);
>   
>   	p = ttm_pool_type_take(pt);
>   	if (p) {
>   		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> -		num_freed = 1 << pt->order;
> +		num_pages = 1 << pt->order;
>   	} else {
> -		num_freed = 0;
> +		num_pages = 0;
>   	}
>   
> -	list_move_tail(&pt->shrinker_list, &shrinker_list);
> -	mutex_unlock(&shrinker_lock);
> -
> -	return num_freed;
> +	srcu_read_unlock(&shrinker_srcu, idx);
> +	return num_pages;
>   }
>   
>   /* Return the allocation order based for a page */
> @@ -530,6 +534,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
>   			for (j = 0; j < MAX_ORDER; ++j)
>   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
>   	}
> +
> +	/* We removed the pool types from the LRU, but we need to also make sure
> +	 * that no shrinker is concurrently freeing pages from the pool.
> +	 */
> +	synchronize_srcu(&shrinker_srcu);
>   }
>   
>   /* As long as pages are available make sure to release at least one */
> @@ -604,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
>   {
>   	ttm_pool_debugfs_header(m);
>   
> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>   	seq_puts(m, "wc\t:");
>   	ttm_pool_debugfs_orders(global_write_combined, m);
>   	seq_puts(m, "uc\t:");
> @@ -613,7 +622,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
>   	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
>   	seq_puts(m, "uc 32\t:");
>   	ttm_pool_debugfs_orders(global_dma32_uncached, m);
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>   
>   	ttm_pool_debugfs_footer(m);
>   
> @@ -640,7 +649,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>   
>   	ttm_pool_debugfs_header(m);
>   
> -	mutex_lock(&shrinker_lock);
> +	spin_lock(&shrinker_lock);
>   	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>   		seq_puts(m, "DMA ");
>   		switch (i) {
> @@ -656,7 +665,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>   		}
>   		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
>   	}
> -	mutex_unlock(&shrinker_lock);
> +	spin_unlock(&shrinker_lock);
>   
>   	ttm_pool_debugfs_footer(m);
>   	return 0;
> @@ -693,7 +702,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>   	if (!page_pool_size)
>   		page_pool_size = num_pages;
>   
> -	mutex_init(&shrinker_lock);
> +	spin_lock_init(&shrinker_lock);
>   	INIT_LIST_HEAD(&shrinker_list);
>   
>   	for (i = 0; i < MAX_ORDER; ++i) {

