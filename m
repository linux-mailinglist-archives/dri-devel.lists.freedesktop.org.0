Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C8762DAF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E965610E44C;
	Wed, 26 Jul 2023 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-38.mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E7710E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:10:50 +0000 (UTC)
Message-ID: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1690355449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jvc7jyiFGsEgqDLQ8SvDwKCvjECMcl21zak/YPsttTU=;
 b=MJNzwcgKcI8WMs1vcHIk9odpFzXJXYJZkCEqMlLlvbf0FvKHK96bLJs5XTXQyUPcTsHXLS
 nIqAIZhilsKlD4q7ONNAKGG+YEnzT1SMJk3OhEOossreA6CsEZNAbhHhb/1A0W8D/Gm3Q3
 yKiIjz335Q++bI56PmpRINRM4YbGaI0=
Date: Wed, 26 Jul 2023 15:10:21 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-20-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 26 Jul 2023 07:30:32 +0000
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/24 17:43, Qi Zheng wrote:
> Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
> shrinkers.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
>   1 file changed, 45 insertions(+), 24 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8c94b34024a2..4db5a1834d81 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags __read_mostly =
>   	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
>   	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
>   
> -static struct shrinker deferred_split_shrinker;
> +static struct shrinker *deferred_split_shrinker;
> +static unsigned long deferred_split_count(struct shrinker *shrink,
> +					  struct shrink_control *sc);
> +static unsigned long deferred_split_scan(struct shrinker *shrink,
> +					 struct shrink_control *sc);
>   
>   static atomic_t huge_zero_refcount;
>   struct page *huge_zero_page __read_mostly;
> @@ -229,11 +233,7 @@ static unsigned long shrink_huge_zero_page_scan(struct shrinker *shrink,
>   	return 0;
>   }
>   
> -static struct shrinker huge_zero_page_shrinker = {
> -	.count_objects = shrink_huge_zero_page_count,
> -	.scan_objects = shrink_huge_zero_page_scan,
> -	.seeks = DEFAULT_SEEKS,
> -};
> +static struct shrinker *huge_zero_page_shrinker;

Same as patch #17.

>   
>   #ifdef CONFIG_SYSFS
>   static ssize_t enabled_show(struct kobject *kobj,
> @@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct kobject *hugepage_kobj)
>   }
>   #endif /* CONFIG_SYSFS */
>   
> +static int thp_shrinker_init(void)

Better to declare it as __init.

> +{
> +	huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
> +	if (!huge_zero_page_shrinker)
> +		return -ENOMEM;
> +
> +	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
> +						 SHRINKER_MEMCG_AWARE |
> +						 SHRINKER_NONSLAB,
> +						 "thp-deferred_split");
> +	if (!deferred_split_shrinker) {
> +		shrinker_free_non_registered(huge_zero_page_shrinker);
> +		return -ENOMEM;
> +	}
> +
> +	huge_zero_page_shrinker->count_objects = shrink_huge_zero_page_count;
> +	huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
> +	huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
> +	shrinker_register(huge_zero_page_shrinker);
> +
> +	deferred_split_shrinker->count_objects = deferred_split_count;
> +	deferred_split_shrinker->scan_objects = deferred_split_scan;
> +	deferred_split_shrinker->seeks = DEFAULT_SEEKS;
> +	shrinker_register(deferred_split_shrinker);
> +
> +	return 0;
> +}
> +
> +static void thp_shrinker_exit(void)

Same as here.

> +{
> +	shrinker_unregister(huge_zero_page_shrinker);
> +	shrinker_unregister(deferred_split_shrinker);
> +}
> +
>   static int __init hugepage_init(void)
>   {
>   	int err;
> @@ -482,12 +516,9 @@ static int __init hugepage_init(void)
>   	if (err)
>   		goto err_slab;
>   
> -	err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
> -	if (err)
> -		goto err_hzp_shrinker;
> -	err = register_shrinker(&deferred_split_shrinker, "thp-deferred_split");
> +	err = thp_shrinker_init();
>   	if (err)
> -		goto err_split_shrinker;
> +		goto err_shrinker;
>   
>   	/*
>   	 * By default disable transparent hugepages on smaller systems,
> @@ -505,10 +536,8 @@ static int __init hugepage_init(void)
>   
>   	return 0;
>   err_khugepaged:
> -	unregister_shrinker(&deferred_split_shrinker);
> -err_split_shrinker:
> -	unregister_shrinker(&huge_zero_page_shrinker);
> -err_hzp_shrinker:
> +	thp_shrinker_exit();
> +err_shrinker:
>   	khugepaged_destroy();
>   err_slab:
>   	hugepage_exit_sysfs(hugepage_kobj);
> @@ -2851,7 +2880,7 @@ void deferred_split_folio(struct folio *folio)
>   #ifdef CONFIG_MEMCG
>   		if (memcg)
>   			set_shrinker_bit(memcg, folio_nid(folio),
> -					 deferred_split_shrinker.id);
> +					 deferred_split_shrinker->id);
>   #endif
>   	}
>   	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
> @@ -2925,14 +2954,6 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
>   	return split;
>   }
>   
> -static struct shrinker deferred_split_shrinker = {
> -	.count_objects = deferred_split_count,
> -	.scan_objects = deferred_split_scan,
> -	.seeks = DEFAULT_SEEKS,
> -	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
> -		 SHRINKER_NONSLAB,
> -};
> -
>   #ifdef CONFIG_DEBUG_FS
>   static void split_huge_pages_all(void)
>   {

