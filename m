Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F7764EEB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D38110E1D9;
	Thu, 27 Jul 2023 09:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F2310E1D9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:13:22 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6862d4a1376so201873b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690449201; x=1691054001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
 b=DcofMrRnwJynNkdGxtjH9DqKXau2yqZGatjPtAtzn+O56nMmwXuVd7ToeAQUojKhyr
 PVIHt52Ove4HfRkW5Jz6nWPZD9BmVLc7SbBBPIeMe8wFyfKaQIk+EbU0k3nRPfOKNwBh
 oCNv2ZD1HFVJTkxvMKWyxXL9Onk9dGrGolbp1H25aJz81J4GYNUwPghcXVGUuE5zAHUa
 mP22aBPwBQ4pP/D5mY0ghxG8TnuQLNORwYORdeX0ZvQJ20+Z3LaIninEXnknTqruUQCo
 Za3jxS8cFIItCGBaY6f3hGkZx+gttPFDrR9vIxhOGVxid7Al6RP9znkmq9WOz9AcYgeV
 IdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690449201; x=1691054001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ab3i02uMNDVjAVrJgavtDQnv7B+TbSMr9u4LPtdCXIk=;
 b=I73CH2t9rQeETWqaTdxxpiCvVfLhSkmqMwpGwbSHDfzpeYLMtNAF+MMes4oD7adNE+
 BT04o4DIMCNOxd7iAyZRFztShImXENa5nsF0Rn0Ofo1dGZq/KYoBTPERGaBqcBnjhQGz
 ARRO2zJg2cGkBWmVwOxOidRHmvSERNUbc0DlsLGwXUhmWyKL5fGC2YlriK2BJmZ+Ncqc
 xxCy1KOZ2i3kQ170e9kY9moDDUaarBwDWA6V7y5NECEvnUzOlIQzHpoSViJxIkh8X02g
 Iff/oh6wSzNlZo36QWjTliET03v14GdyNWp74Kv70gP6SxnVMQSFQg8FFTZNGzO2SNvz
 TVhg==
X-Gm-Message-State: ABy/qLZFa4XzhuEZWal9IE+4lqVUAcrWn102JITvMDbYvQFXZmJH2JMr
 hEAwdQSXMz5bQ4Ppn1qF8d+l4g==
X-Google-Smtp-Source: APBJJlGBn5Xl2QFHzxgRMihSAaLd28csKz8Em946xGdOgBfe3ljiGqu5+YaMyvDFvdIkqmZPd3zpbQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id
 dh18-20020a056a00479200b00668834d04bdmr4787709pfb.0.1690449201600; 
 Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a056a00165a00b006687b41c4dasm1017146pfc.110.2023.07.27.02.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:13:21 -0700 (PDT)
Message-ID: <961f6055-a395-8490-4c22-765a30668460@bytedance.com>
Date: Thu, 27 Jul 2023 17:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 27/49] dm: dynamically allocate the dm-bufio shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-28-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-28-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/27 16:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the dm-bufio shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct dm_bufio_client.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   drivers/md/dm-bufio.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
> index bc309e41d074..5a9124b83d53 100644
> --- a/drivers/md/dm-bufio.c
> +++ b/drivers/md/dm-bufio.c
> @@ -963,7 +963,7 @@ struct dm_bufio_client {
>   
>   	sector_t start;
>   
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   	struct work_struct shrink_work;
>   	atomic_long_t need_shrink;
>   
> @@ -2368,7 +2368,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   {
>   	struct dm_bufio_client *c;
>   
> -	c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	c = shrink->private_data;
>   	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
>   	queue_work(dm_bufio_wq, &c->shrink_work);
>   
> @@ -2377,7 +2377,7 @@ static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink
>   
>   static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
>   {
> -	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
> +	struct dm_bufio_client *c = shrink->private_data;
>   	unsigned long count = cache_total(&c->cache);
>   	unsigned long retain_target = get_retain_buffers(c);
>   	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
> @@ -2490,15 +2490,19 @@ struct dm_bufio_client *dm_bufio_client_create(struct block_device *bdev, unsign
>   	INIT_WORK(&c->shrink_work, shrink_work);
>   	atomic_long_set(&c->need_shrink, 0);
>   
> -	c->shrinker.count_objects = dm_bufio_shrink_count;
> -	c->shrinker.scan_objects = dm_bufio_shrink_scan;
> -	c->shrinker.seeks = 1;
> -	c->shrinker.batch = 0;
> -	r = register_shrinker(&c->shrinker, "dm-bufio:(%u:%u)",
> -			      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> -	if (r)
> +	c->shrinker = shrinker_alloc(0, "dm-bufio:(%u:%u)",
> +				     MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> +	if (!c->shrinker)

Here should set r to -ENOMEM, will fix.

>   		goto bad;
>   
> +	c->shrinker->count_objects = dm_bufio_shrink_count;
> +	c->shrinker->scan_objects = dm_bufio_shrink_scan;
> +	c->shrinker->seeks = 1;
> +	c->shrinker->batch = 0;
> +	c->shrinker->private_data = c;
> +
> +	shrinker_register(c->shrinker);
> +
>   	mutex_lock(&dm_bufio_clients_lock);
>   	dm_bufio_client_count++;
>   	list_add(&c->client_list, &dm_bufio_all_clients);
> @@ -2537,7 +2541,7 @@ void dm_bufio_client_destroy(struct dm_bufio_client *c)
>   
>   	drop_buffers(c);
>   
> -	unregister_shrinker(&c->shrinker);
> +	shrinker_free(c->shrinker);
>   	flush_work(&c->shrink_work);
>   
>   	mutex_lock(&dm_bufio_clients_lock);
